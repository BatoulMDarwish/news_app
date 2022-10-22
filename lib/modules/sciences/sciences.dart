
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../layout/cubit/cubit.dart';
import '../../layout/cubit/states.dart';
import '../../shared/components/components.dart';

// ignore: camel_case_types
class SciencesScreen extends StatelessWidget {
   const SciencesScreen({Key? key}) : super(key: key);

   @override
   Widget build(BuildContext context) {

     return BlocConsumer<NewsCubit,NewsStates>(
       listener: (context, state) => {},
       builder: (context, state) {
         var List =NewsCubit.get(context).science;
         return articleBuilder(List,context);},
     );
   }
 }
