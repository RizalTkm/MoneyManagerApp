import 'package:money_manager_app/data/data_models/category/category_model.dart';
import 'package:money_manager_app/data/data_models/transactions/transactionModel.dart';

abstract class TranasactionRepository {
  Future<void> addTransaction(TransactionModel transactiondata);
  Future<List<TransactionModel>> getTransaction();

  Future<List<TransactionModel>> transactionListToUI();

  Future<void> deleteTransaction(String transId);
}
