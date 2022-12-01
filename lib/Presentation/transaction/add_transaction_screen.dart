import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:money_manager_app/Presentation/controllers/addTransactionPage_controller.dart';
import 'package:money_manager_app/Presentation/page_routes/page_routes.dart';
import 'package:money_manager_app/Presentation/transaction/widgets/appbar_widget.dart';
import 'package:money_manager_app/core/spaces.dart';
import 'package:money_manager_app/core/theme_data.dart';
import 'package:money_manager_app/data/data_models/category/category_model.dart';
import 'package:money_manager_app/data/repositories/hive_repository_imply.dart';

class AddTransactionScreen extends GetWidget<AddTransactionPageController> {
  AddTransactionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Scaffold(
            appBar: const PreferredSize(
              preferredSize: Size.fromHeight(80),
              child: AppbarWidget(
                title: 'Add Transaction',
              ),
            ),
            body: SingleChildScrollView(
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 50, bottom: 30, left: 15, right: 15),
                  child: TextFormField(
                    controller: controller.purposeTextController,
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.travel_explore),
                        hintText: 'Purpose',
                        border: OutlineInputBorder()),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 30, left: 15, right: 15),
                  child: TextFormField(
                    controller: controller.amountTextcontroller,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.currency_rupee_sharp),
                        hintText: 'Amount',
                        border: OutlineInputBorder()),
                  ),
                ),
                TextButton.icon(
                    onPressed: () async {
                      final selectTempDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now()
                              .subtract(Duration(days: 365 * 100)),
                          lastDate: DateTime.now());

                      if (selectTempDate == null) {
                        return;
                      } else {
                        controller.selectedDate.value = selectTempDate;
                      }
                    },
                    icon: Icon(Icons.calendar_today),
                    label: Obx(() => Text(
                        controller.selectedDate.toString().split(' ').first))),
                Obx(
                  () => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          Radio(
                              value: CategoryType.income,
                              groupValue:
                                  controller.currentlySelectedType.value,
                              onChanged: (selectedvalue) {
                                controller.currentlySelectedType.value =
                                    selectedvalue!;
                                controller.selectedDropDownValue.value = null;
                              }),
                          const Text('Income')
                        ],
                      ),
                      Row(
                        children: [
                          Radio(
                              value: CategoryType.expense,
                              groupValue:
                                  controller.currentlySelectedType.value,
                              onChanged: (selectedvalue) {
                                controller.currentlySelectedType.value =
                                    selectedvalue!;

                                controller.selectedDropDownValue.value = null;
                              }),
                          const Text('Expense')
                        ],
                      ),
                    ],
                  ),
                ),
                Spaces.Kheight20,
                Obx(() => DropdownButton(
                      hint: Text('Select category'),
                      value: controller.selectedDropDownValue.value,
                      items: (controller.currentlySelectedType.value ==
                                  CategoryType.income
                              ? CategoryDbrepositoryimply
                                  .instance.incomecategoryList
                              : CategoryDbrepositoryimply
                                  .instance.expenseCategoryList)
                          .map((e) {
                        return DropdownMenuItem(
                          child: Text(e.name),
                          value: e.id,
                          onTap: () {
                            controller.selectedItemFromCategory.value = e;
                          },
                        );
                      }).toList(),
                      onChanged: (newvalue) {
                        print(newvalue);

                        controller.selectedDropDownValue.value = newvalue;
                      },
                    )),
                Spaces.Kheight20,
                Spaces.Kheight20,
                Container(
                  width: 150,
                  height: 50,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: splashGradient,
                          begin: Alignment.topRight,
                          end: Alignment.topLeft),
                      borderRadius: BorderRadius.circular(20)),
                  child: TextButton.icon(
                      onPressed: () async {
                        if (await controller.addTransaction()) {
                          Get.snackbar(
                              'Success', 'Transaction added successfully');

                          Get.offAllNamed(PageNames.mainpage);
                        }
                      },
                      icon: const Icon(
                        Icons.check_circle,
                        color: Colors.black,
                      ),
                      label: const Text(
                        'Submit',
                        style: TextStyle(color: Colors.black),
                      )),
                )
              ]),
            )));
  }
}
