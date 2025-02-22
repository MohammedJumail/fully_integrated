class Category {
  String? slug;
  String? name;
  String? url;

  Category({this.slug, this.name, this.url});

  Category.fromJson(Map<String, dynamic> json) {
    slug = json["slug"];
    name = json["name"];
    url = json["url"];
  }
}
