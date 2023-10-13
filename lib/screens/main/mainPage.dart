import 'package:flutter/material.dart';
import 'package:meoru_ide/providers/common.dart';
import 'package:meoru_ide/providers/explorer.dart';
import 'package:meoru_ide/screens/topbar/topbar.dart';
import 'package:provider/provider.dart';
import 'package:meoru_ide/screens/explorer/explorer.dart';
import 'package:code_editor/code_editor.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  double bodyHeight = 0;
  double screenWidth = 0;

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
      body: OrientationBuilder(
        builder: (context, orientation) {
          return LayoutBuilder(
            builder: (context, constraints) {
              bodyHeight = constraints.maxHeight;
              screenWidth = constraints.maxWidth;

              if (orientation == Orientation.portrait) {
                context.read<CommonProvider>().setBodyHeight(bodyHeight);
                context.read<CommonProvider>().setScreenWidth(screenWidth);
              } else {
                context.read<CommonProvider>().setBodyHeight(bodyHeight);
                context.read<CommonProvider>().setScreenWidth(screenWidth);
              }

              return Stack(
                children: [
                  Container(
                    color: Color(0xFF131314),
                    child: SingleChildScrollView(
                      child: CodeEditor(
                        model: EditorModel(
                          files: [
                            FileEditor(
                              name: 'test.py',
                              language: "python",
                              code: """import pandas as pd

df = pd.DataFrame()
print(\"Hello World\")
"""
                            ),
                          ],
                          styleOptions: EditorModelStyleOptions(
                            fontSize: 13,
                            heightOfContainer: 400,
                          ),
                        ),
                        disableNavigationbar: false,
                        onSubmit: (String language, String Value) {
                          print("A file was changed");
                        },
                        formatters: const ["html"],
                        textModifier: (String language, String content) {
                          print("A file is about to change");
                          return content;
                        },
                      ),
                    ),
                  ),
                  AnimatedPositioned(
                    duration: Duration(milliseconds: 300),
                    left: context.watch<ExplorerProvider>().isOpened ? 0 : -190,
                    child: ExplorerWidget(),
                  ),
                  // Positioned(
                  //   bottom: 16,
                  //   right: 16,
                  //   child: Column(
                  //     children: [
                  //       // 콘솔 버튼
                  //       ElevatedButton(
                  //         onPressed: () {},
                  //         style: ButtonStyle(
                  //           fixedSize: MaterialStateProperty.all(Size(50, 50)),
                  //           iconSize: MaterialStateProperty.all(30),
                  //           alignment: Alignment.center,
                  //         ),
                  //         child: Icon(Icons.terminal),
                  //       ),
                  //       SizedBox(height: 10),
                  //       // 키보드 버튼
                  //       ElevatedButton(
                  //         onPressed: () {},
                  //         style: ButtonStyle(
                  //           fixedSize: MaterialStateProperty.all(Size(50, 50)),
                  //           iconSize: MaterialStateProperty.all(30),
                  //           alignment: Alignment.center,
                  //         ),
                  //         child: Icon(Icons.keyboard),
                  //       )
                  //     ],
                  //   ),
                  // ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
