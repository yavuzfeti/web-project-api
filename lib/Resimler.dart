import 'package:flutter/material.dart';
import 'network.dart';

class resimler extends StatefulWidget
{
  const resimler({Key? key}) : super(key: key);

  @override
  State<resimler> createState() => _resimlerState();
}

class _resimlerState extends State<resimler>
{
  @override
  void initState()
  {
    super.initState();
    al();
  }

  bool loading = true;
  dynamic data = [];

  Future al() async
  {
    setState(()
    {
      loading = true;
    });

    try
    {
      network adres = network("https://jsonplaceholder.typicode.com/photos");

      var get_data = await adres.get_data();

      if (get_data != null)
      {
        data = await get_data;
      }
      setState(()
      {
        loading = false;
      });
    }
    catch (e)
    {
      setState(()
      {
        loading = false;
      });
      print("HATA OLUŞTU $e");
    }
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: loading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, int index)
              {
                return Container(
                  margin: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: ListTile(
                    title: Column(
                      children:
                      [
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundImage: NetworkImage(data[index]["thumbnailUrl"]),
                              //radius: 50,
                            ),
                            SizedBox(width: 10,),
                            Expanded(child: Text("${data[index]["title"] ?? ""}")),
                        ],
                        ),
                        CircleAvatar(
                          backgroundImage: NetworkImage(data[index]["url"]),
                          radius: 150,
                        ),
                      ],
                    ),
                  ),
                );
              }),
    );
  }
}
