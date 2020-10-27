
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsCustomCard {
  // @override
  // String title;
  // String description;
  // String image_url;
  // DateTime time;
  // String source;
  // String link;

  showCard({ 
    BuildContext context,
    String title,
    String description,
    String image_url,
    DateTime time,
    String source,
    String link,
  }) {
    Size size = MediaQuery.of(context).size;
    return Card( elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(
                vertical: size.height * 0.02, horizontal: size.width * 0.04),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 4,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      image_url,
                    ),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Container(
                    margin:
                        EdgeInsets.symmetric(horizontal: size.width * 0.025),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: size.height * 0.01),
                          child: RichText(
                            maxLines: 4,
                            textAlign: TextAlign.justify,
                            text: TextSpan(
                              text: title,
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(
                vertical: size.height * 0.001, horizontal: size.width * 0.04),
            child: RichText(
              textAlign: TextAlign.justify,
              maxLines: 5,
              overflow: TextOverflow.ellipsis,
              text: TextSpan(
                text: description,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(
                vertical: size.height * 0.02, horizontal: size.width * 0.04),
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Text(
                    "${time.day}/${time.month}/${time.year}",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: Chip(
                    label: Text(
                      source,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                    backgroundColor: Colors.red,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: InkWell(
                    child: Container(
                      child: Icon(
                        Icons.arrow_forward_ios,
                        size: 20,
                      ),
                      alignment: Alignment.centerRight,
                    ),
                    onTap: () => _launchUrl(link),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  _launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw "Could not launch the $url";
    }
  }
}