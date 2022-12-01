import 'package:get/get.dart';
import 'package:money_manager_app/Presentation/controllers/splash_controller.dart';

class SplashBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashController());
  }
}
