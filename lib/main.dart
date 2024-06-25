// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter_application_2/widgets/eee_sem1_screen.dart';
import 'widgets/signup.dart'; 

// Import other screens here

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sign Up Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 3, 13, 148)),
        useMaterial3: true,
      ),
      home: SignUpScreen(),
      routes: {
        'EEESem1': (context) => EEESem1Screen(),
        // 'EEESem 2': (context) => EeeSem2Screen(),
        // Define routes for other screens similarly
      },
      onUnknownRoute: (settings) => MaterialPageRoute(
        builder: (context) => UndefinedRouteScreen(name: settings.name),
      ),
    );
  }
}

class UndefinedRouteScreen extends StatelessWidget {
  final String? name;

  UndefinedRouteScreen({this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Undefined Route')),
      body: Center(
        child: Text('No route defined for ${name ?? 'unknown route'}'),
      ),
    );
  }
}



// import 'package:flutter/material.dart';
// // import 'package:flutter_application_2/widgets/pdf.dart';
// // // import 'package:flutter_application_2/widgets/pdf.dart';
// // import 'package:flutter_application_2/widgets/sgpa.dart';
// // import 'package:flutter_application_2/widgets/units.dart';
// // import 'package:flutter_application_2/widgets/notesection.dart';
// // import 'package:flutter_application_2/widgets/profile.dart';
// // import 'package:flutter_application_2/widgets/units.dart';

// import 'widgets/signup.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Sign Up Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 3, 13, 148)),
//         useMaterial3: true,
//       ),
//       home: SignUpScreen(),
//       // home: SubjectSelectionScreen(),
//       // home: ProfilePage(),
//       // home: ComputerNetworksPage(),
//       // home: SGPAConverterPage(),
//       // home: NotesPage(),
//     );
//   }
// }