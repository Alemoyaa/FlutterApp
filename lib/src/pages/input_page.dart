import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _nombre = '';

  String _email = '';

  String _fecha = '';

  List _poderes = ['Volar' , 'Rayos X' , 'Super Aliento', 'Super Fuerza'];

  String _opcionSeleccionada = 'Volar';

  TextEditingController _inputFieldDateController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inputs de texto'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        children: <Widget>[
          _crearInput(),
          Divider(),
          _crearEmail(),
          Divider(),
          _crearPassword(),
          Divider(),
          _crearFecha(context),
          Divider(),
          _crearDropdown(),
          Divider(),
          _crearPersona()
        ],
      ),
    );
  }
  Widget _crearInput(){
    return TextField(
      //autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        counter: Text('Letras ${_nombre.length}'),
        hintText: ('Nombre de la persona'),
        labelText: 'Nombre',
        helperText: 'Debe ingresar su nombre ',
        suffixIcon: Icon( Icons.accessibility ),
        icon: Icon( Icons.account_circle ),
      ),
      onChanged: (valor) {
        setState(() {
          _nombre=valor;
        });
      },

    );
  }

  Widget _crearPersona(){
    return ListTile(
      title: Text('Nombre: $_nombre'),
      subtitle: Text('Email: $_email'),
      trailing: Text('Poder :  $_opcionSeleccionada'),
    );
  }

  Widget _crearEmail(){
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0)
        ),
        hintText: ('Nombre del email'),
        labelText: 'Email',
        helperText: 'Debe ingresar su email ',
        suffixIcon: Icon( Icons.alternate_email ),
        icon: Icon( Icons.email ),
      ),
      onChanged: (valor) =>
        setState(() {
          _email = valor;
        })
      ,
    );
  }

  Widget _crearPassword(){
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0)
        ),
        hintText: ('Contraseña'),
        labelText: 'Contraseña',
        helperText: 'Debe ingresar su contraseña',
        suffixIcon: Icon( Icons.lock_outline ),
        icon: Icon( Icons.lock ),
      ),
    );
  }

  Widget _crearFecha(BuildContext context){
    return TextField(
      enableInteractiveSelection: false,
      controller: _inputFieldDateController,
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0)
        ),
        hintText: ('Fecha de nacimiento'),
        labelText: 'Fecha',
        helperText: 'Debe ingresar su fecha de nacimiento',
        suffixIcon: Icon( Icons.perm_contact_calendar ),
        icon: Icon( Icons.calendar_today ),
      ),
      onTap: (){
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      },
    );
  }

  _selectDate(BuildContext context) async{
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2020),
        lastDate: new DateTime(2025),
        locale: Locale('es', 'ES')
    );

    if ( picked != null){
      setState(() {
        _fecha = ' ${picked.day}-${picked.month}-${picked.year}';
        _inputFieldDateController.text = (_fecha);
      });
    }
  }

  List<DropdownMenuItem<String>> getOpcionesDropdown() {
    List<DropdownMenuItem<String>> lista = new List();
    _poderes.forEach( (poder) {
      lista.add(DropdownMenuItem(
        child: Text(poder),
        value: poder,
      ));
    });

    return lista;
  }

  Widget _crearDropdown(){
    return Row(
      children: <Widget>[
        Icon(Icons.select_all,color: Colors.grey,),
        SizedBox(width: 30.0,),
        DropdownButton(
          style: TextStyle(color: Colors.black87),
          value: _opcionSeleccionada,
          items: getOpcionesDropdown(),
          onChanged: (opt){
            setState(() {
              _opcionSeleccionada = opt;
            });
          },
        )
      ],
    );

  }
}
