import 'package:digit_data_model/data_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../local_store/secure_store/secure_store.dart';
import '../remote_client.dart';
import '../../utils/environment_config.dart';

class DHDistributorSyncService {
  static const int _pageSize = 500;
  static const String _searchPath =
      'project-factory/v1/data/distributor-by-dh/_search';

  Future<void> syncDistributorsForDhUser({
    required DHDistributorLocalRepository repository,
    required String selectedDhCode,
  }) async {
    int offset = 0;
    int? totalCount;
    final allRows = <DHDistributorModel>[];

    while (true) {
      final page = await _fetchDistributorsPage(
        selectedDhCode: selectedDhCode,
        offset: offset,
        limit: _pageSize,
      );
      totalCount ??= page.totalCount;

      final pageRows = <DHDistributorModel>[];
      for (final dh in page.dhDistributors) {
        for (final distributor in dh.distributors) {
          pageRows.add(
            DHDistributorModel(
              id: distributor.uuid,
              uuid: distributor.uuid,
              userName: distributor.userName,
              name: distributor.name,
              dhCode: dh.dhCode,
              dhName: dh.dhName,
            ),
          );
        }
      }

      allRows.addAll(pageRows);

      if (page.dhDistributors.isEmpty) {
        break;
      }

      offset += _pageSize;
      if (offset >= totalCount) {
        break;
      }
    }

    // Keep only latest row per UUID in case API returns duplicates.
    final byUuid = <String, DHDistributorModel>{};
    for (final row in allRows) {
      byUuid[row.uuid] = row;
    }

    await repository.clearAll();

    if (byUuid.isNotEmpty) {
      final byDhCode = <String, List<DHDistributorModel>>{};
      for (final row in byUuid.values) {
        byDhCode.putIfAbsent(row.dhCode, () => []).add(row);
      }

      for (final entry in byDhCode.entries) {
        await repository.replaceByDhCode(
          dhCode: entry.key,
          distributors: entry.value,
        );
      }
    }

    if (kDebugMode) {
      debugPrint(
        '[DHDistributorSync] synced=${byUuid.length} totalCount=$totalCount pageSize=$_pageSize',
      );
    }
  }

  Future<_DHDistributorPageResponse> _fetchDistributorsPage({
    required String selectedDhCode,
    required int offset,
    required int limit,
  }) async {
    final selectedProject = await LocalSecureStore.instance.selectedProject;
    final campaignName = selectedProject?.referenceID;

    if (campaignName == null || campaignName.isEmpty) {
      if (kDebugMode) {
        debugPrint(
          '[DHDistributorSync] campaignName missing from selected project; skipping fetch',
        );
      }

      return _DHDistributorPageResponse(
        dhDistributors: const [],
        totalCount: 0,
        offset: offset,
        limit: limit,
      );
    }

    final payload = {
      'SearchCriteria': {
        'tenantId': envConfig.variables.tenantId,
        'campaignName': "Testoctober1st",
      },
      'Pagination': {
        'limit': limit,
        'offset': offset,
      },
    };

    final response = await DioClient().dio.post(
          _searchPath,
          options: Options(
            headers: const {'Content-Type': 'application/json'},
            extra: const {'requestMsgId': 'distributor-by-dh-search-001'},
          ),
          data: payload,
        );

    final responseData = response.data;
    if (responseData is! Map<String, dynamic>) {
      throw Exception('Invalid distributor-by-dh response format');
    }

    final rawDhDistributors = responseData['DHDistributors'];
    final rawTotalCount = responseData['TotalCount'];
    final rawPagination = responseData['Pagination'];

    final parsedDhDistributors = <_DHDistributorsBlock>[];

    if (rawDhDistributors is List) {
      for (final block in rawDhDistributors) {
        if (block is! Map<String, dynamic>) continue;

        final dhCode = (block['dhCode'] ?? '').toString();
        if (dhCode.isEmpty) continue;
        if (dhCode != selectedDhCode) continue;

        final dhName = (block['dhName'] ?? dhCode).toString();
        final distributorList = block['distributors'];

        final distributors = <_DistributorRecord>[];
        if (distributorList is List) {
          for (final distributor in distributorList) {
            if (distributor is! Map<String, dynamic>) continue;

            final userName = (distributor['userName'] ?? '').toString();
            final name = (distributor['name'] ?? '').toString();
            final uuid = (distributor['uuid'] ?? '').toString();

            // Backend may return empty uuid; fall back to username so local
            // model constraints stay valid and dedupe remains stable.
            final stableId = uuid.isNotEmpty ? uuid : userName;
            if (stableId.isEmpty || userName.isEmpty) continue;

            distributors.add(
              _DistributorRecord(
                uuid: stableId,
                userName: userName,
                name: name.isNotEmpty ? name : userName,
              ),
            );
          }
        }

        parsedDhDistributors.add(
          _DHDistributorsBlock(
            dhCode: dhCode,
            dhName: dhName,
            distributors: distributors,
          ),
        );
      }
    }

    final parsedTotalCount = rawTotalCount is num
        ? rawTotalCount.toInt()
        : parsedDhDistributors.length;

    int resolvedOffset = offset;
    int resolvedLimit = limit;

    if (rawPagination is Map<String, dynamic>) {
      final paginationOffset = rawPagination['offset'];
      final paginationLimit = rawPagination['limit'];

      if (paginationOffset is num) {
        resolvedOffset = paginationOffset.toInt();
      }
      if (paginationLimit is num) {
        resolvedLimit = paginationLimit.toInt();
      }
    }

    return _DHDistributorPageResponse(
      dhDistributors: parsedDhDistributors,
      totalCount: parsedTotalCount,
      offset: resolvedOffset,
      limit: resolvedLimit,
    );
  }
}

class _DHDistributorPageResponse {
  final List<_DHDistributorsBlock> dhDistributors;
  final int totalCount;
  final int offset;
  final int limit;

  const _DHDistributorPageResponse({
    required this.dhDistributors,
    required this.totalCount,
    required this.offset,
    required this.limit,
  });
}

class _DHDistributorsBlock {
  final String dhCode;
  final String dhName;
  final List<_DistributorRecord> distributors;

  const _DHDistributorsBlock({
    required this.dhCode,
    required this.dhName,
    required this.distributors,
  });
}

class _DistributorRecord {
  final String uuid;
  final String userName;
  final String name;

  const _DistributorRecord({
    required this.uuid,
    required this.userName,
    required this.name,
  });
}
