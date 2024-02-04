import 'package:flutter/material.dart';
import '../models/Pizza.dart';
import '../models/Pizza_data.dart';
import '../ui/share/buy_button_widget.dart';
import '../ui/share/pizzeria_style.dart';

class PizzaDetails extends StatefulWidget {
  final Pizza _pizza;

  PizzaDetails(this._pizza, {Key? key}) : super(key: key);

  @override
  State<PizzaDetails> createState() => _PizzaDetailsState();
}

class _PizzaDetailsState extends State<PizzaDetails> {
  // Liste des pizzas
  List<Pizza> pizzaList = PizzaData.buildList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget._pizza.title),
      ),
      body: ListView(
        padding: EdgeInsets.all(4.0),
        children: <Widget>[
          Text(
            'Pizza ${widget._pizza.title}',
            style: PizzeriaStyle.pageTitleTextStyle,
          ),
          Image.asset(
            'assets/images/pizza/${widget._pizza.image}',
            height: 180,
          ),
          Text(
            'Recette',
            style: PizzeriaStyle.headerTextStyle,
          ),
          Padding(
            padding: EdgeInsets.only(top: 8.0, bottom: 12.0),
            child: Text(
              widget._pizza.garniture,
            ),
          ),
          Text(
            'Pâte et taille sélectionnées',
            style: PizzeriaStyle.headerTextStyle,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(child: Text('La pâte')),
              Expanded(child: Text('La sauce')),
            ],
          ),
          Text(
            'Sauce sélectionnée',
            style: PizzeriaStyle.headerTextStyle,
          ),
          Text('Les sauces'),
          Text('${widget._pizza.price} £'),

          _buildDropDownSauces(),
          _buildTotalWidget(), // Appel de la méthode _buildTotalWidget sans passer le total en paramètre
          _buildBuyButton(),
        ],
      ),
    );
  }

  Widget _buildDropDownSauces() {
    // Implémentez votre dropdown ici
    return Container(); // Remplacez Container par votre widget DropdownButton
  }

  Widget _buildTotalWidget() {
    double total = 0;

    // Calcul du total en fonction des prix des pizzas sélectionnées
    for (Pizza pizza in pizzaList) {
      total += pizza.price;
    }

    return Text('Total: $total £');
  }

  Widget _buildBuyButton() {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.red.shade800),
      ),
      child: Row(
        children: [
          Icon(Icons.shopping_cart),
          SizedBox(width: 5),
          Text("Commander"),
        ],
      ),
      onPressed: () {
        print('Commander une pizza');
      },
    );
  }
}
