import 'package:json_annotation/json_annotation.dart';

part 'Message.g.dart';

@JsonSerializable()
class Message extends Object {
  @JsonKey(name: 'http')
  DYHttp http;

  @JsonKey(name: 'module')
  DYModule module;

  @JsonKey(name: 'device')
  DYDevice device;

  @JsonKey(name: 'user')
  DYUser user;

  @JsonKey(name: 'custom')
  dynamic custom;

  @JsonKey(name: 'isDebug')
  bool isDebug;

  @JsonKey(name: 'initialRoute')
  String initialRoute;

  Message(
      [this.http,
      this.module,
      this.device,
      this.user,
      this.custom,
      this.isDebug,
      this.initialRoute]);

  factory Message.fromJson(Map<String, dynamic> srcJson) =>
      _$MessageFromJson(srcJson);

  Map<String, dynamic> toJson() => _$MessageToJson(this);
}

@JsonSerializable()
class DYHttp extends Object {
  @JsonKey(name: 'headers')
  dynamic headers;

  @JsonKey(name: 'baseUrl')
  String baseUrl;

  @JsonKey(name: 'path')
  String path;

  @JsonKey(name: 'httpVersion')
  String httpVersion;

  DYHttp([this.headers, this.baseUrl, this.path, this.httpVersion]);

  factory DYHttp.fromJson(Map<String, dynamic> srcJson) =>
      _$DYHttpFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DYHttpToJson(this);
}

@JsonSerializable()
class DYModule extends Object {
  @JsonKey(name: 'moduleId')
  String moduleId;

  @JsonKey(name: 'moduleName')
  String moduleName;

  @JsonKey(name: 'shortVersion')
  String shortVersion;

  @JsonKey(name: 'longVersion')
  String longVersion;

  DYModule(
      [this.moduleId, this.moduleName, this.shortVersion, this.longVersion]);

  factory DYModule.fromJson(Map<String, dynamic> srcJson) =>
      _$DYModuleFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DYModuleToJson(this);
}

@JsonSerializable()
class DYDevice extends Object {
  @JsonKey(name: 'id')
  String id;

  @JsonKey(name: 'platform')
  String platform;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'model')
  String model;

  @JsonKey(name: 'operationSystem')
  String operationSystem;

  DYDevice(
      [this.id, this.platform, this.name, this.model, this.operationSystem]);

  factory DYDevice.fromJson(Map<String, dynamic> srcJson) =>
      _$DYDeviceFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DYDeviceToJson(this);
}

@JsonSerializable()
class DYUser extends Object {
  @JsonKey(name: 'id')
  String id;

  @JsonKey(name: 'nick')
  String nick;

  DYUser([this.id, this.nick]);

  factory DYUser.fromJson(Map<String, dynamic> srcJson) =>
      _$DYUserFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DYUserToJson(this);
}
