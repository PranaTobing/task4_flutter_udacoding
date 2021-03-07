import 'package:flutter/material.dart';
import 'package:giffy_dialog/giffy_dialog.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class DictionaryWidget extends StatefulWidget {
  @override
  _DictionaryWidgetState createState() => _DictionaryWidgetState();
}

class _DictionaryWidgetState extends State<DictionaryWidget> {
  Future<List> getDataD() async{
    final response = await http.get('https://pranatobing.000webhostapp.com/api_task4/dictionary.php');
    return json.decode(response.body);
  }
  var etSearce = new TextEditingController();
  bool isSearch = true;
  String query = "";
  List<String> dataList;
  List<String> filterList;

  void searchWidget(String text) {
    etSearce.addListener((){
      if (etSearce.text.isEmpty) {
        setState(() {
          isSearch = false;
          query = "";
        });
      } else {
        setState(() {
          isSearch = true;
          query = etSearce.text;
        });
      }
    }); 
  }
  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        // padding: EdgeInsets.only(),
        width: double.infinity,
        // height: size.height * 0.27,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [
              Colors.green[400],
              Colors.green[300],
              Colors.green[100],
            ],
          ),
          // borderRadius: BorderRadius.only(bottomLeft: Radius.circular(36.0), bottomRight: Radius.circular(36.0))
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
                  Text("Farm Dictionary", style: TextStyle(color: Colors.white, fontSize: 35.0),),
                  SizedBox(height: 5.0,),
                  Text("diambil dari: UNUSIDA Press", style: TextStyle(color: Colors.white, fontSize: 14.0),)
                ],
              ),
            ),
            SizedBox(height: 20.0),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25))
                ),
                child: SingleChildScrollView(
                  physics: ScrollPhysics(),
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(left: 10),
                          margin: EdgeInsets.only(bottom: 5.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: TextField(
                            controller: etSearce,
                            decoration: InputDecoration(
                              hintText: "Search . . .",
                              hintStyle: TextStyle(color: Colors.grey),
                              border: InputBorder.none,
                              suffixIcon: Icon(Icons.search)
                            ),
                            onChanged: (value) => searchWidget(value),
                          ),
                        ),
                        FutureBuilder(
                          future: getDataD(),
                          builder: (context, snapshot){
                            if(snapshot.hasError) {
                              print(snapshot.error);
                            }
                            return snapshot.hasData 
                              ? ItemList(list: snapshot.data,query: query, issearch: isSearch)
                              : Center(child: CircularProgressIndicator());
                          }
                        ),
                      ]
                    ),
                  ),
                ),
              ),
            ),
          ]
        ),    
      )
      
    );
  }
}

class ItemList extends StatelessWidget {
  final List list;
  final String query;
  final bool issearch;
  ItemList({this.list, this.query, this.issearch});

  @override
  Widget build(BuildContext context) {
    List itemList = [];
    for(int i=0; i<list.length; i++){
      var itemname = list[i]['mfd_title'];
      var item = list[i];
      if(issearch){
        if(itemname.toLowerCase().contains(query.toLowerCase())){
          itemList.add(item);
          // print(item);
        }
      } else {
        itemList.add(item);
      }
    }
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: itemList.length,
      itemBuilder: (context, index){
        return 
          Container(
            padding: EdgeInsets.zero,
            margin: EdgeInsets.only(bottom: 10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.white,
              border: Border.all(
                color: Colors.green[400],
                width: 1,
              ),
            ),
            child: GestureDetector(
              onTap: (){
                showDialog(
                context: context,builder: (_) => FlareGiffyDialog(
                  flarePath: 'images/space_demo.flr',
                  flareAnimation: 'loading',
                  title: Text(
                    itemList[index]['mfd_title'],
                    style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w600),
                  ),
                  description: Text(itemList[index]['mfd_desc'], textAlign: TextAlign.center,),
                  entryAnimation: EntryAnimation.DEFAULT,
                  onOkButtonPressed: () => Navigator.of(context).pop(),
                  onlyOkButton: true,
                  buttonOkText: Text('Close', style: TextStyle(color: Colors.white),),
                ) );
              },
              child: ListTile(
                title: Text(
                  itemList[index]['mfd_title'],
                  style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
                ),
                leading: CircleAvatar(
                  child: Text(
                    itemList[index]['mfd_title'][0].toUpperCase(),
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                  backgroundColor: Colors.green[100],
                ),
              ),
            ),
          );
      },
    );
  }
}
