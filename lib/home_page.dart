import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/profile.dart';
import 'package:flutter_application_1/pages/search.dart';
import 'package:flutter_application_1/pages/settings.dart';

class MyHomePage extends StatefulWidget {
  // Constructor
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

// create a list widgets for mange widgets in my application
class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    Profile(),
    Search(),
    Settings(),
  ];
// Json  For store The datas
  final String jsonData = '''
    [
      {"name": "A", "age": 30, "email": "A.A@example.com"},
      {"name": "B", "age": 25, "email": "B.B@example.com"},
      {"name": "C", "age": 35, "email": "C.c@example.com"}
    ]
  ''';

  List<Map<String, dynamic>> _dataTableData = [];
  @override
  void initState() {
    super.initState();
    // Pased the the JSON data
    List<dynamic> parsedData = json.decode(jsonData);
    // Convert dynamic data to Map<String, dynamic>
    _dataTableData = List<Map<String, dynamic>>.from(parsedData);
  }

//_onItemTapped  Is a Method that is called when an item in the bottom navigation  bar is tapped.
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(widget.title),
        titleTextStyle: const TextStyle(
          fontStyle: FontStyle.italic,
        ),
        centerTitle: true,
      ),

      // Center  Here I set The Table  And  Set The Table Cloumn And Row
      body: _selectedIndex == 0
          ? Center(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                  ), // Adjusted border width
                  borderRadius: BorderRadius.circular(10.0),
                ),
                padding: const EdgeInsets.all(10.0),
                child: _buildDataTable(),
              ),
            )
          : _buildSelectedWidget(),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }

// Widget Build Data Function
  Widget _buildDataTable() {
    return Center(
      // Wrap with Center widget to center the table
      child: SingleChildScrollView(
        child: DataTable(
          //set The Data Columns Where The  Data Is Stored
          columns: const <DataColumn>[
            DataColumn(label: Text('Name')),
            DataColumn(label: Text('Age')),
            DataColumn(label: Text('Email')),
          ],
          rows: _dataTableData
              //useing Map Fuction Get Thye Data.
              .map(
                (data) => DataRow(
                  cells: <DataCell>[
                    DataCell(Text(data['name'])),
                    DataCell(Text(data['age'].toString())),
                    DataCell(Text(data['email'])),
                  ],
                ),
              )
              .toList(),
        ),
      ),
    );
  }

  Widget _buildSelectedWidget() {
    return _widgetOptions.elementAt(_selectedIndex);
  }
}
