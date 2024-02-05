import 'dart:convert';
import 'package:http/http.dart' as http; // Ajoutez cette ligne pour importer le package http
import 'package:untitled2/models/Pizza.dart';

class PizzeriaService {
  static final String uri = 'http://localhost/api/pizzas/images/pizza/';

  Future<List<Pizza>> fetchPizzas() async {
    List<Pizza> list = [];

    try {
      final response = await http.get(Uri.parse('$uri/pizzas')); // Correction ici

      if (response.statusCode == 200) {
        var json = jsonDecode(utf8.decode(response.bodyBytes));
        for (final value in json) {
          list.add(Pizza.fromJson(value));
        }
      } else {
        throw Exception('Impossible de récupérer les pizzas');
      }
    } catch (e) {
      throw e;
    }
    return list;
  }
}
