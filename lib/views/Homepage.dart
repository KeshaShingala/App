import 'package:flutter/material.dart';

import '../helper/db_helper.dart';
import '../modals/data_modal.dart';



class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Movie Information",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600),),
        leading: Container(),
        backgroundColor: Colors.red.shade900,
      ),
      body: FutureBuilder(
        future: DatabaseHelper.databaseHelper.fetchAllData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if(snapshot.hasError)
          {
            return Center(
              child: Text("Error : ${snapshot.hasError}"),
            );
          }
          else if(snapshot.hasData){
            List<Movie>? data = snapshot.data;

            return ListView.builder(
                itemCount: data?.length,
                itemBuilder: (context, i){
                  return ListTile(
                    title: Row(
                      children: [
                        SizedBox(
                            width: 120,
                            child: ClipRRect(
                              child: Image.network(data![i].Poster),
                              borderRadius: BorderRadius.circular(10),
                            )
                        ),
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(data![i].Title,style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w600),),
                                Text("${data![i].Year}",style: TextStyle(color: Colors.grey,fontSize: 18),),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                });
          }
          else{
            return Center(
              child: CircularProgressIndicator(color: Colors.red.shade900),
            );
          }
        },
      ),
    );
  }
}


