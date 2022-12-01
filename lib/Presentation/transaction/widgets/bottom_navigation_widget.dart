import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:money_manager_app/Presentation/mainpage.dart';
import 'package:money_manager_app/core/theme_data.dart';

class BottomNavigationWidget extends StatelessWidget {
  const BottomNavigationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: pageindexNotifier,
        builder: (BuildContext context, int updatedindex, _) {
          return Container(
            height: 60,
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: splashGradient),
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30))),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30)),
              child: BottomNavigationBar(
                  selectedItemColor: Colors.white,
                  unselectedItemColor: Colors.grey.withOpacity(.7),
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  type: BottomNavigationBarType.fixed,
                  currentIndex: updatedindex,
                  onTap: (newindex) {
                    pageindexNotifier.value = newindex;
                  },
                  items: const [
                    BottomNavigationBarItem(
                        icon: Icon(Icons.home), label: 'Transactions'),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.category), label: 'Category'),
                  ]),
            ),
          );
        });
  }
}
