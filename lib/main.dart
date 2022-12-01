import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:money_manager_app/Presentation/bindings/mainpage_binding.dart';
import 'package:money_manager_app/Presentation/bindings/splash_bindings.dart';
import 'package:money_manager_app/Presentation/transaction/transaction_screen.dart';
import 'package:money_manager_app/Presentation/page_routes/page_routes.dart';
import 'package:money_manager_app/data/data_models/category/category_model.dart';
import 'package:money_manager_app/data/data_models/transactions/transactionModel.dart';
import 'package:money_manager_app/data/repositories/hive_register_class.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  if (!Hive.isAdapterRegistered(CategoryTypeAdapter().typeId)) {
    Hive.registerAdapter(CategoryTypeAdapter());
  }

  if (!Hive.isAdapterRegistered(CategoryModelAdapter().typeId)) {
    Hive.registerAdapter(CategoryModelAdapter());
  }
  if (!Hive.isAdapterRegistered(TransactionModelAdapter().typeId)) {
    Hive.registerAdapter(TransactionModelAdapter());
  }

  runApp(const NewApp());
}

class NewApp extends StatelessWidget {
  const NewApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.light),
      darkTheme: ThemeData(brightness: Brightness.dark),
      themeMode: ThemeMode.light,
      initialRoute: PageNames.splash,
      initialBinding: MainpageBinding(),
      getPages: PageRoutes.pages,
    );
  }
}
