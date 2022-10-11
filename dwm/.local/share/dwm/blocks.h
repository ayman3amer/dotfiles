//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {
	/*Icon*/	/*Command*/								/*Update Interval*/	/*Update Signal*/
	{" "    , "/home/ayman/.local/bin/statusbar/bandwidth"   ,	    1,		 	0  		},
	{" "    , "/home/ayman/.local/bin/statusbar/battery" 	,	    30,		 	0  		},
	{" "    , "/home/ayman/.local/bin/statusbar/volume"  	,	    0,		 	10  	},
	{" "    , "/home/ayman/.local/bin/statusbar/memory"  	,	    30,		 	0  		},
	{" "    , "/home/ayman/.local/bin/statusbar/clock"   	,	    60,		 	0  		},

};

//sets delimeter between status commands. NULL character ('\0') means no delimeter.
static char delim[] = " ";
static unsigned int delimLen = 5;
