import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yabiso_ecommerce/di/appModule.dart';

import 'core/fonts/util.dart';
import 'core/themes/theme.dart';

void main(){
  setup();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final brightness = View.of(context).platformDispatcher.platformBrightness;
    TextTheme textTheme = createTextTheme(context, "Poppins", "Roboto");
    MaterialTheme theme = MaterialTheme(textTheme);

    return MaterialApp(
      title: 'Yabiso E-commerce',
      debugShowCheckedModeBanner: false,
      theme: brightness == Brightness.light ? theme.light() : theme.dark(),
      home: Placeholder(),
    );
  }
}
