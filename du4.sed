#!/bin/sed -f

:vsechno

s/\([^0-9]*\)0\+ *+ *0\+\([^0-9]*\)/\10\2/g  #vyraz z nulama 

/[0-9] *+ *[0-9]/ {     #pokud radek obsahuje vyraz a+b
  
  h  
 
  #nahradi "text text a+b c+d text" na "a b"
  s/\([0-9]\+\) *+ *\([0-9]\+\)/@\1 \2/
  s/.*@\([0-9]\+\) \([0-9]\+\).*/\1 \2/


  s/\([0-9][0-9]*\) \([0-9]\)/,\1 \2/


  #z ,12 34 se udela 2413,
  :zpet

    #za carkou jsou alespon dve cifry z kazdyho cisla
    s/,\([0-9]*\)\([0-9]\) \([0-9]*\)\([0-9]\)/\2\4,\1 \3/

    #za carkou je treba:   ,55_
    /,[0-9]\+ $/ { s/,\([0-9]\+\) /,\1 0/ }

    #za carkou je treba:   ,_ 55
    /, [0-9]\+$/ {s/, \([0-9]\+\)/,0 \1/ }

  t zpet

  #123, -> 123
  s/\([0-9]*\),/\1/

  s/\([0-9][0-9]\)\([0-9]*\)/,0\1:\2/

  :zp
 
  #nahrazeni cisel za X
  :nah

    s/,\(.*\)1\(.*\):/,\1X\2:/
    s/,\(.*\)2\(.*\):/,\1XX\2:/
    s/,\(.*\)3\(.*\):/,\1XXX\2:/
    s/,\(.*\)4\(.*\):/,\1XXXX\2:/
    s/,\(.*\)5\(.*\):/,\1XXXXX\2:/
    s/,\(.*\)6\(.*\):/,\1XXXXXX\2:/
    s/,\(.*\)7\(.*\):/,\1XXXXXXX\2:/
    s/,\(.*\)8\(.*\):/,\1XXXXXXXX\2:/
    s/,\(.*\)9\(.*\):/,\1XXXXXXXXX\2:/
    s/,\(.*\)0\(.*\):/,\1\2:/
  
  t nah

  #napsani zbytku
  s/,XXXXXXXXXX:/,01:/
  s/,\(X*\)XXXXXXXXXX:/,\11:/  
  s/,\(X\{1,9\}\):/,\10:/       


  s/XXXXXXXXX/9/
  s/XXXXXXXX/8/
  s/XXXXXXX/7/
  s/XXXXXX/6/
  s/XXXXX/5/
  s/XXXX/4/
  s/XXX/3/
  s/XX/2/
  s/X/1/


  #za dvojteckou jsou dalsi cifry a mezi , a : taky
  /:[0-9][0-9]*/ { s/\([0-9]*\),\([0-9]\)\([0-9]\):\([0-9][0-9]\)/\2\1,\3\4:/ }

  #za dvojteckou jsou dalsi cifry a mezi , a : neni cislo (pripad 10+10, 20+10, ... scita se 0+0)
  /,:[0-9]\+/ { s/\([0-9]*\),:\([0-9]\)\([0-9]\)/0\1,0\2\3:/ }

  #za dvojteckou nejsou cifry
  #pred dvojteckou je 1
  /1:[^0-9]/ { s/\([0-9]*\),\([0-9]\)1:/1\2\1/ }

  #pred dvojteckou je 0
  /0:[^0-9]/ { s/\([0-9]*\),\([0-9]\)0:/\2\1/ }

  t zp
           
  #ulozny = cely radek, hlavni = spocetny vyraz
  s/[0-9]*/&,/ 
  #pripojim hlavni k uloznymu
  G 
  #odstranim novy radek, nejak se tam vyskytl
  s/\n//g 
  #nahradim prvni vyskyt a+b za vysledek
  s/\([0-9]\+ *+ *[0-9]\+\)/@\1/
  s/\([0-9]*\),\(.*\)@[0-9]\+ *+ *[0-9]\+/\2\1/  
  #odstranim mezeru na zacatku, nejak se tam vyskytla
  s/^ //

}

t vsechno

