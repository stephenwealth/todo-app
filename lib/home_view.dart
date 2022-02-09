// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables



import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:todo_app/create_todo.dart';
import 'package:todo_app/utils.dart';

class HomeView extends StatefulWidget {
   const HomeView({ Key? key }) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
String selectedItem = 'todo';

 final List<Map<String, dynamic>> unCompletedData = []; 

 final List<Map<String, dynamic>> completedData = []; 

 final List<Map<String, dynamic>> data = [
   {
    'title': 'Flutter Web',
    'description': 'Simply dummy of the printing and typesetting industry. Lorem Ipsum',
    'date_time': 'Tomorrow',
    'status': false
   },
   {
    'title': 'Study Flutter',
    'description': 'Simply dummy of the printing and typesetting industry. Lorem Ipsum',
    'date_time': 'Today',
    'status': false
   },
   {
    'title': 'Submit Files',
    'description': 'Simply dummy of the printing and typesetting industry. Lorem Ipsum',
    'date_time': 'Yesterday',
    'status': true
   },
   {
    'title': 'Dart Language',
    'description': 'Simply dummy of the printing and typesetting industry. Lorem Ipsum',
    'date_time': 'Tomorrow',
    'status': false
   },
   {
    'title': 'Flutter',
    'description': 'Simply dummy of the printing and typesetting industry. Lorem Ipsum',
    'date_time': 'Today',
    'status': false
   },
   {
    'title': 'Tour',
    'description': 'Simply dummy of the printing and typesetting industry. Lorem Ipsum',
    'date_time': 'Yesterday',
    'status': true
   },
   {
    'title': 'Push Code',
    'description': 'Simply dummy of the printing and typesetting industry. Lorem Ipsum',
    'date_time': 'Tomorrow',
    'status': false
   }
 ];
 @override
  void initState() {
    
  for (Map<String, dynamic> element in data) {
    if (!element['status']) {
      unCompletedData.add(element);
    } else {
      if (element['status']) {
        completedData.add(element);
      }
    }
  }
  
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

  

    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(5.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage('https://media.istockphoto.com/photos/yes-you-can-picture-id1284279100?b=1&k=20&m=1284279100&s=170667a&w=0&h=jhpJhoIeSWFHzxIm93WVq5auO_eWYOMOtNeFsFqETH4='),
          )
        ),
        title: const Text(
          'My Tasks',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
        actions: [
          PopupMenuButton(
            onSelected: (value){
              setState(() {
                selectedItem = '$value';
              });
            },
          icon: const Icon(Icons.menu),
          itemBuilder: (context) {
            return [
              const PopupMenuItem(child: Text('Todo'),
              value: 'todo',
              ),
              const PopupMenuItem(child: Text('Completed'),
              value: 'completed',
              )
        ];
          }),
          IconButton(onPressed: (){}, icon: Icon(Icons.search))
          ],
      ),
      floatingActionButton: 
      FloatingActionButton(onPressed: (){
        Get.to( CreateToDo());},
      child: const Icon(
        Icons.add,
        color: Colors.white,
        size: 50,
        ),
        ),
        body: ListView.separated(itemBuilder: (context,index){
          return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
      children: [
       Icon(Icons.check_circle_outline_outlined,
      color: customColor(
        date: selectedItem == 'todo'
        ? unCompletedData[index]['date_time']
        :completedData[index]['date_time'], ),
      ),
      const SizedBox( 
      width: 20,
      ),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
        children: [
          Text(
             selectedItem == 'todo'
        ? unCompletedData[index]['title']
        :completedData[index]['title'],
           style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ), 
          Text(
             selectedItem == 'todo'
        ? unCompletedData[index]['description']
        :completedData[index]['description'],
          maxLines: 2,
          overflow: TextOverflow.ellipsis, 
          style:const TextStyle(fontSize: 15),
          )
        ],
        ),
      ),
      const SizedBox(
        width: 10,
      ),
      Row(
        children:[
        const  Icon(Icons.notifications), 
          Text(
            unCompletedData[index]['date_time'],
             style: TextStyle(
               fontSize: 15, fontWeight: FontWeight.bold,
               color: customColor(
                 date:unCompletedData[index]['date_time'], )),
            )
        ],
      
      ),
      ],
      ),
    ),
    );
          },
        separatorBuilder: (context,index){
          return const SizedBox(height: 5,);
        }, itemCount: selectedItem == 'todo'?
         unCompletedData.length
         : completedData.length
        ),
       bottomNavigationBar: SafeArea(
        child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: InkWell(
          onTap: () {
            showBarModalBottomSheet(context: context, builder: (context){
              return  ListView.separated(itemBuilder: (context,index){
          return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
      children: [
       Icon(Icons.check_circle_outline_outlined,
       color: customColor(date: completedData[index]['date_time'] ),
        ),
      const SizedBox( 
      width: 20,
      ),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
        children: [
          Text(
             completedData[index]['title'], 
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ), 
          Text(
             completedData[index]['description'],
          maxLines: 2,
          overflow: TextOverflow.ellipsis, 
          style:TextStyle(fontSize: 15),
          )
        ],
        ),
      ),
      
      Row(
        children:[
          Icon(Icons.notifications,
          color: customColor(date:  completedData[index]['date_time'])
          ), 
          Text(
             completedData[index]['date_time'],
             style: TextStyle(
               fontSize: 15, fontWeight: FontWeight.bold,
               color: customColor(date:  completedData[index]['date_time'])
               ),
            )
        ],
      
      ),
      ],
      ),
    ),
    );
          },
        separatorBuilder: (context,index){
          return const SizedBox(height: 5,);
        }, itemCount: completedData.length
        );
            });
          },
          child: Material(
            borderRadius: BorderRadius.circular(15),
            color: Color.fromRGBO(29, 38, 104, 1),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(
                    Icons.check_circle,
                    size: 30,
                    color: Colors.white,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text('Completed',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                    ),
                    ),
                    Spacer(),
                    Text('${completedData.length}',
                    style: TextStyle(color: Colors.white),
                    ),
                     
                ],
              ),
            ),
          ),
        ),
      ),
    ),
    );
  }
}

