import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class ScanScreen extends StatefulWidget {
  @override
  _ScanScreenState createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
<<<<<<< HEAD
  var qrstr = "";
=======
  var qrstr = "let's Scan it";
>>>>>>> ee61022648b5c1ec2525fd8f8895ec7d11c61b22
  var height,width;
  var scanArea ;
  @override
  Widget build(BuildContext context) {
    scanArea = (MediaQuery.of(context).size.width < 400 ||
        MediaQuery.of(context).size.height < 400)
        ? 200.0
        : 300.0;
    return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
<<<<<<< HEAD
              Text(qrstr,style: TextStyle(color: Colors.white,fontSize: 24),),
=======
              Text(qrstr,style: TextStyle(color: Colors.black,fontSize: 24),),
>>>>>>> ee61022648b5c1ec2525fd8f8895ec7d11c61b22
              ElevatedButton(style: ElevatedButton.styleFrom(
                primary: Colors.orangeAccent, // Background color
              ),onPressed: scanQr, child:
              Text(('Scan qr'))),
              SizedBox(height: scanArea,)
            ],
          ),
        )
    );
  }


  Future <void>scanQr()async{
    try{
      FlutterBarcodeScanner.scanBarcode('#2A99CF', 'cancel', true, ScanMode.QR).then((value){
        setState(() {
          qrstr=value;
        });
      });
    }catch(e){
      setState(() {
        qrstr='unable to read this';
      });
    }
  }
<<<<<<< HEAD
}
=======
}
>>>>>>> ee61022648b5c1ec2525fd8f8895ec7d11c61b22
