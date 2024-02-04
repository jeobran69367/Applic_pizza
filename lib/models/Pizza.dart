
import 'package:untitled2/models/option_item.dart';

class Pizza {
  final int id;
  final String title;
  final String garniture;
  final String image;
  final double price;

  int pate = 0;
  int taille = 1;
  int sauce = 0;

  static final List<OptionItem> pates = [
    OptionItem(0, "pate fine"),
    OptionItem(1, "pate épaisse", supplement: 2),
  ];

  static final List<OptionItem> tailles = [
    OptionItem(0, "small", supplement: -1),
    OptionItem(1, "Medium"),
    OptionItem(2, "Large", supplement: 2),
    OptionItem(3, "Extra Large", supplement: 4),
  ];

  static final List<OptionItem> sauces = [
    OptionItem(0, "Base sauce tomate"),
    OptionItem(1, "sauce samourai", supplement: 2),
  ];

  double get total {
    double total = price;

    if (pate >= 0 && pate < pates.length) {
      total += pates[pate].supplement;
    }

    if (taille >= 0 && taille < tailles.length) {
      total += tailles[taille].supplement;
    }

    if (sauce >= 0 && sauce < sauces.length) {
      total += sauces[sauce].supplement;
    }

    return total;
  }




  Pizza(this.id, this.title, this.garniture, this.image, this.price);
}