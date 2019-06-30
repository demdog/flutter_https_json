import 'package:json_annotation/json_annotation.dart';

import 'res_common.dart';

/***
 * 接口：ApGetUserInfo
 * URL：host + /apgetuserinfo
 * 编码：www.apigj.com
 * 版本号：1.3
 ***/

part 'res_ap_get_user_info.g.dart';

@JsonSerializable()
class ResApGetUserInfo extends ResCommon {
  @JsonKey(name: 'userinfo')
  UserInfo userinfo;
  ResApGetUserInfo (
    code,
    this.userinfo,
    {msg}
  ):super (
    code,
    msg:msg
  );

  /***
   * 检查类型完整性
   * return true代表类型通过完整性检查
   * false代表类型完整性检查失败，同时会输出失败为空的参数
   ***/
  checkVarRequire() {
    if(!super.checkVarRequire()){
      return false;
    }
    if(this.userinfo == null){
      print("Lake of (userinfo)");
      return false;
    } else {
      if (!this.userinfo.checkVarRequire()) {
        print("failed in : \"ResApGetUserInfo.userinfo\"");
        return false;
      }
    }
    return true;
  }

  /***
   * 通过flutter pub run build_runner build自动生成解释和序列化方法
   ***/
  factory ResApGetUserInfo.fromJson(Map<String, dynamic> json) => _$ResApGetUserInfoFromJson(json);
  Map<String, dynamic> toJson() => _$ResApGetUserInfoToJson(this);
}

@JsonSerializable()
class UserInfo {
  @JsonKey(name: 'birthday')
  int birthday;
  @JsonKey(name: 'gender')
  int gender;
  @JsonKey(name: 'username')
  String username;
  UserInfo (
    this.birthday,
    this.gender,
    this.username,
  );

  /***
   * 检查类型完整性
   * return true代表类型通过完整性检查
   * false代表类型完整性检查失败，同时会输出失败为空的参数
   ***/
  checkVarRequire() {
    if(this.birthday == null){
      print("Lake of (birthday)");
      return false;
    }
    if(this.gender == null){
      print("Lake of (gender)");
      return false;
    }
    if(this.username == null){
      print("Lake of (username)");
      return false;
    }
    return true;
  }

  /***
   * 通过flutter pub run build_runner build自动生成解释和序列化方法
   ***/
  factory UserInfo.fromJson(Map<String, dynamic> json) => _$UserInfoFromJson(json);
  Map<String, dynamic> toJson() => _$UserInfoToJson(this);
}

