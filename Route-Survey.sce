scenario = "Route-Survey";

active_buttons = 2;
#hieronder geef je aan wat de codes zijn voor de response-knoppen
# 0,1 verwijst naar de knoppenkast, de meest linkse en meest rechtse
button_codes = 1,2;
response_matching = simple_matching;
default_attenuation = .2;    # attenuate sounds by 20 Db
#pan = 0; # -1 play left only, 1 play right only

begin;

picture {} default;
#hieronder noem je alle geluidsstimuli die je nodig hebt in het hele experiment.
sound {wavefile {filename = "startsignaal.wav"; }; }beep;
sound {wavefile {filename = "intro.wav"; }; }introoefen;
sound {wavefile {filename = "einde.wav"; }; }einde;
sound {wavefile {filename = "goed.wav"; }; }goed;
sound {wavefile {filename = "fout.wav"; }; }fout;
sound {wavefile {filename = "introechteonderzoek.wav"; }; }introecht;
sound {wavefile {filename = "experimentbegint.wav"; }; }experimentbegint;
sound {wavefile {filename = "reminder.wav"; }; }reminder;  
sound {wavefile {filename = "onderkansniveautekstje.wav"; }; }onderkansniveau;
sound {wavefile {filename = "introtekst5.wav"; }; }introtekst5;

#stimuli trials
sound {wavefile {filename = "heup.wav";   }; }heup;
sound {wavefile {filename = "oor.wav";  }; }oor;
sound {wavefile {filename = "schouder.wav"; }; }schouder;
sound {wavefile {filename = "elleboog.wav"; }; }elleboog;
sound {wavefile {filename = "enkel.wav"; }; }enkel;  


# Start of Programme 
#uitleg van de taak, moet nog auditief worden
# intro
trial {
sound introtekst5; code = "introtekst5";
};

trial {
sound introoefen; code = "introoefen";
};

trial {
    trial_duration = forever;
    trial_type = specific_response;    	# trial ends when response
    terminator_button = 1;             	#   button 1 is pressed
	picture {
		text {
			font_size = 18;
			caption = "Wachten op de linkerknop";	
			};
		x = 0 ; y = 0 ;		
		};
};

trial { 
#	trial_duration = 2000;
	picture {
		text {
			font_size = 18;
#			system_memory = true;
			caption = "Oefensessie";	
			};
		x = 0 ; y = 0 ;		
		};
	};      

#code nodig voor het geven van feedback
trial {
    trial_duration = stimuli_length;
    sound fout;
    time = 100;
    code = "fout";
	 nothing {}; delta_time = 2000; code = "end_trial";
} wrong;
trial {
    trial_duration = stimuli_length;
    sound goed;
    time = 100;
    code = "goed";
    nothing {}; delta_time = 2000; code = "end_trial";
} right;

#oefentrials
TEMPLATE "oefen.tem" randomize {
# zin1: naam van 1e lichaamsdeel 
# z1code: code van het 1e lichaamsdeel voor de logfile 
# zin2: naam van 2e lichaamsdeel
# z2code: code van het 2e lichaamsdeel voor de logfile 
# antw: welke knop het goede antwoord is
# trialcode: unique trial code (conditie, trialtype)
# uitbreiden naar meerdere trials trials

# oefentrials
# nog even aanpassen. Alleen duidelijke verschillen. En voorbeeld van 3 condities.
 zin11					zin12 		zin1code						zin21						zin22			zin2code					antw		trialcode;  
 schouder				schouder		"schouderschouder"		oor						oor			"ooroor"						1		"scsc_oror";
 heup						heup			"heupheup"					oor						oor			"ooroor"						1		"hphp_oror";
 oor						oor			"ooroor"						heup						heup			"heupheup"					2		"oror_hphp";
 oor						oor			"ooroor"						schouder					schouder		"schouderschouder"		2		"oror_scsc";
 heup						heup			"heupheup"					oor						elleboog		"oorelleboog"				2		"hphp_orel";
 oor						oor			"ooroor"						elleboog					elleboog		"elleboogelleboog"		2	  	"oror_elel";
 heup						heup			"heupheup"					oor						elleboog		"oorelleboog"				2	  	"hphp_orel";
 schouder				oor			"schouderoor"				oor						heup			"oorheup"					2	  	"scor_orhp";
 heup						heup			"heupheup"					elleboog					oor			"elleboogoor"				2  	"hphp_elor";
 heup						oor			"heupoor"					schouder					heup			"schouderheup"				1		"hpor_schp";
};

trial { 
	picture default;
};

#uitleg begin experiment
trial { 
#	trial_duration = 2000;
	picture {
		text {
			font_size = 18;
#			system_memory = true;
			caption = "Nu volgt het eigenlijke experiment. 
Succes!";	
			};
		x = 0 ; y = 0 ;		
		};
	};      

trial {
	sound introecht; code = "introecht";
};

trial {
    trial_duration = forever;
    trial_type = specific_response;    	# trial ends when response
    terminator_button = 1;             	#   button 2 is pressed
	picture {
		text {
			font_size = 18;
			caption = "Wachten op de linkerknop";	
			};
		x = 0 ; y = 0 ;		
		};
};


trial { 
	picture default;
};



# blok1                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
TEMPLATE "pairs.tem" randomize {
# zin1: naam van 1e lichaamsdeel 
# z1code: code van het 1e lichaamsdeel voor de logfile 
# zin2: naam van 2e lichaamsdeel
# z2code: code van het 2e lichaamsdeel voor de logfile 
# trialcode: unique trial code (conditie, trialtype)
# uitbreiden naar meerdere trials trials
   
 zin11					zin12 		zin1code						zin21						zin22			zin2code					antw	trialcode;  
 #groep1
  schouder				enkel			"schouderenkel"			heup						heup			"heupheup"					1	"scen_hphpMDg";
  elleboog				enkel			"elleboogenkel"			heup						heup			"heupheup"					1	"elen_hphpMDg";
  oor						enkel			"oorenkel"					heup						heup			"heupheup"					1	"oren_hphpMDg";
  oor						elleboog		"oorelleboog"				enkel						enkel			"enkelenkel"				1	"orel_enenMD";
 #groep 1
  oor						oor			"ooroor"						enkel						enkel			"enkelenkel"				1	"oror_enenHD";
  schouder				enkel			"schouderenkel"			heup						heup			"heupheup"					1	"scen_hphpMDg";
  elleboog				enkel			"elleboogenkel"			heup						heup			"heupheup"					1	"elen_hphpMDg";
  oor						enkel			"oorenkel"					heup						heup			"heupheup"					1	"oren_hphpMDg";
  oor						enkel			"oorenkel"					heup						heup			"heupheup"					1	"oren_hphpMDg";
  oor						elleboog		"oorelleboog"				enkel						enkel			"enkelenkel"				1	"orel_enenMD";
 #groep 1 
  heup					heup			"heupheup"					enkel						enkel			"enkelenkel"				1	"hphp_enenHEg";
  elleboog				elleboog		"elleboogelleboog"		enkel						enkel			"enkelenkel"				1	"elel_enenHE";
  oor						oor			"ooroor"						schouder					schouder		"schouderschouder"		2	"oror_scscHE";
  enkel					enkel			"enkelenkel"				oor						oor			"ooroor"						2	"enen_ororHD";
  oor						elleboog		"oorelleboog"				enkel						enkel			"enkelenkel"				1	"orel_enenMD";
  schouder				schouder		"schouderschouder"		heup						heup			"heupheup"					1	"scsc_hphpHDg";
  schouder				schouder		"schouderschouder"		enkel						enkel			"enkelenkel"				1	"scsc_enenHE";
 #groep1 
  schouder				enkel			"schouderenkel"			heup						heup			"heupheup"					1	"scen_hphpMDg";
  elleboog				enkel			"elleboogenkel"			heup						heup			"heupheup"					1	"elen_hphpMDg";
  oor						enkel			"oorenkel"					heup						heup			"heupheup"					1	"oren_hphpMDg";
  oor						elleboog		"oorelleboog"				enkel						enkel			"enkelenkel"				1	"orel_enenMD";
  elleboog				heup			"elleboogheup"				enkel						oor			"enkeloor"					2	"elhp_enorMD";
  oor						heup			"oorheup"					schouder					schouder 	"schouderschouder"		1	"orhp_scscMD";

 
}; 

trial {
	sound reminder; code = "reminder";
};

trial {
    trial_duration = forever;
    trial_type = specific_response;    	# trial ends when response
    terminator_button = 1;             	#   button 2 is pressed
	picture {
		text {
			font_size = 18;
			caption = "Wachten op de linkerknop";	
			};
		x = 0 ; y = 0 ;		
		};
};

trial { 
	picture default;
};

#blok2
TEMPLATE "pairs.tem" randomize { 
 
 zin11					zin12 		zin1code						zin21						zin22			zin2code					antw	trialcode;  
 #groep2
  schouder				enkel			"schouderenkel"			heup						heup			"heupheup"					1	"scen_hphpMDg";
  elleboog				enkel			"elleboogenkel"			heup						heup			"heupheup"					1	"elen_hphpMDg";
  oor						enkel			"oorenkel"					heup						heup			"heupheup"					1	"oren_hphpMDg";
  oor						elleboog		"oorelleboog"				enkel						enkel			"enkelenkel"				1	"orel_enenMD";
  elleboog				heup			"elleboogheup"				enkel						oor			"enkeloor"					2	"elhp_enorMD";
  oor						heup			"oorheup"					schouder					schouder 	"schouderschouder"		1	"orhp_scscMD";
 #groep2
  oor						oor			"ooroor"						enkel						enkel			"enkelenkel"				1	"oror_enenHD";
  schouder				enkel			"schouderenkel"			heup						heup			"heupheup"					1	"scen_hphpMDg";
  elleboog				enkel			"elleboogenkel"			heup						heup			"heupheup"					1	"elen_hphpMDg";
  oor						enkel			"oorenkel"					heup						heup			"heupheup"					1	"oren_hphpMDg";
 #groep2
  oor						oor			"ooroor"						schouder					schouder			"schouderschouder"		2	"oror_scscHD";
  oor						oor			"ooroor"						enkel						enkel			"enkelenkel"				1	"oror_enenHD";
  schouder				enkel			"schouderenkel"			heup						heup			"heupheup"					1	"scen_hphpMDg";
  elleboog				enkel			"elleboogenkel"			heup						heup			"heupheup"					1	"elen_hphpMDg";
  oor						enkel			"oorenkel"					heup						heup			"heupheup"					1	"oren_hphpMDg";
  oor						elleboog		"oorelleboog"				enkel						enkel			"enkelenkel"				1	"orel_enenMD";
 #groep2
  oor						oor			"ooroor"						schouder					schouder		"schouderschouder"		2	"oror_scscHD";
  oor						oor			"ooroor"						enkel						enkel			"enkelenkel"				1	"oror_enenHD";
  schouder				enkel			"schouderenkel"			heup						heup			"heupheup"					1	"scen_hphpMDg";
  elleboog				enkel			"elleboogenkel"			heup						heup			"heupheup"					1	"elen_hphpMDg";
  oor						enkel			"oorenkel"					heup						heup			"heupheup"					1	"oren_hphpMDg";
  oor						elleboog		"oorelleboog"				enkel						enkel			"enkelenkel"				1	"orel_enenMD"; 
}; 

trial {
	sound reminder; code = "reminder";
};

trial {
    trial_duration = forever;
    trial_type = specific_response;    	# trial ends when response
    terminator_button = 1;             	#   button 2 is pressed
	picture {
		text {
			font_size = 18;
			caption = "Wachten op de linkerknop";	
			};
		x = 0 ; y = 0 ;		
		};
};

trial { 
	picture default;
};

#blok 3
TEMPLATE "pairs.tem" randomize {

 zin11					zin12 		zin1code						zin21						zin22			zin2code					antw	trialcode;  
#groep3
 schouder				enkel			"schouderenkel"			heup						heup			"heupheup"						1	"scen_hphpMDg";
 elleboog				enkel			"elleboogenkel"			heup						heup			"heupheup"						1	"elen_hphpMDg";
 oor						enkel			"oorenkel"					heup						heup			"heupheup"						1	"oren_hphpMDg";
 oor						elleboog		"oorelleboog"				enkel						enkel			"enkelenkel"					1	"orel_enenMD";
 elleboog				heup			"elleboogheup"				enkel						oor			"enkeloor"						2	"elhp_enorMD";
 oor						heup			"oorheup"					schouder					schouder 	"schouderschouder"			1	"orhp_scscMD";
 elleboog				enkel			"elleboogenkel"			schouder					schouder		"schouderschouder"			1	"elen_scscMD";
#groep3
 oor						oor			"ooroor"						enkel						enkel			"enkelenkel"					1	"oror_enenHD";
 schouder				enkel			"schouderenkel"			heup						heup			"heupheup"						1	"scen_hphpMDg";
 elleboog				enkel			"elleboogenkel"			heup						heup			"heupheup"						1	"elen_hphpMDg";
 oor						enkel			"oorenkel"					heup						heup			"heupheup"						1	"oren_hphpMDg";
 oor						elleboog		"oorelleboog"				enkel						enkel			"enkelenkel"					1	"orel_enenMD";
#groep3
 oor						oor			"ooroor"						schouder					schouder		"schouderschouder"			2	"oror_scscHD";
 oor						oor			"ooroor"						enkel						enkel			"enkelenkel"					1	"oror_enenHD";
 schouder				enkel			"schouderenkel"			heup						heup			"heupheup"						1	"scen_hphpMDg";
 elleboog				enkel			"elleboogenkel"			heup						heup			"heupheup"						1	"elen_hphpMDg";
 oor						enkel			"oorenkel"					heup						heup			"heupheup"						1	"oren_hphpMDg";
 oor						elleboog		"oorelleboog"				enkel						enkel			"enkelenkel"					1	"orel_enenMD";
#groep3
 oor						oor			"ooroor"						enkel						enkel			"enkelenkel"					1	"oror_enenHD";
 schouder				enkel			"schouderenkel"			heup						heup			"heupheup"						1	"scen_hphpMDg";
 elleboog				enkel			"elleboogenkel"			heup						heup			"heupheup"						1	"elen_hphpMDg";
 oor						enkel			"oorenkel"					heup						heup			"heupheup"						1	"oren_hphpMDg";

 
}; 

trial {
	sound reminder; code = "reminder";
};

trial {
    trial_duration = forever;
    trial_type = specific_response;    	# trial ends when response
    terminator_button = 1;             	#   button 2 is pressed
	picture {
		text {
			font_size = 18;
			caption = "Wachten op de linkerknop";	
			};
		x = 0 ; y = 0 ;		
		};
};

trial { 
	picture default;
};

#blok 4
TEMPLATE "pairs.tem" randomize { 
 $zin11					$zin12 		$zin1code					$zin21					$zin22		$zin2code					antw	trialcode;  
#groep4
 schouder				enkel			"schouderenkel"			heup						heup			"heupheup"						1	"scen_hphpMDg";
 elleboog				enkel			"elleboogenkel"			heup						heup			"heupheup"						1	"elen_hphpMDg";
 oor						enkel			"oorenkel"					heup						heup			"heupheup"						1	"oren_hphpMDg";
 oor						elleboog		"oorelleboog"				enkel						enkel			"enkelenkel"					1	"orel_enenMD";
 elleboog				heup			"elleboogheup"				enkel						oor			"enkeloor"						2	"elhp_enorMD";
 oor						heup			"oorheup"					schouder					schouder 	"schouderschouder"			1	"orhp_scscMD";
 elleboog				enkel			"elleboogenkel"			schouder					schouder		"schouderschouder"			1	"elen_scscMD";
#groep4
 oor						oor			"ooroor"						schouder					schouder		"schouderschouder"			2	"oror_scscHD";
 oor						oor			"ooroor"						enkel						enkel			"enkelenkel"					1	"oror_enenHD";
 schouder				enkel			"schouderenkel"			heup						heup			"heupheup"						1	"scen_hphpMDg";
 elleboog				enkel			"elleboogenkel"			heup						heup			"heupheup"						1	"elen_hphpMDg";
 oor						enkel			"oorenkel"					heup						heup			"heupheup"						1	"oren_hphpMDg";
 oor						elleboog		"oorelleboog"				enkel						enkel			"enkelenkel"					1	"orel_enenMD";
 elleboog				heup			"elleboogheup"				enkel						oor			"enkeloor"						2	"elhp_enorMD";
 oor						heup			"oorheup"					schouder					schouder 	"schouderschouder"			1	"orhp_scscMD";
 elleboog				enkel			"elleboogenkel"			schouder					schouder		"schouderschouder"			1	"elen_scscMD";
#groep4
 oor						enkel			"oorenkel"					heup						heup			"heupheup"						1	"oren_hphpMDg";
 oor						elleboog		"oorelleboog"				enkel						enkel			"enkelenkel"					1	"orel_enenMD";
 elleboog				heup			"elleboogheup"				enkel						oor			"enkeloor"						2	"elhp_enorMD";
 oor						heup			"oorheup"					schouder					schouder 	"schouderschouder"			1	"orhp_scscMD";
 elleboog				enkel			"elleboogenkel"			schouder					schouder		"schouderschouder"			1	"elen_scscMD";
#groep4
 oor						oor			"ooroor"						enkel						enkel			"enkelenkel"					1	"oror_enenHD";
 schouder				enkel			"schouderenkel"			heup						heup			"heupheup"						1	"scen_hphpMDg";
 elleboog				enkel			"elleboogenkel"			heup						heup			"heupheup"						1	"elen_hphpMDg";
 oor						enkel			"oorenkel"					heup						heup			"heupheup"						1	"oren_hphpMDg";
 
};

# aflsuiting experiment
trial {
	picture {
		text {
			font_size = 18;
			system_memory = true;
			caption = "Dit is het einde van dit experiment.";	
			};
		x = 0 ; y = 0 ;		
		};
	sound einde; code = "einde";
	nothing {}; delta_time = 3547;
	};


#End   

