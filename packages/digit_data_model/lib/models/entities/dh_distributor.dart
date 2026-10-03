import 'package:dart_mappable/dart_mappable.dart';
import 'package:digit_data_model/data_model.dart';

part 'dh_distributor.mapper.dart';

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class DHDistributorSearchModel extends EntitySearchModel
    with DHDistributorSearchModelMappable {
  final String? id;
  final String? uuid;
  final String? userName;
  final String? name;
  final String? dhCode;
  final String? dhName;

  DHDistributorSearchModel({
    this.id,
    this.uuid,
    this.userName,
    this.name,
    this.dhCode,
    this.dhName,
    super.boundaryCode,
    super.isDeleted,
  }) : super();

  @MappableConstructor()
  DHDistributorSearchModel.ignoreDeleted({
    this.id,
    this.uuid,
    this.userName,
    this.name,
    this.dhCode,
    this.dhName,
    super.boundaryCode,
  }) : super(isDeleted: false);
}

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class DHDistributorModel extends EntityModel with DHDistributorModelMappable {
  static const schemaName = 'DHDistributor';

  final String id;
  final String uuid;
  final String userName;
  final String name;
  final String dhCode;
  final String dhName;
  final bool? nonRecoverableError;
  final String? tenantId;
  final int? rowVersion;
  final DHDistributorAdditionalFields? additionalFields;

  DHDistributorModel({
    required this.id,
    required this.uuid,
    required this.userName,
    required this.name,
    required this.dhCode,
    required this.dhName,
    this.nonRecoverableError = false,
    this.tenantId,
    this.rowVersion,
    this.additionalFields,
    super.auditDetails,
    super.clientAuditDetails,
    super.isDeleted = false,
  }) : super();
}

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class DHDistributorAdditionalFields extends AdditionalFields
    with DHDistributorAdditionalFieldsMappable {
  DHDistributorAdditionalFields({
    super.schema = 'DHDistributor',
    required super.version,
    super.fields,
  });
}
