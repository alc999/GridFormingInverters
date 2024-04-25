!=======================================================================
! Generated by: PSCAD v5.0.2.0
! Warning:  The content of this file is automatically generated.
!           Do not modify, as any changes made here will be lost!
!-----------------------------------------------------------------------
! Component     : Main
! Description   : 
!-----------------------------------------------------------------------


!=======================================================================

      SUBROUTINE MainDyn()

!---------------------------------------
! Standard includes 
!---------------------------------------

      INCLUDE 'nd.h'
      INCLUDE 'emtconst.h'
      INCLUDE 'emtstor.h'
      INCLUDE 's0.h'
      INCLUDE 's1.h'
      INCLUDE 's2.h'
      INCLUDE 's4.h'
      INCLUDE 'branches.h'
      INCLUDE 'pscadv3.h'
      INCLUDE 'fnames.h'
      INCLUDE 'radiolinks.h'
      INCLUDE 'matlab.h'
      INCLUDE 'rtconfig.h'

!---------------------------------------
! Function/Subroutine Declarations 
!---------------------------------------

      REAL    VM3PH2        ! '3 Phase RMS Voltage Measurement'
!     SUBR    PVFarm_GFL_GFM_2_1Dyn  ! 
!     SUBR    Untitled_3Dyn  ! 
!     SUBR    SANDH2        ! Sample and Hold

!---------------------------------------
! Variable Declarations 
!---------------------------------------


! Subroutine Arguments

! Electrical Node Indices
      INTEGER  NT_5(3)

! Control Signals
      INTEGER  BRK_1, S2M, LRR, InitGv, InitEx
      REAL     RT_1, RT_2, RT_3, RT_4, W, RT_5
      REAL     RT_6, RT_7(3), IF, EF, TM, Tmstdy
      REAL     RT_8, RT_9, RT_10, RT_11, RT_12
      REAL     RT_13, RT_14, RT_15, P_tie, P_sync
      REAL     POUT, QOUT, Rang, RelVlv, JetDef

! Internal Variables
      INTEGER  IVD1_1, IVD1_2, IVD1_3, IVD1_4
      REAL     RVD1_1, RVD1_2, RVD1_3, RVD1_4
      REAL     RVD1_5, RVD1_6, RVD1_7, RVD1_8
      REAL     RVD1_9, RVD1_10, RVD1_11, RVD1_12
      REAL     RVD1_13, RVD1_14, RVD1_15, RVD1_16
      REAL     RVD1_17, RVD1_18

! Indexing variables
      INTEGER ICALL_NO                            ! Module call num
      INTEGER ISTOI, ISTOF, IT_0                  ! Storage Indices
      INTEGER SS, INODE, IBRCH, IXFMR             ! SS/Node/Branch/Xfmr


!---------------------------------------
! Local Indices 
!---------------------------------------

! Dsdyn <-> Dsout transfer index storage

      NTXFR = NTXFR + 1

      TXFR(NTXFR,1) = NSTOL
      TXFR(NTXFR,2) = NSTOI
      TXFR(NTXFR,3) = NSTOF
      TXFR(NTXFR,4) = NSTOC

! Define electric network subsystem number

      SS        = NODE(NNODE+1)

! Increment and assign runtime configuration call indices

      ICALL_NO  = NCALL_NO
      NCALL_NO  = NCALL_NO + 1

! Increment global storage indices

      ISTOI     = NSTOI
      NSTOI     = NSTOI + 5
      ISTOF     = NSTOF
      NSTOF     = NSTOF + 29
      NPGB      = NPGB + 3
      INODE     = NNODE + 2
      NNODE     = NNODE + 32
      IBRCH     = NBRCH(SS)
      NBRCH(SS) = NBRCH(SS) + 69
      IXFMR     = NXFMR
      NXFMR     = NXFMR + 5
      NCSCS     = NCSCS + 0
      NCSCR     = NCSCR + 0

!---------------------------------------
! Transfers from storage arrays 
!---------------------------------------

      BRK_1    = STOI(ISTOI + 1)
      RT_1     = STOF(ISTOF + 1)
      RT_2     = STOF(ISTOF + 2)
      RT_3     = STOF(ISTOF + 3)
      RT_4     = STOF(ISTOF + 4)
      W        = STOF(ISTOF + 5)
      RT_5     = STOF(ISTOF + 6)
      RT_6     = STOF(ISTOF + 7)
      IF       = STOF(ISTOF + 11)
      EF       = STOF(ISTOF + 12)
      TM       = STOF(ISTOF + 13)
      Tmstdy   = STOF(ISTOF + 14)
      RT_8     = STOF(ISTOF + 15)
      RT_9     = STOF(ISTOF + 16)
      RT_10    = STOF(ISTOF + 17)
      RT_11    = STOF(ISTOF + 18)
      RT_12    = STOF(ISTOF + 19)
      S2M      = STOI(ISTOI + 2)
      LRR      = STOI(ISTOI + 3)
      RT_13    = STOF(ISTOF + 20)
      RT_14    = STOF(ISTOF + 21)
      RT_15    = STOF(ISTOF + 22)
      P_tie    = STOF(ISTOF + 23)
      InitGv   = STOI(ISTOI + 4)
      InitEx   = STOI(ISTOI + 5)
      P_sync   = STOF(ISTOF + 24)
      POUT     = STOF(ISTOF + 25)
      QOUT     = STOF(ISTOF + 26)
      Rang     = STOF(ISTOF + 27)
      RelVlv   = STOF(ISTOF + 28)
      JetDef   = STOF(ISTOF + 29)

! Array (1:3) quantities...
      DO IT_0 = 1,3
         RT_7(IT_0) = STOF(ISTOF + 7 + IT_0)
      END DO


!---------------------------------------
! Electrical Node Lookup 
!---------------------------------------


! Array (1:3) quantities...
      DO IT_0 = 1,3
         NT_5(IT_0) = NODE(INODE + 18 + IT_0)
      END DO

!---------------------------------------
! Configuration of Models 
!---------------------------------------

      IF ( TIMEZERO ) THEN
         FILENAME = 'Main.dta'
         CALL EMTDC_OPENFILE
         SECTION = 'DATADSD:'
         CALL EMTDC_GOTOSECTION
      ENDIF
!---------------------------------------
! Generated code from module definition 
!---------------------------------------


! 10:[timerdefn]  
!  Timer
      IF(TIME.GE.1.5)THEN
        LRR = 1
      ELSE
        LRR = 0
      END IF
!

! 20:[timerdefn]  
!  Timer
      IF(TIME.GE.1.0)THEN
        S2M = 1
      ELSE
        S2M = 0
      END IF
!

! 30:[const] Real Constant 
      RT_8 = 1.0

! 40:[tbreakn] Timed Breaker Logic 
! Timed breaker logic
      IF ( TIMEZERO ) THEN
         BRK_1 = 0
      ELSE
         BRK_1 = 0
         IF ( TIME .GE. 3.0 ) BRK_1 = (1-0)
      ENDIF

! 60:[PVFarm_GFL_GFM_2_1]  
      CALL PVFarm_GFL_GFM_2_1Dyn(400.0)


! 80:[Untitled_3]  
      CALL Untitled_3Dyn()


! 110:[sandhdefn] Sample and Hold 
!  Sample and Hold
      CALL SANDH2(RT_9,S2M,  1,  RT_10)

! 120:[hy_gov] Hydro Governor 
      CALL COMPONENT_ID(ICALL_NO,2103160779)
! Mechanical-Hydraulic Governor for Hydro Generators.
      CALL HGOV11_EXE(RT_8,W,RT_11,RT_12,InitGv)

! 130:[hy_tur] Hydro Turbine 
      CALL COMPONENT_ID(ICALL_NO,17501172)
! Non-Linear Model of Turbine with Non-Elastic Water Column
      CALL HTUR11_EXE(RT_8,W,Tmstdy,TM,RT_11,0.0,1.0,RT_12,InitGv)
      RelVlv = STORF(THIS+6)
      JetDef = STORF(THIS+7)

! 140:[sync_machine] Synchronous Machine 'HydroGener'
      CALL COMPONENT_ID(ICALL_NO,1540324186)
! RVD1_1 - Speed
! RVD1_2 - Neutral Voltage
! RVD1_3 - Neutral Current
! RVD1_4 - Load Angle
! RVD1_5 - Rotor Mechanical Angle
! RVD1_6 - Real Power output
! RVD1_7 - Reactive Power output
! RVD1_8 - Mechanical Torque
! RVD1_9 - Electrical Torque
! RVD1_10:15 - Monitored STOR locations
! RVD1_16:17 - Terminal Voltage RMS,pu
! RVD1_18 - Inverse of Base MVA
! IVD1_2 - Machine is active, Initialize exciter
! IVD1_3 - Torque driven, Initialize governor/turbine
      STORI(NSTORI) = NINT(STOR(NEXC+294))
      IVD1_1 = NRTCF
      RVD1_1 = RTCF(IVD1_1+2)
      CALL SYNCMC3P2_EXE(SS,  (IBRCH+25), (IBRCH+26), (IBRCH+27), (IBRCH&
     &+28), (IBRCH+29), (IBRCH+30),0.0,0,S2M,1.0,0,LRR,RVD1_1,TM,0,0,1.0&
     &,0.0,376.99111,EF,0,1.0,0,IF,RVD1_2,RVD1_3,RVD1_4,RVD1_5,W,RT_4,RV&
     &D1_6,RVD1_7,RVD1_8,RVD1_9,IVD1_2,IVD1_3,RVD1_10,RVD1_11,RVD1_12,RV&
     &D1_13,RVD1_14,RVD1_15)
      RT_5 = TM
      IF (IVD1_3 .EQ. 0) RT_5 = RVD1_8
      Tmstdy = RVD1_8
      RT_6 = STOR(NEXC-375+265)*STOR(NEXC-375+302)
      IF ((IVD1_2 .EQ. 1) .AND. (STORI(NSTORI).EQ.0)) THEN
          IF (STOR(NEXC-375+293).GT.0.5) THEN
              STORF(NSTORF) = STOR(NEXC-375+161)
          ELSE
              STORF(NSTORF) = STOR(NEXC-375+296)
          ENDIF
      ENDIF
      IF (IVD1_2 .EQ. 1) THEN
        STORF(NSTORF+1) = STORF(NSTORF+1) + (W-RTCF(IVD1_1+2))*DELT
        IF (IVD1_3 .EQ. 0) STORF(NSTORF+2) = RVD1_4
        STORF(NSTORF+3) = STORF(NSTORF) + STORF(NSTORF+1) + STORF(NSTORF&
     &+2)
      ELSE
        STORF(NSTORF+3) = 0.0
      ENDIF
      RVD1_16 = VM3PH2(SS,NT_5(1),NT_5(2),NT_5(3),0.02)/(SQRT_3*RTCF(IVD&
     &1_1+1))
      IF(RVD1_16 .LT. 1.0E-8) THEN
         RVD1_17 = 1.0
      ELSE
         RVD1_17 = RVD1_16
      ENDIF
      RVD1_18 = 1.0/(3.0*RTCF(IVD1_1)*RTCF(IVD1_1+1))
      RT_7(1) = RVD1_17
      IF(RVD1_16 .LT. 1.0E-8) THEN
         RT_7(2) = 0.0
         RT_7(3) = 0.0
      ELSE
         RT_7(2) = RVD1_6*RVD1_18/RVD1_17
         RT_7(3) = -RVD1_7*RVD1_18/RVD1_17
      ENDIF
      W = W/RTCF(IVD1_1+2)
      POUT = RVD1_6/(3.0*RTCF(IVD1_1)*RTCF(IVD1_1+1))
      QOUT = RVD1_7/(3.0*RTCF(IVD1_1)*RTCF(IVD1_1+1))
      Rang = RVD1_5
      InitGv = IVD1_3
      InitEx = IVD1_2
      NSTORF = NSTORF + 4
      NSTORI = NSTORI + 1

! 150:[excac_2016] Type AC Exciter IEEE Std. 421.5-2016 
      CALL COMPONENT_ID(ICALL_NO,1012579388)
! AC Exciter Model AC1C
      CALL EXCAC1C1_EXE(RT_10,RT_7,0.0,IF,RT_6,InitEx,EF,0.0,-1.0E10,0.0&
     &,+1.0E10,0.0,-1.0E10,1.0E10)
      RT_9 = STORF(THIS+3)

! 180:[breaker3] 3 Phase Breaker 'BRK_1'
      IVD1_4 = NSTORI
      NSTORI = NSTORI + 3
! Three Phase Breaker
      CALL EMTDC_BREAKER1(SS, (IBRCH+10),0.005,1000000.0,RTCF(NRTCF),1,N&
     &INT(1.0-REAL(BRK_1)))
      CALL EMTDC_BREAKER1(SS, (IBRCH+11),0.005,1000000.0,RTCF(NRTCF),1,N&
     &INT(1.0-REAL(BRK_1)))
      CALL EMTDC_BREAKER1(SS, (IBRCH+12),0.005,1000000.0,RTCF(NRTCF),1,N&
     &INT(1.0-REAL(BRK_1)))
!
      IVD1_1 = 2*E_BtoI(OPENBR( (IBRCH+10),SS))
      IVD1_2 = 2*E_BtoI(OPENBR( (IBRCH+11),SS))
      IVD1_3 = 2*E_BtoI(OPENBR( (IBRCH+12),SS))
      NRTCF = NRTCF + 1
      IF (FIRSTSTEP .OR. (STORI(IVD1_4+0) .NE. IVD1_1)) THEN
         CALL PSCAD_AGI2(ICALL_NO,217947661,IVD1_1,"BOpen1")
      ENDIF
      IF (FIRSTSTEP .OR. (STORI(IVD1_4+1) .NE. IVD1_2)) THEN
         CALL PSCAD_AGI2(ICALL_NO,217947661,IVD1_2,"BOpen2")
      ENDIF
      IF (FIRSTSTEP .OR. (STORI(IVD1_4+2) .NE. IVD1_3)) THEN
         CALL PSCAD_AGI2(ICALL_NO,217947661,IVD1_3,"BOpen3")
      ENDIF
      STORI(IVD1_4+0) = 2*E_BtoI(OPENBR( (IBRCH+10),SS))
      STORI(IVD1_4+1) = 2*E_BtoI(OPENBR( (IBRCH+11),SS))
      STORI(IVD1_4+2) = 2*E_BtoI(OPENBR( (IBRCH+12),SS))

! 1:[xfmr-3p2w] 3 Phase 2 Winding Transformer 'T1'
!  TRANSFORMER SATURATION SUBROUTINE
      IVD1_1 = NEXC
      CALL TSAT1_EXE( (IBRCH+22), (IBRCH+23), (IBRCH+24),SS,1.0,0)

! 1:[fixed_load] Fixed Load 
      CALL COMPONENT_ID(ICALL_NO,72530395)
      CALL LOAD3P2_EXE(SS, (IBRCH+1), (IBRCH+2), (IBRCH+3), (IBRCH+4), (&
     &IBRCH+5), (IBRCH+6),1.0)

! 1:[fixed_load] Fixed Load 
      CALL COMPONENT_ID(ICALL_NO,578979012)
      CALL LOAD3P2_EXE(SS, (IBRCH+55), (IBRCH+56), (IBRCH+57), (IBRCH+58&
     &), (IBRCH+59), (IBRCH+60),1.0)

!---------------------------------------
! Feedbacks and transfers to storage 
!---------------------------------------

      STOI(ISTOI + 1) = BRK_1
      STOF(ISTOF + 1) = RT_1
      STOF(ISTOF + 2) = RT_2
      STOF(ISTOF + 3) = RT_3
      STOF(ISTOF + 4) = RT_4
      STOF(ISTOF + 5) = W
      STOF(ISTOF + 6) = RT_5
      STOF(ISTOF + 7) = RT_6
      STOF(ISTOF + 11) = IF
      STOF(ISTOF + 12) = EF
      STOF(ISTOF + 13) = TM
      STOF(ISTOF + 14) = Tmstdy
      STOF(ISTOF + 15) = RT_8
      STOF(ISTOF + 16) = RT_9
      STOF(ISTOF + 17) = RT_10
      STOF(ISTOF + 18) = RT_11
      STOF(ISTOF + 19) = RT_12
      STOI(ISTOI + 2) = S2M
      STOI(ISTOI + 3) = LRR
      STOF(ISTOF + 20) = RT_13
      STOF(ISTOF + 21) = RT_14
      STOF(ISTOF + 22) = RT_15
      STOF(ISTOF + 23) = P_tie
      STOI(ISTOI + 4) = InitGv
      STOI(ISTOI + 5) = InitEx
      STOF(ISTOF + 24) = P_sync
      STOF(ISTOF + 25) = POUT
      STOF(ISTOF + 26) = QOUT
      STOF(ISTOF + 27) = Rang
      STOF(ISTOF + 28) = RelVlv
      STOF(ISTOF + 29) = JetDef

! Array (1:3) quantities...
      DO IT_0 = 1,3
         STOF(ISTOF + 7 + IT_0) = RT_7(IT_0)
      END DO


!---------------------------------------
! Transfer to Exports
!---------------------------------------

!---------------------------------------
! Close Model Data read 
!---------------------------------------

      IF ( TIMEZERO ) CALL EMTDC_CLOSEFILE
      RETURN
      END

!=======================================================================

      SUBROUTINE MainOut()

!---------------------------------------
! Standard includes 
!---------------------------------------

      INCLUDE 'nd.h'
      INCLUDE 'emtconst.h'
      INCLUDE 'emtstor.h'
      INCLUDE 's0.h'
      INCLUDE 's1.h'
      INCLUDE 's2.h'
      INCLUDE 's4.h'
      INCLUDE 'branches.h'
      INCLUDE 'pscadv3.h'
      INCLUDE 'fnames.h'
      INCLUDE 'radiolinks.h'
      INCLUDE 'matlab.h'
      INCLUDE 'rtconfig.h'

!---------------------------------------
! Function/Subroutine Declarations 
!---------------------------------------

      REAL    EMTDC_VVDC    ! 
      REAL    P3PH3         ! 
      REAL    Q3PH3         ! 
      REAL    VM3PH2        ! '3 Phase RMS Voltage Measurement'
!     SUBR    PVFarm_GFL_GFM_2_1Out  ! 
!     SUBR    DGTL_RMS3     ! '3 Phase Digital RMS Meter'
!     SUBR    Untitled_3Out  ! 
      REAL    VBRANCH       ! 
!     SUBR    MPHASE3PS     ! Phase Measurement in a 3p signal

!---------------------------------------
! Variable Declarations 
!---------------------------------------


! Electrical Node Indices
      INTEGER  Bus_1(3), Bus_2(3), NT_1(3)
      INTEGER  NT_4(3), NT_6(3), NT_8(3)

! Control Signals
      REAL     RT_1, RT_2, RT_3, RT_8, RT_13
      REAL     RT_14, RT_15, P_tie, P_sync

! Internal Variables
      INTEGER  IVD1_1
      REAL     RVD1_1, RVD3_1(3), RVD1_2, RVD1_3
      REAL     RVD1_4

! Indexing variables
      INTEGER ICALL_NO                            ! Module call num
      INTEGER ISTOL, ISTOI, ISTOF, ISTOC, IT_0    ! Storage Indices
      INTEGER IPGB                                ! Control/Monitoring
      INTEGER SS, INODE, IBRCH, IXFMR             ! SS/Node/Branch/Xfmr


!---------------------------------------
! Local Indices 
!---------------------------------------

! Dsdyn <-> Dsout transfer index storage

      NTXFR = NTXFR + 1

      ISTOL = TXFR(NTXFR,1)
      ISTOI = TXFR(NTXFR,2)
      ISTOF = TXFR(NTXFR,3)
      ISTOC = TXFR(NTXFR,4)

! Define electric network subsystem number

      SS        = NODE(NNODE+1)

! Increment and assign runtime configuration call indices

      ICALL_NO  = NCALL_NO
      NCALL_NO  = NCALL_NO + 1

! Increment global storage indices

      IPGB      = NPGB
      NPGB      = NPGB + 3
      INODE     = NNODE + 2
      NNODE     = NNODE + 32
      IBRCH     = NBRCH(SS)
      NBRCH(SS) = NBRCH(SS) + 69
      IXFMR     = NXFMR
      NXFMR     = NXFMR + 5
      NCSCS     = NCSCS + 0
      NCSCR     = NCSCR + 0

!---------------------------------------
! Transfers from storage arrays 
!---------------------------------------

      RT_1     = STOF(ISTOF + 1)
      RT_2     = STOF(ISTOF + 2)
      RT_3     = STOF(ISTOF + 3)
      RT_8     = STOF(ISTOF + 15)
      RT_13    = STOF(ISTOF + 20)
      RT_14    = STOF(ISTOF + 21)
      RT_15    = STOF(ISTOF + 22)
      P_tie    = STOF(ISTOF + 23)
      P_sync   = STOF(ISTOF + 24)


!---------------------------------------
! Electrical Node Lookup 
!---------------------------------------


! Array (1:3) quantities...
      DO IT_0 = 1,3
         Bus_1(IT_0) = NODE(INODE + 0 + IT_0)
         Bus_2(IT_0) = NODE(INODE + 3 + IT_0)
         NT_1(IT_0) = NODE(INODE + 6 + IT_0)
         NT_4(IT_0) = NODE(INODE + 15 + IT_0)
         NT_6(IT_0) = NODE(INODE + 21 + IT_0)
         NT_8(IT_0) = NODE(INODE + 27 + IT_0)
      END DO

!---------------------------------------
! Configuration of Models 
!---------------------------------------

      IF ( TIMEZERO ) THEN
         FILENAME = 'Main.dta'
         CALL EMTDC_OPENFILE
         SECTION = 'DATADSO:'
         CALL EMTDC_GOTOSECTION
      ENDIF
!---------------------------------------
! Generated code from module definition 
!---------------------------------------


! 30:[const] Real Constant 

      RT_8 = 1.0

! 50:[multimeter] Multimeter 
      IVD1_1 = NRTCF
      NRTCF  = NRTCF + 5
      RVD1_1 = RTCF(IVD1_1) * P3PH3(SS, (IBRCH+13), (IBRCH+14), (IBRCH+1&
     &5),RTCF(IVD1_1+2),0)
      IF (UPDATE_AG) CALL PSCAD_AGR2(ICALL_NO,1099046995,RVD1_1,"Pd")
      P_sync = RVD1_1
      RVD1_1 = RTCF(IVD1_1) * Q3PH3(SS, (IBRCH+13), (IBRCH+14), (IBRCH+1&
     &5),RTCF(IVD1_1+2),0)
      IF (UPDATE_AG) CALL PSCAD_AGR2(ICALL_NO,1099046995,RVD1_1,"Qd")
      RVD1_1 = RTCF(IVD1_1+1) * VM3PH2(SS, NT_1(1), NT_1(2), NT_1(3), RT&
     &CF(IVD1_1+2))
      IF (UPDATE_AG) CALL PSCAD_AGR2(ICALL_NO,1099046995,RVD1_1,"Vd")
      IF (FIRSTSTEP) THEN
        CALL PSCAD_AGI2(ICALL_NO,1099046995,1,"hide1")
        CALL PSCAD_AGI2(ICALL_NO,1099046995,1,"hide2")
      ENDIF

! 60:[PVFarm_GFL_GFM_2_1]  
      CALL PVFarm_GFL_GFM_2_1Out()


! 70:[multimeter] Multimeter 
      IVD1_1 = NRTCF
      NRTCF  = NRTCF + 5
      RVD1_1 = RTCF(IVD1_1) * P3PH3(SS, (IBRCH+61), (IBRCH+62), (IBRCH+6&
     &3),RTCF(IVD1_1+2),0)
      IF (UPDATE_AG) CALL PSCAD_AGR2(ICALL_NO,1186062679,RVD1_1,"Pd")
      P_tie = RVD1_1
      RVD1_1 = RTCF(IVD1_1) * Q3PH3(SS, (IBRCH+61), (IBRCH+62), (IBRCH+6&
     &3),RTCF(IVD1_1+2),0)
      IF (UPDATE_AG) CALL PSCAD_AGR2(ICALL_NO,1186062679,RVD1_1,"Qd")
      CALL DGTL_RMS3(256,SS,NT_8(1),NT_8(2),NT_8(3),RTCF(IVD1_1+3),1.0,0&
     &.0,RVD1_1)
      RVD1_1 = RTCF(IVD1_1+1)*RVD1_1
      IF (UPDATE_AG) CALL PSCAD_AGR2(ICALL_NO,1186062679,RVD1_1,"Vd")
      IF (FIRSTSTEP) THEN
        CALL PSCAD_AGI2(ICALL_NO,1186062679,1,"hide1")
        CALL PSCAD_AGI2(ICALL_NO,1186062679,1,"hide2")
      ENDIF

! 80:[Untitled_3]  
      CALL Untitled_3Out()


! 90:[freq-meas] Frequency/Incremental Phase/RMS Meter 
      RVD3_1(1) = VDC(Bus_2(1),SS)
      RVD3_1(2) = VDC(Bus_2(2),SS)
      RVD3_1(3) = VDC(Bus_2(3),SS)
      CALL E_FWAV1_EXE ( RVD3_1 ,  RT_14 , RT_15 , RT_13 )
      RT_14 = BY_2PI * RT_14
!

! 100:[freq-meas] Frequency/Incremental Phase/RMS Meter 
      RVD3_1(1) = VDC(Bus_1(1),SS)
      RVD3_1(2) = VDC(Bus_1(2),SS)
      RVD3_1(3) = VDC(Bus_1(3),SS)
      CALL E_FWAV1_EXE ( RVD3_1 ,  RT_2 , RT_3 , RT_1 )
      RT_2 = BY_2PI * RT_2
!

! 160:[pgb] Output Channel 'f_bus_1'

      PGB(IPGB+1) = RT_2

! 170:[pgb] Output Channel 'f_bus2'

      PGB(IPGB+2) = RT_14

! 180:[breaker3] 3 Phase Breaker 'BRK_1'
! Three Phase Breaker Currents
      CALL BRK_POWER(SS, (IBRCH+10), (IBRCH+11), (IBRCH+12),0,0,0,IVD1_1&
     &,0.02,RVD1_1,RVD1_2)

! 190:[pgb] Output Channel 'P_tie'

      PGB(IPGB+3) = P_tie

! 1:[multimeter] Multimeter 
      IVD1_1 = NRTCF
      NRTCF  = NRTCF + 5
      RVD1_1 = RTCF(IVD1_1) * P3PH3(SS, (IBRCH+67), (IBRCH+68), (IBRCH+6&
     &9),RTCF(IVD1_1+2),0)
      IF (UPDATE_AG) CALL PSCAD_AGR2(ICALL_NO,1436595873,RVD1_1,"Pd")
      RVD1_1 = RTCF(IVD1_1) * Q3PH3(SS, (IBRCH+67), (IBRCH+68), (IBRCH+6&
     &9),RTCF(IVD1_1+2),0)
      IF (UPDATE_AG) CALL PSCAD_AGR2(ICALL_NO,1436595873,RVD1_1,"Qd")
      RVD1_1 = RTCF(IVD1_1+1) * VM3PH2(SS, NT_6(1), NT_6(2), NT_6(3), RT&
     &CF(IVD1_1+2))
      IF (UPDATE_AG) CALL PSCAD_AGR2(ICALL_NO,1436595873,RVD1_1,"Vd")
      IF (FIRSTSTEP) THEN
        CALL PSCAD_AGI2(ICALL_NO,1436595873,1,"hide1")
        CALL PSCAD_AGI2(ICALL_NO,1436595873,1,"hide2")
      ENDIF

! 1:[multimeter] Multimeter 
      IVD1_1 = NRTCF
      NRTCF  = NRTCF + 5
      RVD1_1 = RTCF(IVD1_1) * P3PH3(SS, (IBRCH+7), (IBRCH+8), (IBRCH+9),&
     &RTCF(IVD1_1+2),0)
      IF (UPDATE_AG) CALL PSCAD_AGR2(ICALL_NO,1533821605,RVD1_1,"Pd")
      RVD1_1 = RTCF(IVD1_1) * Q3PH3(SS, (IBRCH+7), (IBRCH+8), (IBRCH+9),&
     &RTCF(IVD1_1+2),0)
      IF (UPDATE_AG) CALL PSCAD_AGR2(ICALL_NO,1533821605,RVD1_1,"Qd")
      RVD1_2 = EMTDC_VVDC(SS, NT_4(1), 0)
      RVD1_3 = EMTDC_VVDC(SS, NT_4(2), 0)
      RVD1_4 = EMTDC_VVDC(SS, NT_4(3), 0)
      CALL MPHASE3PS(1, 1, RVD1_2, RVD1_3, RVD1_4, RTCF(IVD1_1+2), RTCF(&
     &IVD1_1+3) , RVD1_1)
      IF (FIRSTSTEP) THEN
        CALL PSCAD_AGI2(ICALL_NO,1533821605,1,"hide1")
        CALL PSCAD_AGI2(ICALL_NO,1533821605,1,"hide2")
      ENDIF

! 1:[multimeter] Multimeter 
      IVD1_1 = NRTCF
      NRTCF  = NRTCF + 5
      RVD1_1 = RTCF(IVD1_1) * P3PH3(SS, (IBRCH+64), (IBRCH+65), (IBRCH+6&
     &6),RTCF(IVD1_1+2),0)
      IF (UPDATE_AG) CALL PSCAD_AGR2(ICALL_NO,968465000,RVD1_1,"Pd")
      RVD1_1 = RTCF(IVD1_1) * Q3PH3(SS, (IBRCH+64), (IBRCH+65), (IBRCH+6&
     &6),RTCF(IVD1_1+2),0)
      IF (UPDATE_AG) CALL PSCAD_AGR2(ICALL_NO,968465000,RVD1_1,"Qd")
      IF (FIRSTSTEP) THEN
        CALL PSCAD_AGI2(ICALL_NO,968465000,1,"hide1")
        CALL PSCAD_AGI2(ICALL_NO,968465000,1,"hide2")
      ENDIF

!---------------------------------------
! Feedbacks and transfers to storage 
!---------------------------------------

      STOF(ISTOF + 1) = RT_1
      STOF(ISTOF + 2) = RT_2
      STOF(ISTOF + 3) = RT_3
      STOF(ISTOF + 15) = RT_8
      STOF(ISTOF + 20) = RT_13
      STOF(ISTOF + 21) = RT_14
      STOF(ISTOF + 22) = RT_15
      STOF(ISTOF + 23) = P_tie
      STOF(ISTOF + 24) = P_sync


!---------------------------------------
! Close Model Data read 
!---------------------------------------

      IF ( TIMEZERO ) CALL EMTDC_CLOSEFILE
      RETURN
      END

!=======================================================================

      SUBROUTINE MainDyn_Begin()

!---------------------------------------
! Standard includes 
!---------------------------------------

      INCLUDE 'nd.h'
      INCLUDE 'emtconst.h'
      INCLUDE 's0.h'
      INCLUDE 's1.h'
      INCLUDE 's4.h'
      INCLUDE 'branches.h'
      INCLUDE 'pscadv3.h'
      INCLUDE 'radiolinks.h'
      INCLUDE 'rtconfig.h'

!---------------------------------------
! Function/Subroutine Declarations 
!---------------------------------------

!     SUBR    PVFarm_GFL_GFM_2_1Dyn_Begin  ! 
!     SUBR    Untitled_3Dyn_Begin  ! 

!---------------------------------------
! Variable Declarations 
!---------------------------------------


! Subroutine Arguments

! Electrical Node Indices

! Control Signals
      REAL     RT_8

! Internal Variables
      INTEGER  IVD1_1, IVD1_2, IVD1_3, IVD1_4
      REAL     RVD1_1, RVD1_2, RVD1_3, RVD1_4
      REAL     RVD1_5, RVD1_6, RVD10_1(10)
      REAL     RVD10_2(10)

! Indexing variables
      INTEGER ICALL_NO                            ! Module call num
      INTEGER IT_0                                ! Storage Indices
      INTEGER SS, INODE, IBRCH, IXFMR             ! SS/Node/Branch/Xfmr


!---------------------------------------
! Local Indices 
!---------------------------------------


! Define electric network subsystem number

      SS        = NODE(NNODE+1)

! Increment and assign runtime configuration call indices

      ICALL_NO  = NCALL_NO
      NCALL_NO  = NCALL_NO + 1

! Increment global storage indices

      INODE     = NNODE + 2
      NNODE     = NNODE + 32
      IBRCH     = NBRCH(SS)
      NBRCH(SS) = NBRCH(SS) + 69
      IXFMR     = NXFMR
      NXFMR     = NXFMR + 5
      NCSCS     = NCSCS + 0
      NCSCR     = NCSCR + 0

!---------------------------------------
! Electrical Node Lookup 
!---------------------------------------


!---------------------------------------
! Generated code from module definition 
!---------------------------------------


! 10:[timerdefn]  

! 20:[timerdefn]  

! 30:[const] Real Constant 
      RT_8 = 1.0

! 60:[PVFarm_GFL_GFM_2_1]  
      CALL PVFarm_GFL_GFM_2_1Dyn_Begin(400.0)


! 80:[Untitled_3]  
      CALL Untitled_3Dyn_Begin()


! 110:[sandhdefn] Sample and Hold 

! 120:[hy_gov] Hydro Governor 
      CALL COMPONENT_ID(ICALL_NO,2103160779)
      CALL HGOV11_CFG(0.0,0.02,5.0,0.3,0.3,1.0,0.0,0.08,0.04,0.05,5.0)

! 130:[hy_tur] Hydro Turbine 
      CALL COMPONENT_ID(ICALL_NO,17501172)
      RVD1_1 = 0.05
      RVD1_2 = SQRT(1.0/(0.02+1.0/(1.0*1.0)))
      RVD1_3 = 1.0/(0.02*1.0*1.0+1.0)
      RVD1_4 = 1.0/(RVD1_3*(RVD1_2-RVD1_1))
      CALL HTUR11_CFG(RVD1_4,RVD1_1,1.0,0.02,0.5,1.0)

! 140:[sync_machine] Synchronous Machine 'HydroGener'
      CALL COMPONENT_ID(ICALL_NO,1540324186)
      RVD10_1 = 0.0
      RVD10_2 = 0.0
      RVD10_1(2) = 1.0
      RVD10_2(2) = SQRT_2/(1.014-0.163*1.0)
      RVD10_1(3) = -1.0
      CALL SYNCMC3P0_CFG(1,0,1,376.99111,0.0051716, 0.163,1.0,1.014,0.28&
     &,0.314,1.0E-6, 0.77,0.375,0.228,RVD1_1,RVD1_2,RVD1_3)
      RVD1_6 = 5.02
      CALL SYNCMC3P2_CFG(1,1,0,1,1,1,1,1,1,RVD1_6,19.05,376.99111,10000.&
     &0,0.0,9.0,0.0,300.0,RVD1_1,RVD1_2,1.014,0.28, 0.039,0.314,6.55,1.0&
     &E6,1.0E6, 0.77,0.375,0.071, 1.0E6,1.0E6, RVD10_1,RVD10_2, 1.05,0.0&
     &,0.0,0.0,0.0, 0.1,100.0,0.2,1.05,0.0,20.0,10.0)

! 150:[excac_2016] Type AC Exciter IEEE Std. 421.5-2016 
      CALL COMPONENT_ID(ICALL_NO,1012579388)
      CALL EXCAC1C1_CFG(0.0,0.0,400.0,0.02,14.5,-14.5,6.03,-5.43,99.0,0.&
     &0,0.1,4.18,0.03,3.14,0.8,1.0,0.38,0.2,0.03,1.0,0.0,0.0,0.0)

! 180:[breaker3] 3 Phase Breaker 'BRK_1'
      CALL COMPONENT_ID(ICALL_NO,217947661)
      RTCF(NRTCF) = ABS(0.0)
      NRTCF = NRTCF + 1

! 1:[xfmr-3p2w] 3 Phase 2 Winding Transformer 'T1'
      CALL COMPONENT_ID(ICALL_NO,689007143)
      RVD1_1 = ONE_3RD*100.0
      RVD1_2 = 33.0
      RVD1_3 = 120.0*SQRT_1BY3
      CALL E_TF2W_CFG((IXFMR + 1),0,RVD1_1,60.0,0.08,0.0,RVD1_2,RVD1_3,1&
     &.0)
      CALL E_TF2W_CFG((IXFMR + 2),0,RVD1_1,60.0,0.08,0.0,RVD1_2,RVD1_3,1&
     &.0)
      CALL E_TF2W_CFG((IXFMR + 3),0,RVD1_1,60.0,0.08,0.0,RVD1_2,RVD1_3,1&
     &.0)
      IF (0.0 .LT. 1.0E-6) THEN
        RVD1_5 = 0.0
        RVD1_6 = 0.0
        IVD1_1 = 0
      ELSE
        RVD1_6 = 0.0
        RVD1_4 = 6.0/(100.0*RVD1_6)
        RVD1_5 = RVD1_4*RVD1_2*RVD1_2
        RVD1_6 = RVD1_4*RVD1_3*RVD1_3
        IVD1_1 = 1
      ENDIF
      CALL E_BRANCH_CFG( (IBRCH+16),SS,IVD1_1,0,0,RVD1_5,0.0,0.0)
      CALL E_BRANCH_CFG( (IBRCH+17),SS,IVD1_1,0,0,RVD1_5,0.0,0.0)
      CALL E_BRANCH_CFG( (IBRCH+18),SS,IVD1_1,0,0,RVD1_5,0.0,0.0)
      CALL E_BRANCH_CFG( (IBRCH+19),SS,IVD1_1,0,0,RVD1_6,0.0,0.0)
      CALL E_BRANCH_CFG( (IBRCH+20),SS,IVD1_1,0,0,RVD1_6,0.0,0.0)
      CALL E_BRANCH_CFG( (IBRCH+21),SS,IVD1_1,0,0,RVD1_6,0.0,0.0)
      CALL TSAT1_CFG( (IBRCH+22), (IBRCH+23), (IBRCH+24),SS,RVD1_1,RVD1_&
     &3,0.2,1.17,60.0,0.0,1.0,0.0)

! 1:[newpi] Coupled Pi Section Transmission Line 'Line1'
      CALL COMPONENT_ID(ICALL_NO,1212054296)
      CALL PI3_SECTION_CFG(3,1,0, 33.0,100.0,60.0,1000.0,3.36786e-08,5.9&
     &3346e-07,1.933869e-08,5.58072e-07,1.96578e-06,1.277271e-08,RVD1_1,&
     &RVD1_2,RVD1_3,RVD1_4,RVD1_5,RVD1_6,IVD1_1,IVD1_2,IVD1_3,IVD1_4)
      CALL E_BRANCH_CFG( (IBRCH+31),SS,0,0,IVD1_3,0.0,0.0,RVD1_6)
      CALL E_BRANCH_CFG( (IBRCH+32),SS,0,0,IVD1_3,0.0,0.0,RVD1_6)
      CALL E_BRANCH_CFG( (IBRCH+33),SS,0,0,IVD1_3,0.0,0.0,RVD1_6)
      CALL E_BRANCH_CFG( (IBRCH+34),SS,0,0,IVD1_3,0.0,0.0,RVD1_6)
      CALL E_BRANCH_CFG( (IBRCH+35),SS,0,0,IVD1_3,0.0,0.0,RVD1_6)
      CALL E_BRANCH_CFG( (IBRCH+36),SS,0,0,IVD1_3,0.0,0.0,RVD1_6)
      CALL E_BRANCH_CFG( (IBRCH+37),SS,0,0,IVD1_4,0.0,0.0,RVD1_3)
      CALL E_BRANCH_CFG( (IBRCH+38),SS,0,0,IVD1_4,0.0,0.0,RVD1_3)
      CALL E_BRANCH_CFG( (IBRCH+39),SS,0,0,IVD1_4,0.0,0.0,RVD1_3)
      CALL E_BRANCH_CFG( (IBRCH+40),SS,0,0,IVD1_4,0.0,0.0,RVD1_3)
      CALL E_BRANCH_CFG( (IBRCH+41),SS,0,0,IVD1_4,0.0,0.0,RVD1_3)
      CALL E_BRANCH_CFG( (IBRCH+42),SS,0,0,IVD1_4,0.0,0.0,RVD1_3)
      CALL COUPLED_PI3_TF_CFG((IXFMR + 4),2,RVD1_1,RVD1_2,RVD1_4,RVD1_5)

! 1:[newpi] Coupled Pi Section Transmission Line 'Line1'
      CALL COMPONENT_ID(ICALL_NO,156612499)
      CALL PI3_SECTION_CFG(3,1,0, 33.0,100.0,60.0,30000.0,3.36786e-05,0.&
     &0023346,1.933869e-08,0.000558072,0.00196578,1.277271e-06,RVD1_1,RV&
     &D1_2,RVD1_3,RVD1_4,RVD1_5,RVD1_6,IVD1_1,IVD1_2,IVD1_3,IVD1_4)
      CALL E_BRANCH_CFG( (IBRCH+43),SS,0,0,IVD1_3,0.0,0.0,RVD1_6)
      CALL E_BRANCH_CFG( (IBRCH+44),SS,0,0,IVD1_3,0.0,0.0,RVD1_6)
      CALL E_BRANCH_CFG( (IBRCH+45),SS,0,0,IVD1_3,0.0,0.0,RVD1_6)
      CALL E_BRANCH_CFG( (IBRCH+46),SS,0,0,IVD1_3,0.0,0.0,RVD1_6)
      CALL E_BRANCH_CFG( (IBRCH+47),SS,0,0,IVD1_3,0.0,0.0,RVD1_6)
      CALL E_BRANCH_CFG( (IBRCH+48),SS,0,0,IVD1_3,0.0,0.0,RVD1_6)
      CALL E_BRANCH_CFG( (IBRCH+49),SS,0,0,IVD1_4,0.0,0.0,RVD1_3)
      CALL E_BRANCH_CFG( (IBRCH+50),SS,0,0,IVD1_4,0.0,0.0,RVD1_3)
      CALL E_BRANCH_CFG( (IBRCH+51),SS,0,0,IVD1_4,0.0,0.0,RVD1_3)
      CALL E_BRANCH_CFG( (IBRCH+52),SS,0,0,IVD1_4,0.0,0.0,RVD1_3)
      CALL E_BRANCH_CFG( (IBRCH+53),SS,0,0,IVD1_4,0.0,0.0,RVD1_3)
      CALL E_BRANCH_CFG( (IBRCH+54),SS,0,0,IVD1_4,0.0,0.0,RVD1_3)
      CALL COUPLED_PI3_TF_CFG((IXFMR + 5),2,RVD1_1,RVD1_2,RVD1_4,RVD1_5)

! 1:[fixed_load] Fixed Load 
      CALL COMPONENT_ID(ICALL_NO,72530395)
      CALL LOAD1P2_CFG(0,1,69.28,1.0,60.0,33.3,7.0,10.0,0.0,0.0,1.0,2.0,&
     &1.0,1.0,1.0,1.0,0.0,0.0,1.0,1.0)

! 1:[fixed_load] Fixed Load 
      CALL COMPONENT_ID(ICALL_NO,578979012)
      CALL LOAD1P2_CFG(0,1,69.28,1.05,60.0,60.0,7.0,10.0,0.0,0.0,1.0,2.0&
     &,1.0,1.0,1.0,1.0,0.0,0.0,1.0,1.0)

      RETURN
      END

!=======================================================================

      SUBROUTINE MainOut_Begin()

!---------------------------------------
! Standard includes 
!---------------------------------------

      INCLUDE 'nd.h'
      INCLUDE 'emtconst.h'
      INCLUDE 's0.h'
      INCLUDE 's1.h'
      INCLUDE 's4.h'
      INCLUDE 'branches.h'
      INCLUDE 'pscadv3.h'
      INCLUDE 'radiolinks.h'
      INCLUDE 'rtconfig.h'

!---------------------------------------
! Function/Subroutine Declarations 
!---------------------------------------

!     SUBR    PVFarm_GFL_GFM_2_1Out_Begin  ! 
!     SUBR    Untitled_3Out_Begin  ! 

!---------------------------------------
! Variable Declarations 
!---------------------------------------


! Subroutine Arguments

! Electrical Node Indices
      INTEGER  NT_4(3)

! Control Signals
      REAL     RT_8

! Internal Variables
      INTEGER  IVD1_1

! Indexing variables
      INTEGER ICALL_NO                            ! Module call num
      INTEGER IT_0                                ! Storage Indices
      INTEGER SS, INODE, IBRCH, IXFMR             ! SS/Node/Branch/Xfmr


!---------------------------------------
! Local Indices 
!---------------------------------------


! Define electric network subsystem number

      SS        = NODE(NNODE+1)

! Increment and assign runtime configuration call indices

      ICALL_NO  = NCALL_NO
      NCALL_NO  = NCALL_NO + 1

! Increment global storage indices

      INODE     = NNODE + 2
      NNODE     = NNODE + 32
      IBRCH     = NBRCH(SS)
      NBRCH(SS) = NBRCH(SS) + 69
      IXFMR     = NXFMR
      NXFMR     = NXFMR + 5
      NCSCS     = NCSCS + 0
      NCSCR     = NCSCR + 0

!---------------------------------------
! Electrical Node Lookup 
!---------------------------------------


! Array (1:3) quantities...
      DO IT_0 = 1,3
         NT_4(IT_0) = NODE(INODE + 15 + IT_0)
      END DO

!---------------------------------------
! Generated code from module definition 
!---------------------------------------


! 30:[const] Real Constant 
      RT_8 = 1.0

! 50:[multimeter] Multimeter 
      IVD1_1 = NRTCF
      NRTCF  = NRTCF + 5
      IF (ABS(1.0) .GT. 1.0E-20) THEN
        RTCF(IVD1_1) = 1.0/ABS(1.0)
      ELSE
        RTCF(IVD1_1) = 1.0
      ENDIF
      IF (ABS(1.0) .GT. 1.0E-20) THEN
        RTCF(IVD1_1+1) = 1.0/ABS(1.0)
      ELSE
        RTCF(IVD1_1+1) = 1.0
      ENDIF
      RTCF(IVD1_1+2) = 0.02

! 60:[PVFarm_GFL_GFM_2_1]  
      CALL PVFarm_GFL_GFM_2_1Out_Begin(400.0)


! 70:[multimeter] Multimeter 
      IVD1_1 = NRTCF
      NRTCF  = NRTCF + 5
      IF (ABS(1.0) .GT. 1.0E-20) THEN
        RTCF(IVD1_1) = 1.0/ABS(1.0)
      ELSE
        RTCF(IVD1_1) = 1.0
      ENDIF
      IF (ABS(1.0) .GT. 1.0E-20) THEN
        RTCF(IVD1_1+1) = 1.0/ABS(1.0)
      ELSE
        RTCF(IVD1_1+1) = 1.0
      ENDIF
      RTCF(IVD1_1+2) = 0.02
      RTCF(IVD1_1+3) = 60.0

! 80:[Untitled_3]  
      CALL Untitled_3Out_Begin()


! 90:[freq-meas] Frequency/Incremental Phase/RMS Meter 
      CALL COMPONENT_ID(ICALL_NO,1916297965)
      CALL E_FWAV1_CFG(120.0 , 60.0 , 0.02)

! 100:[freq-meas] Frequency/Incremental Phase/RMS Meter 
      CALL COMPONENT_ID(ICALL_NO,2137069062)
      CALL E_FWAV1_CFG(120.0 , 60.0 , 0.02)

! 160:[pgb] Output Channel 'f_bus_1'

! 170:[pgb] Output Channel 'f_bus2'

! 190:[pgb] Output Channel 'P_tie'

! 1:[multimeter] Multimeter 
      IVD1_1 = NRTCF
      NRTCF  = NRTCF + 5
      IF (ABS(1.0) .GT. 1.0E-20) THEN
        RTCF(IVD1_1) = 1.0/ABS(1.0)
      ELSE
        RTCF(IVD1_1) = 1.0
      ENDIF
      IF (ABS(1.0) .GT. 1.0E-20) THEN
        RTCF(IVD1_1+1) = 1.0/ABS(1.0)
      ELSE
        RTCF(IVD1_1+1) = 1.0
      ENDIF
      RTCF(IVD1_1+2) = 0.02

! 1:[multimeter] Multimeter 
      IVD1_1 = NRTCF
      NRTCF  = NRTCF + 5
      IF (ABS(1.0) .GT. 1.0E-20) THEN
        RTCF(IVD1_1) = 1.0/ABS(1.0)
      ELSE
        RTCF(IVD1_1) = 1.0
      ENDIF
      RTCF(IVD1_1+2) = 0.02
      RTCF(IVD1_1+3) = 60.0

! 1:[multimeter] Multimeter 
      IVD1_1 = NRTCF
      NRTCF  = NRTCF + 5
      IF (ABS(1.0) .GT. 1.0E-20) THEN
        RTCF(IVD1_1) = 1.0/ABS(1.0)
      ELSE
        RTCF(IVD1_1) = 1.0
      ENDIF
      RTCF(IVD1_1+2) = 0.02

      RETURN
      END

