import 'package:flutter/material.dart';
import './gantt_chart/gantt_chart.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GanttChart(
          startDate: DateTime.utc(2019, 01, 03),
          endDate: DateTime.utc(2020, 01, 25),
          projectName: 'Diplome',
          tasks: <Task>[
            Task(
                startTask: DateTime.utc(2019, 02, 10),
                endTask: DateTime.utc(2019, 04, 10),
                taskTitle: 'Бла бла бла',
                title: 'task1'),
            Task(
                startTask: DateTime.utc(2019, 03, 10),
                endTask: DateTime.utc(2019, 05, 10),
                taskTitle: 'Бла бла бла',
                title: 'task2'),
            Task(
                startTask: DateTime.utc(2019, 03, 15),
                endTask: DateTime.utc(2019, 05, 10),
                taskTitle: 'Бла бла бла',
                title: 'task3'),
            Task(
                startTask: DateTime.utc(2019, 06, 10),
                endTask: DateTime.utc(2019, 06, 10),
                taskTitle: 'Выбор темы',
                title: 'task4'),
            Task(
                startTask: DateTime.utc(2019, 06, 12),
                endTask: DateTime.utc(2019, 06, 16),
                taskTitle:
                    'Подбор и предварительное ознакомление с литературой по избранной теме',
                title: 'task5'),
            Task(
                startTask: DateTime.utc(2019, 06, 15),
                endTask: DateTime.utc(2019, 06, 20),
                taskTitle:
                    'Издание приказа об утверждении темы и научного руководителя',
                title: 'task6'),
            Task(
                startTask: DateTime.utc(2019, 06, 18),
                endTask: DateTime.utc(2019, 06, 25),
                taskTitle:
                    'Составление плана работы, согласование с научным руководителем',
                title: 'task7'),
            Task(
                startTask: DateTime.utc(2019, 06, 25),
                endTask: DateTime.utc(2019, 06, 28),
                taskTitle:
                    'Согласование календарного графика выполнения работы',
                title: 'task8'),
            Task(
                startTask: DateTime.utc(2019, 08, 10),
                endTask: DateTime.utc(2019, 08, 20),
                taskTitle:
                    'Подбор материала, его анализ и обобщение, написание первоначального варианта работы',
                title: 'task9'),
            Task(
                startTask: DateTime.utc(2019, 09, 15),
                endTask: DateTime.utc(2019, 09, 20),
                taskTitle:
                    'Первичное рецензирование работы научным руководителем',
                title: 'task10'),
            Task(
                startTask: DateTime.utc(2019, 10, 12),
                endTask: DateTime.utc(2019, 10, 28),
                taskTitle:
                    'Доработка работы в соответствии с замечаниями научного руководителя',
                title: 'task11'),
            Task(
                startTask: DateTime.utc(2019, 11, 15),
                endTask: DateTime.utc(2019, 11, 16),
                taskTitle: 'Сдача работы на проверку системой Антиплагиат',
                title: 'task12'),
            Task(
                startTask: DateTime.utc(2019, 11, 17),
                endTask: DateTime.utc(2019, 11, 18),
                taskTitle:
                    'Получение отзыва научного руководителя и заключения предприятия, где выполнялась работа',
                title: 'task13'),
            Task(
                startTask: DateTime.utc(2019, 12, 10),
                endTask: DateTime.utc(2019, 12, 13),
                taskTitle:
                    'Допуск работы к защите в ГЭК заведующего выпускающей кафедрой',
                title: 'task14'),
            Task(
                startTask: DateTime.utc(2019, 12, 15),
                endTask: DateTime.utc(2019, 12, 20),
                taskTitle:
                    'Получение внешней рецензии и передача работы на выпускающую кафедру (по необходимости)',
                title: 'task16'),
            Task(
                startTask: DateTime.utc(2020, 01, 10),
                endTask: DateTime.utc(2020, 01, 10),
                taskTitle: 'Защита дипломной работы в ГЭК',
                title: 'task17'),
            Task(
                startTask: DateTime.utc(2020, 01, 10),
                endTask: DateTime.utc(2020, 01, 10),
                taskTitle: 'Защита дипломной работы в ГЭК',
                title: 'task18'),
            Task(
                startTask: DateTime.utc(2020, 01, 10),
                endTask: DateTime.utc(2020, 01, 10),
                taskTitle: 'Защита дипломной работы в ГЭК',
                title: 'task19'),
            Task(
                startTask: DateTime.utc(2020, 01, 10),
                endTask: DateTime.utc(2020, 01, 10),
                taskTitle: 'Защита дипломной работы в ГЭК',
                title: 'task20'),
            Task(
                startTask: DateTime.utc(2020, 01, 10),
                endTask: DateTime.utc(2020, 01, 10),
                taskTitle: 'Защита дипломной работы в ГЭК',
                title: 'task21'),
          ],
        ),
      ),
    );
  }
}
