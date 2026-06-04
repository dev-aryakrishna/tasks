class TaskModel {
  final int id;
  final String title;
  final String description;
  final bool isCompleted;
  TaskModel({
    required this.id , 
    required this .title ,
    required this.description,
    required this.isCompleted,
  });

  factory TaskModel.fromJson(Map<String , dynamic>json){
    return TaskModel(
      id: json["id"], 
      title: json["title"], 
      description: json["description"] ,
    isCompleted: json["is_completed"],
    );
  }

}