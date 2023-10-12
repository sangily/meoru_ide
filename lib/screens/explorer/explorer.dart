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
  double width = 190;

  _ExplorerWidget();

  void toggleContainer(BuildContext context) {
    context.read<ExplorerProvider>().toggle();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragEnd: (details) {
        if (context.read<ExplorerProvider>().isOpened) {
          if (details.primaryVelocity! < 0) {
            toggleContainer(context);
          }
        } else if (!context.read<ExplorerProvider>().isOpened) {
          if (details.primaryVelocity! > 0) {
            toggleContainer(context);
          }
        }
      },
      child: Container(
        width: context.read<ExplorerProvider>().isOpened ? context.watch<CommonProvider>().screenWidth : width + 100,
        // TODO : 높이 적응형으로 적용
        height: context.watch<CommonProvider>().bodyHeight,
        color: Colors.transparent,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: width,
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
              width: context.read<ExplorerProvider>().isOpened ? context.read<CommonProvider>().screenWidth - width : 100,
              color: Colors.transparent,
              child: GestureDetector(
                onTap: () => toggleContainer(context),
              ),
            )
          ],
        ),
      ),
    );
  }
}
