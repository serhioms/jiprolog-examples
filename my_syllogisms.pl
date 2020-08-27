% https://www.cpp.edu/~jrfisher/www/prolog_tutorial/2_2.html
% https://en.wikipedia.org/wiki/Syllogism
% https://www.newworldencyclopedia.org/entry/Syllogism

% 5 all syllogism which possible to implement in prolog
barbara(S,P)	:- all_is(M,P),all_is(S,M),S\=P.		%figure#1 deduction
celarent(S,P)	:- all_is_not(M,P),all_is(S,M),S\=P.	%figure#1 deduction
cesare(S,P)		:- all_is_not(P,M),all_is(S,M),S\=P.	%figure#2 abduction
camestres(S,P)	:- all_is(P,M),all_is_not(S,M),S\=P.	%figure#2 abduction
calemes(S,P)	:- all_is(P,M),all_is_not(M,S),S\=P.	%figure#4 deduction

% 19 some syllogism...
barbari(S,P)	:- all_is(M,P),all_is(S,M),S\=P.		%figure#1 deduction
celaront(S,P)	:- all_is_not(M,P),all_is(S,M),S\=P.	%figure#1 deduction
darii(S,P)		:- all_is(M,P),some_is(S,M),S\=P.		%figure#1 deduction 
ferio(S,P)		:- all_is_not(M,P),some_is(S,M),S\=P.	%figure#1 deduction 
cesaro(S,P)		:- all_is_not(P,M),all_is(S,M),S\=P.	%figure#2 abduction
camestros(S,P)	:- all_is(P,M),all_is_not(S,M),S\=P.	%figure#2 abduction
festino(S,P)	:- all_is_not(P,M),some_is(S,M),S\=P.	%figure#2 abduction 
baroco(S,P)		:- all_is(P,M),some_is_not(S,M),S\=P.	%figure#2 abduction 
darapti(S,P)	:- all_is(M,P),all_is(M,S),S\=P.		%figure#3 induction
disamis(S,P)	:- some_is(M,P),all_is(M,S),S\=P.		%figure#3 induction
datisi(S,P)		:- all_is(M,P),some_is(M,S),S\=P.		%figure#3 induction
felapton(S,P)	:- all_is_not(M,P),all_is(M,S),S\=P.	%figure#3 induction
bocardo(S,P)	:- some_is_not(M,P),all_is(M,S),S\=P.	%figure#3 induction
ferison(S,P)	:- all_is_not(M,P),some_is(M,S),S\=P.	%figure#3 induction
bamalip(S,P)	:- all_is(P,M),all_is(M,S),S\=P.		%figure#4 deduction
dimatis(S,P)	:- some_is(P,M),all_is(M,S),S\=P.		%figure#4 deduction
fesapo(S,P)		:- all_is_not(P,M),all_is(M,S),S\=P.	%figure#4 deduction
fresison(S,P)	:- all_is_not(P,M),some_is(M,S),S\=P.	%figure#4 deduction
calemos(S,P)	:- all_is(P,M),all_is_not(M,S),S\=P.	%figure#4 deduction

% All S is P
syllogism_all_is(S,P) :- 
	barbara(S,P).
	 
% All S isn't P
syllogism_all_is_not(S,P) :- 
	celarent(S,P);
	calemes(S,P);
	cesare(S,P);
	camestres(S,P). 

% Some S is P
syllogism_some_is(S,P) :- 
	barbari(S,P);
	dimatis(S,P);
	bamalip(S,P);
	datisi(S,P);
	disamis(S,P);
	darapti(S,P);
	darii(S,P).

% Some S isn't P
syllogism_some_is_not(S,P) :-
	calemos(S,P); 
	cesaro(S,P); 
	camestros(S,P); 
	celaront(S,P); 
	fresison(S,P); 
	fesapo(S,P);
	ferison(S,P);
	bocardo(S,P);
	felapton(S,P);
	baroco(S,P);
	festino(S,P);
	ferio(S,P).

% All together
conclude(K,S,P) :- 
	K=some_is_not,syllogism_some_is_not(S,P);
	K=some_is,syllogism_some_is(S,P);
	K=all_is,syllogism_all_is(S,P);
	K=all_is_not,syllogism_all_is_not(S,P). 

% barbara test
all_is(men,mortal).
all_is(greeks,men).
%K=all_is,S=greeks,P=mortal

% celarent test
all_is_not(reptiles, fur).
all_is(snakes, reptiles).
%K=all_is_not,S=snakes,P=fur

% cesare test
all_is_not(healthy_food, fattening).
all_is(cakes, fattening).
%K=all_is_not,S=cakes,P=healthy_food

% camestres test
all_is(horses, hoovers).
all_is_not(humans, hoovers).
%K=all_is_not,S=humans,P=horses


% calemes/camenes test
all_is(colored_flowers, scented_flowers).
all_is_not(scented_flowers, grown_indoors_flowers).
%K=all_is_not,S=grown_indoors_flowers,P=colored_flowers

% darii test
all_is(kittens, playful_pets).
some_is(pets, kittens).
%K=some_is,S=pets,P=playful_pets 

% ferio test
all_is_not(homework, fun).
some_is(reading, homework).
%K=some_is_not,S=reading,P=fun

% festino test
all_is_not(lazy_people, pass_exam).
some_is(students, pass_exam).
%K=some_is_not,S=students,P=lazy_people

% baroco test
all_is(informative_things, usefull).
some_is_not(websites, usefull).
%K=some_is_not,S=websites,P=informative_things

% darapti test
all_is(fruit, nutritious).
all_is(fruit, tasty_food).
%K=some_is,S=tasty_food,P=nutritious

% disamis test
some_is(mugs, beautiful).
all_is(mugs, usefull_things).
%K=some_is,S=usefull_things,P=beautiful

% datisi test
all_is(industrious_boys,  red_hair).
some_is(industrious_boys,  boarders_in_this_scholl).
%K=some_is,S=boarders_in_this_scholl,P=red_hair

% felapton test
all_is_not(jug_in_this_cupnoard,  new).
all_is(jug_in_this_cupnoard,  cracked_items_in_this_cupboard).
%K=some_is_not,S=cracked_items_in_this_cupboard,P=new

% bocardo test
some_is_not(cats, tails).
all_is(cats, mammals).
%K=some_is_not,S=mammals,P=tails

% ferison test
all_is_not(tree, edible).
some_is(tree, green_thing).
%K=some_is_not,S=green_thing,P=edible

% bamalip/bramantip test
all_is(apples_in_my_garden, wholesome_fruit).
all_is(wholesome_fruit, rip_fruit).
%K=some_is,S=rip_fruit,P=apples_in_my_garden

% dimatis/dimaris test
some_is(small_birds, birds_live_on_honey).
all_is(birds_live_on_honey, colorful_birds).
%K=some_is,S=colorful_birds,P=small_birds

% fesapo test
all_is_not(human, perfect_creatures).
all_is(perfect_creatures, mythical_creatures).
%K=some_is_not,S=mythical_creatures,P=human

% fresison test
all_is_not(competent_person, incompetent).
some_is(incompetent, work_here).
%K=some_is_not,S=work_here,P=competent_person

% command
%?- conclude(K,S,P).

%K=some_is,S=greeks,P=mortal
%K=some_is,S=mortal,P=greeks
%K=all_is,S=greeks,P=mortal

%K=some_is_not,S=fur,P=snakes
%K=some_is_not,S=snakes,P=fur
%K=all_is_not,S=snakes,P=fur
%K=all_is_not,S=fur,P=snakes

%K=some_is_not,S=cakes,P=healthy_food
%K=some_is_not,S=healthy_food,P=cakes
%K=all_is_not,S=cakes,P=healthy_food
%K=all_is_not,S=healthy_food,P=cakes

%K=some_is_not,S=horses,P=humans
%K=some_is_not,S=humans,P=horses
%K=all_is_not,S=horses,P=humans
%K=all_is_not,S=humans,P=horses

%K=some_is_not,S=grown_indoors_flowers,P=colored_flowers
%K=some_is_not,S=colored_flowers,P=grown_indoors_flowers
%K=all_is_not,S=colored_flowers,P=grown_indoors_flowers
%K=all_is_not,S=grown_indoors_flowers,P=colored_flowers

%K=some_is,S=apples_in_my_garden,P=rip_fruit
%K=some_is,S=rip_fruit,P=apples_in_my_garden
%K=all_is,S=apples_in_my_garden,P=rip_fruit

%K=some_is,S=playful_pets,P=pets
%K=some_is,S=pets,P=playful_pets

%K=some_is,S=colorful_birds,P=small_birds
%K=some_is,S=small_birds,P=colorful_birds


%K=some_is,S=beautiful,P=usefull_things
%K=some_is,S=usefull_things,P=beautiful

%K=some_is,S=boarders_in_this_scholl,P=red_hair
%K=some_is,S=red_hair,P=boarders_in_this_scholl

%K=some_is,S=tasty_food,P=nutritious
%K=some_is,S=nutritious,P=tasty_food

%K=some_is_not,S=work_here,P=competent_person
%K=some_is_not,S=mythical_creatures,P=human
%K=some_is_not,S=green_thing,P=edible
%K=some_is_not,S=mammals,P=tails
%K=some_is_not,S=cracked_items_in_this_cupboard,P=new
%K=some_is_not,S=websites,P=informative_things
%K=some_is_not,S=students,P=lazy_people
%K=some_is_not,S=reading,P=fun
