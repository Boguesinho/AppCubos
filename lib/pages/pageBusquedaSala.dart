import 'dart:ui';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class BusquedaSala extends StatefulWidget {
  const BusquedaSala({Key key}) : super(key: key);

  @override
  _busquedaSalaState createState() => _busquedaSalaState();
}

class _busquedaSalaState extends State<BusquedaSala> {
  String categoriaSala = "Rubik's Cube";
  String anfitrionSala = "Alejandro Ortega";
  String idiomaSala = "Español";
  String tituloSala = "World Championship";
  String descripcionSala =
      "Para echar la reta con los panas cada vez que se pueda y todos los días de ser necesario pue";

  int salaSeleccionada = -1;
  bool tieneClave = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Stack(children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Image.asset('assets/images/speedSala.png'),
        ),
        new BackdropFilter(
          filter: new ImageFilter.blur(sigmaX: 1.8, sigmaY: 1.8),
          child: new Container(
            decoration: new BoxDecoration(color: Colors.white.withOpacity(0.0)),
          ),
        ),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Align(
                  alignment: Alignment.topRight,
                ),
                Divider(
                  color: Color(0x00EBEBEB),
                  height: 20.0,
                ),
                FadeInDown(
                  duration: Duration(milliseconds: 200),
                  delay: Duration(milliseconds: 300),
                  child: Text(
                    "¡Únete o crea una sala para competir!",
                    textScaleFactor: 1.3,
                    style: Theme.of(context)
                        .textTheme
                        .headline4
                        .copyWith(fontWeight: FontWeight.w900),
                  ),
                ),
                Divider(
                  color: Color(0x00123456),
                ),
                //Search Bar
                Row(
                  children: <Widget>[
                    FadeIn(
                      delay: Duration(milliseconds: 0),
                      duration: Duration(milliseconds: 500),
                      child: Container(
                        width: MediaQuery.of(context).size.width - 90,
                        height: 45,
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 3),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30)),
                        child: TextField(
                            decoration: InputDecoration(
                          icon: Icon(Icons.search),
                          hintText: "Buscar salas",
                          border: InputBorder.none,
                        )),
                      ),
                    ),
                    Divider(
                      indent: 2,
                    ),
                    FadeIn(
                      delay: Duration(milliseconds: 400),
                      duration: Duration(milliseconds: 900),
                      child: Container(
                        width: MediaQuery.of(context).size.width - 340,
                        height: 50.0,
                        child: new RawMaterialButton(
                          shape: new CircleBorder(),
                          elevation: 0.0,
                          child: Icon(
                            Icons.tune,
                            color: Colors.white,
                          ),
                          onPressed: () => print('Botoncito'),
                        ),
                      ),
                    ),
                  ],
                ),

                Divider(
                  color: Color(0x00EBEBEB),
                  height: 28,
                ),
                Expanded(
                    child: ListView.separated(
                  separatorBuilder: (context, index) => Divider(
                    color: Colors.transparent,
                  ),
                  itemCount: 20,
                  itemBuilder: (context, index) => Padding(
                    padding: EdgeInsets.all(3.0),
                    child: index % 2 == 0
                        ? crearElementoSala(context, index, tieneClave)
                        : crearElementoSala(context, index, !tieneClave),
                  ),
                )),
              ],
            ),
          ),
        )
      ]),
      floatingActionButton: FloatingActionButton(
        elevation: 15,
        backgroundColor: Theme.of(context).buttonColor,
        child: Icon(
          Icons.add,
          color: Colors.black,
        ),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartFloat,
    );
  }

  Widget crearElementoSala(context, int indiceTarjeta, bool tieneClave) {
    final temaElementoSala =
        Theme.of(context).copyWith(dividerColor: Colors.transparent);
    final temaDivisorNegro =
        Theme.of(context).copyWith(dividerColor: Colors.grey);

    return FadeIn(
      duration: Duration(milliseconds: 1000),
      child: Container(
        padding: EdgeInsets.all(0),
        decoration: BoxDecoration(
            color: Color(0xd9EBEBEB), //Fondo Tarjeta con transparencia
            borderRadius: BorderRadius.circular(18),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 17),
                blurRadius: 30,
                spreadRadius: -23,
                color: Color(0xff505050),
              )
            ]),
        child: Theme(
          data: temaElementoSala,
          child: ExpansionTile(
            title: Text(
              '$tituloSala',
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  .copyWith(fontWeight: FontWeight.w500),
              textScaleFactor: 1.25,
            ),
            childrenPadding: EdgeInsets.all(2),
            leading: Container(
              width: MediaQuery.of(context).size.width - 345,
              child: Row(
                children: [
                  tieneClave == true
                      ? Icon(
                          Icons.lock,
                          color: Color(0xffAD0000),
                          size: MediaQuery.of(context).size.width - 373.5,
                        )
                      : Icon(
                          Icons.lock_open,
                          color: Color(0xff11700E),
                          size: MediaQuery.of(context).size.width - 373.5,
                        ),
                  Container(
                    width: MediaQuery.of(context).size.width - 385,
                  ),
                  Image(
                    image: AssetImage('assets/images/3x3.png'),
                    height: MediaQuery.of(context).size.width - 372,
                    width: MediaQuery.of(context).size.width - 372,
                  ),
                ],
              ),
            ),
            children: [
              Theme(
                data: temaDivisorNegro,
                child: Divider(
                  height: 8,
                  thickness: .7,
                ),
              ),
              FadeIn(
                delay: Duration(milliseconds: 0),
                duration: Duration(milliseconds: 600),
                child: Text(
                  'Anfitrión',
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      .copyWith(fontWeight: FontWeight.w700),
                  textAlign: TextAlign.left,
                  textScaleFactor: .9,
                ),
              ),
              FadeIn(
                delay: Duration(milliseconds: 0),
                duration: Duration(milliseconds: 600),
                child: Container(
                  width: MediaQuery.of(context).size.width * .6,
                  alignment: Alignment.center,
                  child: Text(
                    '$anfitrionSala',
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .headline3
                        .copyWith(fontWeight: FontWeight.w700),
                    textAlign: TextAlign.left,
                    textScaleFactor: .9,
                    maxLines: 1,
                  ),
                ),
              ),
              Theme(
                data: temaDivisorNegro,
                child: Divider(
                  height: 8,
                  thickness: .7,
                ),
              ),
              Container(
                child: FadeIn(
                  delay: Duration(milliseconds: 150),
                  duration: Duration(milliseconds: 600),
                  child: Text(
                    'Idioma',
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        .copyWith(fontWeight: FontWeight.w700),
                    textAlign: TextAlign.left,
                    textScaleFactor: .9,
                  ),
                ),
              ),
              FadeIn(
                delay: Duration(milliseconds: 150),
                duration: Duration(milliseconds: 600),
                child: Container(
                  width: MediaQuery.of(context).size.width * .6,
                  alignment: Alignment.center,
                  child: Text(
                    '$idiomaSala',
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .headline3
                        .copyWith(fontWeight: FontWeight.w700),
                    textAlign: TextAlign.left,
                    textScaleFactor: .9,
                    maxLines: 1,
                  ),
                ),
              ),
              Theme(
                data: temaDivisorNegro,
                child: Divider(
                  height: 8,
                  thickness: .7,
                ),
              ),
              FadeIn(
                delay: Duration(milliseconds: 300),
                duration: Duration(milliseconds: 600),
                child: Text(
                  'Descripción',
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      .copyWith(fontWeight: FontWeight.w700),
                  textAlign: TextAlign.left,
                  textScaleFactor: .9,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * .6,
                child: FadeIn(
                  delay: Duration(milliseconds: 300),
                  duration: Duration(milliseconds: 600),
                  child: Text(
                    "$descripcionSala",
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 5,
                    style: Theme.of(context)
                        .textTheme
                        .headline3
                        .copyWith(fontWeight: FontWeight.w700),
                    textScaleFactor: .7,
                  ),
                ),
              ),
              Container(
                child: tieneClave == true
                    ? Divider(height: 26)
                    : Divider(height: 5),
              ),
              Container(
                child: tieneClave == true
                    ? Container(
                        child: FadeIn(
                          delay: Duration(milliseconds: 450),
                          duration: Duration(milliseconds: 600),
                          child: Container(
                            width: MediaQuery.of(context).size.width - 130,
                            height: 35,
                            padding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 0),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30)),
                            child: TextField(
                                obscureText: true,
                                decoration: InputDecoration(
                                  icon: Icon(Icons.vpn_key),
                                  hintText: "Escribir contraseña",
                                  border: InputBorder.none,
                                )),
                          ),
                        ),
                      )
                    : Container(),
              ),
              Divider(
                height: 10,
              ),
              Container(
                height: 26,
                child: FadeIn(
                  delay: Duration(milliseconds: 600),
                  duration: Duration(milliseconds: 600),
                  child: FlatButton(
                    padding: const EdgeInsets.symmetric(horizontal: 110),
                    color: Color(0x1a7d7d7d),
                    child: Text(
                      "Entrar",
                      style: Theme.of(context)
                          .textTheme
                          .headline5
                          .copyWith(fontWeight: FontWeight.w900),
                      textScaleFactor: 1.1,
                    ),
                    onPressed: () {
                      print('Tarjeta número $indiceTarjeta seleccionada');
                    },
                  ),
                ),
              ),
              Divider(
                height: 8,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
