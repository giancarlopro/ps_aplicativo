class Company {
  String companyName;
  String fantasyName;
  String email;
  String status;
  String logo;

  Company({
    this.companyName,
    this.fantasyName,
    this.email,
    this.status,
    this.logo,
  });

  static Company fromJson(Map<String, dynamic> json) {
    return Company(
      companyName: json['company_name'],
      fantasyName: json['fantasy_name'],
      email: json['email'],
      status: json['status'],
      logo: json['logo'],
    );
  }

  static List<Company> fromJsonArray(List<Map<String, dynamic>> json) {
    return json.map((j) => fromJson(j));
  }
}
