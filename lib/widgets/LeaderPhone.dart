import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LeaderPhone extends StatelessWidget {
  final String leaderImage;
  final String leaderPhone;

  LeaderPhone({Key key, this.leaderImage, this.leaderPhone }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        child: Image.network(leaderImage),
        onTap: _launchURL,
        
      ),
    );
  }


  void _launchURL() async {
    // String url = 'tel:' + leaderPhone;
    String url = "https://www.baidu.com";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw url + '此url不能访问';
    }
  }

}