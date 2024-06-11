import 'package:dashboard_table_master/layout/main_layout.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

// final supabase = Supabase.instance.client;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://zmtwgutyrebchmjjtusk.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InptdHdndXR5cmViY2htamp0dXNrIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTgwMDI1MTksImV4cCI6MjAzMzU3ODUxOX0.J7lBjnlGBJfRgaPyZEEbvRZGKrHgcBVSpctZLhzM98w',
  );

  runApp(const MainApp());
}

final supabase = Supabase.instance.client;

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Dashboard UI",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      home: const MainScreen(),
    );
  }
}

class TestDb extends StatefulWidget {
  const TestDb({super.key});

  @override
  State<TestDb> createState() => _TestDbState();
}

class _TestDbState extends State<TestDb> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            FloatingActionButton(onPressed: () async {
              final data =
                  await supabase.from('master_staking_period').select('*');
              print(data);
              print(data.length);
              print(data.runtimeType);
            }),
            FloatingActionButton(onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
