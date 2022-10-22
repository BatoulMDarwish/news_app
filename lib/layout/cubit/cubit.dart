import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/cubit/states.dart';
import 'package:news_app/modules/business/business.dart';
import 'package:news_app/modules/sciences/sciences.dart';
import 'package:news_app/modules/sports/sports.dart';
import '../../shared/network/remote/dio.dart';

class NewsCubit extends Cubit<NewsStates>{
  NewsCubit() : super(NewsInitialState());
  
  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex=0;

 List<BottomNavigationBarItem> bottomItems =
     [
       const BottomNavigationBarItem(
           icon: Icon(Icons.business),
         label: 'Business',
       ),
       const BottomNavigationBarItem(
         icon: Icon(Icons.sports),
         label: 'Sports',
       ),
       const BottomNavigationBarItem(
         icon: Icon(Icons.science),
         label: 'Sciences',
       ),

     ];

 List<Widget> screens=[
   const BusinessScreen(),
   const SportsScreen(),
   const SciencesScreen(),
 ];

 void changeBottomNavBar(int index){
   currentIndex=index;
   if(index==2) {
     getSports();
   }
   if(index==1){
     getSciences();
   }
   emit(NewsBottomNavState());
 }

 List<dynamic> business =[];

 void getBusiness(){
   emit(NewsLoadingState());
   
   DioHelper.getData(
       url: 'v2/top-headlines',
       query:{
         'country': 'eg',
         'category': 'business',
         'apiKey': '65f7f556ec76449fa7dc7c0069f040ca',
       }
   ).then((value) {
     //print(value.data['articales'][0]['title']);
     business=value.data['articles'];
     print(business[0]['title']);
     
     emit(NewsGetBusinessSuccessState());
   }).catchError((error){
     print(error.toString());
     emit(NewsGetBusinessErrorState(error.toString()));
   })
   ;

 }

  List<dynamic> sports =[];

  void getSports(){
    emit(NewsLoadingSportsState());
    if(sports.isEmpty){
      DioHelper.getData(
          url: 'v2/top-headlines',
          query:{
            'country': 'eg',
            'category': 'sports',
            'apiKey': 'abf3c58f819245c99c7ca7678cbefc6b',
          }
      ).then((value) {
        //print(value.data['articales'][0]['title']);
        sports=value.data['articles'];
        print(sports[0]['title']);

        emit(NewsGetSportsSuccessState());
      }).catchError((error){
        print(error.toString());
        emit(NewsGetSportsErrorState(error.toString()));
      })
      ;

    }else{
      emit(NewsGetSportsSuccessState());
    }


  }

  List<dynamic> science=[];

  void getSciences(){
    emit(NewsLoadinSciencesgState());
    if(science.isEmpty){
      DioHelper.getData(
          url: 'v2/top-headlines',
          query:{
            'country' : 'eg',
            'category' : 'science',
            'apiKey' : '65f7f556ec76449fa7dc7c0069f040ca',
          }
      ).then((value) {
        //print(value.data['articales'][0]['title']);
        science=value.data['articles'];
        print(science[0]['title']);

        emit(NewsGetSciencesSuccessState());
      }).catchError((error){
        print(error.toString());
        emit(NewsGetSciencesErrorState(error.toString()));
      })
      ;
    }else{
      emit(NewsGetSciencesSuccessState());
    }


  }

  List<dynamic> search=[];

  void getSearch(value){
    emit(NewsLoadinSearchgState());
     DioHelper.getData(
         url: 'v2/everything',
         query:{
           'q' : '$value',
           'apiKey' : '65f7f556ec76449fa7dc7c0069f040ca',
         }
     ).then((value) {
       //print(value.data['articales'][0]['title']);
       search=value.data['articles'];
       print(search[0]['title']);

       emit(NewsGetSearchSuccessState());
     }).catchError((error){
       print(error.toString());
       emit(NewsGetSearchErrorState(error.toString()));
     })
     ;


  }

}