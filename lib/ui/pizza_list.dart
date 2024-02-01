// Dans le fichier pizza_list.dart
import 'package:flutter/material.dart';
import 'package:untitled2/models/pizza_data.dart';
import '../models/Pizza.dart';

class PizzaList extends StatefulWidget {
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

  Widget _buildRow( pizza) {
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
          fit: BoxFit.fitWidth,
        ),
        Text(pizza.garniture),
        ElevatedButton(
          child: Text("Commander"),
          onPressed: () {
            print('Commander une pizza');
          },
        ),
      ],
    );
  }
}
