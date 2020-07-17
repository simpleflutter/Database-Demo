SQFLite (SQLite)
-----------------
Datatype
1) Integer
2) Real
3) Text
4) BLOB (Binary Large Object)


Dependency
----------
sqflite: ^1.3.0


Import File
-----------
import 'package:sqflite/sqflite.dart';

SQL
----
create table students(
  rollno Integer primay key autoincrement,
	name Text,
	percentage Real
)



1) execute() (DDL)
-------------------
Future<void> execute(String sql, [List arguments])

E.g
await db.execute('create table students(
  rollno Integer primary key,
	name Text,
	percentage Real)');


2) insert()
-----------
Future<int> insert(String table, Map<String, dynamic> values)

E.g.
await db.insert('students', s.toMap());


3) rawInsert()
---------------
Future<int> rawInsert(String sql, [List arguments])

E.g. 1)
await db.rawInsert('insert into students values(101, "Ram", 56.12)');

E.g. 2)
await db.rawInsert('insert into students values(?, ?, ?)',
  [102, 'Sita', 84,61]);

E.g. 3)
await db.rawInsert('insert into students(rollno, name) values(?, ?)',
  [205, 'Pavan']);


4) delete()
------------
Future<int> delete(String table, {String where, List whereArgs})

E.g. 1)
await db.delete('students');

E.g. 2)
await db.delete('students', where:'rollno=?', whereArgs:[205]);

E.g. 3)
await db.delete('students', where:'rollno=? and percentage=?',
    whereArgs:[406, 78.53]);


5) rawDelete()
---------------
Future<int> rawDelete(String sql, [List arguments])

e.g. 1)
await db.rawDelete('delete from students');

e.g. 2)
await db.rawDelete('delete from students where rollno=?', [101]);

e.g. 3)
await db.rawDelete('delete from students where rollno=? or name=?',
   [206, 'Asit']);


6) update()
-------------
Future<int> update(String table, Map<String, dynamic> values, 
   {String where, List whereArgs})

E.g. 1)
await db.update('students', s.toMap(), where:'rollno=?',
		whereArgs:[101]);

7) rawUpdate()
--------------
Future<int> rawUpdate(String sql, [List arguments]) 

e.g. 1)
await db.rawUpdate('update students set name=? where rollno=?',
 ['Kartik', 101])

e.g. 2)
await db.rawUpdate('update students set name=?, percentage=?
 where rollno=?', ['Kanira', 86,10, 205]')


8) query()
-------------
Future<List<Map<String, dynamic>>> query(String table, 
{bool distinct, List<String> columns, 
String where, List whereArgs, String groupBy, 
String having, String orderBy, int limit, int offset}) 

e.g. 1)
List<Map<String, dynamic>> maps = await db.query('students');
//select * from students

e.g. 2)
List<Map<String, dynamic>> maps = await db.query('students',
   where:'rollno=?', whereArgs:[101]);
//select * from students where rollno=101

e.g. 3)
List<Map<String, dynamic>> maps = await db.query('students',
  columns:['name', 'percentage'], where:'rollno=?', whereArgs:[101]);
//select name, percentage from students where rollno=101


9) rawQuery()
--------------
Future<List<Map<String, dynamic>>> rawQuery(String sql, 
   [List arguments]) 

e.g.1)
List<Map<String, dynamic>> maps = await db.rawQuery(
'select * from students');

e.g.2)
List<Map<String, dynamic>> maps = await db.rawQuery(
'select * from students where rollno=?', [101]);

e.g.3)
List<Map<String, dynamic>> maps = await db.rawQuery(
'select name, percentage from students where rollno=?', [101]);



















































































