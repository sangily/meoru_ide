import 'index.dart';

void main() {
  runApp(
    // DevicePreview(
    //   builder: (context) =>
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ExplorerProvider()),
        ChangeNotifierProvider(create: (_) => CommonProvider()),
        ChangeNotifierProvider(create: (_) => EditorProvider()),
      ],
      child: MeoruIDE(),
    ),
  );
}

class MeoruIDE extends StatelessWidget {
  const MeoruIDE({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(),
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          shadowColor: Colors.white,
        )
      ),
    );
  }
}