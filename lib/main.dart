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
      home: const SignUpScreen(),
      onGenerateRoute: (settings) {
        if (settings.name == 'EEESem1') {
          final args = settings.arguments as Map<String, String>;
          return MaterialPageRoute(
            builder: (context) {
              return EEESem1Screen(
                fullName: args['fullName']!,
                branch: args['branch']!,
                year: args['year']!,
                semester: args['semester']!,
              );
            },
          );
        }
        // Add more routes here
        return null;
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
      appBar: AppBar(title: const Text('Undefined Route')),
      body: Center(
        child: Text('No route defined for ${name ?? 'unknown route'}'),
      ),
    );
  }
}
