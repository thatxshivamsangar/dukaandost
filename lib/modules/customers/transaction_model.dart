class TransactionModel {
  final int? id;
  final int customerId;
  final double amount;
  final String type; // "credit" or "debit"
  final String date;

  TransactionModel({
    this.id,
    required this.customerId,
    required this.amount,
    required this.type,
    required this.date,
  });

  factory TransactionModel.fromMap(Map<String, dynamic> map) {
    return TransactionModel(
      id: map['id'],
      customerId: map['customer_id'],
      amount: map['amount'],
      type: map['type'],
      date: map['date'],
    );
  }
}
