:- module(morse_dict, [morse/2, to_morse/2]).

% Morse code dictionary
morse(a, ".-").
morse(b, "-...").
morse(c, "-.-.").
morse(d, "-..").
morse(e, ".").
morse(f, "..-.").
morse(g, "--.").
morse(h, "....").
morse(i, "..").
morse(j, ".---").
morse(k, "-.-").
morse(l, ".-..").
morse(m, "--").
morse(n, "-.").
morse(o, "---").
morse(p, ".--.").
morse(q, "--.-").
morse(r, ".-.").
morse(s, "...").
morse(t, "-").
morse(u, "..-").
morse(v, "...-").
morse(w, ".--").
morse(x, "-..-").
morse(y, "-.--").
morse(z, "--..").


% Predicate to convert a word to its Morse code representation
to_morse(Word, Morse) :-
    string_chars(Word, Chars),
    maplist(morse, Chars, MorseList),
    atomic_list_concat(MorseList, Morse).