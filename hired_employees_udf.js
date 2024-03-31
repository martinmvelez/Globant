function transform(line){
    var values = line.split(',');

    var obj = new Object();
    obj.id = values[0];
    obj.name = values[1];
    obj.datetime = values[2];
    obj.department_id = values[3];
    obj.job_id = values[4];

    var jsonString = JSON.stringify(obj);

    return jsonString;
}