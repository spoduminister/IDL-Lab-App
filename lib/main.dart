import 'package:flutter/material.dart';

import 'package:video_player/video_player.dart';
import 'mapPage.dart';
import 'carList.dart';
import 'signIn.dart';

//**********Login and About PAGE***********
void main() => runApp(BackgroundVideo());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlutterApp',
      debugShowCheckedModeBanner: true,
      theme: ThemeData(
        primaryColor: Colors.black12,
        accentColor: Colors.orange,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Stateless'),
          //backgroundColor: Colors.transparent,
        ),
      ),
    );
  }
}

class BackgroundVideo extends StatefulWidget {
  @override
  _BackgroundVideoState createState() => _BackgroundVideoState();
}

class AboutUs extends StatefulWidget {
  @override
  _AboutUs createState() => _AboutUs();
}

class _BackgroundVideoState extends State<BackgroundVideo> {
  // TODO 4: Create a VideoPlayerController object.
  VideoPlayerController _controller;

  // TODO 5: Override the initState() method and setup your VideoPlayerController
  @override
  void initState() {
    super.initState();
    // Pointing the video controller to our local asset.
    _controller = VideoPlayerController.asset("assets/Background_Video.mp4")
      ..initialize().then((_) {
        // Once the video has been loaded we play the video and set looping to true.
        _controller.play();
        _controller.setLooping(true);
        // Ensure the first frame is shown after the video is initialized.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // Adjusted theme colors to match logo.
        primaryColor: Color(0xffb55e28),
        accentColor: Color(0xffffd544),
      ),
      home: SafeArea(
        child: Scaffold(
          // TODO 6: Create a Stack Widget
          body: Stack(
            children: <Widget>[
              // TODO 7: Add a SizedBox to contain our video.
              SizedBox.expand(
                child: FittedBox(
                  // If your background video doesn't look right, try changing the BoxFit property.
                  // BoxFit.fill created the look I was going for.
                  fit: BoxFit.fill,
                  child: SizedBox(
                    width: _controller.value.size?.width ?? 0,
                    height: _controller.value.size?.height ?? 0,
                    child: VideoPlayer(_controller),
                  ),
                ),
              ),
              LoginWidget()
            ],
          ),
        ),
      ),
    );
  }

  // TODO 8: Override the dipose() method to cleanup the video controller.
  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}

// A basic login widget with a logo and a form with rounded corners.
//test
class LoginWidget extends StatelessWidget {
  const LoginWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          child: Center(
            child: Image(
              image: AssetImage("assets/IDS_logo.png"),
              width: 300.0,
            ),
          ),
        ),
        SizedBox(
          height: 75.0,
        ),
        Container(
          decoration: new BoxDecoration(
            color: Colors.white.withAlpha(200),
            borderRadius: new BorderRadius.only(
              topLeft: const Radius.circular(10.0),
              topRight: const Radius.circular(10.0),
              bottomLeft: const Radius.circular(10.0),
              bottomRight: const Radius.circular(10.0),
            ),
          ),
          padding: EdgeInsets.all(16),
          width: 300,
          height: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              ButtonTheme(
                minWidth: 300.0,
                child: RaisedButton(
                  color: Color(0xff00539f),
                  child: Text(
                    'Login as Guest',
                    style: TextStyle(color: Color(0xffffd544), fontSize: 20),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MapPage(
                          title: 'Map Page',
                        ),
                      ),
                    );
                  },
                ),
              ),
              ButtonTheme(
                minWidth: 300.0,
                child: RaisedButton(
                  color: Color(0xff00539f),
                  child: Text(
                    'Login as User',
                    style: TextStyle(color: Color(0xffffd544), fontSize: 20),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignIn()),
                    );
                  },
                ),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(
                    fontSize: 15,
                    color: Color(0xff00539f),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AboutUs()),
                  );
                },
                child: const Text('About Us'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _AboutUs extends State {
  VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    // Pointing the video controller to our local asset.
    _controller = VideoPlayerController.asset("assets/Background_Video.mp4")
      ..initialize().then((_) {
        // Once the video has been loaded we play the video and set looping to true.
        _controller.play();
        _controller.setLooping(true);
        // Ensure the first frame is shown after the video is initialized.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          backgroundColor: Colors.white,
          title: new Text('IDS Lab'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            tooltip: 'Back',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BackgroundVideo()),
              );
            },
          ),
        ),
        body: new Container(
            child: new Center(
                child: new Column(children: <Widget>[
          new Image(image: AssetImage('assets/Aboutpage.png')),
          new Container(
              padding: EdgeInsets.all(10),
              child: new Center(
                  child: RichText(
                text: TextSpan(
                  text:
                      'Welcome to Professor Andreas Malikopoulos’ Information and Decision Science (IDS) lab!\n',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.w200,
                      fontFamily: "Roboto"),
                  children: <TextSpan>[
                    TextSpan(
                        text:
                            'The overarching goal of the IDS Lab is to enhance understanding of large-scale, complex cyber-physical systems (CPS) and establish rigorous theories and algorithms for making CPS able to realize how to improve their performance over time while interacting with their environment. The emphasis is on applications related to emerging mobility systems (e.g., connected and automated vehicles, shared mobility), sociotechnical systems, social media, and smart cities.',
                        style: TextStyle(fontWeight: FontWeight.bold))
                  ],
                ),
              )))
        ])))
        // body: new Container(
        //   child: new Text(
        //     "Welcome to Professor Andreas Malikopoulos’ Information and Decision Science (IDS) lab! The overarching goal of the IDS Lab is to enhance understanding of large-scale, complex cyber-physical systems (CPS) and establish rigorous theories and algorithms for making CPS able to realize how to improve their performance over time while interacting with their environment. The emphasis is on applications related to emerging mobility systems (e.g., connected and automated vehicles, shared mobility), sociotechnical systems, social media, and smart cities.",
        //     style: new TextStyle(
        //         fontSize: 18.0,
        //         color: Colors.black,
        //         fontWeight: FontWeight.w200,
        //         fontFamily: "Roboto"),
        //   ),
        //   padding: const EdgeInsets.fromLTRB(50.0, 50.0, 50.0, 179.0),
        //   alignment: Alignment.center,
        // ),
        );
  }
}
