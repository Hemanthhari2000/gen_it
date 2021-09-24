import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class Student {
  String regno;
  String name;
  String company;
  String package;
  Student({
    this.regno,
    this.name,
    this.company,
    this.package,
  });

  Student copyWith({
    String regno,
    String name,
    String company,
    String package,
  }) {
    return Student(
      regno: regno ?? this.regno,
      name: name ?? this.name,
      company: company ?? this.company,
      package: package ?? this.package,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'regno': regno,
      'name': name,
      'company': company,
      'package': package,
    };
  }

  factory Student.fromMap(Map<String, dynamic> map) {
    return Student(
      regno: map['regno'],
      name: map['name'],
      company: map['company'],
      package: map['package'],
    );
  }

  factory Student.fromJsonMap(Map map) {
    return Student(
      regno: map['regno'],
      name: map['name'],
      company: map['company'],
      package: map['package'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Student.fromJson(String source) =>
      Student.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Student(regno: $regno, name: $name, company: $company, package: $package)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Student &&
        other.regno == regno &&
        other.name == name &&
        other.company == company &&
        other.package == package;
  }

  @override
  int get hashCode {
    return regno.hashCode ^ name.hashCode ^ company.hashCode ^ package.hashCode;
  }
}
