
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/cubit/states.dart';
import 'package:news_app/shared/components/components.dart';

import '../../layout/cubit/cubit.dart';

class BusinessScreen extends StatelessWidget {
   const BusinessScreen({Key? key}) : super(key: key);

   @override
   Widget build(BuildContext context) {

     return BlocConsumer<NewsCubit,NewsStates>(
       listener: (context, state) => {},
       builder: (context, state) {
         var List =NewsCubit.get(context).business;
        return articleBuilder(List,context);
        },






     );
   }
 }
