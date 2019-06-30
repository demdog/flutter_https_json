import 'package:json_annotation/json_annotation.dart';
/***
 * 接口：ApGetUserInfo
 * URL：host + /apgetuserinfo
 * 编码：www.apigj.com
 * 版本号：1.3
 ***/
part 'req_base.g.dart';

@JsonSerializable()
class ReqBase {
  @JsonKey(name: 'userid')
  int userid;
  ReqBase (
    this.userid,
  );

  /***
   * 检查类型完整性
   * return true代表类型通过完整性检查
   * false代表类型完整性检查失败，同时会输出失败为空的参数
   ***/
  checkVarRequire() {
    if(this.userid == null){
      print("Lake of (userid)");
      return false;
    }
    return true;
  }

  /***
   * 通过flutter pub run build_runner build自动生成解释和序列化方法
   ***/
  factory ReqBase.fromJson(Map<String, dynamic> json) => _$ReqBaseFromJson(json);
  Map<String, dynamic> toJson() => _$ReqBaseToJson(this);
}

