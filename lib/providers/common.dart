import 'package:flutter/foundation.dart';

class CommonProvider with ChangeNotifier, DiagnosticableTreeMixin {
  late double bodyHeight;

  void setBodyHeight(double bodyHeight) {
    this.bodyHeight = bodyHeight;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DoubleProperty('bodyHeight', bodyHeight));
  }
}
