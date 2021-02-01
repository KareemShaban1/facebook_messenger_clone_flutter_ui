import 'package:facebook_messanger_clone/models//data.dart';
import 'package:facebook_messanger_clone/theme/colors.dart';
import 'package:flutter/material.dart';


class ChatDetailPage extends StatefulWidget {

  final bool appTheme ;
  ChatDetailPage(this.appTheme);


  @override
  _ChatDetailPageState createState() => _ChatDetailPageState();

}

class _ChatDetailPageState extends State<ChatDetailPage> {



  // bool _light = true;
  //
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

  TextEditingController _sendMessageController = new TextEditingController();



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: widget.appTheme?_lightTheme.primaryColorLight:_darkTheme.primaryColorDark,

      appBar: AppBar(

        backgroundColor: widget.appTheme?grey.withOpacity(0.2):_darkTheme.primaryColorDark,
        elevation: 0,
        leading: FlatButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              color: primary,
            )),

        title: Row(
          children: <Widget>[
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage(
                          "assets/images/img3.jpg"),
                      fit: BoxFit.cover)),
            ),
            SizedBox(
              width: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Creative",
                  style: TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold, color: widget.appTheme?_darkTheme.primaryColorDark:_lightTheme.primaryColorLight),
                ),
                SizedBox(
                  height: 3,
                ),
                Text(
                  "Active now",
                  style: TextStyle(color: widget.appTheme?black.withOpacity(0.4):Colors.grey, fontSize: 14),
                )
              ],
            )
          ],
        ),

        actions: <Widget>[
          Icon(
            Icons.phone,
            color: primary,
            size: 25,
          ),
          SizedBox(
            width: 15,
          ),
          Icon(
            Icons.video_call,
            color: primary,
            size: 25,
          ),
          SizedBox(
            width: 8,
          ),
          Icon(
            Icons.perm_device_information,
            color: primary,
            size: 25,
          ),
          SizedBox(
            width: 15,
          ),
        ],
      ),

      body: ListView(
        padding: EdgeInsets.only(right: 20,left: 20,top: 20,bottom: 80),
        children: List.generate(messages.length, (index){
          return ChatBubble(theme:widget.appTheme,isMe: messages[index]['isMe'],messageType: messages[index]['messageType'],message: messages[index]['message'],profileImg: messages[index]['profileImg']);
        }),
      ),


      bottomSheet: Container(
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
            color: widget.appTheme? grey.withOpacity(0.2):_darkTheme.primaryColorDark
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 20,right: 20,bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                width: (MediaQuery.of(context).size.width - 40)/2,
                child: Row(
                  children: <Widget>[
                    Icon(Icons.add,size: 25,color: primary,),
                    SizedBox(width: 15,),
                    Icon(Icons.camera_alt,size: 25,color: primary,),
                    SizedBox(width: 15,),
                    Icon(Icons.photo,size: 25,color: primary,),
                    SizedBox(width: 15,),
                    Icon(Icons.keyboard_voice,size: 25,color: primary,),
                  ],
                ),
              ),

              Container(
                width: (MediaQuery.of(context).size.width- 40)/2,
                child: Row(
                  children: <Widget>[
                    Container(
                      width: (MediaQuery.of(context).size.width-140)/2,
                      height: 40,
                      decoration: BoxDecoration(
                          color: widget.appTheme?grey:Color(0xff303030),
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: TextField(
                          cursorColor: black,
                          controller: _sendMessageController,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Aa",
                              hintStyle: TextStyle(color:widget.appTheme?Colors.grey:Colors.white ),
                              suffixIcon: Icon(Icons.tag_faces,color: primary,size: 25,)
                          ),
                        ),
                      ),
                    ),

                    SizedBox(width: 15,),
                    Icon(Icons.thumb_up,size: 25,color: primary,),
                  ],
                ),
              ),



            ],
          ),
        ),
      ),
    );
  }


}

class ChatBubble extends StatelessWidget {
  final bool theme;
  final bool isMe;
  final String profileImg;
  final String message;
  final int messageType;
  const ChatBubble({
    Key key,this.theme, this.isMe, this.profileImg, this.message, this.messageType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(isMe){
      return Padding(
        padding: const EdgeInsets.all(1.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Flexible(
                          child: Container(
                decoration: BoxDecoration(
                  color: primary,
                  borderRadius: getMessageType(messageType) 
                ),
                child: Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: Text(
                    message,
                    style: TextStyle(
                      color: white,
                      fontSize: 17
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      );
    }
    else{
      return Padding(
        padding:  EdgeInsets.all(1.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
             Container(
                width: 35,
                height: 35,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage(
                            profileImg),
                        fit: BoxFit.cover)),
              ),
            SizedBox(
              width: 15,
            ),

            Flexible(
              child: Container(
                decoration: BoxDecoration(
                    color: theme?grey:Color(0xff303030),
                  borderRadius: getMessageType(messageType)
                ),

                child: Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: Text(
                    message,
                    style: TextStyle(
                      color: theme?Colors.black:Colors.white,
                      fontSize: 17
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: 20,)
          ],
        ),
      );
    }
    
  }
  getMessageType(messageType){
    if(isMe){
      // start message
      if(messageType == 1 ){
        return BorderRadius.only(
                    topRight: Radius.circular(30),
                    bottomRight: Radius.circular(5),
                    topLeft: Radius.circular(30),
                    bottomLeft: Radius.circular(30)
        );
      }
      // middle message
      else if(messageType == 2){
        return BorderRadius.only(
                    topRight: Radius.circular(5),
                    bottomRight: Radius.circular(30),
                    topLeft: Radius.circular(30),
                    bottomLeft: Radius.circular(30)
        );
      }
      // end message
      else if(messageType == 3){
        return BorderRadius.only(
                    topRight: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                    topLeft: Radius.circular(30),
                    bottomLeft: Radius.circular(30)
        );
      }
      // standalone message
      else{
        return BorderRadius.all(Radius.circular(30));
      }
    }
    // for sender bubble
    else{
      // start message
        if(messageType == 1){
          return BorderRadius.only(
                      topLeft: Radius.circular(30),
                      bottomLeft: Radius.circular(5),
                      topRight: Radius.circular(30),
                      bottomRight: Radius.circular(30)
          );
        }
        // middle message
        else if(messageType == 2){
          return BorderRadius.only(
                      topLeft: Radius.circular(5),
                      bottomLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                      bottomRight: Radius.circular(30)
          );
        }
        // end message
        else if(messageType == 3){
          return BorderRadius.only(
                      topLeft: Radius.circular(30),
                      bottomLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                      bottomRight: Radius.circular(30)
          );
        }
        // standalone message
        else{
          return BorderRadius.all(Radius.circular(30));
        }
    }
    
    
  }
}
