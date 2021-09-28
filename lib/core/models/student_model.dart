import 'dart:convert';

class Student {
  String regno;
  String name;
  String company;
  String package;
  String imageURL;
  Student({
    this.regno,
    this.name,
    this.company,
    this.package,
    this.imageURL,
  });

  Student copyWith({
    String regno,
    String name,
    String company,
    String package,
    String imageURL,
  }) {
    return Student(
      regno: regno ?? this.regno,
      name: name ?? this.name,
      company: company ?? this.company,
      package: package ?? this.package,
      imageURL: imageURL ?? this.imageURL,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'regno': regno,
      'name': name,
      'company': company,
      'package': package,
      'imageURL': imageURL,
    };
  }

  factory Student.fromMap(Map<String, dynamic> map) {
    return Student(
      regno: map['regno'],
      name: map['name'],
      company: map['company'],
      package: map['package'],
      imageURL: map['imageURL'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Student.fromJson(String source) =>
      Student.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Student(regno: $regno, name: $name, company: $company, package: $package, imageURL: $imageURL)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Student &&
        other.regno == regno &&
        other.name == name &&
        other.company == company &&
        other.package == package &&
        other.imageURL == imageURL;
  }

  @override
  int get hashCode {
    return regno.hashCode ^
        name.hashCode ^
        company.hashCode ^
        package.hashCode ^
        imageURL.hashCode;
  }
}
