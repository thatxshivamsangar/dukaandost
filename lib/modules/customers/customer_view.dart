import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dukan_dost/widgets/dark_card.dart';
import 'customer_controller.dart';
import 'customer_details_view.dart';

class CustomersView extends StatelessWidget {
  const CustomersView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CustomersController());

    return Scaffold(
      body: Obx(() {
        return ListView.builder(
          padding: const EdgeInsets.all(12),
          itemCount: controller.customers.length,
          itemBuilder: (_, index) {
            final c = controller.customers[index];
            return animatedRow(DarkCard(
              child: ListTile(
                title: Text(c.name),
                subtitle: Text(c.phone ?? "-"),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {

                  Get.to(() => CustomerDetailsView(customer: c),
                      transition: Transition.rightToLeft,
                      duration: const Duration(milliseconds: 350));

                  // Next: Open Customer Details Screen
                },
              ),
            ), index);
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _openAddCustomerDialog(),
        child: const Icon(Icons.add),
      ),
    );
  }


  Widget animatedRow(Widget child, int index) {
    return TweenAnimationBuilder(
      tween: Tween<Offset>(begin: const Offset(0, 0.02), end: Offset.zero),
      duration: Duration(milliseconds: 300 + index * 40),
      builder: (context, Offset offset, _) {
        return Transform.translate(
          offset: Offset(0, offset.dy * 50),
          child: Opacity(opacity: 1.0, child: child),
        );
      },
    );
  }

  void _openAddCustomerDialog() {
    final nameCtrl = TextEditingController();
    final phoneCtrl = TextEditingController();
    final controller = Get.find<CustomersController>();

    Get.defaultDialog(
      title: "Add Customer",
      content: Column(
        children: [
          TextField(
              controller: nameCtrl,
              decoration: const InputDecoration(hintText: "Name")),
          TextField(
              controller: phoneCtrl,
              decoration: const InputDecoration(hintText: "Phone (optional)")),
        ],
      ),
      textConfirm: "Save",
      onConfirm: () {
        controller.addCustomer(
            nameCtrl.text, phoneCtrl.text.isEmpty ? null : phoneCtrl.text);
        Get.back();
      },
    );
  }
}
