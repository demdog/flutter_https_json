import 'package:json_annotation/json_annotation.dart';

/***
 * 接口：ApGetUserInfo
 * URL：host + /apgetuserinfo
 * 编码：www.apigj.com
 * 版本号：1.3
 ***/

part 'res_common.g.dart';

@JsonSerializable()
class ResCommon {
  @JsonKey(name: 'code')
  int code;
  @JsonKey(name: 'msg')
  String msg;
  ResCommon (
    this.code,
    {this.msg}
  );

  /***
   * 检查类型完整性
   * return true代表类型通过完整性检查
   * false代表类型完整性检查失败，同时会输出失败为空的参数
   ***/
  checkVarRequire() {
    if(this.code == null){
      print("Lake of (code)");
      return false;
    }
    return true;
  }

  /***
   * 通过flutter pub run build_runner build自动生成解释和序列化方法
   ***/
  factory ResCommon.fromJson(Map<String, dynamic> json) => _$ResCommonFromJson(json);
  Map<String, dynamic> toJson() => _$ResCommonToJson(this);
}

