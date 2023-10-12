import 'package:flutter/foundation.dart';

class ExplorerProvider with ChangeNotifier, DiagnosticableTreeMixin {
  bool _isOpened = false;

  bool get isOpened => _isOpened;

  void toggle() {
    _isOpened = !_isOpened;
    notifyListeners();
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(FlagProperty('isOpened', value: isOpened));
  }
}