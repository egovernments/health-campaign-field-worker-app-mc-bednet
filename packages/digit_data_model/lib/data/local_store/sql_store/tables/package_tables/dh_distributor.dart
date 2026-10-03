import 'package:drift/drift.dart';

class DHDistributor extends Table {
  TextColumn get id => text()();
  TextColumn get uuid => text()();
  TextColumn get userName => text()();
  TextColumn get name => text()();
  TextColumn get dhCode => text()();
  TextColumn get dhName => text()();

  TextColumn get auditCreatedBy => text().nullable()();
  BoolColumn get nonRecoverableError =>
      boolean().nullable().withDefault(const Constant(false))();
  IntColumn get auditCreatedTime => integer().nullable()();
  IntColumn get clientCreatedTime => integer().nullable()();
  TextColumn get clientModifiedBy => text().nullable()();
  TextColumn get clientCreatedBy => text().nullable()();
  IntColumn get clientModifiedTime => integer().nullable()();
  TextColumn get auditModifiedBy => text().nullable()();
  IntColumn get auditModifiedTime => integer().nullable()();
  TextColumn get tenantId => text().nullable()();
  BoolColumn get isDeleted =>
      boolean().nullable().withDefault(const Constant(false))();
  IntColumn get rowVersion => integer().nullable()();
  TextColumn get additionalFields => text().nullable()();

  @override
  Set<Column> get primaryKey => {uuid};
}
