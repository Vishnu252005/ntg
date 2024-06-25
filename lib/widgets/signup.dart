// ignore_for_file: unused_import, unused_field

import 'package:flutter/material.dart';
import 'package:flutter_application_2/widgets/eee_sem1_screen.dart';


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _fullName, _branch, _year;
  String? _semester;
  List<String> _branchOptions = ['CSE', 'ECE', 'MECH', 'EEE', 'CIVIL', 'CHEMICAL'];
  List<String> _yearOptions = ['FE', 'SE', 'TE', 'BE'];
  Map<String, List<String>> _semesterOptions = {
    'FE': ['Sem1', 'Sem2'],
    'SE': ['Sem3', 'Sem4'],
    'TE': ['Sem5', 'Sem6'],
    'BE': ['Sem7', 'Sem8'],
  };

  void _saveProfile() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      // Determine where to navigate based on _branch and _semester
      String routeName = '';

      if (_branch != null && _semester != null) {
        routeName = '$_branch$_semester'; // Constructs 'EEE1', 'EEE2', etc.
        print('Route name: $routeName'); // Print the route name to the debug console
      } else {
        // Handle default redirection or error case
        routeName = '/'; // Redirect to default route (SignUpScreen in this case)
        print('Default route'); // Print default route to the debug console
      }

      // Navigate to the determined route
      Navigator.pushNamed(context, routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 3, 13, 148),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 20),
              Text(
                'Sign Up',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40),
              Container(
                width: double.infinity, // Ensure the container takes the full width
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(16),
                ),
                margin: EdgeInsets.symmetric(horizontal: 0), // Removed horizontal margin
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Full Name', style: TextStyle(color: Colors.white)),
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Full Name',
                          fillColor: Color.fromARGB(255, 58, 58, 58),
                          filled: true,
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                        ),
                        style: TextStyle(color: Colors.white),
                        onSaved: (value) => _fullName = value,
                      ),
                      SizedBox(height: 16),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Branch', style: TextStyle(color: Colors.white)),
                      ),
                      DropdownButtonFormField(
                        items: _branchOptions.map((String branch) {
                          return DropdownMenuItem(value: branch, child: Text(branch));
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            _branch = newValue;
                          });
                        },
                        decoration: InputDecoration(
                          hintText: ' Select Branch',
                          fillColor: Colors.grey[800],
                          filled: true,
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                        ),
                        style: TextStyle(color: Colors.white),
                        dropdownColor: Colors.grey[800],
                      ),
                      SizedBox(height: 16),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Year', style: TextStyle(color: Colors.white)),
                      ),
                      DropdownButtonFormField(
                        items: _yearOptions.map((String year) {
                          return DropdownMenuItem(value: year, child: Text(year));
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            _year = newValue;
                            _semester = null;
                          });
                        },
                        decoration: InputDecoration(
                          fillColor: Colors.grey[800],
                          filled: true,
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                        ),
                        style: TextStyle(color: Colors.white),
                        dropdownColor: Colors.grey[800],
                      ),
                      SizedBox(height: 16),
                      
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Semester', style: TextStyle(color: Colors.white)),
                      ),
                      if (_year != null)
                        Row(
                          children: _semesterOptions[_year]!.map((String sem) {
                            return Expanded(
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 4),
                                child: ElevatedButton(
                                  child: Text(sem, style: TextStyle(fontSize: 16, color: Color.fromARGB(255, 249, 246, 246))),
                                  onPressed: () {
                                    setState(() {
                                      _semester = sem;
                                    });
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: _semester == sem ? Colors.deepPurple : Colors.grey[800],
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      SizedBox(height: 260),

                      ElevatedButton(
                        child: Text('Save Profile', style: TextStyle(fontSize: 20, color: Color.fromARGB(255, 249, 246, 246))),
                        onPressed: _saveProfile, // Call _saveProfile when button is pressed
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 3, 13, 148),
                          padding: EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          elevation: 0,
                          shadowColor: Colors.transparent,
                          minimumSize: Size.fromHeight(50),
                        ),
                      ),
                      SizedBox(height: 80),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
