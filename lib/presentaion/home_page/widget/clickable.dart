import 'package:flutter/material.dart';

class Clickable extends StatelessWidget {
  void Function() onClick;
  Widget child;

  Clickable({
    Key? key,
    required this.child,
    required this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Ink(
        child: child,
      ),
      splashColor: Colors.deepPurple,
    );
  }
}
