import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:money_manager_app/Presentation/category/expense_page/expense_page.dart';
import 'package:money_manager_app/Presentation/controllers/button_controller.dart';
import 'package:money_manager_app/Presentation/transaction/widgets/radiobutton_widget.dart';
import 'package:money_manager_app/core/decorated_text.dart';
import 'package:money_manager_app/core/spaces.dart';
import 'package:money_manager_app/data/data_models/category/category_model.dart';
import 'package:money_manager_app/data/repositories/hive_repository_imply.dart';
import 'package:money_manager_app/data/repositories/transactions/transactions_repo_imply.dart';
import 'package:money_manager_app/domain/repositories/hive_repository.dart';
import 'package:money_manager_app/domain/repositories/tranaction_repo/transactions_repository.dart';

class Mainpagecontroller extends GetxController {
  final CategoryDbrepository categoryDbrepository;
  final TranasactionRepository transactionDbrepository;

  final categoryNameController = TextEditingController();

  final buttoncontroller = Get.put(buttonController());

  final transrepoimply = Get.put(TransactionRepoImply());

  Mainpagecontroller(
      {required this.categoryDbrepository,
      required this.transactionDbrepository});

  // @override
  // void onInit() {
  //   transactionDbrepository.transactionListToUI().then((value) => print(value));
  //   super.onInit();
  // }

  void showPopUptoCreateCategory(BuildContext context) {
    showDialog(
        context: context,
        builder: (ctx) {
          return SimpleDialog(
            title: DecoratedText(label: 'Add Category'),
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: categoryNameController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: 'Category name'),
                ),
              ),
              Row(
                children: [
                  SizedBox(
                    width: 40,
                  ),
                  RadioButtonWidget(type: CategoryType.income, label: 'Income'),
                  RadioButtonWidget(
                      type: CategoryType.expense, label: 'Expense')
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: ElevatedButton(
                    onPressed: () {
                      final categoryname = categoryNameController.text;
                      final categoryType =
                          buttoncontroller.categorytypenotifier.value;
                      final dataToAdd = CategoryModel(
                        id: DateTime.now().millisecondsSinceEpoch.toString(),
                        name: categoryname,
                        type: categoryType,
                      );
                      if (categoryname.isEmpty) {
                        Get.snackbar(
                            'Error', "You can't add an empty Category");
                      } else {
                        categoryDbrepository.addcategory(dataToAdd);
                        categoryDbrepository.refreshUI();
                        refresh();
                        categoryNameController.clear();
                        Navigator.of(ctx).pop();
                      }
                    },
                    child: Text('Add')),
              )
            ],
          );
        });
  }
}
