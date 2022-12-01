import 'package:get/get.dart';
import 'package:money_manager_app/Presentation/controllers/addTransactionPage_controller.dart';

class AddTransactionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddTransactionPageController());
  }
}
