import 'dart:convert';

import 'package:flutter/material.dart';
import 'model.dart';
import 'package:http/http.dart' as http;

class DropDownClass extends StatefulWidget {
  @override
  _DropDownClassState createState() => _DropDownClassState();
}

class _DropDownClassState extends State<DropDownClass> {
  AnotherModel anotherModel = AnotherModel();
  Future<AnotherModel> _fetchData() async {
    final url = 'https://jsonkeeper.com/b/6FNV';
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final datas = jsonDecode(response.body);
      final lists = AnotherModel.fromJson(datas);

      return lists;
    }
  }

  @override
  void initState() {
    super.initState();
    this._fetchData();
  }

  // Let's supose you have a variable of the DropdownModel

// We store the current dropdown value
// Here you can put the default option
// Since you have Movies with id, I would recommend saving
// the movie value as the dropdownValue
  String dropdownValue = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Hope you work'),
        ),
        body: newModel()
        //  Container(
        //     child: Column(children: <Widget>[
        //   DropdownButton<String>(
        //     // The value is the selected value, you should control the state
        //     value: anotherModel.movies[1].name,
        //     // value: model.fromNameFromId(dropdownValue),
        //     // The icon to open the dropdown
        //     icon: Icon(Icons.arrow_downward),
        //     iconSize: 24,
        //     elevation: 16,
        //     // On changed is the method that it is called when a dropdown option
        //     // is selected
        //     onChanged: (String newValue) {
        //       // Here we change the state, as I noted before
        //       // The newValue will be a movie id
        //       setState(() {
        //         dropdownValue = newValue;
        //       });
        //     },
        //     items: anotherModel.movies.map<DropdownMenuItem<String>>(
        //         // We have to iterate through all the movies and return
        //         // a list of DropdownMenuItems
        //         (m) {
        //       return DropdownMenuItem<String>(
        //         value: m.name,
        //         // We display the movie name instead of the id
        //         child: Text(m.name),
        //       );
        //     }).toList(),
        //   )
        // ]))
        );
  }

  Widget newModel() {
    return FutureBuilder(
      future: _fetchData(),
      builder: (BuildContext context, AsyncSnapshot<AnotherModel> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
          case ConnectionState.active:
            return Center(
              child: CircularProgressIndicator(),
            );
          case ConnectionState.done:
            if (snapshot.hasError)
              return Text("There was an error: ${snapshot.error}");

            anotherModel = snapshot.data;
            return ListView.builder(
                itemCount: anotherModel.movies.length,
                itemBuilder: (context, index) {
                  if (anotherModel.movies.length > 0) {
                    return _anotherData(index);
                  }
                });

          default:
            return null;
        }
      },
    );
  }

  _anotherData(index) {
    final x = anotherModel.movies[index];
    final y = anotherModel.sports[index];
    final z = anotherModel.tv[index];

    return ListTile(
      title: Text(x.name),
      subtitle: Text(y.name),
      leading: CircleAvatar(
        backgroundColor: Colors.lightBlue,
        child: Text(
          z.name[0],
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}

class DropDownModel {
  List<Sports> sports;
  List<Movies> movies;
  List<Tv> tv;

  DropDownModel({this.sports, this.movies, this.tv});

  DropDownModel.fromJson(Map<String, dynamic> json) {
    if (json['sports'] != null) {
      sports = new List<Sports>();
      json['sports'].forEach((v) {
        sports.add(new Sports.fromJson(v));
      });
    }
    if (json['movies'] != null) {
      movies = new List<Movies>();
      json['movies'].forEach((v) {
        movies.add(new Movies.fromJson(v));
      });
    }
    if (json['tv'] != null) {
      tv = new List<Tv>();
      json['tv'].forEach((v) {
        tv.add(new Tv.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sports'] = this.sports.map((v) => v.toJson()).toList();
    data['movies'] = this.sports.map((v) => v.toJson()).toList();
    data['tv'] = this.sports.map((v) => v.toJson()).toList();

    return data;
  }
}

class Sports {
  String id;
  String name;

  Sports({this.id, this.name});

  factory Sports.fromJson(Map<String, dynamic> json) =>
      Sports(id: json["id"], name: json["name"]);

  Map<String, dynamic> toJson() => {"id": id, "name": name};
}

class Movies {
  String id;
  String name;

  Movies({this.id, this.name});

  factory Movies.fromJson(Map<String, dynamic> json) =>
      Movies(id: json["id"], name: json["name"]);

  Map<String, dynamic> toJson() => {"id": id, "name": name};
}

class Tv {
  String id;
  String name;

  Tv({this.id, this.name});

  factory Tv.fromJson(Map<String, dynamic> json) =>
      Tv(id: json["id"], name: json["name"]);

  Map<String, dynamic> toJson() => {"id": id, "name": name};
}
