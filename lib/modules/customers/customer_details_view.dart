import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/theme.dart';
import 'customer_controller.dart';
import 'customer_model.dart';

class CustomerDetailsView extends StatelessWidget {
  final Customer customer;
  const CustomerDetailsView({super.key, required this.customer});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CustomersController>();
    controller.fetchTransactions(customer.id!);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          showAddTransactionDialog(context, controller, customer.id);
        },
      ),
      appBar: AppBar(title: Text(customer.name)),
      body: Obx(() {
        final balance = controller.calculateBalance(customer.id!);

        return Column(
          children: [
            const SizedBox(height: 12),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              decoration: BoxDecoration(
                color:
                    balance >= 0 ? Colors.green.shade700 : Colors.red.shade700,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                      color: (balance >= 0 ? Colors.green : Colors.red)
                          .withOpacity(0.14),
                      blurRadius: 14,
                      spreadRadius: 2)
                ],
              ),
              child: Text(
                balance >= 0
                    ? 'Customer owes ₹${balance.toStringAsFixed(0)}'
                    : 'You owe ₹${balance.abs().toStringAsFixed(0)}',
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.w600),
              ),
            ),

            // Text(
            //   balance >= 0
            //       ? "Customer owes you ₹${balance.toStringAsFixed(0)}"
            //       : "You owe customer ₹${balance.abs().toStringAsFixed(0)}",
            //   style: TextStyle(
            //     fontSize: 20,
            //     fontWeight: FontWeight.bold,
            //     color: balance >= 0 ? Colors.green : Colors.red,
            //   ),
            // ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: controller.transactions.length,
                itemBuilder: (_, index) {
                  final t = controller.transactions[index];
                  return ListTile(
                    leading: Icon(t.type == "credit" ? Icons.add : Icons.remove,
                        color: t.type == "credit" ? Colors.green : Colors.red),
                    title: Text("${t.type} ₹${t.amount}"),
                    subtitle: Text(t.date),
                  );
                },
              ),
            ),
            Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppTheme.accent),
                    onPressed: () =>
                        _addAmount(controller, customer.id!, "credit"),
                    child: const Text("Add Credit",
                        style: TextStyle(color: Colors.black)),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.red),
                    onPressed: () =>
                        _addAmount(controller, customer.id!, "debit"),
                    child: const Text("Add Debit"),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
              ],
            ),
            const SizedBox(height: 30),
          ],
        );
      }),
    );
  }

  void _addAmount(CustomersController controller, int id, String type) {
    final amountCtrl = TextEditingController();
    Get.defaultDialog(
      title: type == "credit" ? "Credit Amount" : "Debit Amount",
      content: TextField(
        controller: amountCtrl,
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(hintText: "Enter amount"),
      ),
      textConfirm: "Save",
      onConfirm: () {
        controller.addTransaction(id, double.parse(amountCtrl.text), type);
        Get.back();
      },
    );
  }

  void showAddTransactionDialog(
      BuildContext context, CustomersController controller, customerId) {
    final amountController = TextEditingController();
    String type = "credit";

    Get.defaultDialog(
      title: "Add Transaction",
      content: Column(
        children: [
          TextField(
            controller: amountController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: "Amount"),
          ),
          DropdownButton<String>(
            value: type,
            items: const [
              DropdownMenuItem(value: "credit", child: Text("Credit (+)")),
              DropdownMenuItem(value: "debit", child: Text("Debit (-)")),
            ],
            onChanged: (value) {
              type = value!;
            },
          ),
        ],
      ),
      textConfirm: "Save",
      onConfirm: () {
        controller.addTransaction(
            customerId, double.parse(amountController.text), type);
        Get.back();
      },
    );
  }
}
