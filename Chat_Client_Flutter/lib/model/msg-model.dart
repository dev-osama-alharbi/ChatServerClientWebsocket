

class MsgModel {
  String username;
  String msg;
  String dateTime = "2023-06-01 00:00:00";

  MsgModel(this.username, this.msg);

  MsgModel.fromJson(Map<String, dynamic> json)
      : username = json['username'],
        msg = json['msg'],
        dateTime = json['dateTime'];

  Map<String, dynamic> toJson() => {
    'username': username,
    'msg': msg,
    'dateTime': dateTime,
  };
}