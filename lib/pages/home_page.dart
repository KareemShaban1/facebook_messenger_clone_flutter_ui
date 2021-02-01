import 'package:facebook_messanger_clone/models//data.dart';
import 'package:facebook_messanger_clone/pages/chat_detail_page.dart';
import 'package:facebook_messanger_clone/theme/colors.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _light = true;

  ThemeData _darkTheme = ThemeData(
      accentColor: Colors.red,
      brightness: Brightness.dark,
      primaryColor: Colors.grey,
      primaryColorDark: Colors.black,
      backgroundColor: Colors.black,

  );

  ThemeData _lightTheme = ThemeData(
      accentColor: Colors.black,
      brightness: Brightness.light,
      primaryColor: Colors.grey[100],
      primaryColorLight: Colors.white,
      shadowColor: Colors.white,
      backgroundColor: Colors.white
  );
  TextEditingController _searchController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _light ? _lightTheme : _darkTheme ,
      debugShowCheckedModeBanner: false,

      home: Scaffold(
          backgroundColor: _light ? _lightTheme.backgroundColor : _darkTheme.backgroundColor,

          appBar: AppBar(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,

            title: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: (){
                      // Navigator.push(context, MaterialPageRoute(builder: (_) => ProfilePage()));
                    },
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage("assets/images/img1.jpg"),
                              fit: BoxFit.cover)
                      ),
                    ),
                  ),
                  SizedBox(width: 10,),
                  Text('Chats',style: TextStyle(color: _light ? Colors.black : _darkTheme.primaryColorDark,fontWeight: FontWeight.bold,fontSize: 25),)
                ],
              ),
            ),

            actions: [

              Switch(value: _light,onChanged: (state){
                setState(() {
                  _light = state;
                });
              },),


              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                child: Container(
                    width: 45,
                    decoration: BoxDecoration(
                        color: _light?Colors.grey[100]:Color(0xff303030),
                        borderRadius: BorderRadius.circular(100)

                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                      child: Icon(Icons.camera_alt,color: _light?Colors.black:Colors.white),
                    )),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                child: Container(
                    width: 45,

                    decoration: BoxDecoration(
                        color: _light?Colors.grey[100]:Color(0xff303030),
                        borderRadius: BorderRadius.circular(100)

                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                      child: Icon(Icons.edit,color: _light?Colors.black:Colors.white,),
                    )),
              ),



            ],
          ),


          body: SafeArea(

              child: ListView(

                padding: EdgeInsets.only(left: 20, right: 20, top: 15,bottom: 80),
                children: <Widget>[

                  SizedBox(
                    height: 10,
                  ),


                  Container(
                    width: double.infinity,
                    height: 40,
                    decoration: BoxDecoration(
                        color: _light?_lightTheme.primaryColor:Color(0xff303030),
                        borderRadius: BorderRadius.circular(25)),
                    child: TextField(
                      cursorColor: black,
                      controller: _searchController,
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.search,size: 20,
                            color: _light?Colors.grey:_darkTheme.primaryColor,
                          ),
                          hintText: "Search",
                          hintStyle: TextStyle(color:_light?Colors.grey:_darkTheme.primaryColor ),
                          border: InputBorder.none),
                    ),
                  ),


                  SizedBox(
                    height: 30,
                  ),

                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,

                    child: Row(
                      children: <Widget>[

                        Padding(
                          padding: EdgeInsets.only(right: 20),
                          child: Column(
                            children: <Widget>[

                              Container(
                                width: 70,
                                height: 70,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: _light?_lightTheme.primaryColor:Color(0xff303030)
                                ),
                                child: Center(
                                  child: Icon(Icons.video_call,size: 33,),
                                ),
                              ),


                              SizedBox(
                                height: 10,
                              ),

                              SizedBox(
                                width: 75,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 17),
                                  child: Text(
                                    'Create Room',
                                    // overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              )

                            ],
                          ),
                        ),

                        Row(
                            children: List.generate(userStories.length, (index) {
                              return Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      width: 75,
                                      height: 75,
                                      child: Stack(

                                        children: <Widget>[

                                          userStories[index]['story']
                                              ? Container(
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                    color: blue_story, width: 3)),
                                            child: Padding(
                                              padding: const EdgeInsets.all(3.0),
                                              child: Container(
                                                width: 75,
                                                height: 75,
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                            userStories[index]['img']),
                                                        fit: BoxFit.cover)),
                                              ),
                                            ),
                                          )
                                              : Container(
                                            width: 70,
                                            height: 70,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                image: DecorationImage(
                                                    image:
                                                    AssetImage(userStories[index]['img']),
                                                    fit: BoxFit.cover)),
                                          ),
                                          userStories[index]['online']
                                              ? Positioned(
                                            top: 48,
                                            left: 52,
                                            child: Container(
                                              width: 20,
                                              height: 20,
                                              decoration: BoxDecoration(
                                                  color: online,
                                                  shape: BoxShape.circle,
                                                  border:
                                                  Border.all(color: white, width: 3)),
                                            ),
                                          )
                                              : Container()
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    SizedBox(
                                      width: 75,
                                      child: Align(
                                          child: Text(
                                            userStories[index]['name'],
                                            overflow: TextOverflow.ellipsis,
                                          )),
                                    )
                                  ],
                                ),
                              );
                            }
                            ))
                      ],
                    ),
                  ),



                  SizedBox(
                    height: 30,
                  ),

                  Column(
                    children: List.generate(userMessages.length, (index) {

                      return InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (_) => ChatDetailPage(_light)));
                        },

                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Row(
                            children: <Widget>[
                              Container(
                                width: 60,
                                height: 60,
                                child: Stack(
                                  children: <Widget>[

                                    userMessages[index]['story']

                                        ? Container(
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                              color: blue_story, width: 3)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(3.0),
                                        child: Container(
                                          width: 60,
                                          height: 60,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      userMessages[index]['img']),
                                                  fit: BoxFit.cover)),
                                        ),
                                      ),
                                    )

                                        : Container(

                                      width: 55,
                                      height: 55,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                              image:
                                              AssetImage(userMessages[index]['img']),
                                              fit: BoxFit.cover)),
                                    ),

                                    userMessages[index]['online']
                                        ? Positioned(
                                      top: 38,
                                      left: 40,
                                      child: Container(
                                        width: 20,
                                        height: 20,
                                        decoration: BoxDecoration(
                                            color: online,
                                            shape: BoxShape.circle,
                                            border:
                                            Border.all(color: white, width: 3)),
                                      ),
                                    )
                                        : Container()
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    userMessages[index]['name'],
                                    style: TextStyle(
                                      color: _light?Colors.grey[600]:_darkTheme.primaryColor,
                                        fontSize: 17, fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width - 135,
                                    child: Text(

                                      userMessages[index]['message'] +" - "+userMessages[index]['created_at'],
                                      style: TextStyle(
                                          fontSize: 15, color: _light?Colors.grey[600]:_darkTheme.primaryColor
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    }),
                  )
                ],
              )),


          bottomSheet: Container(
            height: 70,
            width: double.infinity,
            decoration: BoxDecoration(
                color: grey.withOpacity(0.2)
            ),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[

                Container(
                  width: (MediaQuery.of(context).size.width),
                  decoration: BoxDecoration(
                    color: _light?_lightTheme.primaryColorLight:_darkTheme.primaryColorDark
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[

                        Column(
                          children: [
                            Icon(Icons.chat_rounded,color: Colors.grey),
                            SizedBox(height: 5,),
                            Text('Chats',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold)),
                          ],
                        ),


                        Column(
                          children: [
                            Icon(Icons.people_alt,color: Colors.grey,),
                            SizedBox(height: 5,),
                            Text('People',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),



              ],
            ),
          ),
        )
    );
  }


}
