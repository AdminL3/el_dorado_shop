import 'package:eldorado/functions.dart';
import 'package:flutter/material.dart';

class CustomWidget extends StatefulWidget {
  final String id;
  final String anzahl;
  final String money;
  final String name;
  final String level;
  final Color backgroundColor;
  final Color iconcolor;

  const CustomWidget({
    Key? key,
    required this.id,
    required this.anzahl,
    required this.money,
    required this.name,
    required this.level,
    required this.backgroundColor,
    required this.iconcolor,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CustomWidgetState createState() => _CustomWidgetState();
}

class _CustomWidgetState extends State<CustomWidget> {
  late String path;
  late String idn;
  late String namen;
  late String anzahln;
  late String moneyn;
  late String leveln;
  late Color bgcolorn;
  late Color icolorn;
  @override
  void initState() {
    int x = Functions.getidbycard(widget.name);
    path = Functions.getImagePathById(x);
    super.initState();
    anzahl();
  }
  void anzahl(){
    idn = widget.id;
    anzahln = widget.anzahl;
    moneyn = widget.money;
    namen = widget.name;
    leveln = widget.level;
    bgcolorn = widget.backgroundColor;
    icolorn = widget.iconcolor;
    int anzahlint = int.parse(anzahln);
    if(anzahlint<1){
      idn = '';
      anzahln = '';
      moneyn = '';
      namen = '';
      leveln = '';
      bgcolorn = Colors.red;
      icolorn = Colors.red;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: widget.backgroundColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                idn,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
              const SizedBox(
                width: 50,
              ),
              Text(
                widget.anzahl,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12.0),
          Text(
            widget.level,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 18.0),
          ),
          const SizedBox(height: 12.0),
          Center(
            child: Column(
              children: [
                CircleAvatar(
                  radius: 40.0,
                  backgroundColor: Colors.deepOrange,
                  backgroundImage: AssetImage(path),
                ),
                const SizedBox(height: 6.0),
                Text(
                  widget.name,
                  style: const TextStyle(fontSize: 16.0),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Row(
                  children: [
                    Icon(Icons.attach_money,
                        color: widget.iconcolor, size: 20.0),
                    Text(
                      widget.money,
                      style: const TextStyle(
                        fontSize: 16.0,
                        color: Colors.amber,
                      ),
                    ),
                    Icon(Icons.attach_money,
                        color: widget.iconcolor, size: 20.0),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
