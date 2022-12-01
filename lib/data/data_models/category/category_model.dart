import 'package:hive_flutter/hive_flutter.dart';
part 'category_model.g.dart';

@HiveType(typeId: 2)
enum CategoryType {
  @HiveField(0)
  income,

  @HiveField(1)
  expense,
}

@HiveType(typeId: 1)
class CategoryModel {
  @HiveField(0)
  String id;

  @HiveField(1)
  String name;

  @HiveField(2)
  bool isdeleted;

  @HiveField(3)
  CategoryType type;

  CategoryModel(
      {required this.id,
      required this.name,
      required this.type,
      this.isdeleted = false});

  @override
  String toString() {
    return ' {$id, $name, $type}';
  }
}
