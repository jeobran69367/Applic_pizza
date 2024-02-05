import 'Pizza.dart';

class CartItem {
  final Pizza pizza;
  int quantity;

  CartItem(this.pizza, [this.quantity = 1]);
}

class Cart {
  List<CartItem> items = [];

  int totalItems() {
    return items.length;
  }

  CartItem getCartItem(int index) {
    return items[index];
  }

  void addProduct(Pizza pizza) {
    // Recherche du produit
    int index = findCartItemIndex(pizza.id);
    if (index == -1) {
      // Ajout
      items.add(CartItem(pizza));
    } else {
      // Incrémente la quantité
      CartItem item = items[index];
      item.quantity++;
    }
  }

  void removeProduct(Pizza pizza) {
    int index = findCartItemIndex(pizza.id);
    if (index != -1) {
      items.removeAt(index);
    }
  }

  int findCartItemIndex(int id) {
    return items.indexWhere((element) => element.pizza.id == id);
  }
}
