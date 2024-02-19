

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:fluttertoast/fluttertoast.dart';
class Location extends StatelessWidget{
  const Location({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(top:60),
            child: Column(
              children: [
                Icon(Icons.location_on,size: 60,color: Colors.green,),
                Text('Use Location',style: TextStyle(fontSize: 25,color: Colors.black),),
                SizedBox(height: MediaQuery.of(context).size.height/20,),
                Text('Use Location sensor in the background to map your',style: TextStyle(fontSize: 12,color: Colors.black),),
                Text('walks,runs and get more accurate workout metrics',style: TextStyle(fontSize: 12,color: Colors.black),),
                SizedBox(height: MediaQuery.of(context).size.height/20,),
                Text('App will collect location data even when app is called',style: TextStyle(fontSize: 12,color: Colors.black),),
                Text('or not in use',style: TextStyle(fontSize: 12,color: Colors.black),),
                SizedBox(height: MediaQuery.of(context).size.height/10,),
                Image.asset('images/location1.png'),
                SizedBox(height: MediaQuery.of(context).size.height/10,),
                Padding(
                  padding: EdgeInsets.only(left: 250),
                  child: MaterialButton(onPressed:(){
                    _requestLocationPermission(context);
                  },
                  child: Text('Turn On'),color: Colors.green,),)
                

              ],
            ),),
        ),
      ),
    );
  }
  Future<void> _requestLocationPermission(BuildContext context) async{
    final PermissionStatus status=await Permission.location.request();
    if(status.isGranted){
      Fluttertoast.showToast(msg: "Please enable Location");
    }
  }

}