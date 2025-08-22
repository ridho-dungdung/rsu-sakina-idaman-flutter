import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rsu_sakina_idaman/landing/view.dart';
import 'package:rsu_sakina_idaman/patient_queue_list/view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.greenAccent.shade100,
        appBarTheme: AppBarTheme(
            backgroundColor: Colors.green.shade600,
            titleTextStyle: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)
        ),
        useMaterial3: true,
      ),
      getPages: [
        GetPage(name: '/landing', page: () => LandingPage()),
        GetPage(name: '/patient_queue_list', page: () => PatientQueueListPage())
      ],
      initialRoute: '/landing',
    );
  }
}
