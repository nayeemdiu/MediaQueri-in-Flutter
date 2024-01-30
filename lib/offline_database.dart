import 'package:flutter/material.dart';

import 'DB/DatabaseHelper.dart';
import 'Model/Employee.dart';

class OfflineDataBase extends StatelessWidget {
   OfflineDataBase({Key? key}) : super(key: key);
  final TextEditingController nameController = TextEditingController();
  final TextEditingController designationController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

   final DatabaseHelper dbHelper = DatabaseHelper();
   List<Employee> employees = [];

   @override
   void initState() {
     _loadEmployees();

   }

   void _loadEmployees() async {
     List<Employee> employeeList = await dbHelper.getEmployees();
     setState(() => employees = employeeList);
   }

   @override
  Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
         title: Text('Employee Form and List'),
       ),
       body: Padding(
         padding: const EdgeInsets.all(16.0),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.stretch,
           children: [
             TextField(
               controller: nameController,
               decoration: InputDecoration(labelText: 'Name'),
             ),
             TextField(
               controller: designationController,
               decoration: InputDecoration(labelText: 'Designation'),
             ),
             TextField(
               controller: addressController,
               decoration: InputDecoration(labelText: 'Address'),
             ),
             SizedBox(height: 16.0),
             ElevatedButton(
               onPressed: () async {
                 Employee employee = Employee(
                   name: nameController.text,
                   designation: designationController.text,
                   address: addressController.text,
                 );

                 int result = await dbHelper.insertEmployee(employee);
                 if (result > 0) {
                   print('Employee added to the database!');
                   _loadEmployees(); // Reload the list of employees
                 } else {
                   print('Error adding employee to the database.');
                 }
               },
               child: Text('Save'),
             ),
             SizedBox(height: 16.0),
             Text(
               'Employee List:',
               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
             ),
             Expanded(
               child: ListView.builder(
                 itemCount: employees.length,
                 itemBuilder: (context, index) {
                   return ListTile(
                     title: Text(employees[index].name),
                     subtitle: Text(
                         'Designation: ${employees[index].designation}\nAddress: ${employees[index].address}'),
                   );
                 },
               ),
             ),
           ],
         ),
       ),
     );
  }

  void setState(List<Employee> Function() param0) {}
}
