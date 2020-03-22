import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

/// Form field to edit a credit card CVC code, with validation
class CardCvcFormField extends StatelessWidget {
  CardCvcFormField(
      {Key key,
      this.initialValue,
      @required this.onSaved,
      @required this.validator,
      @required this.onChanged,
      this.decoration = defaultDecoration,
      this.textStyle = defaultTextStyle})
      : super(key: key);

  final String initialValue;
  final InputDecoration decoration;
  final TextStyle textStyle;
  final void Function(String) onSaved;
  final void Function(String) onChanged;
  final String Function(String) validator;

  static const defaultErrorText = "Invalid CVV";
  static const defaultDecoration = InputDecoration(
      border: OutlineInputBorder(), labelText: "CVV", hintText: "XXX");
  static const defaultTextStyle = TextStyle(color: Colors.black);

  @override
  Widget build(BuildContext context) {
    var maskFormatter = MaskTextInputFormatter(mask: '####');

    return Container(
      child: TextFormField(
        initialValue: initialValue,
        inputFormatters: [maskFormatter],
        onChanged: onChanged,
        validator: validator,
        onSaved: onSaved,
        style: textStyle,
        decoration: decoration,
        keyboardType: TextInputType.number,
        textInputAction: TextInputAction.done,
      ),
    );
  }
}
