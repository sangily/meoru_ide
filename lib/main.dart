import 'index.dart';

void main() {
  runApp(
    // DevicePreview(
    //   builder: (context) =>
    // MultiProvider(
        // providers: [
        //   ChangeNotifierProvider(create: (_) => (_)),
        // ],
        // child: const MeoruIDE(),
      // ),
    // ),
    const MeoruIDE()
  );
}

class MeoruIDE extends StatelessWidget {
  const MeoruIDE({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBarWidget(
        openFiles: [
          'README.md',
          'main.dart',
          'test1.txt',
          'test2.c',
          'test3.cpp',
          'test4.py',
          'test5.kt'
        ],
      ),
      // body: ExplorerWidget()
      body: Center(
        child: Text('tmp'),
      )
    );
  }
}

// class Counter with ChangeNotifier, DiagnosticableTreeMixin {
//   int _count = 0;
//
//   int get count => _count;
//
//   void increment() {
//     _count++;
//     notifyListeners();
//   }
//
//   @override
//   void debugFillProperties(DiagnosticPropertiesBuilder properties) {
//     super.debugFillProperties(properties);
//     properties.add(IntProperty('count', count));
//   }
// }
//
// class Count extends StatelessWidget {
//   const Count({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Text(
//       '${context.watch<Counter>().count}',
//       key: const Key('counterState'),
//       style: Theme.of(context).textTheme.headlineMedium,
//     );
//   }
// }
