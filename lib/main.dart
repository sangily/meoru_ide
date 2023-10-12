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

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  double bodyHeight = 0;

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
        body: OrientationBuilder(builder: (context, orientation) {
          return LayoutBuilder(
            builder: (context, constraints) {
              bodyHeight = constraints.maxHeight;

              if (orientation == Orientation.portrait) {
                context.read<CommonProvider>().setBodyHeight(bodyHeight);
              } else {
                context.read<CommonProvider>().setBodyHeight(bodyHeight);
              }

              return Stack(
                children: [
                  AnimatedPositioned(
                    duration: Duration(milliseconds: 300),
                    left: context.watch<ExplorerProvider>().isOpened ? 0 : -200,
                    child: ExplorerWidget(),
                  ),
                  Positioned(
                    bottom: 16,
                    right: 16,
                    child: Column(
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                            fixedSize: MaterialStateProperty.all(Size(50, 50)),
                            iconSize: MaterialStateProperty.all(30),
                            alignment: Alignment.center,
                          ),
                          child: Icon(Icons.terminal),
                        ),
                        SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                            fixedSize: MaterialStateProperty.all(Size(50, 50)),
                            iconSize: MaterialStateProperty.all(30),
                            alignment: Alignment.center,
                          ),
                          child: Icon(Icons.keyboard),
                        )
                      ],
                    ),
                  )
                ],
              );
            },
          );
        })
        // body: Center(
        //   child: Text('tmp'),
        // )
        );
  }
}
