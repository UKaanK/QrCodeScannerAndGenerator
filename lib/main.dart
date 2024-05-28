import 'package:flutter/material.dart';
import 'package:qrcodescannerandgenerator/generate_qr_code.dart';
import 'package:qrcodescannerandgenerator/scan_qr_code.dart';

void main() {
  runApp(const MainPage());
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home:  HomePage(),
    );
  }
}
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Qr Code Scanner And Generator"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
              onPressed: (){
                setState(() {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ScannQrCode()));
                });
              },
             child: Text("Scan Qr Code")),),
            Center(
            child: ElevatedButton(
              onPressed: (){
                setState(() {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>GenerateQrCode()));
                });
              },
             child: Text("Generate Qr Code")),
          )
        ],
      ),
    );
  }
}
