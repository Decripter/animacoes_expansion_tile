import 'package:flutter/material.dart';

class MyExpansionTileWidget extends StatefulWidget {
  final String title;
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
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              border: Border(
            top: BorderSide(
                color:
                    state.isExpanded ? Colors.grey[300]! : Colors.transparent),
            bottom: BorderSide(
                color:
                    state.isExpanded ? Colors.grey[300]! : Colors.transparent),
          )),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // ignore: prefer_const_constructors
              Padding(
                padding: const EdgeInsets.only(top: 50.0),
              ),
              AnimatedAlign(
                  duration: const Duration(milliseconds: 220),
                  alignment: Alignment.bottomCenter,
                  heightFactor: state.isExpanded ? 1 : 0,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: widget.children,
                  ))
            ],
          ),
        ),
        Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: GestureDetector(
              onTap: openCloseTile,
              child: Container(
                color: Colors.white,
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
                      child: Text(
                        widget.title,
                      ),
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
        ),
      ],
    );
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

class MyExpansionTileState {
  final Color titleColor;
  final Color iconColor;
  final double iconRotation;
  final double childContainerSize;
  final bool isExpanded;

  MyExpansionTileState({
    required this.titleColor,
    required this.iconColor,
    required this.iconRotation,
    required this.childContainerSize,
    required this.isExpanded,
  });

  factory MyExpansionTileState.retracted() {
    return MyExpansionTileState(
      titleColor: Colors.black,
      iconColor: Colors.grey[600]!,
      iconRotation: 0.0,
      childContainerSize: 58.0,
      isExpanded: false,
    );
  }
  factory MyExpansionTileState.expanded() {
    return MyExpansionTileState(
      titleColor: Colors.blueAccent,
      iconColor: Colors.blueAccent,
      iconRotation: 0.5,
      childContainerSize: 150.0,
      isExpanded: true,
    );
  }
}
