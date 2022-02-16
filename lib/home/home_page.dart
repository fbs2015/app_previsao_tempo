import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
            children:[
              Column(
                children:[
                Icon(Icons.cloud, size: 60),
                Text(
                  '45.46º', 
                  style: Theme.of(context).textTheme.headline2,
                ),
                Text(
                  'chuvoso',
                   style:Theme.of(context).textTheme.headline4,
                  ),
                ],
              ),
              Container(
                width: 150,
                padding: EdgeInsets.symmetric(vertical: 50),
                child: TextField(
                  controller: controller,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(labelText: 'Cidade'),
                ),
              ),
              ElevatedButton(
                onPressed: (){}, 
                child: Text('Buscar'),
              )
            ],
        ),
      ),
    );
  }
}