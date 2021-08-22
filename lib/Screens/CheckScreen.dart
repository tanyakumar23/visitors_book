import 'package:flutter/material.dart';
import 'package:visitors_book/Styles/constants.dart';
import 'dart:io';
import 'RegistrationScreen.dart';
// import 'package:intl/intl.dart';
import 'package:visitors_book/Screens/RegistrationScreen.dart';
import 'package:visitors_book/db/databse.dart';
import 'package:visitors_book/sql/notes.dart';



class CheckScreen extends StatefulWidget {
  final File? selfpicImgFile ;
  final String? name ;
  final String? comments;
  final String? address;
  final File? sigImgFile;
  // DateTime? createTime;


  CheckScreen({ @required this.selfpicImgFile, @required this.name, @required this.comments, @required this.address,  this.sigImgFile, }) ;

  @override
  _CheckScreenState createState() => _CheckScreenState();
}



class _CheckScreenState extends State<CheckScreen> {
  @override

  DateTime createdTime = DateTime.now();


  Future addNew() async {
    final book = Book(
      name: widget.name!,
      address: widget.address!,
      comments: widget.comments!,
    selfpicURL: widget.selfpicImgFile.toString(),
     sigURL: widget.sigImgFile.toString(),
      createdTime: createdTime,
    );
    await BookDatabase.instance.create(book);
  }


  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff0B1A32),

        body:

        SafeArea(
          child: Column(

            children: [
              Expanded(
                //flex: 5,
                child: Container(
                  margin: EdgeInsets.fromLTRB(20, 190, 20, 190),
                  height: 2,

                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.0),


                  ),


                  child: Column(

                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    // mainAxisSize: MainAxisSize.min,
                    // everything in center vertically, not from horizontal perspective.
                    crossAxisAlignment: CrossAxisAlignment.center,
                    // stretches the container to fit screen.


                    children: [
                      SizedBox(height: 20.0, width: 20.0,),

                      // Align(
                      //     alignment: Alignment.center),
                      CircleAvatar(
                        radius: 80.0,

                        backgroundColor: Colors.blue,
                        child: ClipOval(
                          child: SizedBox(
                              width: 300,
                              height: 300,
                              child:  (widget.selfpicImgFile != null) ? Image.file(
                                widget.selfpicImgFile!, fit: BoxFit.fitHeight,) :
                              Image.network(
                                "https://cdn.iconscout.com/icon/free/png-256/account-avatar-profile-human-man-user-30448.png",
                                fit: BoxFit.fill,
                              ),

                          ),
                        ),
                      ),
                      SizedBox(height: 10.0, width: 10.0,),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(widget.comments!, style: kFontStyle
                            .copyWith(color: Colors.black,
                          fontSize: 30,
                          fontFamily: 'EncodeSansSC',),
                          textAlign: TextAlign.center,),
                      ),
                      SizedBox(height: 7.0, width: 7.0,),


                      Text(widget.name! + ", " + widget.address!,
                          style: kFontStyle.copyWith(
                              color: Colors.black,
                              fontSize: 20,
                              fontFamily: 'EncodeSansSC'),
                          textAlign: TextAlign.center),
                      SizedBox(height: 5.0, width: 5.0,),
                      Text(
                        createdTime.toString(), style: kFontStyle.copyWith(
                          fontSize: 20, color: Colors.black),
                        textAlign: TextAlign.right,),

                      SizedBox(height: 10.0, width: 10.0,),
                      Container(

                        child: Padding(

                          padding: EdgeInsets.all(6),
                          child: Container(
                            constraints: BoxConstraints(
                                maxHeight: 70, maxWidth: 70
                            ),
                            child: Align(
                              //alignment: Alignment.topLeft,
                              widthFactor: 0.25,
                              heightFactor: 0.35,
                              child:
                              (widget.sigImgFile != null) ? Image.file(
                                widget.sigImgFile!, fit: BoxFit.fitHeight,) :
                              Image.network(
                                "https://cdn.iconscout.com/icon/free/png-256/account-avatar-profile-human-man-user-30448.png",
                                fit: BoxFit.fill,
                              ),

                            ),
                          ),


                        ),
                      ),
                      SizedBox(height: 20.0, width: 20.0,),
                      Row(

                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 30,width: 30,),
                          ElevatedButton(

                            style: ElevatedButton.styleFrom(
                                minimumSize: Size(120, 60),
                                primary: Color(0xff660B21)),
                            child: Text(
                              'Edit',
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () {
                              //print(nowDate);
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context) =>
                                      RegistrationScreen()));
                            },
                          ),
                          SizedBox(height: 40.0, width: 40.0,),

                          ElevatedButton(

                              style: ElevatedButton.styleFrom(
                                  minimumSize: Size(120, 60),
                                  primary: Color(0xff660B21)),
                              child: Text(
                                'Post',
                                style: TextStyle(color: Colors.white),
                              ),
                              onPressed: () async {
                                //UPLOAD TO FIREBASE
                                addNew();
                              }),


                      SizedBox(height: 40.0, width: 40.0,),
                    ],

                  ),
                ]),
              ),

              )],
          ),
        )
    );
  }
}