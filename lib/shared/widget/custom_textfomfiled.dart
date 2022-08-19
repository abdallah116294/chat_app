import 'package:flutter/material.dart';
import 'package:frienz/shared/color_manager.dart';

class CustomTextFormFiled extends StatelessWidget {
  CustomTextFormFiled(
      {Key? key,
      this.isObscureText,
      this.inputFiled,
      this.prefixIcon,
      this.validator,
      this.textInputType,
      required this.controller,
      this.onchange, required this.onPresed})
      : super(key: key);
  final bool? isObscureText;
  final String? inputFiled;
  final IconData? prefixIcon;
  final String? Function(String?)? validator;
  final TextInputType? textInputType;
  final TextEditingController controller;
  final Function(String)? onchange;
  final GestureTapCallback onPresed;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onTap: onPresed,
      style: const TextStyle(color: AppColor.textColor),
      onChanged: onchange,
      obscureText: isObscureText!,
      validator: validator,
      keyboardType: textInputType,
      decoration: InputDecoration(
        contentPadding:const  EdgeInsets.symmetric(vertical: 10,horizontal: 10),

          label: Text('$inputFiled'),
          prefixIcon: Icon(prefixIcon),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            
            )
          ),
    );
  }
}
