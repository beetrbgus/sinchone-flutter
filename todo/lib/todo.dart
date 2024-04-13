import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:todo/weekday.dart';

final dateformatter = DateFormat("yyyy-MM-dd");

class Todo extends StatefulWidget {
  const Todo({super.key});

  @override
  State<StatefulWidget> createState() => _TodoState();
}

class _TodoState extends State<Todo> with SingleTickerProviderStateMixin {
  String _nowDay() {
    var now = DateTime.now();
    WeekDay weekDay = WeekDay.fromCode(now.weekday);

    return "${now.month}월 ${now.day}일 ${weekDay.displayName}";
  }

  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(
      length: 3,
      vsync: this,
      initialIndex: 0,
    );
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
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
          mainAxisAlignment: MainAxisAlignment.start,
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
              controller: tabController,
              labelColor: Colors.black45,
              labelStyle: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 21,
              ),
              unselectedLabelColor: Colors.grey,
              unselectedLabelStyle: const TextStyle(
                fontSize: 19,
              ),
              indicatorWeight: 3,
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
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
