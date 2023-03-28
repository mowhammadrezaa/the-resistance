:- use_module(morse_dict, [morse/2, to_morse/2]).
:- use_module(data, [get_heavy_data/2, get_simple_data/2, get_dummy_data/2, get_example_data/2]).
:- dynamic memo/3.

% Predicate to count the number of different interpretations of a message in Morse code
count_interpretations(Count) :-
%    get_dummy_data(Message, Words),
%    get_simple_data(Message, Words),
    get_example_data(Message, Words),
%    get_heavy_data(Message, Words),
    maplist(to_morse, Words, MorseWords),
    count_sentences(Message, MorseWords, Count).

count_sentences(Message, MorseWords, Count) :-
    memo(Message, MorseWords, Count),
    !.
count_sentences('', _, 1):- !.
count_sentences(Message, MorseWords, Count) :-
    findall(
            C,
            (
                member(MorseWord, MorseWords),
                sub_atom(Message, 0, Len, _, MorseWord),
                sub_atom(Message, Len, _, 0, RemainingMessage),
                count_sentences(RemainingMessage, MorseWords, C)
            ),
            Counts
    ),
    sum_list(Counts, Count),
    assert(memo(Message, MorseWords, Count)).