class Employee {
  int? id; // Auto-generated ID by SQLite
  late String name;
  late String designation;
  late String address;

  Employee({this.id, required this.name, required this.designation, required this.address});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'designation': designation,
      'address': address,
    };
  }

  factory Employee.fromMap(Map<String, dynamic> map) {
    return Employee(
      id: map['id'],
      name: map['name'],
      designation: map['designation'],
      address: map['address'],
    );
  }
}
