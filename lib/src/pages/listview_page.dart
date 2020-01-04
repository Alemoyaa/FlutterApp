
import 'dart:async';

import 'package:flutter/material.dart';

class ListaPage extends StatefulWidget {
  @override
  _ListaPageState createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {

  ScrollController _scrollController = new ScrollController(); //Me permite controllar un scroll

  List<int> _listaNumeros = new List();
  int _ultimoItem=10;
  bool _isLoading = false;

  @override
  void initState() {//Metodo qe no regresa nada
    super.initState();
    _agregar10();

    _scrollController.addListener((){
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent){
        fetchData();
        //agregar10();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();

    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listas'),
      ),
      body: Stack(
        children: <Widget>[
          _crearLista(),
          _crearLoading()
        ],
      )
    );
  }

  Widget _crearLista(){
    return RefreshIndicator(
      onRefresh: obtenerPagina1,

      child : ListView.builder(
        controller: _scrollController,
        itemCount: _listaNumeros.length,
        itemBuilder: (BuildContext context, int index){
          final imagen = _listaNumeros[index];
          return FadeInImage(
            image: NetworkImage('https://i.picsum.photos/id/10$imagen/600/600.jpg'),
            placeholder: AssetImage('assets/jar-loading.gif'),
          );
        },
      )
    );
  }

  Future<Null> obtenerPagina1() async{
    final duration = new Duration(seconds: 2);
    new Timer(duration, () {
      _listaNumeros.clear();
      _ultimoItem++;
      _agregar10();
    });
    return Future.delayed(duration);
  }

  void _agregar10(){
    for(int i=0; i<10; i++){
      _ultimoItem++;
      _listaNumeros.add(_ultimoItem);
    }

    setState(() {

    });

  }

  Future<Null> fetchData() async{

    _isLoading = true;
    setState(() {});

    final duration = new Duration(seconds: 2);
    new Timer(duration, respuestaHTTP);

  }

  void respuestaHTTP(){
    _isLoading = false;
    _scrollController.animateTo(_scrollController.position.pixels + 100, duration: Duration(milliseconds: 250), curve: Curves.fastOutSlowIn);
    _agregar10();
  }

  Widget _crearLoading(){
    if(_isLoading){
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator()
            ],
          ),
          SizedBox(height: 15.0)
        ],
      );
    }
    else {
      return Container();
    }
  }
}