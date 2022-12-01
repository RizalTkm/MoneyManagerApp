import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:money_manager_app/data/data_models/category/category_model.dart';
import 'package:money_manager_app/data/data_models/transactions/transactionModel.dart';
import 'package:money_manager_app/data/repositories/hive_repository_imply.dart';
import 'package:money_manager_app/data/repositories/transactions/transactions_repo_imply.dart';
import 'package:money_manager_app/domain/repositories/tranaction_repo/transactions_repository.dart';

class AddTransactionPageController extends GetxController {
  final categorydbfunctionimply = CategoryDbrepositoryimply();
  final transactionFunctionsImply = TransactionRepoImply();

  Rx<DateTime> selectedDate = DateTime.now().obs;

  final currentlySelectedType = CategoryType.income.obs;

  final selectedDropDownValue = Rxn<String>();
  final selectedItemFromCategory = Rxn<CategoryModel>();

  final purposeTextController = TextEditingController();
  final amountTextcontroller = TextEditingController();

  Future<bool> addTransaction() async {
    if (purposeTextController.text.isNotEmpty &&
        amountTextcontroller.text.isNotEmpty) {
      final parsedAmount = double.tryParse(amountTextcontroller.text);

      final transactionData = TransactionModel(
          purpose: purposeTextController.text,
          amount: parsedAmount,
          dateTime: selectedDate.value,
          categoryType: currentlySelectedType.value,
          category: selectedItemFromCategory.value!);

      await transactionFunctionsImply.addTransaction(transactionData);

      purposeTextController.clear();
      amountTextcontroller.clear();

      return true;
    } else {
      Get.snackbar('Error', 'Field cannot be empty');
      return false;
    }
  }
}
