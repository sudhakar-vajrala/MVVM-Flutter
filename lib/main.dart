import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:mvvm_sample/viewModels/employee_view_model.dart';
import 'package:mvvm_sample/views/employee_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: ChangeNotifierProvider(
        create: (context) => EmployeeViewModel(),
        child: const EmployeeView(),
        ),
    );
  }
}
/*
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'API Example',
      home: APIExaple(),
    );
  }
}*/

class APIExaple extends StatefulWidget {
  @override
  _ApiExampleState createState() => _ApiExampleState();
}

class _ApiExampleState extends State<APIExaple> {
  String data = 'Loading...';

  Future<void> fetchData() async{
      const urlString = 'https://raw.githubusercontent.com/johncodeos-blog/MVVMiOSExample/main/demo.json';
      final respose = await http.get(Uri.parse(urlString));
      if (respose.statusCode == 200) {
        var jsonData = json.decode(respose.body);
        print(jsonData);
        setState(() {
          data = jsonData.toString();
        });
      }else{
        print('error api call');
        setState(() {
          data = 'Failed to load the data';
        });
      }
  }

@override
void initState() {
  super.initState();
  fetchData();
}

@override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('GET Request'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(data, style: TextStyle(fontSize: 16)),
        ),
      ),
    );
  }
}


/*
 StatefulElement createElement() async{
    // TODO: implement createElement
    String loadingString = 'Loading';

    Future<void> fetchData() async{
      const urlString = '';
      final respose = await http.get(Uri.parse(urlString));
      if (respose.statusCode == 200) {
        var jsonData = json.decode(respose.body);
        print(jsonData);
      }else{
        print('error api call');
      }
    }


    
  }

@override
void initState() {
  super.initState();
  fetchData();
}

@override 
Widget build 
*/