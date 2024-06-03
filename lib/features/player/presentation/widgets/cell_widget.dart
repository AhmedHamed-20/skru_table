import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

class CellWidget extends StatelessWidget {
  const CellWidget(
      {super.key,
      required this.onValueChanged,
      required this.textEditingController});
  final TextEditingController textEditingController;
  final void Function(String)? onValueChanged;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      onChanged: onValueChanged,
      keyboardType: TextInputType.number,
      textAlign: TextAlign.center,
      decoration: const InputDecoration(
        border: InputBorder.none,
      ),
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        NoLeadingZeroInputFormatter(),
      ],
    );
  }
}

class NoLeadingZeroInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // If the new value starts with '0' and is not empty, keep the old value
    if (newValue.text.startsWith('0') && newValue.text.length > 1) {
      return oldValue;
    }
    return newValue;
  }
}
