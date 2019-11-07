import 'package:flutter/material.dart';

class NoCityLoadedComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.map, size: 200, color: Theme.of(context).textTheme.display1.color,),
          Padding(padding: EdgeInsets.all(5),),
          Text('No city loaded', style: Theme.of(context).textTheme.display1,),
          Padding(padding: EdgeInsets.all(15),),
          Text('Press floating button to search your city.', style: Theme.of(context).textTheme.display1.copyWith(fontSize: 18)),
          Padding(padding: EdgeInsets.all(50),),
        ],
      ),
    );
  }
}