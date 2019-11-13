**Preface** 
****
This was a final project from an undergraduate course in relational database design and PostgreSQL.
I utilized MySQL Workbench for a majority of the DDL, as well as for conceptual modeling to produce the ERD.
I modified the create script from the forward engineer from MySQL to utilize PostgreSQL 
datatype serial for primary keys. The forward engineer from MySQL workbench was significantly more readable than the data dump from psql.
Conversely, data entry and generating insert statements was more fluid with PgAdmin.
Full Schema including Inserts are included in the SQL file. Some details have been removed to prevent plagarism.
The project essentially consisted of creating the operational database schema, and then demonstrating it via screenshots.
****
**Video Store DB**
****
Given a brief summary of the Smal Business Video Store business operation, a
task was assigned to develop a PostgreSQL database to automate record
keeping of inventory and business transactions. The final structure of
the operational database consists of fourteen entity tables and four
association tables required to achieve many-to-many relationships. All
tables were then successfully populated with an adequate quantity of
sample data required to meet testing requirements, ensuring that all
business operations were supported.

The database life cycle describes the stages involved in development of
an implementation of a database. The process begins by gathering
business requirements by examining the summary provided in Module 8.
Entities, attributes, and relationships were discovered, and
relationship sentence pairs were developed.

![ERD](img/image133.jpg)

Figure 1 – Entity Relationship Diagram of Johnson Video Store Database.

The field of conceptual modeling began nearly forty-years ago and
continues to evolve, but Chen’s seminal paper delivered the entity
relationship model that has become virtually synonymous with database
design (Storey,
Trujillo, & Liddle, 2015). Conceptual Data Modeling can be performed to
produce an Entity Relationship Diagram (ERD). Depicted in Figure 1, the
Johnson Video Store Database ERD describes all the entities (rectangles)
and relationships (lines) discovered while gathering business
requirements. Attributes or fields are also enumerated with an
appropriate chosen datatype; primary and foreign keys are also shown.
Entities housing foreign keys of child entities may be referred to as
the owning entity. Dotted lines were used to indicated non-mandatory
relationships, conversely solid lines represent mandatory or defining
relationships. For example, the lines between movie\_has\_category,
indicates in order for the relationship to exist, foreign keys are
required to be present from both the movie and category entities.

The next phase in the design process is the conversion of the ERD to a
logical design by constructing tables, columns, primary keys, foreign
keys and their constraints. Normalization also occurs during this phase,
removing any redundancies producing. During this phase, a decision was
made to factor out address details from the customer, staff, and
distributor tables into an additional address table. This prevented
repetition of attributes in aforenoted entities and promoted flexibility
for any evolution that might be required by unanticipated future
business requirements.

The third phase, the distributed design phase, is virtually non-existent
with regards to this project as it is small in scope and not
distributed.  However, this phase
would have been more apparent had the business had multiple stores. The
design is normalized to the extent that a future implementation
supporting a store entity could be related to the staff table with the
insertion of a foreign key store id. There would be virtually no effect
upon any of the other data structures.

The final phase, the physical database design, also does not have much
to elaborate upon. Additional indexes were not warranted beyond the
default generated by PostGRES for primary keys. With regards to concern
for performance, in terms of response time, while hard to measure, it is
unlikely that multiple users will be performing operations on the system
concurrently. In terms of conservation of disk space, there is very
little redundancy. Because the data was already well normalized during
the conceptual modeling phase, few adjustments were made. However, a
missed requirement was discovered during data population, and required
the addition of the account number attribute in the customer entity

**Data Definition Language (DDL) Output**
****

![](img/image134.jpg)

Figure 2 – Output of executing the schema creation script from file
jvdbschema.sql.

![](img/image135.jpg)

Figure 3 – List of all relations in jvdb.

![](img/image136.jpg)

Figure 4 - Description of academy award table.: records academy award
categories.

![](img/image137.jpg)

Figure 5 – Description of actor table: records actors/actress names
referenced by a movie(s).

![](img/image138.jpg)

Figure 6 – Description of address table: records addresses of customers,
distributors, and staff.

![](img/image139.jpg)

Figure 7– Description of category table: records movie genres.

![](img/image140.jpg)

Figure 8 – Description of catalog item table, records distributor
catalog data.

![](img/image141.jpg)

Figure 9 – Description of customer table, records customer account data.

![](img/image142.jpg)

Figure 10 – Description of director table, records the name of movie
directors.

![](img/image143.jpg)

Figure 11 – Description of distributor table, records movie distributor
relationship.

![](img/image144.jpg)

Figure 12 – Description of inventory item, inventory items relate a
movie copy to catalog item.

![](img/image145.jpg)

Figure 13- Description of language table, records contain the language
of a film.

![](img/image146.jpg)

Figure 14 – Description of movie table, records contain details about a
movie.

![](img/image147.jpg)

Figure 15- Description of movie\_has\_academy\_award, records contain
only foreign keys, a movie id and a academy award
id. Required by the M:M relationship.

![](img/image148.jpg)

Figure 16- Description of movie\_has\_category, records contain only
foreign keys, a movie id and a category id. Required by the M:M
relationship.

![](img/image149.jpg)

Figure 17- Description of movie\_has\_actor, records contain only
foreign keys, a movie id and a actor id.
Required by the M:M relationship.

![](img/image150.jpg)

Figure 18- Description of movie\_has\_director, records contain only
foreign keys, a movie id and a director id. Required by the M:M
relationship.

 

![](img/image151.jpg)

Figure 19- Description of payment table, records the data about payments
related to a rental.

![](img/image152.jpg)

Figure 20 – Description of rental table, records the data of a rental
transaction.
 
![](img/image153.jpg)

Figure 21 – Description of staff table, records data about video store
employees.  
****
**Data Manipulation Language(DML): Insert Statements**
****

**![](img/image154.jpg)<span style="mso-bidi-font-weight:bold"></span>**

Figure 22 – Output for insert statements for language table.

![](img/image155.jpg)

Figure 23- Output for insert statements for movie table.

![](img/image156.jpg)  

Figure 24 – Output for insert statements for director table.

![](img/image157.jpg)

Figure 25 – Output for insert statements for actor table.

![](img/image158.jpg)

Figure 26- Output for insert statements for movie\_has\_actor table.

![](img/image159.jpg)

Figure 27 – Output for insert statements for movie\_has\_director table.

![](img/image160.jpg)

Figure 28– Output for insert statements for category table.

![](img/image161.jpg)

Figure 29 – Output for insert statements for movie\_has\_category table.

![](img/image162.jpg)

Figure 30 – Output for insert statements for address table.

![](img/image163.jpg)

Figure 31 – Output for insert statements for distributor table.

![](img/image164.jpg)

Figure 32 – Output for insert statements for catalog item table.

![](img/image165.jpg)

Figure 33 – Output for insert statements for inventory item table.

![](img/image166.jpg) 

Figure 34- Output for insert statements for customer table.

![](img/image167.jpg)

Figure 35 – Output for insert statements for staff table.

![](img/image168.jpg)

Figure 36 – Output for insert statements for rental table.  
  
![](img/image169.jpg)

Figure 37 – Output for insert statements for payment table.

![](img/image170.jpg)

Figure 38- Output for insert statements for academy award table.

![](img/image171.jpg)

Figure 39 – Output for insert statements for movie has academy award
table.
****
**DML: Queries and CRUD Operations**
****
<span style="color:#4B69C6">SELECT</span><span style="color:#333333"> </span><span style="color:#777777">\*</span><span style="color:#333333"> </span><span style="color:#4B69C6">FROM</span><span style="color:#333333"> <span class="SpellE">academy\_award</span>;</span>

![](img/image172.jpg)
<span style="color:#333333">  
Figure 40 – Contents of academy award.</span>

<span style="color:#4B69C6">SELECT</span><span style="color:#333333"> </span><span style="color:#777777">\*</span><span style="color:#333333"> </span><span style="color:#4B69C6">FROM</span><span style="color:#333333"> actor;</span>

![](img/image173.jpg)

<span style="color:#333333">Figure 41 – Contents of actor</span>

<span style="color:#4B69C6">SELECT</span><span style="color:#333333"> </span><span style="color:#777777">\*</span><span style="color:#333333"> </span><span style="color:#4B69C6">FROM</span><span style="color:#333333"> address;</span>

<span style="color:#333333;mso-no-proof:yes">![](img/image174.jpg)

<span style="color:#333333">Figure 42 – Contents of address.  
  
</span>

<span style="color:#4B69C6">SELECT</span><span style="color:#333333"> \* </span><span style="color:#4B69C6">FROM</span><span style="color:#333333"> catalog\_item;</span>

![](img/image175.jpg)<span style="color:#333333">  
Figure 43 – Contents of catalog item.</span>

<span style="color:#4B69C6">SELECT</span><span style="color:#333333"> </span><span style="color:#777777">\*</span><span style="color:#333333"> </span><span style="color:#4B69C6">FROM</span><span style="color:#333333"> category;</span>

<span style="color:#4B69C6;mso-no-proof:yes">![](img/image176.jpg)

<span style="color:#333333">Figure 44- Contents of category.</span>

<span style="color:#4B69C6">SELECT</span><span style="color:#333333"> </span><span style="color:#777777">\*</span><span style="color:#333333"> </span><span style="color:#4B69C6">FROM</span><span style="color:#333333"> director;</span>

<span style="color:#333333;mso-no-proof:yes">![](img/image177.jpg)

<span style="color:#333333">Figure 45- Contents of director</span>

<span style="color:#4B69C6">SELECT</span><span style="color:#333333"> </span><span style="color:#777777">\*</span><span style="color:#333333"> </span><span style="color:#4B69C6">FROM</span><span style="color:#333333"> language;</span>

<span style="color:#333333;mso-no-proof:yes">![](img/image178.jpg)

<span style="color:#333333">Figure 46- Contents of language.</span>

<span style="color:#4B69C6">SELECT</span><span style="color:#333333"> \* </span><span style="color:#4B69C6">FROM</span><span style="color:#333333"> customer;</span>

![](img/image179.jpg)

<span style="color:#333333">Figure 47 – Contents of customer.</span>

<span style="color:#4B69C6">SELECT</span><span style="color:#333333"> </span><span style="color:#777777">\*</span><span style="color:#333333"> </span><span style="color:#4B69C6">FROM</span><span style="color:#333333"> distributor;</span>

![](img/image180.jpg)

<span style="color:#333333">Figure 48 – Contents of distributor.</span>

<span style="color:#4B69C6">SELECT</span><span style="color:#333333"> \* </span><span style="color:#4B69C6">FROM</span><span style="color:#333333"> <span class="SpellE">inventory\_item</span>;

</span>![](img/image181.jpg)

<span style="color:#333333">Figure 49 – Contents of inventory
item.</span>

<span style="color:#4B69C6">SELECT</span><span style="color:#333333"> \* </span><span style="color:#4B69C6">FROM</span><span style="color:#333333"> movie;</span>

![](img/image182.jpg)</span>

<span style="color:#333333">Figure 50 – Contents of movie.</span>

<span style="color:#4B69C6"></span>

<span style="color:#4B69C6">SELECT</span><span style="color:#333333"> </span><span style="color:#777777">\*</span><span style="color:#333333"> </span><span style="color:#4B69C6">FROM</span><span style="color:#333333"> payment;</span>

<span style="color:#333333;mso-no-proof:yes">![](img/image183.jpg)

<span style="color:#333333">Figure 51 – Contents of payment.</span>

<span style="color:#4B69C6">SELECT</span><span style="color:#333333"> </span><span style="color:#777777">\*</span><span style="color:#333333"> </span><span style="color:#4B69C6">FROM</span><span style="color:#333333"> rental;</span>

![](img/image184.jpg)

<span style="color:#333333">Figure 52 – Contents of rental.</span>

<span style="color:#4B69C6">SELECT</span><span style="color:#333333"> \* </span><span style="color:#4B69C6">FROM</span><span style="color:#333333"> staff;</span>

![](img/image185.jpg)

<span style="color:#333333">Figure 53 – Contents of staff.</span>

<span style="color:#4B69C6">SELECT</span><span style="color:#333333"> </span><span style="color:#9C5D27">m</span><span style="color:#333333">.</span><span style="color:#9C5D27">id</span><span style="color:#333333">, </span><span class="GramE"><span style="color:#9C5D27">m</span><span style="color:#333333">.</span><span style="color:#9C5D27">title</span></span><span style="color:#333333">, </span><span style="color:#9C5D27">m</span><span style="color:#333333">.</span><span style="color:#9C5D27">release\_year</span><span style="color:#333333">, </span><span style="color:#9C5D27">m</span><span style="color:#333333">.</span><span style="color:#9C5D27">length</span><span style="color:#333333">, </span><span style="color:#9C5D27">m</span><span style="color:#333333">.</span><span style="color:#9C5D27">rating</span><span style="color:#333333">, </span><span style="color:#9C5D27">l</span><span style="color:#333333">.</span><span style="color:#9C5D27">name</span><span style="color:#333333"> </span><span style="color:#4B69C6">FROM</span><span style="color:#9C5D27"> movie m </span><span style="color:#4B69C6">JOIN</span><span style="color:#333333"> </span><span style="color:#4B69C6">language</span><span style="color:#333333"> l </span><span style="color:#4B69C6">on</span><span style="color:#333333"> </span><span class="GramE"><span style="color:#9C5D27">m</span><span style="color:#333333">.</span><span style="color:#9C5D27">language\_id</span><span style="color:#777777">=</span><span style="color:#9C5D27">l</span><span style="color:#333333">.</span><span style="color:#9C5D27">id</span></span><span style="color:#9C5D27"> </span><span style="color:#4B69C6">ORDER BY</span><span style="color:#333333"> </span><span style="color:#9C5D27">m</span><span style="color:#333333">.</span><span style="color:#9C5D27">id</span><span style="color:#333333"> </span><span style="color:#4B69C6">ASC</span><span style="color:#333333">;</span>

![](img/image186.jpg)<span style="color:#333333">  
Figure 54 – Contents of movie joined with language.</span>

<span style="color:#4B69C6">SELECT</span><span style="color:#333333"> \* </span><span style="color:#4B69C6">FROM</span><span style="color:#333333"> <span class="SpellE">movie\_has\_academy\_award</span>;</span>

![](img/image187.jpg)

<span style="color:#333333">Figure 55– Contents of movie has academy award.</span>

<span style="color:#4B69C6">SELECT</span><span style="color:#333333"> \* </span><span style="color:#4B69C6">FROM</span><span style="color:#333333"> movie\_has\_director;</span>

![](img/image188.jpg)

<span style="color:#333333">Figure 56– Contents of movie has
director.</span>

<span style="color:#4B69C6">SELECT</span><span style="color:#333333"> \* </span><span style="color:#4B69C6">FROM</span><span style="color:#333333"> movie\_has\_actor;</span>

![](img/image189.jpg)

<span style="color:#333333">Figure 57 – Contents of movie has
actor.</span>

<span style="color:#4B69C6">SELECT</span><span style="color:#333333"> \* </span><span style="color:#4B69C6">FROM</span><span style="color:#333333"> movie\_has\_category;</span>

![](img/image190.jpg)

<span style="color:#333333">Figure 58 – Contents of movie has
category.</span>

<span style="color:#4B69C6"></span>

<span style="color:#4B69C6">SELECT </span><span style="color:#9C5D27">m</span><span style="color:#333333">.</span><span style="color:#9C5D27">title</span></span></span><span style="color:#333333">, </span><span style="color:#9C5D27">a</span><span style="color:#333333">.</span><span style="color:#9C5D27">award\_category</span></span><span style="color:#333333"> </span><span style="color:#4B69C6">AS</span><span style="color:#333333"></span><span style="color:#448C27"><span style="color:#777777"> "</span>Award</span>
<span style="color:#777777">"</span><span style="color:#4B69C6"> FROM </span><span style="color:#333333"><span style="color:#9C5D27">movie_has_academy_award ah</span><span style="color:#4B69C6"> JOIN</span><span style="color:#9C5D27"> movie m </span><span style="color:#4B69C6">ON</span><span style="color:#333333"> </span><span style="color:#9C5D27">m</span><span style="color:#333333">.</span><span style="color:#9C5D27">id</span><span style="color:#777777">=</span><span class="SpellE"><span style="color:#9C5D27">ah</span><span style="color:#333333">.</span><span style="color:#9C5D27">movie</span></span><span style="color:#9C5D27">\_id</span></span>
<span style="color:#4B69C6">JOIN</span><span style="color:#9C5D27"> academy\_award a </span><span style="color:#4B69C6">ON</span> <span style="color:#9C5D27">ah</span><span style="color:#333333">.</span><span style="color:#9C5D27">academy\_award\_id</span></span><span style="color:#777777">=</span><span style="color:#9C5D27">a</span><span style="color:#333333">.</span><span style="color:#9C5D27">id</span><span style="color:#333333">;</span>

![](img/image191.jpg)<span style="color:#333333">  
Figure 59 – Contents of movie has award </span><span style="color:black;
mso-themecolor:text1;mso-bidi-font-style:italic">table using
joins</span><span style="color:#333333">.</span>

<span style="color:#4B69C6">SELECT</span><span style="color:#333333"> </span><span style="color:#9C5D27">m</span><span style="color:#333333">.</span><span style="color:#9C5D27">title</span></span><span style="color:#333333">, </span>**<span style="color:#AA3731">CONCAT</span>**<span style="color:#333333">(</span><span style="color:#9C5D27">d</span><span style="color:#333333">.</span><span style="color:#9C5D27">first\_name</span><span style="color:#333333">, </span><span style="color:#777777">'</span><span style="color:#448C27"> '</span><span style="color:#333333">, </span><span style="color:#9C5D27">d</span><span style="color:#333333">.</span><span style="color:#9C5D27">last\_name</span><span style="color:#333333">) </span><span style="color:#4B69C6">AS</span><span style="color:#333333"> </span><span style="color:#777777">"</span><span style="color:#448C27">Director</span><span style="color:#777777">"</span>
<span style="color:#4B69C6">FROM</span><span style="color:#9C5D27"> movie\_has\_director md</span>
<span style="color:#4B69C6">JOIN</span><span style="color:#9C5D27"> movie m </span><span style="color:#4B69C6">ON</span><span style="color:#333333"> </span><span style="color:#9C5D27">md</span><span style="color:#333333">.</span><span style="color:#9C5D27">movie\_id</span><span style="color:#777777">=</span><span style="color:#9C5D27">m</span><span style="color:#333333">.</span><span style="color:#9C5D27">id</span>
<span style="color:#4B69C6">JOIN</span><span style="color:#9C5D27"> director d </span><span style="color:
#4B69C6">ON</span><span style="color:#333333"> </span><span style="color:#9C5D27">md</span><span style="color:#333333">.</span><span style="color:#9C5D27">director</span></span><span style="color:#9C5D27">\_id</span></span><span style="color:#777777">=</span><span style="color:#333333"> </span><span style="color:#9C5D27">d</span><span style="color:#333333">.</span><span style="color:#9C5D27">id</span><span style="color:#333333">;</span>

![](img/image192.jpg)

<span style="color:#333333">Figure 60 – Contents of movie has director
using joins.</span>

<span style="color:#4B69C6">SELECT</span><span style="color:#333333"> </span><span class="SpellE"><span class="GramE"><span style="color:#9C5D27">m</span><span style="color:#333333">.</span><span style="color:#9C5D27">title</span></span></span><span style="color:#333333">, </span>**<span style="color:#AA3731">CONCAT</span>**<span style="color:#333333">(</span><span class="SpellE"><span style="color:#9C5D27">a</span><span style="color:#333333">.</span><span style="color:#9C5D27">first\_name</span></span><span style="color:#333333">, </span><span style="color:#777777">'</span><span style="color:#448C27"> '</span><span style="color:#333333">, </span><span class="SpellE"><span style="color:#9C5D27">a</span><span style="color:#333333">.</span><span style="color:#9C5D27">last\_name</span></span><span style="color:#333333">) </span><span style="color:#4B69C6">AS</span><span style="color:#333333"> </span><span style="color:#777777">"</span><span style="color:#448C27">Cast</span><span style="color:#777777">"</span>
<span style="color:#4B69C6">FROM</span><span style="color:#9C5D27"> movie\_has\_actor <span class="SpellE">ma</span>  
</span><span style="color:#4B69C6">JOIN</span><span style="color:#9C5D27"> movie m </span><span style="color:#4B69C6">
ON</span><span style="color:#333333"> </span><span style="color:#9C5D27">ma</span><span style="color:#333333">.</span><span style="color:#9C5D27">movie\_id</span><span style="color:#777777">=</span><span style="color:#9C5D27">m</span><span style="color:#333333">.</span><span style="color:#9C5D27">id</span>
<span style="color:#4B69C6">JOIN</span><span style="color:#9C5D27"> actor a </span><span style="color:#4B69C6">ON</span><span style="color:#333333"> </span><span class="SpellE"><span style="color:#9C5D27">ma</span><span style="color:#333333">.</span><span style="color:#9C5D27">actor\_id</span></span><span style="color:#777777">=</span><span style="color:#9C5D27">a</span><span style="color:#333333">.</span><span style="color:#9C5D27">id</span><span style="color:#333333">;</span>

![](img/image193.jpg)

<span style="color:#333333">Figure 61– Contents of movie has actor using joins.</span>

<span style="color:#4B69C6">  
SELECT</span><span style="color:#333333"> </span><span class="SpellE"><span class="GramE"><span style="color:#9C5D27">m</span><span style="color:#333333">.</span><span style="color:#9C5D27">title</span></span></span><span style="color:#333333">, </span><span style="color:#9C5D27">c</span><span style="color:#333333">.</span><span style="color:#9C5D27">name</span><span style="color:#333333"> </span><span style="color:#4B69C6">AS</span><span style="color:#333333"> </span><span style="color:#777777">"</span><span style="color:#448C27">Category</span><span style="color:#777777">"</span>
<span style="color:#4B69C6">FROM</span><span style="color:#9C5D27"> movie_has_category mc</span>
<span style="color:#4B69C6">JOIN</span><span style="color:#9C5D27"> movie
m </span><span class="GramE"><span style="color:#4B69C6">ON</span><span style="color:#333333"> </span><span style="color:#9C5D27">
<span class="SpellE">mc</span></span></span><span class="SpellE"><span style="color:#333333">.</span><span style="color:#9C5D27">movie_id</span></span><span style="color:#9C5D27">=
m</span><span style="color:#333333">.</span><span style="color:#9C5D27">id</span>
<span style="color:#4B69C6">JOIN</span><span style="color:#9C5D27"> category c </span><span style="color:
#4B69C6">ON</span><span style="color:#333333"> </span><span style="color:#9C5D27">mc</span><span style="color:#333333">.</span><span style="color:#9C5D27">category_id</span></span><span style="color:#777777">=</span><span style="color:#9C5D27">c</span><span style="color:#333333">.</span><span style="color:#9C5D27">id</span><span style="color:#333333">;</span>

![](img/image194.jpg)

<span style="color:#333333">Figure 62– Contents of movie has category
using joins.  
  
</span>

<span style="color:#4B69C6">SELECT</span> <span style="color:#9C5D27">c</span><span style="color:#333333">.</span><span style="color:#9C5D27">account</span></span><span style="color:#9C5D27">\_number</span><span style="color:#333333">, </span><span style="color:#9C5D27">c</span><span style="color:#333333">.</span><span style="color:#9C5D27">first\_name</span><span style="color:#333333">, </span><span style="color:#9C5D27">c</span><span style="color:#333333">.</span><span style="color:#9C5D27">last\_name</span><span style="color:#333333">, </span><span style="color:#9C5D27">a</span><span style="color:#333333">.</span><span style="color:#9C5D27">street</span><span style="color:#333333">, </span><span style="color:#9C5D27">a</span><span style="color:#333333">.</span><span style="color:#9C5D27">postal\_code</span>
<span style="color:#4B69C6">FROM</span><span style="color:#9C5D27"> customer c</span>
<span style="color:#4B69C6">JOIN</span><span style="color:#333333"> </span><span style="color:#4B69C6">address</span><span style="color:#333333"> a </span><span style="color:#4B69C6">ON</span><span style="color:#333333"> </span><span class="SpellE"><span class="GramE"><span style="color:#9C5D27">c</span><span style="color:#333333">.</span><span style="color:#9C5D27">address</span></span><span style="color:#9C5D27">\_id</span></span><span style="color:#333333"> </span><span style="color:#777777">=</span><span style="color:#333333"> </span><span style="color:#9C5D27">a</span><span style="color:#333333">.</span><span style="color:#9C5D27">id</span>
<span style="color:#4B69C6">ORDER BY</span><span style="color:#333333"> </span><span class="SpellE"><span class="GramE"><span style="color:#9C5D27">c</span><span style="color:#333333">.</span><span style="color:#9C5D27">account</span></span><span style="color:#9C5D27">\_number</span></span><span style="color:#333333"> </span><span style="color:#4B69C6">ASC</span><span style="color:#333333">;</span>

![](img/image195.jpg)

<span style="color:#333333">Figure 63 – Customers' names, account numbers, and addresses.</span>

<span style="color:#4B69C6">SELECT</span><span style="color:#333333"> </span><span class="GramE"><span style="color:#9C5D27">c</span><span style="color:#333333">.</span><span style="color:#9C5D27">first</span></span><span style="color:#9C5D27">\_name</span><span style="color:#333333">, </span><span style="color:#9C5D27">c</span><span style="color:#333333">.</span><span style="color:#9C5D27">last\_name</span><span style="color:#333333">, </span><span style="color:#9C5D27">r</span><span style="color:#333333">.</span><span style="color:#9C5D27">rental\_date</span><span style="color:#333333">, </span><span style="color:#9C5D27">m</span><span style="color:#333333">.</span><span style="color:#9C5D27">title</span><span style="color:#333333">, </span><span class="SpellE"><span style="color:#9C5D27">i</span><span style="color:#333333">.</span><span style="color:#9C5D27">media\_type</span></span><span style="color:#333333"> </span><span style="color:#4B69C6">FROM</span><span style="color:#9C5D27"> rental r</span>
<span style="color:#4B69C6">JOIN</span><span style="color:#333333"><span style="color:#9C5D27"> customer c </span><span style="color:
#4B69C6">ON</span><span style="color:#333333"> </span><span style="color:#9C5D27">r</span><span style="color:#333333">.</span><span style="color:#9C5D27">customer\_id</span><span style="color:#777777">=</span><span style="color:#9C5D27">c</span><span style="color:#333333">.</span><span style="color:#9C5D27">id</span></span>
<span style="color:#4B69C6">JOIN</span><span style="color:#333333"><span style="color:#9C5D27"> inventory_item</span> i </span><span style="color:#4B69C6">ON</span><span style="color:#333333"> </span><span style="color:#9C5D27">r</span><span style="color:#333333">.</span><span style="color:#9C5D27">inventory\_id</span><span style="color:#777777">=</span><span style="color:#9C5D27">i</span><span style="color:#333333">.</span><span style="color:#9C5D27">id</span></span>
<span style="color:#4B69C6">JOIN</span><span style="color:#9C5D27"> movie m </span><span style="color:#4B69C6">ON</span><span style="color:#333333"> </span><span class="GramE"><span style="color:#9C5D27">i</span><span style="color:#333333">.</span><span style="color:#9C5D27">movie\_id</span><span style="color:#777777">=</span><span style="color:#9C5D27">m</span><span style="color:#333333">.</span><span style="color:#9C5D27">id</span></span>
<span style="color:#4B69C6">WHERE</span><span style="color:#333333"> </span><span class="GramE"><span style="color:#9C5D27">i</span><span style="color:#333333">.</span><span style="color:#9C5D27">media</span></span><span style="color:#9C5D27">\_type</span><span style="color:#777777">='</span><span style="color:#448C27">DVD'</span>
<span style="color:#4B69C6">AND</span><span style="color:#333333"> </span><span class="GramE"><span style="color:#9C5D27">r</span><span style="color:#333333">.</span><span style="color:#9C5D27">rental</span></span><span style="color:#9C5D27">\_date</span><span style="color:#333333"> </span><span style="color:#777777">\></span><span style="color:#333333"> (current\_date </span><span style="color:#777777">-</span><span style="color:#333333"> interval </span><span style="color:#777777">'</span><span style="color:#448C27">30 day'</span><span style="color:#333333">) </span><span style="color:#4B69C6">ORDER BY</span><span style="color:#333333"> </span><span style="color:#9C5D27">r</span><span style="color:#333333">.</span><span style="color:#9C5D27">rental\_date</span><span style="color:#333333"> </span><span style="color:#4B69C6">ASC</span><span style="color:#333333">;</span>

![](img/image196.jpg)

<span style="color:#333333">Figure 64 – Query showing all DVD’s rented in the last 30 days sorted chronologically. </span>

<span style="color:#4B69C6">UPDATE</span><span style="color:#333333"> customer </span><span style="color:#4B69C6">SET</span><span style="color:#333333"> <span class="SpellE">last\_name</span></span><span style="color:#777777">='</span><span style="color:#448C27">Mirren'</span><span style="color:#333333"> </span><span style="color:#4B69C6">WHERE</span><span style="color:#333333"> id</span><span style="color:#777777">=</span><span style="color:#9C5D27">1</span><span style="color:#333333">;</span>

![](img/image197.jpg)

<span style="color:#333333">Figure 65 – Output of updating a customer last name.</span>

<span style="color:#4B69C6">DELETE</span><span style="color:#333333"> </span><span style="color:#4B69C6">FROM</span><span style="color:#333333"> customer </span><span style="color:#4B69C6">WHERE</span><span style="color:#333333"> id</span><span style="color:#777777">=</span><span style="color:#9C5D27">1</span><span style="color:#333333">;</span>

![](img/image198.jpg)

<span style="color:#333333">Figure 66 – Output of deleting a customer.</span>
****
**Lessons Learned**
****
At the beginning of this process, research was performed to learn about
the best practices and procedures for database design and management. It
was determined that overall practices are highly varied between
individuals and across organizations. The only consensuses that did seem
to emerge involving best practices were in areas deemed most crucial
such as security and resiliency (Holt, Ramage, Kear, & Heap, 2015, pp.
168). Practices in the areas are relatively standardized in
implementation, spanning many relational database management systems
(RDMS). The conclusion is that there is no true consensus regarding best
practices for design and maintenance of an operational database,
although various methodologies exist such as Agile and Waterfall.

There was the additionally the realization that a major challenge is
ensuring the data your SQL returns is in fact the correct data. There
are many instances where the output appears correct but are incorrect.
Perhaps you have queried the wrong table yet received a similar result.
Throughout the duration of my project, this memorably occurred once:
when querying for the contents of the movie\_has\_academy\_award table. Initially
the movie table had been queried, joined movie\_has\_academy\_award, also joined with
the award table. The output appeared identical.

The first major challenge concerned productivity: How to develop the
schema, populate sample data, and test the results using the least
amount of labor (hours). The integration of graphical user interfaces
and the command line interface greatly increased overall productivity.
According to Codd, relational database management systems that provide
both of these tools greatly increase the productivity of both
programmers and database administrators. This was reinforced for me
particularly throughout this project by utilizing the pgAdmin interface
to construct tables, insertions, and perform a data-dump. This tool
significantly decreased the amount of time required to generate the DDL
SQL. The process would have been much more laborious if I did not have
the graphical tool to aid and automate the process. However, that does
not imply that using the data dump in a final script was enough. A
significant portion of the SQL produced by the dump performed operations
that could simply be allowed happen by default. A substantial
minimization was achieved by editing and reviewing the output from
pgdump.

Preferring the command line interface psql, it was required to learn new
commands in order to execute scripts locate inside SQL script files, as
well learning to produce an output describing tables and their
structures. The primary source of reference was obtained by accessing
the documentation section on the PostgreSQL website. Overall, the result
was a real strengthening that of my relational algebra skills, being
necessary to perform multiple joins in order to achieve complex queries
to display the data shown in figures 54-57.

Additionally, a newfound appreciation was attained for the benefit of
having conducted a thorough conceptual modeling phase. According to
research done by Yang, there are two major approaches to this phase. The
first involves construction of a single large relational table, and then
decomposing it higher normal forms. The other method, popular in the
software design industry, involves the creation of several relational
tables, that are further normalized to reduce or eliminate redundancy
(Yang, 2003). I am thankful for having been exposed to the latter
methodology, although both demonstrably may have merit, the former
appears historic.

The relevance of Yang’s research to my own experience, is that multiple
errors would have persisted in my model had I blindly followed the
initial model. For example, an error was discovered in the first version
that depicted staff as being related to a single rental. The address
relation was also depicted as a one-to-one relationship, which is
inaccurate because customers, distributors, and staff may in-fact have
the same address. The model was revised accordingly.
****
**References**
****
The PostgreSQL Global Development Group. (n.d.). PostgreSQL:
Documentation: 11: psql. Retrieved October 31, 2019, from
<https://www.postgresql.org/docs/11/app-psql.html>

Codd, E. (1982). Relational database: a practical foundation for
productivity. *Communications of the ACM*, *25*(2), 109–117.
<https://doi.org/10.1145/358396.358400>

Holt, V., Ramage, M., Kear, K., & Heap, N. (2015). The usage of best
practices and procedures in the database community. *Information
Systems*, *49*(C), 163–181. <https://doi.org/10.1016/j.is.2014.12.004>

Juba, S., & Volkov, A. (2017). *Learning PostgreSQL 10: A beginner’s
guide to building high-performance PostgreSQL database
solutions* \[Redshelf\]. Retrieved from
<https://platform.virdocs.com/r/s/0/doc/592940/>

Storey, V. C., Trujillo, J. C., & Liddle, S. W. (2015). Research on
conceptual modeling: Themes, topics, and introduction to the special
issue. *Data & Knowledge Engineering*, *98*, 1–7.
<https://doi.org/10.1016/j.datak.2015.07.002>

V. Mannino, M. V. (2018). *Database Design, Application Development, and
Administration, 7e* \[Redshelf\]. Retrieved from
<https://platform.virdocs.com/r/s/0/doc/592088/>

Yang, H. (2003). Comparing relational database designing approaches:
some managerial implications for database training. *Industrial
Management & Data Systems*, *103*(3), 150–166.
<https://doi.org/10.1108/02635570310465634>