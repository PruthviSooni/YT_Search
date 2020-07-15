import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_youtube_search_api/configs/constants.dart';
import 'package:flutter_youtube_search_api/configs/key.dart';
import 'package:flutter_youtube_search_api/widgets/shimmer.dart';
import 'package:youtube_api/youtube_api.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static int max = 20;
  YoutubeAPI youtubeAPI =
      YoutubeAPI(APIKey.key, maxResults: max, type: 'video');
  dynamic result;
  final dynamic query = '';

  apiCall() async {
    dynamic data = await youtubeAPI.search(query);
    setState(() {
      result = data;
    });
  }

  @override
  void initState() {
    super.initState();
    apiCall();
    print(result.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Youtube API'),
      ),
      body: result != null
          ? SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 8.0, left: 10, right: 10),
                    child: TextField(
                      enableSuggestions: true,
                      decoration: kTextFieldDecoration,
                      onChanged: (value) async {
                        dynamic data;
                        if (value != null) {
                          data = await youtubeAPI.search(value);
                        } else {
                          return null;
                        }
                        setState(() {
                          if (result != null) {
                            result = data;
                          }
                        });
                      },
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: result.length,
                    itemBuilder: (_, int index) {
                      return Card(
                        margin:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 7),
                        elevation: 2,
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 7.0),
                          padding: EdgeInsets.all(12.0),
                          child: Row(
                            children: <Widget>[
                              Image.network(
                                result[index].thumbnail['default']['url'],
                              ),
                              Padding(padding: EdgeInsets.only(right: 20.0)),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      result[index].title,
                                      softWrap: true,
                                      style: TextStyle(fontSize: 18.0),
                                    ),
                                    Padding(
                                        padding: EdgeInsets.only(
                                            bottom: 1.5, top: 2)),
                                    Text(
                                      result[index].channelTitle,
                                      softWrap: true,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Padding(
                                        padding: EdgeInsets.only(
                                            bottom: 3.0, top: 5)),
                                    Container(
                                      padding: EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: Colors.grey.shade700),
                                      child: Text(
                                        result[index].channelTitle,
                                        style: TextStyle(),
                                        softWrap: true,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            )
          : load_shimmer(),
    );
  }
}
