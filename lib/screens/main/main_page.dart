import 'package:flutter/material.dart';
import 'package:meoru_ide/providers/common.dart';
import 'package:meoru_ide/providers/explorer.dart';
import 'package:meoru_ide/screens/main/widget/syntax_highlight.dart';
import 'package:meoru_ide/screens/topbar/topbar.dart';
import 'package:provider/provider.dart';
import 'package:meoru_ide/screens/explorer/explorer.dart';

String code = """
// Importing core libraries
import 'dart:math';
int fibonacci(int n) {
  if (n == 0 || n == 1) return n;
  return fibonacci(n - 1) + fibonacci(n - 2);
}          
var result = fibonacci(20);
/* and there 
    you have it! */
""";

class CustomCodeEditor extends StatefulWidget {
  final String language;

  const CustomCodeEditor({super.key, this.language = ''});

  @override
  _CustomCodeEditorState createState() => _CustomCodeEditorState(language);
}

class _CustomCodeEditorState extends State<CustomCodeEditor> {
  final _formKey = GlobalKey<FormState>();
  String code = '';
  final _controller = TextEditingController();
  String language;

  _CustomCodeEditorState(this.language);

  final TextStyle _style = TextStyle(
    fontFamily: 'consolas',
    color: Colors.black,
    fontSize: 14,
    height: 1,
  );

  SyntaxHighlighter highlighter;

  @override
  void initState() {
    super.initState();
    highlighter = getHighlighterWithName(widget.language)(

    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        color: Color(0xFF131314),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: context
                    .watch<CommonProvider>()
                    .bodyHeight - 32.0,
                width: context
                    .watch<CommonProvider>()
                    .screenWidth - 32.0,
                child: TextFormField(
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  minLines: null,
                  maxLines: null,
                  expands: true,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                  onSaved: (value) {
                    code = value!;
                  },
                  controller: _controller,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

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
                  CustomCodeEditor(),
                  AnimatedPositioned(
                    duration: Duration(milliseconds: 300),
                    left: context
                        .watch<ExplorerProvider>()
                        .isOpened ? 0 : -190,
                    child: ExplorerWidget(),
                  ),
                  Positioned(
                    bottom: 16,
                    right: 16,
                    child: Column(
                      children: [
                        // 콘솔 버튼
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
                        // 키보드 버튼
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
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
