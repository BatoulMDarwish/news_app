
import 'package:flutter/cupertino.dart';

// ignore: camel_case_types
class SettingsScreen extends StatelessWidget {
   const SettingsScreen({Key? key}) : super(key: key);

   @override
   Widget build(BuildContext context) {
     return const Center(
       child: Text(
         'Settings Screen ',
         style: TextStyle(
           fontSize: 20.0,
           fontWeight: FontWeight.bold,
         ),
       ),
     );
   }
 }
