import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/dark_card.dart';
import 'inventory_controller.dart';

class InventoryView extends StatelessWidget {
  const InventoryView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(InventoryController());

    return Scaffold(
      appBar: AppBar(title: const Text("Inventory")),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showAddItemDialog(controller),
        child: const Icon(Icons.add),
      ),
      body: Obx(() => ListView.builder(
            itemCount: controller.items.length,
            itemBuilder: (context, index) {
              final item = controller.items[index];
              return DarkCard(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(item['name'],
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600)),
                        Text("Qty: ${item['quantity']}  |  ₹ ${item['price']}",
                            style: const TextStyle(color: Colors.grey)),
                      ],
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete, color: Color(0xFFFFD700)),
                      onPressed: () => controller.deleteItem(item['id']),
                    )
                  ],
                ),
              );
            },
          )),
    );
  }

  void showAddItemDialog(InventoryController controller) {
    final name = TextEditingController();
    final qty = TextEditingController();
    final price = TextEditingController();

    Get.defaultDialog(
      title: "Add Item",
      content: Column(children: [
        TextField(
            controller: name,
            decoration: const InputDecoration(labelText: "Name")),
        TextField(
            controller: qty,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: "Quantity")),
        TextField(
            controller: price,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: "Price")),
      ]),
      textConfirm: "Save",
      onConfirm: () {
        controller.addItem(
            name.text, int.parse(qty.text), double.parse(price.text));
        Get.back();
      },
    );
  }

  void showUpdateQtyDialog(InventoryController controller, item) {
    final qty = TextEditingController(text: item['quantity'].toString());

    Get.defaultDialog(
      title: "Update Quantity",
      content: TextField(controller: qty, keyboardType: TextInputType.number),
      textConfirm: "Update",
      onConfirm: () {
        controller.updateItem(item['id'], int.parse(qty.text));
        Get.back();
      },
    );
  }
}
