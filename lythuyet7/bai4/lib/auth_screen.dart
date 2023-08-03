
import 'package:bai4/constants.dart';
import 'package:bai4/widgets/login_form.dart';
import 'package:bai4/widgets/sign_up_form.dart';
import 'package:bai4/widgets/socal_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen>{
  bool _isShowSignUp = false;
  late AnimationController _animationController;
  void setUpAnimation(){

  }
void updateView(){
    setState(() {
      _isShowSignUp = !_isShowSignUp;

    });
    _isShowSignUp? _animationController.forward()
    :_animationController.reverse();
}
  @override
  Widget build(BuildContext context) {
  final _size = MediaQuery.of(context).size;

  return Scaffold(
  body: Stack(
  children: [
  //Login
  AnimatedPositioned(width: _size.width *0.88,
  height: _size.height,
  left: _isShowSignUp? _size.width * 0.76: _size.width*0.88,
  duration:defaultDuration,
  child:GestureDetector(
  onTap: (){
  setState((){
  updateView();
  });},
  child: Container(
  color: login_bg,
  child: LoginForm(),
  ),
  ),
  ),
  //Sign up
  AnimatedPositioned(
  height: _size.height,
  width: _size.width * 0.88,
  left: _isShowSignUp? _size.width * 0.12 : _size.width *0.88,
  duration: defaultDuration,
    child:GestureDetector(
        onTap: (){
          setState((){
            updateView();
          });},
  child: Container(
  color: signup_bg ,
  child: SignUpForm(),
  ),),),
  Positioned(
  top: _size.height * 0.1,
  left: 0,
  right: _isShowSignUp?_size.width*0.06:_size.width *0.06,
  child: CircleAvatar(
  radius: 25,
  backgroundColor: Colors.white60,
  child: _isShowSignUp?
  SvgPicture.asset(
  "assets/animation_logo.svg",
  color: signup_bg,
  ):SvgPicture.asset(
    "assets/animation_logo.svg",
    color: login_bg,
  ),
  )
  ),
  Positioned(
  width: _size.width,
  bottom: _size.height * 0.1,
  right: _isShowSignUp?_size.width *0.6:_size.width *0.06,
  child: SocalButtns(),
  ),
  ],
  ),
  );
  }

  }



