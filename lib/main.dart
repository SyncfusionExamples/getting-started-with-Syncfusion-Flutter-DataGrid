import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:syncfusion_flutter_core/core.dart';

void main() {
  // Register your license here
  SyncfusionLicense.registerLicense('ADD YOUR LICENSE KEY HERE');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Syncfusion DataGrid Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

final List<Employee> _employees = <Employee>[];

final EmployeeDataSource _employeeDataSource = EmployeeDataSource();

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    populateData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Syncfusion Flutter DataGrid'),
      ),
      body: SfDataGrid(
        source: _employeeDataSource,
        columns: <GridColumn>[
          GridNumericColumn(mappingName: 'id', headerText: 'ID'),
          GridTextColumn(mappingName: 'name', headerText: 'Name'),
          GridTextColumn(mappingName: 'designation', headerText: 'Designation'),
          GridNumericColumn(mappingName: 'salary', headerText: 'Salary'),
        ],
      ),
    );
  }

  void populateData() {
    _employees.add(Employee(10001, 'James', 'Project Lead', 20000));
    _employees.add(Employee(10002, 'Kathryn', 'Manager', 30000));
    _employees.add(Employee(10003, 'Lara', 'Developer', 15000));
    _employees.add(Employee(10004, 'Michael', 'Designer', 15000));
    _employees.add(Employee(10005, 'Martin', 'Developer', 15000));
    _employees.add(Employee(10006, 'Newberry', 'Developer', 15000));
    _employees.add(Employee(10007, 'Balnc', 'Developer', 15000));
    _employees.add(Employee(10008, 'Perry', 'Developer', 15000));
    _employees.add(Employee(10009, 'Gable', 'Developer', 15000));
    _employees.add(Employee(10010, 'Grimes', 'Developer', 15000));
  }
}

class Employee {
  Employee(this.id, this.name, this.designation, this.salary);
  final int id;
  final String name;
  final String designation;
  final int salary;
}

class EmployeeDataSource extends DataGridSource {
  @override
  List<Object> get dataSource => _employees;

  @override
  Object getCellValue(int rowIndex, String columnName) {
    switch (columnName) {
      case 'id':
        return _employees[rowIndex].id;
        break;
      case 'name':
        return _employees[rowIndex].name;
        break;
      case 'salary':
        return _employees[rowIndex].salary;
        break;
      case 'designation':
        return _employees[rowIndex].designation;
        break;
      default:
        return ' ';
        break;
    }
  }
}