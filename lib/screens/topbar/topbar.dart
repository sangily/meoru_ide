import 'package:flutter/material.dart';
import 'util/onMenuPressed.dart';
import 'util/onTabPressed.dart';

class TopBarWidget extends StatelessWidget implements PreferredSize {
  final List<String> openFiles;
  final _onMenuPressed = onMenuPressed;
  final _onTabPressed = onTabPressed(0);

  TopBarWidget({
    super.key,
    required this.openFiles,
  });

  // TODO : 흰색 테두리 적용
  @override
  Widget get child => AppBar(
        backgroundColor: Color(0xff131314),
        elevation: 1,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Leading button
            SizedBox(
              width: kToolbarHeight,
              child: InkWell(
                onTap: _onMenuPressed,
                child: Padding(
                  padding: EdgeInsets.all(2.0),
                  child: Icon(Icons.menu, size: kToolbarHeight * 0.7),
                ),
              ),
            ),
            Container(
              width: 12,
            ),
            // Central compartment with tabs
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    left: BorderSide(
                      color: Color(0x457C7C7F), // 흰색 테두리 색상
                      width: 1.0, // 흰색 테두리 두께
                    ),
                    right: BorderSide(
                      color: Color(0x457C7C7F), // 흰색 테두리 색상
                      width: 1.0, // 흰색 테두리 두께
                    ),
                  ),
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      for (int i = 0; i < openFiles.length; i++)
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: InkWell(
                            onTap: () => _onTabPressed(i),
                            child: Container(
                              padding: EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: i == 0 ? Colors.blue : Colors.grey,
                                  // Active tab color
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    openFiles[i],
                                    style: TextStyle(
                                      color: i == 0 ? Colors.blue : Colors.grey,
                                      // Active tab text color
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(width: 5),
                                  InkWell(
                                    onTap: () {
                                      // Add functionality to close tabs
                                    },
                                    child: Icon(Icons.close, size: 21),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),

            SizedBox(
              width: kToolbarHeight * 2.2, // Fixed width
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    iconSize: kToolbarHeight * 0.7,
                    icon: Icon(Icons.save),
                    onPressed: () {
                      // Add functionality to save file
                    },
                  ),
                  IconButton(
                    iconSize: kToolbarHeight * 0.7,
                    icon: Icon(Icons.play_arrow),
                    onPressed: () {
                      // Add functionality to run file
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      );

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize,
      child: child,
    );
  }
}
