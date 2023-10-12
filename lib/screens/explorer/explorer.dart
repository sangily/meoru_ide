import 'package:flutter/material.dart';
import 'package:meoru_ide/providers/explorer.dart';
import 'package:meoru_ide/providers/common.dart';
import 'package:provider/provider.dart';

class ExplorerWidget extends StatefulWidget {
  const ExplorerWidget({super.key});

  @override
  State<ExplorerWidget> createState() => _ExplorerWidget();
}

class _ExplorerWidget extends State<ExplorerWidget> {
  _ExplorerWidget();

  void toggleContainer(BuildContext context) {
    context.read<ExplorerProvider>().toggle();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragEnd: (details) {
        if (details.primaryVelocity! > 0) {
          toggleContainer(context);
        }
      },
      child: Container(
        width: 312,
        // TODO : 높이 적응형으로 적용
        height: context.watch<CommonProvider>().bodyHeight,
        color: Colors.transparent,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: 195,
              height: double.infinity,
              color: Colors.blue,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(
                        color: Colors.black,
                        width: 2.0,
                      )),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ListTile(
                        tileColor: Colors.white,
                        title: Text('File 1'),
                        onTap: () {},
                      ),
                      ListTile(
                        tileColor: Colors.white,
                        title: Text('File 2'),
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              width: 100,
              color: Colors.transparent,
            )
          ],
        ),
      ),
    );
  }
}
