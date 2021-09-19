import 'package:flutter/material.dart';
import 'package:tinder_app_flutter/util/constants.dart';

class BorderedTextField extends StatelessWidget {
  final String labelText;
  final Function(String) onChanged;
  final TextInputType keyboardType;
  final bool obscureText;
  final bool autoFocus;
  final TextCapitalization textCapitalization;
  final textController;
  final prefixIcon;
  final bool isBorder;
  // final Function onSubmit;

  BorderedTextField(
      {@required this.labelText,
      @required this.onChanged,
      this.keyboardType = TextInputType.text,
      this.obscureText = false,
      this.autoFocus = false,
      this.textCapitalization = TextCapitalization.none,
      this.textController,
      this.prefixIcon,
      this.isBorder
      // this.onSubmit
      });

  @override
  Widget build(BuildContext context) {
    Color color = kSecondaryColor;

    return TextField(
      controller: textController,
      onChanged: onChanged,
      obscureText: obscureText,
      autofocus: autoFocus,
      keyboardType: keyboardType,
      cursorColor: Colors.white,
      textCapitalization: textCapitalization,
      style: TextStyle(color: color),
      // onSubmitted: onSubmit,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        labelText: labelText,
        labelStyle: TextStyle(color: kSecondaryColor.withOpacity(0.5)),
        border: UnderlineInputBorder(),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: isBorder ? color : Colors.transparent),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: color),
        ),
      ),
    );
  }
}
