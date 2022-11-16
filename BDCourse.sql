CREATE TABLE "users" (
  "id" uuid PRIMARY KEY,
  "name" varchar,
  "email" varchar,
  "password" varchar,
  "age" int,
  "role_id" int
);

CREATE TABLE "courses" (
  "id" uuid PRIMARY KEY,
  "title" varchar,
  "description" text,
  "level_id" int,
  "teacher" varchar,
  "categories_id" int
);

CREATE TABLE "course_videos" (
  "id" uuid PRIMARY KEY,
  "title" varchar,
  "url" varchar,
  "course_id" uuid
);

CREATE TABLE "categories" (
  "id" serial PRIMARY KEY,
  "name" varchar
);

CREATE TABLE "roles" (
  "id" serial PRIMARY KEY,
  "name" varchar
);

CREATE TABLE "level" (
  "id" serial PRIMARY KEY,
  "name" varchar
);

CREATE TABLE "users_course" (
  "id" uuid PRIMARY KEY,
  "users_id" uuid,
  "courses_id" uuid,
  "review" varchar,
  "percent_complete" float
);

ALTER TABLE "course_videos" ADD FOREIGN KEY ("course_id") REFERENCES "courses" ("id");

ALTER TABLE "users" ADD FOREIGN KEY ("role_id") REFERENCES "roles" ("id");

ALTER TABLE "courses" ADD FOREIGN KEY ("level_id") REFERENCES "level" ("id");

ALTER TABLE "courses" ADD FOREIGN KEY ("categories_id") REFERENCES "categories" ("id");

ALTER TABLE "users_course" ADD FOREIGN KEY ("users_id") REFERENCES "users" ("id");

ALTER TABLE "users_course" ADD FOREIGN KEY ("courses_id") REFERENCES "courses" ("id");

INSERT INTO ROLES ("name")
VALUES ('student'),
       ('teacher'),
       ('admin');

INSERT INTO categories ("name")
VALUES ('Marketing'),
       ('Hablidades Blandas');

INSERT INTO users (id, "name", email, "password", age, role_id)
VALUES ('2e678ee8-d09e-4c75-a4e1-9ae550d2766d', 'Luis', 'eduvalladolid1997@gmail.com', 'root', 25, 3),
       ('f67c5b0a-b2a1-47e1-9133-e9aaa91e43a6', 'Mauro', 'mau77@gmail.com', 'root', 32, 2);

INSERT INTO "level" ("name")
VALUES ('principiantes'),
       ('medios'),
       ('avanzados');

INSERT INTO courses (id, title, description, level_id, teacher, categories_id)
VALUES ('d8f031f0-d878-46a5-ae75-1f441d0a973a', 'Curso de Community Manager', 'Aprende a gestionar redes sociales de forma profesional. Crea contenidos para redes sociales, comprende cómo ejecutar una estrategia digital, calendarizar y automatizar publicaciones en Twitter, Facebook, Instagram y LinkedIn, interpreta métricas y aprende a generar reportes para tus clientes. Contribuye a ejecutar los objetivos de tu compañía o de tu propio negocio mejorando tu presencia en redes sociales.', 1, 'Jean Reyes', 1),
       ('521eafcb-988a-4bf7-8b76-911e190d597b', 'Curso de Inteligencia Emocional', 'Aprende a gestionar tus emociones y las de otras personas de tu entorno a través de la reflexión, la observación y el análisis de las situaciones. Optimiza y fortalece tus comunicaciones y tus relaciones profesionales. En este curso aprenderás a tomar decisiones que te ayudarán a lograr tus objetivos personales y profesionales.', 1, 'Jordy Heredia', 2);

INSERT INTO course_videos (id, title, url, course_id)
VALUES ('dc667da5-9b55-454f-b4f6-32cd22bb1a42', 'Inteligencia Emocional 1', 'https://platzi.com/clases/1614-inteligencia-emocional', '521eafcb-988a-4bf7-8b76-911e190d597b'),
       ('a22fbb9a-e8d2-4b8b-8ed8-026688aa3630', 'Community Manager 1', 'https://platzi.com/clases/1302-community-manager/34450-que-hacen-los-community-managers', 'd8f031f0-d878-46a5-ae75-1f441d0a973a');

SELECT c.id, c.title, c.description, l."name",  c.teacher, ca."name", cv.title
FROM courses as c 
INNER JOIN course_videos cv  
ON c.id  = cv.course_id
INNER JOIN "level" l 
ON c.level_id  = l.id 
INNER JOIN categories ca  
ON c.categories_id  = ca.id;