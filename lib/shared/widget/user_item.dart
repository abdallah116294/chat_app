// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:frienz/model/message.dart';
// import 'package:frienz/shared/color_manager.dart';

// class UserItem extends StatelessWidget {
//   UserItem(this.messageModel, {Key? key}) : super(key: key);
//  // DocumentSnapshot doc;

//   MessageModel messageModel;
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       child: Container(
//         height: 60,
//         alignment: Alignment.centerLeft,
//         width: 30,
//         decoration: BoxDecoration(
//             color: AppColor.primaryColor,
//             borderRadius: BorderRadius.circular(20)),
//         child: Row(
//           children: [
//             Text(
//               messageModel.name,
//               style: TextStyle(fontSize: 30, color: AppColor.textColor),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
