import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:news_app/modules/webview/webview_screen.dart';

Widget buildArticleItem(articale,context) =>InkWell(
  onTap: (){
    navigateTo(context, WebViewScreen(articale['url']));
  },
  child:
  Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children: [
        Container(
          width: 120.0,
          height: 120.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                  image: NetworkImage('${articale['urlToImage']}'),
                fit: BoxFit.cover
              ),
          ),
        ),
        const SizedBox(
          width: 20.0,
        ),
        // ignore: sized_box_for_whitespace
         Expanded(
          child: Container(
            height: 120.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                Expanded(
                  child: Text(
                    '${articale['title']}',
                    style: Theme.of(context).textTheme.bodyText1,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  '${articale['publishedAt']}',
                  style: const TextStyle(
                    color: Colors.grey,
                  ),

                ),
              ],
            ),
          ),
        ),
      ],
    ),
  ),
);

Widget myDivider() => Padding(
  padding: const EdgeInsetsDirectional.only(start:20.0,),
  child: Container(
    width: double.infinity,
    color: Colors.grey[300],
    height: 1.0,
  ),
);

// ignore: non_constant_identifier_names, avoid_types_as_parameter_names
Widget articleBuilder(list, BuildContext context,{isSearch=false}) =>  ConditionalBuilder(
  condition:list.length>0 ,
  builder: (context) =>ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemBuilder:(context, index) => buildArticleItem(list[index],context),
      separatorBuilder: (context,index) =>  myDivider() ,
      itemCount: list.length),
  fallback: (context) =>isSearch? Container() : const Center(
    child: CircularProgressIndicator(),
  ),
);

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  Function? onSubmit,
  Function? onChange,
  Function? onTap,
  bool isPassword = false,
  required Function validate,
  required String label,
  required IconData prefix,
  IconData? suffix,
  Function? suffixPressed,
  bool isClickable = true,
})  =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      enabled: isClickable,
      onFieldSubmitted:(s){
        onSubmit!(s);
      },
      onChanged:(s){
        onChange!(s);
      },
      onTap:  () {
        onTap!();
      },
      validator: (s){
        validate(s);
      },
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(
          prefix,
        ),
        suffixIcon: suffix != null
            ? IconButton(
          onPressed:(){
            suffixPressed!();
          },
          icon: Icon(
            suffix,
          ),
        )
            : null,
        border: const OutlineInputBorder(),
      ),
    );

void navigateTo(context,widget) => Navigator.push(
 context,
  MaterialPageRoute(builder: (context) => widget)
);
