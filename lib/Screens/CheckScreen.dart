import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:visitors_book/Styles/constants.dart';
import 'dart:io';
import 'RegistrationScreen.dart';
import 'package:intl/intl.dart';
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
      createdTime: createdTime.toString(),
    );
    await BookDatabase.instance.create(book);
  }


  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
        image: DecorationImage(
        image: AssetImage('assets/bee.jpeg'),
    fit: BoxFit.cover,
    colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.6), BlendMode.darken)
    )
    ),
    child:
    Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: kMaroon,
        title: Text("Go back", style: TextStyle(fontFamily : 'LibreBaskerville-Regular')),
      ),
            body: SafeArea(
              child:
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0,0,0,2),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,

                      // mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(20, 90, 20, 90),
                          //height: 2,
                          padding: EdgeInsets.fromLTRB(10, 30, 20, 30),

                          decoration: BoxDecoration(
                            color: kCardBlue.withOpacity(0.6),
                            borderRadius: BorderRadius.circular(20.0),


                          ),


                          child: Row(

                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,


                            children: [

                                 Padding(

                                   padding: EdgeInsets.fromLTRB(20,10,1,10),
                                   child: ClipRRect(
                                     borderRadius: BorderRadius.circular(15.0),
                                     child: Container(
                                       child: Align(
                                         //alignment: Alignment.topLeft,
                                         child: (widget.selfpicImgFile != null) ? Image.file(
                                           widget.selfpicImgFile!,  fit: BoxFit.cover,
                                           width: 150,
                                           height: 200,) :
                                         Image.network(
                                           "https://cdn.iconscout.com/icon/free/png-256/account-avatar-profile-human-man-user-30448.png",
                                           //fit: BoxFit.fill,
                                           fit: BoxFit.cover,
                                           width: 200,
                                           height: 150,
                                         ),
                                         // fit: BoxFit.cover,
                                         // width: 200,
                                         // height: 150,
                                       ),
                                     ),
                                   ),
                                 ),

                              SizedBox(height: 10.0, width: 10.0,),

                                 Expanded(
                                     child: Column(

                                       crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text(widget.comments!, style: kFontStyle
                                            .copyWith(color: kLightBlue,
                                          fontSize: 20,
                                          fontFamily: 'Allison-Regular',),
                                          //textAlign: TextAlign.center,),
                                        ),

                              SizedBox(height: 7.0, width: 7.0,),
                              //Spacer(),


                              Text(widget.name! + ", " +  widget.address!,
                                      style: kFontStyle.copyWith(
                                          color: kLightBlue,
                                          fontSize: 20,
                                          fontFamily: 'Allison-Regular'),
                                      textAlign: TextAlign.center),

                              SizedBox(height: 5.0, width: 5.0,),
                              Text(
                                  DateFormat("yyyy-MM-dd").format(DateTime.now()), style: kFontStyle.copyWith(
                                      fontSize: 20, color: kLightBlue),
                                textAlign: TextAlign.right,),

                              SizedBox(height: 50.0, width: 50.0,),
                              Padding(

                                padding: EdgeInsets.all(6),
                                child: Container(
                                      constraints: BoxConstraints(
                                          maxHeight: 70, maxWidth: 70
                                      ),
                                      child: Align(
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
                              SizedBox(height: 20.0, width: 20.0,),


                                      ],  ),
                                   ),

                                   SizedBox(height:10),



            ]),),
                        SizedBox(height: 10.0, width: 10.0,),

                        ElevatedButton(

                          style: ElevatedButton.styleFrom(
                              minimumSize: Size(150, 60),
                              primary: Color(0xff660B21)),
                          child: Text(
                            'Post',
                            style: TextStyle(color: Colors.white, fontFamily: 'LibreBaskerville-Regular',fontSize: 18),
                          ), onPressed: (){
                          addNew();
                        },
                        ),
                      ],
                    ),
                  )
    ),
          ));
  }
}