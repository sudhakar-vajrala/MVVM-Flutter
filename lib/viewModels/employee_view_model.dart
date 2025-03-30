import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:mvvm_sample/models/employee_model.dart';
import 'package:http/http.dart' as http;

class EmployeeViewModel with ChangeNotifier {

  List<EmployeeModel> _employees = [];
  bool _loading = false;
  List<EmployeeModel> get employees => _employees;
  bool get loading => _loading;

  Future<void> fetchData() async {
    _loading = true;
    notifyListeners();

    try {
      const url = 'https://raw.githubusercontent.com/johncodeos-blog/MVVMiOSExample/main/demo.json';
      //final response = await http(Uri.parse(url));
      final response = await http.get(
        Uri.parse(url)
      );
      if(response.statusCode == 200) {
        List<EmployeeModel> fetchEmployees = (json.decode(response.body) as List).map((post) => EmployeeModel.fromJson(post)).toList();
        _employees = fetchEmployees;
      }
    } catch (e) {
        throw Exception('failed to load ${e}');
    } finally {
      _loading = false;
      notifyListeners();
    }
  }

}