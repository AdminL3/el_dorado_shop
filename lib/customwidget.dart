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

  CustomWidget({
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
  _CustomWidgetState createState() => _CustomWidgetState();
}

class _CustomWidgetState extends State<CustomWidget> {
  late String path;

  @override
  void initState() {
    int x = Functions.getidbycard(widget.name);
    path = Functions.getImagePathById(x);
    super.initState();
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
                widget.id,
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
