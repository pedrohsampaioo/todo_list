import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:todo_list/app/config/theme/app_colors.dart';

class CustomTextFieldWidget extends StatelessWidget {
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? placeholder;
  final TextCapitalization? textCapitalization;

  const CustomTextFieldWidget({
    Key? key,
    this.controller,
    this.focusNode,
    this.placeholder,
    this.textCapitalization,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      controller: controller,
      focusNode: focusNode,
      placeholder: placeholder,
      textCapitalization: textCapitalization ?? TextCapitalization.sentences,
      style:
          Theme.of(context).textTheme.bodyText1!.apply(color: AppColors.black),
      placeholderStyle: Theme.of(context)
          .textTheme
          .bodyText2!
          .apply(color: AppColors.black.withOpacity(0.5)),
      cursorColor: Colors.blue,
      decoration: BoxDecoration(
        color: Colors.transparent,
      ),
    );
  }
}
