
LABEL START
CLS:variations=1:RANDOMIZE TIMER

LABEL VARIABLES
A=1:B=1:C=1:D=1:E=1:F=1:G=1:H=1:I=1:J=1:K=1:L=1:M=1:N=1:O=1:P=1:Z=8:A$="":Dim D$(50000):cnt=0:
RECT 100,100,800,600,2:LINE 450,100, 450, 350,2:LINE 300,350,300,600,2:LINE 600,350,600,600,2:LINE 100,350,800,350,2
AX=275:JX=100:BX=625:CX=100:NX=200:OX=450:PX=700:EX=800:MX=800:FX=200:IX=700:GX=375:HX=525:DX=450:KX=300:LX=600
AY=100:BY=100:FY=350:GY=350:HY=350:IY=350:CY=225:DY=225:EY=225:JY=475:KY=475:LY=475:MY=475:NY=600:OY=600:PY=600
COLOR 0,15:AT AX,AY:? "A":AT BX,BY:?"B":AT CX,CY:?"C":AT DX,DY:?"D":AT EX,EY:?"E":AT FX,FY:?"F":AT GX,GY:?"G"
AT EX,EY:?"E":AT FX,FY:?"F":AT GX,GY:?"G":AT HX,HY:?"H":AT IX,IY:?"I":AT JX,JY:?"J":AT KX,KY:?"K":AT LX,LY:?"L"
AT MX,MY:?"M":AT NX,NY:?"N":AT OX,OY:?"O":AT PX,PY:?"P":AT AX,CY:?"Box1":AT BX,EY:?"Box2":AT FX,JY:?"Box3"
AT DX,JY:?"Box4":AT IX,JY:?"Box5"
REM Each Letter A-P is a Door or Wall which can only be crossed once.
REM Goal is to cross all 16 lines which crossing over twice
MIX=6
GOSUB DOORCHOICE:REM Pick a number from 1-6 then find mark center point of that Box as start point
IF CHOICE=1 THEN B$="Box1":PSET AX,CY,13:ZX=AX:ZY=CY:GOTO BOX1
IF CHOICE=2 THEN B$="Box2":PSET BX,CY,13:ZX=BX:ZY=CY:GOTO BOX2
IF CHOICE=3 THEN B$="Box3":PSET FX,JY,13:ZX=BX:ZY=JY:GOTO BOX3
IF CHOICE=4 THEN B$="Box4":PSET OX,JY,13:ZX=OX:ZY=JY:GOTO BOX4
IF CHOICE=5 THEN B$="Box5":PSET IX,JY,13:ZX=IX:ZY=JY:GOTO BOX5
IF CHOICE=6 THEN B$="Out.":PSET OX,650,13:ZX=OX:ZY=650:GOTO BOX0

LABEL DOORCHOICE
  CHOICE=INT(RND * MIX+1)
IF CHOICE<1 OR CHOICE>MIX THEN GOTO DOORCHOICE
AT 2,10:color 14,1:PRINT LEN(A$),B$,A$:DELAY 100
RETURN

Label BOX1
DOORS=0:MIX=5
IF A=1 OR C=1 OR D=1 OR F=1 OR G=1 THEN DOORS=1
LABEL BOX1OUT
IF DOORS>0 THEN GOSUB DOORCHOICE ELSE GOTO DONE
rem arc 300,200,8,rad(10),rad(430):
IF CHOICE=1 THEN IF A=1 THEN A=2:A$=A$+"A":Z=1:LINE AX,AY-10 color 13:GOTO BOX0
IF CHOICE=2 THEN IF C=1 THEN C=2:A$=A$+"C":Z=3:LINE CX-10,CY color 13:GOTO BOX0
IF CHOICE=3 THEN IF D=1 THEN D=2:A$=A$+"D":LINE DX+50,DY+10 color 13:GOTO BOX2
IF CHOICE=4 THEN IF F=1 THEN F=2:A$=A$+"F":LINE FX-10,FY+50 color 13:GOTO BOX3
IF CHOICE=5 THEN IF G=1 THEN G=2:A$=A$+"G":LINE GX+10,GY+50 color 13:GOTO BOX4
GOTO BOX1OUT

Label BOX2 
DOORS=0:MIX=5
IF B=1 OR D=1 OR H=1 OR I=1 OR E=1 THEN DOORS = 1
LABEL BOX2OUT
IF DOORS>0 THEN GOSUB DOORCHOICE ELSE GOTO DONE
IF CHOICE=1 THEN IF B=1 THEN B=2:A$=A$+"B":Z=2:LINE BX,BY-10 color 13:GOTO BOX0
IF CHOICE=2 THEN IF D=1 THEN D=2:A$=A$+"D":LINE DX-50,DY+10 color 13:GOTO BOX1
IF CHOICE=3 THEN IF H=1 THEN H=2:A$=A$+"H":LINE HX-10,HY+50 color 13:GOTO BOX4
IF CHOICE=4 THEN IF I=1 THEN I=2:A$=A$+"I":LINE IX-10,IY+50 color 13:GOTO BOX5
IF CHOICE=5 THEN IF E=1 THEN E=2:A$=A$+"E":Z=4:LINE EX+10,EY color 13:GOTO BOX0
GOTO BOX2OUT

Label BOX3 
DOORS=0:MIX=4
IF F=1 OR J=1 OR K=1 OR N=1 THEN DOORS = 1
LABEL BOX3OUT
IF DOORS>0 THEN GOSUB DOORCHOICE ELSE GOTO DONE
IF CHOICE=1 THEN IF F=1 THEN F=2:A$=A$+"F":LINE FX+10,FY-50 color 13:GOTO BOX1
IF CHOICE=2 THEN IF J=1 THEN J=2:A$=A$+"J":Z=5:LINE JX-10,JY color 13:GOTO BOX0
IF CHOICE=3 THEN IF K=1 THEN K=2:A$=A$+"K":LINE KX+50,KY+10 color 13:GOTO BOX4
IF CHOICE=4 THEN IF N=1 THEN N=2:A$=A$+"N":Z=7:LINE NX,NY+10 color 13:GOTO BOX0
GOTO BOX3OUT

Label BOX4
DOORS=0:MIX=5
IF G=1 OR H=1 OR K=1 OR L=1 OR O=1 THEN DOORS = 1
LABEL BOX4OUT
IF DOORS>0 THEN GOSUB DOORCHOICE ELSE GOTO DONE
IF CHOICE=1 THEN IF G=1 THEN G=2:A$=A$+"G":LINE GX,GY-50 color 13:GOTO BOX1
IF CHOICE=2 THEN IF H=1 THEN H=2:A$=A$+"H":LINE HX,HY-50 color 13:GOTO BOX2
IF CHOICE=3 THEN IF K=1 THEN K=2:A$=A$+"K":LINE KX-50,KY color 13:GOTO BOX3
IF CHOICE=4 THEN IF L=1 THEN L=2:A$=A$+"L":LINE LX+50,LY+10 color 13:GOTO BOX5
IF CHOICE=5 THEN IF O=1 THEN O=2:A$=A$+"O":Z=8:LINE OX,OY+10 color 13:GOTO BOX0
GOTO BOX4OUT

Label BOX5
DOORS=0:MIX=4
IF I=1 OR L=1 OR M=1 OR P=1 THEN DOORS = 1
LABEL BOX5OUT
IF DOORS>0 THEN GOSUB DOORCHOICE ELSE GOTO DONE
IF CHOICE=1 THEN IF I=1 THEN I=2:A$=A$+"I":LINE IX,IY-50 color 13:GOTO BOX2
IF CHOICE=2 THEN IF L=1 THEN L=2:A$=A$+"L":LINE LX-50,LY+10 color 13:GOTO BOX4
IF CHOICE=3 THEN IF M=1 THEN M=2:A$=A$+"M":Z=6:LINE MX+10,MY color 13:GOTO BOX0
IF CHOICE=4 THEN IF P=1 THEN P=2:A$=A$+"P":Z=9:LINE PX,PY+10 color 13:GOTO BOX0
GOTO BOX5OUT

Label BOX0
DOORS=0:MIX=9
IF A=1 OR B=1 OR C=1 OR E=1 OR J=1 OR M=1 OR N=1 OR O=1 OR P=1 THEN DOORS=1
LABEL INTO_A_BOX
IF DOORS>0 THEN GOSUB DOORCHOICE ELSE GOTO DONE
IF CHOICE=1 THEN IF A=1 THEN A=2:A$=A$+"A":GOSUB DOOR_A:LINE AX,AY+50 color 13:GOTO BOX1
IF CHOICE=2 THEN IF B=1 THEN B=2:A$=A$+"B":GOSUB DOOR_B:LINE BX,BY+50 color 13:GOTO BOX2
IF CHOICE=3 THEN IF C=1 THEN C=2:A$=A$+"C":GOSUB DOOR_C:LINE CX+50,CY color 13:GOTO BOX1
IF CHOICE=4 THEN IF E=1 THEN E=2:A$=A$+"E":GOSUB DOOR_E:LINE EX-50,EY color 13:GOTO BOX2
IF CHOICE=5 THEN IF J=1 THEN J=2:A$=A$+"J":GOSUB DOOR_J:LINE JX+50,JY color 13:GOTO BOX3
IF CHOICE=6 THEN IF M=1 THEN M=2:A$=A$+"M":GOSUB DOOR_M:LINE MX-50,MY color 13:GOTO BOX5
IF CHOICE=7 THEN IF N=1 THEN N=2:A$=A$+"N":GOSUB DOOR_N:LINE NX,NY-50 color 13:GOTO BOX3
IF CHOICE=8 THEN IF O=1 THEN O=2:A$=A$+"O":GOSUB DOOR_O:LINE OX,OY-50 color 13:GOTO BOX4
IF CHOICE=9 THEN IF P=1 THEN P=2:A$=A$+"P":GOSUB DOOR_P:LINE PX,PY-50 color 13:GOTO BOX5
GOTO INTO_A_BOX

LABEL DONE
rem if len(A$)>14 then gosub Addchg:rem to count variations of 15 (it''s well over 40,000 - rem out cls)
rem IF LEN(A$)>14 THEN 
  gosub missedline:AT 2,10:color 14:PRINT LEN(A$),B$,A$:DELAY 1000:REM Pause to show Picture.
IF LEN(A$)=16 THEN PRINT "EUREKA!":PRINT LEN(A$),B$,A$:END
A$="":CLS:Rem rem cls if counting variations.
GOTO VARIABLES

LABEL Addchg
newone=1
for iter=1 to variations 
if A$=D$(iter) then newone=0
next iter
if newone=1 THEN D$(variations+1)=A$:variations=variations+1:color 14:at 3,10:?variations
RETURN

LABEL missedline
IF A=1 THEN RECT CX,AY,DX,AY+5, FILLED
IF B=1 THEN RECT DX,BY,EX,BY+5, FILLED
IF C=1 THEN RECT CX,AY,CX+5,FY, FILLED
IF D=1 THEN RECT DX,AY,DX+5,FY, FILLED
IF E=1 THEN RECT EX,AY,EX+5,FY, FILLED
IF F=1 THEN RECT CX,FY,KX,FY+5, FILLED
IF G=1 THEN RECT KX,GY,DX,GY+5, FILLED
IF H=1 THEN RECT DX,HY,LX,HY+5, FILLED
IF I=1 THEN RECT LX,IY,EX,IY+5, FILLED
IF J=1 THEN RECT JX,FY,JX+5,NY, FILLED
IF K=1 THEN RECT KX,FY,KX+5,NY, FILLED
IF L=1 THEN RECT LX,FY,LX+5,NY, FILLED
IF M=1 THEN RECT MX,FY,MX+5,NY, FILLED
IF N=1 THEN RECT JX,NY,KX,NY+5, FILLED
IF O=1 THEN RECT KX,NY,LX,NY+5, FILLED
IF P=1 THEN RECT LX,PY,MX,PY+5, FILLED
RETURN
  
REM These are subs to walk lines outside of large box (Box0) to go into chosen door
LABEL DOOR_A
IF Z=2 THEN LINE AX,AY-25 COLOR 13
IF Z=3 OR Z= 5 THEN LINE CX-20,AY-30 COLOR 13:LINE AX,AY-25 COLOR 13
IF Z=4 OR Z= 6 THEN LINE EX+25,AY-35 COLOR 13:LINE AX,AY-25 COLOR 13
IF Z=7 OR Z=8 OR Z=9 THEN LINE JX-40,NY+45 COLOR 13:LINE JX-10,AY-45 COLOR 13:LINE AX,AY-25 COLOR 13
RETURN

LABEL DOOR_B
IF Z=1 THEN LINE BX,BY-15 COLOR 13
IF Z=3 OR Z= 5 THEN LINE CX-20,BY-34 COLOR 13:LINE BX,BY-25 COLOR 13
IF Z=4 OR Z= 6 THEN LINE EX+30,BY-30 COLOR 13:LINE BX,BY-25 COLOR 13
IF Z=7 OR Z=8 OR Z=9 THEN LINE MX+24,NY+24 COLOR 13:LINE MX+35,BY-35 COLOR 13:LINE BX,BY-25 COLOR 13
RETURN

LABEL DOOR_C
IF Z=1 OR Z=2 THEN LINE CX-25,AY-25 COLOR 13
IF Z=5 THEN LINE CX-25,CY COLOR 13
IF Z=4 OR Z= 6 THEN LINE EX+30,AY-45 COLOR 13:LINE CX-25,AY-35 COLOR 13: LINE CX-25,CY COLOR 13
IF Z=7 OR Z=8 OR Z=9 THEN LINE CX-25,NY+30 COLOR 13:LINE CX-25,CY COLOR 13
RETURN

LABEL DOOR_E
IF Z=1 OR Z=2 THEN LINE EX+10,AY-20 COLOR 13: LINE EX+20,EY COLOR 13
IF Z=3 OR Z=5 THEN LINE CX-10,AY-20 COLOR 13:LINE EX+10,AY-20 COLOR 13:LINE EX+13,EY COLOR 13
IF Z=6 THEN LINE EX+10,EY COLOR 13
IF Z=7 OR Z=8 OR Z=9 THEN LINE EX+10,NY+10 COLOR 13:LINE EX+10,EY COLOR 13
RETURN

LABEL DOOR_J
IF Z=1 OR Z=2 THEN LINE JX-25,AY-20 COLOR 13:LINE JX-25,JY COLOR 13
IF Z=3 THEN LINE JX-10,JY COLOR 13
IF Z=4 OR Z=6 THEN LINE EX+10,PY+25 COLOR 13:LINE JX-30,PY+25 COLOR 13:LINE JX-25,JY COLOR 13
IF Z=7 OR Z=8 OR Z=9 THEN LINE JX-10,NY+30 COLOR 13:LINE JX-20,JY COLOR 13
RETURN

LABEL DOOR_M
IF Z=1 OR Z=2 THEN LINE MX+25,AY-25 COLOR 13: LINE MX+25,MY COLOR 13
IF Z=3 OR Z=5 THEN LINE CX-10,AY-20 COLOR 13:LINE MX+48,AY-25 COLOR 13:LINE MX+25,MY COLOR 13
IF Z=4 THEN LINE MX+25,MY COLOR 13
IF Z=7 OR Z=8 OR Z=9 THEN LINE MX+25,PY+35 COLOR 13:LINE MX+25,MY COLOR 13
RETURN

LABEL DOOR_N
IF Z=1 OR Z=2 THEN LINE CX-30,AY-20 COLOR 13: LINE CX-30,NY+10 COLOR 13:LINE NX,NY+25 COLOR 13
IF Z=3 OR Z=5 THEN LINE CX-14,NY+25 COLOR 13:LINE NX,NY+15 COLOR 13
IF Z=4 OR Z=6 THEN LINE EX+10,NY+12 COLOR 13:LINE NX,NY+25 COLOR 13
IF Z=8 OR Z=9 THEN LINE NX,NY+10 COLOR 13
RETURN

LABEL DOOR_O
IF Z=1 OR Z=2 THEN LINE EX+40,AY-35 COLOR 13: LINE EX+40,OY+34 COLOR 13: LINE OX,OY+25 COLOR 13
IF Z=3 OR Z=5 THEN LINE CX-10,OY+52 COLOR 13:LINE OX,OY+25 COLOR 13
IF Z=4 OR Z=6 THEN LINE EX+10,OY+52 COLOR 13:LINE OX,OY+25 COLOR 13
IF Z=7 OR Z=9 THEN LINE OX,NY+10 COLOR 13
RETURN

LABEL DOOR_P
IF Z=1 OR Z=2 THEN LINE EX+35,AY-25 COLOR 13: LINE EX+35,PY+12 COLOR 13: LINE PX,PY+25 COLOR 13
IF Z=3 OR Z=5 THEN LINE CX-32,PY+42 COLOR 13:LINE PX,PY+25 COLOR 13
IF Z=4 OR Z=6 THEN LINE EX+10,PY+10 COLOR 13:LINE PX,PY+26 COLOR 13
IF Z=7 OR Z=8 THEN LINE PX,NY+10 COLOR 13
RETURN


