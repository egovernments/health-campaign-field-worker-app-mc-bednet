// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'dh_distributor.dart';

class DHDistributorSearchModelMapper
    extends SubClassMapperBase<DHDistributorSearchModel> {
  DHDistributorSearchModelMapper._();

  static DHDistributorSearchModelMapper? _instance;
  static DHDistributorSearchModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = DHDistributorSearchModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'DHDistributorSearchModel';

  static String? _$id(DHDistributorSearchModel v) => v.id;
  static const Field<DHDistributorSearchModel, String> _f$id =
      Field('id', _$id, opt: true);
  static String? _$uuid(DHDistributorSearchModel v) => v.uuid;
  static const Field<DHDistributorSearchModel, String> _f$uuid =
      Field('uuid', _$uuid, opt: true);
  static String? _$userName(DHDistributorSearchModel v) => v.userName;
  static const Field<DHDistributorSearchModel, String> _f$userName =
      Field('userName', _$userName, opt: true);
  static String? _$name(DHDistributorSearchModel v) => v.name;
  static const Field<DHDistributorSearchModel, String> _f$name =
      Field('name', _$name, opt: true);
  static String? _$dhCode(DHDistributorSearchModel v) => v.dhCode;
  static const Field<DHDistributorSearchModel, String> _f$dhCode =
      Field('dhCode', _$dhCode, opt: true);
  static String? _$dhName(DHDistributorSearchModel v) => v.dhName;
  static const Field<DHDistributorSearchModel, String> _f$dhName =
      Field('dhName', _$dhName, opt: true);
  static String? _$boundaryCode(DHDistributorSearchModel v) => v.boundaryCode;
  static const Field<DHDistributorSearchModel, String> _f$boundaryCode =
      Field('boundaryCode', _$boundaryCode, opt: true);
  static AuditDetails? _$auditDetails(DHDistributorSearchModel v) =>
      v.auditDetails;
  static const Field<DHDistributorSearchModel, AuditDetails> _f$auditDetails =
      Field('auditDetails', _$auditDetails, mode: FieldMode.member);
  static AdditionalFields? _$additionalFields(DHDistributorSearchModel v) =>
      v.additionalFields;
  static const Field<DHDistributorSearchModel, AdditionalFields>
      _f$additionalFields =
      Field('additionalFields', _$additionalFields, mode: FieldMode.member);

  @override
  final MappableFields<DHDistributorSearchModel> fields = const {
    #id: _f$id,
    #uuid: _f$uuid,
    #userName: _f$userName,
    #name: _f$name,
    #dhCode: _f$dhCode,
    #dhName: _f$dhName,
    #boundaryCode: _f$boundaryCode,
    #auditDetails: _f$auditDetails,
    #additionalFields: _f$additionalFields,
  };
  @override
  final bool ignoreNull = true;

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = MappableClass.useAsDefault;
  @override
  late final ClassMapperBase superMapper =
      EntitySearchModelMapper.ensureInitialized();

  static DHDistributorSearchModel _instantiate(DecodingData data) {
    return DHDistributorSearchModel.ignoreDeleted(
        id: data.dec(_f$id),
        uuid: data.dec(_f$uuid),
        userName: data.dec(_f$userName),
        name: data.dec(_f$name),
        dhCode: data.dec(_f$dhCode),
        dhName: data.dec(_f$dhName),
        boundaryCode: data.dec(_f$boundaryCode));
  }

  @override
  final Function instantiate = _instantiate;

  static DHDistributorSearchModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<DHDistributorSearchModel>(map);
  }

  static DHDistributorSearchModel fromJson(String json) {
    return ensureInitialized().decodeJson<DHDistributorSearchModel>(json);
  }
}

mixin DHDistributorSearchModelMappable {
  String toJson() {
    return DHDistributorSearchModelMapper.ensureInitialized()
        .encodeJson<DHDistributorSearchModel>(this as DHDistributorSearchModel);
  }

  Map<String, dynamic> toMap() {
    return DHDistributorSearchModelMapper.ensureInitialized()
        .encodeMap<DHDistributorSearchModel>(this as DHDistributorSearchModel);
  }

  DHDistributorSearchModelCopyWith<DHDistributorSearchModel,
          DHDistributorSearchModel, DHDistributorSearchModel>
      get copyWith => _DHDistributorSearchModelCopyWithImpl(
          this as DHDistributorSearchModel, $identity, $identity);
  @override
  String toString() {
    return DHDistributorSearchModelMapper.ensureInitialized()
        .stringifyValue(this as DHDistributorSearchModel);
  }

  @override
  bool operator ==(Object other) {
    return DHDistributorSearchModelMapper.ensureInitialized()
        .equalsValue(this as DHDistributorSearchModel, other);
  }

  @override
  int get hashCode {
    return DHDistributorSearchModelMapper.ensureInitialized()
        .hashValue(this as DHDistributorSearchModel);
  }
}

extension DHDistributorSearchModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, DHDistributorSearchModel, $Out> {
  DHDistributorSearchModelCopyWith<$R, DHDistributorSearchModel, $Out>
      get $asDHDistributorSearchModel => $base
          .as((v, t, t2) => _DHDistributorSearchModelCopyWithImpl(v, t, t2));
}

abstract class DHDistributorSearchModelCopyWith<
    $R,
    $In extends DHDistributorSearchModel,
    $Out> implements EntitySearchModelCopyWith<$R, $In, $Out> {
  @override
  $R call(
      {String? id,
      String? uuid,
      String? userName,
      String? name,
      String? dhCode,
      String? dhName,
      String? boundaryCode});
  DHDistributorSearchModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _DHDistributorSearchModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, DHDistributorSearchModel, $Out>
    implements
        DHDistributorSearchModelCopyWith<$R, DHDistributorSearchModel, $Out> {
  _DHDistributorSearchModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<DHDistributorSearchModel> $mapper =
      DHDistributorSearchModelMapper.ensureInitialized();
  @override
  $R call(
          {Object? id = $none,
          Object? uuid = $none,
          Object? userName = $none,
          Object? name = $none,
          Object? dhCode = $none,
          Object? dhName = $none,
          Object? boundaryCode = $none}) =>
      $apply(FieldCopyWithData({
        if (id != $none) #id: id,
        if (uuid != $none) #uuid: uuid,
        if (userName != $none) #userName: userName,
        if (name != $none) #name: name,
        if (dhCode != $none) #dhCode: dhCode,
        if (dhName != $none) #dhName: dhName,
        if (boundaryCode != $none) #boundaryCode: boundaryCode
      }));
  @override
  DHDistributorSearchModel $make(CopyWithData data) =>
      DHDistributorSearchModel.ignoreDeleted(
          id: data.get(#id, or: $value.id),
          uuid: data.get(#uuid, or: $value.uuid),
          userName: data.get(#userName, or: $value.userName),
          name: data.get(#name, or: $value.name),
          dhCode: data.get(#dhCode, or: $value.dhCode),
          dhName: data.get(#dhName, or: $value.dhName),
          boundaryCode: data.get(#boundaryCode, or: $value.boundaryCode));

  @override
  DHDistributorSearchModelCopyWith<$R2, DHDistributorSearchModel, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _DHDistributorSearchModelCopyWithImpl($value, $cast, t);
}

class DHDistributorModelMapper extends SubClassMapperBase<DHDistributorModel> {
  DHDistributorModelMapper._();

  static DHDistributorModelMapper? _instance;
  static DHDistributorModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = DHDistributorModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'DHDistributorModel';

  static String _$id(DHDistributorModel v) => v.id;
  static const Field<DHDistributorModel, String> _f$id = Field('id', _$id);
  static String _$uuid(DHDistributorModel v) => v.uuid;
  static const Field<DHDistributorModel, String> _f$uuid =
      Field('uuid', _$uuid);
  static String _$userName(DHDistributorModel v) => v.userName;
  static const Field<DHDistributorModel, String> _f$userName =
      Field('userName', _$userName);
  static String _$name(DHDistributorModel v) => v.name;
  static const Field<DHDistributorModel, String> _f$name =
      Field('name', _$name);
  static String _$dhCode(DHDistributorModel v) => v.dhCode;
  static const Field<DHDistributorModel, String> _f$dhCode =
      Field('dhCode', _$dhCode);
  static String _$dhName(DHDistributorModel v) => v.dhName;
  static const Field<DHDistributorModel, String> _f$dhName =
      Field('dhName', _$dhName);
  static bool? _$nonRecoverableError(DHDistributorModel v) =>
      v.nonRecoverableError;
  static const Field<DHDistributorModel, bool> _f$nonRecoverableError = Field(
      'nonRecoverableError', _$nonRecoverableError,
      opt: true, def: false);
  static String? _$tenantId(DHDistributorModel v) => v.tenantId;
  static const Field<DHDistributorModel, String> _f$tenantId =
      Field('tenantId', _$tenantId, opt: true);
  static int? _$rowVersion(DHDistributorModel v) => v.rowVersion;
  static const Field<DHDistributorModel, int> _f$rowVersion =
      Field('rowVersion', _$rowVersion, opt: true);
  static DHDistributorAdditionalFields? _$additionalFields(
          DHDistributorModel v) =>
      v.additionalFields;
  static const Field<DHDistributorModel, DHDistributorAdditionalFields>
      _f$additionalFields =
      Field('additionalFields', _$additionalFields, opt: true);
  static AuditDetails? _$auditDetails(DHDistributorModel v) => v.auditDetails;
  static const Field<DHDistributorModel, AuditDetails> _f$auditDetails =
      Field('auditDetails', _$auditDetails, opt: true);
  static ClientAuditDetails? _$clientAuditDetails(DHDistributorModel v) =>
      v.clientAuditDetails;
  static const Field<DHDistributorModel, ClientAuditDetails>
      _f$clientAuditDetails =
      Field('clientAuditDetails', _$clientAuditDetails, opt: true);
  static bool? _$isDeleted(DHDistributorModel v) => v.isDeleted;
  static const Field<DHDistributorModel, bool> _f$isDeleted =
      Field('isDeleted', _$isDeleted, opt: true, def: false);

  @override
  final MappableFields<DHDistributorModel> fields = const {
    #id: _f$id,
    #uuid: _f$uuid,
    #userName: _f$userName,
    #name: _f$name,
    #dhCode: _f$dhCode,
    #dhName: _f$dhName,
    #nonRecoverableError: _f$nonRecoverableError,
    #tenantId: _f$tenantId,
    #rowVersion: _f$rowVersion,
    #additionalFields: _f$additionalFields,
    #auditDetails: _f$auditDetails,
    #clientAuditDetails: _f$clientAuditDetails,
    #isDeleted: _f$isDeleted,
  };
  @override
  final bool ignoreNull = true;

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = MappableClass.useAsDefault;
  @override
  late final ClassMapperBase superMapper =
      EntityModelMapper.ensureInitialized();

  static DHDistributorModel _instantiate(DecodingData data) {
    return DHDistributorModel(
        id: data.dec(_f$id),
        uuid: data.dec(_f$uuid),
        userName: data.dec(_f$userName),
        name: data.dec(_f$name),
        dhCode: data.dec(_f$dhCode),
        dhName: data.dec(_f$dhName),
        nonRecoverableError: data.dec(_f$nonRecoverableError),
        tenantId: data.dec(_f$tenantId),
        rowVersion: data.dec(_f$rowVersion),
        additionalFields: data.dec(_f$additionalFields),
        auditDetails: data.dec(_f$auditDetails),
        clientAuditDetails: data.dec(_f$clientAuditDetails),
        isDeleted: data.dec(_f$isDeleted));
  }

  @override
  final Function instantiate = _instantiate;

  static DHDistributorModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<DHDistributorModel>(map);
  }

  static DHDistributorModel fromJson(String json) {
    return ensureInitialized().decodeJson<DHDistributorModel>(json);
  }
}

mixin DHDistributorModelMappable {
  String toJson() {
    return DHDistributorModelMapper.ensureInitialized()
        .encodeJson<DHDistributorModel>(this as DHDistributorModel);
  }

  Map<String, dynamic> toMap() {
    return DHDistributorModelMapper.ensureInitialized()
        .encodeMap<DHDistributorModel>(this as DHDistributorModel);
  }

  DHDistributorModelCopyWith<DHDistributorModel, DHDistributorModel,
          DHDistributorModel>
      get copyWith => _DHDistributorModelCopyWithImpl(
          this as DHDistributorModel, $identity, $identity);
  @override
  String toString() {
    return DHDistributorModelMapper.ensureInitialized()
        .stringifyValue(this as DHDistributorModel);
  }

  @override
  bool operator ==(Object other) {
    return DHDistributorModelMapper.ensureInitialized()
        .equalsValue(this as DHDistributorModel, other);
  }

  @override
  int get hashCode {
    return DHDistributorModelMapper.ensureInitialized()
        .hashValue(this as DHDistributorModel);
  }
}

extension DHDistributorModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, DHDistributorModel, $Out> {
  DHDistributorModelCopyWith<$R, DHDistributorModel, $Out>
      get $asDHDistributorModel =>
          $base.as((v, t, t2) => _DHDistributorModelCopyWithImpl(v, t, t2));
}

abstract class DHDistributorModelCopyWith<$R, $In extends DHDistributorModel,
    $Out> implements EntityModelCopyWith<$R, $In, $Out> {
  DHDistributorAdditionalFieldsCopyWith<$R, DHDistributorAdditionalFields,
      DHDistributorAdditionalFields>? get additionalFields;
  @override
  AuditDetailsCopyWith<$R, AuditDetails, AuditDetails>? get auditDetails;
  @override
  ClientAuditDetailsCopyWith<$R, ClientAuditDetails, ClientAuditDetails>?
      get clientAuditDetails;
  @override
  $R call(
      {String? id,
      String? uuid,
      String? userName,
      String? name,
      String? dhCode,
      String? dhName,
      bool? nonRecoverableError,
      String? tenantId,
      int? rowVersion,
      DHDistributorAdditionalFields? additionalFields,
      AuditDetails? auditDetails,
      ClientAuditDetails? clientAuditDetails,
      bool? isDeleted});
  DHDistributorModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _DHDistributorModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, DHDistributorModel, $Out>
    implements DHDistributorModelCopyWith<$R, DHDistributorModel, $Out> {
  _DHDistributorModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<DHDistributorModel> $mapper =
      DHDistributorModelMapper.ensureInitialized();
  @override
  DHDistributorAdditionalFieldsCopyWith<$R, DHDistributorAdditionalFields,
          DHDistributorAdditionalFields>?
      get additionalFields => $value.additionalFields?.copyWith
          .$chain((v) => call(additionalFields: v));
  @override
  AuditDetailsCopyWith<$R, AuditDetails, AuditDetails>? get auditDetails =>
      $value.auditDetails?.copyWith.$chain((v) => call(auditDetails: v));
  @override
  ClientAuditDetailsCopyWith<$R, ClientAuditDetails, ClientAuditDetails>?
      get clientAuditDetails => $value.clientAuditDetails?.copyWith
          .$chain((v) => call(clientAuditDetails: v));
  @override
  $R call(
          {String? id,
          String? uuid,
          String? userName,
          String? name,
          String? dhCode,
          String? dhName,
          Object? nonRecoverableError = $none,
          Object? tenantId = $none,
          Object? rowVersion = $none,
          Object? additionalFields = $none,
          Object? auditDetails = $none,
          Object? clientAuditDetails = $none,
          Object? isDeleted = $none}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (uuid != null) #uuid: uuid,
        if (userName != null) #userName: userName,
        if (name != null) #name: name,
        if (dhCode != null) #dhCode: dhCode,
        if (dhName != null) #dhName: dhName,
        if (nonRecoverableError != $none)
          #nonRecoverableError: nonRecoverableError,
        if (tenantId != $none) #tenantId: tenantId,
        if (rowVersion != $none) #rowVersion: rowVersion,
        if (additionalFields != $none) #additionalFields: additionalFields,
        if (auditDetails != $none) #auditDetails: auditDetails,
        if (clientAuditDetails != $none)
          #clientAuditDetails: clientAuditDetails,
        if (isDeleted != $none) #isDeleted: isDeleted
      }));
  @override
  DHDistributorModel $make(CopyWithData data) => DHDistributorModel(
      id: data.get(#id, or: $value.id),
      uuid: data.get(#uuid, or: $value.uuid),
      userName: data.get(#userName, or: $value.userName),
      name: data.get(#name, or: $value.name),
      dhCode: data.get(#dhCode, or: $value.dhCode),
      dhName: data.get(#dhName, or: $value.dhName),
      nonRecoverableError:
          data.get(#nonRecoverableError, or: $value.nonRecoverableError),
      tenantId: data.get(#tenantId, or: $value.tenantId),
      rowVersion: data.get(#rowVersion, or: $value.rowVersion),
      additionalFields:
          data.get(#additionalFields, or: $value.additionalFields),
      auditDetails: data.get(#auditDetails, or: $value.auditDetails),
      clientAuditDetails:
          data.get(#clientAuditDetails, or: $value.clientAuditDetails),
      isDeleted: data.get(#isDeleted, or: $value.isDeleted));

  @override
  DHDistributorModelCopyWith<$R2, DHDistributorModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _DHDistributorModelCopyWithImpl($value, $cast, t);
}

class DHDistributorAdditionalFieldsMapper
    extends SubClassMapperBase<DHDistributorAdditionalFields> {
  DHDistributorAdditionalFieldsMapper._();

  static DHDistributorAdditionalFieldsMapper? _instance;
  static DHDistributorAdditionalFieldsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = DHDistributorAdditionalFieldsMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'DHDistributorAdditionalFields';

  static String _$schema(DHDistributorAdditionalFields v) => v.schema;
  static const Field<DHDistributorAdditionalFields, String> _f$schema =
      Field('schema', _$schema, opt: true, def: 'DHDistributor');
  static int _$version(DHDistributorAdditionalFields v) => v.version;
  static const Field<DHDistributorAdditionalFields, int> _f$version =
      Field('version', _$version);
  static List<AdditionalField> _$fields(DHDistributorAdditionalFields v) =>
      v.fields;
  static const Field<DHDistributorAdditionalFields, List<AdditionalField>>
      _f$fields = Field('fields', _$fields, opt: true, def: const []);

  @override
  final MappableFields<DHDistributorAdditionalFields> fields = const {
    #schema: _f$schema,
    #version: _f$version,
    #fields: _f$fields,
  };
  @override
  final bool ignoreNull = true;

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = MappableClass.useAsDefault;
  @override
  late final ClassMapperBase superMapper =
      AdditionalFieldsMapper.ensureInitialized();

  static DHDistributorAdditionalFields _instantiate(DecodingData data) {
    return DHDistributorAdditionalFields(
        schema: data.dec(_f$schema),
        version: data.dec(_f$version),
        fields: data.dec(_f$fields));
  }

  @override
  final Function instantiate = _instantiate;

  static DHDistributorAdditionalFields fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<DHDistributorAdditionalFields>(map);
  }

  static DHDistributorAdditionalFields fromJson(String json) {
    return ensureInitialized().decodeJson<DHDistributorAdditionalFields>(json);
  }
}

mixin DHDistributorAdditionalFieldsMappable {
  String toJson() {
    return DHDistributorAdditionalFieldsMapper.ensureInitialized()
        .encodeJson<DHDistributorAdditionalFields>(
            this as DHDistributorAdditionalFields);
  }

  Map<String, dynamic> toMap() {
    return DHDistributorAdditionalFieldsMapper.ensureInitialized()
        .encodeMap<DHDistributorAdditionalFields>(
            this as DHDistributorAdditionalFields);
  }

  DHDistributorAdditionalFieldsCopyWith<DHDistributorAdditionalFields,
          DHDistributorAdditionalFields, DHDistributorAdditionalFields>
      get copyWith => _DHDistributorAdditionalFieldsCopyWithImpl(
          this as DHDistributorAdditionalFields, $identity, $identity);
  @override
  String toString() {
    return DHDistributorAdditionalFieldsMapper.ensureInitialized()
        .stringifyValue(this as DHDistributorAdditionalFields);
  }

  @override
  bool operator ==(Object other) {
    return DHDistributorAdditionalFieldsMapper.ensureInitialized()
        .equalsValue(this as DHDistributorAdditionalFields, other);
  }

  @override
  int get hashCode {
    return DHDistributorAdditionalFieldsMapper.ensureInitialized()
        .hashValue(this as DHDistributorAdditionalFields);
  }
}

extension DHDistributorAdditionalFieldsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, DHDistributorAdditionalFields, $Out> {
  DHDistributorAdditionalFieldsCopyWith<$R, DHDistributorAdditionalFields, $Out>
      get $asDHDistributorAdditionalFields => $base.as(
          (v, t, t2) => _DHDistributorAdditionalFieldsCopyWithImpl(v, t, t2));
}

abstract class DHDistributorAdditionalFieldsCopyWith<
    $R,
    $In extends DHDistributorAdditionalFields,
    $Out> implements AdditionalFieldsCopyWith<$R, $In, $Out> {
  @override
  ListCopyWith<$R, AdditionalField,
      AdditionalFieldCopyWith<$R, AdditionalField, AdditionalField>> get fields;
  @override
  $R call({String? schema, int? version, List<AdditionalField>? fields});
  DHDistributorAdditionalFieldsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _DHDistributorAdditionalFieldsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, DHDistributorAdditionalFields, $Out>
    implements
        DHDistributorAdditionalFieldsCopyWith<$R, DHDistributorAdditionalFields,
            $Out> {
  _DHDistributorAdditionalFieldsCopyWithImpl(
      super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<DHDistributorAdditionalFields> $mapper =
      DHDistributorAdditionalFieldsMapper.ensureInitialized();
  @override
  ListCopyWith<$R, AdditionalField,
          AdditionalFieldCopyWith<$R, AdditionalField, AdditionalField>>
      get fields => ListCopyWith($value.fields, (v, t) => v.copyWith.$chain(t),
          (v) => call(fields: v));
  @override
  $R call({String? schema, int? version, List<AdditionalField>? fields}) =>
      $apply(FieldCopyWithData({
        if (schema != null) #schema: schema,
        if (version != null) #version: version,
        if (fields != null) #fields: fields
      }));
  @override
  DHDistributorAdditionalFields $make(CopyWithData data) =>
      DHDistributorAdditionalFields(
          schema: data.get(#schema, or: $value.schema),
          version: data.get(#version, or: $value.version),
          fields: data.get(#fields, or: $value.fields));

  @override
  DHDistributorAdditionalFieldsCopyWith<$R2, DHDistributorAdditionalFields,
      $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _DHDistributorAdditionalFieldsCopyWithImpl($value, $cast, t);
}
