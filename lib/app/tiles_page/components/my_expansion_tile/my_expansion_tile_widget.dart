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

class _MyExpansionTileWidgetState extends State<MyExpansionTileWidget>
    with TickerProviderStateMixin {
//controller
  late final AnimationController controller;
//animations
  late Animation<double> iconRotationAnimation;
  late Animation<Color?> iconColorAnimation;
  late Animation<Color?> textColorAnimation;
  late Animation<Color?> borderColorAnimation;
  late Animation<double> childHeightFatorAnimation;

//state

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 350),
    );
    controller.addListener(() {
      setState(() {});
    });

    //animations initialization:
    //icon color
    iconColorAnimation = ColorTween(
      begin: MyExpansionTileState.retracted().iconColor,
      end: MyExpansionTileState.expanded().iconColor,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(
          0.5,
          1,
          curve: Curves.ease,
        ),
      ),
    );

    //icon rotation
    iconRotationAnimation = Tween<double>(
      begin: MyExpansionTileState.retracted().iconRotation,
      end: MyExpansionTileState.expanded().iconRotation,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(
          0.5,
          1,
          curve: Curves.ease,
        ),
      ),
    );

    //TextColor
    textColorAnimation = ColorTween(
      begin: MyExpansionTileState.retracted().titleColor,
      end: MyExpansionTileState.expanded().titleColor,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(
          0.5,
          1,
          curve: Curves.ease,
        ),
      ),
    );

    //child height
    childHeightFatorAnimation = Tween<double>(
      begin: MyExpansionTileState.retracted().iconRotation,
      end: MyExpansionTileState.expanded().iconRotation,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(
          0.5,
          1,
          curve: Curves.ease,
        ),
      ),
    );

    //borderColor
    borderColorAnimation = ColorTween(
      begin: MyExpansionTileState.retracted().borderColor,
      end: MyExpansionTileState.expanded().borderColor,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(
          0.5,
          1,
          curve: Curves.ease,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
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
                    DefaultTextStyle(
                      style: TextStyle(
                        fontSize: 16,
                        color: textColorAnimation.value,
                      ),
                      child: widget.title,
                    ),
                    RotationTransition(
                      turns: iconRotationAnimation,
                      child: Icon(
                        Icons.keyboard_arrow_down,
                        color: iconColorAnimation.value,
                      ),
                    ),
                  ]),
            ),
          ),
        ),
      ),
      Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: borderColorAnimation.value!),
            bottom: BorderSide(color: borderColorAnimation.value!),
          ),
        ),
        child: Align(
            alignment: Alignment.topCenter,
            heightFactor: childHeightFatorAnimation.value,
            child: Column(
              children: widget.children,
            )),
      ),
    ]);
  }

  void openCloseTile() {
    if (controller.isCompleted) {
      controller.reverse();
    } else {
      controller.forward();
    }
  }
}
