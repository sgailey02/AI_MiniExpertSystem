%  This Mini Expert System advises on what pet fish is best for you

%  By typing top. , the system begins.
%  It will ask for Scale type, Body length, Body width, and if it is poisonous or not.
%  choose will bind a value to the variable Fish
%  You must press a period after your input.

% Take user input and read into prolog identifiers/variables
top :- write('\n\tWhat kind of scales did you want the fish to have? (smooth, scaley, pokey)\n\t'), read(Scales),
       write('\n\tHow long  do you want your fish to be? (cm) \n\t'), read(Length), 
       write('\n\tHow wide do you want your fish to be? (cm) \n\t'), read(Width),
       write('\n\tDo you want a poisonous fish? (yes or no) \n\t'), read(Venom),
       write('\n\tDo you want a salt water(1) or fresh water(0) fish? (input 1 or 0) \n\t'), read(Water),
       choose(Scales, Length, Width, Venom, Water, Fish),
       write('\n \n \t The perfect fish for you is a '), write(Fish), nl.


% Confidence Factor of choose rules are all 60 percent.
choose(Scales, Length, Width, Venom, Water, 'Lion Fish \n \t \t The Lion Fish has pokey scales and fan-like fins that \n \t \t extend outward similar to a lions mane. They are a large species \n\t\t of fish and poisonous to people!') :-
       pokey(Scales), large(Length, Width), venom(Venom), Water = 1.

choose(Scales, Length, Width, Venom, Water, 'Rock Fish \n \t \t The Rock Fish has very pokey scales on its body to look \n \t \t like a jagged rock. Rock Fish are extra large fish and poisonous to people!') :-
       pokey(Scales), xlarge(Length, Width), venom(Venom), Water = 1.

choose(Scales, Length, Width, Venom, Water, 'Brook Stickleback \n \t \t The Brook Stickleback has a pokey scale texture and is a small fish.\n\t\t  It is not Poisonous.') :-
       pokey(Scales), small(Length, Width), nonvenom(Vemon), Water = 0.

choose(Scales, Length, Width, Venom, Water, 'Short Snout Spike Fish \n \t \t The Short Snout Spike Fish has a pokey scale texture. \n \t \t It is a small fish and poisonous to people!') :-
       pokey(Scales), small(Length, Width), venom(Venom), Water = 1.

choose(Scales, Length, Width, Venom, Water, 'Puffer Fish \n \t \t The Puffer Fish has an extremely pokey scale texture. It is a medium \n \t \t sized fish and poisonous to people!') :-
       pokey(Scales), medium(Length, Width), venom(Venom), Water = 1.

choose(Scales, Length, Width, Venom, Water, 'Blue Tang Fish \n \t \t The Blue Tang Fish has a very smooth scale texture. It is a \n \t \t smaller sized fish and poisonous to people!') :-
       smooth(Scales), small(Length, Width), venom(Venom), Water = 1.

choose(Scales, Length, Width, Venom, Water, 'Lamprey \n \t \t The Lamprey is a very smooth,  medium sized fish.\n\t\t  It is not Poisonous.') :-
       smooth(Scales), medium(Length, Width), nonvenom(Vemon), Water = 0.

choose(Scales, Length, Width, Venom, Water, 'Cat Fish \n \t \t The Cat Fish is very smooth and grow to be a large sized fish.\n\t\t  It is not Poisonous.') :-
       smooth(Scales), large(Length, Width), nonvenom(Vemon), Water = 0.

choose(Scales, Length, Width, Venom, Water, 'Sting Ray \n \t \t The Sting Ray is a smooth, extra large fish. They have stinger that is \n \t \t poisonous to humans if were stung in vital organs! ~rip steve irwin:( ') :-
       smooth(Scales), xlarge(Length, Width), venom(Venom), Water = 1.

choose(Scales, Length, Width, Venom, Water, 'Iridescent Shark \n \t \t The Iridescent Shark is a very smooth, extra large sized fish.\n\t\t It is not Poisonous.') :-
       smooth(Scales), xlarge(Length, Width), nonvenom(Vemon), Water = 1.

choose(Scales, Length, Width, Venom, Water,'Beta Fish \n \t \t The Beta Fish is a scaley, small sized fish. It is not Poisonous.') :-
       scaley(Scales), small(Length, Width), nonvenom(Vemon), Water = 0.

choose(Scales, Length, Width, Venom, Water, 'Rainbow Fish \n \t \t The Rainbow Fish is a scaley, medium sized fish. It is not Poisonous.') :-
       scaley(Scales), medium(Length, Width), nonvenom(Vemon), Water = 1.

choose(Scales, Length, Width, Venom, Water, 'Box Fish \n \t \t The Box Fish is a scaley, medium sized fish. It is poisonous \n \t \t to humans!') :-
       scaley(Scales), medium(Length, Width), venom(Venom), Water = 1.

choose(Scales, Length, Width, Venom, Water, 'Koi Fish \n \t \t The Koi Fish is a scaley, large sized fish. It is not Poisonous.') :-
       scaley(Scales), large(Length, Width), nonvenom(Vemon), Water = 0.

choose(Scales, Length, Width, Venom, Water, 'Dorado \n \t \t The Dorado is a scaley, extra large sized fish. It is not Poisonous.') :-
       scaley(Scales), xlarge(Length, Width), nonvenom(Vemon), Water = 1.

% default choose if it all fails
choose(Scales, Length, Width, Venom, Water, 'Goldfish \n \t \t Its great for everyone!').


% Definitions and CF
% The CF for these are 100 bc they are defintions
smooth(Scales) :- Scales = smooth.
pokey(Scales) :- Scales = pokey.
scaley(Scales) :- Scales = scaley.

% Rules and CF
% the CF for these rule is 75
small(Length, Width) :- (Length + Width) < 10, (Length + Width) > 1.
medium(Length, Width) :- (Length + Width) < 15, (Length + Width) > 9.
large(Length, Width) :- (Length + Width) < 30, (Length + Width) > 14.
xlarge(Length, Width) :- (Length + Width) > 29.

% The CF for these rule is 75
venom(Venom) :- Venom = 'yes'.
nonvenom(Venom) :- Venom = 'no'.

% The CF for these rule is 75
fresh(Water) :- Water = 0.
salt(Water) :- Water = 1.
