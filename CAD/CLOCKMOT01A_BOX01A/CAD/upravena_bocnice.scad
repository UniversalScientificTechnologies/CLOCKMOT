use <src/bocnice.scad>

use <src/otvory.scad>
use <src/plbase.scad>
include <src/manufactury_conf.scad>
include <configuration.scad>
include <src/otvory_conf.scad>

upravena_bocnice();

//Slouzi pro vytvoreni bocnice s vlastnimi otvory


module upravena_bocnice()
{
difference() {
    union() {
    bocnice(pocet_der1-1,pocet_der2-1,radidus_hrany,vzdalenost_der,vzdalenost_od_okraje1,vzdalenost_od_okraje2,prumer_sroubu,vyska_bocnice,prekryti_der,tloustka_bocnice);

/*
    translate([-((pocet_der2-1)*vzdalenost_der+2*vzdalenost_od_okraje2)/2-tloustka_bocnice,-vzdalenost_od_okraje1-tloustka_bocnice,-(vyska_bocnice/2)])
        rotate(a=[180,0,90])
            plbase(pocet_der1,pocet_der2,radidus_hrany,vzdalenost_der1,vzdalenost_der2,vzdalenost_od_okraje,prumer_sroubu,tloustka_plbase,prekryti_der,tloustka_bocnice);
 */      
            }
            
 
//Vytvoreni otvorů v přední stěně
//--------------------------------------------------------
    union() {            
        translate([-((pocet_der2-1)*vzdalenost_der)/2,-vzdalenost_od_okraje1-tloustka_bocnice/2,-(vyska_bocnice/2)])
        {
        //složí k posunu otvoru v násobku děr
                    posun_p1=10;    
                    translate([posun_p1*vzdalenost_der,0,0])   
                        UNIPOWER03A(tloustka_bocnice,vzdalenost_der);         
    
                    posun_p2=9.5;    
                    translate([posun_p2*vzdalenost_der,0,0])   
                        MIC338(tloustka_bocnice,vzdalenost_der,vyska_bocnice);
                    
                    posun_p3=5.5;    
                    translate([posun_p3*vzdalenost_der,0,0])   
                        MIC338(tloustka_bocnice,vzdalenost_der,vyska_bocnice);
                    
                     posun_p4=2;    
                    translate([posun_p4*vzdalenost_der,0,0])   
                    IR(tloustka_bocnice,vyska_bocnice);     
            
            }
            }



//Vytvoreni zadniho celicka krabicky
//--------------------------------------------------------
    translate([((pocet_der2-1)*vzdalenost_der)/2,(pocet_der1-1)*vzdalenost_der+vzdalenost_od_okraje1+tloustka_bocnice/2,-(vyska_bocnice/2)])
    {
    //složí k posunu otvoru v násobku děr
           
        posun_z2=0;    
            translate([-posun_z2*vzdalenost_der,0,0])  
                rotate(a=[0,0,180])  
                   CHLADICI_OTVORY2(tloustka_bocnice,vzdalenost_der,pocet_der2-8,vyska_bocnice);

        posun_z3=7.5;    
            translate([-posun_z3*vzdalenost_der,0,0])  
                rotate(a=[0,0,180])  
                   CHLADICI_OTVORY2(tloustka_bocnice,vzdalenost_der,pocet_der2-9,vyska_bocnice);    
                 
                    
     }

//Vytvoreni leveho celicka krabicky
//--------------------------------------------------------

    translate([-((pocet_der2-1)*vzdalenost_der)/2-vzdalenost_od_okraje2-tloustka_bocnice/2,(pocet_der1-1)*vzdalenost_der,-(vyska_bocnice/2)])
    {
         //složí k posunu otvoru v násobku děr
                    posun_l1=4.2;    
                    translate([0,-posun_l1*vzdalenost_der,0])  
                    rotate(a=[0,0,-90])  
                        IR(tloustka_bocnice,vyska_bocnice);         
    
                    posun_l2=30.5;    
                    
                    translate([0,-posun_l2*vzdalenost_der,0])    
                    rotate(a=[0,0,-90]) 
                        I2CDIFF01A(tloustka_bocnice,vzdalenost_der);
                    
                    posun_l3=5.5;    
                   translate([0,-posun_l3*vzdalenost_der,0])    
                    rotate(a=[0,0,-90])
                        CHLADICI_OTVORY2(tloustka_bocnice,vzdalenost_der,pocet_der1-7,vyska_bocnice);
                    
                    posun_l4=0;    
                    translate([0,-posun_l4*vzdalenost_der,0])   
                  
                    rotate(a=[0,0,-90])  
                      CHLADICI_OTVORY2(tloustka_bocnice,vzdalenost_der,pocet_der1-7,vyska_bocnice);
    }

//Vytvoreni praveho celicka krabicky
//--------------------------------------------------------
    translate([+((pocet_der2-1)*vzdalenost_der)/2+vzdalenost_od_okraje2+tloustka_bocnice/2,0,-(vyska_bocnice/2)])
       {
         //složí k posunu otvoru v násobku děr
                    posun_pr1=4.2;    
                    translate([0,posun_pr1*vzdalenost_der,0])  
                    rotate(a=[0,0,90])  
                        IR(tloustka_bocnice,vyska_bocnice);         
    
                    posun_pr2=30;    
                    
                    translate([0,posun_pr2*vzdalenost_der,0])
                    rotate(a=[0,0,90]) 
                        I2CDIFF01A(tloustka_bocnice,vzdalenost_der);
                    
                    posun_pr3=5.5;    
                    translate([0,posun_pr3*vzdalenost_der,0])
                    rotate(a=[0,0,90])
                         CHLADICI_OTVORY2(tloustka_bocnice,vzdalenost_der,pocet_der1-7,vyska_bocnice);
                    
                    posun_pr4=0;    
                    translate([0,posun_pr4*vzdalenost_der,0])
                   rotate(a=[0,0,90])  
                       CHLADICI_OTVORY2(tloustka_bocnice,vzdalenost_der,pocet_der1-7,vyska_bocnice);
                          
        }
}
}

