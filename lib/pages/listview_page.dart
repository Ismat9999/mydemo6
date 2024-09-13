import 'package:flutter/material.dart';

class ListViewPage extends StatefulWidget {
  static const String id= "listView_page";
  const ListViewPage({super.key});

  @override
  State<ListViewPage> createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("List View"),
      ),
      body:Container(
        child: Row(
          children: [
            Container(
              width: 300,
              child: Expanded(
                child:
                ListView(
                  children: [
                    _itemList(title:"Ismatilla",image:"assets/images/image1.jpg"),
                    _itemList(title:"Xurshidbek",image:"assets/images/image4.jpg"),
                    _itemList(title:"Begzodbek",image:"assets/images/image2.jpg"),
                    _itemList(title:"Firdavs",image:"assets/images/image3.jpg"),
                    _itemList(title:"MuhammadAli",image:"assets/images/image5.jpg"),
                    _itemList(title:"Malika",image:"assets/images/image6.jpg"),
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );

  }
  Widget _itemList({title,image}){
    return Container(
      padding: EdgeInsets.all(20),
      child: Row(
        children: [
          Image(
            width: 50,
            height: 50,
            fit: BoxFit.cover,
            image: AssetImage(image),
          ),
          SizedBox(width: 10,),
          Text(title)
        ],
      ),
    );
  }
}