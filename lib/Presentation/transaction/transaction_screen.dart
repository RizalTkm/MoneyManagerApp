import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:money_manager_app/Presentation/controllers/addTransactionPage_controller.dart';
import 'package:money_manager_app/Presentation/controllers/mainpage_controller.dart';
import 'package:money_manager_app/Presentation/controllers/transaction_page_controller.dart';
import 'package:money_manager_app/core/decorated_text.dart';
import 'package:money_manager_app/core/listTileText.dart';
import 'package:money_manager_app/core/spaces.dart';
import 'package:money_manager_app/core/theme_data.dart';
import 'package:money_manager_app/data/data_models/category/category_model.dart';
import 'package:money_manager_app/data/repositories/hive_repository_imply.dart';
import 'package:money_manager_app/data/repositories/transactions/transactions_repo_imply.dart';

class TransactionSCreen extends StatelessWidget {
  TransactionSCreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GetBuilder<TransactionpageController>(
            init: TransactionpageController(),
            builder: (controller) {
              final transactiondataList =
                  controller.transrepoimply.transactionDataList;
              return Obx(() => ListView.separated(
                    separatorBuilder: (context, index) => Spaces.Kheight10,
                    itemCount: transactiondataList.length,
                    itemBuilder: (context, index) {
                      final selectedDate = transactiondataList[index].dateTime;
                      final parsedDate =
                          DateFormat.yMMMMd().format(selectedDate!).split(' ');
                      final month = parsedDate.elementAt(0).substring(0, 3);
                      final day =
                          parsedDate.elementAt(1).split(',').elementAt(0);
                      final amount =
                          transactiondataList[index].amount.toString();

                      print(parsedDate);

                      return Slidable(
                        startActionPane:
                            ActionPane(motion: ScrollMotion(), children: [
                          SlidableAction(
                            onPressed: (context) {
                              controller.transrepoimply.deleteTransaction(
                                  transactiondataList[index].id!);
                              transactiondataList.refresh();
                            },
                            icon: Icons.delete,
                            label: 'Delete',
                            backgroundColor: Colors.grey.withOpacity(.001),
                          )
                        ]),
                        child: Container(
                          height: 150,
                          width: 500,
                          child: Card(
                              shadowColor: Colors.black,
                              elevation: 5,
                              margin: EdgeInsets.all(10),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: CircleAvatar(
                                      backgroundColor:
                                          transactiondataList[index]
                                                      .categoryType ==
                                                  CategoryType.income
                                              ? Colors.green
                                              : Color.fromARGB(
                                                  255, 240, 16, 46),
                                      radius: 50,
                                      child: Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Column(
                                          children: [
                                            DecoratedText(label: '$day'),
                                            DecoratedText(label: '$month')
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Spaces.Kwidth10,
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  color: Colors.blueGrey
                                                      .withOpacity(.6),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              width: 230,
                                              height: 50,
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10),
                                                child: SpecialText(
                                                    label: 'RS:  $amount'),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Spaces.Kheight10,
                                      Text(
                                        transactiondataList[index].purpose!,
                                        style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  )
                                ],
                              )),
                        ),
                      );
                    },
                  ));
            }));
  }
}
