import 'package:flutter/material.dart';
import 'package:flutter_application_2/widgets/units.dart';  // Import the correct file for units
import 'package:flutter_application_2/widgets/profile.dart';// Import the profile.dart file


class EEESem1Screen extends StatefulWidget {
  final String fullName = 'John Doe'; // Default value
  final String branch = 'Computer Science'; // Default value
  final String year = 'First Year'; // Default value
  final String semester = 'First Semester'; // Default value

  const EEESem1Screen({
    super.key,
  });

  @override
  _EEESem1ScreenState createState() => _EEESem1ScreenState();
}

class _EEESem1ScreenState extends State<EEESem1Screen> {
  int _selectedIndex = 0;
  final List<String> _tabs = ['Notes & Books', 'PYQs'];

  final Map<String, List<Map<String, dynamic>>> _subjects = {
    'Notes & Books': [
      {
        'name': 'Data Management System',
        'description': 'DBMS is a software system used to store, retrieve, and...',
        'image': 'assets/s1.png',
        'page': ComputerNetworksPage(), // The page to navigate to
      },
      {
        'name': 'Design Thinking',
        'description': 'Design thinking is a process for solving problems by pr...',
        'image': 'assets/s2.png',
        'page': ComputerNetworksPage(), // The page to navigate to
      },
      // Add more subjects as needed
    ],
    'PYQs': [
      {
        'name': 'Data Management System PYQs',
        'description': 'Previous Year Questions for DBMS...',
        'image': 'assets/s1.png',
        'page': ComputerNetworksPage(), // The page to navigate to
      },
      {
        'name': 'Design Thinking PYQs',
        'description': 'Previous Year Questions for Design Thinking...',
        'image': 'assets/s2.png',
        'page': ComputerNetworksPage(), // The page to navigate to
      },
      // Add more subjects as needed
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 3, 13, 148),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hey ${widget.fullName}',
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      Text(
                        'Select Subject',
                        style: TextStyle(fontSize: 16, color: Colors.white70),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProfilePage(), // Redirects to ProfilePage
                        ),
                      );
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.red[600],
                      radius: 30,
                      child: Text(
                        widget.fullName[0].toUpperCase(),
                        style: TextStyle(color: Colors.white , fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 22),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 58, 58, 58),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          children: List.generate(
                            _tabs.length,
                            (index) => Expanded(
                              child: GestureDetector(
                                onTap: () => setState(() => _selectedIndex = index),
                                child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 12),
                                  decoration: BoxDecoration(
                                    color: _selectedIndex == index ? Colors.black : Color.fromARGB(255, 58, 58, 58),
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  child: Text(
                                    _tabs[index],
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 1),
                    Expanded(
                      child: ListView.builder(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        itemCount: _subjects[_tabs[_selectedIndex]]!.length,
                        itemBuilder: (context, index) {
                          var subject = _subjects[_tabs[_selectedIndex]]![index];
                          return Card(
                            color: Color.fromARGB(255, 58, 58, 58),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                            child: ListTile(
                              contentPadding: EdgeInsets.all(8),
                              leading: subject['image'] != null
                                  ? Image.asset(subject['image'], width: 80, height: 80)
                                  : null,
                              title: Text(subject['name'], style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                              subtitle: Text(subject['description'], style: TextStyle(color: Colors.white70)),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => subject['page'], // Redirects to the specified page
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
