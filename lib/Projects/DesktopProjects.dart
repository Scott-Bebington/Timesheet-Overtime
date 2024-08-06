// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, file_names

import 'package:flutter/material.dart';
import 'package:timesheet_overtime/GlobalVariables.dart';
import 'dart:math' as math;

import 'package:timesheet_overtime/Projects/Projects.dart';

class DesktopProjects extends StatefulWidget {
  const DesktopProjects({super.key});

  @override
  State<DesktopProjects> createState() => _DesktopProjectsState();
}

class _DesktopProjectsState extends State<DesktopProjects> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 115,
      height: double.infinity,
      margin: EdgeInsets.only(top: desktopVariables.padding, left: 95, right: desktopVariables.padding, bottom: desktopVariables.padding),
      padding: EdgeInsets.all(desktopVariables.padding),
      decoration: BoxDecoration(
        border: Border.all(
          color: primaryColor,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Ongoing Projects',
              style: TextStyle(
                fontSize: desktopVariables.headingTextSize,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
            Scrollbar(
              thumbVisibility: true,
              interactive: true,
              controller: _scrollController,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                controller: _scrollController,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    projectsToDo(),
                    SizedBox(width: desktopVariables.padding),
                    porjectsInProgress(),
                    SizedBox(width: desktopVariables.padding),
                    projectsDone(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget projectsToDo() {
    return DragTarget<Map<String, dynamic>>(
      onAcceptWithDetails: (inData) {
        if (Projects.projectsToDoData.any((element) => element['id'] == inData.data['id'])) {
          return;
        }

        setState(() {
          Projects.projectsToDoData.add({
            'task': inData.data['task'],
            'id': inData.data['id'],
          });

          Projects.projectsInProgressData.removeWhere((element) => element['id'] == inData.data['id']);
          Projects.projectsDoneData.removeWhere((element) => element['id'] == inData.data['id']);
        });
      },
      builder: (context, candidateData, rejectedData) {
        return Container(
          width: 400,
          height: math.max(MediaQuery.of(context).size.height - 115, 500),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              color: primaryColor,
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: desktopVariables.padding),
                Text("Not yet started", style: TextStyle(color: textColor)),
                SizedBox(height: desktopVariables.padding),
                for (Map<String, dynamic> projecctsToDo in Projects.projectsToDoData) ...[
                  Draggable<Map<String, dynamic>>(
                    data: {
                      'task': projecctsToDo['task'],
                      'id': projecctsToDo['id'],
                    },
                    feedback: Container(
                      width: 380,
                      height: 100,
                      decoration: BoxDecoration(
                        color: cardColor,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: Text(
                          projecctsToDo['task'],
                          style: TextStyle(
                            color: textColor,
                            fontSize: desktopVariables.cardBodyTextSize,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ),
                    ),
                    childWhenDragging: Container(),
                    child: Container(
                      width: 380,
                      height: 100,
                      decoration: BoxDecoration(
                        color: cardColor,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: Text(
                          projecctsToDo['task'],
                          style: TextStyle(
                            color: textColor,
                            fontSize: desktopVariables.cardBodyTextSize,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: desktopVariables.padding),
                ],
              ],
            ),
          ),
        );
      },
    );
  }

  Widget porjectsInProgress() {
    return DragTarget<Map<String, dynamic>>(
      onAcceptWithDetails: (inData) {
        if (Projects.projectsInProgressData.any((element) => element['id'] == inData.data['id'])) {
          return;
        }

        setState(() {
          Projects.projectsInProgressData.add({
            'task': inData.data['task'],
            'id': inData.data['id'],
          });

          Projects.projectsToDoData.removeWhere((element) => element['id'] == inData.data['id']);
          Projects.projectsDoneData.removeWhere((element) => element['id'] == inData.data['id']);
        });
      },
      builder: (context, candidateData, rejectedData) {
        return Container(
          width: 400,
          height: math.max(MediaQuery.of(context).size.height - 115, 500),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              color: primaryColor,
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: desktopVariables.padding),
                Text("In Progress", style: TextStyle(color: textColor)),
                SizedBox(height: desktopVariables.padding),
                for (Map<String, dynamic> projectsInProgress in Projects.projectsInProgressData) ...[
                  Draggable<Map<String, dynamic>>(
                    data: {
                      'task': projectsInProgress['task'],
                      'id': projectsInProgress['id'],
                    },
                    feedback: Container(
                      width: 380,
                      height: 100,
                      decoration: BoxDecoration(
                        color: cardColor,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: Text(
                          projectsInProgress['task'],
                          style: TextStyle(
                            color: textColor,
                            fontSize: desktopVariables.cardBodyTextSize,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ),
                    ),
                    childWhenDragging: Container(),
                    child: Container(
                      width: 380,
                      height: 100,
                      decoration: BoxDecoration(
                        color: cardColor,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: Text(
                          projectsInProgress['task'],
                          style: TextStyle(
                            color: textColor,
                            fontSize: desktopVariables.cardBodyTextSize,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: desktopVariables.padding),
                ],
              ],
            ),
          ),
        );
      },
    );
  }

  Widget projectsDone() {
    return DragTarget<Map<String, dynamic>>(
      onAcceptWithDetails: (inData) {
        if (Projects.projectsDoneData.any((element) => element['id'] == inData.data['id'])) {
          return;
        }

        setState(() {
          Projects.projectsDoneData.add({
            'task': inData.data['task'],
            'id': inData.data['id'],
          });

          Projects.projectsToDoData.removeWhere((element) => element['id'] == inData.data['id']);
          Projects.projectsInProgressData.removeWhere((element) => element['id'] == inData.data['id']);

        });
      },
      builder: (context, candidateData, rejectedData) {
        return Container(
          width: 400,
          height: math.max(MediaQuery.of(context).size.height - 115, 500),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              color: primaryColor,
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: desktopVariables.padding),
                Text("Done", style: TextStyle(color: textColor)),
                SizedBox(height: desktopVariables.padding),
                for (Map<String, dynamic> projectsDone in Projects.projectsDoneData) ...[
                  Draggable<Map<String, dynamic>>(
                    data: {
                      'task': projectsDone['task'],
                      'id': projectsDone['id'],
                    },
                    feedback: Container(
                      width: 380,
                      height: 100,
                      decoration: BoxDecoration(
                        color: cardColor,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: Text(
                          projectsDone['task'],
                          style: TextStyle(
                            color: textColor,
                            fontSize: desktopVariables.cardBodyTextSize,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ),
                    ),
                    childWhenDragging: Container(),
                    child: Container(
                      width: 380,
                      height: 100,
                      decoration: BoxDecoration(
                        color: cardColor,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: Text(
                          projectsDone['task'],
                          style: TextStyle(
                            color: textColor,
                            fontSize: desktopVariables.cardBodyTextSize,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: desktopVariables.padding),
                ],
              ],
            ),
          ),
        );
      },
    );
  }
}
