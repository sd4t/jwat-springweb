-- create database jwat_v2 charset utf8 collate utf8_general_ci;
-- use jwat_v2

create table users( -- dùng lưu thông thin user
id int primary key auto_increment,
email varchar(100) unique,
username nvarchar(100),
password varchar(100) ,
phone_number varchar(100),
address text,
dob date,
university text,
is_admin bit, -- role_id=1 admin, role_id=user=0
status int,-- =1 đang hoạt động, -1 đã xóa , chờ duyệt 0
updated_at date, -- ngày chỉnh sửa
created_at date,-- ngày tạo
deactived_at date -- ngày bị xóa
);

create table notifications( -- dùng lưu thông báo
id int primary key auto_increment,
title text,
content text,
listener_list text,-- mã lớp nhận thông báo, nối chuỗi cách nhau bởi _
status bit,-- dùng để lưu trạng thái đã xóa (false)
due_date date,-- ngày hết hạn thông báo, k có hạn thì null
is_regis bit,-- lưu loại thông báo
year int,-- lưu năm 
week int, -- lưu tuần
updated_at datetime, 
created_at datetime
);


create table user_seen_notification (-- lưu người xem
notification_id int,
constraint fk_user_seen_notification_notifications foreign key (notification_id ) references notifications(id),
user_id int,
constraint fk_user_seen_notification_users foreign key (user_id ) references users(id),
seen_status bit, -- lưu người đó đã xem thông báo hay chưa
seen_at datetime,-- thời gian xem thông báo
primary key (notification_id, user_id)
);

create table student_register_schedule(-- lưu đăng ký lịch học
id int primary key auto_increment,
user_id int,
constraint fk_student_register_schedule_users foreign key (user_id ) references users(id),
year int,-- lưu năm 
week int, -- lưu tuần
weekday int, -- lưu thứ từ 2 đến 8
period bit -- true sáng, false chiều
);

create table courses(-- lưu khóa học jwat 02, 03
id int primary key auto_increment,
name text,-- tên khóa học
start_time date, -- thời gian bắt đầu
end_time date , -- thời gian kết thúc
description text, -- mô tả lưu có giai đoạn nào: Sql, java, git
note text
);

create table classes( -- lưu lớp sql, java, spring
id int primary key auto_increment,
courses_id int,
constraint fk_classes_courses foreign key (courses_id ) references courses(id),
name nvarchar(100),
description text,
note text
);

create table user_in_class( -- lưu thông tin user thuộc lớp nào
class_id int,
constraint fk_user_in_class_classes foreign key (class_id ) references classes(id),
user_id int,
constraint fk_user_in_class_users foreign key (user_id ) references users(id),
primary key (class_id, user_id)
);

create table chapter ( -- (Bài học, chương. Bài 1 2 3 trong class SQL)"
id int primary key auto_increment,
class_id int,
constraint fk_chapter_classes foreign key (class_id ) references classes(id),
name text
);

create table rooms(-- lưu phòng học
id int primary key auto_increment,
name text,
maximum_seat int,
description text,
note text
);




create table process(-- lưu tiến độ học , lưu theo bài
user_id int,
chapter_id int,
constraint fk_process_users foreign key (user_id ) references users(id),
constraint fk_process_chapter foreign key (chapter_id ) references chapter(id),
primary key (user_id, chapter_id)
);

-- lịch admin soạn: (mã lớp, mã phòng, tên trainer, buổi, ngày, tên bài học, số lượng tham gia, )
create table main_schedules(
id int primary key auto_increment,
room_id int,
constraint fk_main_schedules_rooms foreign key (room_id ) references rooms(id),
chapter_id int,
constraint fk_main_schedules_chapter foreign key (chapter_id ) references chapter(id),
trainer_name nvarchar(100), -- tên người trainer
year int,-- năm 
week int,-- tuần
weekday int, 
period bit, -- true sáng, false chiều
start_time date, -- thời gian bắt đầu
end_time date,  -- thời gian kết thúc
note text
);




create table roll_calls(-- bảng điểm danh
main_schedule_id int,
constraint fk_roll_calls_main_schedules foreign key (main_schedule_id ) references main_schedules(id),
user_id int,
constraint fk_roll_calls_users foreign key (user_id ) references users(id),
roll_call_at date,
primary key (main_schedule_id, user_id)
);

create table reset_password(
id int primary key auto_increment,
email varchar(100) unique,
token text,
created_at date,
updated_at date
);



-- thêm giao diện chuyển lớp
-- rooms add cứng dưới database
-- giao diện thêm thời khóa biểu bổ sung trường lớp, cbo chọn bài học(số lượng),