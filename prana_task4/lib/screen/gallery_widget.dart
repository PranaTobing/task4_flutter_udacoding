import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class GalleryWidget extends StatefulWidget {
  @override
  _GalleryWidgetState createState() => _GalleryWidgetState();
}

class _GalleryWidgetState extends State<GalleryWidget> {
  Future<List> getDataN() async{
    final response = await http.get('https://pranatobing.000webhostapp.com/api_task4/gallery.php');
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [
              Colors.green[400],
              Colors.green[300],
              Colors.green[100],
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 80.0),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Farm Gallery", style: TextStyle(color: Colors.white, fontSize: 35.0),),
                  // SizedBox(height: 5.0,),
                ],
              ),
            ),
            SizedBox(height: 10.0),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25))
                ),
                child: SingleChildScrollView(
                  physics: ScrollPhysics(),
                  child: Padding(
                    padding: EdgeInsets.only(top: 1.0),
                    child: Column(
                      children: <Widget>[
                        FutureBuilder(
                          future: getDataN(),
                          builder: (context, snapshot){
                            if(snapshot.hasError) {
                              print(snapshot.error);
                            }
                            return snapshot.hasData 
                              ? ItemGList(list: snapshot.data,)
                              : Center(child: CircularProgressIndicator());
                          }
                        ),
                      ]
                    )
                  )
                )
              ),
            ),
          ]
        ),
      ),
    );
  }
}

class ItemGList extends StatelessWidget {
  final List list;

  ItemGList({this.list});
  
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20
      ),
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: list.length,
      itemBuilder: (context, index){
        return InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return DetailGallery(list: list, index: index);
            }));
          },
          child: Container(
            height: 100,
            width: 100,
            margin: EdgeInsets.fromLTRB(20, 0, 20, 20),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(list[index]['mfg_photo']),
                fit: BoxFit.fill,
              ),
              border: Border.all(
                color: Colors.green.withOpacity(0.6),
                width: 5,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
              // shape: BoxShape.circle,
            ),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                padding: EdgeInsets.all(10.0),
                color: Colors.grey.withOpacity(0.7),
                child: Text(
                  list[index]['mfg_title'], 
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          )
        );
      }
    );
  }
}

class DetailGallery extends StatelessWidget {
  final List list;
  final int index;

  DetailGallery({this.list, this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[400],
      ),
      body: ListView(
        children: <Widget>[
          Image.network(list[index]['mfg_photo']),
          Container(
            padding: EdgeInsets.fromLTRB(32, 32, 32, 0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding : EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          "Pertanian di ${list[index]['mfn_title']}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                            fontSize: 18.0
                          ),
                        ),
                      ),
                      /*Text(
                        DateFormat('dd-MMM-yyyy kk:mm').format(DateTime.parse(list[index]['mfn_createddate'])),
                        style: TextStyle(
                          color: Colors.black54
                        ),
                      ) */
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(32, 32, 32, 30),
            child: Text(list[index]['mfg_desc'], softWrap: true,),
          ),
        ],
      ),
    );
  }
}