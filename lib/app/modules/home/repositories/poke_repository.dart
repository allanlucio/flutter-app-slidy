import 'package:dio/dio.dart';
import 'package:flutter_app_slidy/app/modules/home/models/pokemon_model.dart';



class PokeRepository {
  final Dio dio;

  PokeRepository(this.dio);

  Future<List<PokemonModel>> getAllPokemons() async {
    var response = await dio.get('/pokemon');
    
    List<PokemonModel> list = List();
    for (var json in response.data["results"]) {
      list.add(PokemonModel(json['name']));
    }
    print(list);
    return list;
  }
}
