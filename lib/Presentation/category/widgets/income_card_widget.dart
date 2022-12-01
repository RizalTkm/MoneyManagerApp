import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:money_manager_app/data/repositories/hive_repository_imply.dart';
import 'package:money_manager_app/domain/repositories/hive_repository.dart';

class IncomeCardWidget extends StatelessWidget {
  const IncomeCardWidget(
      {super.key, required this.title, required this.categoryid});

  final String title;
  final String categoryid;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      margin: EdgeInsets.all(10),
      child: ListTile(
          title: Text(title),
          trailing: IconButton(
              onPressed: () {
                CategoryDbrepositoryimply.instance.deletecategory(categoryid);
              },
              icon: Icon(Icons.delete))),
    );
  }
}
