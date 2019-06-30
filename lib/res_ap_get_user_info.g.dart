// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'res_ap_get_user_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResApGetUserInfo _$ResApGetUserInfoFromJson(Map<String, dynamic> json) {
  return ResApGetUserInfo(
      json['code'],
      json['userinfo'] == null
          ? null
          : UserInfo.fromJson(json['userinfo'] as Map<String, dynamic>),
      msg: json['msg']);
}

Map<String, dynamic> _$ResApGetUserInfoToJson(ResApGetUserInfo instance) =>
    <String, dynamic>{
      'code': instance.code,
      'msg': instance.msg,
      'userinfo': instance.userinfo
    };

UserInfo _$UserInfoFromJson(Map<String, dynamic> json) {
  return UserInfo(json['birthday'] as int, json['gender'] as int,
      json['username'] as String);
}

Map<String, dynamic> _$UserInfoToJson(UserInfo instance) => <String, dynamic>{
      'birthday': instance.birthday,
      'gender': instance.gender,
      'username': instance.username
    };
