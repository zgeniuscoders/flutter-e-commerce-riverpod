class Category {
  String? id;
  String? name;
  String? photo;

  Category({
    this.id,
    this.name,
    this.photo,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"],
    name: json["name"],
    photo: json["photo"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "photo": photo,
  };
}