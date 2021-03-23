class AnotherModel {
  List<Sports> sports;
  List<Movies> movies;
  List<Tv> tv;

  AnotherModel({this.sports, this.movies, this.tv});

  AnotherModel.fromJson(Map<String, dynamic> json) {
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
