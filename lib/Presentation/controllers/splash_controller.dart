import 'package:get/get.dart';
import 'package:money_manager_app/Presentation/page_routes/page_routes.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    Future.delayed(
        const Duration(seconds: 3), () => Get.offNamed(PageNames.mainpage));
    super.onInit();
  }
}
