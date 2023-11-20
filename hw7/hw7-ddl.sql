# hw7-ddl.sql

## DO NOT RENAME OR OTHERWISE CHANGE THE SECTION TITLES OR ORDER.
## The autograder will look for specific code sections. If it can't find them, you'll get a "0"

# Code specifications.
# 0. Where there a conflict between the problem statement in the google doc and this file, this file wins.
# 1. Complete all sections below.
# 2. Table names must MATCH EXACTLY to schemas provided.
# 3. Define primary keys in each table as appropriate.
# 4. Define foreign keys connecting tables as appropriate.
# 5. Assign ID to skills, people, roles manually (you must pick the ID number!)
# 6. Assign ID in the peopleskills and peopleroles automatically (use auto_increment)
# 7. Data types: ONLY use "int", "varchar(255)", "varchar(4096)" or "date" as appropriate.

# Section 1
# Drops all tables.  This section should be amended as new tables are added.

SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS people;
DROP TABLE IF EXISTS skills;
DROP TABLE IF EXISTS peopleskills;
DROP TABLE IF EXISTS roles;
DROP TABLE IF EXISTS peopleroles;
# ... 
SET FOREIGN_KEY_CHECKS=1;

# Section 2
# Create skills( id,name, description, tag, url, time_commitment)
# ID, name, description and tag cannot be NULL. Other fields can default to NULL.
# tag is a skill category grouping.  You can assign it based on your skill descriptions.
# time committment offers some sense of how much time was required (or will be required) to gain the skill.
# You can assign the skill descriptions.  Please be creative!

CREATE TABLE skills (
    id int not null,
    name varchar(255) not null,
    description varchar(255) not null,
    tag varchar(255) not null,
    url varchar(255),
    time_commitment varchar(255),
    primary key (id)
);


# Section 3
# Populate skills
# Populates the skills table with eight skills, their tag fields must exactly contain “Skill 1”, “Skill 2”, etc.
# You can assign skill names.  Please be creative!

INSERT INTO skills(id, name, description, tag, url, time_commitment) values
    (1,'Front-End Programmer','Writing designs for company','Skill 1','www.javascript.com','5 days a week'),
    (2,'Back-End Programmer','Writing programs for company','Skill 2','www.python.com','5 days a week'),
    (3,'Chef','Makes food for everyone','Skill 3','www.hellskitchen.com','5 days a week'),
    (4,'Swordsman','Security for company','Skill 4','www.dojo.com','Every day'),
    (5,'Captain','Manager for company','Skill 5','www.manager.com','Every day'),
    (6,'Navigator','Helps people find buildings','Skill 6','www.navigation.com','5 days a week'),
    (7,'Vice Captain','Helps Captain and recruits','Skill 7','www.assistant.com','5 days a week'),
    (8,'Guardian','Protects data and in charge of cybersecurity','Skill 8','www.protection.com','5 days a week');


# Section 4
# Create people( id,first_name, last_name, email, linkedin_url, headshot_url, discord_handle, brief_bio, date_joined)
# ID cannot be null, Last name cannot be null, date joined cannot be NULL.
# All other fields can default to NULL.

CREATE TABLE people (
    id int NOT NULL,
    first_name varchar(256),
    last_name varchar(256) NOT NULL,
    email varchar(256),
    linkedin_url varchar(256),
    headshot_url varchar(256),
    discord_handle varchar(256),
    brief_bio varchar(256),
    date_joined varchar(256) NOT NULL,
    PRIMARY KEY (id)
);

# Section 5
# Populate people with six people.
# Their last names must exactly be “Person 1”, “Person 2”, etc.
# Other fields are for you to assign.

insert into people(id, first_name, last_name, email, linkedin_url, headshot_url, discord_handle, brief_bio, date_joined) values 
    (1,'Nami','Person 1','namiOP@gmail.com','linkedin.com/in/nami','www.headshot.com/nami','namiOP','Has extreme navigation skills','11/19/2023'),
    (2,'Luffy','Person 2','luffyOP@gmail.com','linkedin.com/in/luffy','www.headshot.com/luffy','luffyOP','Wants to be the King of Pirates','11/19/2023'),
    (3,'Toshiro','Person 3','toshiro@gmail.com','linkedin.com/in/toshiro','www.headshot.com/toshiro','toshiroICE','Can manipulate ice and is a captain','11/19/2023'),
    (4,'Usopp','Person 4','usoppOP@gmail.com','linkedin.com/in/usopp','www.headshot.com/usopp','usoppOP','Can be very brave and works very fast','11/19/2023'),
    (5,'Sanji','Person 5','sanjiOP@gmail.com','linkedin.com/in/sanji','www.headshot.com/sanji','sanjiOP','Very good at cooking and athletic','11/19/2023'),
    (6,'Zoro','Person 6','zoroOP@gmail.com','linkedin.com/in/zoro','www.headshot.com/zoro','zoroOP','Has extremely good swordsmanship','11/19/2023'),
    (7,'Brock','Person 7','brockpokemon@gmail.com','linkedin.com/in/brock','www.headshot.com/brock','brockPKMN','Has good teamwork skills and can cook','11/19/2023'),
    (8,'Naruto','Person 8','naruto9@gmail.com','linkedin.com/in/naruto','www.headshot.com/naruto','naruto9','Has great leadership skills and can work really well in teams','11/19/2023'),
    (9,'Itachi','Person 9','itachi@gmail.com','linkedin.com/in/itachi','www.headshot.com/itachi','itachiCROW','Extremely smart and can pick up skills quickly','11/19/2023'),
    (10,'Ichigo','Person 10','ichigo@gmail.com','linkedin.com/in/ichigo','www.headshot.com/ichigo','ichigoBANKAI','Extremely persistent and can work really well with teams','11/19/2023');



# Section 6
# Create peopleskills( id, skills_id, people_id, date_acquired )
# None of the fields can ba NULL. ID can be auto_increment.

CREATE TABLE peopleskills (
    id int auto_increment NOT NULL,
    skills_id int NOT NULL,
    people_id int NOT NULL,
    date_acquired date default (current_date) NOT NULL,
    PRIMARY KEY (id),
    foreign key (skills_id) references skills(id) on delete cascade,
    foreign key (people_id) references people(id),
    unique (skills_id,people_id)
);


# Section 7
# Populate peopleskills such that:
# Person 1 has skills 1,3,6;
# Person 2 has skills 3,4,5;
# Person 3 has skills 1,5;
# Person 4 has no skills;
# Person 5 has skills 3,6;
# Person 6 has skills 2,3,4;
# Person 7 has skills 3,5,6;
# Person 8 has skills 1,3,5,6;
# Person 9 has skills 2,5,6;
# Person 10 has skills 1,4,5;
# Note that no one has yet acquired skills 7 and 8.
 
INSERT INTO peopleskills(people_id, skills_id) values 
    (1,1),
    (1,3),
    (1,6),
    (2,3),
    (2,4),
    (2,5),
    (3,1),
    (3,5),
    (5,3),
    (5,6),
    (6,2),
    (6,3),
    (6,4),
    (7,3),
    (7,5),
    (7,6),
    (8,1),
    (8,3),
    (8,5),
    (8,6),
    (9,2),
    (9,5),
    (9,6),
    (10,1),
    (10,4),
    (10,5);

# Section 8
# Create roles( id, name, sort_priority )
# sort_priority is an integer and is used to provide an order for sorting roles

CREATE TABLE roles(
    id int,
    name varchar(255),
    sort_priority int,
    PRIMARY KEY (id)
);


# Section 9
# Populate roles
# Designer, Developer, Recruit, Team Lead, Boss, Mentor
# Sort priority is assigned numerically in the order listed above (Designer=10, Developer=20, Recruit=30, etc.)

INSERT INTO roles(id, name, sort_priority) values 
    (1,'Designer',10),
    (2,'Developer',20),
    (3,'Recruit',30),
    (4,'Team Lead',40),
    (5,'Boss',50),
    (6,'Mentor',60);


# Section 10
# Create peopleroles( id, people_id, role_id, date_assigned )
# None of the fields can be null.  ID can be auto_increment

CREATE TABLE peopleroles (
    id int NOT NULL,
    people_id int NOT NULL,
    role_id int NOT NULL,
    date_assigned varchar(255) NOT NULL
);


# Section 11
# Populate peopleroles
# Person 1 is Developer 
# Person 2 is Boss, Mentor
# Person 3 is Developer and Team Lead
# Person 4 is Recruit
# person 5 is Recruit
# Person 6 is Developer and Designer
# Person 7 is Designer
# Person 8 is Designer and Team Lead
# Person 9 is Developer
# Person 10 is Developer and Designer

INSERT INTO peopleroles(id, people_id, role_id, date_assigned) values 
    (1,1,2,'11/19/2023'),
    (2,2,5,'11/19/2023'),
    (2,2,6,'11/19/2023'),
    (3,3,2,'11/19/2023'),
    (3,3,4,'11/19/2023'),
    (4,4,3,'11/19/2023'),
    (5,5,3,'11/19/2023'),
    (6,6,2,'11/19/2023'),
    (6,6,1,'11/19/2023'),
    (7,7,1,'11/19/2023'),
    (8,8,1,'11/19/2023'),
    (8,8,4,'11/19/2023'),
    (9,9,2,'11/19/2023'),
    (10,10,2,'11/19/2023'),
    (10,10,1,'11/19/2023');