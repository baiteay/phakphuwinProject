import 'package:flutter/material.dart';
import 'package:premier_league_app_6404800010/models/team.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class premierTeam extends StatefulWidget {
  const premierTeam({super.key});

  @override
  State<premierTeam> createState() => _premierTeamState();
}

class _premierTeamState extends State<premierTeam> {

  List<Course>? course = [];
  bool isLoding = true;
  Future<void> _getData() async {
    var url = Uri.parse("https://noraphat.dev/web_api/get_team_name/");
    
    var response = await http.get(url);
    if (response.statusCode == 200) {
      print('Responese : ${response.statusCode}');
      final Team product =
          Team.fromJson(convert.jsonDecode(response.body));
      setState(() {
        course = product.course;
        isLoding = false;
      });
    } else {
      print('Error From Backend ${response.statusCode}');
      isLoding = false;
    }
  }

  @override
  void initState() {
    super.initState();
    _getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Team Page"),
      ),
      body: isLoding == true
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.separated(
              itemBuilder: (BuildContext context, index) {
                return ListTile(
                  leading: Container(
                    width: 90,
                    height: 90,
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        image: DecorationImage(
                            image: NetworkImage(course![index].teamlogo!),
                            fit: BoxFit.contain)),
                  ),
                  title: Text('${course![index].teamname}'),
                  trailing: Icon(Icons.arrow_right),
                  onTap: () {
                    Navigator.pushNamed(context, 'stack/map',
                    
                    arguments: {
                      'team_lat':course![index].teamlat,
                      'team_long':course![index].teamlong,
                      'team_detail':course![index].teamdetail
                    });
                  },
                );
              },
              separatorBuilder: (BuildContext context, index) => Divider(),
              itemCount: course!.length,
            ),
    );
  }
}