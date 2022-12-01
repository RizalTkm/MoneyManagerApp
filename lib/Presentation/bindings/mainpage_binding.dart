import 'package:get/get.dart';
import 'package:money_manager_app/Presentation/controllers/category_controller.dart';

import 'package:money_manager_app/Presentation/controllers/mainpage_controller.dart';
import 'package:money_manager_app/data/repositories/hive_repository_imply.dart';
import 'package:money_manager_app/data/repositories/transactions/transactions_repo_imply.dart';
import 'package:money_manager_app/domain/repositories/hive_repository.dart';
import 'package:money_manager_app/domain/repositories/tranaction_repo/transactions_repository.dart';

class MainpageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<CategoryDbrepository>(CategoryDbrepositoryimply());
    Get.put<TranasactionRepository>(TransactionRepoImply());
    Get.lazyPut(() => Mainpagecontroller(
        categoryDbrepository: Get.find(), transactionDbrepository: Get.find()));
  }
}
