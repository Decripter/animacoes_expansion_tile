import 'package:flutter/material.dart';

import 'my_expansion_tile_state.dart';

class MyExpansionTileWidget extends StatefulWidget {
  final Widget title;
  final List<Widget> children;
  const MyExpansionTileWidget({
    super.key,
    required this.title,
    required this.children,
  });

  @override
  State<MyExpansionTileWidget> createState() => _MyExpansionTileWidgetState();
}

class _MyExpansionTileWidgetState extends State<MyExpansionTileWidget> {
  MyExpansionTileState state = MyExpansionTileState.retracted();

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            border: Border(
          top: BorderSide(color: state.borderColor),
          bottom: BorderSide(color: state.borderColor),
        )),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // ignore: prefer_const_constructors
                Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                ),
                ClipRect(
                  child: AnimatedAlign(
                      duration: const Duration(milliseconds: 220),
                      alignment: Alignment.bottomCenter,
                      heightFactor: state.isExpanded ? 1 : 0,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: widget.children,
                      )),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: GestureDetector(
                onTap: openCloseTile,
                child: Container(
                  color: Colors.transparent,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AnimatedDefaultTextStyle(
                        style: TextStyle(
                          fontSize: 16,
                          color: state.titleColor,
                        ),
                        duration: const Duration(milliseconds: 400),
                        child: widget.title,
                      ),
                      AnimatedRotation(
                        duration: const Duration(milliseconds: 200),
                        turns: state.iconRotation,
                        child: Icon(
                          Icons.keyboard_arrow_down,
                          color: state.iconColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }

  void openCloseTile() {
    setState(() {
      if (state.isExpanded) {
        state = MyExpansionTileState.retracted();
      } else {
        state = MyExpansionTileState.expanded();
      }
    });
  }
}
