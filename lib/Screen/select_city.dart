import 'package:flutter/material.dart';
class SelectCity extends StatefulWidget {
  @override
  _SelectCityState createState() => _SelectCityState();
}

class _SelectCityState extends State<SelectCity> {
  var cityName;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RadioListTile(
          value: "Amravati",
          title: Text("Amravati"),
          activeColor: Colors.lightBlue,
          groupValue: cityName,
          // Provider.of<CityProvider>(context,listen: false).cityName,
          onChanged: (t){
            setState(() {
              cityName=t;
              // Provider.of<CityProvider>(context,listen: false).swapCity(t);
            });
          },
        ),
        RadioListTile(
          value: "Morshi",
          title: Text("Morshi"),
          activeColor: Colors.lightBlue,
          groupValue: cityName,
          // Provider.of<CityProvider>(context,listen: false).cityName,
          onChanged: (t){
            setState(() {
              cityName=t;
              // Provider.of<CityProvider>(context,listen: false).swapCity(t);
            });
          },
        ),
      ],
    );
  }
}
