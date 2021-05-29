// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Message _$MessageFromJson(Map<String, dynamic> json) {
  return Message(
    json['http'] == null
        ? null
        : DYHttp.fromJson(json['http'] as Map<String, dynamic>),
    json['module'] == null
        ? null
        : DYModule.fromJson(json['module'] as Map<String, dynamic>),
    json['device'] == null
        ? null
        : DYDevice.fromJson(json['device'] as Map<String, dynamic>),
    json['user'] == null
        ? null
        : DYUser.fromJson(json['user'] as Map<String, dynamic>),
    json['custom'],
    json['isDebug'] as bool,
    json['initialRoute'] as String,
  );
}

Map<String, dynamic> _$MessageToJson(Message instance) => <String, dynamic>{
      'http': instance.http,
      'module': instance.module,
      'device': instance.device,
      'user': instance.user,
      'custom': instance.custom,
      'isDebug': instance.isDebug,
      'initialRoute': instance.initialRoute,
    };

DYHttp _$DYHttpFromJson(Map<String, dynamic> json) {
  return DYHttp(
    json['headers'],
    json['baseUrl'] as String,
    json['path'] as String,
    json['httpVersion'] as String,
  );
}

Map<String, dynamic> _$DYHttpToJson(DYHttp instance) => <String, dynamic>{
      'headers': instance.headers,
      'baseUrl': instance.baseUrl,
      'path': instance.path,
      'httpVersion': instance.httpVersion,
    };

DYModule _$DYModuleFromJson(Map<String, dynamic> json) {
  return DYModule(
    json['moduleId'] as String,
    json['moduleName'] as String,
    json['shortVersion'] as String,
    json['longVersion'] as String,
  );
}

Map<String, dynamic> _$DYModuleToJson(DYModule instance) => <String, dynamic>{
      'moduleId': instance.moduleId,
      'moduleName': instance.moduleName,
      'shortVersion': instance.shortVersion,
      'longVersion': instance.longVersion,
    };

DYDevice _$DYDeviceFromJson(Map<String, dynamic> json) {
  return DYDevice(
    json['id'] as String,
    json['platform'] as String,
    json['name'] as String,
    json['model'] as String,
    json['operationSystem'] as String,
  );
}

Map<String, dynamic> _$DYDeviceToJson(DYDevice instance) => <String, dynamic>{
      'id': instance.id,
      'platform': instance.platform,
      'name': instance.name,
      'model': instance.model,
      'operationSystem': instance.operationSystem,
    };

DYUser _$DYUserFromJson(Map<String, dynamic> json) {
  return DYUser(
    json['id'] as String,
    json['nick'] as String,
  );
}

Map<String, dynamic> _$DYUserToJson(DYUser instance) => <String, dynamic>{
      'id': instance.id,
      'nick': instance.nick,
    };
