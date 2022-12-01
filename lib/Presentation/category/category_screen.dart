import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:money_manager_app/Presentation/category/expense_page/expense_page.dart';
import 'package:money_manager_app/Presentation/category/income_page/income_page.dart';
import 'package:money_manager_app/Presentation/controllers/category_controller.dart';
import 'package:money_manager_app/core/theme_data.dart';
import 'package:money_manager_app/data/repositories/hive_repository_imply.dart';
import 'package:money_manager_app/domain/repositories/hive_repository.dart';

class CategoryScreen extends StatelessWidget {
  CategoryScreen({super.key});

  final mytabcontroller = Get.put(CategoryController());
  // final categorycontroller =
  //     Get.put<CategoryDbrepository>(CategoryDbrepositoryimply());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        TabBar(
            controller: mytabcontroller.tabController,
            labelColor: MoneyManagercolors.dark,
            unselectedLabelColor: MoneyManagercolors.grey,
            tabs: const [
              Tab(
                text: 'Income',
              ),
              Tab(
                text: 'Expense',
              )
            ]),
        Expanded(
          child: TabBarView(
              controller: mytabcontroller.tabController,
              children: [IncomePage(), ExpensePage()]),
        )
      ],
    ));
  }
}
