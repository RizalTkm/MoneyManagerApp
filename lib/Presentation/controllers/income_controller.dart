import 'package:get/get.dart';
import 'package:money_manager_app/data/repositories/hive_repository_imply.dart';

class IncomePageController extends GetxController {
  final categorydbrepoimply = Get.put(CategoryDbrepositoryimply);

  final categorydbfunctionimply = CategoryDbrepositoryimply();
}
