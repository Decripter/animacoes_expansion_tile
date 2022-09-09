import 'package:flutter/material.dart';

class MyExpansionTileState {
  final Color titleColor;
  final Color iconColor;
  final Color borderColor;
  final double iconRotation;
  final double childContainerSize;
  final bool isExpanded;

  MyExpansionTileState({
    required this.titleColor,
    required this.iconColor,
    required this.borderColor,
    required this.iconRotation,
    required this.childContainerSize,
    required this.isExpanded,
  });

  factory MyExpansionTileState.retracted() {
    return MyExpansionTileState(
      titleColor: Colors.black,
      iconColor: Colors.grey[600]!,
      borderColor: Colors.transparent,
      iconRotation: 0.0,
      childContainerSize: 58.0,
      isExpanded: false,
    );
  }
  factory MyExpansionTileState.expanded() {
    return MyExpansionTileState(
      titleColor: Colors.blueAccent,
      iconColor: Colors.blueAccent,
      borderColor: Colors.grey[300]!,
      iconRotation: 0.5,
      childContainerSize: 150.0,
      isExpanded: true,
    );
  }
}
