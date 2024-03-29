// Dans le fichier pizza_list.dart
import 'package:flutter/material.dart';
import 'package:untitled2/models/cart.dart';
import 'package:untitled2/models/pizza_data.dart';
import 'package:untitled2/ui/pizza_details.dart';
import 'package:untitled2/ui/share/buy_button_widget.dart';
import '../models/Pizza.dart';

class PizzaList extends StatefulWidget {
  final Cart _cart;
  const PizzaList(this._cart, {Key? key}) : super(key: key);

  @override
  _PizzaListState createState() => _PizzaListState();
}

class _PizzaListState extends State<PizzaList> {
  List<Pizza> _pizzas = [];

  @override
  void initState() {
    super.initState();
    _pizzas = PizzaData.buildList();
    print("Pizzas: $_pizzas");
  }

  @override
  Widget build(BuildContext context) {
    print("Building PizzaList");
    return Scaffold(
      appBar: AppBar(
        title: Text('Nos pizzas'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: _pizzas.length,
        itemBuilder: (context, index) {
          return _buildRow(_pizzas[index]);
        },
      ),
    );
  }

  Widget _buildRow(Pizza pizza) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(10.0),
          top: Radius.circular(2.0),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PizzaDetails(pizza, widget._cart),
                ),
              );
            },
            child: _buildPizzaDetails(pizza),
          ),
          BuyButtonWidget(pizza, widget._cart),
        ],
      ),
    );
  }

  Widget _buildPizzaDetails(Pizza pizza) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          title: Text(pizza.title),
          subtitle: Text(pizza.garniture),
          leading: Icon(Icons.local_pizza),
        ),
        Image.asset(
          'assets/images/pizza/${pizza.image}',
          height: 120,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.fitWidth,
        ),
        Container(
          padding: const EdgeInsets.all(4.0),
          child: Text(pizza.garniture),
        ),
      ],
    );
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