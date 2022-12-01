import 'package:money_manager_app/data/data_models/category/category_model.dart';

abstract class CategoryDbrepository {
  Future<void> addcategory(CategoryModel categorydata);

  Future<List<CategoryModel>> getCategorydata();

  Future<List<CategoryModel>> refreshUI();

  Future<void> deletecategory(String id);
}
