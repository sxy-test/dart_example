
import 'dart:math';

void main() {
  print('Hello, World!');
  //变量
  var name = '盛欣怡';
  var studentNo = 20211060123;

  //流程控制语句
  if(name == '盛欣怡'){
    print('我是盛欣怡');
  }else{
    print('我不是盛欣怡');
  }

  var students = ['张三', '李四', '王五', '赵二麻子',name];
  for(final student in students){
    if(student == name) continue;
    print("我的同学有："+student);
  }
  print("一年有十二个月，分别是：");
  for (int month = 1; month <= 12; month++) {
    print("$month月");
  }

  int weekDay =0;

  print("一周有七天，分别是：");
  while(weekDay<7){
    weekDay+=1;
    print("周${weekDay==7 ? "日" :weekDay}");
  }
  //函数
  print("斐波那契结果：${fibonacci(20)}");
  //胖箭头
  students.where((studentName) => studentName.contains(name)).forEach((e)=>print("从班级中找到"+e));
  //导入 使用math库
  print("最小值：${min(10,30)}");
  //类
  print(Student(name,18).intro());
  //枚举
  final myRole = RoleType.student;
  if(myRole != RoleType.teacher){
    print("当前枚举不是老师");
  }
  //继承
  final transferStudent = TransferStudent("清华大学","$name的邻居",18);
  print(transferStudent.intro());
  //mixin
  transferStudent.eat();
  //异步
  calcStudentCount(name).then((value) => print(value));
  //异常
  try {
    if(!students.any((element) => element=="张三丰")){
        throw Exception("张三丰逃课了");
      };
  } catch (e) {
    print(e);
  }
}
//函数
int fibonacci(int n) {
  if (n == 0 || n == 1) return n;
  return fibonacci(n - 1) + fibonacci(n - 2);
}
//类
class Student{
  String name;
  int age;

  Student(this.name,this.age);

  String intro(){
    return "我是${name},${age}岁了";
  }
}
//枚举
enum RoleType { student, teacher }

//扩展类、Mixin Human
class TransferStudent extends Student with Human{

  String fromSchool;
  TransferStudent(this.fromSchool,super.name, super.age);

  @override
  String intro() {
    return super.intro()+"，来自$fromSchool";
  }
}
//Mixins
mixin Human {
  void eat() {
    print('吃饭');
  }
}
//接口和抽象类
abstract class Class {
  String studentCount();

  void intro() {
    print("当前班级有${studentCount()}人");
  }
}

//接口和抽象类
class OneClass extends Class {
  String studentCount() => "30";
}

//接口和抽象类
class TowClass extends Class {
  String studentCount() => "40";
}

//异步
Future<String> calcStudentCount(name)async{
  print("$name正在点名");
  await Future.delayed(Duration(seconds: 2));
  return "耗时2秒,$name报告：当前班级共88人";
}
