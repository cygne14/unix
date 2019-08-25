<html>
<head>
<title>Domáca úloha 2 - Úvod do UNIXu - cvičenie (Ut 14:00 SU2)</title>
<meta charset="UTF-8">
<style>
warn {
	font-weight: bold;
	color: crimson;
	font-size: 25px;
}
qq {
	color: #c46200;
	font-weight: bold;
}
pre {
	margin: 0.5em 0;
	padding: 0.3em;
	font-size: 16px;
	background-color: black;
	color: white;
}
pre bl {
	color: blue;
	font-weight: bold;
}
pre l {
	color: lime;
	font-weight: bold;
}
pre m {
	color: #ff00ff;
	font-weight: bold;
}
</style>
</head>
<body>

<h1>Domáca úloha 2 (do 19.03.2019)</h1>

<h2>Prvá časť</h2>

Vo svojom repozitári vytvorte textový súbor uloha02.txt, v ktorom odpoviete na nasledujúce<br>
otázky. Potom ho pushnite na GitHub.

<ol>
<li>Vyskúšajte si znovu príkaz <code>shift</code>, tentokrát vo funkcii
<pre>
testshift() {
    echo "argumenty: $@"
    echo

    echo "posun o 1"
    shift
    echo "argumenty: $@"
    echo

    echo "posun o 2"
    shift 2
    echo "argumenty: $@"
    echo

    echo "posun o 3"
    shift 3
    echo "argumenty: $@"
}

testshift a b c d e
</pre>
<qq>Prečo posledný <code>shift</code> v tomto prípade (<code>testshift a b c d e</code>) žiadne argumenty nezahodil?</qq>
</li>
<li>Pohrajte sa s nasledujúcimi funkciami:
<pre>
f1() { echo $#; shift; echo $#; }
f2() { local i; i=abcde; echo ${#1} ${#2} ${#i}; }

# tejto funkcii zadajte viac argumentov, prvy argument ciselny
# f3() { echo ${!$1}; }    chybne zadanie, upravene 11.03.2019 na nasledujuci riadok
f3() { echo ${!1}; }

f4() { echo ${1:-abc}; echo $1; }
f5() { echo ${1:4}; }
f6() { echo ${1:4:2}; }

# f7 a f8 zavolajte s argumentami: mamama miamia
f7() { echo ${1/a/B} ${@/a/B}; }
f8() { echo ${1//a/B} ${@//a/B}; }
</pre>
<qq>Čo robí premenná <code>$#</code>? A zápis <code>${#premenna}</code>? A čo <code>${!premenna}</code>?
A čo výraz <code>${premenna:-vyraz}</code>?<br>
A <code>${premenna:cislo}</code> a <code>${premenna:cislo:cislo}</code>?<br>
Čo robí zápis <code>${premenna/vyraz/text}</code> a čo <code>${premenna//vyraz/text}</code>?<br>
Može hocikde byť ako <code>premenna</code> použítý <code>@</code>, tak ako v <code>f7</code> a <code>f8</code>?
</qq>
</li>
</ol>


<h2>Druhá časť</h2>

Vo svojom repozitári vytvorte skript <code>uloha02.sh</code>, ktorý bude splňovať nasledujúce body, a potom
ho pushnite na GitHub.

<ol>
<li>Program vždy skončí s exit-kódom 0</li>
<li>Ak prvý argument skriptu je <code>--normal</code>, skript vypíše všetky argumenty (vrátane <code>--normal</code>), každý arugment
na jeden riadok.</li>
<li>Ak prvý argument skriptu je <code>--reverse</code>, skript vypíše argumenty v opačnom poradí, ako sú na vstupe, každý na jeden
riadok.</li>
<li>Ak prvý argument skriptu je <code>--subst</code>, druhý je nejaký reťazec <em>A</em> a tretí reťazec <em>B</em>,
skript v každom argumente vymení všetky výskyty <em>A</em> na <em>B</em> a vypíše ich, každý na jeden riadok.</li>
<li>Ak prvý argument skriptu je <code>--len</code>, skript vypíše na jeden riadok dĺžky všetkých argumentov, oddelený medzerami.</li>
<li>Ak prvý argument skriptu je <code>--help</code>, vypíšte návod na použitie tohto programu.</li>
</ol>

Príklad:
<pre>
<l>behunm@u-pl10</l> <m>~ $</m> ./uloha02.sh --normal "a b" "c d e" f
--normal
a b
c d e
f
<l>behunm@u-pl10</l> <m>~ $</m> ./uloha02.sh --reverse "a b" "c d e" f
f
c d e
a b
--reverse
<l>behunm@u-pl10</l> <m>~ $</m> ./uloha02.sh --subst lol rofl trololololo ahoj LOL lol
trorofloroflo
ahoj
LOL
rofl
<l>behunm@u-pl10</l> <m>~ $</m> ./uloha02.sh --len lol rofl trololololo ahoj LOL lol
5 3 4 11 4 3 3
<l>behunm@u-pl10</l> <m>~ $</m> ./uloha02.sh --help
Pouzitie: uloha02.sh [OPTION] [args]
  --normal	popis...
  --reverse	popis...
  ...
</pre>

</body>
</html>
