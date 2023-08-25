import 'package:dio/dio.dart';

final dio = Dio();

class network
{
  String url;

  network(this.url);

Future get_data() async
{
  try
  {
    final response = await dio.get(url);
    if (response.statusCode == 200 || response.statusCode == 201 || response.statusCode == 202)
    {
      print("OK");
      return response.data;
    }
    else
    {
      throw Exception("STATUS KODU: ${response.statusCode} \n "
          "STATUS MESAJI: ${response.statusMessage} \n");
    }
  }
  catch(e)
  {
    throw Exception("HATA MESAJI: $e \n");
  }
}

  Future post_data(veri) async
  {
    try
    {
      final response = await dio.post(url, data: veri,);
      print(response.statusCode);
      if (response.statusCode == 200 || response.statusCode == 201 || response.statusCode == 202)
      {
        print("OK");
        return response.data;
      }
      else
      {
        throw Exception("STATUS KODU: ${response.statusCode} \n "
            "STATUS MESAJI: ${response.statusMessage} \n");
      }
    }
    catch (e)
    {
      throw Exception("HATA MESAJI: $e \n");
    }
  }

  Future put_data(veri) async
  {
    try
    {
      final response = await dio.put(url, data: veri,);
      print(response.statusCode);
      if (response.statusCode == 200 || response.statusCode == 201 || response.statusCode == 202)
      {
        print("OK");
        return response.data;
      }
      else
      {
        throw Exception("STATUS KODU: ${response.statusCode} \n "
            "STATUS MESAJI: ${response.statusMessage} \n");
      }
    }
    catch (e)
    {
      throw Exception("HATA MESAJI: $e \n");
    }
  }

  Future patch_data(veri) async
  {
    try
    {
      final response = await dio.patch(url, data: veri,);
      print(response.statusCode);
      if (response.statusCode == 200 || response.statusCode == 201 || response.statusCode == 202)
      {
        print("OK");
        return response.data;
      }
      else
      {
        throw Exception("STATUS KODU: ${response.statusCode} \n "
            "STATUS MESAJI: ${response.statusMessage} \n");
      }
    }
    catch (e)
    {
      throw Exception("HATA MESAJI: $e \n");
    }
  }

  Future delete_data() async
  {
    try
    {
      final response = await dio.delete(url);
      print(response.statusCode);
      if (response.statusCode == 200 || response.statusCode == 201 || response.statusCode == 202)
      {
        print("OK");
        return response.data;
      }
      else
      {
        throw Exception("STATUS KODU: ${response.statusCode} \n "
            "STATUS MESAJI: ${response.statusMessage} \n");
      }
    }
    catch (e)
    {
      throw Exception("HATA MESAJI: $e \n");
    }
  }

}