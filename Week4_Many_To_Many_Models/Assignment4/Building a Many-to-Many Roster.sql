DROP TABLE student;
CREATE TABLE student (
    id SERIAL,
    name VARCHAR(128) UNIQUE,
    PRIMARY KEY(id)
);

DROP TABLE course CASCADE;
CREATE TABLE course (
    id SERIAL,
    title VARCHAR(128) UNIQUE,
    PRIMARY KEY(id)
);

DROP TABLE roster CASCADE;
CREATE TABLE roster (
    id SERIAL,
    student_id INTEGER REFERENCES student(id) ON DELETE CASCADE,
    course_id INTEGER REFERENCES course(id) ON DELETE CASCADE,
    role INTEGER,
    UNIQUE(student_id, course_id),
    PRIMARY KEY (id)
);

INSERT INTO student(name) VALUES('Ronin');
INSERT INTO student(name) VALUES('Ayyub');
INSERT INTO student(name) VALUES('Jomana');
INSERT INTO student(name) VALUES('Kaley');
INSERT INTO student(name) VALUES('Lilya');
INSERT INTO student(name) VALUES('Deano');
INSERT INTO student(name) VALUES('Ayrton');
INSERT INTO student(name) VALUES('Gemmalea');
INSERT INTO student(name) VALUES('Kaydie');
INSERT INTO student(name) VALUES('Steff');
INSERT INTO student(name) VALUES('Nnenda');
INSERT INTO student(name) VALUES('Julian');
INSERT INTO student(name) VALUES('Kamela');
INSERT INTO student(name) VALUES('Neo');
INSERT INTO student(name) VALUES('Riham');

select * from student;

/*INSERT INTO course(title) VALUES('si106');
INSERT INTO course(title) VALUES('si106');
INSERT INTO course(title) VALUES('si106');
INSERT INTO course(title) VALUES('si106');*/
INSERT INTO course(title) VALUES('si106');
INSERT INTO course(title) VALUES('si110');
/*INSERT INTO course(title) VALUES('si110');
INSERT INTO course(title) VALUES('si110');
INSERT INTO course(title) VALUES('si110');
INSERT INTO course(title) VALUES('si110');*/
INSERT INTO course(title) VALUES('si206');
/*INSERT INTO course(title) VALUES('si206');
INSERT INTO course(title) VALUES('si206');
INSERT INTO course(title) VALUES('si206');
INSERT INTO course(title) VALUES('si206');*/

select * from course;

INSERT INTO roster(student_id, course_id, role) VALUES((select id from student where id='1'), (select id from course where id='1'), 1);
INSERT INTO roster(student_id, course_id, role) VALUES((select id from student where id='2'), (select id from course where id='1'), 0);
INSERT INTO roster(student_id, course_id, role) VALUES((select id from student where id='3'), (select id from course where id='1'), 0);
INSERT INTO roster(student_id, course_id, role) VALUES((select id from student where id='4'), (select id from course where id='1'), 0);
INSERT INTO roster(student_id, course_id, role) VALUES((select id from student where id='5'), (select id from course where id='1'), 0);

select * from roster;

INSERT INTO roster(student_id, course_id, role) VALUES((select id from student where id='6'), (select id from course where id='2'), 1);
INSERT INTO roster(student_id, course_id, role) VALUES((select id from student where id='7'), (select id from course where id='2'), 0);
INSERT INTO roster(student_id, course_id, role) VALUES((select id from student where id='8'), (select id from course where id='2'), 0);
INSERT INTO roster(student_id, course_id, role) VALUES((select id from student where id='9'), (select id from course where id='2'), 0);
INSERT INTO roster(student_id, course_id, role) VALUES((select id from student where id='10'), (select id from course where id='2'), 0);

INSERT INTO roster(student_id, course_id, role) VALUES((select id from student where id='11'), (select id from course where id='3'), 1);
INSERT INTO roster(student_id, course_id, role) VALUES((select id from student where id='12'), (select id from course where id='3'), 0);
INSERT INTO roster(student_id, course_id, role) VALUES((select id from student where id='13'), (select id from course where id='3'), 0);
INSERT INTO roster(student_id, course_id, role) VALUES((select id from student where id='14'), (select id from course where id='3'), 0);
INSERT INTO roster(student_id, course_id, role) VALUES((select id from student where id='15'), (select id from course where id='3'), 0);

SELECT student.name, course.title, roster.role
    FROM student 
    JOIN roster ON student.id = roster.student_id
    JOIN course ON roster.course_id = course.id
    ORDER BY course.title, roster.role DESC, student.name;