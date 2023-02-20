

// void main() {
//   getName();
//   getName2();
//   runApp(const MyApp());
// }

// String getName2()=>"Mohamed";
// String getName(){
//  const name = "mohamed"; //1.or const String name; or final name;
//  final name20 = "mohamed" * 20; //2.operations on string; 
//  print(name20);
//  return name;
// }
// /*********************************************************************************************/
// //3.Lists
//   //const arrNames=["ahmed","mostafa","amr"];
//   List<String> arrNames=["ahmed","mostafa","amr"];

//  final namesLength = arrNames.length;
//  //arrNames.add("Ali");

// /*********************************************************************************************/
// //4.Sets
//  const setNames={"ahmed","mostafa","amr"};
//  //const setNames={"ahmed","mostafa","amr" , "amr"};//Error
//  //setNames.add("Ahmed");//Not Working
//  //print(setNames);
//  //Will print {"ahmed","mostafa","amr"}

// /*********************************************************************************************/
// //5.Objects
//  const newObjects={"ahmed",2,4};

// /*********************************************************************************************/
// //6.maps
//  const newMaps={'name':"ahmed",'age':28,'tall':195};
//  //print(newMaps)//{name:"ahmed",age:28,tall:195}

//  //newMaps["name"]="Mohamed";
//  //print(newMaps);//{name:"Mohamed",age:28,tall:195}


// /*********************************************************************************************/
//  //7.Nullable
//   int? x =6;//or null
//   List<String?>? arrNamesAndNull=["ahmed","mostafa","amr",null];
//   //arrNamesAndNull?.add("Ali");//?. invocation operator
//   //if the list != null , so add (Ali) to it 

//  var nonNullValue = arrNamesAndNull[0] ?? arrNamesAndNull[1] ?? arrNamesAndNull[2]; //?? infix operator
//  // check if arrNamesAndNull[0],... is not null and  take first non null value
//  nonNullValue ??= "New One" ; //if it still null make it's value (New One) 
// /********************************************************************************************* */

// //8.Enum and Classes
// enum AnimalType{dog,cat,camel}
// AnimalType an = AnimalType.cat;
// /********************************************************************************************* */
// //9.Classes
// abstract class Human{
//   void sayHi(){}
// }
// class Person extends Human{ 
//   final String name;//Error if there is no constructor
//   Person(this.name);//Need to initialize it 
//   //It's like I say: Person(x){this.name = x;}

//   //Custom Operator
//   @override
//   bool operator ==(convariant Person other)=>other.name == name;
//   @override int get hashCode =>name.hashCode;
  
//   //Override == operator so we can say if(person1==person2){}
//   //The operator== function take an argument of type object , so convariant: tell the function to forget this type and take Person object



//   getName(){ return this.name;}
//   void run(){return "run";}
//   void breathe(){return "breathe";}

// }

// //9.Inherietence
// class Manager extends Person{
//   void addEmployee(){}
  
// }

// //Human h =  Human();//Error
// Person p =  Person("Ali");
// Manager p =  Manager();
// p.run();
// print(p.getName());

// /********************************************************************************************* */
// //10.Factory constructor
// class Cat {
//   final String name;
//   Cat(this.name);
//   factory Cat.createNewOne(){
//     return Cat("Name1");
    
//     }

//  factory Cat.createNewManager(){
//     return Manager("Manager");
    
//     }
// }
// final newCat = Cat.createNewOne();
// final newManager = Cat.createNewManager();
// print(newCat.name);//Name1
// /********************************************************************************************* */
// //11.Extension(Add logic to existing class)
// extension Run on Cat{
//   void run(){
//     print('Cat $name is running')
//   }
// }
// newCat.run();

// //Ex2
// class PersonNew{
// final String firstName;
// final String lastName;
// PersonNew(this.firstName,this.lastName);
// }
// extension FullName on PersonNew{
//   String get fullName=>'$firstName $lastNAme';
// }
// PersonNew personNew = PersonNew("Ahmed","Mohamed");
// print(personNew.fullName);//Ahmed Mohamed
// /********************************************************************************************* */
// //12.async await 
// void myFun() async{
//   //var res = await callService();
// }
// /********************************************************************************************* */
// //13.Future and Streams (pipe of data)
// Stream<String> getNameStream(){
//   return Stream.periodic(const Duration(seconds:1),(value){
//     return 'Ahmed.....';
//   });
// }
// void getNameFun() async{
//   await for(final v in getNameStream()){
//     print(v);
//   }
// }
// /********************************************************************************************* */
// //14.Iterable to generating 
// Iterable<int> getNumbers() sync*{
//   //return [1,2,3]//error
//   yield 1;
//   yield 2;
//   yield 3;
// }

// void getN() {
//  // print(getNumbers());
//   for(final v in getNumbers()){
//     print(v);
//   }
// }

// /********************************************************************************************* */
// //14.Generics
// Class Pairs<A,B>{
//   final A value1;
//   final B value2;
//   Pairs(this.value1,this.value2);
// }
// final  pairs1 = Pairs("Ahmed","Mohamed");//A is String and B is String
// final  pairs2 = Pairs(1,2);//A is number and B is number
// final  pairs3 = Pairs(1,"Ahmed"); //A is number and B is String
// /**********************************************************************************************/

//16.To Create Models from response
//https://app.quicktype.io/