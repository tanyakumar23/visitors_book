import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:visitors_book/Styles/constants.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';
import 'package:visitors_book/Screens/CheckScreen.dart';
import 'dart:ui' as ui;
import 'package:path_provider/path_provider.dart';
import 'dart:async';
import 'package:image_cropper/image_cropper.dart';
import 'package:path/path.dart';
import 'dart:typed_data';
import 'dart:math';










class RegistrationScreen extends StatefulWidget {


  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {

  final _formKey = GlobalKey<FormState>();
  String name = '';
  String comments = '';
  String address = '';

  File? _imageFile ;
  File? imgCropped ;

  File? sigImgFile ;
File? selfpicImgFile;


  GlobalKey<SfSignaturePadState> _signaturePadKey = GlobalKey();

  final picker = ImagePicker();



  AlertDialog? alert ;
  AlertDialog alert2 = AlertDialog(
    title: Text("Please save signature", textAlign: TextAlign.center,),

    actions: [
    ],
  );


  Future pickImage() async {
    var pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      imgCropped = await ImageCropper.cropImage(
        sourcePath: pickedFile.path,
        aspectRatio: CropAspectRatio(
            ratioX: 1, ratioY: 1
        ), compressQuality: 100,
        compressFormat: ImageCompressFormat.jpg,
      );


      setState(() {
        _imageFile = imgCropped;
      });
    }

    Directory appDocDir = await getApplicationDocumentsDirectory();


    final fileName = basename(_imageFile!.path);
    selfpicImgFile = await _imageFile!.copy('${appDocDir.path}/$fileName');
   //savedImage = saveImage.toString();
 //  createTime = DateTime.now();
  }
  Future<void> saveSignatureImage() async {

    Random random = new Random();
    int randomNumber = random.nextInt(100);
    RenderSignaturePad boundary = _signaturePadKey.currentContext!.findRenderObject() as RenderSignaturePad;
    ui.Image image = await boundary.toImage();
    //final bytes = Io.File(image).readAsBytesSync();
    final directory = (await getApplicationDocumentsDirectory()).path;
    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    Uint8List pngBytes = byteData!.buffer.asUint8List();
    File imgFile = new File('$directory/photo$randomNumber.png');
    imgFile.writeAsBytes(pngBytes);
    sigImgFile = imgFile;

    // Directory appDir = await getApplicationDocumentsDirectory();
    // String appDocPath = appDocDir.path;


   // final fileName = basename(image!.path);
   // final  signatureImage = await imageFile!.copy('${appDir.path}/$fileName');
    //sigsavedImage = signatureImage.toString();


  }




  @override
  Widget build(BuildContext context) {

    return Container(
        decoration: BoxDecoration(
        image: DecorationImage(
        image: AssetImage('assets/bee.jpeg'),
    fit: BoxFit.cover,
    colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.6), BlendMode.darken)
    )
    ),
    child: Scaffold(
        backgroundColor: Colors.transparent,        appBar: AppBar(
          backgroundColor: kMaroon,
          title: Text("New Entry",style: TextStyle(fontFamily: 'LibreBaskerville-Regular'),),
        ),
        body: SingleChildScrollView(
          //scrollDirection: Axis.vertical,

          child: Padding(
            padding: const EdgeInsets.all(38.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.min,

                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[


                  Form(
                    key: _formKey,
                    child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Center(child: ImageProfile()),
                          SizedBox(height: 20.0, width: 10.0,),

                          Text("Add Your Name", style: kTextFieldReg,),
                          SizedBox(height: 10, width: 10,),
                          TextFormField(
                            style: TextStyle(color: Colors.white),
                            decoration: kTextField,

                            validator: (value) {

                              name = value!;

                              if (value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 20.0, width: 20.0,),
                          Text("Add Your Address", style: kTextFieldReg,),
                          SizedBox(height: 10, width: 10,),

                          TextFormField(
                            style: TextStyle(color: Colors.white),
                            decoration: kTextField.copyWith(
                              hintText: 'Enter your address', ),


                            validator: (value) {
                              address = value!;

                              if (value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 20.0, width: 20.0,),
                          Text("Add Your Comments", style: kTextFieldReg,),
                          SizedBox(height: 10, width: 10,),
                          TextFormField(
                            style: TextStyle(color: Colors.white),maxLength: 155,
                            //maxLengthEnforced: true

                            decoration: kTextField.copyWith(

                              hintText: 'Enter your comments',),
                            maxLines: 5,

                            validator: (value) {
                              comments = value!;

                              if (value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                          )
                        ]),
                  ),




                  SizedBox(width: 20, height: 20,),
                  Text('Add Your Signature', style: kTextFieldReg,),
                  SizedBox(height: 10, width: 10,),
                  Container(
                    child: SfSignaturePad(
                      key: _signaturePadKey,
                      minimumStrokeWidth: 1,
                      maximumStrokeWidth: 3,
                      strokeColor: Colors.white,
                      backgroundColor: kCardBlue,
                    ),
                    height: 200,
                    width: 300,
                  ),


                  Row(
                      children: [
                        Text('clear image', style: kTextFieldReg,),
                        SizedBox(height:4, width: 4 ),
                        IconButton(
                            onPressed: () async {
                          _signaturePadKey.currentState!.clear();
                      }, icon: CircleAvatar(
                  backgroundColor: kLightBlue,
                  radius: 19,
                  child: ClipOval(

                      child:Icon((Icons.close), color: Colors.white, ))
              )),
    Text('save image', style: kTextFieldReg,),
    SizedBox(height:4, width: 4 ),
    IconButton(onPressed: ()

     {
       saveSignatureImage();
     },
    icon: CircleAvatar(
    backgroundColor: kLightBlue,
    radius: 19,
    child: ClipOval(

    child:Icon((Icons.check), color: Colors.white, ))
    ))

          ])
                  ,
                  SizedBox(width: 20, height: 20,),
                  ElevatedButton(
                      child: Text(
                        'Add',
                        style: TextStyle(color: Colors.white,fontFamily: 'LibreBaskerville-Regular',fontSize: 18),
                      ),
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(150, 60), primary: Color(0xff660B21),),
                      onPressed: () async{

                        if (_formKey.currentState!.validate()) {

                          _formKey.currentState!.save();
                          if (_imageFile != null && sigImgFile != null) {

                            Image.file(_imageFile!, fit: BoxFit.fill,);
                            Navigator.push(context, MaterialPageRoute(
                                builder: (context) =>
                                    CheckScreen(
                                        selfpicImgFile: selfpicImgFile,
                                        name: name,
                                        comments: comments,
                                        address: address,
                                        sigImgFile: sigImgFile,
                                       )));
                          }
                          else if(_imageFile == null){
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return  AlertDialog(
                                title: Text("Please enter image", textAlign: TextAlign.center,),

                                actions: [
                                TextButton(
                                child: Text("OK"),
                                onPressed: () {
                                Navigator.pop(context);
                                },
                                ),
                                ],
                                );
                              });
                                }
    else if(sigImgFile == null){
    showDialog(
    context: context,
    builder: (BuildContext context) {
    return  AlertDialog(
    title: Text("Please save signature", textAlign: TextAlign.center,),

    actions: [
    TextButton(
    child: Text("OK"),
    onPressed: () {
    Navigator.pop(context);
    },
    ),
    ],
    );
    },
                            );
                          }


                        }


                        })]



    ),

    ),
        )
    ));
  }


  Widget ImageProfile(){
    return Stack(
      // alignment: Alignment.center,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(0,2,2,20),
            //alignment:  Alignment.center,

            child: CircleAvatar(

              radius: 70.0,

              backgroundColor: Color(0xff660B21),
              child: ClipOval(
                child: SizedBox(
                    width: 300,
                    height:300,
                    child: (_imageFile!=null)?Image.file(_imageFile!, fit: BoxFit.fill,):
                    Image.network("https://cdn.iconscout.com/icon/free/png-256/account-avatar-profile-human-man-user-30448.png",fit: BoxFit.fill,)


                ),
              ),
            ),
          ),

//SizedBox(height: 10, width: 10,),
          // Padding(
          //  padding:  EdgeInsets.all(10.0),

          Positioned(
            top: 112,
            left: 90,
    child: CircleAvatar(

    radius: 20.0,

    backgroundColor: kLightBlue,
    child:ClipOval(
            child:  IconButton(
                padding:  EdgeInsets.fromLTRB(0,0,7,7),
                alignment: Alignment.bottomRight,
                icon: Icon( Icons.camera_alt,),
                color: Colors.white,
                onPressed:() {
                  pickImage();

                }),
          ),
          // ),

    ))])


    ;}


}
