import 'package:final_project_emergency_app/model/request_model.dart';
import 'package:final_project_emergency_app/view%20model/location_veiw_model.dart';
import 'package:final_project_emergency_app/view%20model/phone_number_view_model.dart';
import 'package:final_project_emergency_app/view/home_screen.dart';
import 'package:final_project_emergency_app/view/request_call_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PhoneNumberViewModel()),
        ChangeNotifierProvider(create: (_) => RequestsModel()),
        ChangeNotifierProvider(create: (_) => LocationViewModel()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PhoneNumberViewModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            centerTitle: true,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            color: Colors.red, // Red background color
            elevation: 4, // Elevation
          ),
        ),
      ),
    );
  }
}




