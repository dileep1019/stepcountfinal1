import 'package:flutter/material.dart';
import 'package:stepcount/Permissions/BodySensorPage.dart';

class PermissionDescription extends StatefulWidget{
  const PermissionDescription({super.key});
  @override
  State<PermissionDescription> createState() => _PermissionDescriptionState();

}

class _PermissionDescriptionState extends State<PermissionDescription>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: Align(alignment: Alignment.topCenter,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.directions_walk_outlined,size:60,color:Colors.green),
              Text("Track your activities",style: TextStyle(fontSize: 25,color: Colors.black),),
              SizedBox(width: MediaQuery.of(context).size.height/10,),
              Text("Pedometer app can track walking , running and cycling in the",style: TextStyle(fontSize: 15,color: Colors.black),),
              Text("background. This means that you'll get metric like steps",style: TextStyle(fontSize: 15,color: Colors.black),),
              Text("distance and calories for all these activities",style: TextStyle(fontSize: 15,color: Colors.black),),
              SizedBox(height: MediaQuery.of(context).size.height/10,),
              Text("To do this, the app need permissions to recognize your",style: TextStyle(fontSize: 15,color: Colors.black),),
              Text("activity.Over time ,Pedometer also uses this data to personalize",style: TextStyle(fontSize: 15,color: Colors.black),),
              Text("your experience , and recognize any activity better .",style: TextStyle(fontSize: 15,color: Colors.black),),
              SizedBox(width: MediaQuery.of(context).size.height/5,),
              Row(
                children: [
                  SizedBox(width: MediaQuery.of(context).size.height/8,),
                  Icon(Icons.directions_walk_outlined,size: 60,color: Colors.green,),
                  SizedBox(width: MediaQuery.of(context).size.height/8,),
                  Icon(Icons.directions_run_outlined,size:60,color: Colors.green,),
                  SizedBox(width: MediaQuery.of(context).size.height/8,),
                  Icon(Icons.pedal_bike_outlined,size: 60,color: Colors.green,),
                  SizedBox(width: MediaQuery.of(context).size.height/8,),
                ],
              ),
                  SizedBox(height: MediaQuery.of(context).size.height/3,),
                  Padding(padding: EdgeInsets.only(left: 250),
                  child: MaterialButton(onPressed: ()=>Navigator.push(context, 
                  MaterialPageRoute(builder: (context)=> BodySensorPage())),
                  child: Text('Turn On ',style:TextStyle(color: Colors.black)),color: Colors.green,),
                  )

            ],
          ),),
        ),
    )
    );
  }

}