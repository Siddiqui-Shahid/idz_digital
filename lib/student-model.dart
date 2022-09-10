class StudentModel {
  String? name;
  int? age;
  int? salary;

  StudentModel({this.name, this.age, this.salary});

  StudentModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    age = json['age'];
    salary = json['salary'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['age'] = this.age;
    data['salary'] = this.salary;
    return data;
  }
}
// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

// import 'dart:convert';
//
// StudentModel welcomeFromJson(String str) =>
//     StudentModel.fromJson(json.decode(str));
//
// String welcomeToJson(StudentModel data) => json.encode(data.toJson());
// List<StudentModel> postFromJson(String str) => List<StudentModel>.from(
//     json.decode(str).map((x) => StudentModel.fromMap(x)));

// class StudentModel {
//   StudentModel({
//     required this.employees,
//   });
//
//   List<Employee> employees;
//
//   factory StudentModel.fromJson(Map<String, dynamic> json) => StudentModel(
//         employees: List<Employee>.from(
//             json["employees"].map((x) => Employee.fromJson(x))),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "employees": List<dynamic>.from(employees.map((x) => x.toJson())),
//       };
// }
//
// class Employee {
//   Employee({
//     required this.name,
//     required this.age,
//     required this.salary,
//   });
//
//   String name;
//   int age;
//   int salary;
//
//   factory Employee.fromJson(Map<String, dynamic> json) => Employee(
//         name: json["name"],
//         age: json["age"],
//         salary: json["salary"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "name": name,
//         "age": age,
//         "salary": salary,
//       };
// }
