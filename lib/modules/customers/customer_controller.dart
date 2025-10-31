import 'package:get/get.dart';
import 'package:dukan_dost/modules/customers/transaction_model.dart';
import '../../core/db.dart';
import 'customer_model.dart';
import 'package:intl/intl.dart';

class CustomersController extends GetxController {
  RxList<Customer> customers = <Customer>[].obs;
  RxList<TransactionModel> transactions = <TransactionModel>[].obs;

  // Fetch transactions for selected customer
  Future<void> fetchTransactions(int customerId) async {
    final db = await AppDB.database;
    final data = await db.query(
      "transactions",
      where: "customer_id = ?",
      whereArgs: [customerId],
      orderBy: "id DESC",
    );
    transactions.value = data.map((e) => TransactionModel.fromMap(e)).toList();
  }

  Future<void> addTransaction(int customerId, double amount, String type) async {
    final db = await AppDB.database;

    String date = DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());

    await db.insert("transactions", {
      "customer_id": customerId,
      "amount": amount,
      "type": type,
      "date": date,
    });

    // Reload customer details
    await getCustomerTransactions(customerId);
  }

  // RxList transactions = [].obs;

  Future<void> getCustomerTransactions(int customerId) async {
    final db = await AppDB.database;
    final data = await db.query(
      "transactions",
      where: "customer_id = ?",
      whereArgs: [customerId],
      orderBy: "date DESC",
    );
    transactions.value = data.map((e) => TransactionModel.fromMap(e)).toList();
  }

  double getBalance() {
    double credit = transactions
        .where((t) => t.type == 'credit')
        .fold(0.0, (sum, t) => sum + t.amount);
    double debit = transactions
        .where((t) => t.type == 'debit')
        .fold(0.0, (sum, t) => sum + t.amount);
    return credit - debit;
  }




  // Future<void> addTransaction(int customerId, double amount, String type) async {
  //   final db = await AppDB.database;
  //   await db.insert("transactions", {
  //     "customer_id": customerId,
  //     "amount": amount,
  //     "type": type,
  //     "date": DateTime.now().toString(),
  //   });
  //   fetchTransactions(customerId);
  // }

  double calculateBalance(int customerId) {
    double credit = 0;
    double debit = 0;

    for (var t in transactions) {
      if (t.type == "credit") credit += t.amount;
      else debit += t.amount;
    }

    return credit - debit;
  }

  @override
  void onInit() {
    super.onInit();
    fetchCustomers();
  }

  Future<void> fetchCustomers() async {
    final db = await AppDB.database;
    final data = await db.query("customers");
    customers.value = data.map((e) => Customer.fromMap(e)).toList();
  }

  Future<void> addCustomer(String name, String? phone) async {
    final db = await AppDB.database;
    await db.insert("customers", {'name': name, 'phone': phone});
    fetchCustomers();
  }

}
