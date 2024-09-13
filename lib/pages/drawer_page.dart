import 'package:flutter/material.dart';

class DrawerPage extends StatefulWidget {
  static const String id ="drawer_page";
  const DrawerPage({super.key});

  @override
  State<DrawerPage> createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  PageController? _pageController;
  int _selectedIndex=0;

 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController=PageController();
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("My Demo",style: TextStyle(color: Colors.white,fontSize: 30),),
      ),
      body:Center(
        child:PageView (
          controller: _pageController,
          onPageChanged: (int index){
            setState(() {
              _selectedIndex=index;
            });
          },
          children: [
            Container(
              color: Colors.white,
              child: Center(
                child: Text("Home",style: TextStyle(fontSize: 20),),
              ),
            ),
            Container(
              child: Row(
                children: [
                  Container(
                    width: 300,
                    child: Expanded(
                      child:
                      ListView(
                        children: [
                          _itemList1(title:"Ismatilla",image:"assets/images/image1.jpg"),
                          _itemList1(title:"Xurshidbek",image:"assets/images/image4.jpg"),
                          _itemList1(title:"Begzodbek",image:"assets/images/image2.jpg"),
                          _itemList1(title:"Firdavs",image:"assets/images/image3.jpg"),
                          _itemList1(title:"MuhammadAli",image:"assets/images/image5.jpg"),
                          _itemList1(title:"Malika",image:"assets/images/image6.jpg"),
                        ],
                      ),
                    ),
                  ),

                ],
              ),
            ),
            Container(
              color: Colors.white,
              child: Center(
                child: Text("Video",style: TextStyle(fontSize: 20),),
              ),
            ),
            Container(
              color: Colors.white,
              child: Center(
                child: Text("Notification",style: TextStyle(fontSize: 20),),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items:[
          BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.message),label: "Message"),
          BottomNavigationBarItem(icon: Icon(Icons.ondemand_video),label: "Video"),
          BottomNavigationBarItem(icon: Icon(Icons.notifications),label: "Notification"),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: (int index){
          setState(() {
            _selectedIndex=index;
            _pageController!.animateToPage(index,
                duration: Duration(milliseconds: 200),
                curve: Curves.easeIn);
          });
        },
      ),
      drawer: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.all(20),
              height: 200,
              color: Colors.cyan,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CircleAvatar(
                    child:_itemList(image: "assets/images/image1.jpg"),
                    radius: 40,
                  ),
                  Text("Ismatilla",style: TextStyle(color: Colors.white,fontSize: 30),),
                  Text("redgoo123@gmail.com",style: TextStyle(color: Colors.white,fontSize: 18),),
                ],
              ),
            ),
            Expanded(
              child:ListTile(
                title: Text("Home"),
                leading: Icon(Icons.home),
              ),
            ),
            Expanded(
              child:ListTile(
                title: Text("Profile"),
                leading: Icon(Icons.person),
              ),
            ),
            Expanded(
              child:ListTile(
                title: Text("Abouts"),
                leading: Icon(Icons.people),
              ),
            ),
          ],
        ),
      ),
    ) ;
  }
  Widget _itemList({image}){
    return CircleAvatar(
      child: Column(
        children: [
          Image(image: AssetImage(image),
          ),
        ],
      ),
    );
  }
  Widget _itemList1({title,image}){
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
