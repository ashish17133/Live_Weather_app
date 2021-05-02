import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:http/http.dart' as http;

import 'package:weather_app/logic.dart';

class Screen2 extends StatefulWidget {
  Screen2({Key key}) : super(key: key);

  @override
  _Screen2State createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  @override
  void initState() {
    getInternetValue("simara").then((value) => setState(() {}));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.all(5),
            children: [
              DrawerHeader(
                child: Text("Major Cities in Nepal"),
                decoration: BoxDecoration(color: Colors.blue),
              ),
              ListTile(
                title: Text("KATHMANDU"),
                onTap: () => Navigator.pushNamed(context, "/"),
              ),
              ListTile(
                title: Text("POKHARA"),
                onTap: () => Navigator.pushNamed(context, "firstScreen"),
              ),
              ListTile(
                title: Text("SIMARA"),
                onTap: () => Navigator.pushNamed(context, "secondScreen"),
              ),
            ],
          ),
        ),
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: Icon(Icons.search),
          centerTitle: true,
          actions: [
            Icon(Icons.menu),
          ],
        ),
        body: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/${dataa.backimage}.jpg"),
                    fit: BoxFit.cover)),
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(color: Colors.black26),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 80),
                    Padding(
                        padding: EdgeInsets.all(7),
                        child: Text("${dataa.cityname}",
                            style: GoogleFonts.lato(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 35,
                            ))),
                    Container(
                      child: Text(
                        "${dataa.dateToday}",
                        style: TextStyle(color: Colors.white),
                      ),
                      margin: EdgeInsets.all(5),
                    ),
                    SizedBox(height: 430),
                    Text("${dataa.tempToday}\u00b0 C",
                        style: GoogleFonts.lato(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 25)),
                    Row(
                      children: [
                        SvgPicture.asset(
                          "assets/images/sun.svg",
                          height: 30,
                          width: 30,
                          color: Colors.white,
                        ),
                        SizedBox(width: 10),
                        Text("${dataa.weatherType}",
                            style: TextStyle(color: Colors.white)),
                      ],
                    ),
                    SizedBox(height: 20),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 0.5)),
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      child: Row(
                        children: [
                          Expanded(
                              child: Column(children: [
                            Text(
                              "Wind",
                              style: GoogleFonts.lato(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "${dataa.windSpeed}",
                              style: GoogleFonts.lato(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text("mph",
                                style: GoogleFonts.lato(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold))
                          ])),
                          Expanded(
                              child: Column(children: [
                            Text("Rain",
                                style: GoogleFonts.lato(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold)),
                            Text("30",
                                style: GoogleFonts.lato(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold)),
                            Text("ml",
                                style: GoogleFonts.lato(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold))
                          ])),
                          Expanded(
                              child: Column(children: [
                            Text("Humidity",
                                style: GoogleFonts.lato(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold)),
                            Text("${dataa.humidity}",
                                style: GoogleFonts.lato(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold)),
                            Text("%",
                                style: GoogleFonts.lato(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold)),
                          ])),
                        ],
                      ),
                    )
                  ],
                )
              ],
            )));
  }
}
