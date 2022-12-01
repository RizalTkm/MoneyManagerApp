import 'package:hive_flutter/hive_flutter.dart';
import 'package:money_manager_app/data/data_models/category/category_model.dart';

class HiveAdapterRegister {
  void registercategoryAdapter() async {
    await Hive.initFlutter();

    if (!Hive.isAdapterRegistered(CategoryTypeAdapter().typeId)) {
      Hive.registerAdapter(CategoryTypeAdapter());
    }

    if (!Hive.isAdapterRegistered(CategoryModelAdapter().typeId)) {
      Hive.registerAdapter(CategoryModelAdapter());
    }
  }
}
