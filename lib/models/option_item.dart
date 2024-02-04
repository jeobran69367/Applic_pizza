class OptionItem {
  final int value;
  final String name; // Le type de String doit commencer par une majuscule
  final int supplement;

  OptionItem(this.value, this.name, {this.supplement = 0});
}
