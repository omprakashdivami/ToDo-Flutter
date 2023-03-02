import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Person {
  String name;
  String age;

  Person({required this.name, required this.age});
}

class Formscreen extends StatefulWidget {
  const Formscreen({super.key});

  @override
  State<Formscreen> createState() => FormscreenState();
}

class FormscreenState extends State<Formscreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  String initialName = '';
  String initialAge = '';
  List<Person> allUsers = [];
  int updateIndex=0;
  @override
  void dispose() {
    nameController.dispose();
    ageController.dispose();
    super.dispose();
  }

  void addPerson([String action="",int ind=0]) {
    setState(() {
      if(action=="Update")
      {
         
         updateIndex=ind;
      }
      else{
      allUsers.add(Person(name: initialName, age: initialAge));
      nameController.clear();
      ageController.clear();
      initialName = '';
      initialAge = '';
      }
    });
  }
  void updateInfo(){
    setState(() {
      allUsers[updateIndex].name=initialName;
    allUsers[updateIndex].age=initialAge;
    });
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: nameController,
                maxLength: 16,
                obscureText: false,
                onChanged: (value) {
                  setState(() {
                    initialName = value;
                  });
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Name',
                  hintText: 'Enter Name',
                ),
              ),
            ), 
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: ageController,
                maxLength: 2,
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                onChanged: (value) {
                  setState(() {
                    initialAge = value;
                  });
                },
                obscureText: false, //password type
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Age',
                  hintText: 'Enter Age',
                ),
              ),
            ),
            TextButton(
              child: const Text('Add Person'),
              style: TextButton.styleFrom(backgroundColor: Colors.amberAccent),
              onPressed: addPerson,
            ),
             TextButton(
              child: const Text('Update'),
              style: TextButton.styleFrom(backgroundColor: Colors.amberAccent),
              onPressed:()=> updateInfo(),
            ),
            
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: allUsers.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(allUsers[index].name),
                        Text('Age: ${allUsers[index].age}'),
                        ElevatedButton(onPressed: (){
                          setState(() {
                            allUsers.removeAt(index);
                          });
                          
                        }, child: Text("DELETE")),
                        ElevatedButton(onPressed:(){
                          nameController.text=allUsers[index].name;
                          ageController.text=allUsers[index].age;
                          addPerson("Update",index);
                          // updateInfo(index);

                        }, child: Text("EDIT"))
                        

                      ],
                    ),
                    // subtitle: Text('Age: ${allUsers[index].age}'),

                  );
                },
              ),
            ),
          ],
        ),
      ),
      // backgroundColor: Color.fromARGB(159, 255, 255, 255),
    );
  }
}
