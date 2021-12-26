class NewEntryModel {
  String? id;
  String? from;
  String? to;
  String? project;
  String? additionalInfo;

  NewEntryModel({
    this.id,
    this.from,
    this.to,
    this.project,
    this.additionalInfo,
  });

  NewEntryModel.fromMap(Map snapshot, String id)
      : id = id,
        from = snapshot["from"] ?? "",
        to = snapshot["to"] ?? "",
        project = snapshot["project"] ?? "",
        additionalInfo = snapshot["additionalInfo"] ?? "";

  toJson() {
    return {
      "from":from,
      "to":to,
      "project":project,
      "additionalInfo":additionalInfo,
    };
  }
}
