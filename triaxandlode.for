      SUBROUTINE UVARM(UVAR,DIRECT,T,TIME,DTIME,CMNAME,ORNAME,
     1 NUVARM,NOEL,NPT,LAYER,KSPT,KSTEP,KINC,NDI,NSHR,COORD,
     2 JMAC,JMATYP,MATLAYO,LACCFLA) 
C     Calculates triaxiality and Lode parameter in UVARM1 abd UVARM2 respectively
C     by Gustavo Quino
C     July 2021
      INCLUDE 'ABA_PARAM.INC'
C
      CHARACTER*80 CMNAME,ORNAME
      CHARACTER*3 FLGRAY(15)
      DIMENSION UVAR(NUVARM),DIRECT(3,3),T(3,3),TIME(2)
      DIMENSION ARRAY(15),JARRAY(15),JMAC(*),JMATYP(*),COORD(*)
C     
C     TRIAXIALITY
C     Querying SINV , component 3 is pressure, component 1 is von mises
      CALL GETVRM('SINV',ARRAY,JARRAY,FLGRAY,JRCD,JMAC,JMATYP,
     1 MATLAYO,LACCFLA)
      UVAR(1) = ARRAY(3)/ARRAY(1)
C     LODE PARAMETER
C     Querying Principal stresses, components 1, 2, 3 are the principal 3, 2 1 stresses
      CALL GETVRM('SP',ARRAY,JARRAY,FLGRAY,JRCD,JMAC,JMATYP,
     1 MATLAYO,LACCFLA)
      UVAR(2) = (2.0*ARRAY(2)-ARRAY(3)-ARRAY(1))/(ARRAY(3)-ARRAY(1))
      RETURN
      END