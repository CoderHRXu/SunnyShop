import 'package:flutter/material.dart';


class AdBanner extends StatelessWidget {
  final String adUrl;

  AdBanner({Key key, this.adUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.network(this.adUrl),
    );
  }
}