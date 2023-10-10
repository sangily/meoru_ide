import 'package:flutter/material.dart';
import 'util/onMenuPressed.dart' as mp;
import 'util/onTabPressed.dart' as tp;

class TopBarWidget extends StatelessWidget implements PreferredSize {
  final List<String> openFiles;
  final onMenuPressed = mp.onMenuPressed;
  final onTabPressed = tp.onTabPressed(0);

  TopBarWidget({
    super.key,
    required this.openFiles,
  });

  @override
  Widget get child => AppBar(
    backgroundColor: Colors.black,
    elevation: 0,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Leading button
        SizedBox(
          width: kToolbarHeight,
          child: InkWell(
            onTap: onMenuPressed,
            child: Padding(
              padding: EdgeInsets.all(2.0),
              child: Icon(Icons.menu, size: kToolbarHeight * 0.7),
            ),
          ),
        ),
        // Central compartment with tabs
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                for (int i = 0; i < openFiles.length; i++)
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: InkWell(
                      onTap: () => onTabPressed(i),
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
                            SizedBox(width: 8),
                            InkWell(
                              onTap: () {
                                // Add functionality to close tabs
                              },
                              child: Icon(Icons.close, size: 18),
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

        SizedBox(
          width: kToolbarHeight * 2, // Fixed width
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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