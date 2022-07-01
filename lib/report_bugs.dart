import 'package:flutter/material.dart';

class ReportBugs extends StatelessWidget {
  static String routeName = 'Report Bugs';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff212126),
        appBar: AppBar(
          title: Text("Keme",style: TextStyle(fontSize: 20),),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          automaticallyImplyLeading: false,
        ),
        body: SingleChildScrollView(
        child: Padding(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
    child: Center(
      child: Column(
      children: <Widget>[
      Image.asset(
      "assets/images/logo.png",
      width: 200,
      height: 200,
      ),
      SizedBox(height: 30,),

]
      ),
    ),
    ),
        ),);
  }
}
