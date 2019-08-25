<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<title>Highlighted source code of /~kabel/unix/du5.awk</title>
<link rel="stylesheet" href="/~kabel/highlight.css" type="text/css" media="screen">
</head>
<body>
<div class="head">
<div class="right"><a href="/~kabel/src/highlight.c">source of highlighter</a></div>
<div>
<a href="/~kabel/unix/du5.awk?plain">plain</a>
| <a href="/~kabel/unix/du5.awk?download">download</a>
</div>
</div>
<pre class="hl">
<span class="hl lin" id="l_1">    1 </span><span class="hl slc">#!/usr/bin/awk -f</span>
<span class="hl lin" id="l_2">    2 </span>
<span class="hl lin" id="l_3">    3 </span><span class="hl slc"># Uvod do UNIXu - cvicenie (Ut 14:00 SU2)</span>
<span class="hl lin" id="l_4">    4 </span><span class="hl slc"># Domaca uloha 5 (do 07.05.2019)</span>
<span class="hl lin" id="l_5">    5 </span><span class="hl slc">#</span>
<span class="hl lin" id="l_6">    6 </span><span class="hl slc"># Na 10. cviceni (23.04.2018) sme programovali v awk (pozri stranku cvika).</span>
<span class="hl lin" id="l_7">    7 </span><span class="hl slc">#</span>
<span class="hl lin" id="l_8">    8 </span><span class="hl slc"># Na konci sme si naprogramovali skript, ktory ked dostane ako vstup HTML subor,</span>
<span class="hl lin" id="l_9">    9 </span><span class="hl slc"># snazi sa vypisat URL adresy, na ktore sa vstupny HTML subor odkazuje.</span>
<span class="hl lin" id="l_10">   10 </span><span class="hl slc"># Tento kod (na konci tohto suboru) je nedokonaly, napriklad ak dostane ako</span>
<span class="hl lin" id="l_11">   11 </span><span class="hl slc"># vstupny subor https://blackhole.sk/~kabel/unix/index.html, na vystup vypise</span>
<span class="hl lin" id="l_12">   12 </span><span class="hl slc"># toto:</span>
<span class="hl lin" id="l_13">   13 </span><span class="hl slc">#</span>
<span class="hl lin" id="l_14">   14 </span><span class="hl slc">#</span>
<span class="hl lin" id="l_15">   15 </span><span class="hl slc">#    &quot;http://www.viemu.com/vi-vim-cheat-sheet.gif&quot;&gt;vim</span>
<span class="hl lin" id="l_16">   16 </span><span class="hl slc">#    &quot;du4.sed&quot;&gt;Domáca</span>
<span class="hl lin" id="l_17">   17 </span><span class="hl slc">#    &quot;du3.html&quot;&gt;Domáca</span>
<span class="hl lin" id="l_18">   18 </span><span class="hl slc">#    &quot;du2.html&quot;&gt;Domáca</span>
<span class="hl lin" id="l_19">   19 </span><span class="hl slc">#    &quot;du1.html&quot;&gt;Domáca</span>
<span class="hl lin" id="l_20">   20 </span><span class="hl slc">#    &quot;vysledky.html&quot;&gt;Výsledky</span>
<span class="hl lin" id="l_21">   21 </span><span class="hl slc">#    &quot;github.html&quot;&gt;Stručný</span>
<span class="hl lin" id="l_22">   22 </span><span class="hl slc">#    &quot;http://e-x-a.org/mff/unix18/&quot;&gt;stránke</span>
<span class="hl lin" id="l_23">   23 </span><span class="hl slc">#    &quot;putty.html&quot;&gt;PuTTY</span>
<span class="hl lin" id="l_24">   24 </span><span class="hl slc">#    &quot;http://www.viemu.com/vi-vim-cheat-sheet.gif&quot;&gt;vim</span>
<span class="hl lin" id="l_25">   25 </span><span class="hl slc">#    &quot;https://en.wikipedia.org/wiki/Shebang_(Unix)&quot;&gt;shebang</span>
<span class="hl lin" id="l_26">   26 </span><span class="hl slc">#    &quot;http://wiki.ms.mff.cuni.cz/wiki/laborato%C5%99_UNIX&quot;&gt;ako</span>
<span class="hl lin" id="l_27">   27 </span><span class="hl slc">#    &quot;control_seq.html&quot;&gt;kontrolné</span>
<span class="hl lin" id="l_28">   28 </span><span class="hl slc">#    &quot;raven.txt&quot;&gt;Raven</span>
<span class="hl lin" id="l_29">   29 </span><span class="hl slc">#    &quot;http_server.sh&quot;&gt;jednoduchý</span>
<span class="hl lin" id="l_30">   30 </span><span class="hl slc">#    &quot;https://cs.wikipedia.org/wiki/CSV&quot;&gt;CSV</span>
<span class="hl lin" id="l_31">   31 </span><span class="hl slc">#    &quot;sucet_priemer.awk&quot;&gt;Pozrieť</span>
<span class="hl lin" id="l_32">   32 </span><span class="hl slc">#    &quot;awk-riesene.html&quot;&gt;riešené</span>
<span class="hl lin" id="l_33">   33 </span><span class="hl slc">#</span>
<span class="hl lin" id="l_34">   34 </span><span class="hl slc">#</span>
<span class="hl lin" id="l_35">   35 </span><span class="hl slc"># Vasou ulohou je prepisat, alebo odznova napisat awk skript, ktory takyto</span>
<span class="hl lin" id="l_36">   36 </span><span class="hl slc"># vycuc URL adries, na ktore sa HTML subor odkazuje v &lt;a&gt; tagoch, urobi lepsie.</span>
<span class="hl lin" id="l_37">   37 </span><span class="hl slc">#</span>
<span class="hl lin" id="l_38">   38 </span><span class="hl slc"># Ako vzdy odporucam man awk.</span>
<span class="hl lin" id="l_39">   39 </span><span class="hl slc">#</span>
<span class="hl lin" id="l_40">   40 </span><span class="hl slc"># Tato uloha samozrejme nejde riesit dokonale, ledazeby ste implementovali</span>
<span class="hl lin" id="l_41">   41 </span><span class="hl slc"># uplny parser HTML, popripade aj JavaScript.</span>
<span class="hl lin" id="l_42">   42 </span><span class="hl slc"># Vasou ulohou nie je urobit dokonalne riesenie. Nemusite riesit HTML komentare,</span>
<span class="hl lin" id="l_43">   43 </span><span class="hl slc"># takze ak je nejaky odkaz skryty v komentarovom tagu &lt;!-- ... --&gt;, a vy</span>
<span class="hl lin" id="l_44">   44 </span><span class="hl slc"># ho vypisete, nie je to chyba. Taktiez nemusite riesit chybne HTML subory.</span>
<span class="hl lin" id="l_45">   45 </span><span class="hl slc"># A samozrejme nemusite riesit JavaScript.</span>
<span class="hl lin" id="l_46">   46 </span><span class="hl slc">#</span>
<span class="hl lin" id="l_47">   47 </span><span class="hl slc"># Co teda vas skript musi podporovat?</span>
<span class="hl lin" id="l_48">   48 </span><span class="hl slc">#</span>
<span class="hl lin" id="l_49">   49 </span><span class="hl slc">#   1. Ak je dany odkaz v uvodzovkach &quot; alebo &apos;</span>
<span class="hl lin" id="l_50">   50 </span><span class="hl slc">#         &lt;a href=&quot;odkaz&quot;&gt;</span>
<span class="hl lin" id="l_51">   51 </span><span class="hl slc">#         &lt;a href=&apos;odkaz&apos;&gt;</span>
<span class="hl lin" id="l_52">   52 </span><span class="hl slc">#      vypisete ho bez uvodzoviek</span>
<span class="hl lin" id="l_53">   53 </span><span class="hl slc">#         odkaz</span>
<span class="hl lin" id="l_54">   54 </span><span class="hl slc">#</span>
<span class="hl lin" id="l_55">   55 </span><span class="hl slc">#   2. Ak odkaz obsahuje medzeru a je v uvodzovkach, vypisete ho aj s medzerou</span>
<span class="hl lin" id="l_56">   56 </span><span class="hl slc">#         &lt;a href=&quot;odkaz s medzerami&quot;&gt;</span>
<span class="hl lin" id="l_57">   57 </span><span class="hl slc">#      vypise</span>
<span class="hl lin" id="l_58">   58 </span><span class="hl slc">#         odkaz s medzerami</span>
<span class="hl lin" id="l_59">   59 </span><span class="hl slc">#</span>
<span class="hl lin" id="l_60">   60 </span><span class="hl slc">#   3. Pred a za znakom = mozu byt medzery alebo znaky prechodu na novy riadok</span>
<span class="hl lin" id="l_61">   61 </span><span class="hl slc">#      Taktiez mozu byt prazdne znaky medzi zaciatkom tagu a atributom href</span>
<span class="hl lin" id="l_62">   62 </span><span class="hl slc">#         &lt;a href = &quot;odkaz&quot;&gt;</span>
<span class="hl lin" id="l_63">   63 </span><span class="hl slc">#         &lt;a href</span>
<span class="hl lin" id="l_64">   64 </span><span class="hl slc">#             =</span>
<span class="hl lin" id="l_65">   65 </span><span class="hl slc">#           &quot;odkaz&quot;&gt;</span>
<span class="hl lin" id="l_66">   66 </span><span class="hl slc">#         &lt;a</span>
<span class="hl lin" id="l_67">   67 </span><span class="hl slc">#          href=&quot;odkaz&quot;&gt;</span>
<span class="hl lin" id="l_68">   68 </span><span class="hl slc">#      stale vypise</span>
<span class="hl lin" id="l_69">   69 </span><span class="hl slc">#         odkaz</span>
<span class="hl lin" id="l_70">   70 </span><span class="hl slc">#</span>
<span class="hl lin" id="l_71">   71 </span><span class="hl slc">#   4. Ak odkaz nie je oddeleny uvodzovkami, musi nasledovat hned za znakom =</span>
<span class="hl lin" id="l_72">   72 </span><span class="hl slc">#      a nesmie obsahovat medzeru</span>
<span class="hl lin" id="l_73">   73 </span><span class="hl slc">#         &lt;a href    =odkaz&gt;</span>
<span class="hl lin" id="l_74">   74 </span><span class="hl slc">#      vypise</span>
<span class="hl lin" id="l_75">   75 </span><span class="hl slc">#         odkaz</span>
<span class="hl lin" id="l_76">   76 </span><span class="hl slc">#</span>
<span class="hl lin" id="l_77">   77 </span><span class="hl slc">#   5. Nerozlisujte male a velke pismena v nazvoch tagov a atributov</span>
<span class="hl lin" id="l_78">   78 </span><span class="hl slc">#         &lt;A hrEF=&quot;odkaz&quot;&gt;</span>
<span class="hl lin" id="l_79">   79 </span><span class="hl slc">#      stale vypise</span>
<span class="hl lin" id="l_80">   80 </span><span class="hl slc">#         odkaz</span>
<span class="hl lin" id="l_81">   81 </span><span class="hl slc">#</span>
<span class="hl lin" id="l_82">   82 </span><span class="hl slc">#   6. Medzi zaciatkom tagu a atributom href mozu byt ine atributy</span>
<span class="hl lin" id="l_83">   83 </span><span class="hl slc">#         &lt;a style=&quot;...&quot; href=&quot;odkaz&quot;&gt;</span>
<span class="hl lin" id="l_84">   84 </span><span class="hl slc">#      stale vypise</span>
<span class="hl lin" id="l_85">   85 </span><span class="hl slc">#         odkaz</span>
<span class="hl lin" id="l_86">   86 </span><span class="hl slc">#</span>
<span class="hl lin" id="l_87">   87 </span><span class="hl slc">#   7. Ak odkaz obsahuje specialne sekvencie</span>
<span class="hl lin" id="l_88">   88 </span><span class="hl slc">#         &amp;quot;</span>
<span class="hl lin" id="l_89">   89 </span><span class="hl slc">#         &amp;lt;</span>
<span class="hl lin" id="l_90">   90 </span><span class="hl slc">#         &amp;gt;</span>
<span class="hl lin" id="l_91">   91 </span><span class="hl slc">#         &amp;amp;</span>
<span class="hl lin" id="l_92">   92 </span><span class="hl slc">#      zmenite ich za prislusne znaky, ktore reprezentuju:</span>
<span class="hl lin" id="l_93">   93 </span><span class="hl slc">#         &quot; &lt; &gt; &amp;</span>
<span class="hl lin" id="l_94">   94 </span><span class="hl slc">#      Priklad:</span>
<span class="hl lin" id="l_95">   95 </span><span class="hl slc">#         &lt;a href=&quot;sialeny &amp;lt;odkaz&amp;gt; &amp;amp;amp; lol &amp;quot;&quot;&gt;</span>
<span class="hl lin" id="l_96">   96 </span><span class="hl slc">#      vypise</span>
<span class="hl lin" id="l_97">   97 </span><span class="hl slc">#         sialeny &lt;odkaz&gt; &amp;amp; lol &quot;</span>
<span class="hl lin" id="l_98">   98 </span><span class="hl slc">#      Na takuto substituciu pouzite funkciu gsub, precitajte si ako presne</span>
<span class="hl lin" id="l_99">   99 </span><span class="hl slc">#      funguje v man awk.</span>
<span class="hl lin" id="l_100">  100 </span>
<span class="hl lin" id="l_101">  101 </span><span class="hl kwa">BEGIN</span> <span class="hl opt">{</span>
<span class="hl lin" id="l_102">  102 </span>        <span class="hl slc"># nastavime separator zaznamov na znak &lt;</span>
<span class="hl lin" id="l_103">  103 </span>        <span class="hl kwb">RS</span>=<span class="hl str">&quot;&lt;&quot;</span>
<span class="hl lin" id="l_104">  104 </span><span class="hl opt">}</span>
<span class="hl lin" id="l_105">  105 </span>
<span class="hl lin" id="l_106">  106 </span><span class="hl slc"># nasledujuce prikazy sa vykonaju pre zaznamy, ktore matchuju dany regularny</span>
<span class="hl lin" id="l_107">  107 </span><span class="hl slc"># vyraz (zacinaju na &quot;A &quot; alebo &quot;a &quot;)</span>
<span class="hl lin" id="l_108">  108 </span><span class="hl opt">/</span>^<span class="hl opt">[</span>Aa<span class="hl opt">] / {</span>
<span class="hl lin" id="l_109">  109 </span>        <span class="hl kwa">for</span> <span class="hl opt">(</span>i = <span class="hl num">2</span><span class="hl opt">;</span> i <span class="hl opt">&lt;</span>= <span class="hl kwb">NF</span><span class="hl opt">; ++</span>i<span class="hl opt">) {</span>
<span class="hl lin" id="l_110">  110 </span>                <span class="hl kwa">if</span> <span class="hl opt">(</span>$i ~ <span class="hl opt">/</span>^href=<span class="hl opt">/) {</span>
<span class="hl lin" id="l_111">  111 </span>                        l = <span class="hl kwa">substr</span><span class="hl opt">(</span>$i<span class="hl opt">,</span> <span class="hl num">6</span><span class="hl opt">)</span>
<span class="hl lin" id="l_112">  112 </span>                        <span class="hl kwa">gsub</span><span class="hl opt">(</span><span class="hl str">&quot;&amp;quot;&quot;</span><span class="hl opt">,</span> <span class="hl str">&quot;</span><span class="hl esc">\&quot;</span><span class="hl str">&quot;</span><span class="hl opt">,</span> l<span class="hl opt">)</span>
<span class="hl lin" id="l_113">  113 </span>                        <span class="hl kwa">gsub</span><span class="hl opt">(</span><span class="hl str">&quot;&amp;lt;&quot;</span><span class="hl opt">,</span> <span class="hl str">&quot;&lt;&quot;</span><span class="hl opt">,</span> l<span class="hl opt">)</span>
<span class="hl lin" id="l_114">  114 </span>                        <span class="hl kwa">gsub</span><span class="hl opt">(</span><span class="hl str">&quot;&amp;gt;&quot;</span><span class="hl opt">,</span> <span class="hl str">&quot;&gt;&quot;</span><span class="hl opt">,</span> l<span class="hl opt">)</span>
<span class="hl lin" id="l_115">  115 </span>                        <span class="hl kwa">print</span> l
<span class="hl lin" id="l_116">  116 </span>                <span class="hl opt">}</span>
<span class="hl lin" id="l_117">  117 </span>        <span class="hl opt">}</span>
<span class="hl lin" id="l_118">  118 </span><span class="hl opt">}</span>
<span class="hl lin" id="l_119">  119 </span>
</pre>
</body>
</html>

