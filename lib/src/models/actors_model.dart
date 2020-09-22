class Cast {
  List<Actor> actors = new List();

  Cast.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;

    jsonList.forEach((item) {
      final actor = Actor.fromJsonMap(item);
      actors.add(actor);
    });
  }
}

class Actor {
  int castId;
  String character;
  String creditId;
  int gender;
  int id;
  String name;
  int order;
  String profilePath;

  Actor({
    this.castId,
    this.character,
    this.creditId,
    this.gender,
    this.id,
    this.name,
    this.order,
    this.profilePath,
  });

  Actor.fromJsonMap(Map<String, dynamic> json) {
    castId = json['cast_id'];
    character = json['character'];
    creditId = json['credit_id'];
    gender = json['gender'];
    id = json['id'];
    name = json['name'];
    order = json['order'];
    profilePath = json['profile_path'];
  }

  getImageActor() {
    if (profilePath == null) {
      return 'https://firebasestorage.googleapis.com/v0/b/flutter-apps-86cfe.appspot.com/o/no-image.jpg?alt=media&token=276d0ea8-891e-4e09-9cb6-1dd97e75d891';
    } else {
      return 'https://image.tmdb.org/t/p/w500/$profilePath';
    }
  }
}
