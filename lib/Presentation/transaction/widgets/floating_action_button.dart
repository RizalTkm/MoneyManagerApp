import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:money_manager_app/core/theme_data.dart';

class FloatingActionButtonWidget extends StatelessWidget {
  FloatingActionButtonWidget(
      {super.key, required this.iconData, required this.onpressed});

  final VoidCallback onpressed;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onpressed,
      child: Container(
        height: 80,
        width: 80,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: splashGradient),
            shape: BoxShape.circle),
        child: Icon(iconData),
      ),
    );
  }
}
