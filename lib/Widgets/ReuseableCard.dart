import 'package:flutter/widgets.dart';
import 'package:visitors_book/db/databse.dart';
import 'package:visitors_book/sql/notes.dart';
import 'package:flutter/material.dart';
import 'package:visitors_book/Styles/constants.dart';
class ReuseableCard extends StatelessWidget {
  const ReuseableCard({
    Key? key,
    required this.books,
  }) : super(key: key);

  final List<Book> books;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: books.length,
        itemBuilder: (BuildContext context, int index) {
          final book = books[index];

          return Container(
            height: 50,
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
                                child: Container(

                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color(0xff0f2442),


                                  ),

                                  padding: EdgeInsets.all(12.0),

                                  child: Row(

                                      children: [

                                        Expanded(

                                          child: Container(

                                            child: Padding(

                                              padding: EdgeInsets.all(10),
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.circular(15.0),
                                                child: Container(
                                                  child: Align(
                                                    alignment: Alignment.topLeft,
                                                    child: Image.network("data:image/jpeg;base64,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",
                                                      fit: BoxFit.cover,
                                                      width: 200,
                                                      height: 150,
                                                    ),
                                                  ),
                                                ),
                                              ),


                                            ),
                                          ),

                                        ),


                                        SizedBox(height: 10.0,
                                            width: 30.0),
                                        Expanded(
                                          child: Column(
                                              mainAxisAlignment: MainAxisAlignment
                                                  .center,
                                              children: [
                                                SizedBox(height: 7.0,
                                                  width: 7.0,),

                                                Text(book.address,
                                                    style: kFontStyle
                                                        .copyWith(
                                                        color: Colors
                                                            .white, fontWeight: FontWeight.w300,
                                                        fontFamily: 'LibreCaslonDisplay-Regular',
                                                        fontSize: 20)),

                                                SizedBox(height: 7.0,
                                                  width: 7.0,),
                                                Center(
                                                  child: Text( book.comments
                                                    ,
                                                    style: kFontStyle
                                                        .copyWith(
                                                        color: Colors
                                                            .white,fontWeight: FontWeight.w900,
                                                        fontFamily: 'Montserrat-Medium',
                                                        fontSize: 12.0),),
                                                ),
                                                SizedBox(height: 10.0,
                                                  width: 10.0,),
                                                Text(book.name,

                                                  style: kFontStyle
                                                      .copyWith(
                                                      fontSize: 9,
                                                      color: Colors
                                                          .white),
                                                  textAlign: TextAlign
                                                      .right,),
                                                //Text(document['address'], style: kStyle.copyWith(color: Colors.white,fontFamily: 'EncodeSansSC'), ),
                                                SizedBox(height: 5,width: 5,),
                                                Container(

                                                  child: Padding(

                                                    padding: EdgeInsets.all(10),
                                                    child: Container(
                                                      constraints: BoxConstraints(
                                                          maxHeight:30 , maxWidth:30
                                                      ),
                                                      child: Align(
                                                        alignment: Alignment.topLeft,
                                                        // widthFactor: 8.75,
                                                        // heightFactor: 0.75,
                                                        child: //Image.file(File(book.selfpicURL)),
                                                        Image.network("data:image/jpeg;base64,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",
                                                          //   fit: BoxFit.cover,
                                                          //   width: 120,
                                                          //   height: 50,
                                                        ),
                                                      ),
                                                    ),


                                                  ),



                                                ),]
                                          ),

                                        ),
                                      ]), //
                                ),
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
    );
  }
}

