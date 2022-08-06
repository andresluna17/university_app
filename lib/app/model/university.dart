class University {
  University({
    required this.alphaTwoCode,
    required this.domains,
    required this.country,
    required this.stateProvince,
    required this.webPages,
    required this.name,
    required this.image,
  });

  String alphaTwoCode;
  List<String> domains;
  String country;
  dynamic stateProvince;
  List<String> webPages;
  String name;
  String image;
  bool imageLocal = false;

  factory University.fromJson(Map<String, dynamic> json) {
    final domains = List<String>.from(json["domains"].map((x) => x));
    return University(
        alphaTwoCode: json["alpha_two_code"],
        domains: domains,
        country: json["country"],
        stateProvince: json["state-province"],
        webPages: List<String>.from(json["web_pages"].map((x) => x)),
        name: json["name"],
        image: 'http://www.google.com/s2/favicons?domain=' + domains.first);
  }
}
