import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class GanttChart extends StatefulWidget {
  final List<Task> tasks;
  final String projectName;
  final DateTime startDate;
  final DateTime endDate;

  const GanttChart(
      {Key key,
      this.tasks,
      this.projectName,
      @required this.startDate,
      @required this.endDate})
      : super(key: key);
  @override
  _GanttChartState createState() => _GanttChartState();
}

class _GanttChartState extends State<GanttChart> {
  List<int> list = [];

  ScrollController _horizontalContoller1;
  ScrollController _horizontalContoller2;
  ScrollController _verticalContoller1;
  ScrollController _verticalContoller2;
  int _numberOfDays;
  DateFormat _dateFormat = DateFormat('yyyy.MM.dd');
  double height = 50;
  double width = 100;
  Grid grid = Grid.none;

  @override
  void initState() {
    _horizontalContoller1 = ScrollController();
    _horizontalContoller2 = ScrollController();
    _verticalContoller1 = ScrollController();
    _verticalContoller2 = ScrollController();

    _numberOfDays = widget.endDate.difference(widget.startDate).inDays;
    list = List.generate(_numberOfDays, (index) {
      return index;
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned.fill(
                  child: Column(
            children: <Widget>[
            Container(
              height: height,
              child: Row(
                children: <Widget>[
                  GestureDetector(
                    onTap : (){
                      
                    },
                                      child: Container(
                      height: height,
                      width: width,
                      color: Colors.blue,
                      child: DropdownButton<Grid>(
                        value: grid,
                        items: [
                          DropdownMenuItem(child: Text('none') , value: Grid.none,),
                          DropdownMenuItem(child: Text('both') , value: Grid.both,),
                          DropdownMenuItem(child: Text('horizontal') , value: Grid.horizontal,),
                          DropdownMenuItem(child: Text('vertical') , value: Grid.vertical,),
                      ], onChanged: (value) {
                        setState(() {
                          grid = value;
                        });
                      }),
                    ),
                  ),
                  Expanded(
                      child: SingleChildScrollView(
                    physics: NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    controller: _horizontalContoller2,
                    child: Row(
                      children: <Widget>[
                        ...list
                            .asMap()
                            .map((index, value) => MapEntry(
                                index,
                                Container(
                                  height: height,
                                  width: width,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.black54, width: 1)),
                                  child: Text(
                                      '${_dateFormat.format(widget.startDate.add(Duration(days: index)))}'),
                                )))
                            .values
                            .toList(),
                      ],
                    ),
                  ))
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: width,
                    child: SingleChildScrollView(
                      physics: NeverScrollableScrollPhysics(),
                      controller: _verticalContoller2,
                      child: Column(children: <Widget>[
                        ...widget.tasks
                            .asMap()
                            .map((index, value) => MapEntry(
                                index,
                                Row(
                                  children: <Widget>[
                                    Container(
                                      height: height,
                                      width: width,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.black54, width: 1)),
                                      child: Container(
                                          alignment: Alignment.center,
                                          child: Text('${value.title}')),
                                    )
                                  ],
                                )))
                            .values
                            .toList(),
                      ]),
                    ),
                  ),
                  Expanded(
                    child: NotificationListener<ScrollNotification>(
                      onNotification: (scrollNotification) {
                        if (scrollNotification is ScrollUpdateNotification) {
                          _horizontalContoller2.jumpTo(_horizontalContoller1.offset);
                          _verticalContoller2.jumpTo(_verticalContoller1.offset);
                        }
                        return false;
                      },
                      child: SingleChildScrollView(
                        controller: _horizontalContoller1,
                        scrollDirection: Axis.horizontal,
                        child: SingleChildScrollView(
                          controller: _verticalContoller1,
                          scrollDirection: Axis.vertical,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              ...widget.tasks
                                  .asMap()
                                  .map((index, value) => MapEntry(
                                      index,
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          ...List.generate(
                                              value.startTask.difference(widget.startDate).inDays + 1,
                                              (index) => Container(
                                                    height: height,
                                                    width: width,
                                                    decoration: BoxDecoration(
                                                      border: _border()
                                                    ),
                                                  )),
                                          Container(
                                            height: height,
                                            width: width *
                                                (value.endTask.difference(value.startTask).inDays + 1)
                                                    .toDouble(),
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                                color: Colors.redAccent,
                                                border: Border.all(
                                                    color: Colors.black54, width: 1)),
                                            child: Text('${value.taskTitle}'),
                                          )
                                        ],
                                      )))
                                  .values
                                  .toList(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ]),
        ),
        Positioned(
          bottom: 30,
          right: 30,
          child: Row(children: <Widget>[
          FloatingActionButton(onPressed: (){
            setState(() {
              height += 10 ;
              width += 20;
            });
          } , child: Icon(Icons.add),),
          SizedBox(width: 30,),
          FloatingActionButton(onPressed: (){
            setState(() {
              height -= 10 ;
              width -= 20;
            });
          } , child: Icon(Icons.settings_backup_restore),),
        ],))
      ],
    );
  }

  Border _border(){
    switch(grid){
      case Grid.none:
        return null;
        break;
      case Grid.both:
        return Border.all(color: Colors.grey);
        break;
      case Grid.horizontal:
        Border(bottom: BorderSide(color: Colors.grey , width: 1) , top: BorderSide(color: Colors.grey, width: 1));
        break;
      case Grid.vertical:
        Border(left: BorderSide(color: Colors.grey, width: 1) , right: BorderSide(color: Colors.grey, width: 1));
        break;
    }
  }
}

class Task {
  final DateTime startTask;
  final DateTime endTask;
  final String title;
  final String taskTitle;

  Task(
      {@required this.startTask,
      @required this.endTask,
      @required this.title,
      @required this.taskTitle});
}


enum Grid { horizontal , vertical , both , none}