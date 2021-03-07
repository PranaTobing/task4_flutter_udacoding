import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:intl/intl.dart';

class NewsWidget extends StatefulWidget {
  @override
  _NewsWidgetState createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  Future<List> getDataN() async{
    final response = await http.get('https://pranatobing.000webhostapp.com/api_task4/news.php');
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
                  Text("Farm News", style: TextStyle(color: Colors.white, fontSize: 35.0),),
                  SizedBox(height: 5.0,),
                  Text("Top 5 Hot News", style: TextStyle(color: Colors.white, fontSize: 14.0),),
                  SizedBox(height: 5.0,),
                  FutureBuilder(
                    future: getDataN(),
                    builder: (context, snapshot){
                      if(snapshot.hasError) {
                        print(snapshot.error);
                      }
                      return snapshot.hasData 
                        ? ItemSlideList(list: snapshot.data,)
                        : Text('');
                    }
                  ),
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
                              ? ItemList(list: snapshot.data,)
                              : Center(child: CircularProgressIndicator());
                          }
                        ),
                      ]
                    ),
                  ),
                )
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ItemSlideList extends StatelessWidget {
  final List list;

  ItemSlideList({this.list});
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      // width: 350,
      child: ListView.builder(
        // shrinkWrap: true,
        itemCount: 5,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.all(10.0),
        itemBuilder: (context, index){
          return Container(
            height: 150,
            width: 200,
            margin: EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(list[index]['mfn_path']),
                fit: BoxFit.fill,
              ),
              // shape: BoxShape.circle,
            ),
            child: GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return DetailBerita(list: list, index: index);
                }));
              },
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  padding: EdgeInsets.all(10.0),
                  color: Colors.grey.withOpacity(0.7),
                  child: Text(
                    list[index]['mfn_title'], 
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            
          );
        },
      )
    );
  }
}

class ItemList extends StatelessWidget {
  final List list;
  
  ItemList({this.list});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: list.length,
      itemBuilder: (context, index){
        return Container(
          padding: EdgeInsets.fromLTRB(16, 0, 16, 10),
          child: GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return DetailBerita(list: list, index: index);
              }));
            },
            child: Card(
              child: ListTile(
                leading: Image.network(
                  list[index]['mfn_path'],
                  fit: BoxFit.cover,
                  width: 80.0,
                  height: 80.0,
                ),
                title: Text(
                  list[index]['mfn_title'],
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green[400]),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  softWrap: false,
                ),
                subtitle: Text(
                  DateFormat('dd-MMM-yyyy kk:mm').format(DateTime.parse(list[index]['mfn_createddate'])),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class DetailBerita extends StatelessWidget {
  final List list;
  final int index;

  DetailBerita({this.list, this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text(list[index]['mfn_title']),
        backgroundColor: Colors.green[400],
      ),
      body: ListView(
        children: <Widget>[
          Image.network(list[index]['mfn_path']),
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
                          list[index]['mfn_title'],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                            fontSize: 18.0
                          ),
                        ),
                      ),
                      Text(
                        DateFormat('dd-MMM-yyyy kk:mm').format(DateTime.parse(list[index]['mfn_createddate'])),
                        style: TextStyle(
                          color: Colors.black54
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(32, 32, 32, 10),
            child: Text(list[index]['mfn_desc'], softWrap: true,),
          ),
        ],
      ),
    );
  }
}