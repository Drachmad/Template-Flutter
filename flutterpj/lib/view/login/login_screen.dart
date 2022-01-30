import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutterpj/config/color.dart';
import 'package:flutterpj/controller/login_controller.dart';
import 'package:flutterpj/view/home/home_screen.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    Provider.of<LoginController>(context, listen: false).initData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginController>(
        builder: (context, loginController, child) {
      return Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            color: Color(0xFF070C35),
            image: DecorationImage(
              image: AssetImage("assets/images/background.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Row(
            children: [
              // Expanded(flex: 5, child: bannerView()),
              Expanded(child: loginView()),
            ],
          ),
        ),
      );
    });
  }

  Widget bannerView() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Selamat Datang Di",
            style: GoogleFonts.poppins(
                fontSize: 24, fontWeight: FontWeight.w600, color: HijauColor),
          ),
          Text(
            "PT. RUBBER",
            style: GoogleFonts.poppins(
                fontSize: 32, fontWeight: FontWeight.w700, color: HijauColor),
          ),
          SizedBox(
            height: 24,
          ),
          Center(
            child: AspectRatio(
              aspectRatio: 2.5,
              child: Image.asset("assets/images/banner.png"),
            ),
          ),
        ],
      ),
    );
  }

  Widget loginView() {
    var loginController = Provider.of<LoginController>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 50),
      child: AspectRatio(
        aspectRatio: 0.9,
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white.withAlpha(0),
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withAlpha(50),
                  blurRadius: 10,
                  spreadRadius: 0,
                  offset: const Offset(5, 5),
                ),
              ]),
          padding: EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              Center(
                child: Image.asset(
                  "assets/images/ic_user.png",
                  height: 100,
                ),
              ),
              Center(
                child: Stack(
                  children: <Widget>[
                    // Stroked text as border.
                    Text(
                      'PT. RUBBER',
                      style: TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.w900,
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = 1
                          ..color = Colors.white,
                      ),
                    ),
                    // Solid text as fill.
                    Text(
                      'PT. RUBBER',
                      style: TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.w900,
                        color: Colors.white.withAlpha(0),
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Center(
                child: Container(
                  alignment: Alignment.center,
                  height: 40,
                  width: 350,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(15.0),
                        bottomLeft: Radius.circular(15.0)),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: TextFormField(
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                    controller: loginController.usernameLogin,
                    decoration: InputDecoration(
                      hintText: 'USERNAME',
                      hintStyle: TextStyle(color: Colors.white),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      focusedErrorBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Center(
                child: Container(
                  alignment: Alignment.center,
                  height: 40,
                  width: 350,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(15.0),
                        bottomLeft: Radius.circular(15.0)),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: TextFormField(
                    obscureText: true,
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                    controller: loginController.passwordLogin,
                    decoration: InputDecoration(
                      hintText: 'PASSWORD',
                      hintStyle: TextStyle(color: Colors.white),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      focusedErrorBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Center(
                child: Container(
                  width: 120,
                  child: InkWell(
                    onTap: () {
                      loginController.getLogin().then((value) {
                        if (value != null) {
                          if (value) {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => HomeScreen()));
                          }
                        }
                      });
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 32, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20.0),
                            bottomLeft: Radius.circular(20.0)),
                      ),
                      child: Center(
                        child: Text(
                          "Login",
                          style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF070C35)),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              // InkWell(
              //   onTap: () {
              //     loginController.mode_login = false;
              //     loginController.notifyListeners();
              //   },
              //   child: Container(
              //     padding: EdgeInsets.symmetric(horizontal: 32, vertical: 8),
              //     decoration: BoxDecoration(
              //       color: Colors.white,
              //       borderRadius: BorderRadius.circular(10),
              //       border: Border.all(color: HijauColor),
              //     ),
              //     child: Center(
              //       child: Text(
              //         "Register",
              //         style: GoogleFonts.poppins(
              //             fontSize: 16,
              //             fontWeight: FontWeight.w700,
              //             color: HijauColor),
              //       ),
              //     ),
              //   ),
              // ),
              // SizedBox(
              //   height: 16,
              // ),
              // Center(
              //   child: TextButton(
              //     onPressed: () {
              //       showAnimatedDialog_withCallBack(
              //           context, SettingConnection(), isFlip: true,
              //           callback: (value) {
              //         if (value != null) {}
              //       });
              //     },
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.center,
              //       mainAxisSize: MainAxisSize.min,
              //       children: [
              //         Image.asset(
              //           "assets/images/ic_setting.png",
              //           height: 25,
              //         ),
              //         SizedBox(
              //           width: 8,
              //         ),
              //         Text(
              //           "Database Connection",
              //           style: GoogleFonts.poppins(
              //               fontSize: 14,
              //               fontWeight: FontWeight.w600,
              //               color: Colors.black),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
