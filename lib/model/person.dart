class Person {
  int id;
  double popularity;
  String name;
  String profileImg;
  String knowm;


  Person(
      this.id,
      this.popularity,
      this.name,
      this.profileImg,
      this.knowm,

      );
  Person.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        popularity = json['popularity'].toDouble(),
        name = json['name'],
        profileImg = json['profile_path'],
        knowm = json['knowm_for_department'];
}
