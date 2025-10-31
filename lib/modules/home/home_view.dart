import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/style.dart';
import '../customers/customer_view.dart';
import '../inventory/inventory_view.dart';
import 'home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({super.key});

  final HomeController _con  = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: _pageContent(context),
    );
  }


  _pageContent(context){
    return Obx(() => Scaffold(
      appBar: AppBar(title: const Text("Dukaan Dost")),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: controller.tabIndex.value,
        onTap: controller.changeTab,
        backgroundColor: Colors.black,
        selectedItemColor: gold,
        unselectedItemColor: Colors.white70,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: AnimatedContainer(
              duration: const Duration(milliseconds: 350),
              width: controller.tabIndex.value == 0 ? 46 : 36,
              height: controller.tabIndex.value == 0 ? 46 : 36,
              decoration: controller.tabIndex.value == 0
                  ? BoxDecoration(shape: BoxShape.circle, color: gold.withOpacity(0.14))
                  : const BoxDecoration(),
              child: Icon(Icons.people, color: controller.tabIndex.value == 0 ? gold : Colors.white70),
            ),
            label: "Customers",
          ),
          BottomNavigationBarItem(
            icon: AnimatedContainer(
              duration: const Duration(milliseconds: 350),
              width: controller.tabIndex.value == 1 ? 46 : 36,
              height: controller.tabIndex.value == 1 ? 46 : 36,
              decoration: controller.tabIndex.value == 1
                  ? BoxDecoration(shape: BoxShape.circle, color: gold.withOpacity(0.14))
                  : const BoxDecoration(),
              child: Icon(Icons.inventory, color: controller.tabIndex.value == 1 ? gold : Colors.white70),
            ),
            label: "Inventory",
          ),
        ],
      ),

      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: SafeArea(
          child: IndexedStack(
            index: controller.tabIndex.value,
            children: const [
              CustomersView(),
              InventoryView(),
            ],
          ),
        ),
      ),
    ));
  }

}
