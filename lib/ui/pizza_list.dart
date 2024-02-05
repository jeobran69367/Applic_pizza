import 'package:flutter/material.dart';
import 'package:untitled2/models/cart.dart';
import 'package:untitled2/models/pizza_data.dart';
import 'package:untitled2/ui/pizza_details.dart';
import 'package:untitled2/ui/share/appbar_widget.dart';
import 'package:untitled2/ui/share/buy_button_widget.dart';
import 'package:untitled2/ui/share/pizzeria_style.dart';
import '../models/Pizza.dart';
import '../lib/services/pizzaria_service.dart';

class PizzaList extends StatefulWidget {
  final Cart _cart;
  const PizzaList(this._cart, {Key? key}) : super(key: key);

  @override
  _PizzaListState createState() => _PizzaListState();
}



class _PizzaListState extends State<PizzaList> {
  List<Pizza> _pizzas = [];
  PizzeriaService _service = PizzeriaService(); // Ajoutez cette ligne pour créer une instance de PizzeriaService

  @override
  void initState() {
    _service.fetchPizzas().then((pizzas) {
      setState(() {
        _pizzas = pizzas;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("Building PizzaList");
    return Scaffold(
      appBar: AppBarWidget('Nos Pizzas', widget._cart),
      body: FutureBuilder<List<Pizza>>(
        future: _service.fetchPizzas(), // Utilisez _service au lieu de _pizzas ici
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return _buildListView(snapshot.data!);
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                'Impossible de récupérer les données : ${snapshot.error}',
                style: PizzeriaStyle.errorTextStyle,
              ),
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget _buildRow(BuildContext context, Pizza pizza) {
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

  Widget _buildListView(List<Pizza> pizzas) {
    return ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: pizzas.length,
        itemBuilder: (context, index) {
          return _buildRow(context, pizzas[index]);
        });
  }
}
