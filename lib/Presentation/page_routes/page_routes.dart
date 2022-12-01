import 'package:get/get.dart';
import 'package:money_manager_app/Presentation/bindings/addTransactionBinding.dart';
import 'package:money_manager_app/Presentation/bindings/mainpage_binding.dart';
import 'package:money_manager_app/Presentation/bindings/splash_bindings.dart';
import 'package:money_manager_app/Presentation/category/category_screen.dart';
import 'package:money_manager_app/Presentation/transaction/add_transaction_screen.dart';
import 'package:money_manager_app/Presentation/transaction/transaction_screen.dart';
import 'package:money_manager_app/Presentation/mainpage.dart';
import 'package:money_manager_app/Presentation/splash_page/splash_screen.dart';

class PageNames {
  static const splash = '/splash';
  static const mainpage = '/mainpage';
  static const transaction = '/transaction';
  static const category = '/category';
  static const addTransaction = '/add_transaction';
}

class PageRoutes {
  static final pages = [
    GetPage(
        name: PageNames.splash,
        page: () => SPlashScreen(),
        binding: SplashBindings()),
    GetPage(
        name: PageNames.mainpage,
        page: () => Mainpage(),
        binding: MainpageBinding()),
    GetPage(name: PageNames.transaction, page: () => TransactionSCreen()),
    GetPage(
      name: PageNames.category,
      page: () => CategoryScreen(),
    ),
    GetPage(
        name: PageNames.addTransaction,
        page: () => AddTransactionScreen(),
        binding: AddTransactionBinding())
  ];
}
