import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import './home.dart';
import 'package:statemangementapp/provider.dart';
import './provider.dart';
void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  //const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
  
      home: HomePage(),
    );
  }
}
class HomePage extends StatelessWidget{
  final ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20),
          child:ChangeNotifierProvider<HomePageProvider>(
            create:(context)=>HomePageProvider(),
            child:Consumer<HomePageProvider>(
              builder:(context,provider,child){
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:[
                    Text(provider.eligibilityMessage.toString(),style: TextStyle(
                      color: (provider.isEligible == true)? Colors.green : Colors.red,
                    ),),
                 
                    TextField(keyboardType: TextInputType.number,
                    decoration: InputDecoration(hintText: 'enter your Age'),
                    onChanged: (val){
                      provider.checkEligibility(int.parse(val));
                    },),
                  ],
                );
              },
            ),
          ),
            
      ),
    ),    
  );
  }
}


