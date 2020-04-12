---
layout: post
title: "La kata Gilded Rose en PL/SQL: escribiendo los tests"
date: 2020-04-11 16:27 +0100
date: 2020-04-11 18:27 +0100
tags: [testing, katas, refactoring, PL/SQL]
---

##### Contexto

En uno de nuestros actuales clientes, [Mutua Tinerfeña](http://www.mutuatfe.es/), estamos trabajando diferentes técnicas para construir software de manera progresiva y confiable. Aunque el equipo es pequeño, sus miembros usan y conocen tecnologías muy diferentes, por lo que necesitábamos practicar dichas técnicas usando como vehículo un lenguaje que dominaran todos los miembros del equipo. Con esto podíamos evitar que algunos miembros del equipo tuvieran que aprender otros paradigmas para poder practicar las nuevas técnicas. Así que elegimos [PL/SQL](https://en.wikipedia.org/wiki/PL/SQL), que era el lenguaje que todos tenían en común, como vehículo de aprendizaje.

Este ejercicio es parte de un curso sobre refactoring de base de datos que estamos preparando con mucho amor. Este curso está pensado para equipos que trabajan con un legacy en el que la mayoría del código se encuentra en la base de datos y puedan incorporar técnicas como testing y empezar a trabajar su legacy con confianza y de forma más sostenible. Esta primera versión del curso está orientado fundamentalmente a Oracle como SGBD, aunque muchas de las ideas pueden ser trasladadas a otros SGBD como SQLServer.

##### Aprendiendo refactoring y TDD en PL/SQL

Una de las prácticas que hicimos fue resolver la [kata Gilded Rose en PL/SQL](https://github.com/emilybache/GildedRose-Refactoring-Kata/tree/master/plsql) para practicar refactoring y TDD. En esta kata lo primero que se debe hacer, antes de añadir la funcionalidad que nos piden, es cubrir el código de tests. Estos tests nos permiten refactorizar el código para hacer que, finalmente, sea fácil añadir la nueva funcionalidad usando TDD. En este post contaremos cómo escribimos los tests para la versión PL/SQL de la kata.

##### Testeando la kata Gilded Rose en PL/SQL usando utPSQL 

La herramienta que usamos para testear el código PL/SQL fue [utPSQL](http://utplsql.org/about/) que es un framework de testing open-source para PL/SQL and SQL. utPSQL nos permite lanzar los tests de manera muy fácil. 

Para escribir los tests hay que crear un paquete<a href="#nota1"><sup>[1]</sup></a>. En la especificación del paquete hay que añadir una serie de anotaciones, y, por último, escribir el propio test en el cuerpo del paquete.

Para lanzar todos los tests desde la base de datos<a href="#nota2"><sup>[2]</sup></a> hay que hacer la siguiente llamada a la "librería":

`begin ut.run(); end;`

Esta llamada buscará en el schema todos los paquetes que contengan las anotaciones y lanzará sus tests. Existe también la posibilidad de lanzar sólo los tests de un determinado paquete indicándolo como un argumento.

Estos son los tests para la kata Gilded Rose en PL/SQL:
<script src="https://gist.github.com/franreyes/037db9310136bfdc189b42025ab77d93.js"></script>

Aunque pueda parecer sorprendente, los tests resultantes son bastante legibles. La legibilidad de los tests, en comparación con otras librerías similares, es uno de los puntos a favor de utPSQL.

##### Conclusiones 
Hemos visto como es posible hacer testing en PL/SQL usando utPSQL. Estos tests crearán una red de seguridad que nos permitirá refactorizar el código, o lo que es lo mismo, mejorar su diseño preservando su comportamiento. 

En el próximo post de esta serie enseñaremos como se pueden aplicar técnicas de refactoring y de diseño para mejorar el código PL/SQL de la kata Gilded Rose en pequeños pasos manteniendo los tests en verde en todo momento.

##### Agradecimientos
Me gustaría agradecer a mi compañero [Manuel Rivero](https://twitter.com/trikitrok?lang=en) por ayudarme a revisar y editar este post, y al equipo de Mutua Tinerfeña por las aportaciones ofrecidas desde su amplia experiencia en este entorno.

<div class="foot-note">
	<a name="nota1"></a> [1] Un paquete es una agrupación lógica de procedimientos, funciones, tipos, constantes, etc. Un paquete tiene 2 partes, una especificación y un cuerpo. La especificación es una interfaz para el consumidor y el cuerpo expone la implementación.
</div>

<div class="foot-note">
	<a name="nota2"></a> [2] También existe la posibilidad de lanzar los tests desde una términal, lo que permite vincularlos a un sistema de integración continua de manera muy sencilla.
</div>
