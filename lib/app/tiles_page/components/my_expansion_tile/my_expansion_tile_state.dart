import 'package:flutter/material.dart';

class MyExpansionTileState {
  final Color titleColor;
  final Color iconColor;
  final Color borderColor;
  final double iconRotation;
  final double childHeightFactor;

  MyExpansionTileState({
    required this.titleColor,
    required this.iconColor,
    required this.borderColor,
    required this.iconRotation,
    required this.childHeightFactor,
  });

  factory MyExpansionTileState.retracted() {
    return MyExpansionTileState(
      titleColor: Colors.black,
      iconColor: Colors.grey[600]!,
      borderColor: Colors.transparent,
      iconRotation: 0.0,
      childHeightFactor: 0.0,
    );
  }
  factory MyExpansionTileState.expanded() {
    return MyExpansionTileState(
      titleColor: Colors.blueAccent,
      iconColor: Colors.blueAccent,
      borderColor: Colors.grey[300]!,
      iconRotation: 0.5,
      childHeightFactor: 1,
    );
  }
}
