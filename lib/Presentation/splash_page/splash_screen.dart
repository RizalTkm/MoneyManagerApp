import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:money_manager_app/Presentation/controllers/splash_controller.dart';
import 'package:money_manager_app/core/constants.dart';
import 'package:money_manager_app/core/theme_data.dart';

class SPlashScreen extends GetWidget<SplashController> {
  const SPlashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: splashGradient,
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const CircleAvatar(
            backgroundColor: MoneyManagercolors.white,
            radius: 60,
            backgroundImage: AssetImage(
                'assets/images/1200px-Cartoon_Guy_Letting_Money_Fly.svg.png'),
          ),
          Text('Money Manager',
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .headline3
                  ?.copyWith(fontWeight: FontWeight.bold))
        ],
      ),
    ));
  }
}
