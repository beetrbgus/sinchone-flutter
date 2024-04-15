import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo/models/todo.dart';
import 'package:todo/todo_list/todo_list.dart';
import 'package:todo/weekday.dart';

final dateformatter = DateFormat("yyyy-MM-dd");

class TodoMain extends StatefulWidget {
  const TodoMain({super.key});

  @override
  State<StatefulWidget> createState() => _TodoState();
}

class _TodoState extends State<TodoMain> with SingleTickerProviderStateMixin {
  final List<Todo> _todos = [
    Todo(
      content: "zzzz",
      deadline: DateTime.now(),
      category: Category.important,
      isCompleted: false,
    ),
    Todo(
      content: "zzzz",
      deadline: DateTime.now(),
      category: Category.important,
      isCompleted: false,
    ),
    Todo(
      content: "zzzz",
      deadline: DateTime.now(),
      category: Category.important,
      isCompleted: false,
    ),
    Todo(
      content: "zzzz",
      deadline: DateTime.now(),
      category: Category.important,
      isCompleted: false,
    ),
  ];
  final List<Todo> _completeJob = [];
  String _nowDay() {
    var now = DateTime.now();
    WeekDay weekDay = WeekDay.fromCode(now.weekday);

    return "${now.month}월 ${now.day}일 ${weekDay.displayName}";
  }

  DateTime? _selectDueDate;
  late TabController _tabController;
  Category? _selectedCategory;
  final _taskController = TextEditingController();

  @override
  void initState() {
    _tabController = TabController(
      length: 2,
      vsync: this,
    );
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _addTodo(Todo todo) {
    setState(() {
      _todos.add(todo);
    });
  }

  void _completeTodo(Todo todo) {
    setState(() {
      _todos.remove(todo);
      _completeJob.add(todo); // 완료된 작업 리스트에 추가
    });
  }

  void _willComplete(Todo todo) {
    setState(() {
      _completeJob.remove(todo); // 완료된 작업 리스트에서 제거
      _todos.add(todo); // 할 일 리스트에 추가
    });
  }

  // 저장 버튼 클릭시 일어나는 함수
  void _submitTodoData() {
    final inputTask = _taskController.text;
    // 항목 선택하지 않았을 때 유효성 검사
    if (inputTask.trim().isEmpty || _selectedCategory == null) {
      // 에러 메시지
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("유효하지 않은 입력값이 있습니다."),
          content: const Text('입력값을 다시 한번 확인한 후 제출해주세요.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("확인!"),
            )
          ],
        ),
      );
    }

    _addTodo(
      Todo(
        content: inputTask,
        deadline: _selectDueDate!,
        category: _selectedCategory!,
        isCompleted: false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Todo"),
          centerTitle: true,
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '오늘 할 일',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              Text(
                _nowDay(),
                style: const TextStyle(fontSize: 21),
              ),
              const SizedBox(
                height: 50,
              ),
              TabBar(
                controller: _tabController,
                labelColor: Colors.black45,
                labelStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 21,
                ),
                unselectedLabelColor: Colors.grey,
                unselectedLabelStyle: const TextStyle(
                  fontSize: 19,
                ),
                indicatorWeight: 2,
                indicatorColor: const Color.fromARGB(255, 10, 197, 184),
                tabs: const [
                  Tab(
                    text: '할일',
                    height: 30,
                  ),
                  Tab(
                    text: '완료',
                    height: 30,
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    TodoList(
                      todos: _todos,
                      onComplete: _completeTodo,
                    ),
                    TodoList(
                      todos: _completeJob,
                      onComplete: _willComplete,
                    ),
                  ],
                ),
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            onPressed: () {
                              showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2024),
                                lastDate: DateTime(2025),
                              ).then((selectDate) {
                                setState(() {
                                  _selectDueDate = selectDate!;
                                });
                              });
                            },
                            icon: const Icon(
                              Icons.date_range_outlined,
                            ),
                          ),
                          Text(
                            _selectDueDate == null
                                ? ""
                                : _selectDueDate!
                                    .toIso8601String()
                                    .split("T")[0],
                          ),
                          DropdownButton(
                            value:
                                _selectedCategory, // 선택된 값이 보여짐. items 안에서 선택하는 것
                            items: Category.values
                                .map(
                                  (category) => DropdownMenuItem(
                                    value: category,
                                    child: Row(
                                      children: [
                                        Icon(categoryIconse[category]),
                                        Text(category.name),
                                      ],
                                    ),
                                  ),
                                )
                                .toList(),
                            onChanged: (value) {
                              setState(() {
                                _selectedCategory = value;
                              });
                            },
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: TextField(
                              controller: _taskController,
                            ),
                          ),
                          IconButton(
                            onPressed: _submitTodoData,
                            icon: const Icon(Icons.save),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
