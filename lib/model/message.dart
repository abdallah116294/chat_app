import '../shared/constant.dart';

class MessageModel {
  final String message;
  final String id;

  MessageModel(this.message, this.id);
  factory MessageModel.fromJson(jsondata) {
    return MessageModel(jsondata[TextMessage], jsondata['id'],);
  }
}
