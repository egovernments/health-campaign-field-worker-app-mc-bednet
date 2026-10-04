import 'dart:async';
import 'dart:convert';

import 'package:digit_data_model/data_model.dart';
import 'package:drift/drift.dart';

class DHDistributorLocalRepository
    extends LocalRepository<DHDistributorModel, DHDistributorSearchModel> {
  DHDistributorLocalRepository(super.sql, super.opLogManager);

  static const String _tableName = 'dh_distributor';

  @override
  FutureOr<void> create(
    DHDistributorModel entity, {
    bool createOpLog = false,
    DataOperation dataOperation = DataOperation.create,
  }) async {
    return retryLocalCallOperation(() async {
      await sql.customStatement(
        'INSERT OR REPLACE INTO $_tableName '
        '(id, uuid, user_name, name, dh_code, dh_name, '
        'audit_created_by, non_recoverable_error, audit_created_time, '
        'client_created_time, client_modified_by, client_created_by, '
        'client_modified_time, audit_modified_by, audit_modified_time, '
        'tenant_id, is_deleted, row_version, additional_fields) '
        'VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)',
        [
          entity.id,
          entity.uuid,
          entity.userName,
          entity.name,
          entity.dhCode,
          entity.dhName,
          entity.auditDetails?.createdBy,
          entity.nonRecoverableError,
          entity.auditDetails?.createdTime,
          entity.clientAuditDetails?.createdTime,
          entity.clientAuditDetails?.lastModifiedBy,
          entity.clientAuditDetails?.createdBy,
          entity.clientAuditDetails?.lastModifiedTime,
          entity.auditDetails?.lastModifiedBy,
          entity.auditDetails?.lastModifiedTime,
          entity.tenantId,
          entity.isDeleted,
          entity.rowVersion,
          entity.additionalFields?.toJson(),
        ],
      );

      await super.create(
        entity,
        createOpLog: createOpLog,
      );
    });
  }

  @override
  FutureOr<List<DHDistributorModel>> search(
    DHDistributorSearchModel query, [
    String? userId,
  ]) async {
    return retryLocalCallOperation(() async {
      final filters = <String>[];
      final variables = <Variable>[];

      if (query.id != null) {
        filters.add('id = ?');
        variables.add(Variable<String>(query.id!));
      }
      if (query.uuid != null) {
        filters.add('uuid = ?');
        variables.add(Variable<String>(query.uuid!));
      }
      if (query.userName != null) {
        filters.add('user_name = ?');
        variables.add(Variable<String>(query.userName!));
      }
      if (query.name != null) {
        filters.add('name = ?');
        variables.add(Variable<String>(query.name!));
      }
      if (query.dhCode != null) {
        filters.add('dh_code = ?');
        variables.add(Variable<String>(query.dhCode!));
      }
      if (query.dhName != null) {
        filters.add('dh_name = ?');
        variables.add(Variable<String>(query.dhName!));
      }

      final whereClause =
          filters.isEmpty ? '' : ' WHERE ${filters.join(' AND ')}';
      final rows = await sql
          .customSelect(
            'SELECT * FROM $_tableName$whereClause',
            variables: variables,
          )
          .get();

      return rows
          .map((row) => _mapRowToDistributor(row.data))
          .whereType<DHDistributorModel>()
          .toList();
    });
  }

  Future<void> replaceByDhCode({
    required String dhCode,
    required List<DHDistributorModel> distributors,
  }) async {
    return retryLocalCallOperation(() async {
      await sql.transaction(() async {
        await sql.customStatement(
          'DELETE FROM $_tableName WHERE dh_code = ?',
          [dhCode],
        );

        if (distributors.isNotEmpty) {
          for (final distributor in distributors) {
            await create(distributor, createOpLog: false);
          }
        }
      });
    });
  }

  Future<void> clearAll() async {
    return retryLocalCallOperation(() async {
      await sql.customStatement('DELETE FROM $_tableName');
    });
  }

  DHDistributorModel? _mapRowToDistributor(Map<String, dynamic> map) {
    final id = _asNullableString(map['id']);
    final uuid = _asNullableString(map['uuid']);
    final userName = _asNullableString(map['user_name']);
    final name = _asNullableString(map['name']);
    final dhCode = _asNullableString(map['dh_code']);
    final dhName = _asNullableString(map['dh_name']);

    // Skip malformed rows instead of throwing on required field casts.
    if (id == null ||
        uuid == null ||
        userName == null ||
        name == null ||
        dhCode == null ||
        dhName == null) {
      return null;
    }

    final createdBy = _asNullableString(map['audit_created_by']);
    final createdTime = _asNullableInt(map['audit_created_time']);
    final clientCreatedBy = _asNullableString(map['client_created_by']);
    final clientCreatedTime = _asNullableInt(map['client_created_time']);

    return DHDistributorModel(
      id: id,
      uuid: uuid,
      userName: userName,
      name: name,
      dhCode: dhCode,
      dhName: dhName,
      tenantId: _asNullableString(map['tenant_id']),
      isDeleted: _asNullableBool(map['is_deleted']),
      rowVersion: _asNullableInt(map['row_version']),
      nonRecoverableError: _asNullableBool(map['non_recoverable_error']),
      additionalFields: _parseAdditionalFields(map['additional_fields']),
      auditDetails: createdTime == null || createdBy == null
          ? null
          : AuditDetails(
              createdTime: createdTime,
              createdBy: createdBy,
              lastModifiedBy: _asNullableString(map['audit_modified_by']),
              lastModifiedTime: _asNullableInt(map['audit_modified_time']),
            ),
      clientAuditDetails: clientCreatedBy == null || clientCreatedTime == null
          ? null
          : ClientAuditDetails(
              createdBy: clientCreatedBy,
              createdTime: clientCreatedTime,
              lastModifiedBy: _asNullableString(map['client_modified_by']),
              lastModifiedTime: _asNullableInt(map['client_modified_time']),
            ),
    );
  }

  DHDistributorAdditionalFields? _parseAdditionalFields(dynamic value) {
    if (value == null) return null;

    if (value is Map<String, dynamic>) {
      return DHDistributorAdditionalFieldsMapper.fromMap(value);
    }

    final jsonStr = value.toString().trim();
    if (jsonStr.isEmpty) return null;

    try {
      final map = jsonDecode(jsonStr);
      if (map is Map<String, dynamic>) {
        return DHDistributorAdditionalFieldsMapper.fromMap(map);
      }
    } catch (_) {}
    return null;
  }

  String? _asNullableString(dynamic value) {
    if (value == null) return null;
    final text = value.toString().trim();
    return text.isEmpty ? null : text;
  }

  int? _asNullableInt(dynamic value) {
    if (value == null) return null;
    if (value is int) return value;
    if (value is num) return value.toInt();
    if (value is String) return int.tryParse(value.trim());
    return null;
  }

  bool? _asNullableBool(dynamic value) {
    if (value == null) return null;

    if (value is bool) return value;
    if (value is int) return value != 0;
    if (value is String) {
      final normalized = value.trim().toLowerCase();
      if (normalized == 'true' || normalized == '1') return true;
      if (normalized == 'false' || normalized == '0') return false;
    }
    return null;
  }

  @override
  DataModelType get type => DataModelType.dhDistributor;
}
