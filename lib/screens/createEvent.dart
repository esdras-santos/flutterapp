import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class CreateEvent extends StatefulWidget {
  @override
  _CreateEventState createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEvent> {
  String name, description, preco, bairro, rua, numeroLocal, cep;
  List<Widget> dataList = [];
  List<DateTime> dataCheck = [];

  Widget dataCards(DateTime data, TimeOfDay hora) {
    String dataHora;
    if (hora.periodOffset == 12) {
      dataHora =
          "${data.day}/${data.month}/${data.year}    ${hora.hourOfPeriod}:${hora.minute} pm";
    } else if (hora.periodOffset == 0) {
      dataHora =
          "${data.day}/${data.month}/${data.year}    ${hora.hourOfPeriod}:${hora.minute} am";
    }
    return Card(
      child: ListTile(
        leading: IconButton(
          icon: Icon(Icons.delete_forever, color: Colors.purple[600]),
          iconSize: 30.0,
          onPressed: () {
            dataList.removeAt(dataCheck.indexOf(data));
            dataCheck.remove(data);
            print("removido");
            setState(() {
              dataList = dataList;
            });
          },
        ),
        title: Text(
          dataHora,
          style: TextStyle(fontSize: 20),
        ),
        onTap: () => {},
      ),
    );
  }

  List<Widget> dataListCards() {
    return dataList;
  }

  void addData(DateTime data, TimeOfDay hora) {
    dataList.add(dataCards(data, hora));
    dataCheck.add(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[600],
        title: Text("Criar evento"),
        actions: <Widget>[
          FlatButton(
            textColor: Colors.white,
            onPressed: () => {},
            child: Text(
              "AJUDA",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 10.0,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                padding: EdgeInsets.only(left: 20.0),
                child: Text(
                  "Nome do evento: ",
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 10.0, right: 10.0),
              child: TextFormField(
                maxLength: 15,
                textCapitalization: TextCapitalization.words,
                cursorColor: Colors.purple[600],
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    filled: true,
                    labelText: "Digite o nome do seu evento aqui"),
                onSaved: (value) {
                  name = value;
                },
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                padding: EdgeInsets.only(left: 20.0),
                child: Text(
                  "Descrição: ",
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 10.0, right: 10.0),
              child: TextFormField(
                maxLength: 280,
                keyboardType: TextInputType.text,
                textCapitalization: TextCapitalization.words,
                cursorColor: Colors.purple[600],
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    filled: true,
                    labelText: "Descrição do seu evento",
                    helperText:
                        "obs: Pode ser expandida para até 280 caracteres."),
                onSaved: (value) {
                  description = value;
                },
                maxLines: null,
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                padding: EdgeInsets.only(left: 20.0),
                child: Text(
                  "data do evento: ",
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            dataList.isEmpty
                ? Container()
                : Container(
                    height: (65.0 * dataList.length),
                    child: Column(
                      children: [
                        Expanded(
                          //mudar height dinamicamente com uma variavel
                          child: Column(
                            children: dataListCards(),
                          ),
                        ),
                      ],
                    ),
                  ),
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                padding: EdgeInsets.only(
                  left: 20,
                ),
                
                child: RaisedButton(
                    color: Colors.purple,
                    textColor: Colors.white,
                    elevation: 8,
                    child: Text(
                      "Adicionar data",
                      style: TextStyle(fontSize: 18),
                    ),
                    //verificar possivel bug quando volta a partir do botão de retroceder
                    onPressed: () async {
                      final data = await showDatePicker(
                        context: context,
                        initialDate:
                            dataCheck.isEmpty ? DateTime.now() : dataCheck.last,
                        firstDate: DateTime(DateTime.now().year,
                            DateTime.now().month, DateTime.now().day),
                        lastDate: DateTime(DateTime.now().year + 2),
                        //useRootNavigator: true,
                        locale: Locale("pt", "BR"),
                      );
                      TimeOfDay time = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                      );
                      if (!dataCheck.contains(data)) {
                        print(data);
                        addData(data, time);
                        setState(() {
                          dataList = dataList;
                        });
                      }
                    }),
              ),
            ),
            SizedBox(height: 30.0),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 20),
                  width: 80.0,
                  child: Text(
                    "Preço: ",
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
                Container(
                  height: 60,
                  width: 120.0,
                  child: TextFormField(
                    maxLength: 10,
                    //enableInteractiveSelection: false,
                    keyboardType: TextInputType.number,
                    cursorColor: Colors.purple[600],
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      filled: true,
                    ),
                    onSaved: (value) {
                      preco = value;
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                padding: EdgeInsets.only(left: 20),
                width: 110.0,
                child: Text(
                  "Endereço: ",
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: 20),
                  width: 90.0,
                  child: Text(
                    "Bairro: ",
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
                Container(
                  height: 60,
                  width: 260.0,
                  child: TextFormField(
                    maxLength: 40,
                    textCapitalization: TextCapitalization.words,
                    cursorColor: Colors.purple[600],
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      filled: true,
                    ),
                    onSaved: (value) {
                      bairro = value;
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: 20),
                  width: 90.0,
                  child: Text(
                    "Rua: ",
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
                Container(
                  height: 60,
                  width: 260.0,
                  child: TextFormField(
                    maxLength: 40,
                    textCapitalization: TextCapitalization.words,
                    cursorColor: Colors.purple[600],
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      filled: true,
                    ),
                    onSaved: (value) {
                      rua = value;
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: 20),
                  width: 60.0,
                  child: Text(
                    "Nº: ",
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
                Container(
                  height: 60,
                  width: 85.0,
                  child: TextFormField(
                    maxLength: 6,
                    //enableInteractiveSelection: false,
                    keyboardType: TextInputType.number,
                    cursorColor: Colors.purple[600],
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      filled: true,
                    ),
                    onSaved: (value) {
                      numeroLocal = value;
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 20),
                  width: 70.0,
                  child: Text(
                    "CEP: ",
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
                Container(
                  height: 60,
                  width: 100.0,
                  child: TextFormField(
                    maxLength: 8,
                    //enableInteractiveSelection: false,
                    keyboardType: TextInputType.number,
                    cursorColor: Colors.purple[600],
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      filled: true,
                    ),
                    onSaved: (value) {
                      cep = value;
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                height: 250,
                width: 300,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.purple,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                //depois que a imagem estiver inserida, deve ser adicionado um botão para trocar imagem.
                child: RaisedButton(
                  color: Colors.purple,
                  textColor: Colors.white,
                  elevation: 8,
                  child: Text(
                    "clique para adicionar imagem",
                    style: TextStyle(fontSize: 18),
                  ),
                  onPressed: () {},
                ),
              ),
            ),
            SizedBox(height: 30,),
            Align(
              alignment: Alignment.center,
              child: Container(
                height: 50,
                width: 200,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.purple,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                //depois que a imagem estiver inserida, deve ser adicionado um botão para trocar imagem.
                child:  RaisedButton(
                    color: Colors.purple,
                    textColor: Colors.white,
                    elevation: 8,
                    child: Text(
                      "publicar evento",
                      style: TextStyle(fontSize: 18),
                    ),
                    onPressed: (){},
                    ),
              ),
            ),
            SizedBox(height: 30,)
          ],
        ),
      ),
    );
  }
}
//endereço
//estado  cidade
//bairro  rua
//número  cep
//utilizar dados do PIX que são dados no momento do cadastro(CPF/CNPJ)
//imagem do evento
