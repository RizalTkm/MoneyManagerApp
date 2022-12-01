import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:money_manager_app/Presentation/category/expense_page/expense_page.dart';
import 'package:money_manager_app/Presentation/category/income_page/income_page.dart';
import 'package:money_manager_app/data/data_models/category/category_model.dart';
import 'package:money_manager_app/domain/repositories/hive_repository.dart';

const categoryDbName = 'category db name';

class CategoryDbrepositoryimply implements CategoryDbrepository {
  CategoryDbrepositoryimply._internal();

  static CategoryDbrepositoryimply instance =
      CategoryDbrepositoryimply._internal();

  factory CategoryDbrepositoryimply() {
    return instance;
  }

  final incomecategoryList = RxList<CategoryModel>([]);
  final expenseCategoryList = RxList<CategoryModel>([]);

  @override
  Future<void> addcategory(CategoryModel categorydata) async {
    final categorydb = await Hive.openBox<CategoryModel>(categoryDbName);

    await categorydb.put(categorydata.id, categorydata);
    refreshUI();
  }

  @override
  Future<List<CategoryModel>> getCategorydata() async {
    final categorydb = await Hive.openBox<CategoryModel>(categoryDbName);

    return categorydb.values.toList();
  }

  @override
  Future<List<CategoryModel>> refreshUI() async {
    final allcategories = await getCategorydata();

    incomecategoryList.clear();
    expenseCategoryList.clear();

    Future.forEach(allcategories, (CategoryModel category) {
      if (category.type == CategoryType.income) {
        incomecategoryList.add(category);
      } else {
        expenseCategoryList.add(category);
      }
    });

    incomecategoryList.refresh();

    return allcategories;
  }

  @override
  Future<void> deletecategory(String categoryId) async {
    final categorydb = await Hive.openBox<CategoryModel>(categoryDbName);

    await categorydb.delete(categoryId);

    refreshUI();
  }
}
