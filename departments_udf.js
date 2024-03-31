function transform(line){
    var values = line.split(',');

    var obj = new Object();
    obj.id = values[0];
    obj.department = values[1];

    var jsonString = JSON.stringify(obj);

    return jsonString;
}