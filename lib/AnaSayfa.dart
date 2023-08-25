import 'package:flutter/material.dart';
import 'package:web_project_api/Network.dart';

class AnaSayfa extends StatefulWidget {
  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  @override
  void initState() {
    super.initState();
    al();
  }

  bool loading = true;
  dynamic data = [];

  Future al() async {
    network adres = network("https://jsonplaceholder.typicode.com/users");

    var body = await adres.get_data();
    if (body != null) {
      data = body;
    } else {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Web Project"),
              content: Text("Veri yok"),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      setState(() {
                        loading = true;
                      });
                      al();
                    },
                    child: Text("Tekrar dene"))
              ],
            );
          });
    }
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Web Project"),
      ),
      body: loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: data.length ?? 0,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text("Veri $index"),
                  subtitle: Column(
                    children: [
                      Text("${data[index]["id"]}"),
                      Text("${data[index]["name"]}"),
                      Text("${data[index]["username"]}"),
                      Text("${data[index]["email"]}"),
                      Text("${data[index]["address"]}"),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
