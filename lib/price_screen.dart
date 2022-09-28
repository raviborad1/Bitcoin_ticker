import 'package:flutter/material.dart';
import 'package:bitcoin_ticker/coin_data.dart';
import 'package:bitcoin_ticker/cryptoCard.dart';

class PriceScreen extends StatefulWidget {
  @override
  PriceScreenState createState() => PriceScreenState();
}

class PriceScreenState extends State<PriceScreen> {
  Reusable reusable=Reusable();
  CoinData coinData=CoinData();
  double? check;
  var selectCurrency = 'USD';

  getDropdownitem() {
    List<DropdownMenuItem<String>> dropdownitem = [];
    for (int i = 0; i <currenciesList.length; i++) {
      var newitem = DropdownMenuItem(
        child: Text(currenciesList[i]),
        value: currenciesList[i],
      );
      dropdownitem.add(newitem);
    }
    return dropdownitem;
  }
  String? bitcoinValueInUSD ;
  String? ethValueinUSD;
  String? ltcvalue;

  //11. Create an async method here await the coin data from coin_data.dart
  void getData(String update) async {
    try {
      double data = await coinData.getbitcoindata(update);
      double data2=await coinData.getETHdata(update);
      double data3=await coinData.getLTCdata(update);
      //13. We can't await in a setState(). So you have to separate it out into two steps.
      setState(() {
        bitcoinValueInUSD = data.toStringAsFixed(0);
        ethValueinUSD=data2.toStringAsFixed(0);
        ltcvalue=data3.toStringAsFixed(0);
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    //14. Call getData() when the screen loads up. We can't call CoinData().getCoinData() directly here because we can't make initState() async.
    getData(selectCurrency);
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Card(
                  color: Colors.lightBlueAccent,
                  elevation:5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),

                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                    child: Text(
                      '1 BTC = $bitcoinValueInUSD $selectCurrency',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),

                  ),
                ),

                Card(
                  color: Colors.lightBlueAccent,
                  elevation:5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                    child: Text(
                      '1 ETH = $ethValueinUSD $selectCurrency',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),

                  ),
                ),
                Card(
                  color: Colors.lightBlueAccent,
                  elevation:5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                    child: Text(
                      '1 LTC = $ltcvalue $selectCurrency',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),

                  ),
                ),
              ],
            ),
          ),


          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: const EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: DropdownButton<Object>(
              value: selectCurrency,
              items: getDropdownitem(),
              onChanged: (value)  {
                setState(() {
                  selectCurrency = value.toString();
                  getData(selectCurrency);
                  // print(check);
                  // print( await networking.getdata());
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
