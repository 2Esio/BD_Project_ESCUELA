CREATE DATABASE ESCUELA;
use ESCUELA;

create table cat_sexo(id_sexo int primary key not null,
					   sexo varchar(1) not null);
					
create table cat_estatus(id_estatus int primary key not null,
						estatus varchar(10) not null);
                        
create table cat_grado(id_grado int primary key not null,
						grado varchar(15) not null);
                        
create table cat_materias(id_materia int primary key not null,
							materia varchar(15) not null);
                            
create table cat_estado(id_estado int primary key not null,
						estado varchar(20));
                        
create table cat_del_mun(id_del_mun int primary key not null,
						del_mun varchar(20));

create table cat_colonia(id_colonia int primary key not null,
						colonia varchar(20));
                        
create table alumnos(matricula_alumno int auto_increment primary key not null,
					apellido_paterno varchar(20) not null, 
                    apellido_materno varchar(20) not null,
                    nombre varchar(20) not null,
                    fecha_nacimiento date not null,
                    nombre_tutor varchar (60),
                    grado int not null,
                    foreign key(grado) references cat_grado(id_grado) on update cascade,
                    sexo int not null,
                    foreign key(sexo) references cat_sexo(id_sexo) on update cascade,
                    estado int not null,
                    foreign key(estado) references cat_estado(id_estado) on update cascade,
                    del_mun int not null,
                    foreign key(del_mun) references cat_del_mun(id_del_mun) on update cascade,
                    colonia int not null,
                    foreign key(colonia) references cat_colonia(id_colonia) on update cascade) ;
                    
create table profesores(id_profesor int primary key not null auto_increment,
                        salario float,
						apellido_paterno varchar(20) not null,
						apellido_materno varchar(20) not null,
                        nombre varchar(20) not null,
                        fecha_nacimiento date not null,
                        sexo int not null,
						foreign key(sexo) references cat_sexo(id_sexo) on update cascade,
                        estado int not null,
						foreign key(estado) references cat_estado(id_estado) on update cascade,
						del_mun int not null,
						foreign key(del_mun) references cat_del_mun(id_del_mun) on update cascade,
						colonia int not null,
						foreign key(colonia) references cat_colonia(id_colonia) on update cascade);

create table rel_profesores_materias(profesor int not null,
								foreign key(profesor) references profesores(id_profesor) on update cascade,
                                materia int not null,
                                foreign key(materia) references cat_materias(id_materia) on update cascade,
								id_rel int auto_increment primary key not null);
                                
create table grupos(id_grupo int primary key not null auto_increment,
					grado_grupo int not null,
                    foreign key(grado_grupo) references cat_grado(id_grado) on update cascade,
                    alumno int not null,
                    foreign key (alumno) references alumnos(matricula_alumno) on update cascade);
                    
create table rel_grupos_materias(grado_grupo int not null,
								foreign key(grado_grupo) references grupos(id_grupo) on update cascade,
								materia int not null,
                                foreign key(materia) references cat_materias(id_materia) on update cascade);
                                
create table calificaciones(alumno int not null,
							foreign key(alumno) references alumnos(matricula_alumno) on update cascade,
                            materia int not null,
                            foreign key(materia) references cat_materias(id_materia) on update cascade,
                            calificacion int not null);



                        
                        