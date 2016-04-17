use <configuration/bocnice.scad>

use <configuration/otvory.scad>
use <configuration/plbase.scad>
include <configuration/manufactury_conf.scad>
include <configuration.scad>
include <configuration/otvory_conf.scad>

upravena_bocnice();

//Slouzi pro vytvoreni vlastnich celicek dle potreby

//Vytvoreni predniho celicka krabicky
//--------------------------------------------------------
module upravena_bocnice()
{
difference() {
    union() {
    bocnice(pocet_der1-1,pocet_der2-1,radidus_hrany,vzdalenost_der,vzdalenost_od_okraje,prumer_sroubu,vyska_bocnice,prekryti_der,tloustka_bocnice);

translate([-((pocet_der2-1)*vzdalenost_der+2*vzdalenost_od_okraje)/2-tloustka_bocnice,-vzdalenost_od_okraje-tloustka_bocnice,-(vyska_bocnice/2)])
rotate(a=[180,0,90])


plbase(pocet_der1,pocet_der2,radidus_hrany,vzdalenost_der,vzdalenost_od_okraje,prumer_sroubu,tloustka_plbase,prekryti_der,tloustka_bocnice);
        
           }
            union() {
//Vytvoreni otvorů v přední stěně
//--------------------------------------------------------
                
                translate([-((pocet_der2-1)*vzdalenost_der)/2,-vzdalenost_od_okraje-tloustka_bocnice/2,-(vyska_bocnice/2)])
                {
                //složí k posunu otvoru v násobku děr
                    posun_p1=10;    
                    translate([posun_p1*vzdalenost_der,0,0])   
                        USBI2C01A(tloustka_bocnice,vzdalenost_der);         
    
                    posun_p2=9.5;    
                    translate([posun_p2*vzdalenost_der,0,0])   
                        MIC338(tloustka_bocnice,vzdalenost_der,vyska_bocnice);
                    
                    posun_p3=5.5;    
                    translate([posun_p3*vzdalenost_der,0,0])   
                        MIC338(tloustka_bocnice,vzdalenost_der,vyska_bocnice);
                    
                }
}
}


//Vytvoreni zadniho celicka krabicky
//--------------------------------------------------------
module celicko_zadni()
{
translate([0,0,0])
difference() {

    
pocet_der_dane_strany=15;
posun_od_kraje=1;    
USBI2C01A(tloustka_celicka,pocet_der_dane_strany,posun_od_kraje,vzdalenost_der,vyska_listy); 
}
}


//Vytvoreni leveho celicka krabicky
//--------------------------------------------------------
module celicko_leve()
{
translate([0,0,0])
difference() {
celicko (vyska,zapust,vule_vysky_celicka,pocet_der1,vzdalenost_der,vule_delky_celicka,tloustka_celicka,vule_tlousky,vyska_listy);
       
pocet_der_dane_strany=11;
posun_od_kraje=1;
    
RS232SINGLE01A(tloustka_celicka,pocet_der_dane_strany,posun_od_kraje,vzdalenost_der,vyska_listy);
}
}



//Vytvoreni praveho celicka krabicky
//--------------------------------------------------------
module celicko_prave()
{
translate([0,0,0])
difference() {
celicko (vyska,zapust,vule_vysky_celicka,pocet_der1,vzdalenost_der,vule_delky_celicka,tloustka_celicka,vule_tlousky,vyska_listy);
       
MIC338(tloustka_celicka,vyska,zapust,vule_vysky_celicka);
  
pocet_der_dane_strany=11;
posun_od_kraje=1;    
UNIPOWER02A(tloustka_celicka,pocet_der_dane_strany,posun_od_kraje,vzdalenost_der,vyska_listy);
}
}

}
