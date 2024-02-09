import 'package:flutter/material.dart';
import 'package:vehicle/pages/add.dart';

class menu extends StatelessWidget {
  const menu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Menu"),backgroundColor: Colors.pink.shade300,),
      body: Container(width: double.infinity,decoration: BoxDecoration(gradient: LinearGradient(
          colors: [
            Colors.green,
            Colors.yellow
          ]
      )),padding: EdgeInsets.all(20),child: Column(children: [
        SizedBox(
          width: 250,
          height: 60,
          child: ElevatedButton(onPressed: (){
            Navigator.push(context,MaterialPageRoute(builder: (context)=>add()));
          }, child: Text("Add Vehicles")),
        ),
        SizedBox(height: 10,),
        SizedBox(
          width: 250,
          height: 60,
          child: ElevatedButton(onPressed: (){

          }, child: Text("View Vehicles")),
        ),
        SizedBox(height: 10,),
        SizedBox(
          width: 250,
          height: 60,
          child: ElevatedButton(onPressed: (){
          }, child: Text("Search Vehicle")),
        ),

      ],),),


    );
  }
}
