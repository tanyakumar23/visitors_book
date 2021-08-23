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
import 'package:visitors_book/Widgets/ReuseableCard.dart';
import 'package:visitors_book/db/databaseHelper.dart';



class WelcomeScreen extends StatefulWidget {

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  // late List<Book> books ;
  final dbHelper = DatabaseHelper.instance;

  // bool isLoading = false;
  // late Book book;
  @override
  void initState(){
    super.initState();
    //refresh();
  }
  void _query() async {
    final allRows = await dbHelper.queryAllRows();
    print('query all rows:');
    allRows.forEach((row) => print(row));
  }
  // Future refresh() async {
  //   setState(() => isLoading = true);
  //
  //  this.books = await BookDatabase.instance.readAllBooks();
  //
  //   setState(() => isLoading = false,
  //   );
  // }

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
Expanded(child:
    Container(child: RaisedButton(
      color:Colors.transparent
      ,child: Text('query', style: TextStyle(fontSize: 20),),
      onPressed: () {_query();},
    ),)
      //ReuseableCard(books: books),


      )
      ]),
      ),
    ));

}}

