class EmployeeModel {
  String number;
  String name;
  String age;
  String salary;

  EmployeeModel({
    required this.number, 
    required this.name,
    required this.age,
    required this.salary,
    });

  factory EmployeeModel.fromJson(Map<String, dynamic> json) {
    return EmployeeModel(
      number: json['id'],
      name: json['employee_name'],
      age: json['employee_age'],
      salary: json['employee_salary'],
    );
  }

}