import 'package:app_loc/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: "https://tccjrtrrgijxelbearvr.supabase.co/",
    anonKey:
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InRjY2pydHJyZ2lqeGVsYmVhcnZyIiwicm9sZSI6ImFub24iLCJpYXQiOjE3ODA0NDEzNTQsImV4cCI6MjA5NjAxNzM1NH0.xpYrfar8o67bL9wuezE8R9E_Je6nq-l9zQAUYTj10e0",
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: SplashScreen());
  }
}
