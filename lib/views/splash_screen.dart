import 'package:flutter/material.dart';

class splash_screen extends StatefulWidget {
  const splash_screen({Key? key}) : super(key: key);

  @override
  State<splash_screen> createState() => _splash_screenState();
}

class _splash_screenState extends State<splash_screen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 60,),
              CircleAvatar(
                radius: 150,
                backgroundImage: AssetImage("assets/images/image.jpg"),
              ),
              SizedBox(height: 60,),
              Text("       Watch Movies\n Whenever You want",style: TextStyle(color: Colors.black,fontSize: 30,fontWeight: FontWeight.w600),),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(left: 70,right: 70),
                child: InkWell(
                  onTap: (){
                    setState(() {
                      Navigator.of(context).pushNamed('/');
                    });
                  },
                  child: Container(
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.red.shade900,
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Row(
                      children: [
                        SizedBox(width: 70,),
                        Text("Start",style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.w600),),
                        SizedBox(width: 80,),
                        Icon(Icons.navigate_next,size: 40,color: Colors.white,),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 130,),
            ],
          ),
        ),
      ),
    );
  }
}
