import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:visitors_book/Styles/constants.dart';
import 'package:visitors_book/Screens/RegistrationScreen.dart';
import 'package:visitors_book/Widgets/widgets.dart';
import 'package:intl/intl.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:visitors_book/db/databse.dart';
import 'package:visitors_book/db/notes.dart';
import 'dart:async';
import 'dart:io';




class WelcomeScreen extends StatefulWidget {

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  // late List<Book> books ;
    late List allRows ;
  final dbHelper = DatabaseHelper.instance;
  final isLoading = false;
  // final List allRow;

  // bool isLoading = false;
  // late Book book;

  @override
  void initState(){
    super.initState();

    _query();
  }
   Future  _query() async {

      allRows = await dbHelper.queryAllRows();

    print('query all rows: ');
print(allRows[0]);
print(allRows.length);

  }





  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/bckgrd2.jpg'),
          fit: BoxFit.cover,
         colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.6), BlendMode.darken)
        )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 80,
          leading: CircleAvatar(
            backgroundColor:kMaroon
          ,
            radius: 70,
            child: ClipOval(

              child: IconButton(
                icon: Image.asset('images/nn.png',),


                onPressed: () {}, iconSize: 100.0,),

            ),
          ),
          actions: [
            CircleAvatar(
            backgroundColor:   kLightBlue,
          radius: 14,
          child: Center(
            child: ClipOval(

                child:

              IconButton(
                icon: Icon(Icons.close, color: Colors.white,), padding: EdgeInsets.all(0),
                onPressed: () {
                  SystemNavigator.pop();
                },
              ),
            ),
          ))],
          title: Center(
            child: Text(
                "          WELCOME TO \n "
                    "OFFICER'S  MESS HQ CME ", style: kFontStyle.copyWith(
                fontSize: 17.0, fontFamily: 'LibreBaskerville-Regular')),
          ),
          backgroundColor: kMaroon,

        ),
        bottomNavigationBar: BottomAppBar(
          color: kMaroon,
          child: Padding(
            padding:  EdgeInsets.all(8.0),
            child: Row(

              children: [

                Spacer(),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircleAvatar(
                        backgroundColor: kDarkBlue,
                        radius: 19,

                        child: IconButton(
                          icon: Icon(Icons.app_registration, color:
                            kLightBlue),
                          onPressed: () {
                            // Navigator.pop(context)

                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) =>
                                    RegistrationScreen()));
                          },
                        ),
                      ),
                      SizedBox(height: 5, width: 5,),
                      Text(
                        'Add New Entry',
                        style: TextStyle(color: kLightBlue, fontSize: 14, fontFamily: 'LibreBaskerville-Regular') ,
                      ),
                    ],
                  ),
                ),

                Spacer(),
              ],
            ),
          ),
        ),

        //BODY STARTS HERE
        body: Center(
          child : Column(mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
          SizedBox(height: 10, width: 10,),

        Flexible(
          child: Carousel(),
      ),


      SizedBox(height: 20.0, width: 20.0,),
          //isLoading
//               ? CircularProgressIndicator()
//               : books.isEmpty
//               ? Text(
//               'No Notes',)
// :


          ////////////////////////////////////////////////////////////////////
Expanded(child:

ListView.builder(
    padding: const EdgeInsets.all(8),
    itemCount: allRows.length,
    itemBuilder: (BuildContext context, int index) {
      final row = allRows[index];

      return Container(

        child:Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(
                    5.0, 15.0, 5.0, 15.0),
                child: Column(
                  children: [
                    Row(
                        children: <Widget>[

                          Expanded(
                            child:  Padding(
                              padding: const EdgeInsets.fromLTRB(0,0,0,2),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceAround,

                                // mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                   // margin: EdgeInsets.fromLTRB(20, 90, 20, 90),
                                    //height: 2,
                                    padding: EdgeInsets.fromLTRB(0, 30, 20, 20),

                                    decoration: BoxDecoration(
                                      color: kCardBlue.withOpacity(0.6),
                                      borderRadius: BorderRadius.circular(20.0),


                                    ),


                                    child: Row(

                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment: CrossAxisAlignment.start,


                                        children: [

                                          Padding(

                                            padding: EdgeInsets.fromLTRB(20,1,1,10),
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.circular(15.0),
                                              child: Container(
                                                child: Align(
                                                  //alignment: Alignment.topLeft,
                                                  child:
    Image.file(File(row['selfpicURL'])),
                                                    // width: 150,
                                                    // height: 250,)
                                                    //
                                                    // fit: BoxFit.cover,
                                                    // width: 200,
                                                    // height: 150,
                                                  ),
                                                  // fit: BoxFit.cover,
                                                  width: 20,
                                                  height: 15,
                                                ),
                                              ),
                                            ),


                                          SizedBox(height: 14.0, width: 14.0,),

                                          Expanded(
                                            child: Column(

                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Text(row['comments'], style: kFontStyle
                                                    .copyWith(color: kLightBlue,
                                                  fontSize: 35,
                                                  fontFamily: 'GreatVibes-Regular',),
                                                  //textAlign: TextAlign.center,),
                                                ),

                                                SizedBox(height: 7.0, width: 7.0,),
                                                //Spacer(),


                                                Text(row['name'] + ", " +  row['address'],
                                                    style: kFontStyle.copyWith(
                                                        color: kLightBlue,
                                                        fontSize: 35,
                                                        fontFamily: 'Allison-Regular'),
                                                    textAlign: TextAlign.center),

                                                SizedBox(height: 5.0, width: 5.0,),
                                                Text(
                                                  row['time'], style: kFontStyle.copyWith(
                                                    fontSize: 20, color: kLightBlue,fontFamily: 'Allison-Regular'),
                                                  textAlign: TextAlign.right,),

                                                SizedBox(height: 30.0, width: 30.0,),
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
                                                      Image.file(File(row['selfpicURL'])),

                                                        //fit: BoxFit.fill,
                                                      ),

                                                    ),
                                                  ),





                                              ],  ),
                                          ),




                                        ]),),



    ],
                              ),
                            )
                          ),


                        ]
                    ),
                    SizedBox(height: 5, width: 5,),
                    Divider(
                      color: Color(0xffdbb112),
                      thickness: 1,
                    ),
                    ],
                ),
              ),
            ]),

      );
    }
),),

    ])
    )
    ));

      //ReuseableCard(books: books),




}}

