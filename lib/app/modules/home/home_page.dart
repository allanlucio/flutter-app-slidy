import 'package:flutter/material.dart';
import 'package:flutter_app_slidy/app/modules/home/home_controller.dart';
import 'package:flutter_app_slidy/app/modules/home/models/pokemon_model.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';



class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homeController = Modular.get<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Observer(
        builder: (BuildContext context) {
          if (homeController.pokemons.error != null) {
            return Center(
              child: Center(
                child: RaisedButton(
                  child: Text("Press Again"),
                  onPressed: () {
                    homeController.fetchPokemons();
                  },
                ),
              ),
            );
          }

          if (homeController.pokemons.value == null) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          List<PokemonModel> list = homeController.pokemons.value;
          return ListView.builder(
            itemCount: list.length,
            itemBuilder: (_, index) {
              return ListTile(
                title: Text(list[index].name),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigator.pushNamed(context, '/other/${homeController.text}');
          Modular.to.pushNamed('/other');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
