import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:money_manager_app/Presentation/controllers/splash_controller.dart';
import 'package:money_manager_app/core/constants.dart';
import 'package:money_manager_app/core/spaces.dart';
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
          CircleAvatar(
            radius: 55,
            backgroundColor: Colors.transparent,
            child: ClipOval(
              child: Image.asset(
                'assets/images/1024.png',
              ),
            ),
          ),
          Spaces.Kheight10,
          Text('Cent.',
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

//  CC
//  keytool -genkey -v -keystore \upload-keystore.jks -storetype JKS -keyalg RSA -keysize 2048 -validity 10000 -alias upload
//  D:\android studio\jre\bin\java
// \D:\android studio\jre\bin\keytool -genkey -v -keystore D:\flutter_projects\flutter_project_keys\upload-keystore.jks -storetype JKS -keyalg RSA -keysize 2048 -validity 10000 -alias upload
// rizal@1996