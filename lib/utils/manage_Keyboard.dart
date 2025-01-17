// ignore_for_file: file_names

import 'package:flutter/widgets.dart';

class KeyboardUtils {
  static void hideKeyboard(BuildContext, context) {
    FocusScopeNode currentFocus = FocusScope.of(context);

    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }
}
