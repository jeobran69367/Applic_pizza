import 'package:flutter/material.dart';
import 'package:untitled2/models/option_item.dart';
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
              Expanded(child: _buildDropDownPates()),
              Expanded(child: _buildDropDownTailles()),
            ],
          ),
          Text(
            'Sauce sélectionnée',
            style: PizzeriaStyle.headerTextStyle,
          ),
          _buildDropDownSauces(),
          Text('Les sauces'),
          Text('${widget._pizza.price} £'),

          _buildTotalWidget(),
          _buildBuyButton(),
        ],
      ),
    );
  }

  Widget _buildDropDownSauces() {
    return DropdownButton<OptionItem>(
      isExpanded: true,
      value: Pizza.sauces[widget._pizza.sauce], // Valeur initiale, à adapter selon vos besoins
      items: _buildDropDownItem(Pizza.sauces),
      onChanged: (item) {
        setState(() {
          widget._pizza.sauce = item!.value;
        });
      },
    );
  }

  Widget _buildTotalWidget() {
    double total = 0;

    // Calcul du total en fonction du prix de la pizza sélectionnée
    total += widget._pizza.price;

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

  Widget _buildDropDownPates() {
    return DropdownButton<OptionItem>(
      isExpanded: true,
      value: Pizza.pates[widget._pizza.pate],
      items: _buildDropDownItem(Pizza.pates),
      onChanged: (item) {
        setState(() {
          widget._pizza.pate = item!.value;
        });
      },
    );
  }

  List<DropdownMenuItem<OptionItem>> _buildDropDownItem(List<OptionItem> list) {
    return List.generate(
      list.length,
          (i) => DropdownMenuItem<OptionItem>(
        value: list[i],
        child: Text(list[i].name),
      ),
    );
  }

  Widget _buildDropDownTailles() {
    return DropdownButton<OptionItem>(
      isExpanded: true,
      value: Pizza.tailles[widget._pizza.taille],
      items: _buildDropDownItem(Pizza.tailles),
      onChanged: (item) {
        setState(() {
          widget._pizza.taille = item!.value;
        });
      },
    );
  }
}
