import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:frienz/model/message.dart';
import 'package:frienz/shared/assetes_manger.dart';
import 'package:frienz/shared/constant.dart';
import 'package:frienz/shared/widget/chat_item.dart';

import '../shared/color_manager.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({Key? key,this.email}) : super(key: key);
  final _controller = ScrollController();
  TextEditingController controller = TextEditingController();
  // FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference messages =
      FirebaseFirestore.instance.collection(KMessages);
 String? email;
  @override
  Widget build(BuildContext context) {
   
    // String email = ModalRoute.of(context)!.settings.arguments;
    return StreamBuilder<QuerySnapshot>(
        stream: messages.orderBy('createdAt',descending: true).snapshots(),
        builder: (context, snapshot) {
          
          if (snapshot.hasData) {
            //print(snapshot.data!.docs[0]['message']);
            
            List<MessageModel> messsagelist = [];
            for (int i = 0; i < snapshot.data!.docs.length; i++) {
              messsagelist.add(MessageModel.fromJson(snapshot.data!.docs[i]));
            }
            return Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                centerTitle: true,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:  [
                    Image.asset(ImageAssets.icon,width: 30,height: 50,),
                  SizedBox(width: 20,),
                  const  Text(
                      'Chat',
                      style: TextStyle(color: AppColor.textColor),
                    ),
                  ],
                ),
                backgroundColor: AppColor.primaryColor,
              ),
              body: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                        reverse: true,
                        controller: _controller,
                        itemCount: messsagelist.length,
                        itemBuilder: (context, index) {
                          return messsagelist[index].id == email
                              ? CustomChatItem(
                                  messageModel: messsagelist[index],
                                )
                              : CustomChatItemfirend(
                                  messageModel: messsagelist[index],
                                );
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: TextField(
                      controller: controller,
                      onSubmitted: (data) {
                        messages.add({
                          'message': data,
                          'createdAt': DateTime.now(),
                          'id': email
                        });
                        controller.clear();
                        _controller.animateTo(0,
                            duration: const Duration(seconds: 2),
                            curve: Curves.easeIn);
                      },
                      decoration: InputDecoration(
                          hintText: 'Send Messge',
                          suffixIcon: const Icon(
                            Icons.send,
                            color: AppColor.primaryColor,
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: const BorderSide(
                                  color: AppColor.secondMessage)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16))),
                      style: const TextStyle(decoration: TextDecoration.none),
                    ),
                  )
                ],
              ),
            );
          }
          return   Scaffold(
            appBar: AppBar(
              elevation: 0.0,
              backgroundColor: Colors.white,
            ),
            body:const  Center(child: CircularProgressIndicator(color:Colors.blue,)),
          );
        });
  }
}
