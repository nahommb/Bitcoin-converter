import 'network.dart';
import 'package:flutter/material.dart';
import 'coin_data.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';

class price_screen extends StatefulWidget {

  @override
  State<price_screen> createState() => _price_screenState();
}

class _price_screenState extends State<price_screen> {
 bool isLoading = false;
  String selected = "USD";
  var textdata ;

 Network network = Network();


 @override
  void didChangeDependencies() {
    isLoading = true;
    network.getcurrencydata(selected).then((_) {
      setState(() {
        textdata = network.textdata;
        isLoading = false;
      });

      print(textdata);
    });
    super.didChangeDependencies();
  }

  DropdownButton<String> androidpicker() {
    List<DropdownMenuItem<String>> dropdown = [];
    for (String cureency in currencylist) {
      var newitem = DropdownMenuItem(child: Text(cureency,style: TextStyle(color: Colors.lightBlue),), value: cureency,);
      dropdown.add(newitem);
    }
    return DropdownButton(
      value: selected,
      items: dropdown,
      onChanged: (value) {
        setState(() {
          selected = value!;
          isLoading = true;
        });

        network.getcurrencydata(selected).then((_) {
          setState(() {
            textdata = network.textdata;
            isLoading = false;
          });
        });
      },
    );
  }

  CupertinoPicker iospicker(){
    List<Widget> ioslist = [];
    for (String cureency in currencylist) {
      ioslist.add(Text(cureency));
    }
    return CupertinoPicker(
    itemExtent: 32,
    onSelectedItemChanged: (value) => print(value),
    children: ioslist,
    );
  }
  @override



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFDDE6ED),
      appBar: AppBar(title: Text("BITCOIN",style: TextStyle(color: Colors.lightBlue),),
        centerTitle: true,
        backgroundColor: Colors.white),
      body: (isLoading) ? Center(child: CircularProgressIndicator(),) :
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              color: Colors.white,
              child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                  child: Text( "1 BTC = $textdata $selected", style: TextStyle(fontSize: 25,color: Colors.lightBlue),
                    textAlign: TextAlign.center,)

              ),
            ),
          ),

          Container(
              color: Colors.white,
              height: 150,
              padding: EdgeInsets.only(bottom: 30),
              alignment: Alignment.center,
              child: Platform.isIOS ? iospicker() : androidpicker()
          )
        ],
      ),
    );
  }
}

