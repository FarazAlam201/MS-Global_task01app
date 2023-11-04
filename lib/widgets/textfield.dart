import 'package:flutter/material.dart';
import 'package:task1_app/constants/colors.dart';

class ShowTextField extends StatefulWidget {
  final String textHint;
  bool hiddenData;
  final IconButton? suffixIcon;
  final TextEditingController? controller;
  final TextInputAction moveToNextTextField;
  final Function(String)? validator;
  final Function(String)? onFieldSubmitted;

  ShowTextField({
    super.key,
    required this.textHint,
    this.controller,
    this.hiddenData = false,
    this.suffixIcon,
    this.moveToNextTextField = TextInputAction.next,
    this.validator,
    this.onFieldSubmitted,
  });

  @override
  State<ShowTextField> createState() => _ShowTextFieldState();
}

class _ShowTextFieldState extends State<ShowTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.hiddenData,
      controller: widget.controller,
      textInputAction: widget.moveToNextTextField,
      style: Theme.of(context).textTheme.bodySmall,
      cursorColor: grey,
      onFieldSubmitted: widget.onFieldSubmitted,
      validator: (value) {
        if (widget.validator != null) {
          return widget.validator!(value!);
        } else {
          return null;
        }
      },
      decoration: InputDecoration(
        labelText: widget.textHint,
        enabled: true,
        suffixIcon: widget.textHint == 'Password'
            ? IconButton(
                onPressed: () {
                  setState(() {
                    widget.hiddenData = !widget.hiddenData;
                  });
                },
                icon: Icon(
                  widget.hiddenData
                      ? Icons.visibility_off_rounded
                      : Icons.visibility_rounded,
                ),
                splashColor: transparent,
                highlightColor: transparent,
              )
            : null,
      ),
    );
  }
}
