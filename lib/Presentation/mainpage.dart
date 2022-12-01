import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:money_manager_app/Presentation/category/category_screen.dart';
import 'package:money_manager_app/Presentation/controllers/mainpage_controller.dart';
import 'package:money_manager_app/Presentation/transaction/transaction_screen.dart';
import 'package:money_manager_app/Presentation/transaction/widgets/appbar_widget.dart';
import 'package:money_manager_app/Presentation/transaction/widgets/bottom_navigation_widget.dart';
import 'package:money_manager_app/Presentation/transaction/widgets/floating_action_button.dart';
import 'package:money_manager_app/Presentation/page_routes/page_routes.dart';

final pageindexNotifier = ValueNotifier(0);

final pages = [TransactionSCreen(), CategoryScreen()];

class Mainpage extends GetWidget<Mainpagecontroller> {
  const Mainpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: AppbarWidget(
          title: 'Money manager',
        ),
      ),
      bottomNavigationBar: BottomNavigationWidget(),
      body: ValueListenableBuilder(
          valueListenable: pageindexNotifier,
          builder: (BuildContext context, int index, _) {
            return pages[index];
          }),
      floatingActionButton: FloatingActionButtonWidget(
        onpressed: () async {
          if (pageindexNotifier.value == 0) {
            print('add transaction');

            Get.toNamed(PageNames.addTransaction);
          } else {
            print('add category');

            // await controller.InsertDataToHive();
            controller.showPopUptoCreateCategory(context);
          }
        },
        iconData: Icons.add,
      ),
    );
  }
}
