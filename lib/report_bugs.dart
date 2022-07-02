import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ReportBugs extends StatelessWidget {
  static String routeName = 'Report Bugs';
  void _contact() async {
    final url = 'Kemeproject2022@gmail.com';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
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
        TextField(
          enableSuggestions: true,
          autocorrect:true,
          cursorColor: Colors.white,
          style: TextStyle(color: Colors.white.withOpacity(0.9),fontSize: 16),
          decoration: InputDecoration(
            labelText: "Title",
            labelStyle: TextStyle(color: Colors.white.withOpacity(0.9),fontSize: 16),
            filled: true,
            isDense: true,
            floatingLabelBehavior: FloatingLabelBehavior.never,
            fillColor: Colors.white.withOpacity(0.3),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
          ),
        ),
        SizedBox(height: 20,),
        TextField(
          enableSuggestions: true,
          autocorrect:true,
          maxLines: 6,
          cursorColor: Colors.white,
          style: TextStyle(color: Colors.white.withOpacity(0.9),fontSize: 16),
          decoration: InputDecoration(

            labelText: "Description",
            labelStyle: TextStyle(color: Colors.white.withOpacity(0.9),fontSize: 16),
            filled: true,
            floatingLabelBehavior: FloatingLabelBehavior.never,
            fillColor: Colors.white.withOpacity(0.3),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
          ),
        ),
        SizedBox(height: 20,),
        RaisedButton(
          onPressed: (){_contact();},
          child: Text('Send Mail'),
        ),


      ]
      ),
    ),
    ),
        ),);
  }
}
