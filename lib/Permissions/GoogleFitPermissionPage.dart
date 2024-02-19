import 'dart:html';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:stepcount/Permissions/BodySensorPage.dart';

class GoogleFitPermissionPage extends StatefulWidget{
  const GoogleFitPermissionPage({super.key});
  
  @override
  State<GoogleFitPermissionPage> createState() => _GoogleFitPermissionPageState();
}

class _GoogleFitPermissionPageState extends State<GoogleFitPermissionPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.sensor_occupied,size: 60,color: Colors.green,),
              Text("Use Google fit",style: TextStyle(fontSize: 25,color: Colors.black),),
              SizedBox(height: MediaQuery.of(context).size.height/10,),
              Text("Pedometer uses Google Fit app to retrive",style: TextStyle(fontSize: 12,color: Colors.black),),
              Text("Steps tracking distance tracking,calories tracking",style: TextStyle(fontSize: 25,color: Colors.black),),
              SizedBox(height: MediaQuery.of(context).size.height/10,),
              Image.asset('images/googlefit.png'),
              SizedBox(height: MediaQuery.of(context).size.height/3,),
              MaterialButton(onPressed: (){
                _requestGoogleFitPermission();
              },
              child: Text("Turn On"),color: Colors.green,)
              
            ],
    )
      )
    );
  }

  Future<void> _requestGoogleFitPermission() async {
    PermissionStatus status = await Permission.activityRecognition.request();
    if(status.isGranted){
      Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context)=> BodySensorPage(),),(Route<dynamic> route)=>false);
    }
    else{
      Fluttertoast.showToast(msg: "Google Fit Permission denied");
    }
  
}
  
}

