import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:money_manager_app/Presentation/category/widgets/expense_card_widget.dart';
import 'package:money_manager_app/Presentation/controllers/category_controller.dart';
import 'package:money_manager_app/Presentation/controllers/expense_controller.dart';
import 'package:money_manager_app/core/spaces.dart';

class ExpensePage extends StatelessWidget {
  const ExpensePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: CategoryController(),
        builder: (expensecontroller) {
          final categoryDbList =
              expensecontroller.categorydbfunctionimply.expenseCategoryList;
          return Obx(() => ListView.separated(
                separatorBuilder: (context, index) => Spaces.Kheight10,
                itemCount: categoryDbList.value.length,
                itemBuilder: (context, index) {
                  return ExpenseCardWidget(
                    title: categoryDbList.value[index].name,
                    categoryId: categoryDbList.value[index].id,
                  );
                },
              ));
        });
  }
}
