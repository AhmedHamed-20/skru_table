extension ReplaceWhiteSpaceOnTextEditingControllerByZero on String {
  String replaceWhiteSpaceOnTextEditingControllerByZero() {
    if (isEmpty) {
      return "0";
    }
    return this;
  }
}
