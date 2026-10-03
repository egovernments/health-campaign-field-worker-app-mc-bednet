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

      return rows.map((row) {
        final map = row.data;
        final createdBy = map['audit_created_by'] as String?;
        final createdTime = map['audit_created_time'] as int?;

        return DHDistributorModel(
          id: map['id'] as String,
          uuid: map['uuid'] as String,
          userName: map['user_name'] as String,
          name: map['name'] as String,
          dhCode: map['dh_code'] as String,
          dhName: map['dh_name'] as String,
          tenantId: map['tenant_id'] as String?,
          isDeleted: map['is_deleted'] as bool?,
          rowVersion: map['row_version'] as int?,
          nonRecoverableError: map['non_recoverable_error'] as bool?,
          additionalFields:
              _parseAdditionalFields(map['additional_fields'] as String?),
          auditDetails: createdTime == null || createdBy == null
              ? null
              : AuditDetails(
                  createdTime: createdTime,
                  createdBy: createdBy,
                  lastModifiedBy: map['audit_modified_by'] as String?,
                  lastModifiedTime: map['audit_modified_time'] as int?,
                ),
          clientAuditDetails: map['client_created_by'] == null ||
                  map['client_created_time'] == null
              ? null
              : ClientAuditDetails(
                  createdBy: map['client_created_by'] as String,
                  createdTime: map['client_created_time'] as int,
                  lastModifiedBy: map['client_modified_by'] as String?,
                  lastModifiedTime: map['client_modified_time'] as int?,
                ),
        );
      }).toList();
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

  DHDistributorAdditionalFields? _parseAdditionalFields(String? jsonStr) {
    if (jsonStr == null || jsonStr.isEmpty) return null;
    try {
      final map = jsonDecode(jsonStr);
      if (map is Map<String, dynamic>) {
        return DHDistributorAdditionalFieldsMapper.fromMap(map);
      }
    } catch (_) {}
    return null;
  }

  @override
  DataModelType get type => DataModelType.dhDistributor;
}
