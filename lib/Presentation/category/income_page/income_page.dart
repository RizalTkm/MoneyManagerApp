import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_manager_app/Presentation/category/widgets/income_card_widget.dart';
import 'package:money_manager_app/Presentation/controllers/category_controller.dart';
import 'package:money_manager_app/Presentation/controllers/income_controller.dart';

import 'package:money_manager_app/Presentation/controllers/mainpage_controller.dart';
import 'package:money_manager_app/core/spaces.dart';

class IncomePage extends StatelessWidget {
  IncomePage({super.key});

  // final incomecontroller = Get.put(IncomePageController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CategoryController>(
        init: CategoryController(),
        builder: (controller) {
          final incomeCategoryDataList =
              controller.categorydbfunctionimply.incomecategoryList;
          return Obx(() => ListView.separated(
                separatorBuilder: (context, index) => Spaces.Kheight10,
                itemCount: incomeCategoryDataList.value.length,
                itemBuilder: (context, index) {
                  return IncomeCardWidget(
                    title: incomeCategoryDataList.value[index].name,
                    categoryid: incomeCategoryDataList.value[index].id,
                  );
                },
              ));
        });
  }
}
