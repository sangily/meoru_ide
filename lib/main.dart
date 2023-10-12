import 'index.dart';

void main() {
  runApp(
    // DevicePreview(
    //   builder: (context) =>
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ExplorerProvider()),
        ChangeNotifierProvider(create: (_) => CommonProvider()),
      ],
      child: MeoruIDE(),
    ),
  );
}

class MeoruIDE extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(),
    );
  }
}