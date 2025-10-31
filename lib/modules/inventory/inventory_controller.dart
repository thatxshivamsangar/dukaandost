import 'package:get/get.dart';
import '../../core/db.dart';

class InventoryController extends GetxController {
  RxList items = [].obs;

  @override
  void onInit() {
    super.onInit();
    getItems();
  }

  Future<void> getItems() async {
    final db = await AppDB.database;
    final data = await db.query("inventory");
    items.value = data;
  }

  Future<void> addItem(String name, int qty, double price) async {
    final db = await AppDB.database;
    await db.insert("inventory", {
      "name": name,
      "quantity": qty,
      "price": price,
    });
    getItems();
  }

  Future<void> updateItem(int id, int qty) async {
    final db = await AppDB.database;
    await db.update("inventory", {"quantity": qty}, where: "id = ?", whereArgs: [id]);
    getItems();
  }

  Future<void> deleteItem(int id) async {
    final db = await AppDB.database;
    await db.delete("inventory", where: "id = ?", whereArgs: [id]);
    getItems();
  }
}
