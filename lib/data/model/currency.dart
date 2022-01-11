class Currency {
  String? id;
  String? logoUrl;
  String? name;

  Currency({this.id, this.logoUrl, this.name});

  Currency.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    logoUrl = json['logo_url'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['logo_url'] = logoUrl;
    data['name'] = name;
    return data;
  }
}
