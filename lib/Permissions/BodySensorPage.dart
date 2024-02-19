import 'package:stepcount/Permissions/GoogleFitPermissionPage.dart';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:permission_handler/permission_handler.dart';

class BodySensorPage extends StatefulWidget{
  const BodySensorPage({super.key});
  @override
  State<BodySensorPage> createState() => _BodySensorPageState();

}

class _BodySensorPageState extends State<BodySensorPage> {
  bool _isBodySensorAllowed = false;
  Future<void> _requestBodySensorPermission( ) async{
    final PermissionStatus status = await Permission.sensors.request();
    if(status.isGranted){
      setState(() {
        _isBodySensorAllowed=true;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(child: Align(
        alignment: Alignment.topCenter,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.sensor_occupied,size: 60,color: Colors.green,),
              Text("Use your BodySensors",style: TextStyle(fontSize: 25,color: Colors.black),),
              SizedBox(height: 20,),
              Text("Use Body sensors in the background to detect and measure",style: TextStyle(fontSize: 12,color: Colors.black),),
              Text("physical activities and movements,such as steps taken",style: TextStyle(fontSize: 25,color: Colors.black),),
              Text("distance travelled,heart rate and other biometric measurements",style: TextStyle(fontSize: 25,color: Colors.black),),
              SizedBox(height:20),
              Text("These sensor may include an accelerometer and",style: TextStyle(fontSize: 25,color: Colors.black),),
              Text("other biometric measurements",style: TextStyle(fontSize: 25,color: Colors.black),),
              SizedBox(height:20),
              Image.asset('images/bodysensors.png'),
              SizedBox(height: 250,),

              Padding(
                padding: EdgeInsets.only(left: 250),
                child:MaterialButton(onPressed: (){
                  _requestBodySensorPermission();
                  if(_isBodySensorAllowed){
                    Fluttertoast.showToast(msg: 'Permission Granted');
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>GoogleFitPermissionPage(),),(Route<dynamic> route)=>false);
                  }
                },
                child: Text('Turn on'),color: Colors.green,)
                )

            ],
          ),
        ),
      ),),
    );
  }
}