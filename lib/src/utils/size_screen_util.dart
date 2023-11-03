import 'package:flutter/material.dart';

extension ContextUtils on BuildContext {
  Size screenSize() {
    return MediaQuery.of(this).size;
  }
}
