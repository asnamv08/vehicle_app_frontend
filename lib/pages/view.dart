import 'package:flutter/material.dart';
import 'package:vehicle/models/vehiclemodel.dart';
import 'package:vehicle/services/vehicleservice.dart';

class vehicleview extends StatefulWidget {
  const vehicleview({super.key});

  @override
  State<vehicleview> createState() => _vehicleviewState();
}

class _vehicleviewState extends State<vehicleview> {
  Future<List<Posts>>? data;
  void initState() {
    // TODO: implement initState
    super.initState();
    data=VehicleApiService().getPosts();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.arrow_back),
        ),
        body: FutureBuilder(
            future: data,
            builder: (context,snapshot){
              if(snapshot.hasData && snapshot.data!.isNotEmpty){
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder:(value,index){
                      return Card(
                        child: Column(
                          children: [
                            ListTile(
                                title:  Text("Name: "+snapshot.data![index].vehiclename.toString()),
                                subtitle: Text("Number:"+snapshot.data![index].vehiclenumber.toString()+"\n"+"Type:"+snapshot.data![index].vehicleType.toString()+"\n"+"Price:"+snapshot.data![index].vehicleprice.toString()),
                                leading:CircleAvatar(child: Text(snapshot.data![index].vehiclename.toString()[0]),)
                            )
                          ],
                        ),
                      );

                    }
                );
              }
              else{
                return Text("Fetching data");
              }

            }

        ),


      ),
    );
  }
}
