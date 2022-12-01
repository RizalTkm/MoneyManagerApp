import 'package:get/get.dart';
import 'package:money_manager_app/data/repositories/transactions/transactions_repo_imply.dart';

class TransactionpageController extends GetxController {
  final transrepoimply = Get.put(TransactionRepoImply());

  @override
  void onReady() {
    transrepoimply.transactionListToUI().then((value) => print(value));
    refresh();
    super.onReady();
  }
}
