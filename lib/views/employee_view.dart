import 'package:flutter/material.dart';
import 'package:mvvm_sample/viewModels/employee_view_model.dart';
import 'package:provider/provider.dart';

class EmployeeView extends StatelessWidget {
  const EmployeeView({super.key});

  @override
  Widget build(BuildContext context) {

    final emploeeViewModel = Provider.of<EmployeeViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('MVVM Sample'),
      ),
      body: emploeeViewModel.loading ? 
      const Center(child: CircularProgressIndicator(),) :
      ListView.builder(
        itemCount: emploeeViewModel.employees.length,
        itemBuilder: (context, index){
          final record = emploeeViewModel.employees[index];
          return Card(
            child: ListTile(
            title: Text(record.name),
            subtitle: Text(record.salary),
          ),
          );
          /* other way
          return Container(
            decoration: BoxDecoration(
              border: Border(
                left: BorderSide(),
                right: BorderSide(),
                bottom: BorderSide(),
                ),
            ),
            child: ListTile(
            title: Text(record.name),
            subtitle: Text(record.salary),
          ),
          );*/
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: emploeeViewModel.fetchData,
        child: Icon(Icons.refresh),
      ),
    );
  }

}