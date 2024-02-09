import 'package:flutter/material.dart';
import 'package:vehicle/services/vehicleservice.dart';

class add extends StatefulWidget {
  const add({super.key});

  @override
  State<add> createState() => _addState();
}

class _addState extends State<add> {
  TextEditingController getvehiclename=new TextEditingController();
  TextEditingController getvehiclenumber=new TextEditingController();
  TextEditingController getvehicletype=new TextEditingController();
  TextEditingController getvehicleprice=new TextEditingController();
  void Sendvaluetoapi()async{
    final response=await VehicleApiService().senddata(
        getvehiclename.text,
        getvehiclenumber.text,
        getvehicletype.text,
        getvehicleprice.text);
    if(response["status"]=="success")
    {
      print("successfully");
    }
    else
    {
      print("error");
    }


  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(title: Text("Vehicle Details"),backgroundColor: Colors.green.shade300,),
          body:SingleChildScrollView(
            child: Container(padding: EdgeInsets.all(20),child: Column(children: [
              TextField(controller: getvehiclename,decoration: InputDecoration(labelText: ("Vehicle Name"),border: OutlineInputBorder()),),
              SizedBox(height: 10,),
              TextField(controller: getvehiclenumber,decoration: InputDecoration(labelText: ("Vehicle Number"),border: OutlineInputBorder()),),
              SizedBox(height: 10,),
              TextField(controller: getvehicletype,decoration: InputDecoration(labelText: ("Vehicle Type"),border: OutlineInputBorder()),),
              SizedBox(height: 10,),
              TextField(controller: getvehicleprice,decoration: InputDecoration(labelText: ("Vehicle Price"),border: OutlineInputBorder()),),
              SizedBox(height: 10,),
              SizedBox(
                width: 250,
                height: 60,
                child: ElevatedButton(style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero)
                ),onPressed: Sendvaluetoapi,
                    child: Text("Submit")),
              ),
              SizedBox(height: 10,),
              SizedBox(
                width: 250,
                height: 60,
                child: ElevatedButton(style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero)
                ),onPressed: ()
                {
                  Navigator.pop(context);
                }, child: Text("Back")),
              )
            ],),),
          )

      ),
    );
  }
}
