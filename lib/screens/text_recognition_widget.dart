import 'dart:io';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:keme/api/firebase_ml_api.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:text_to_speech/text_to_speech.dart';
import 'package:translator/translator.dart';

class TextRecognitionWidget extends StatefulWidget {
  const TextRecognitionWidget({
    Key? key,
  }) : super(key: key);

  @override
  _TextRecognitionWidgetState createState() => _TextRecognitionWidgetState();
}

class _TextRecognitionWidgetState extends State<TextRecognitionWidget> {
  String text = '';
  String translatedText = '';
  String originalText = '';
  String? selectedValue;
  String targetLang = '';
  File? image;
  bool loading = false;
  bool translateIcon = false;
  TextToSpeech tts = TextToSpeech();
  FlutterTts flutterTts = FlutterTts();


  List<String> items = ['Arabic', 'French', 'German', 'Italian', 'Japanese'];
  @override
  Widget build(BuildContext context) => Expanded(
    child: SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 280,
            width: 305,
            margin: const EdgeInsets.only(top: 50),
            padding: const EdgeInsets.only(left: 28, bottom: 10, right: 18),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        translateIcon? GestureDetector(
                          onTap: (){
                            _speak(translatedText);
                          },
                          child: Icon(Icons.volume_up ,color: Colors.amber,
                            size: 25,),
                        ):Container(),
                        SizedBox(width: 10,),
                        translateIcon
                            ? DropdownButtonHideUnderline(
                          child: DropdownButton2(
                            hint: Text(
                              'Select Language',
                              style: TextStyle(
                                fontSize: 14,
                                color: Theme.of(context).hintColor,
                              ),
                            ),
                            style: TextStyle(color: Colors.black),
                            items: items
                                .map((item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ))
                                .toList(),
                            value: selectedValue,
                            onChanged: (value) {
                              setState(() {
                                selectedValue = value as String;
                                if (selectedValue == "Arabic") {
                                  targetLang = 'ar';
                                  translateText();
                                } else if (selectedValue == "French") {
                                  targetLang = 'fr';
                                  translateText();
                                } else if (selectedValue == "German") {
                                  targetLang = 'de';
                                  translateText();
                                } else if (selectedValue == "Italian") {
                                  targetLang = 'it';
                                  translateText();
                                } else if (selectedValue == "Japanese") {
                                  targetLang = 'ja';
                                  translateText();
                                }
                              });
                            },
                            itemPadding: const EdgeInsets.only(left: 16, right: 16),
                            dropdownWidth: 160,
                            dropdownPadding: const EdgeInsets.symmetric(vertical: 6),
                            dropdownDecoration: BoxDecoration(borderRadius: BorderRadius.circular(4), color: Colors.white),
                            dropdownElevation: 8,
                            offset: const Offset(0, 8),
                            customButton: Icon(
                              Icons.g_translate_outlined,
                              color: Colors.amber,
                              size: 25,
                            ),
                          ),
                        )
                            : Container()
                      ],
                    ),
                    SizedBox(height: 10,),
                    loading
                        ? Padding(
                      padding: const EdgeInsets.only(top: 100.0),
                      child: LoadingFadingLine.circle(
                        size: 70,
                        backgroundColor: Colors.deepOrange,
                      ),
                    )
                        : Text(
                      translatedText,
                      style: const TextStyle(fontSize: 15,color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            decoration: const BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/images/note.png'), fit: BoxFit.cover),
            ),
          ),
          SizedBox(height: 20,),
          Container(
              width: 240,
              height: 240,
              decoration: BoxDecoration(
                  color: Colors.black,
                  border: Border.all(
                    color: Colors.white,
                    width: 2,
                  )),
              child:  Center(

                child: TextButton(

                  onPressed: () {

                    pickImage();

                  },

                  child: image != null

                      ? Image.file(

                    image!,

                    fit: BoxFit.cover,




                  )

                      : Container(

                    width: 240,

                    height: 200,

                    child: const Icon(

                      Icons.camera_enhance_sharp,

                      size: 100,

                      color: Colors.grey,

                    ),

                  ),

                ),

              )
          )



          ,SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Back"),
                color: Colors.orange,
              ),
              SizedBox(
                width: 20,
              ),
              FlatButton(
                onPressed: () {
                  setState(() {
                    translatedText = '';
                    image = null;
                    translateIcon = false;
                  });
                },
                child: Text("Clear"),
                color: Colors.orange,
              ),


            ],
          )
        ],
      ),
    ),
  );

  Widget buildImage() => Container(
    child: image != null ? Image.file(image!) : Icon(Icons.photo, size: 80, color: Colors.white),
  );

  Future pickImage() async {
    final file = await ImagePicker().getImage(source: ImageSource.camera);
    image = File(file!.path);


    setState(() {
      image;
      loading = true;
      scanText();
    });
    setImage(File(file.path));
  }

  Future scanText() async {
    final text = await FirebaseMLApi.recogniseText(image!);
    if (text != null) {
      setState(() {
        loading = false;
        translateIcon = true;
      });
      setText(text);
    }
  }

  void translateText() async {
    final translator = GoogleTranslator();

    final input = originalText;

    translator.translate(input, from: 'en', to: targetLang).then((value) {
      setState(() {
        translatedText = '';

        translatedText = value.text;
        RegExp whiteSpaces = RegExp(r"/\s+/");

        translatedText = translatedText.replaceAll("\n", " ");
        translatedText = translatedText.replaceAll(whiteSpaces, "");
      });
    });
  }

  void setImage(File? newImage) {
    setState(() {
      image = newImage;
    });
  }

  void setText(String newText) {
    setState(() {
      RegExp whiteSpaces = RegExp(r"/\s+/");
      translatedText = newText;
      translatedText = translatedText.replaceAll("\n", " ");
      translatedText = translatedText.replaceAll(whiteSpaces, "");

      originalText = newText;
    });
  }
  Future _speak(String text) async{
    print(await flutterTts.getLanguages);


    await flutterTts.setSpeechRate(0.7);


    await flutterTts.speak(text);
  }
}
