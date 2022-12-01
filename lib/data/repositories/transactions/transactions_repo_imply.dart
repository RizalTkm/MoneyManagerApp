import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:money_manager_app/data/data_models/category/category_model.dart';
import 'package:money_manager_app/data/data_models/transactions/transactionModel.dart';
import 'package:money_manager_app/domain/repositories/tranaction_repo/transactions_repository.dart';

final transactionDatabaseName = 'transaction_DB_name';

class TransactionRepoImply implements TranasactionRepository {
  TransactionRepoImply._internal();

  static TransactionRepoImply instance = TransactionRepoImply._internal();

  factory TransactionRepoImply() {
    return instance;
  }

  final transactionDataList = RxList<TransactionModel>([]);

  @override
  Future<void> addTransaction(TransactionModel transactiondata) async {
    final transactionDB =
        await Hive.openBox<TransactionModel>(transactionDatabaseName);

    transactionDB.put(transactiondata.id, transactiondata);

    transactionListToUI();
  }

  @override
  Future<List<TransactionModel>> getTransaction() async {
    final transactionDB =
        await Hive.openBox<TransactionModel>(transactionDatabaseName);

    return transactionDB.values.toList();
  }

  @override
  Future<List<TransactionModel>> transactionListToUI() async {
    final allTransaction = await getTransaction();

    allTransaction
        .sort((first, second) => second.dateTime!.compareTo(first.dateTime!));
    transactionDataList.value.clear();

    transactionDataList.value.addAll(allTransaction);
    transactionDataList.refresh();

    return allTransaction;
  }

  @override
  Future<void> deleteTransaction(String transId) async {
    final transactionDB =
        await Hive.openBox<TransactionModel>(transactionDatabaseName);

    transactionDB.delete(transId);
    transactionListToUI();
  }
}
