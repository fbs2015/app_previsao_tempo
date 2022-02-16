import 'package:flutter/material.dart';
import 'package:http_weather/service/data_service.dart';
import 'package:http_weather/model/weather.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController controller = TextEditingController();
  DataService dataService = DataService();
  Weather weather = const Weather();
  bool isFetch = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Clima'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
            children:[
              isFetch ?
              Column(
                children:[
                Image.network('http://openweathermap.org/img/wn/${weather.icon}@2x.png'),
                Text(
                  '${weather.temp}ª', 
                  style: Theme.of(context).textTheme.headline2,
                ),
                Text(
                  weather.description,
                   style:Theme.of(context).textTheme.headline4,
                  ),
                ],
              ) : const SizedBox(),
              Container(
                width: 150,
                padding: const EdgeInsets.symmetric(vertical: 50),
                child: TextField(
                  controller: controller,
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(labelText: 'Cidade'),
                ),
              ),
              ElevatedButton(
                onPressed: () async{
                   isFetch = true;
                   weather = await dataService.fetchData(controller.text);
                   setState(() {
                     
                   });   
                }, 
                child: const Text('Buscar'),
              )
            ],
        ),
      ),
    );
  }
}