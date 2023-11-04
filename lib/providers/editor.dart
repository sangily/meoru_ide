import 'package:flutter/foundation.dart';

class EditorProvider with ChangeNotifier, DiagnosticableTreeMixin {
  String _code = '';

  String get code => _code;

  void setCode(String code) {
    _code = code;
    notifyListeners();
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty("code", _code));
  }
}