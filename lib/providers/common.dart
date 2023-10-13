import 'package:flutter/foundation.dart';

class CommonProvider with ChangeNotifier, DiagnosticableTreeMixin {
  late double bodyHeight;
  late double screenWidth;

  void setBodyHeight(double bodyHeight) {
    this.bodyHeight = bodyHeight;
  }

  void setScreenWidth(double screenWidth) {
    this.screenWidth = screenWidth;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DoubleProperty('bodyHeight', bodyHeight));
  }
}
