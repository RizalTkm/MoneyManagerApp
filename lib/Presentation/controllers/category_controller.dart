import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_manager_app/data/repositories/hive_repository_imply.dart';
import 'package:money_manager_app/domain/repositories/hive_repository.dart';

class CategoryController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void onInit() {
    tabController = TabController(length: 2, vsync: this);

    super.onInit();
  }

  @override
  void onReady() {
    CategoryDbrepositoryimply.instance
        .refreshUI()
        .then((value) => print(value.toString()));
    refresh();

    super.onReady();
  }

  final categorydbrepoimply = Get.put(CategoryDbrepositoryimply);

  final categorydbfunctionimply = CategoryDbrepositoryimply();
}
