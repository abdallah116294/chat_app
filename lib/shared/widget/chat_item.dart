import 'package:flutter/material.dart';
import 'package:frienz/model/message.dart';
import 'package:frienz/shared/color_manager.dart';

class CustomChatItem extends StatelessWidget {
   CustomChatItem({
    Key? key,
    required this.messageModel
  }) : super(key: key);
  MessageModel messageModel;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        //alignment: Alignment.centerLeft,
        padding:const  EdgeInsets.only(left: 16, top: 16, bottom: 16, right: 16),
        margin: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(32),
                topRight: Radius.circular(32),
                bottomRight: Radius.circular(32)),
            color: AppColor.primaryColor),
        child:  Text(
          messageModel.message,
          style:const  TextStyle(color: AppColor.textColor, fontSize: 20),
        ),
      ),
    );
  }
}
class CustomChatItemfirend extends StatelessWidget {
   CustomChatItemfirend({
    Key? key,
    required this.messageModel
  }) : super(key: key);
  MessageModel messageModel;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        //alignment: Alignment.centerLeft,
        padding:const  EdgeInsets.only(left: 16, top: 16, bottom: 16, right: 16),
        margin: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(32),
                topRight: Radius.circular(32),
                bottomLeft: Radius.circular(32)),
            color: AppColor.secondMessage),
        child:  Text(
          messageModel.message,
          style:const  TextStyle(color: AppColor.textColor, fontSize: 20),
        ),
      ),
    );
  }
}
