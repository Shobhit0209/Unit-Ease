import 'package:flutter/material.dart';
import 'package:unit_converter/screens/converter_details.dart';
import 'package:unit_converter/services/coverter_operation.dart';
import 'package:unit_converter/models.dart/converters.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Widget> createListOfConverters() {
    List<Converters> converterList = ConverOperation.getConverters();
    List<Widget> converters = converterList
        .map((Converters converters) => createConverter(converters))
        .toList();
    return converters;
  }

  Widget createConverter(Converters converter) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: GestureDetector(
        onTap: () {
          switch (converter.name) {
            case 'Length':
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => LengthScreen(
                        converters: converter,
                      )));
              break;
            case 'Currency':
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => CurrencyScreen(
                        converters: converter,
                      )));
              break;
            case 'Speed':
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => SpeedScreen(
                        converters: converter,
                      )));
              break;
            case 'Temperature':
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => TemperatureScreen(
                        converters: converter,
                      )));
              break;
            case 'Weight':
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => WeightScreen(
                        converters: converter,
                      )));
          }
        },
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.transparent,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey,
                    offset: Offset.zero,
                    blurStyle: BlurStyle.outer,
                    blurRadius: 0.0)
              ]),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
              ClipRRect(
                child: Image.asset(converter.imgURL, height: 100),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                  child: Text(
                converter.name,
                style: TextStyle(color: Colors.white, fontSize: 18),
              ))
            ]),
          ),
        ),
      ),
    );
  }

  Widget createGrid() {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        children: createListOfConverters(),
      ),
    );
  }

  Widget createAppBar(String message) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      title: Center(
          child: Text(
        message,
        style: TextStyle(color: Colors.white),
      )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover, image: AssetImage('assets/images/bg.png'))),
        height: double.infinity,
        child: Column(children: [
          createAppBar("Unit Converter"),
          SizedBox(
            height: 5,
          ),
          Expanded(
            child: createGrid(),
          )
        ]),
      ),
    );
  }
}
