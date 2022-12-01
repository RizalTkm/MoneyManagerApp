import 'package:flutter/material.dart';
import 'package:money_manager_app/data/repositories/hive_repository_imply.dart';

class ExpenseCardWidget extends StatelessWidget {
  const ExpenseCardWidget(
      {super.key, required this.title, required this.categoryId});

  final String title;
  final String categoryId;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      margin: EdgeInsets.all(10),
      child: ListTile(
          title: Text(title),
          trailing: IconButton(
              onPressed: () {
                CategoryDbrepositoryimply.instance.deletecategory(categoryId);
              },
              icon: Icon(Icons.delete))),
    );
  }
}
