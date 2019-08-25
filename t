<html>
<head>
<title>Úvod do UNIXu - cvičenie (Ut 14:00 SU2)</title>
<meta charset="UTF-8">
<style>
warn {
	font-weight: bold;
	color: crimson;
	font-size: 25px;
}
pre {
	margin: 0.5em 0;
	padding: 0.3em;
	border: 1px solid grey;
	background-color: ffffaa;
}
pre.hl {
	background-color: black;
	color: white;
	font-size: 16px;
}
pre.hl span.kwb {
	color: #00ffff;
}
pre.hl span.kwc {
	color: #0080ff;
}
pre.hl span.opt {
	color: #ff8000;
}
pre.hl span.num {
	color: #ff80ff;
}
pre.hl span.kwc {
	color: #0080ff;
}
pre.hl span.slc {
	color: #ffaa00;
}
</style>
</head>
<body>

<h1>Úvod do UNIXu - cvičenie (Ut 14:00 SU2)</h1>

<h2>Základné informácie</h2>
<ul>
<li>môj e-mail: kabel <small>ROFL</small> blackhole <small>NAHAHA</small> sk</li>
<li>materiály: kniha <em>Shell v příkladech</em> od Libora Forsta, kniha <em>awk &amp; sed</em> od Helmuta Herolda, internet</li>
<li><a href="http://www.viemu.com/vi-vim-cheat-sheet.gif">vim cheat sheet</a></li>
</ul>

<warn>Pošlite mi návrh na tému zápočťaku (najneskôr do 14.05.2019) <a href="zapoctaky.html">(návrhy na témy)</a></warn>

<h2><a href="du6.html">Domáca úloha 6 (do 14.05.2019)</a></h2>
<h2><a href="du5.awk">Domáca úloha 5 (do 07.05.2019)</a></h2>
<h4><a href="du4.sed">Domáca úloha 4 (do 09.04.2019)</a></h4>
<h4><a href="du3.html">Domáca úloha 3 (do 09.04.2019)</a></h2>
<h4><a href="du2.html">Domáca úloha 2 (do 19.03.2019)</a></h2>
<h4><a href="du1.html">Domáca úloha 1 (do 12.03.2019)</a></h2>
<h2><a href="vysledky.html">Výsledky domácich úloh</a></h2>

<h4><a href="github.html">Stručný návod na GitHub</a></h2>

<warn>Chyby v domácich úlohách vám pošlem e-mailom, aby ste ich opravili (aj po deadline).</warn>

<h2>Požiadavky na zápočet</h2>

Zápočet dostanú tí študenti, ktorí ma presvedčia, že sú schopní spraviť skúšku na prvý pokus.
Presvedčiť ma môžete <strong>získaním dostatočného počtu bodov z domácich úloh a napísaním zápočtového programu
alebo</strong> alternatívne (ak nechcete chodiť na cvičenia)
<strong>napísaním ťažkej písomky na jednom z cvičení (skúška style)</strong>. V tomto prípade mi aspoň týždeň
dopredu napíšte, že chcete pripraviť takúto písomku.

<h3>Témy zápočtových programov</h3>

Popis vhodných tém na zápočtové programy má na svojej <a href="http://e-x-a.org/mff/unix18/">stránke</a> Mirek Kratochvíl.

<h2>1. cvičenie (19.02.2019)</h2>

<ul>
<li>základné informácie, pozorovanie terminálu, klávesové skratky (CTRL+C, CTRL+K, CTRL+L, CTRK+A, CTRL+E)</li>
<li>ssh prístup na linuxové počítače v Rotunde<pre>ssh <em>username</em>@u-pl<em>N</em>.ms.mff.cuni.cz     <em>(N = 0 ... 37)</em></pre></li>
<li>alternatívne skrz <a href="putty.html">PuTTY</a></li>
<li>základná práca s adresármi a súbormi (príkazy <code>cd</code>, <code>ls</code>, <code>mkdir</code>, <code>rmdir</code>,
<code>touch</code>, <code>cat</code>, <code>echo</code>)</li>
<li>použitie prepínača <code>--help</code> a čítanie manuálových stránok (príkaz <code>man</code>)</li>
<li>stručný úvod pre <code>git</code></li>
</ul>

<h2>2. cvičenie (26.02.2018)</h2>

<ul>
<li>expanzia: <code>*</code>, <code>?</code>, <code>~</code>, <code>[[:upper:]]</code>, <code>[[:lower:]]</code>, <code>[zoznam]</code>, <code>[!zoznam]</code></li>
<li>skryté súbory (s prvým znakom názvu <code>.</code> (bodka))</li>
<li>potlačenie špeciálnych znakov (aj medzery) backslashom</li>
<li>Midnight Commander (príkaz <code>mc</code>) a jeho editor súborov (pozor, toto nie je štandardný unixový program!)</li>
<li>základná práca s editorom <code>vi</code>, ktorý by ste mali vedieť používať aspoň na úrovni schopností Notepadu
(<code>vi <em>súbor</em></code>, insert mód <code>[i]</code> a normal mód <code>[esc]</code>, <code>:w</code>, <code>:q</code>, <code>:wq</code>),
<a href="http://www.viemu.com/vi-vim-cheat-sheet.gif">vim cheat sheet</a></li>
<li>adresár <code>/tmp</code>, do ktorého ukladáme dočasné súbory (keď ich už nepotrebujeme, mali by sme ich zmazať)</li>
<li>prvé shellové skritpy, <a href="https://en.wikipedia.org/wiki/Shebang_(Unix)">shebang</a> (čo je interpreter?)</li>
<li>premenná <code>PATH</code>, skripty v <code>~/bin</code></li>
<li>premenné, špeciálne premenné
<pre>
var1=ahoj
echo $var1
echo A${var1}B
echo &quot;$var1&quot;

# náhodné čísla
echo $RANDOM
echo $RANDOM
echo $RANDOM
</pre>
</li>
<li>vstupné argumenty, príkaz <code>shift</code>
<pre>
# prvý argument
echo &quot;$1&quot;

# druhý, tretí, štvrtý argument
echo &quot;$2&quot; &quot;$3&quot; &quot;$4&quot;

# vymaž prvé tri argumenty
shift 3

# vypíš štvrtý argument (prvé 3 sú vymazané, takže $1)
echo &quot;$1&quot;
</pre>
</li>
<li>exit kód programu, premenná <code>$?</code>
<pre>
ls /
echo $?   # toto by malo vypisat 0
ls /NEEXISTUJUCI
echo $?   # toto by malo vypisat 1 (nastala chyba)

exit 0
</li>
<li>príkaz <code>test</code>, respektíve <code>[</code>, pozri manuálovú stránku <code>man test</code>
<pre>
# porovnávanie veľkosti čísel: greater than, less than, greater or equal, less or equal, equal
test 3 -gt 4
test $1 -le 5
[ 5 -eq 5 ]

# negácia !
[ ! 5 -eq $1 ]

# existencia súboru
[ -e "/cesta_k_suboru ]

# je súbor adresár?

[ -d "$directory" ]

# je súbor spustiteľný?

[ -x "$file" ]
</pre>
</li>
</ul>

<h2>3. cvičenie (05.03.2018)</h2>

<ul>
<li>ešte raz krátko <code>git</code> a ukážeme si <code>ssh</code> a <code>scp</code></li>
<li>motivácia: chceli by sme naprogramovať HTTP server (príklad FTP server, mc)</li>
<li>príkaz <code>true</code>, ktorý hneď skončí s exit kódom 0, a <code>false</code>, ktorý hneď skončí s exit kódom 1</li>
<li>podmienka <code>if</code>
<pre>
if true; then
    echo True
else
    echo False
fi

if [ &quot;$1&quot; == &quot;test&quot; ]; then
    echo &quot;Prvy argument je test&quot;
    ls /
elif [ &quot;$1&quot; == &quot;lol&quot; ]; then
    echo &quot;Prvy argument je lol&quot;
    ls /tmp
fi
</pre>
</li>
<li>cyklus <code>for</code>, premenná <code>&quot;$@&quot;</code>
<pre>
for premenna in <em>zoznam</em>; do
    echo &quot;$premenna&quot;
done

for i in 1 2 3; do
    echo $i
done

for arg in &quot;$@&quot;; do
    echo &quot;$arg&quot;
done
</pre>
</li>
<li>práca s výstupom príkazu, uloženie výstupu do premennej
<pre>
premenna=`prikaz`
echo $premenna

sucet=`expr $1 + $2`
echo $sucet

echo sucin je `expr $1 * $2`

for subor in `find /tmp -type f`; do
    echo Subor "$f"
done
</pre>
</li>
<li>Operátory <code>&amp;&amp;</code> a <code>||</code>
<pre>
x=7
[ $x -gt 5 ] &amp;&amp; echo "cislo v premennej x je vacsie ako 5"
[ $x -gt 5 ] || echo "cislo v premennej x NIE je vacsie ako 5"

if true &amp;&amp; false; then
    echo "toto sa nevypise"
fi
</pre>
</li>
<li>Cyklus <code>while</code>
<pre>
while true; do
    echo "nekonecna slucka"
done
</pre>
</li>
<li>Matematické výrazy <code>$((<em>výraz</em>))</code>, príkaz <code>expr</code>
<pre>
x=4
y=5
echo $(($x+$y*100))
</pre>
</li>
<li>Funkcie, lokálne premenné
<pre>
funkcia() {
    local lokalna_premenna
    lokalna_premenna=3

    echo $1
    return 0
}

funkcia ahoj

gcd() {
    local a b
    a=$1
    b=$2
    while [ $a -ne $b ]; do
	if [ $a -gt $b ]; then
	    a=$(($a - $b))
	elif [ $a -lt $b ]; then
	    b=$(($b - $a))
	fi
    done
    echo $a
    return 0
}
</pre>
</li>
<li>Príkaz <code>continue</code> pre skok na ďalšiu iteráciu cyklu, <code>break</code> pre vyskočenie z cyklu</li>
<li>Príkaz <code>seq</code></li>
<li>Sémantika obyčajných zátvoriek <code>(</code> a <code>)</code>
<pre>
a=3
( echo $a; a=4; echo $a )
echo $a

# vypíše sa
3
4
3
</pre>
</li>
</ul>

<h2>4. cvičenie (12.03.2018)</h2>

<ul>
<li>Expanzia <code>{x..y}</code> a <code>{x..y..z}</code></li>
<li>Test <code>[</code> vs. <code>[[</code>
<pre>
time for ((i=0;i<1000000;++i)); do [ 3 -eq 4 ]; done
time for ((i=0;i<1000000;++i)); do [[ 3 -eq 4 ]]; done
</pre>
</li>
<li>Čo je zaujímave v <code>man bash</code></li>
<li><code>.bashrc</code> a <code>.bash_profile</code></li>
<li>Shell aliasy</li>
<li>Poradie vyhľadávania príkazu (aliasy, funkcie, built-in funkcie, binárky)</li>
<li>Prístupové práva a <code>chmod</code></li>
<li><code>cp</code>, <code>mv</code>, <code>rm</code></li>
<li><code>cat</code>, <code>tac</code></li>
<li><code>head</code>, <code>tail</code>, <code>nl</code>, <code>wc</code>, <code>tee</code></li>
<li><code>cut</code>, <code>paste</code>, <code>split</code>, <code>tr</code></li>
<li><code>date</code> a jeho formátovanie, použitie napríklad v logoch</li>
<li>vlastná implementácia <code>nl</code> (neekvivalentná s <code>nl</code>, originál nepočíta prázdne riadky)
<pre>
moj_nl() {
	seq 1 `wc -l <"$1"` >/tmp/docasny
	paste /tmp/docasny "$1"
	rm /tmp/docasny
}
</pre>
</li>
</ul>

<h2>5. cvičenie (19.03.2018)</h2>

<ul>
<li>Ešte k <code>ssh</code>: <code>authorized_keys</code> a trochu o tom
<a href="http://wiki.ms.mff.cuni.cz/wiki/laborato%C5%99_UNIX">ako to funguje v Rotunde</a>, prečo v domovskom adresári
nefunguje <code>chmod</code>, miesto toho <code>fs setacl</code></li>
<li>pomenované rúry (fifo), súborové deskriptory a obyčajné rúry (pipe)<br>
<pre class="hl">
<span class="hl slc"># otvorenie súboru <em>subor.txt</em> do file descriptoru <em>M</em> na zapisovanie (<em>subor.txt</em> sa prepíše):</span>
<span class="hl kwc">prikaz</span> arg1 arg2 arg3 <span class="hl num"><em>M</em></span><span class="hl opt">&gt;</span>subor.txt

<span class="hl slc"># otvorenie súboru <em>subor.txt</em> do file descriptoru <em>M</em> na appendovanie (píše sa na koniec súboru):</span>
<span class="hl kwc">prikaz</span> arg1 arg2 arg3 <span class="hl num"><em>M</em></span><span class="hl opt">&gt;&gt;</span>subor.txt

<span class="hl slc"># ak číslo <em>M</em> vynecháme, implicitne sa dosadí <em>M</em>=1 (štandardný výstup):</span>
<span class="hl kwc">prikaz</span> arg1 arg2 arg3 <span class="hl opt">&gt;</span>subor.txt

<span class="hl slc"># otvorenie súboru <em>subor.txt</em> do file descriptoru <em>M</em> na čítanie:</span>
<span class="hl kwc">prikaz</span> arg1 arg2 arg3 <span class="hl num"><em>M</em></span><span class="hl opt">&lt;</span>subor.txt

<span class="hl slc"># ak číslo <em>M</em> vynecháme, implicitne sa dosadí <em>M</em>=0 (štandardný vstup):</span>
<span class="hl kwc">prikaz</span> arg1 arg2 arg3 <span class="hl opt">&lt;</span>subor.txt

<span class="hl slc"># presmerovanie jedného file descriptoru (<em>M</em>) do iného (<em>N</em>) (na zapisovanie):</span>
<span class="hl kwc">prikaz</span> arg1 arg2 arg3 <span class="hl num"><em>M</em></span><span class="hl opt">&gt;&amp;</span><span class="hl num">N</span>
<span class="hl slc"># a na čítanie</span>
<span class="hl kwc">prikaz</span> arg1 arg2 arg3 <span class="hl num"><em>M</em></span><span class="hl opt">&lt;&amp;</span><span class="hl num">N</span>

<span class="hl slc"># POZOR               |TOTO UŽ NIE SÚ ARGUMENTY|</span>
<span class="hl slc">#                     |AKO arg1 arg2 arg3      |</span>
<span class="hl kwc">prikaz</span> arg1 arg2 arg3  <span class="hl num"><em>2</em></span><span class="hl opt">&gt;&amp;</span><span class="hl num">1</span> <span class="hl opt">&lt;</span>subor.txt <span class="hl num"><em>3</em></span><span class="hl opt">&gt;&amp;</span><span class="hl num">2</span>

<span class="hl slc"># príklad: štandardný výstup do /dev/null:</span>
<span class="hl kwb">echo</span> text <span class="hl opt">&gt;/</span>dev<span class="hl opt">/</span>null
<span class="hl slc"># príklad: vstup zo subor.txt, chybový výstup do štandarndého výstupu:</span>
<span class="hl kwc">head</span> <span class="hl kwb">-n</span> <span class="hl num">10</span> <span class="hl opt">&lt;</span>subor.txt <span class="hl num">2</span><span class="hl opt">&gt;&amp;</span><span class="hl num">1</span>
</pre></li>
<li>vysvetlili sme si  čo je to terminál (historicky), a čo je emulátor terminálu</li>
<li><a href="control_seq.html">kontrolné sekvencie a farby</a></li>
<li>príkaz <code>wget</code></li>
<li><code>tar</code>, <code>gz</code>, <code>bz2</code>, <code>xz</code></li>
</ul>

<h2>6. cvičenie (26.03.2018)</h2>

<ul>
<li><code>grep</code> a regulárne výrazy</li>
<li>grepovali sme na básničke <a href="raven.txt">Raven</a></li>
</ul>

<h2>7. cvičenie (02.04.2018)</h2>

<ul>
<li>pokračovanie <code>grep</code> a substitučný príkaz programu <code>sed</code></li>
<li>programovanie v <code>sed</code></li>
</ul>

<h2>8. cvičenie (09.04.2018) </h2>
<ul>
<li><code>find</code></li>
<li><code>sort</code>, <code>uniq</code>, <code>xargs</code></li>
<li><code>diff</code>, <code>comm</code>, <code>patch</code></li>
<li><code>more</code>, <code>less</code></li>
<li><code>printf</code></li>
<li>Príkaz <code>read</code>, premenná <code>IFS</code> (ovplyvňuje <code>read</code>, ale aj <code>for</code> cyklus)</li>
</ul>

<h2>9. cvičenie (16.04.2018)</h2>

<ul>
<li>naprogramovali sme <a href="http_server.sh">jednoduchý HTTP server v shelli</a></li>
</ul>

<h2>10. cvičenie (23.04.2018)</h2>

<ul>
<li>programovali sme v <code>awk</code>, ukázali sme si základnú syntax, vysvetlili spracovávanie záznamov<br>
sémantiku premenných <code>RS</code> (record separator), <code>FS</code> (field separator), <code>OFS</code> (output field separator), atď.</li>
<li>Príklad: Napíšte awk skript, ktorý pracuje so vstupom vo formáte <a href="https://cs.wikipedia.org/wiki/CSV">CSV</a> (jeden riadok = jeden záznam, polia v zázname oddelené čiarkami, v každom
zázname rovnaký počet polí).<br>
Prvý riadok obsahuje hlavičku (názvy stĺpcov), prvý stĺpec obsahuje názov riadku. V ďalších stĺpcoch sú čísla.<br>
Vašou úlohou je vypísať upravený vstup, v ktorom bude na koniec pridaný stĺpec s názvom <em>Sucet</em>, ktorý pre
každý riadok s hodnotami bude obsahovať súčet čísel na danom riadku.<br>
Ďalej pridajte riadok s názvom <em>Priemer</em>, ktorého bunky obsahujú priemer hodnôt v stĺpci nad nimi, zaokrúhlený na 3 desatinné miesta<br><br>

Príklad:
<pre>Meno,body1,body2,body3
Hynek,3,12,9
Jarmila,7,34,1
Vilém,8,27,0</pre>
Vystup:
<pre>Meno,body1,body2,body3,Sucet
Hynek,3,12,9,24
Jarmila,7,34,1,42
Vilém,8,27,0,35
Priemer,6,2.333,3.333,33.667</pre>
<a href="sucet_priemer.awk">Pozrieť riešenie</a></li>
</li>
<li><a href="awk-riesene.html">riešené awk príklady zo stránky Petra Kučeru</a></li>
<li>príkazy <code>ps</code> (<code>ps x</code>, <code>ps x -A</code>), <code>top</code>, <code>kill</code>, súborový systém <code>/proc</code></li>
</ul>

<h2>11. cvičenie (30.04.2018)</h2>

<ul>
<li>príkaz <code>join</code> (funguje iba na zotriedené vstupy, musíte predtým použiť <code>sort</code>)</li>
<li>Procesy
<ul>
<li>spustenie procesu v pozadí skrz <code>&amp;</code></li>
<li>premenná <code>$!</code> obsahujúca ID posledného procesu spusteného v pozadí</li>
<li>príkaz <code>wait</code> na čakanie dokončenia niektorého z procesov spustených na pozadí</li>
<li>príkaz <code>kill</code> na posielanie signálov procesom</li>
</ul>
</li>
<li>príkaz <code>trap</code> na nastavovanie akcií ak procesu príde signál (<a href="trap.sh">pozri príklad</a>)</li>
<li><code>Makefile</code> a príkaz <code>make</code></li>
</ul>

<h2>12. cvičenie (07.05.2018)</h2>

<ul>
<li><code>umask</code>, <code>tempfile</code></li>
<li><code>eval</code>, <code>exec</code></li>
<li><code>git format-patch</code>, <code>git send-email</code></li>
<li>posielanie a čítanie mailov, <code>mailx</code></li>
<li><a href="https://dustymabe.com/2013/05/17/easy-getopt-for-a-bash-script/"><code>getopt/getopts</code></a></li>
</ul>

<h2><em>13. cvičenie (14.05.2018) odpadá (rektorský deň)</em></h2>

<h2>14. cvičenie (21.05.2018)</h2>

<ul>
<li>vysvetlili sme si rozdiel medzi symetrickými a asymetrickými šiframi (ukázali príklad asymetrickej: RSA)</li>
<li>ukázali sme si <a href="https://gnupg.org/">GnuPG</a> (príkaz <code>gpg</code>): vytvorenie kľúča, šifrofanie, dešifrovanie, podpisovanie, verifikovanie správ</li>
<li>vysvetlili sme si use-case pre bezpečnú e-mailovú komunikáciu</li>
<li>nainštalovali sme si Debian do VirtualBoxu</li>
<li>ukázali sme si vytvorenie súborového systému na zariadení pomocou <code>mkfs</code> príkazu (<code>mkfs.vfat</code>)</li>
<li>ukázali sme si mountovanie a umountovanie zariadenia do adresára</li>
</ul>

</body>
</html>

