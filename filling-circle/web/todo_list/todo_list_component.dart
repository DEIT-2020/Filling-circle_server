library global;
import 'dart:async';
import 'dart:html';
import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';

import 'todo_list_service.dart';

@Component(
  selector: 'todo-list',
  styleUrls: ['todo_list_component.css'],
  templateUrl: 'todo_list_component.html',
  directives: [
    MaterialCheckboxComponent,
    MaterialFabComponent,
    MaterialIconComponent,
    materialInputDirectives,
    NgFor,
    NgIf,  
  ],
  providers: [ClassProvider(TodoListService)],
)
class TodoListComponent implements OnInit {
  final TodoListService todoListService;

  List<String> items = [];
  String newTodo = '';
  String incontent='';
  String outcontent='';
  String re='○○○○○○○○○○○○';
  Element outputcontent = querySelector(#outputcontent); 
  

  TodoListComponent(this.todoListService);

  @override
  Future<Null> ngOnInit() async {
    items = await todoListService.getTodoList();
  }

  void add() {
    items.add(newTodo);
    newTodo = '';
  }

 void transfer(){
     var outcontent=document.getElementById('outputcontent');
      outcontent.style.opacity=100.toString();
      outcontent=(incontent.substring(1，0) + re.substring(1，0)+incontent.substring(3，4)+re.substring(0,2)) 
  }
}
  Future<void> collect() async {
    var outputcontent =document.querySelector('#outputcontent');
    var username =document.querySelector('#name');
    var collectdata={
      'username':name;
      'outputcontent':outputcontent;
    var path='http://localhost:8888/collect/$username';
    final response=await http.post(path,
          body: convert.json.encode(reportdata),headers: {'content-type': 'application/json'}).then((response){
            if(response.statusCode==200){window.alert('收藏成功');}
            else{window.alert('收藏失败');}
 }
}