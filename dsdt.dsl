/*
 * Intel ACPI Component Architecture
 * AML Disassembler version 20130328-64 [Apr  5 2013]
 * Copyright (c) 2000 - 2013 Intel Corporation
 * 
 * Disassembly of dsdt.dat, Mon Apr 29 23:02:39 2013
 *
 * Original Table Header:
 *     Signature        "DSDT"
 *     Length           0x00011490 (70800)
 *     Revision         0x01 **** 32-bit table (V1), no 64-bit math support
 *     Checksum         0xDC
 *     OEM ID           "HP    "
 *     OEM Table ID     "INSYDE  "
 *     OEM Revision     0xF0000000 (4026531840)
 *     Compiler ID      "ACPI"
 *     Compiler Version 0x00040000 (262144)
 */
DefinitionBlock ("dsdt.aml", "DSDT", 1, "HP    ", "INSYDE  ", 0xF0000000)
{
    /*
     * iASL Warning: There were 1 external control methods found during
     * disassembly, but additional ACPI tables to resolve these externals
     * were not specified. This resulting disassembler output file may not
     * compile because the disassembler did not know how many arguments
     * to assign to these methods. To specify the tables needed to resolve
     * external control method references, use the one of the following
     * example iASL invocations:
     *     iasl -e <ssdt1.aml,ssdt2.aml...> -d <dsdt.aml>
     *     iasl -e <dsdt.aml,ssdt2.aml...> -d <ssdt1.aml>
     */
    External (_PR_.C000._PPC, IntObj)
    External (_PR_.C001._PPC)
    External (_PR_.C002._PPC)
    External (_PR_.C003._PPC)
    External (ALIB, MethodObj)    // Warning: unresolved Method, assuming 2 arguments (may be incorrect, see warning above)

    OperationRegion (SPRT, SystemIO, 0xB0, 0x02)
    Field (SPRT, ByteAcc, Lock, Preserve)
    {
        SSMP,   8
    }

    OperationRegion (CMS1, SystemIO, 0x72, 0x02)
    Field (CMS1, ByteAcc, NoLock, Preserve)
    {
        CMSI,   8, 
        CMSD,   8
    }

    IndexField (CMSI, CMSD, ByteAcc, NoLock, Preserve)
    {
        Offset (0x82), 
        GDAF,   8, 
        GDA0,   8, 
        CDAF,   8, 
        CDA0,   8, 
        FDAF,   8, 
        FDA0,   8, 
        BDAF,   8, 
        BDA0,   8, 
        Offset (0xC1), 
        IOSF,   1, 
        Offset (0xC5), 
        EFID,   8, 
        EFI1,   8, 
        WANT,   1, 
        Offset (0xC8), 
        GPSF,   1, 
        Offset (0xD2), 
        WLWI,   1, 
        BTWI,   1, 
        WWWI,   1, 
        BTNS,   1, 
        SIMD,   1, 
        WAPT,   1, 
        Offset (0xD3), 
        WLBK,   1, 
        BTBK,   1, 
        WWBK,   1, 
        BTNB,   1, 
        Offset (0xD4), 
        WBCB,   1, 
        Offset (0xD6), 
        UND0,   1, 
        UND1,   1, 
        UND2,   1, 
        Offset (0xE0), 
        S4FG,   8, 
        HOTW,   8, 
        Offset (0xF7), 
        HSDC,   8, 
        HSDS,   8, 
        HBUC,   8, 
        HBUS,   8
    }

    Method (CMSW, 2, NotSerialized)
    {
        Store (Arg0, CMSI)
        Store (Arg1, CMSD)
    }

    OperationRegion (DBG0, SystemIO, 0x80, One)
    Field (DBG0, ByteAcc, NoLock, Preserve)
    {
        IO80,   8
    }

    OperationRegion (DBG1, SystemIO, 0x80, 0x02)
    Field (DBG1, WordAcc, NoLock, Preserve)
    {
        P80H,   16
    }

    OperationRegion (ACMS, SystemIO, 0x72, 0x02)
    Field (ACMS, ByteAcc, NoLock, Preserve)
    {
        INDX,   8, 
        DATA,   8
    }

    IndexField (INDX, DATA, ByteAcc, NoLock, Preserve)
    {
        BRLS,   8, 
        BCMF,   8
    }

    OperationRegion (PSMI, SystemIO, 0xB0, 0x02)
    Field (PSMI, ByteAcc, NoLock, Preserve)
    {
        APMC,   8, 
        APMD,   8
    }

    OperationRegion (PMRG, SystemIO, 0x0CD6, 0x02)
    Field (PMRG, ByteAcc, NoLock, Preserve)
    {
        PMRI,   8, 
        PMRD,   8
    }

    IndexField (PMRI, PMRD, ByteAcc, NoLock, Preserve)
    {
        Offset (0x24), 
        MMSO,   32, 
        Offset (0x50), 
        HPAD,   32, 
        Offset (0x60), 
        P1EB,   16, 
        Offset (0xC8), 
            ,   2, 
        SPRE,   1, 
        TPDE,   1, 
        Offset (0xF0), 
            ,   3, 
        RSTU,   1
    }

    OperationRegion (P1E0, SystemIO, P1EB, 0x04)
    Field (P1E0, ByteAcc, NoLock, Preserve)
    {
            ,   14, 
        PEWS,   1, 
        WSTA,   1, 
            ,   14, 
        PEWD,   1
    }

    OperationRegion (IOCC, SystemIO, 0x0400, 0x80)
    Field (IOCC, ByteAcc, NoLock, Preserve)
    {
        Offset (0x01), 
            ,   2, 
        RTCS,   1
    }

    Name (PRWP, Package (0x02)
    {
        Zero, 
        Zero
    })
    Method (GPRW, 2, NotSerialized)
    {
        Store (Arg0, Index (PRWP, Zero))
        Store (Arg1, Index (PRWP, One))
        If (LAnd (LEqual (DAS3, Zero), LEqual (DAS1, Zero)))
        {
            If (LLessEqual (Arg1, 0x03))
            {
                Store (Zero, Index (PRWP, One))
            }
        }
        Else
        {
            If (LAnd (LEqual (DAS3, Zero), LEqual (Arg1, 0x03)))
            {
                Store (Zero, Index (PRWP, One))
            }

            If (LAnd (LEqual (DAS1, Zero), LEqual (Arg1, One)))
            {
                Store (Zero, Index (PRWP, One))
            }
        }

        Return (PRWP)
    }

    Method (SPTS, 1, NotSerialized)
    {
        If (LEqual (Arg0, 0x03))
        {
            Store (Zero, RSTU)
        }

        Store (One, \_SB.PCI0.SMBS.CLPS)
        Store (One, \_SB.PCI0.SMBS.SLPS)
        Store (PEWS, PEWS)
    }

    Method (SWAK, 1, NotSerialized)
    {
        If (LEqual (Arg0, 0x03))
        {
            Store (One, RSTU)
        }

        Store (PEWS, PEWS)
        Store (One, \_SB.PCI0.SMBS.PWDE)
        Store (Zero, PEWD)
    }

    Method (CHKH, 0, NotSerialized)
    {
        If (\_SB.PCI0.SMBS.G05S)
        {
            Store (One, \_SB.PCI0.SMBS.G05T)
        }
        Else
        {
            Store (Zero, \_SB.PCI0.SMBS.G05T)
        }

        Store (Not (\_SB.PCI0.SMBS.GE16), \_SB.PCI0.SMBS.G16T)
    }

    OperationRegion (GNVS, SystemMemory, 0xAFEBED98, 0x00000013)
    Field (GNVS, AnyAcc, NoLock, Preserve)
    {
        DAS1,   8, 
        DAS3,   8, 
        TNBH,   8, 
        TCP0,   8, 
        TCP1,   8, 
        ATNB,   8, 
        PCP0,   8, 
        PCP1,   8, 
        PWMN,   8, 
        LPTY,   8, 
        M92D,   8, 
        WKPM,   8, 
        ALST,   8, 
        AFUC,   8, 
        EXUS,   8, 
        AIRC,   8, 
        WLSH,   8, 
        TSSS,   8, 
        ODZC,   8
    }

    OperationRegion (OGNS, SystemMemory, 0xAFEB9018, 0x000010B6)
    Field (OGNS, AnyAcc, Lock, Preserve)
    {
        SERN,   80, 
        MDID,   256, 
        GUID,   64, 
        UUID,   128, 
        SKUN,   96, 
        LCOD,   24, 
        MACA,   48, 
        KBMX,   8, 
        CHID,   8, 
        OSKU,   8, 
        QKPM,   8, 
        WPFL,   8, 
        DBSW,   8, 
        WPCR,   8, 
        WINA,   8, 
        GPSA,   8, 
        MSME,   8, 
        PREV,   24, 
        ODDC,   8, 
        WIN7,   8, 
        IMID,   8, 
        WSDY,   32, 
        WSDM,   16, 
        WSDD,   16, 
        CTNU,   112, 
        ESTL,   8, 
        Offset (0x1000), 
        HWCT,   8, 
        HWBC,   8, 
        HWRC,   8, 
        HWBF,   1024, 
        IAOR,   8, 
        CDAT,   32, 
        WLVD,   16, 
        WLDD,   16, 
        WLSV,   16, 
        WLSS,   16, 
        BTVD,   16, 
        BTDD,   16, 
        WWVD,   16, 
        WWDD,   16, 
        GPVD,   16, 
        GPDD,   16, 
        FACM,   16, 
        SMA4,   8, 
        WIVD,   16, 
        WIDD,   16, 
        OG00,   8, 
        OG01,   8, 
        OG02,   8, 
        OG03,   8, 
        OG04,   8, 
        OG05,   8, 
        OG06,   8, 
        OG07,   8, 
        OG08,   8, 
        OG09,   8, 
        OG10,   8, 
        SMP0,   8, 
        SMP1,   8, 
        SMP2,   8, 
        SMP3,   8, 
        SMP4,   8, 
        SMP5,   8, 
        SMP6,   8, 
        SMP7,   8
    }

    OperationRegion (FXEM, SystemMemory, 0xFFE30000, 0xFF)
    Field (FXEM, AnyAcc, Lock, Preserve)
    {
        Offset (0x71), 
        UNDA,   1, 
        UNDB,   1, 
        UNDC,   1, 
        Offset (0x72), 
        WINC,   8, 
        GCAC,   8
    }

    OperationRegion (H1DA, SystemMemory, 0xAFEBEF98, 0x0000001F)
    Field (H1DA, AnyAcc, Lock, Preserve)
    {
        H1SG,   32, 
        RCKP,   8, 
        HDSM,   16, 
        HD1H,   64, 
        HD2H,   64, 
        OD1H,   64
    }

    OperationRegion (HSMI, SystemIO, 0xB0, 0x02)
    Field (HSMI, ByteAcc, NoLock, Preserve)
    {
        HSMC,   8, 
        HSMS,   8
    }

    OperationRegion (NVST, SystemMemory, 0xAFEBDD61, 0x0000014F)
    Field (NVST, AnyAcc, Lock, Preserve)
    {
        SMIF,   8, 
        PRM0,   8, 
        PRM1,   8, 
        BRTL,   8, 
        TLST,   8, 
        IGDS,   8, 
        LCDA,   16, 
        CSTE,   16, 
        NSTE,   16, 
        CADL,   16, 
        PADL,   16, 
        LIDS,   8, 
        PWRS,   8, 
        BVAL,   32, 
        ADDL,   16, 
        BCMD,   8, 
        DID,    32, 
        INFO,   2048, 
        TOML,   8, 
        TOMH,   8, 
        CEBP,   8, 
        C0LS,   8, 
        C1LS,   8, 
        C0HS,   8, 
        C1HS,   8, 
        ROMS,   32, 
        MUXF,   8, 
        PDDN,   8, 
        CMTF,   8, 
        CMTI,   32, 
        CMTO,   8, 
        WWID,   32, 
        BLID,   32, 
        BTID,   32, 
        SID0,   8, 
        SID1,   8, 
        SID2,   8, 
        SID3,   8, 
        SID4,   8, 
        SID5,   8, 
        SID6,   8, 
        SID7,   8, 
        LCDD,   32, 
        JYNC,   8, 
        GSEN,   8, 
        LCD2,   32, 
        BCMV,   8
    }

    Method (SCMP, 2, NotSerialized)
    {
        Name (STG1, Buffer (0x50) {})
        Name (STG2, Buffer (0x50) {})
        Store (Arg0, STG1)
        Store (Arg1, STG2)
        If (LNotEqual (SizeOf (Arg0), SizeOf (Arg1)))
        {
            Return (Zero)
        }

        Store (Zero, Local0)
        While (LLess (Local0, SizeOf (Arg0)))
        {
            If (LNotEqual (DerefOf (Index (STG1, Local0)), DerefOf (Index (
                STG2, Local0))))
            {
                Return (Zero)
            }

            Increment (Local0)
        }

        Return (One)
    }

    Name (WNOS, Zero)
    Name (MYOS, Zero)
    Name (HTTS, Zero)
    Name (OSTB, Ones)
    Name (TPOS, Zero)
    Name (LINX, Zero)
    Name (OSSP, Zero)
    Method (CKOS, 0, NotSerialized)
    {
        If (LEqual (WNOS, Zero))
        {
            If (SCMP (_OS, "Microsoft Windows"))
            {
                Store (One, WNOS)
            }

            If (SCMP (_OS, "Microsoft Windows NT"))
            {
                Store (0x02, WNOS)
            }

            If (SCMP (_OS, "Microsoft WindowsME: Millennium Edition"))
            {
                Store (0x03, WNOS)
            }

            If (CondRefOf (_OSI, Local0))
            {
                If (SCMP (_OS, "Windows 2006"))
                {
                    Store (0x05, WNOS)
                }
                Else
                {
                    If (SCMP (_OS, "Windows 2009"))
                    {
                        Store (0x06, WNOS)
                    }
                    Else
                    {
                        Store (0x04, WNOS)
                    }
                }
            }
        }

        Return (WNOS)
    }

    Method (SEQL, 2, Serialized)
    {
        Store (SizeOf (Arg0), Local0)
        Store (SizeOf (Arg1), Local1)
        If (LNotEqual (Local0, Local1))
        {
            Return (Zero)
        }

        Name (BUF0, Buffer (Local0) {})
        Store (Arg0, BUF0)
        Name (BUF1, Buffer (Local0) {})
        Store (Arg1, BUF1)
        Store (Zero, Local2)
        While (LLess (Local2, Local0))
        {
            Store (DerefOf (Index (BUF0, Local2)), Local3)
            Store (DerefOf (Index (BUF1, Local2)), Local4)
            If (LNotEqual (Local3, Local4))
            {
                Return (Zero)
            }

            Increment (Local2)
        }

        Return (One)
    }

    Method (OSTP, 0, NotSerialized)
    {
        If (LEqual (OSTB, Ones))
        {
            If (CondRefOf (_OSI, Local0))
            {
                Store (Zero, OSTB)
                Store (Zero, TPOS)
                If (_OSI ("Windows 2001"))
                {
                    Store (0x08, OSTB)
                    Store (0x08, TPOS)
                }

                If (_OSI ("Windows 2001.1"))
                {
                    Store (0x20, OSTB)
                    Store (0x20, TPOS)
                }

                If (_OSI ("Windows 2001 SP1"))
                {
                    Store (0x10, OSTB)
                    Store (0x10, TPOS)
                }

                If (_OSI ("Windows 2001 SP2"))
                {
                    Store (0x11, OSTB)
                    Store (0x11, TPOS)
                }

                If (_OSI ("Windows 2001 SP3"))
                {
                    Store (0x12, OSTB)
                    Store (0x12, TPOS)
                }

                If (_OSI ("Windows 2006"))
                {
                    Store (0x40, OSTB)
                    Store (0x40, TPOS)
                }

                If (_OSI ("Windows 2006 SP1"))
                {
                    Store (0x41, OSTB)
                    Store (0x41, TPOS)
                    Store (One, OSSP)
                }

                If (_OSI ("Windows 2009"))
                {
                    Store (One, OSSP)
                    Store (0x50, OSTB)
                    Store (0x50, TPOS)
                }

                If (_OSI ("Linux"))
                {
                    Store (One, LINX)
                    Store (0x80, OSTB)
                    Store (0x80, TPOS)
                }
            }
            Else
            {
                If (CondRefOf (_OS, Local0))
                {
                    If (SEQL (_OS, "Microsoft Windows"))
                    {
                        Store (One, OSTB)
                        Store (One, TPOS)
                    }
                    Else
                    {
                        If (SEQL (_OS, "Microsoft WindowsME: Millennium Edition"))
                        {
                            Store (0x02, OSTB)
                            Store (0x02, TPOS)
                        }
                        Else
                        {
                            If (SEQL (_OS, "Microsoft Windows NT"))
                            {
                                Store (0x04, OSTB)
                                Store (0x04, TPOS)
                            }
                            Else
                            {
                                Store (Zero, OSTB)
                                Store (Zero, TPOS)
                            }
                        }
                    }
                }
                Else
                {
                    Store (Zero, OSTB)
                    Store (Zero, TPOS)
                }
            }
        }

        Return (OSTB)
    }

    Scope (_PR)
    {
        Processor (C000, 0x00, 0x00000410, 0x06) {}
        Processor (C001, 0x01, 0x00000000, 0x00) {}
        Processor (C002, 0x02, 0x00000000, 0x00) {}
        Processor (C003, 0x03, 0x00000000, 0x00) {}
    }

    Name (_S0, Package (0x04)  // _S0_: S0 System State
    {
        Zero, 
        Zero, 
        Zero, 
        Zero
    })
    If (LEqual (DAS1, One)) {}
    If (LEqual (DAS3, One))
    {
        Name (_S3, Package (0x04)  // _S3_: S3 System State
        {
            0x03, 
            0x03, 
            Zero, 
            Zero
        })
    }

    Name (_S4, Package (0x04)  // _S4_: S4 System State
    {
        0x04, 
        0x04, 
        Zero, 
        Zero
    })
    Name (_S5, Package (0x04)  // _S5_: S5 System State
    {
        0x05, 
        0x05, 
        Zero, 
        Zero
    })
    Scope (_GPE)
    {
        Method (_L1C, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
        {
            Store (0xFFFF, Local1)
            Store (\_SB.PCI0.SMBS.MIN, Local2)
            ShiftLeft (Local2, 0x08, Local1)
            Store (\_SB.PCI0.SMBS.SEC, Local2)
            Or (Local1, Local2, Local1)
            Store (Local1, P80H)
        }

        Method (_L08, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
        {
            Notify (\_SB.PCI0.PB2, 0x02)
            Notify (\_SB.PCI0.PB3, 0x02)
            Notify (\_SB.PCI0.PB4, 0x02)
            Notify (\_SB.PCI0.PB5, 0x02)
            Notify (\_SB.PCI0.PB6, 0x02)
            Notify (\_SB.PCI0.PB7, 0x02)
            Notify (\_SB.PCI0.SPB0, 0x02)
            Notify (\_SB.PCI0.SPB1, 0x02)
            Notify (\_SB.PCI0.SPB2, 0x02)
            Notify (\_SB.PCI0.SPB3, 0x02)
        }

        Name (XX05, Buffer (One)
        {
             0x05
        })
        Name (XX06, Buffer (One)
        {
             0x05
        })
        Method (_L05, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
        {
            Name (HPOK, Zero)
            Sleep (0xC8)
            If (\_SB.PCI0.SMBS.GE05)
            {
                Store (Zero, \_SB.PCI0.SMBS.G05T)
            }
            Else
            {
                Store (One, \_SB.PCI0.SMBS.G05T)
            }

            Notify (\_SB.PCI0.SPB2, Zero)
        }

        Method (_L18, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
        {
            Notify (\_SB.PCI0.OHC1, 0x02)
            Notify (\_SB.PCI0.OHC2, 0x02)
            Notify (\_SB.PCI0.OHC3, 0x02)
            Notify (\_SB.PCI0.OHC4, 0x02)
            Notify (\_SB.PCI0.EHC1, 0x02)
            Notify (\_SB.PCI0.EHC2, 0x02)
            Notify (\_SB.PCI0.EHC3, 0x02)
            Notify (\_SB.PCI0.XHC0, 0x02)
            Notify (\_SB.PCI0.XHC1, 0x02)
            Notify (\_SB.PWRB, 0x02)
        }

        Method (_L10, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
        {
            If (LEqual (ODZC, One))
            {
                If (\_SB.PCI0.SMBS.G16T)
                {
                    Sleep (0x14)
                    If (\_SB.PCI0.SMBS.GE16)
                    {
                        Store (Zero, \_SB.PCI0.SMBS.G16T)
                        If (LOr (LEqual (\_SB.PCI0.SATA.VIDI, 0x78001022), LEqual (\_SB.PCI0.SATA.VIDI, 0x78011022)))
                        {
                            Notify (\_SB.PCI0.AFD, 0x80)
                        }

                        If (LEqual (\_SB.PCI0.SATA.VIDI, 0x78041022))
                        {
                            Notify (\_SB.PCI0.SATA.ODDZ, 0x80)
                        }

                        Store (0xDF15, P80H)
                    }
                }
                Else
                {
                    Sleep (0x14)
                    If (LNot (\_SB.PCI0.SMBS.GE16))
                    {
                        Store (One, \_SB.PCI0.SMBS.G16T)
                        If (LOr (LEqual (\_SB.PCI0.SATA.VIDI, 0x78001022), LEqual (\_SB.PCI0.SATA.VIDI, 0x78011022)))
                        {
                            Notify (\_SB.PCI0.AFD, 0x80)
                        }

                        If (LEqual (\_SB.PCI0.SATA.VIDI, 0x78041022))
                        {
                            Notify (\_SB.PCI0.SATA.ODDZ, 0x80)
                        }

                        Store (0xDF14, P80H)
                    }
                }
            }
        }
    }

    Scope (_TZ)
    {
        ThermalZone (THRM)
        {
            Name (REGN, "Processor Thermal Zone")
            Name (FMAX, 0x15E0)
            Name (FMIN, 0x07D0)
            Method (FRSP, 0, NotSerialized)
            {
                If (\_SB.PCI0.LPC0.EC.ECOK)
                {
                    Return (Multiply (\_SB.PCI0.LPC0.EC.FAT, 0xFF))
                }

                Return (FMAX)
            }

            Method (FSSP, 1, NotSerialized)
            {
                If (\_SB.PCI0.LPC0.EC.ECOK)
                {
                    Store (And (LNot (Arg0), One), \_SB.PCI0.LPC0.EC.FST)
                }
            }

            Method (_TMP, 0, Serialized)  // _TMP: Temperature
            {
                If (\_SB.PCI0.LPC0.EC.ECOK)
                {
                    Store (\_SB.PCI0.LPC0.EC.CPT0, Local0)
                    If (LEqual (HOTW, Zero))
                    {
                        If (LGreaterEqual (Local0, \_SB.PCI0.LPC0.EC.HOT))
                        {
                            Store (One, \_SB.PCI0.LPC0.EC.HOT4)
                            Store (One, HOTW)
                        }
                    }

                    Return (Add (Multiply (Local0, 0x0A), 0x0AAC))
                }
                Else
                {
                    Return (0x0C3C)
                }
            }

            Method (_AC0, 0, Serialized)  // _ACx: Active Cooling
            {
            }

            Method (_PSV, 0, NotSerialized)  // _PSV: Passive Temperature
            {
                Return (Add (Multiply (\_SB.PCI0.LPC0.EC.CT0, 0x0A), 0x0AAC))
            }

            Method (_CRT, 0, Serialized)  // _CRT: Critical Temperature
            {
                Store (\_SB.PCI0.LPC0.EC.CRT, Local0)
                Return (Add (0x0AAC, Multiply (Local0, 0x0A)))
            }

            Method (_HOT, 0, NotSerialized)  // _HOT: Hot Temperature
            {
                Store (\_SB.PCI0.LPC0.EC.HOT, Local0)
                Return (Add (0x0AAC, Multiply (Local0, 0x0A)))
            }

            Method (_SCP, 1, Serialized)  // _SCP: Set Cooling Policy
            {
                Store (Arg0, \_SB.PCI0.LPC0.EC.PAE)
            }

            Name (_AL0, Package (0x00) {})  // _ALx: Active List
            Method (_PSL, 0, Serialized)  // _PSL: Passive List
            {
                Return (Package (0x01)
                {
                    \_PR.C000
                })
            }

            Name (_TC1, Zero)  // _TC1: Thermal Constant 1
            Name (_TC2, Zero)  // _TC2: Thermal Constant 2
            Name (_TSP, 0x0A)  // _TSP: Thermal Sampling Period
        }
    }

    Name (PICM, Zero)
    Name (GPIC, Zero)
    Method (_PIC, 1, NotSerialized)  // _PIC: Interrupt Model
    {
        Store (Arg0, PICM)
        Store (Arg0, GPIC)
        If (GPIC)
        {
            \_SB.DSPI ()
        }
    }

    Method (_PTS, 1, NotSerialized)  // _PTS: Prepare To Sleep
    {
        Store (Zero, BRLS)
        Store (Zero, BCMF)
        SPTS (Arg0)
        If (LEqual (Arg0, One))
        {
            Store (0x51, IO80)
            \_SB.S80H (0x51)
        }

        If (LEqual (Arg0, 0x03))
        {
            Store (0x03, \_SB.PCI0.LPC0.EC.SLP)
            Store (0x53, IO80)
            \_SB.S80H (0x53)
            Store (One, \_SB.PCI0.SMBS.SLPS)
        }

        If (LEqual (Arg0, 0x04))
        {
            Store (0x04, \_SB.PCI0.LPC0.EC.SLP)
            CMSW (0xE0, 0x60)
            Store (0x54, IO80)
            \_SB.S80H (0x54)
            Store (One, \_SB.PCI0.SMBS.SLPS)
            Store (One, RSTU)
        }

        If (LEqual (Arg0, 0x05))
        {
            Store (0x05, \_SB.PCI0.LPC0.EC.SLP)
            Store (0x55, IO80)
            \_SB.S80H (0x55)
            \_SB.GSMI (0x03)
        }
    }

    Method (_WAK, 1, NotSerialized)  // _WAK: Wake
    {
        Store (One, BRLS)
        If (\_PR.C000._PPC)
        {
            Acquire (\_SB.PCI0.LPC0.EC.MTX2, 0xFFFF)
            If (LEqual (\_SB.PCI0.CPF3.CORN, 0x03))
            {
                Store (Zero, \_PR.C003._PPC)
                Notify (\_PR.C003, 0x80)
                Store (Zero, \_PR.C002._PPC)
                Notify (\_PR.C002, 0x80)
            }

            Store (Zero, \_PR.C001._PPC)
            Notify (\_PR.C001, 0x80)
            Store (Zero, \_PR.C000._PPC)
            Notify (\_PR.C000, 0x80)
            If (\_SB.PCI0.LPC0.EC.LPMF)
            {
                Sleep (0x32)
                If (LEqual (\_SB.PCI0.CPF3.CORN, 0x03))
                {
                    Store (One, \_PR.C003._PPC)
                    Notify (\_PR.C003, 0x80)
                    Store (One, \_PR.C002._PPC)
                    Notify (\_PR.C002, 0x80)
                }

                Store (One, \_PR.C001._PPC)
                Notify (\_PR.C001, 0x80)
                Store (One, \_PR.C000._PPC)
                Notify (\_PR.C000, 0x80)
            }

            Release (\_SB.PCI0.LPC0.EC.MTX2)
        }

        Store (Zero, \_SB.PCI0.LPC0.EC.THFG)
        CMSW (0xE0, Zero)
        SWAK (Arg0)
        If (LEqual (Arg0, One))
        {
            Store (0xE1, IO80)
            \_SB.S80H (0xE1)
            Store (0xF1, \_SB.PCI0.P2P.PR4B)
        }

        If (LEqual (Arg0, 0x03))
        {
            Store (0xE3, IO80)
            \_SB.S80H (0xE3)
            CHKH ()
            Notify (\_SB.PWRB, 0x02)
        }

        If (LEqual (Arg0, 0x04))
        {
            Store (0xE4, IO80)
            \_SB.S80H (0xE4)
            \_SB.PCI0._INI ()
            If (LOr (LEqual (TPOS, 0x40), LEqual (TPOS, 0x41)))
            {
                \_SB.PCI0.EHC1.STOS ()
                \_SB.PCI0.EHC2.STOS ()
                \_SB.PCI0.EHC3.STOS ()
            }

            Notify (\_SB.PWRB, 0x02)
        }

        Return (Zero)
    }

    Scope (_SB)
    {
        Device (PWRB)
        {
            Name (_HID, EisaId ("PNP0C0C"))  // _HID: Hardware ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (0x0B)
            }
        }

        Device (PCI0)
        {
            Name (_HID, EisaId ("PNP0A08"))  // _HID: Hardware ID
            Name (_CID, EisaId ("PNP0A03"))  // _CID: Compatible ID
            Name (_ADR, Zero)  // _ADR: Address
            OperationRegion (SCTH, PCI_Config, 0x7A, One)
            Field (SCTH, ByteAcc, NoLock, Preserve)
            {
                RSMF,   1
            }

            Method (_INI, 0, NotSerialized)  // _INI: Initialize
            {
                If (LEqual (GPIC, Zero)) {}
                Else
                {
                    DSPI ()
                }

                OSTP ()
                CHKH ()
                CMSW (0xE0, Zero)
                If (CondRefOf (_OSI, Local0))
                {
                    Store (Zero, MYOS)
                }
                Else
                {
                    If (LEqual (SizeOf (_OS), 0x14))
                    {
                        Store (One, MYOS)
                    }
                    Else
                    {
                        If (LEqual (SizeOf (_OS), 0x27))
                        {
                            Store (0x02, MYOS)
                        }
                        Else
                        {
                            Store (0x03, MYOS)
                        }
                    }
                }
            }

            OperationRegion (NBMS, PCI_Config, 0x60, 0x08)
            Field (NBMS, DWordAcc, NoLock, Preserve)
            {
                MIDX,   32, 
                MIDR,   32
            }

            Mutex (NBMM, 0x00)
            Method (NBMR, 1, NotSerialized)
            {
                Acquire (NBMM, 0xFFFF)
                And (Arg0, 0x7F, Local0)
                Store (Local0, MIDX)
                Store (MIDR, Local0)
                Store (0x7F, MIDX)
                Release (NBMM)
                Return (Local0)
            }

            Method (NBMW, 2, NotSerialized)
            {
                Acquire (NBMM, 0xFFFF)
                And (Arg0, 0x7F, Local0)
                Or (Local0, 0x80, Local0)
                Store (Local0, MIDX)
                Store (Arg1, MIDR)
                Store (And (Local0, 0x7F, Local0), MIDX)
                Release (NBMM)
            }

            OperationRegion (NBXP, PCI_Config, 0xE0, 0x08)
            Field (NBXP, DWordAcc, NoLock, Preserve)
            {
                NBXI,   32, 
                NBXD,   32
            }

            Mutex (NBXM, 0x00)
            Method (NBXR, 1, NotSerialized)
            {
                Acquire (NBXM, 0xFFFF)
                Store (Arg0, NBXI)
                Store (NBXD, Local0)
                Store (Zero, NBXI)
                Release (NBXM)
                Return (Local0)
            }

            Method (NBXW, 2, NotSerialized)
            {
                Acquire (NBXM, 0xFFFF)
                Store (Arg0, NBXI)
                Store (Arg1, NBXD)
                Store (Zero, NBXI)
                Release (NBXM)
            }

            Method (XPTR, 2, NotSerialized)
            {
                If (LAnd (LLess (Arg0, 0x02), LGreater (Arg0, 0x07)))
                {
                    Return (Zero)
                }
                Else
                {
                    If (LLess (Arg0, 0x04))
                    {
                        Subtract (Arg0, 0x02, Local1)
                        Store (0x01310800, Local0)
                    }
                    Else
                    {
                        Subtract (Arg0, 0x04, Local1)
                        Store (0x01300900, Local0)
                    }

                    Add (Local0, ShiftLeft (Local1, 0x08), Local0)
                    ShiftLeft (Local0, Local1, Local0)
                    NBXW (Local0, Arg1)
                    Return (Ones)
                }
            }

            Method (XPLP, 2, NotSerialized)
            {
            }

            Method (XPLL, 2, NotSerialized)
            {
            }

            Name (_UID, One)  // _UID: Unique ID
            Name (_BBN, Zero)  // _BBN: BIOS Bus Number
            Name (SUPP, Zero)
            Name (CTRL, Zero)
            Name (AMHP, Zero)
            Method (_OSC, 4, NotSerialized)  // _OSC: Operating System Capabilities
            {
                CreateDWordField (Arg3, Zero, CDW1)
                CreateDWordField (Arg3, 0x04, CDW2)
                CreateDWordField (Arg3, 0x08, CDW3)
                If (LEqual (Arg0, Buffer (0x10)
                        {
                            /* 0000 */   0x5B, 0x4D, 0xDB, 0x33, 0xF7, 0x1F, 0x1C, 0x40,
                            /* 0008 */   0x96, 0x57, 0x74, 0x41, 0xC0, 0x3D, 0xD7, 0x66
                        }))
                {
                    Store (CDW2, SUPP)
                    Store (CDW3, CTRL)
                    And (CTRL, 0x1D, CTRL)
                    And (CTRL, 0xFB, CTRL)
                    If (Not (And (CDW1, One)))
                    {
                        If (And (CTRL, One)) {}
                        If (And (CTRL, 0x10)) {}
                    }

                    If (LNotEqual (Arg1, One))
                    {
                        Or (CDW1, 0x08, CDW1)
                    }

                    If (LNotEqual (CDW3, CTRL))
                    {
                        Or (CDW1, 0x10, CDW1)
                    }

                    Store (CTRL, CDW3)
                    Return (Arg3)
                }
                Else
                {
                    Or (CDW1, 0x04, CDW1)
                    Return (Arg3)
                }
            }

            Method (TOM, 0, NotSerialized)
            {
                Multiply (TOML, 0x00010000, Local0)
                Multiply (TOMH, 0x01000000, Local1)
                Add (Local0, Local1, Local0)
                Return (Local0)
            }

            Name (CRES, ResourceTemplate ()
            {
                WordBusNumber (ResourceProducer, MinFixed, MaxFixed, SubDecode,
                    0x0000,             // Granularity
                    0x0000,             // Range Minimum
                    0x00FF,             // Range Maximum
                    0x0000,             // Translation Offset
                    0x0100,             // Length
                    0x00,, )
                WordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                    0x0000,             // Granularity
                    0x0000,             // Range Minimum
                    0x0CF7,             // Range Maximum
                    0x0000,             // Translation Offset
                    0x0CF8,             // Length
                    0x00,, , TypeStatic)
                WordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                    0x0000,             // Granularity
                    0x0D00,             // Range Minimum
                    0xFFFF,             // Range Maximum
                    0x0000,             // Translation Offset
                    0xF300,             // Length
                    ,, , TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000A0000,         // Range Minimum
                    0x000BFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00020000,         // Length
                    0x00,, , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, Cacheable, ReadOnly,
                    0x00000000,         // Granularity
                    0x000C0000,         // Range Minimum
                    0x000C3FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    0x00,, , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, Cacheable, ReadOnly,
                    0x00000000,         // Granularity
                    0x000C4000,         // Range Minimum
                    0x000C7FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    0x00,, , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadOnly,
                    0x00000000,         // Granularity
                    0x000C8000,         // Range Minimum
                    0x000CBFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    0x00,, , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadOnly,
                    0x00000000,         // Granularity
                    0x000CC000,         // Range Minimum
                    0x000CFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    0x00,, , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000D0000,         // Range Minimum
                    0x000D3FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    0x00,, , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000D4000,         // Range Minimum
                    0x000D7FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    0x00,, , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000D8000,         // Range Minimum
                    0x000DBFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    0x00,, , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000DC000,         // Range Minimum
                    0x000DFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    0x00,, , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000E0000,         // Range Minimum
                    0x000E3FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    0x00,, , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000E4000,         // Range Minimum
                    0x000E7FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    0x00,, , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000E8000,         // Range Minimum
                    0x000EBFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    0x00,, , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000EC000,         // Range Minimum
                    0x000EFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    0x00,, , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x80000000,         // Range Minimum
                    0xF7FFFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x78000000,         // Length
                    0x00,, _Y00, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0xFC000000,         // Range Minimum
                    0xFED3FFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x02D40000,         // Length
                    0x00,, , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0xFED45000,         // Range Minimum
                    0xFFFFFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x012BB000,         // Length
                    0x00,, , AddressRangeMemory, TypeStatic)
                IO (Decode16,
                    0x0CF8,             // Range Minimum
                    0x0CF8,             // Range Maximum
                    0x01,               // Alignment
                    0x08,               // Length
                    )
            })
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                CreateDWordField (CRES, \_SB.PCI0._Y00._MIN, BTMN)  // _MIN: Minimum Base Address
                CreateDWordField (CRES, \_SB.PCI0._Y00._MAX, BTMX)  // _MAX: Maximum Base Address
                CreateDWordField (CRES, \_SB.PCI0._Y00._LEN, BTLN)  // _LEN: Length
                Store (TOM (), BTMN)
                Subtract (0xF8000000, BTMN, BTLN)
                Return (CRES)
            }

            Device (MEMR)
            {
                Name (_HID, EisaId ("PNP0C02"))  // _HID: Hardware ID
                Name (MEM1, ResourceTemplate ()
                {
                    Memory32Fixed (ReadWrite,
                        0x00000000,         // Address Base
                        0x00000000,         // Address Length
                        _Y01)
                    Memory32Fixed (ReadWrite,
                        0x00000000,         // Address Base
                        0x00000000,         // Address Length
                        _Y02)
                    Memory32Fixed (ReadWrite,
                        0xF8000000,         // Address Base
                        0x04000000,         // Address Length
                        )
                    Memory32Fixed (ReadWrite,
                        0xFED80000,         // Address Base
                        0x00001000,         // Address Length
                        )
                    Memory32Fixed (ReadWrite,
                        0xFED40000,         // Address Base
                        0x00005000,         // Address Length
                        )
                })
                Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                {
                    CreateDWordField (MEM1, \_SB.PCI0.MEMR._Y01._BAS, MB01)  // _BAS: Base Address
                    CreateDWordField (MEM1, \_SB.PCI0.MEMR._Y01._LEN, ML01)  // _LEN: Length
                    CreateDWordField (MEM1, \_SB.PCI0.MEMR._Y02._BAS, MB02)  // _BAS: Base Address
                    CreateDWordField (MEM1, \_SB.PCI0.MEMR._Y02._LEN, ML02)  // _LEN: Length
                    If (GPIC)
                    {
                        Store (0xFEC00000, MB01)
                        Store (0xFEE00000, MB02)
                        Store (0x1000, ML01)
                        Store (0x1000, ML02)
                    }

                    Return (MEM1)
                }
            }

            Method (XCMP, 2, NotSerialized)
            {
                If (LNotEqual (0x10, SizeOf (Arg0)))
                {
                    Return (Zero)
                }

                If (LNotEqual (0x10, SizeOf (Arg1)))
                {
                    Return (Zero)
                }

                Store (Zero, Local0)
                While (LLess (Local0, 0x10))
                {
                    If (LNotEqual (DerefOf (Index (Arg0, Local0)), DerefOf (Index (
                        Arg1, Local0))))
                    {
                        Return (Zero)
                    }

                    Increment (Local0)
                }

                Return (One)
            }

            Method (AFN0, 0, Serialized)
            {
                If (LEqual (PDDN, One))
                {
                    ^VGA.AFN0 ()
                }

                If (LEqual (PDDN, 0x02))
                {
                    ^PB2.VGA.AFN0 ()
                }

                If (LEqual (PDDN, 0x03))
                {
                    ^PB3.VGA.AFN0 ()
                }
            }

            Method (AFN1, 1, Serialized)
            {
            }

            Method (AFN2, 2, Serialized)
            {
            }

            Method (AFN3, 2, Serialized)
            {
                If (LEqual (PDDN, One))
                {
                    ^VGA.AFN3 (Arg0, Arg1)
                }

                If (LEqual (PDDN, 0x02))
                {
                    ^PB2.VGA.AFN3 (Arg0, Arg1)
                }

                If (LEqual (PDDN, 0x03))
                {
                    ^PB3.VGA.AFN3 (Arg0, Arg1)
                }
            }

            Method (AFN4, 1, Serialized)
            {
                If (LEqual (PDDN, One))
                {
                    ^VGA.AFN4 (Arg0)
                }

                If (LEqual (PDDN, 0x02))
                {
                    ^PB2.VGA.AFN4 (Arg0)
                }

                If (LEqual (PDDN, 0x03))
                {
                    ^PB3.VGA.AFN4 (Arg0)
                }
            }

            Method (AFN5, 0, Serialized)
            {
                If (LEqual (PDDN, One))
                {
                    ^VGA.AFN5 ()
                }

                If (LEqual (PDDN, 0x02))
                {
                    ^PB2.VGA.AFN5 ()
                }

                If (LEqual (PDDN, 0x03))
                {
                    ^PB3.VGA.AFN5 ()
                }
            }

            Method (AFN6, 0, Serialized)
            {
                If (LEqual (PDDN, One))
                {
                    ^VGA.AFN6 ()
                }

                If (LEqual (PDDN, 0x02))
                {
                    ^PB2.VGA.AFN6 ()
                }

                If (LEqual (PDDN, 0x03))
                {
                    ^PB3.VGA.AFN6 ()
                }
            }

            Device (CPF3)
            {
                Name (_ADR, 0x00180003)  // _ADR: Address
                OperationRegion (PCIC, PCI_Config, Zero, 0xFF)
                Field (PCIC, ByteAcc, NoLock, Preserve)
                {
                    Offset (0xDC), 
                    Offset (0xDD), 
                    PSNM,   3, 
                    Offset (0xE8), 
                        ,   9, 
                    SVMC,   1, 
                        ,   2, 
                    CORN,   2
                }
            }

            Name (PR00, Package (0x29)
            {
                Package (0x04)
                {
                    0x0010FFFF, 
                    Zero, 
                    LNKC, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0010FFFF, 
                    One, 
                    LNKB, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0011FFFF, 
                    Zero, 
                    LNKD, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0012FFFF, 
                    Zero, 
                    LNKC, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0012FFFF, 
                    One, 
                    LNKB, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0013FFFF, 
                    Zero, 
                    LNKC, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0013FFFF, 
                    One, 
                    LNKB, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0014FFFF, 
                    Zero, 
                    LNKA, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0014FFFF, 
                    One, 
                    LNKB, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0014FFFF, 
                    0x02, 
                    LNKC, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0014FFFF, 
                    0x03, 
                    LNKD, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0015FFFF, 
                    Zero, 
                    LNKC, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0015FFFF, 
                    One, 
                    LNKD, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0015FFFF, 
                    0x02, 
                    LNKA, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0015FFFF, 
                    0x03, 
                    LNKB, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0016FFFF, 
                    Zero, 
                    LNKC, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0016FFFF, 
                    One, 
                    LNKB, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0001FFFF, 
                    Zero, 
                    LNKC, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0001FFFF, 
                    One, 
                    LNKD, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0001FFFF, 
                    0x02, 
                    LNKA, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0001FFFF, 
                    0x03, 
                    LNKB, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0002FFFF, 
                    Zero, 
                    LNKC, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0002FFFF, 
                    One, 
                    LNKD, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0002FFFF, 
                    0x02, 
                    LNKA, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0002FFFF, 
                    0x03, 
                    LNKB, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0004FFFF, 
                    Zero, 
                    LNKC, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0004FFFF, 
                    One, 
                    LNKD, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0004FFFF, 
                    0x02, 
                    LNKA, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0004FFFF, 
                    0x03, 
                    LNKB, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0005FFFF, 
                    Zero, 
                    LNKB, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0005FFFF, 
                    One, 
                    LNKC, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0005FFFF, 
                    0x02, 
                    LNKD, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0005FFFF, 
                    0x03, 
                    LNKA, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0006FFFF, 
                    Zero, 
                    LNKC, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0006FFFF, 
                    One, 
                    LNKD, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0006FFFF, 
                    0x02, 
                    LNKA, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0006FFFF, 
                    0x03, 
                    LNKB, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0007FFFF, 
                    Zero, 
                    LNKD, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0007FFFF, 
                    One, 
                    LNKA, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0007FFFF, 
                    0x02, 
                    LNKB, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0007FFFF, 
                    0x03, 
                    LNKC, 
                    Zero
                }
            })
            Name (AR00, Package (0x29)
            {
                Package (0x04)
                {
                    0x0010FFFF, 
                    Zero, 
                    Zero, 
                    0x12
                }, 

                Package (0x04)
                {
                    0x0010FFFF, 
                    One, 
                    Zero, 
                    0x11
                }, 

                Package (0x04)
                {
                    0x0011FFFF, 
                    Zero, 
                    Zero, 
                    0x13
                }, 

                Package (0x04)
                {
                    0x0012FFFF, 
                    Zero, 
                    Zero, 
                    0x12
                }, 

                Package (0x04)
                {
                    0x0012FFFF, 
                    One, 
                    Zero, 
                    0x11
                }, 

                Package (0x04)
                {
                    0x0013FFFF, 
                    Zero, 
                    Zero, 
                    0x12
                }, 

                Package (0x04)
                {
                    0x0013FFFF, 
                    One, 
                    Zero, 
                    0x11
                }, 

                Package (0x04)
                {
                    0x0014FFFF, 
                    Zero, 
                    Zero, 
                    0x10
                }, 

                Package (0x04)
                {
                    0x0014FFFF, 
                    One, 
                    Zero, 
                    0x11
                }, 

                Package (0x04)
                {
                    0x0014FFFF, 
                    0x02, 
                    Zero, 
                    0x12
                }, 

                Package (0x04)
                {
                    0x0014FFFF, 
                    0x03, 
                    Zero, 
                    0x13
                }, 

                Package (0x04)
                {
                    0x0015FFFF, 
                    Zero, 
                    Zero, 
                    0x12
                }, 

                Package (0x04)
                {
                    0x0015FFFF, 
                    One, 
                    Zero, 
                    0x13
                }, 

                Package (0x04)
                {
                    0x0015FFFF, 
                    0x02, 
                    Zero, 
                    0x10
                }, 

                Package (0x04)
                {
                    0x0015FFFF, 
                    0x03, 
                    Zero, 
                    0x11
                }, 

                Package (0x04)
                {
                    0x0016FFFF, 
                    Zero, 
                    Zero, 
                    0x12
                }, 

                Package (0x04)
                {
                    0x0016FFFF, 
                    One, 
                    Zero, 
                    0x11
                }, 

                Package (0x04)
                {
                    0x0001FFFF, 
                    Zero, 
                    Zero, 
                    0x12
                }, 

                Package (0x04)
                {
                    0x0001FFFF, 
                    One, 
                    Zero, 
                    0x13
                }, 

                Package (0x04)
                {
                    0x0001FFFF, 
                    0x02, 
                    Zero, 
                    0x10
                }, 

                Package (0x04)
                {
                    0x0001FFFF, 
                    0x03, 
                    Zero, 
                    0x11
                }, 

                Package (0x04)
                {
                    0x0002FFFF, 
                    Zero, 
                    Zero, 
                    0x12
                }, 

                Package (0x04)
                {
                    0x0002FFFF, 
                    One, 
                    Zero, 
                    0x13
                }, 

                Package (0x04)
                {
                    0x0002FFFF, 
                    0x02, 
                    Zero, 
                    0x10
                }, 

                Package (0x04)
                {
                    0x0002FFFF, 
                    0x03, 
                    Zero, 
                    0x11
                }, 

                Package (0x04)
                {
                    0x0004FFFF, 
                    Zero, 
                    Zero, 
                    0x12
                }, 

                Package (0x04)
                {
                    0x0004FFFF, 
                    One, 
                    Zero, 
                    0x13
                }, 

                Package (0x04)
                {
                    0x0004FFFF, 
                    0x02, 
                    Zero, 
                    0x10
                }, 

                Package (0x04)
                {
                    0x0004FFFF, 
                    0x03, 
                    Zero, 
                    0x11
                }, 

                Package (0x04)
                {
                    0x0005FFFF, 
                    Zero, 
                    Zero, 
                    0x11
                }, 

                Package (0x04)
                {
                    0x0005FFFF, 
                    One, 
                    Zero, 
                    0x12
                }, 

                Package (0x04)
                {
                    0x0005FFFF, 
                    0x02, 
                    Zero, 
                    0x13
                }, 

                Package (0x04)
                {
                    0x0005FFFF, 
                    0x03, 
                    Zero, 
                    0x10
                }, 

                Package (0x04)
                {
                    0x0006FFFF, 
                    Zero, 
                    Zero, 
                    0x12
                }, 

                Package (0x04)
                {
                    0x0006FFFF, 
                    One, 
                    Zero, 
                    0x13
                }, 

                Package (0x04)
                {
                    0x0006FFFF, 
                    0x02, 
                    Zero, 
                    0x10
                }, 

                Package (0x04)
                {
                    0x0006FFFF, 
                    0x03, 
                    Zero, 
                    0x11
                }, 

                Package (0x04)
                {
                    0x0007FFFF, 
                    Zero, 
                    Zero, 
                    0x13
                }, 

                Package (0x04)
                {
                    0x0007FFFF, 
                    One, 
                    Zero, 
                    0x10
                }, 

                Package (0x04)
                {
                    0x0007FFFF, 
                    0x02, 
                    Zero, 
                    0x11
                }, 

                Package (0x04)
                {
                    0x0007FFFF, 
                    0x03, 
                    Zero, 
                    0x12
                }
            })
            Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
            {
                If (PICM)
                {
                    Return (AR00)
                }

                Return (PR00)
            }

            Device (VGA)
            {
                Name (_ADR, 0x00010000)  // _ADR: Address
                Name (PXEN, 0x80000001)
                Name (PXID, 0x00020000)
                Name (PXMX, 0x80000001)
                Name (PXFX, 0x80000000)
                Name (PXDY, 0x80000001)
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (0x0F)
                }

                Name (DOSA, Zero)
                Name (SWIT, One)
                Name (CRTA, One)
                Name (LCDA, One)
                Name (HDMA, One)
                Method (_DOS, 1, NotSerialized)  // _DOS: Disable Output Switching
                {
                    Store (Arg0, DOSA)
                }

                Method (_DOD, 0, NotSerialized)  // _DOD: Display Output Devices
                {
                    Name (DODL, Package (0x03)
                    {
                        0x00010100, 
                        0x00010110, 
                        0x00010210
                    })
                    Return (DODL)
                }

                Device (LCD)
                {
                    Name (_ADR, 0x0110)  // _ADR: Address
                    Method (_DCS, 0, NotSerialized)  // _DCS: Display Current Status
                    {
                        Store ("LCD -- _DCS", Debug)
                        If (LCDA)
                        {
                            Return (0x1F)
                        }
                        Else
                        {
                            Return (0x1D)
                        }
                    }

                    Method (_DGS, 0, NotSerialized)  // _DGS: Display Graphics State
                    {
                        Store ("LCD -- _DCS", Debug)
                        If (LCDA)
                        {
                            Return (One)
                        }
                        Else
                        {
                            Return (Zero)
                        }
                    }

                    Method (_DSS, 1, NotSerialized)  // _DSS: Device Set State
                    {
                        Store ("LCD -- _DSS", Debug)
                    }

                    Name (BRTB, Package (0x0D)
                    {
                        0x64, 
                        0x32, 
                        Zero, 
                        0x0A, 
                        0x14, 
                        0x1E, 
                        0x28, 
                        0x32, 
                        0x3C, 
                        0x46, 
                        0x50, 
                        0x5A, 
                        0x64
                    })
                    Name (AU15, Package (0x0B)
                    {
                        0x07, 
                        0x09, 
                        0x0D, 
                        0x11, 
                        0x16, 
                        0x1D, 
                        0x25, 
                        0x2F, 
                        0x3C, 
                        0x4E, 
                        0x64
                    })
                    Name (CM15, Package (0x0B)
                    {
                        0x07, 
                        0x09, 
                        0x0D, 
                        0x11, 
                        0x16, 
                        0x1D, 
                        0x25, 
                        0x2F, 
                        0x3C, 
                        0x4E, 
                        0x64
                    })
                    Name (DEFT, Package (0x0B)
                    {
                        0x06, 
                        0x08, 
                        0x0B, 
                        0x0E, 
                        0x13, 
                        0x19, 
                        0x21, 
                        0x2A, 
                        0x36, 
                        0x45, 
                        0x64
                    })
                    Method (_BCL, 0, NotSerialized)  // _BCL: Brightness Control Levels
                    {
                        Return (BRTB)
                    }

                    Name (BQCL, 0x06)
                    Method (_BCM, 1, NotSerialized)  // _BCM: Brightness Control Method
                    {
                        Store (Zero, BRLS)
                        Store (0x55, BCMF)
                        Store (Arg0, BCMV)
                        If (LAnd (LGreaterEqual (Arg0, Zero), LLessEqual (Arg0, 0x64)))
                        {
                            Store (Arg0, Local0)
                            Store (Arg0, BQCL)
                            Divide (Arg0, 0x0A, Local2, Local1)
                            Store (DerefOf (Index (DEFT, Local1)), Local0)
                            If (LEqual (LCDD, 0x22ECAF06))
                            {
                                Store (DerefOf (Index (AU15, Local1)), Local0)
                            }

                            If (LEqual (LCDD, 0x15A2AF0D))
                            {
                                Store (DerefOf (Index (CM15, Local1)), Local0)
                            }
                        }

                        If (^^^LPC0.EC.ADP)
                        {
                            Store (Local1, ^^^LPC0.EC.LCBA)
                        }
                        Else
                        {
                            Store (Local1, ^^^LPC0.EC.LCBD)
                        }

                        Acquire (^^^LPC0.PSMX, 0xFFFF)
                        Store (Local0, BRTL)
                        Store (0x72, BCMD)
                        BSMI (Zero)
                        Release (^^^LPC0.PSMX)
                    }

                    Method (_BQC, 0, NotSerialized)  // _BQC: Brightness Query Current
                    {
                        Store (BQCL, Local0)
                        Return (Local0)
                    }

                    Method (BRAJ, 0, NotSerialized)
                    {
                        If (^^^LPC0.EC.BRUP)
                        {
                            If (LLess (BCMV, 0x64))
                            {
                                Add (BCMV, 0x0A, Local0)
                                _BCM (Local0)
                            }
                        }

                        If (^^^LPC0.EC.BRDN)
                        {
                            If (LGreater (BCMV, Zero))
                            {
                                Subtract (BCMV, 0x0A, Local0)
                                _BCM (Local0)
                            }
                        }

                        Store (One, BRLS)
                    }
                }

                Device (CRT)
                {
                    Name (_ADR, 0x0100)  // _ADR: Address
                    Method (_DCS, 0, NotSerialized)  // _DCS: Display Current Status
                    {
                        Store ("CRT _DCS Debug", Debug)
                        If (CRTA)
                        {
                            Return (0x1F)
                        }
                        Else
                        {
                            Return (0x1D)
                        }
                    }

                    Method (_DGS, 0, NotSerialized)  // _DGS: Display Graphics State
                    {
                        Store ("CRT _DGS Debug", Debug)
                        If (CRTA)
                        {
                            Return (One)
                        }
                        Else
                        {
                            Return (Zero)
                        }
                    }

                    Method (_DSS, 1, NotSerialized)  // _DSS: Device Set State
                    {
                        Store ("CRT _DSS Debug", Debug)
                    }
                }

                Device (HDMI)
                {
                    Name (_ADR, 0x0210)  // _ADR: Address
                    Method (_DCS, 0, NotSerialized)  // _DCS: Display Current Status
                    {
                        Store ("HDMI _DCS Debug", Debug)
                        If (HDMA)
                        {
                            Return (0x1F)
                        }
                        Else
                        {
                            Return (0x1D)
                        }
                    }

                    Method (_DGS, 0, NotSerialized)  // _DGS: Display Graphics State
                    {
                        Store ("HDMI _DGS Debug", Debug)
                        If (HDMA)
                        {
                            Return (One)
                        }
                        Else
                        {
                            Return (Zero)
                        }
                    }

                    Method (_DSS, 1, NotSerialized)  // _DSS: Device Set State
                    {
                        Store ("HDMI _DSS Debug", Debug)
                    }
                }

                Name (ATIB, Buffer (0x0100) {})
                Method (ATIF, 2, Serialized)
                {
                    If (LEqual (Arg0, Zero))
                    {
                        Return (AF00 ())
                    }

                    If (LEqual (Arg0, One))
                    {
                        Return (AF01 ())
                    }

                    If (LEqual (Arg0, 0x02))
                    {
                        Return (AF02 ())
                    }

                    If (LEqual (Arg0, 0x03))
                    {
                        Return (AF03 (DerefOf (Index (Arg1, 0x02)), DerefOf (Index (Arg1, 
                            0x04))))
                    }

                    If (LEqual (Arg0, 0x0F))
                    {
                        Return (AF15 ())
                    }
                    Else
                    {
                        CreateWordField (ATIB, Zero, SSZE)
                        CreateWordField (ATIB, 0x02, VERN)
                        CreateDWordField (ATIB, 0x04, NMSK)
                        CreateDWordField (ATIB, 0x08, SFUN)
                        Store (Zero, SSZE)
                        Store (Zero, VERN)
                        Store (Zero, NMSK)
                        Store (Zero, SFUN)
                        Return (ATIB)
                    }
                }

                Method (AF00, 0, NotSerialized)
                {
                    CreateWordField (ATIB, Zero, SSZE)
                    CreateWordField (ATIB, 0x02, VERN)
                    CreateDWordField (ATIB, 0x04, NMSK)
                    CreateDWordField (ATIB, 0x08, SFUN)
                    Store (0x0C, SSZE)
                    Store (One, VERN)
                    If (LEqual (PXEN, 0x80000000))
                    {
                        Store (0x11, NMSK)
                    }
                    Else
                    {
                        Store (0x51, NMSK)
                    }

                    Store (NMSK, MSKN)
                    Store (0x4007, SFUN)
                    Return (ATIB)
                }

                Method (AF01, 0, NotSerialized)
                {
                    CreateWordField (ATIB, Zero, SSZE)
                    CreateDWordField (ATIB, 0x02, VMSK)
                    CreateDWordField (ATIB, 0x06, FLGS)
                    Store (0x0A, SSZE)
                    Store (0x0B, VMSK)
                    Store (0x0A, SSZE)
                    Store (0x0B, FLGS)
                    Return (ATIB)
                }

                Name (PSBR, Buffer (0x04)
                {
                     0x00, 0x00, 0x00, 0x00
                })
                Name (MSKN, Zero)
                Name (SEXM, Zero)
                Name (STHG, Zero)
                Name (STHI, Zero)
                Name (SFPG, Zero)
                Name (SFPI, Zero)
                Name (SSPS, Zero)
                Name (SSDM, 0x0A)
                Name (SCDY, Zero)
                Name (SACT, Buffer (0x07)
                {
                     0x01, 0x02, 0x08, 0x80, 0x03, 0x09, 0x81
                })
                Method (AF02, 0, NotSerialized)
                {
                    CreateBitField (PSBR, Zero, PDSW)
                    CreateBitField (PSBR, One, PEXM)
                    CreateBitField (PSBR, 0x02, PTHR)
                    CreateBitField (PSBR, 0x03, PFPS)
                    CreateBitField (PSBR, 0x04, PSPS)
                    CreateBitField (PSBR, 0x05, PDCC)
                    CreateBitField (PSBR, 0x06, PXPS)
                    CreateWordField (ATIB, Zero, SSZE)
                    CreateDWordField (ATIB, 0x02, PSBI)
                    CreateByteField (ATIB, 0x06, EXPM)
                    CreateByteField (ATIB, 0x07, THRM)
                    CreateByteField (ATIB, 0x08, THID)
                    CreateByteField (ATIB, 0x09, FPWR)
                    CreateByteField (ATIB, 0x0A, FPID)
                    CreateByteField (ATIB, 0x0B, SPWR)
                    Store (0x0C, SSZE)
                    Store (PSBR, PSBI)
                    If (PDSW)
                    {
                        Store (Zero, PDSW)
                    }

                    If (PEXM)
                    {
                        Store (SEXM, EXPM)
                        Store (Zero, SEXM)
                        Store (Zero, PEXM)
                    }

                    If (PTHR)
                    {
                        Store (STHG, THRM)
                        Store (STHI, THID)
                        Store (Zero, STHG)
                        Store (Zero, STHI)
                        Store (Zero, PTHR)
                    }

                    If (PFPS)
                    {
                        Store (SFPG, FPWR)
                        Store (SFPI, FPWR)
                        Store (Zero, SFPG)
                        Store (Zero, SFPI)
                        Store (Zero, PFPS)
                    }

                    If (PSPS)
                    {
                        Store (SSPS, SPWR)
                        Store (Zero, PSPS)
                    }

                    If (PXPS)
                    {
                        Store (Zero, PXPS)
                    }

                    Return (ATIB)
                }

                Method (AF03, 2, NotSerialized)
                {
                    CreateWordField (ATIB, Zero, SSZE)
                    CreateWordField (ATIB, 0x02, SSDP)
                    CreateWordField (ATIB, 0x04, SCDP)
                    Store (Arg0, SSDP)
                    Store (Arg1, SCDP)
                    Name (NXTD, 0x06)
                    Name (CIDX, 0x06)
                    Store (SSDP, Local1)
                    And (Local1, 0x8B, Local1)
                    Store (SCDP, Local2)
                    If (CondRefOf (^^^LID._LID, Local4))
                    {
                        And (Local2, 0xFFFFFFFE, Local2)
                        Or (Local2, ^^^LID._LID (), Local2)
                    }
                    Else
                    {
                        Or (Local2, One, Local2)
                    }

                    Store (Local2, P80H)
                    Store (Zero, Local0)
                    While (LLess (Local0, SizeOf (SACT)))
                    {
                        Store (DerefOf (Index (SACT, Local0)), Local3)
                        If (LEqual (Local3, Local1))
                        {
                            Store (Local0, CIDX)
                            Store (SizeOf (SACT), Local0)
                        }
                        Else
                        {
                            Increment (Local0)
                        }
                    }

                    Store (CIDX, Local0)
                    While (LLess (Local0, SizeOf (SACT)))
                    {
                        Increment (Local0)
                        If (LEqual (Local0, SizeOf (SACT)))
                        {
                            Store (Zero, Local0)
                        }

                        Store (DerefOf (Index (SACT, Local0)), Local3)
                        If (LEqual (And (Local3, Local2), Local3))
                        {
                            Store (Local0, NXTD)
                            Store (SizeOf (SACT), Local0)
                        }
                    }

                    If (LEqual (NXTD, SizeOf (SACT)))
                    {
                        Store (Zero, SSDP)
                    }
                    Else
                    {
                        Store (NXTD, Local0)
                        Store (DerefOf (Index (SACT, Local0)), Local3)
                        And (SSDP, 0xFFFFFFF4, SSDP)
                        Or (SSDP, Local3, SSDP)
                    }

                    Store (0x04, SSZE)
                    Store (SSDP, P80H)
                    Return (ATIB)
                }

                Method (AFN0, 0, Serialized)
                {
                    If (And (MSKN, One))
                    {
                        CreateBitField (PSBR, Zero, PDSW)
                        Store (One, PDSW)
                        Notify (VGA, 0x81)
                    }
                }

                Method (AFN3, 2, Serialized)
                {
                    If (And (MSKN, 0x08))
                    {
                        Store (Arg0, Local0)
                        Store (Local0, SFPI)
                        Store (Arg1, Local0)
                        Store (And (Local0, 0x03, Local0), SFPG)
                        CreateBitField (PSBR, 0x03, PFPS)
                        Store (One, PFPS)
                        Notify (VGA, 0x81)
                    }
                }

                Method (AFN4, 1, Serialized)
                {
                    If (And (MSKN, 0x10))
                    {
                        Store (Arg0, Local0)
                        Store (SSPS, Local1)
                        Store (Local0, SSPS)
                        If (LEqual (Local0, Local1)) {}
                        Else
                        {
                            CreateBitField (PSBR, 0x04, PSPS)
                            Store (One, PSPS)
                            Notify (VGA, 0x81)
                        }
                    }
                }

                Method (AFN5, 0, Serialized)
                {
                    If (And (MSKN, 0x20))
                    {
                        CreateBitField (PSBR, 0x05, PDCC)
                        Store (One, PDCC)
                        Notify (VGA, 0x81)
                    }
                }

                Method (AFN6, 0, Serialized)
                {
                    If (And (MSKN, 0x40))
                    {
                        CreateBitField (PSBR, 0x06, PXPS)
                        Store (One, PXPS)
                        Notify (VGA, 0x81)
                    }
                }

                Method (AF15, 0, NotSerialized)
                {
                    Store (0xFF, P80H)
                    CreateWordField (ATIB, 0x02, DSZE)
                    Store (0x08, DSZE)
                    Acquire (^^LPC0.PSMX, 0xFFFF)
                    Store (0x8D, BCMD)
                    Store (0x0F, DID)
                    Store (ATIB, INFO)
                    BSMI (Zero)
                    Store (INFO, ATIB)
                    Release (^^LPC0.PSMX)
                    Return (ATIB)
                }

                Scope (\_SB.PCI0.VGA)
                {
                    OperationRegion (REVD, SystemMemory, 0xAFC85018, 0x0000FA04)
                    Field (REVD, AnyAcc, NoLock, Preserve)
                    {
                        SROM,   32, 
                        VROM,   512000
                    }

                    Name (TVGA, Buffer (0xFA00)
                    {
                         0x00
                    })
                    Method (ATRM, 2, Serialized)
                    {
                        Add (Arg0, Arg1, Local0)
                        If (LLessEqual (Local0, SROM))
                        {
                            Multiply (Arg1, 0x08, Local1)
                            Multiply (Arg0, 0x08, Local2)
                            Store (VROM, TVGA)
                            CreateField (TVGA, Local2, Local1, TEMP)
                            Name (RETB, Buffer (Arg1) {})
                            Store (TEMP, RETB)
                            Return (RETB)
                        }
                        Else
                        {
                            If (LLess (Arg0, SROM))
                            {
                                Subtract (SROM, Arg0, Local3)
                                Multiply (Local3, 0x08, Local1)
                                Multiply (Arg0, 0x08, Local2)
                                Store (VROM, TVGA)
                                CreateField (TVGA, Local2, Local1, TEM)
                                Name (RETC, Buffer (Local3) {})
                                Store (TEM, RETC)
                                Return (RETC)
                            }
                            Else
                            {
                                Name (RETD, Buffer (One) {})
                                Return (RETD)
                            }
                        }
                    }
                }

                Scope (\_SB.PCI0.VGA)
                {
                    Name (ATPB, Buffer (0x0100) {})
                    Name (DSID, Ones)
                    Name (HSID, Ones)
                    Name (CNT0, Buffer (0x05)
                    {
                         0x05, 0x00, 0x00, 0x10, 0x01
                    })
                    Name (CNT1, Buffer (0x05)
                    {
                         0x05, 0x01, 0x00, 0x00, 0x01
                    })
                    Name (CNT2, Buffer (0x05)
                    {
                         0x07, 0x03, 0x00, 0x10, 0x02
                    })
                    Name (CNT3, Buffer (0x05)
                    {
                         0x07, 0x07, 0x00, 0x20, 0x02
                    })
                    Name (CNT4, Buffer (0x05)
                    {
                         0x00, 0x09, 0x00, 0x30, 0x02
                    })
                    Name (CNT5, Buffer (0x05)
                    {
                         0x01, 0x00, 0x01, 0x10, 0x01
                    })
                    Name (CNT6, Buffer (0x05)
                    {
                         0x01, 0x01, 0x01, 0x00, 0x01
                    })
                    Name (CNT7, Buffer (0x05)
                    {
                         0x03, 0x03, 0x01, 0x10, 0x02
                    })
                    Name (CNT8, Buffer (0x05)
                    {
                         0x03, 0x07, 0x01, 0x20, 0x02
                    })
                    Name (CNT9, Buffer (0x05)
                    {
                         0x00, 0x09, 0x01, 0x30, 0x02
                    })
                    Method (ATPX, 2, Serialized)
                    {
                        If (LEqual (Arg0, Zero))
                        {
                            Return (PX00 ())
                        }

                        If (LEqual (Arg0, One))
                        {
                            Return (PX01 ())
                        }

                        If (LEqual (Arg0, 0x02))
                        {
                            PX02 (DerefOf (Index (Arg1, 0x02)))
                            Return (ATPB)
                        }

                        If (LEqual (Arg0, 0x03))
                        {
                            PX03 (DerefOf (Index (Arg1, 0x02)))
                            Return (ATPB)
                        }

                        If (LEqual (Arg0, 0x04))
                        {
                            PX04 (DerefOf (Index (Arg1, 0x02)))
                            Return (ATPB)
                        }

                        If (LEqual (Arg0, 0x08))
                        {
                            Return (PX08 ())
                        }

                        If (LEqual (Arg0, 0x09))
                        {
                            Return (PX09 ())
                        }

                        CreateWordField (ATPB, Zero, SSZE)
                        CreateWordField (ATPB, 0x02, VERN)
                        CreateDWordField (ATPB, 0x04, SFUN)
                        Store (Zero, SSZE)
                        Store (Zero, VERN)
                        Store (Zero, SFUN)
                        Return (ATPB)
                    }

                    Method (PX00, 0, NotSerialized)
                    {
                        Store (0xE0, P80H)
                        CreateWordField (ATPB, Zero, SSZE)
                        CreateWordField (ATPB, 0x02, VERN)
                        CreateDWordField (ATPB, 0x04, SFUN)
                        Store (0x08, SSZE)
                        Store (One, VERN)
                        If (LEqual (PXEN, 0x80000000))
                        {
                            Store (Zero, SFUN)
                            Return (ATPB)
                        }

                        If (LEqual (PXMX, 0x80000000))
                        {
                            Store (0x018F, SFUN)
                        }
                        Else
                        {
                            Store (0x0183, SFUN)
                        }

                        If (LEqual (PXDY, 0x80000001))
                        {
                            And (SFUN, 0xFFFFFFFD, SFUN)
                        }

                        If (LAnd (LEqual (PXDY, 0x80000001), LEqual (PXFX, 0x80000001)))
                        {
                            Or (SFUN, 0x02, SFUN)
                        }

                        If (LEqual (PXID, ^^PB2._ADR))
                        {
                            Store (^^PB2.VGA.SVID, Local0)
                            Store (^^PB2.HDAU.SVID, Local1)
                        }
                        Else
                        {
                            Store (^^PB3.VGA.SVID, Local0)
                            Store (^^PB3.HDAU.SVID, Local1)
                        }

                        If (LNotEqual (Local0, Ones))
                        {
                            Store (Local0, DSID)
                        }

                        If (LNotEqual (Local1, Ones))
                        {
                            Store (Local1, HSID)
                        }

                        Return (ATPB)
                    }

                    Method (PX01, 0, NotSerialized)
                    {
                        Store (0xE1, P80H)
                        CreateWordField (ATPB, Zero, SSZE)
                        CreateDWordField (ATPB, 0x02, VMSK)
                        CreateDWordField (ATPB, 0x06, FLGS)
                        Store (0x0A, SSZE)
                        Store (0xFF, VMSK)
                        If (LEqual (PXMX, 0x80000000))
                        {
                            Store (0x4B, FLGS)
                        }
                        Else
                        {
                            Store (Zero, FLGS)
                            If (LEqual (PXDY, 0x80000001))
                            {
                                Or (FLGS, 0x80, FLGS)
                            }
                        }

                        Return (ATPB)
                    }

                    Method (PX02, 1, NotSerialized)
                    {
                        CreateWordField (ATPB, Zero, SSZE)
                        CreateByteField (ATPB, 0x02, PWST)
                        Store (0x03, SSZE)
                        Store (Buffer (0x05) {}, Local7)
                        CreateWordField (Local7, Zero, SZZE)
                        CreateField (Local7, 0x10, 0x03, FUCC)
                        CreateField (Local7, 0x13, 0x05, DEVV)
                        CreateByteField (Local7, 0x03, BUSS)
                        CreateByteField (Local7, 0x04, HPST)
                        Store (0x05, SZZE)
                        Store (Zero, BUSS)
                        Store (Zero, FUCC)
                        Store (Buffer (0x04) {}, Local6)
                        CreateByteField (Local6, 0x02, HPOX)
                        And (Arg0, One, PWST)
                        Name (HPOK, Zero)
                        If (PWST)
                        {
                            Store (0x11E2, P80H)
                            Store (Zero, ^^SMBS.O044)
                            Store (Zero, ^^SMBS.E044)
                            Store (Zero, ^^SMBS.O045)
                            Store (Zero, ^^SMBS.E045)
                            Sleep (0x0A)
                            Store (One, ^^SMBS.O045)
                            Store (Zero, ^^SMBS.E045)
                            Sleep (0x0A)
                            Sleep (0x0A)
                            Store (One, ^^SMBS.MX32)
                            Store (One, ^^SMBS.MX33)
                            While (LEqual (^^SMBS.I032, Zero)) {}
                            While (LEqual (^^SMBS.I033, Zero)) {}
                            Store (One, ^^SMBS.O044)
                            Store (Zero, ^^SMBS.E044)
                            Store (0x12E2, P80H)
                            Store (Zero, HPOK)
                            Sleep (0x64)
                            Sleep (0x64)
                            If (LEqual (PXID, ^^PB2._ADR))
                            {
                                Store (0x02, DEVV)
                            }
                            Else
                            {
                                Store (0x03, DEVV)
                            }

                            Store (One, HPST)
                            Store (ALIB (0x06, Local7), Local6)
                            Sleep (0x14)
                            Store (Zero, Local2)
                            While (LLess (Local2, 0x0F))
                            {
                                If (LEqual (PXID, ^^PB2._ADR))
                                {
                                    Store (One, ^^PB2.PDC2)
                                }
                                Else
                                {
                                    Store (One, ^^PB3.PDC2)
                                }

                                Store (One, Local4)
                                Store (0xC8, Local5)
                                While (LAnd (Local4, Local5))
                                {
                                    If (LEqual (PXID, ^^PB2._ADR))
                                    {
                                        Store (^^PB2.XPRD (0xA5), Local0)
                                    }
                                    Else
                                    {
                                        Store (^^PB3.XPRD (0xA5), Local0)
                                    }

                                    And (Local0, 0x7F, Local0)
                                    If (LAnd (LGreaterEqual (Local0, 0x10), LNotEqual (Local0, 0x7F)))
                                    {
                                        Store (Zero, Local4)
                                    }
                                    Else
                                    {
                                        Sleep (0x05)
                                        Decrement (Local5)
                                    }
                                }

                                If (LNot (Local4))
                                {
                                    If (LEqual (PXID, ^^PB2._ADR))
                                    {
                                        Store (^^PB2.XPDL (), Local5)
                                    }
                                    Else
                                    {
                                        Store (^^PB3.XPDL (), Local5)
                                    }

                                    If (Local5)
                                    {
                                        If (LEqual (PXID, ^^PB2._ADR))
                                        {
                                            ^^PB2.XPRT ()
                                        }
                                        Else
                                        {
                                            ^^PB3.XPRT ()
                                        }

                                        Sleep (0x05)
                                        Increment (Local2)
                                    }
                                    Else
                                    {
                                        Store (Zero, Local0)
                                        If (LEqual (PXID, ^^PB2._ADR))
                                        {
                                            If (LEqual (^^PB2.XPR2 (), Ones))
                                            {
                                                Store (One, Local0)
                                            }
                                        }
                                        Else
                                        {
                                            If (LEqual (^^PB3.XPR2 (), Ones))
                                            {
                                                Store (One, Local0)
                                            }
                                        }

                                        If (Local0)
                                        {
                                            Store (One, HPOK)
                                            Store (0x10, Local2)
                                        }
                                        Else
                                        {
                                            Store (Zero, HPOK)
                                            Store (0x10, Local2)
                                        }
                                    }
                                }
                                Else
                                {
                                    Store (0x10, Local2)
                                }
                            }

                            If (LNot (HPOK))
                            {
                                Store (0x13E2, P80H)
                                If (LEqual (PXID, ^^PB2._ADR))
                                {
                                    Store (^^PB2.VGA.DVID, Local1)
                                }
                                Else
                                {
                                    Store (^^PB3.VGA.DVID, Local1)
                                }

                                Sleep (0x0A)
                                Store (One, Local4)
                                Store (0x05, Local5)
                                While (LAnd (Local4, Local5))
                                {
                                    If (LEqual (PXID, ^^PB2._ADR))
                                    {
                                        Store (^^PB2.XPRD (0xA5), Local0)
                                    }
                                    Else
                                    {
                                        Store (^^PB3.XPRD (0xA5), Local0)
                                    }

                                    And (Local0, 0x7F, Local0)
                                    If (LLessEqual (Local0, 0x04))
                                    {
                                        Store (Zero, Local4)
                                    }
                                    Else
                                    {
                                        If (LEqual (PXID, ^^PB2._ADR))
                                        {
                                            Store (^^PB2.VGA.DVID, Local1)
                                        }
                                        Else
                                        {
                                            Store (^^PB3.VGA.DVID, Local1)
                                        }

                                        Sleep (0x05)
                                        Decrement (Local5)
                                    }
                                }

                                If (LEqual (PXID, ^^PB2._ADR))
                                {
                                    Store (0x02, DEVV)
                                }
                                Else
                                {
                                    Store (0x03, DEVV)
                                }

                                Store (Zero, HPST)
                                ALIB (0x06, Local7)
                            }

                            Store (0x14E2, P80H)
                        }
                        Else
                        {
                            Store (0x02E2, P80H)
                            If (LEqual (PXID, ^^PB2._ADR))
                            {
                                Store (0x10, MUXF)
                            }
                            Else
                            {
                                Store (0x18, MUXF)
                            }

                            Store (Zero, ^^SMBS.O044)
                            Store (Zero, ^^SMBS.E044)
                            Sleep (0x0A)
                            Store (Zero, ^^SMBS.O045)
                            Store (Zero, ^^SMBS.E045)
                            Store (0x03E2, P80H)
                            If (LEqual (PXID, ^^PB2._ADR))
                            {
                                Store (One, ^^PB2.PDC2)
                                Store (^^PB2.VGA.DVID, Local1)
                            }
                            Else
                            {
                                Store (One, ^^PB3.PDC2)
                                Store (^^PB3.VGA.DVID, Local1)
                            }

                            Sleep (0x0A)
                            Store (One, Local4)
                            Store (0x05, Local5)
                            While (LAnd (Local4, Local5))
                            {
                                If (LEqual (PXID, ^^PB2._ADR))
                                {
                                    Store (^^PB2.XPRD (0xA5), Local0)
                                }
                                Else
                                {
                                    Store (^^PB3.XPRD (0xA5), Local0)
                                }

                                And (Local0, 0x7F, Local0)
                                If (LLessEqual (Local0, 0x04))
                                {
                                    Store (Zero, Local4)
                                }
                                Else
                                {
                                    If (LEqual (PXID, ^^PB2._ADR))
                                    {
                                        Store (^^PB2.VGA.DVID, Local1)
                                    }
                                    Else
                                    {
                                        Store (^^PB3.VGA.DVID, Local1)
                                    }

                                    Sleep (0x05)
                                    Decrement (Local5)
                                }
                            }

                            If (LEqual (PXID, ^^PB2._ADR))
                            {
                                Store (0x02, DEVV)
                            }
                            Else
                            {
                                Store (0x03, DEVV)
                            }

                            Store (Zero, HPST)
                            ALIB (0x06, Local7)
                            Store (0x02, HPOK)
                            Store (0x04E2, P80H)
                        }

                        If (HPOK)
                        {
                            If (LAnd (LEqual (HPOK, One), LNotEqual (DSID, Ones)))
                            {
                                Store (DSID, Local1)
                                If (LEqual (PXID, ^^PB2._ADR))
                                {
                                    Store (Local1, ^^PB2.VGA.SMID)
                                }
                                Else
                                {
                                    Store (Local1, ^^PB3.VGA.SMID)
                                }

                                Sleep (0x0A)
                                Store (HSID, Local1)
                                If (LNotEqual (Local1, Ones))
                                {
                                    If (LEqual (PXID, ^^PB2._ADR))
                                    {
                                        Store (Local1, ^^PB2.HDAU.SMID)
                                    }
                                    Else
                                    {
                                        Store (Local1, ^^PB3.HDAU.SMID)
                                    }
                                }

                                Sleep (0x0A)
                            }

                            If (LEqual (PXID, ^^PB2._ADR))
                            {
                                Notify (PB2, Zero)
                            }
                            Else
                            {
                                Notify (PB3, Zero)
                            }
                        }
                    }

                    Method (PX03, 1, NotSerialized)
                    {
                        CreateWordField (ATPB, Zero, SSZE)
                        CreateWordField (ATPB, 0x02, DPSW)
                        Store (0x04, SSZE)
                        And (Arg0, One, DPSW)
                    }

                    Method (PX04, 1, NotSerialized)
                    {
                        Store (0xE4, P80H)
                        CreateWordField (ATPB, Zero, SSZE)
                        CreateWordField (ATPB, 0x02, ICSW)
                        Store (0x04, SSZE)
                        And (Arg0, One, ICSW)
                    }

                    Method (PX08, 0, NotSerialized)
                    {
                        Store (0xE8, P80H)
                        CreateWordField (ATPB, Zero, CNUM)
                        CreateWordField (ATPB, 0x02, CSSZ)
                        Store (0x0A, CNUM)
                        Store (0x05, CSSZ)
                        CreateField (ATPB, 0x20, 0x28, CTI0)
                        Store (CNT0, CTI0)
                        CreateField (ATPB, 0x48, 0x28, CTI1)
                        Store (CNT1, CTI1)
                        CreateField (ATPB, 0x70, 0x28, CTI2)
                        CreateByteField (CNT2, Zero, FLG2)
                        If (LEqual (LPTY, One))
                        {
                            If (LEqual (M92D, One))
                            {
                                Store (Zero, FLG2)
                            }

                            If (LEqual (M92D, 0x02))
                            {
                                Store (0x07, FLG2)
                            }
                        }

                        Store (CNT2, CTI2)
                        CreateField (ATPB, 0x98, 0x28, CTI3)
                        CreateByteField (CNT3, Zero, FLG3)
                        If (LEqual (LPTY, Zero))
                        {
                            Store (0x07, FLG3)
                        }

                        If (LEqual (LPTY, One))
                        {
                            Store (Zero, FLG3)
                        }

                        If (LEqual (LPTY, 0x02))
                        {
                            Store (Zero, FLG3)
                        }

                        If (LEqual (M92D, 0x02))
                        {
                            Store (0x07, FLG3)
                        }

                        Store (CNT3, CTI3)
                        CreateField (ATPB, 0xC0, 0x28, CTI4)
                        Store (CNT4, CTI4)
                        CreateField (ATPB, 0xE8, 0x28, CTI5)
                        Store (CNT5, CTI5)
                        CreateField (ATPB, 0x0110, 0x28, CTI6)
                        Store (CNT6, CTI6)
                        CreateField (ATPB, 0x0138, 0x28, CTI7)
                        CreateByteField (CNT7, Zero, FLG7)
                        If (LEqual (LPTY, One))
                        {
                            If (LEqual (M92D, One))
                            {
                                Store (Zero, FLG7)
                            }

                            If (LEqual (M92D, 0x02))
                            {
                                Store (Zero, FLG7)
                            }
                        }

                        Store (CNT7, CTI7)
                        CreateField (ATPB, 0x0160, 0x28, CTI8)
                        CreateByteField (CNT8, Zero, FLG8)
                        If (LEqual (LPTY, Zero))
                        {
                            Store (0x07, FLG8)
                        }

                        If (LEqual (LPTY, One))
                        {
                            Store (Zero, FLG8)
                        }

                        If (LEqual (LPTY, 0x02))
                        {
                            Store (Zero, FLG8)
                        }

                        If (LEqual (M92D, 0x02))
                        {
                            Store (0x07, FLG8)
                        }

                        Store (CNT8, CTI8)
                        CreateField (ATPB, 0x0188, 0x28, CTI9)
                        CreateByteField (CNT9, Zero, FLG9)
                        If (LEqual (M92D, 0x02))
                        {
                            Store (0x07, FLG9)
                        }

                        Store (CNT9, CTI9)
                        Return (ATPB)
                    }

                    Method (PX09, 0, NotSerialized)
                    {
                        Store (0xE9, P80H)
                        CreateWordField (ATPB, Zero, CNUM)
                        CreateWordField (ATPB, 0x02, CSSZ)
                        Store (Zero, CNUM)
                        Store (Zero, CSSZ)
                        CreateByteField (ATPB, 0x04, ATI0)
                        CreateByteField (ATPB, 0x05, HPD0)
                        CreateByteField (ATPB, 0x06, DDC0)
                        Store (Zero, ATI0)
                        Store (Zero, HPD0)
                        Store (Zero, DDC0)
                        CreateByteField (ATPB, 0x07, ATI1)
                        CreateByteField (ATPB, 0x08, HPD1)
                        CreateByteField (ATPB, 0x09, DDC1)
                        Store (Zero, ATI1)
                        Store (Zero, HPD1)
                        Store (Zero, DDC1)
                        Return (ATPB)
                    }
                }

                Name (AT00, Buffer (0xFF) {})
                Name (AT01, Buffer (0x03) {})
                Method (ATCS, 2, Serialized)
                {
                    If (LEqual (Arg0, Zero))
                    {
                        ATC0 ()
                    }

                    If (LEqual (Arg0, One))
                    {
                        ATC1 ()
                    }

                    If (LEqual (Arg0, 0x02))
                    {
                        ATC2 (Arg1)
                    }

                    If (LEqual (Arg0, 0x03))
                    {
                        ATC3 ()
                    }

                    If (LEqual (Arg0, 0x04))
                    {
                        ATC4 (Arg1)
                    }

                    Return (AT00)
                }

                Method (ATC0, 0, NotSerialized)
                {
                    CreateWordField (AT00, Zero, SZZE)
                    CreateWordField (AT00, 0x02, INTF)
                    CreateDWordField (AT00, 0x04, SUPP)
                    Store (0x08, SZZE)
                    Store (One, INTF)
                    Store (0x0F, SUPP)
                }

                Method (ATC1, 0, Serialized)
                {
                    CreateWordField (AT00, Zero, SZZE)
                    CreateDWordField (AT00, 0x02, VFMK)
                    CreateDWordField (AT00, 0x06, FLAG)
                    CreateField (AT00, 0x30, One, DOCK)
                    Store (0x0A, SZZE)
                    Store (One, VFMK)
                    Store (Zero, FLAG)
                    Store (One, DOCK)
                }

                Method (ATC2, 1, Serialized)
                {
                    CreateField (Arg0, 0x10, 0x03, FUCC)
                    CreateField (Arg0, 0x13, 0x06, DEVV)
                    CreateByteField (Arg0, 0x03, BUSS)
                    CreateDWordField (Arg0, 0x04, VFMK)
                    CreateDWordField (Arg0, 0x06, FLAG)
                    CreateField (Arg0, 0x30, One, ADVC)
                    CreateField (Arg0, 0x31, One, WFCM)
                    CreateByteField (Arg0, 0x08, RQST)
                    CreateByteField (Arg0, 0x09, PFRQ)
                    CreateWordField (AT00, Zero, SZZE)
                    CreateByteField (AT00, 0x02, RETV)
                    Store (0x03, SZZE)
                    Store (One, RETV)
                    Store (ALIB (0x02, Arg0), AT00)
                }

                Method (ATC3, 0, Serialized)
                {
                    CreateWordField (AT00, Zero, SZZE)
                    CreateByteField (AT00, 0x02, RETV)
                    CreateWordField (AT01, Zero, SZZB)
                    CreateByteField (AT01, 0x02, PSPP)
                    Store (0x03, SZZE)
                    Store (One, RETV)
                    Store (0x03, SZZB)
                    Store (One, PSPP)
                    Store (ALIB (0x03, AT01), AT00)
                }

                Method (ATC4, 1, Serialized)
                {
                    CreateField (Arg0, 0x10, 0x03, FUCC)
                    CreateField (Arg0, 0x13, 0x06, DEVV)
                    CreateByteField (Arg0, 0x03, BUSS)
                    CreateByteField (Arg0, 0x04, NULN)
                    CreateWordField (AT00, Zero, SZZE)
                    CreateByteField (AT00, 0x02, NULM)
                    Store (0x03, SZZE)
                    Store (One, NULM)
                    Store (ALIB (0x04, Arg0), AT00)
                }
            }

            Device (PB2)
            {
                Name (_ADR, 0x00020000)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    If (LEqual (WKPM, One))
                    {
                        Return (GPRW (0x08, 0x05))
                    }
                    Else
                    {
                        Return (GPRW (0x08, Zero))
                    }
                }

                Name (PR02, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        LNKC, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        LNKD, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        LNKA, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        LNKB, 
                        Zero
                    }
                })
                Name (AR02, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        0x12
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        Zero, 
                        0x13
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        Zero, 
                        0x10
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        Zero, 
                        0x11
                    }
                })
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        Return (AR02)
                    }

                    Return (PR02)
                }

                OperationRegion (XPEX, SystemMemory, 0xF8010100, 0x0100)
                Field (XPEX, DWordAcc, NoLock, Preserve)
                {
                    Offset (0x28), 
                    VC0S,   32
                }

                OperationRegion (XPCB, PCI_Config, 0x58, 0x24)
                Field (XPCB, AnyAcc, NoLock, Preserve)
                {
                    Offset (0x10), 
                    LKCN,   16, 
                    LKST,   16, 
                    Offset (0x1A), 
                        ,   3, 
                    PDC2,   1, 
                        ,   2, 
                    PDS2,   1, 
                    Offset (0x1B), 
                    HPCS,   1, 
                    Offset (0x20), 
                    Offset (0x22), 
                    PMES,   1
                }

                OperationRegion (XPRI, PCI_Config, 0xE0, 0x08)
                Field (XPRI, ByteAcc, NoLock, Preserve)
                {
                    XPIR,   32, 
                    XPID,   32
                }

                OperationRegion (PCFG, PCI_Config, Zero, 0x20)
                Field (PCFG, DWordAcc, NoLock, Preserve)
                {
                    DVID,   32, 
                    Offset (0x18), 
                    SBUS,   32
                }

                Method (XPDL, 0, NotSerialized)
                {
                    If (And (VC0S, 0x00020000))
                    {
                        Return (Ones)
                    }
                    Else
                    {
                        Return (Zero)
                    }
                }

                Mutex (XPPM, 0x00)
                Method (XPRD, 1, NotSerialized)
                {
                    Acquire (XPPM, 0xFFFF)
                    Store (Arg0, XPIR)
                    Store (XPID, Local0)
                    Store (Zero, XPIR)
                    Release (XPPM)
                    Return (Local0)
                }

                Method (XPWR, 2, NotSerialized)
                {
                    Acquire (XPPM, 0xFFFF)
                    Store (Arg0, XPIR)
                    Store (Arg1, XPID)
                    Store (Zero, XPIR)
                    Release (XPPM)
                }

                Method (XPRT, 0, NotSerialized)
                {
                    Store (XPRD (0xA2), Local0)
                    And (Local0, 0xFFFFFFF8, Local0)
                    ShiftRight (Local0, 0x04, Local1)
                    And (Local1, 0x07, Local1)
                    Or (Local0, Local1, Local0)
                    Or (Local0, 0x0100, Local0)
                    XPWR (0xA2, Local0)
                }

                Method (XPR2, 0, NotSerialized)
                {
                    Store (LKCN, Local0)
                    And (Local0, 0xFFFFFFDF, Local0)
                    Store (Local0, LKCN)
                    Or (Local0, 0x20, Local0)
                    Store (Local0, LKCN)
                    Store (0x64, Local1)
                    Store (One, Local2)
                    While (LAnd (Local1, Local2))
                    {
                        Sleep (One)
                        Store (LKST, Local3)
                        If (And (Local3, 0x0800))
                        {
                            Decrement (Local1)
                        }
                        Else
                        {
                            Store (Zero, Local2)
                        }
                    }

                    And (Local0, 0xFFFFFFDF, Local0)
                    Store (Local0, LKCN)
                    If (LNot (Local2))
                    {
                        Return (Ones)
                    }
                    Else
                    {
                        Return (Zero)
                    }
                }

                Method (XPPB, 0, NotSerialized)
                {
                    Store (_ADR, Local0)
                    Store (ShiftRight (Local0, 0x10), Local1)
                    Store (ShiftLeft (Local1, 0x03), Local1)
                    Store (And (Local0, 0x0F), Local2)
                    Store (Or (Local1, Local2), Local3)
                    Return (Local3)
                }

                Method (XPPR, 1, NotSerialized)
                {
                    Name (HPOK, Zero)
                    Store (Zero, HPOK)
                    Store (ShiftLeft (XPPB (), 0x03), Local0)
                    If (Arg0)
                    {
                        XPLL (Local0, One)
                        XPLP (Local0, One)
                        Sleep (0xC8)
                        XPTR (Local0, One)
                        Store (0x0F, Local5)
                        While (LAnd (LNot (HPOK), LGreater (Local5, Zero)))
                        {
                            Store (One, PDC2)
                            Store (0x28, Local1)
                            While (LAnd (LNot (HPOK), LGreater (Local1, Zero)))
                            {
                                Store (XPRD (0xA5), Local2)
                                If (LEqual (And (Local2, 0xFF), 0x3F))
                                {
                                    Store (One, Local1)
                                }

                                If (LEqual (And (ShiftRight (Local2, 0x08), 0xFF), 0x3F))
                                {
                                    Store (One, Local1)
                                }

                                If (LEqual (And (ShiftRight (Local2, 0x08), 0xFF), 0x3F))
                                {
                                    Store (One, Local1)
                                }

                                If (LEqual (And (ShiftRight (Local2, 0x08), 0xFF), 0x3F))
                                {
                                    Store (One, Local1)
                                }

                                If (LGreaterEqual (And (Local2, 0xFF), 0x04))
                                {
                                    Store (One, HPOK)
                                }

                                Decrement (Local1)
                            }

                            If (HPOK)
                            {
                                Store (And (XPRD (0xA5), 0xFF), Local2)
                                Store (And (ShiftRight (XPRD (0xA2), 0x04), 0x07), Local3)
                                If (LAnd (LEqual (Local2, 0x06), LAnd (LGreater (Local3, One), LLess (
                                    Local3, 0x05))))
                                {
                                    Store (Zero, HPOK)
                                }
                            }

                            If (HPOK)
                            {
                                Store (0x07D0, Local1)
                                Store (Zero, HPOK)
                                While (LAnd (LNot (HPOK), Local1))
                                {
                                    Store (And (XPRD (0xA5), 0xFF), Local2)
                                    If (LEqual (Local2, 0x07))
                                    {
                                        Store (One, Local1)
                                        Store (XPDL (), Local4)
                                        If (Local4)
                                        {
                                            XPRT ()
                                            Decrement (Local5)
                                        }
                                    }

                                    If (LEqual (Local2, 0x10))
                                    {
                                        Store (One, HPOK)
                                    }

                                    Sleep (One)
                                    Decrement (Local1)
                                }
                            }
                        }
                    }

                    If (HPOK)
                    {
                        XPTR (Local0, Zero)
                        XPLP (Local0, Zero)
                        XPLL (Local0, Zero)
                    }

                    Return (Ones)
                }

                Device (VGA)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    OperationRegion (PCFG, PCI_Config, Zero, 0x50)
                    Field (PCFG, DWordAcc, NoLock, Preserve)
                    {
                        DVID,   32, 
                        Offset (0x2C), 
                        SVID,   32, 
                        Offset (0x4C), 
                        SMID,   32
                    }

                    Name (DOSA, Zero)
                    Name (SWIT, One)
                    Name (CRTA, One)
                    Name (LCDA, One)
                    Name (HDMA, One)
                    Method (_DOS, 1, NotSerialized)  // _DOS: Disable Output Switching
                    {
                        Store (Arg0, DOSA)
                    }

                    Method (_DOD, 0, NotSerialized)  // _DOD: Display Output Devices
                    {
                        Name (DODL, Package (0x03)
                        {
                            0x00010100, 
                            0x00010110, 
                            0x00010210
                        })
                        Return (DODL)
                    }

                    Device (LCD)
                    {
                        Name (_ADR, 0x0110)  // _ADR: Address
                        Method (_DCS, 0, NotSerialized)  // _DCS: Display Current Status
                        {
                            Store ("LCD -- _DCS", Debug)
                            If (LCDA)
                            {
                                Return (0x1F)
                            }
                            Else
                            {
                                Return (0x1D)
                            }
                        }

                        Method (_DGS, 0, NotSerialized)  // _DGS: Display Graphics State
                        {
                            Store ("LCD -- _DCS", Debug)
                            If (LCDA)
                            {
                                Return (One)
                            }
                            Else
                            {
                                Return (Zero)
                            }
                        }

                        Method (_DSS, 1, NotSerialized)  // _DSS: Device Set State
                        {
                            Store ("LCD -- _DSS", Debug)
                        }

                        Name (BRTB, Package (0x0D)
                        {
                            0x64, 
                            0x32, 
                            Zero, 
                            0x0A, 
                            0x14, 
                            0x1E, 
                            0x28, 
                            0x32, 
                            0x3C, 
                            0x46, 
                            0x50, 
                            0x5A, 
                            0x64
                        })
                        Name (AU15, Package (0x0B)
                        {
                            0x07, 
                            0x09, 
                            0x0D, 
                            0x11, 
                            0x16, 
                            0x1D, 
                            0x25, 
                            0x2F, 
                            0x3C, 
                            0x4E, 
                            0x64
                        })
                        Name (CM15, Package (0x0B)
                        {
                            0x07, 
                            0x09, 
                            0x0D, 
                            0x11, 
                            0x16, 
                            0x1D, 
                            0x25, 
                            0x2F, 
                            0x3C, 
                            0x4E, 
                            0x64
                        })
                        Name (DEFT, Package (0x0B)
                        {
                            0x06, 
                            0x08, 
                            0x0B, 
                            0x0E, 
                            0x13, 
                            0x19, 
                            0x21, 
                            0x2A, 
                            0x36, 
                            0x45, 
                            0x64
                        })
                        Method (_BCL, 0, NotSerialized)  // _BCL: Brightness Control Levels
                        {
                            Return (BRTB)
                        }

                        Name (BQCL, 0x06)
                        Method (_BCM, 1, NotSerialized)  // _BCM: Brightness Control Method
                        {
                            Store (Zero, BRLS)
                            Store (0x55, BCMF)
                            Store (Arg0, BCMV)
                            If (LAnd (LGreaterEqual (Arg0, Zero), LLessEqual (Arg0, 0x64)))
                            {
                                Store (Arg0, Local0)
                                Store (Arg0, BQCL)
                                Divide (Arg0, 0x0A, Local2, Local1)
                                Store (DerefOf (Index (DEFT, Local1)), Local0)
                                If (LEqual (LCDD, 0x22ECAF06))
                                {
                                    Store (DerefOf (Index (AU15, Local1)), Local0)
                                }

                                If (LEqual (LCDD, 0x15A2AF0D))
                                {
                                    Store (DerefOf (Index (CM15, Local1)), Local0)
                                }
                            }

                            If (^^^^LPC0.EC.ADP)
                            {
                                Store (Local1, ^^^^LPC0.EC.LCBA)
                            }
                            Else
                            {
                                Store (Local1, ^^^^LPC0.EC.LCBD)
                            }

                            Acquire (^^^^LPC0.PSMX, 0xFFFF)
                            Store (Local0, BRTL)
                            Store (0x72, BCMD)
                            BSMI (Zero)
                            Release (^^^^LPC0.PSMX)
                        }

                        Method (_BQC, 0, NotSerialized)  // _BQC: Brightness Query Current
                        {
                            Store (BQCL, Local0)
                            Return (Local0)
                        }

                        Method (BRAJ, 0, NotSerialized)
                        {
                            If (^^^^LPC0.EC.BRUP)
                            {
                                If (LLess (BCMV, 0x64))
                                {
                                    Add (BCMV, 0x0A, Local0)
                                    _BCM (Local0)
                                }
                            }

                            If (^^^^LPC0.EC.BRDN)
                            {
                                If (LGreater (BCMV, Zero))
                                {
                                    Subtract (BCMV, 0x0A, Local0)
                                    _BCM (Local0)
                                }
                            }

                            Store (One, BRLS)
                        }
                    }

                    Device (CRT)
                    {
                        Name (_ADR, 0x0100)  // _ADR: Address
                        Method (_DCS, 0, NotSerialized)  // _DCS: Display Current Status
                        {
                            Store ("CRT _DCS Debug", Debug)
                            If (CRTA)
                            {
                                Return (0x1F)
                            }
                            Else
                            {
                                Return (0x1D)
                            }
                        }

                        Method (_DGS, 0, NotSerialized)  // _DGS: Display Graphics State
                        {
                            Store ("CRT _DGS Debug", Debug)
                            If (CRTA)
                            {
                                Return (One)
                            }
                            Else
                            {
                                Return (Zero)
                            }
                        }

                        Method (_DSS, 1, NotSerialized)  // _DSS: Device Set State
                        {
                            Store ("CRT _DSS Debug", Debug)
                        }
                    }

                    Device (HDMI)
                    {
                        Name (_ADR, 0x0210)  // _ADR: Address
                        Method (_DCS, 0, NotSerialized)  // _DCS: Display Current Status
                        {
                            Store ("HDMI _DCS Debug", Debug)
                            If (HDMA)
                            {
                                Return (0x1F)
                            }
                            Else
                            {
                                Return (0x1D)
                            }
                        }

                        Method (_DGS, 0, NotSerialized)  // _DGS: Display Graphics State
                        {
                            Store ("HDMI _DGS Debug", Debug)
                            If (HDMA)
                            {
                                Return (One)
                            }
                            Else
                            {
                                Return (Zero)
                            }
                        }

                        Method (_DSS, 1, NotSerialized)  // _DSS: Device Set State
                        {
                            Store ("HDMI _DSS Debug", Debug)
                        }
                    }

                    Name (ATIB, Buffer (0x0100) {})
                    Method (ATIF, 2, Serialized)
                    {
                        If (LEqual (Arg0, Zero))
                        {
                            Return (AF00 ())
                        }

                        If (LEqual (Arg0, One))
                        {
                            Return (AF01 ())
                        }

                        If (LEqual (Arg0, 0x02))
                        {
                            Return (AF02 ())
                        }

                        If (LEqual (Arg0, 0x03))
                        {
                            Return (AF03 (DerefOf (Index (Arg1, 0x02)), DerefOf (Index (Arg1, 
                                0x04))))
                        }

                        If (LEqual (Arg0, 0x0F))
                        {
                            Return (AF15 ())
                        }
                        Else
                        {
                            CreateWordField (ATIB, Zero, SSZE)
                            CreateWordField (ATIB, 0x02, VERN)
                            CreateDWordField (ATIB, 0x04, NMSK)
                            CreateDWordField (ATIB, 0x08, SFUN)
                            Store (Zero, SSZE)
                            Store (Zero, VERN)
                            Store (Zero, NMSK)
                            Store (Zero, SFUN)
                            Return (ATIB)
                        }
                    }

                    Method (AF00, 0, NotSerialized)
                    {
                        CreateWordField (ATIB, Zero, SSZE)
                        CreateWordField (ATIB, 0x02, VERN)
                        CreateDWordField (ATIB, 0x04, NMSK)
                        CreateDWordField (ATIB, 0x08, SFUN)
                        Store (0x0C, SSZE)
                        Store (One, VERN)
                        If (LEqual (^^^VGA.PXEN, 0x80000000))
                        {
                            Store (0x11, NMSK)
                        }
                        Else
                        {
                            Store (0x51, NMSK)
                        }

                        Store (NMSK, MSKN)
                        Store (0x4007, SFUN)
                        Return (ATIB)
                    }

                    Method (AF01, 0, NotSerialized)
                    {
                        CreateWordField (ATIB, Zero, SSZE)
                        CreateDWordField (ATIB, 0x02, VMSK)
                        CreateDWordField (ATIB, 0x06, FLGS)
                        Store (0x0A, SSZE)
                        Store (0x0B, VMSK)
                        Store (0x0A, SSZE)
                        Store (0x0B, FLGS)
                        Return (ATIB)
                    }

                    Name (PSBR, Buffer (0x04)
                    {
                         0x00, 0x00, 0x00, 0x00
                    })
                    Name (MSKN, Zero)
                    Name (SEXM, Zero)
                    Name (STHG, Zero)
                    Name (STHI, Zero)
                    Name (SFPG, Zero)
                    Name (SFPI, Zero)
                    Name (SSPS, Zero)
                    Name (SSDM, 0x0A)
                    Name (SCDY, Zero)
                    Name (SACT, Buffer (0x07)
                    {
                         0x01, 0x02, 0x08, 0x80, 0x03, 0x09, 0x81
                    })
                    Method (AF02, 0, NotSerialized)
                    {
                        CreateBitField (PSBR, Zero, PDSW)
                        CreateBitField (PSBR, One, PEXM)
                        CreateBitField (PSBR, 0x02, PTHR)
                        CreateBitField (PSBR, 0x03, PFPS)
                        CreateBitField (PSBR, 0x04, PSPS)
                        CreateBitField (PSBR, 0x05, PDCC)
                        CreateBitField (PSBR, 0x06, PXPS)
                        CreateWordField (ATIB, Zero, SSZE)
                        CreateDWordField (ATIB, 0x02, PSBI)
                        CreateByteField (ATIB, 0x06, EXPM)
                        CreateByteField (ATIB, 0x07, THRM)
                        CreateByteField (ATIB, 0x08, THID)
                        CreateByteField (ATIB, 0x09, FPWR)
                        CreateByteField (ATIB, 0x0A, FPID)
                        CreateByteField (ATIB, 0x0B, SPWR)
                        Store (0x0C, SSZE)
                        Store (PSBR, PSBI)
                        If (PDSW)
                        {
                            Store (Zero, PDSW)
                        }

                        If (PEXM)
                        {
                            Store (SEXM, EXPM)
                            Store (Zero, SEXM)
                            Store (Zero, PEXM)
                        }

                        If (PTHR)
                        {
                            Store (STHG, THRM)
                            Store (STHI, THID)
                            Store (Zero, STHG)
                            Store (Zero, STHI)
                            Store (Zero, PTHR)
                        }

                        If (PFPS)
                        {
                            Store (SFPG, FPWR)
                            Store (SFPI, FPWR)
                            Store (Zero, SFPG)
                            Store (Zero, SFPI)
                            Store (Zero, PFPS)
                        }

                        If (PSPS)
                        {
                            Store (SSPS, SPWR)
                            Store (Zero, PSPS)
                        }

                        If (PXPS)
                        {
                            Store (Zero, PXPS)
                        }

                        Return (ATIB)
                    }

                    Method (AF03, 2, NotSerialized)
                    {
                        CreateWordField (ATIB, Zero, SSZE)
                        CreateWordField (ATIB, 0x02, SSDP)
                        CreateWordField (ATIB, 0x04, SCDP)
                        Store (Arg0, SSDP)
                        Store (Arg1, SCDP)
                        Name (NXTD, 0x06)
                        Name (CIDX, 0x06)
                        Store (SSDP, Local1)
                        And (Local1, 0x8B, Local1)
                        Store (SCDP, Local2)
                        If (CondRefOf (^^^^LID._LID, Local4))
                        {
                            And (Local2, 0xFFFFFFFE, Local2)
                            Or (Local2, ^^^^LID._LID (), Local2)
                        }
                        Else
                        {
                            Or (Local2, One, Local2)
                        }

                        Store (Local2, P80H)
                        Store (Zero, Local0)
                        While (LLess (Local0, SizeOf (SACT)))
                        {
                            Store (DerefOf (Index (SACT, Local0)), Local3)
                            If (LEqual (Local3, Local1))
                            {
                                Store (Local0, CIDX)
                                Store (SizeOf (SACT), Local0)
                            }
                            Else
                            {
                                Increment (Local0)
                            }
                        }

                        Store (CIDX, Local0)
                        While (LLess (Local0, SizeOf (SACT)))
                        {
                            Increment (Local0)
                            If (LEqual (Local0, SizeOf (SACT)))
                            {
                                Store (Zero, Local0)
                            }

                            Store (DerefOf (Index (SACT, Local0)), Local3)
                            If (LEqual (And (Local3, Local2), Local3))
                            {
                                Store (Local0, NXTD)
                                Store (SizeOf (SACT), Local0)
                            }
                        }

                        If (LEqual (NXTD, SizeOf (SACT)))
                        {
                            Store (Zero, SSDP)
                        }
                        Else
                        {
                            Store (NXTD, Local0)
                            Store (DerefOf (Index (SACT, Local0)), Local3)
                            And (SSDP, 0xFFFFFFF4, SSDP)
                            Or (SSDP, Local3, SSDP)
                        }

                        Store (0x04, SSZE)
                        Store (SSDP, P80H)
                        Return (ATIB)
                    }

                    Method (AFN0, 0, Serialized)
                    {
                        If (And (MSKN, One))
                        {
                            CreateBitField (PSBR, Zero, PDSW)
                            Store (One, PDSW)
                            Notify (VGA, 0x81)
                        }
                    }

                    Method (AFN3, 2, Serialized)
                    {
                        If (And (MSKN, 0x08))
                        {
                            Store (Arg0, Local0)
                            Store (Local0, SFPI)
                            Store (Arg1, Local0)
                            Store (And (Local0, 0x03, Local0), SFPG)
                            CreateBitField (PSBR, 0x03, PFPS)
                            Store (One, PFPS)
                            Notify (VGA, 0x81)
                        }
                    }

                    Method (AFN4, 1, Serialized)
                    {
                        If (And (MSKN, 0x10))
                        {
                            Store (Arg0, Local0)
                            Store (SSPS, Local1)
                            Store (Local0, SSPS)
                            If (LEqual (Local0, Local1)) {}
                            Else
                            {
                                CreateBitField (PSBR, 0x04, PSPS)
                                Store (One, PSPS)
                                Notify (VGA, 0x81)
                            }
                        }
                    }

                    Method (AFN5, 0, Serialized)
                    {
                        If (And (MSKN, 0x20))
                        {
                            CreateBitField (PSBR, 0x05, PDCC)
                            Store (One, PDCC)
                            Notify (VGA, 0x81)
                        }
                    }

                    Method (AFN6, 0, Serialized)
                    {
                        If (And (MSKN, 0x40))
                        {
                            CreateBitField (PSBR, 0x06, PXPS)
                            Store (One, PXPS)
                            Notify (VGA, 0x81)
                        }
                    }

                    Method (AF15, 0, NotSerialized)
                    {
                        Store (0xFF, P80H)
                        CreateWordField (ATIB, 0x02, DSZE)
                        Store (0x08, DSZE)
                        Acquire (^^^LPC0.PSMX, 0xFFFF)
                        Store (0x8D, BCMD)
                        Store (0x0F, DID)
                        Store (ATIB, INFO)
                        BSMI (Zero)
                        Store (INFO, ATIB)
                        Release (^^^LPC0.PSMX)
                        Return (ATIB)
                    }

                    Name (AT00, Buffer (0xFF) {})
                    Name (AT01, Buffer (0x03) {})
                    Method (ATCS, 2, Serialized)
                    {
                        If (LEqual (Arg0, Zero))
                        {
                            ATC0 ()
                        }

                        If (LEqual (Arg0, One))
                        {
                            ATC1 ()
                        }

                        If (LEqual (Arg0, 0x02))
                        {
                            ATC2 (Arg1)
                        }

                        If (LEqual (Arg0, 0x03))
                        {
                            ATC3 ()
                        }

                        If (LEqual (Arg0, 0x04))
                        {
                            ATC4 (Arg1)
                        }

                        Return (AT00)
                    }

                    Method (ATC0, 0, NotSerialized)
                    {
                        CreateWordField (AT00, Zero, SZZE)
                        CreateWordField (AT00, 0x02, INTF)
                        CreateDWordField (AT00, 0x04, SUPP)
                        Store (0x08, SZZE)
                        Store (One, INTF)
                        Store (0x0F, SUPP)
                    }

                    Method (ATC1, 0, Serialized)
                    {
                        CreateWordField (AT00, Zero, SZZE)
                        CreateDWordField (AT00, 0x02, VFMK)
                        CreateDWordField (AT00, 0x06, FLAG)
                        CreateField (AT00, 0x30, One, DOCK)
                        Store (0x0A, SZZE)
                        Store (One, VFMK)
                        Store (Zero, FLAG)
                        Store (One, DOCK)
                    }

                    Method (ATC2, 1, Serialized)
                    {
                        CreateField (Arg0, 0x10, 0x03, FUCC)
                        CreateField (Arg0, 0x13, 0x06, DEVV)
                        CreateByteField (Arg0, 0x03, BUSS)
                        CreateDWordField (Arg0, 0x04, VFMK)
                        CreateDWordField (Arg0, 0x06, FLAG)
                        CreateField (Arg0, 0x30, One, ADVC)
                        CreateField (Arg0, 0x31, One, WFCM)
                        CreateByteField (Arg0, 0x08, RQST)
                        CreateByteField (Arg0, 0x09, PFRQ)
                        CreateWordField (AT00, Zero, SZZE)
                        CreateByteField (AT00, 0x02, RETV)
                        Store (0x03, SZZE)
                        Store (One, RETV)
                        Store (ALIB (0x02, Arg0), AT00)
                    }

                    Method (ATC3, 0, Serialized)
                    {
                        CreateWordField (AT00, Zero, SZZE)
                        CreateByteField (AT00, 0x02, RETV)
                        CreateWordField (AT01, Zero, SZZB)
                        CreateByteField (AT01, 0x02, PSPP)
                        Store (0x03, SZZE)
                        Store (One, RETV)
                        Store (0x03, SZZB)
                        Store (One, PSPP)
                        Store (ALIB (0x03, AT01), AT00)
                    }

                    Method (ATC4, 1, Serialized)
                    {
                        CreateField (Arg0, 0x10, 0x03, FUCC)
                        CreateField (Arg0, 0x13, 0x06, DEVV)
                        CreateByteField (Arg0, 0x03, BUSS)
                        CreateByteField (Arg0, 0x04, NULN)
                        CreateWordField (AT00, Zero, SZZE)
                        CreateByteField (AT00, 0x02, NULM)
                        Store (0x03, SZZE)
                        Store (One, NULM)
                        Store (ALIB (0x04, Arg0), AT00)
                    }

                    Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                    {
                        If (LNotEqual (^^^VGA.PXMX, 0x80000000))
                        {
                            Return (Zero)
                        }
                        Else
                        {
                            If (LEqual (0x18, XPPB ()))
                            {
                                If (LNotEqual (^^^VGA.PXEN, 0x80000000))
                                {
                                    Return (Zero)
                                }
                                Else
                                {
                                    Return (One)
                                }
                            }
                            Else
                            {
                                Return (Zero)
                            }
                        }
                    }
                }

                Device (HDAU)
                {
                    Name (_ADR, One)  // _ADR: Address
                    OperationRegion (PCFG, PCI_Config, Zero, 0x50)
                    Field (PCFG, DWordAcc, NoLock, Preserve)
                    {
                        DVID,   32, 
                        Offset (0x2C), 
                        SVID,   32, 
                        Offset (0x4C), 
                        SMID,   32
                    }
                }
            }

            Device (PB3)
            {
                Name (_ADR, 0x00030000)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    If (LEqual (WKPM, One))
                    {
                        Return (GPRW (0x08, 0x04))
                    }
                    Else
                    {
                        Return (GPRW (0x08, Zero))
                    }
                }

                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (GPIC)
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                Zero, 
                                Zero, 
                                0x13
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                One, 
                                Zero, 
                                0x10
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                Zero, 
                                0x11
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                Zero, 
                                0x12
                            }
                        })
                    }
                    Else
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                Zero, 
                                LNKD, 
                                Zero
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                One, 
                                LNKA, 
                                Zero
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                LNKB, 
                                Zero
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                LNKC, 
                                Zero
                            }
                        })
                    }
                }

                OperationRegion (XPEX, SystemMemory, 0xF8018100, 0x0100)
                Field (XPEX, DWordAcc, NoLock, Preserve)
                {
                    Offset (0x28), 
                    VC0S,   32
                }

                OperationRegion (XPCB, PCI_Config, 0x58, 0x24)
                Field (XPCB, AnyAcc, NoLock, Preserve)
                {
                    Offset (0x10), 
                    LKCN,   16, 
                    LKST,   16, 
                    Offset (0x1A), 
                        ,   3, 
                    PDC2,   1, 
                        ,   2, 
                    PDS2,   1, 
                    Offset (0x1B), 
                    HPCS,   1, 
                    Offset (0x20), 
                    Offset (0x22), 
                    PMES,   1
                }

                OperationRegion (XPRI, PCI_Config, 0xE0, 0x08)
                Field (XPRI, ByteAcc, NoLock, Preserve)
                {
                    XPIR,   32, 
                    XPID,   32
                }

                OperationRegion (PCFG, PCI_Config, Zero, 0x20)
                Field (PCFG, DWordAcc, NoLock, Preserve)
                {
                    DVID,   32, 
                    Offset (0x18), 
                    SBUS,   32
                }

                Method (XPDL, 0, NotSerialized)
                {
                    If (And (VC0S, 0x00020000))
                    {
                        Return (Ones)
                    }
                    Else
                    {
                        Return (Zero)
                    }
                }

                Mutex (XPPM, 0x00)
                Method (XPRD, 1, NotSerialized)
                {
                    Acquire (XPPM, 0xFFFF)
                    Store (Arg0, XPIR)
                    Store (XPID, Local0)
                    Store (Zero, XPIR)
                    Release (XPPM)
                    Return (Local0)
                }

                Method (XPWR, 2, NotSerialized)
                {
                    Acquire (XPPM, 0xFFFF)
                    Store (Arg0, XPIR)
                    Store (Arg1, XPID)
                    Store (Zero, XPIR)
                    Release (XPPM)
                }

                Method (XPRT, 0, NotSerialized)
                {
                    Store (XPRD (0xA2), Local0)
                    And (Local0, 0xFFFFFFF8, Local0)
                    ShiftRight (Local0, 0x04, Local1)
                    And (Local1, 0x07, Local1)
                    Or (Local0, Local1, Local0)
                    Or (Local0, 0x0100, Local0)
                    XPWR (0xA2, Local0)
                }

                Method (XPR2, 0, NotSerialized)
                {
                    Store (LKCN, Local0)
                    And (Local0, 0xFFFFFFDF, Local0)
                    Store (Local0, LKCN)
                    Or (Local0, 0x20, Local0)
                    Store (Local0, LKCN)
                    Store (0x64, Local1)
                    Store (One, Local2)
                    While (LAnd (Local1, Local2))
                    {
                        Sleep (One)
                        Store (LKST, Local3)
                        If (And (Local3, 0x0800))
                        {
                            Decrement (Local1)
                        }
                        Else
                        {
                            Store (Zero, Local2)
                        }
                    }

                    And (Local0, 0xFFFFFFDF, Local0)
                    Store (Local0, LKCN)
                    If (LNot (Local2))
                    {
                        Return (Ones)
                    }
                    Else
                    {
                        Return (Zero)
                    }
                }

                Method (XPPB, 0, NotSerialized)
                {
                    Store (_ADR, Local0)
                    Store (ShiftRight (Local0, 0x10), Local1)
                    Store (ShiftLeft (Local1, 0x03), Local1)
                    Store (And (Local0, 0x0F), Local2)
                    Store (Or (Local1, Local2), Local3)
                    Return (Local3)
                }

                Method (XPPR, 1, NotSerialized)
                {
                    Name (HPOK, Zero)
                    Store (Zero, HPOK)
                    Store (ShiftLeft (XPPB (), 0x03), Local0)
                    If (Arg0)
                    {
                        XPLL (Local0, One)
                        XPLP (Local0, One)
                        Sleep (0xC8)
                        XPTR (Local0, One)
                        Store (0x0F, Local5)
                        While (LAnd (LNot (HPOK), LGreater (Local5, Zero)))
                        {
                            Store (One, PDC2)
                            Store (0x28, Local1)
                            While (LAnd (LNot (HPOK), LGreater (Local1, Zero)))
                            {
                                Store (XPRD (0xA5), Local2)
                                If (LEqual (And (Local2, 0xFF), 0x3F))
                                {
                                    Store (One, Local1)
                                }

                                If (LEqual (And (ShiftRight (Local2, 0x08), 0xFF), 0x3F))
                                {
                                    Store (One, Local1)
                                }

                                If (LEqual (And (ShiftRight (Local2, 0x08), 0xFF), 0x3F))
                                {
                                    Store (One, Local1)
                                }

                                If (LEqual (And (ShiftRight (Local2, 0x08), 0xFF), 0x3F))
                                {
                                    Store (One, Local1)
                                }

                                If (LGreaterEqual (And (Local2, 0xFF), 0x04))
                                {
                                    Store (One, HPOK)
                                }

                                Decrement (Local1)
                            }

                            If (HPOK)
                            {
                                Store (And (XPRD (0xA5), 0xFF), Local2)
                                Store (And (ShiftRight (XPRD (0xA2), 0x04), 0x07), Local3)
                                If (LAnd (LEqual (Local2, 0x06), LAnd (LGreater (Local3, One), LLess (
                                    Local3, 0x05))))
                                {
                                    Store (Zero, HPOK)
                                }
                            }

                            If (HPOK)
                            {
                                Store (0x07D0, Local1)
                                Store (Zero, HPOK)
                                While (LAnd (LNot (HPOK), Local1))
                                {
                                    Store (And (XPRD (0xA5), 0xFF), Local2)
                                    If (LEqual (Local2, 0x07))
                                    {
                                        Store (One, Local1)
                                        Store (XPDL (), Local4)
                                        If (Local4)
                                        {
                                            XPRT ()
                                            Decrement (Local5)
                                        }
                                    }

                                    If (LEqual (Local2, 0x10))
                                    {
                                        Store (One, HPOK)
                                    }

                                    Sleep (One)
                                    Decrement (Local1)
                                }
                            }
                        }
                    }

                    If (HPOK)
                    {
                        XPTR (Local0, Zero)
                        XPLP (Local0, Zero)
                        XPLL (Local0, Zero)
                    }

                    Return (Ones)
                }

                Device (VGA)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    OperationRegion (PCFG, PCI_Config, Zero, 0x50)
                    Field (PCFG, DWordAcc, NoLock, Preserve)
                    {
                        DVID,   32, 
                        Offset (0x2C), 
                        SVID,   32, 
                        Offset (0x4C), 
                        SMID,   32
                    }

                    Name (DOSA, Zero)
                    Name (SWIT, One)
                    Name (CRTA, One)
                    Name (LCDA, One)
                    Name (HDMA, One)
                    Method (_DOS, 1, NotSerialized)  // _DOS: Disable Output Switching
                    {
                        Store (Arg0, DOSA)
                    }

                    Method (_DOD, 0, NotSerialized)  // _DOD: Display Output Devices
                    {
                        Name (DODL, Package (0x03)
                        {
                            0x00010100, 
                            0x00010110, 
                            0x00010210
                        })
                        Return (DODL)
                    }

                    Device (LCD)
                    {
                        Name (_ADR, 0x0110)  // _ADR: Address
                        Method (_DCS, 0, NotSerialized)  // _DCS: Display Current Status
                        {
                            Store ("LCD -- _DCS", Debug)
                            If (LCDA)
                            {
                                Return (0x1F)
                            }
                            Else
                            {
                                Return (0x1D)
                            }
                        }

                        Method (_DGS, 0, NotSerialized)  // _DGS: Display Graphics State
                        {
                            Store ("LCD -- _DCS", Debug)
                            If (LCDA)
                            {
                                Return (One)
                            }
                            Else
                            {
                                Return (Zero)
                            }
                        }

                        Method (_DSS, 1, NotSerialized)  // _DSS: Device Set State
                        {
                            Store ("LCD -- _DSS", Debug)
                        }

                        Name (BRTB, Package (0x0D)
                        {
                            0x64, 
                            0x32, 
                            Zero, 
                            0x0A, 
                            0x14, 
                            0x1E, 
                            0x28, 
                            0x32, 
                            0x3C, 
                            0x46, 
                            0x50, 
                            0x5A, 
                            0x64
                        })
                        Name (AU15, Package (0x0B)
                        {
                            0x07, 
                            0x09, 
                            0x0D, 
                            0x11, 
                            0x16, 
                            0x1D, 
                            0x25, 
                            0x2F, 
                            0x3C, 
                            0x4E, 
                            0x64
                        })
                        Name (CM15, Package (0x0B)
                        {
                            0x07, 
                            0x09, 
                            0x0D, 
                            0x11, 
                            0x16, 
                            0x1D, 
                            0x25, 
                            0x2F, 
                            0x3C, 
                            0x4E, 
                            0x64
                        })
                        Name (DEFT, Package (0x0B)
                        {
                            0x06, 
                            0x08, 
                            0x0B, 
                            0x0E, 
                            0x13, 
                            0x19, 
                            0x21, 
                            0x2A, 
                            0x36, 
                            0x45, 
                            0x64
                        })
                        Method (_BCL, 0, NotSerialized)  // _BCL: Brightness Control Levels
                        {
                            Return (BRTB)
                        }

                        Name (BQCL, 0x06)
                        Method (_BCM, 1, NotSerialized)  // _BCM: Brightness Control Method
                        {
                            Store (Zero, BRLS)
                            Store (0x55, BCMF)
                            Store (Arg0, BCMV)
                            If (LAnd (LGreaterEqual (Arg0, Zero), LLessEqual (Arg0, 0x64)))
                            {
                                Store (Arg0, Local0)
                                Store (Arg0, BQCL)
                                Divide (Arg0, 0x0A, Local2, Local1)
                                Store (DerefOf (Index (DEFT, Local1)), Local0)
                                If (LEqual (LCDD, 0x22ECAF06))
                                {
                                    Store (DerefOf (Index (AU15, Local1)), Local0)
                                }

                                If (LEqual (LCDD, 0x15A2AF0D))
                                {
                                    Store (DerefOf (Index (CM15, Local1)), Local0)
                                }
                            }

                            If (^^^^LPC0.EC.ADP)
                            {
                                Store (Local1, ^^^^LPC0.EC.LCBA)
                            }
                            Else
                            {
                                Store (Local1, ^^^^LPC0.EC.LCBD)
                            }

                            Acquire (^^^^LPC0.PSMX, 0xFFFF)
                            Store (Local0, BRTL)
                            Store (0x72, BCMD)
                            BSMI (Zero)
                            Release (^^^^LPC0.PSMX)
                        }

                        Method (_BQC, 0, NotSerialized)  // _BQC: Brightness Query Current
                        {
                            Store (BQCL, Local0)
                            Return (Local0)
                        }

                        Method (BRAJ, 0, NotSerialized)
                        {
                            If (^^^^LPC0.EC.BRUP)
                            {
                                If (LLess (BCMV, 0x64))
                                {
                                    Add (BCMV, 0x0A, Local0)
                                    _BCM (Local0)
                                }
                            }

                            If (^^^^LPC0.EC.BRDN)
                            {
                                If (LGreater (BCMV, Zero))
                                {
                                    Subtract (BCMV, 0x0A, Local0)
                                    _BCM (Local0)
                                }
                            }

                            Store (One, BRLS)
                        }
                    }

                    Device (CRT)
                    {
                        Name (_ADR, 0x0100)  // _ADR: Address
                        Method (_DCS, 0, NotSerialized)  // _DCS: Display Current Status
                        {
                            Store ("CRT _DCS Debug", Debug)
                            If (CRTA)
                            {
                                Return (0x1F)
                            }
                            Else
                            {
                                Return (0x1D)
                            }
                        }

                        Method (_DGS, 0, NotSerialized)  // _DGS: Display Graphics State
                        {
                            Store ("CRT _DGS Debug", Debug)
                            If (CRTA)
                            {
                                Return (One)
                            }
                            Else
                            {
                                Return (Zero)
                            }
                        }

                        Method (_DSS, 1, NotSerialized)  // _DSS: Device Set State
                        {
                            Store ("CRT _DSS Debug", Debug)
                        }
                    }

                    Device (HDMI)
                    {
                        Name (_ADR, 0x0210)  // _ADR: Address
                        Method (_DCS, 0, NotSerialized)  // _DCS: Display Current Status
                        {
                            Store ("HDMI _DCS Debug", Debug)
                            If (HDMA)
                            {
                                Return (0x1F)
                            }
                            Else
                            {
                                Return (0x1D)
                            }
                        }

                        Method (_DGS, 0, NotSerialized)  // _DGS: Display Graphics State
                        {
                            Store ("HDMI _DGS Debug", Debug)
                            If (HDMA)
                            {
                                Return (One)
                            }
                            Else
                            {
                                Return (Zero)
                            }
                        }

                        Method (_DSS, 1, NotSerialized)  // _DSS: Device Set State
                        {
                            Store ("HDMI _DSS Debug", Debug)
                        }
                    }

                    Name (ATIB, Buffer (0x0100) {})
                    Method (ATIF, 2, Serialized)
                    {
                        If (LEqual (Arg0, Zero))
                        {
                            Return (AF00 ())
                        }

                        If (LEqual (Arg0, One))
                        {
                            Return (AF01 ())
                        }

                        If (LEqual (Arg0, 0x02))
                        {
                            Return (AF02 ())
                        }

                        If (LEqual (Arg0, 0x03))
                        {
                            Return (AF03 (DerefOf (Index (Arg1, 0x02)), DerefOf (Index (Arg1, 
                                0x04))))
                        }

                        If (LEqual (Arg0, 0x0F))
                        {
                            Return (AF15 ())
                        }
                        Else
                        {
                            CreateWordField (ATIB, Zero, SSZE)
                            CreateWordField (ATIB, 0x02, VERN)
                            CreateDWordField (ATIB, 0x04, NMSK)
                            CreateDWordField (ATIB, 0x08, SFUN)
                            Store (Zero, SSZE)
                            Store (Zero, VERN)
                            Store (Zero, NMSK)
                            Store (Zero, SFUN)
                            Return (ATIB)
                        }
                    }

                    Method (AF00, 0, NotSerialized)
                    {
                        CreateWordField (ATIB, Zero, SSZE)
                        CreateWordField (ATIB, 0x02, VERN)
                        CreateDWordField (ATIB, 0x04, NMSK)
                        CreateDWordField (ATIB, 0x08, SFUN)
                        Store (0x0C, SSZE)
                        Store (One, VERN)
                        If (LEqual (^^^VGA.PXEN, 0x80000000))
                        {
                            Store (0x11, NMSK)
                        }
                        Else
                        {
                            Store (0x51, NMSK)
                        }

                        Store (NMSK, MSKN)
                        Store (0x4007, SFUN)
                        Return (ATIB)
                    }

                    Method (AF01, 0, NotSerialized)
                    {
                        CreateWordField (ATIB, Zero, SSZE)
                        CreateDWordField (ATIB, 0x02, VMSK)
                        CreateDWordField (ATIB, 0x06, FLGS)
                        Store (0x0A, SSZE)
                        Store (0x0B, VMSK)
                        Store (0x0A, SSZE)
                        Store (0x0B, FLGS)
                        Return (ATIB)
                    }

                    Name (PSBR, Buffer (0x04)
                    {
                         0x00, 0x00, 0x00, 0x00
                    })
                    Name (MSKN, Zero)
                    Name (SEXM, Zero)
                    Name (STHG, Zero)
                    Name (STHI, Zero)
                    Name (SFPG, Zero)
                    Name (SFPI, Zero)
                    Name (SSPS, Zero)
                    Name (SSDM, 0x0A)
                    Name (SCDY, Zero)
                    Name (SACT, Buffer (0x07)
                    {
                         0x01, 0x02, 0x08, 0x80, 0x03, 0x09, 0x81
                    })
                    Method (AF02, 0, NotSerialized)
                    {
                        CreateBitField (PSBR, Zero, PDSW)
                        CreateBitField (PSBR, One, PEXM)
                        CreateBitField (PSBR, 0x02, PTHR)
                        CreateBitField (PSBR, 0x03, PFPS)
                        CreateBitField (PSBR, 0x04, PSPS)
                        CreateBitField (PSBR, 0x05, PDCC)
                        CreateBitField (PSBR, 0x06, PXPS)
                        CreateWordField (ATIB, Zero, SSZE)
                        CreateDWordField (ATIB, 0x02, PSBI)
                        CreateByteField (ATIB, 0x06, EXPM)
                        CreateByteField (ATIB, 0x07, THRM)
                        CreateByteField (ATIB, 0x08, THID)
                        CreateByteField (ATIB, 0x09, FPWR)
                        CreateByteField (ATIB, 0x0A, FPID)
                        CreateByteField (ATIB, 0x0B, SPWR)
                        Store (0x0C, SSZE)
                        Store (PSBR, PSBI)
                        If (PDSW)
                        {
                            Store (Zero, PDSW)
                        }

                        If (PEXM)
                        {
                            Store (SEXM, EXPM)
                            Store (Zero, SEXM)
                            Store (Zero, PEXM)
                        }

                        If (PTHR)
                        {
                            Store (STHG, THRM)
                            Store (STHI, THID)
                            Store (Zero, STHG)
                            Store (Zero, STHI)
                            Store (Zero, PTHR)
                        }

                        If (PFPS)
                        {
                            Store (SFPG, FPWR)
                            Store (SFPI, FPWR)
                            Store (Zero, SFPG)
                            Store (Zero, SFPI)
                            Store (Zero, PFPS)
                        }

                        If (PSPS)
                        {
                            Store (SSPS, SPWR)
                            Store (Zero, PSPS)
                        }

                        If (PXPS)
                        {
                            Store (Zero, PXPS)
                        }

                        Return (ATIB)
                    }

                    Method (AF03, 2, NotSerialized)
                    {
                        CreateWordField (ATIB, Zero, SSZE)
                        CreateWordField (ATIB, 0x02, SSDP)
                        CreateWordField (ATIB, 0x04, SCDP)
                        Store (Arg0, SSDP)
                        Store (Arg1, SCDP)
                        Name (NXTD, 0x06)
                        Name (CIDX, 0x06)
                        Store (SSDP, Local1)
                        And (Local1, 0x8B, Local1)
                        Store (SCDP, Local2)
                        If (CondRefOf (^^^^LID._LID, Local4))
                        {
                            And (Local2, 0xFFFFFFFE, Local2)
                            Or (Local2, ^^^^LID._LID (), Local2)
                        }
                        Else
                        {
                            Or (Local2, One, Local2)
                        }

                        Store (Local2, P80H)
                        Store (Zero, Local0)
                        While (LLess (Local0, SizeOf (SACT)))
                        {
                            Store (DerefOf (Index (SACT, Local0)), Local3)
                            If (LEqual (Local3, Local1))
                            {
                                Store (Local0, CIDX)
                                Store (SizeOf (SACT), Local0)
                            }
                            Else
                            {
                                Increment (Local0)
                            }
                        }

                        Store (CIDX, Local0)
                        While (LLess (Local0, SizeOf (SACT)))
                        {
                            Increment (Local0)
                            If (LEqual (Local0, SizeOf (SACT)))
                            {
                                Store (Zero, Local0)
                            }

                            Store (DerefOf (Index (SACT, Local0)), Local3)
                            If (LEqual (And (Local3, Local2), Local3))
                            {
                                Store (Local0, NXTD)
                                Store (SizeOf (SACT), Local0)
                            }
                        }

                        If (LEqual (NXTD, SizeOf (SACT)))
                        {
                            Store (Zero, SSDP)
                        }
                        Else
                        {
                            Store (NXTD, Local0)
                            Store (DerefOf (Index (SACT, Local0)), Local3)
                            And (SSDP, 0xFFFFFFF4, SSDP)
                            Or (SSDP, Local3, SSDP)
                        }

                        Store (0x04, SSZE)
                        Store (SSDP, P80H)
                        Return (ATIB)
                    }

                    Method (AFN0, 0, Serialized)
                    {
                        If (And (MSKN, One))
                        {
                            CreateBitField (PSBR, Zero, PDSW)
                            Store (One, PDSW)
                            Notify (VGA, 0x81)
                        }
                    }

                    Method (AFN3, 2, Serialized)
                    {
                        If (And (MSKN, 0x08))
                        {
                            Store (Arg0, Local0)
                            Store (Local0, SFPI)
                            Store (Arg1, Local0)
                            Store (And (Local0, 0x03, Local0), SFPG)
                            CreateBitField (PSBR, 0x03, PFPS)
                            Store (One, PFPS)
                            Notify (VGA, 0x81)
                        }
                    }

                    Method (AFN4, 1, Serialized)
                    {
                        If (And (MSKN, 0x10))
                        {
                            Store (Arg0, Local0)
                            Store (SSPS, Local1)
                            Store (Local0, SSPS)
                            If (LEqual (Local0, Local1)) {}
                            Else
                            {
                                CreateBitField (PSBR, 0x04, PSPS)
                                Store (One, PSPS)
                                Notify (VGA, 0x81)
                            }
                        }
                    }

                    Method (AFN5, 0, Serialized)
                    {
                        If (And (MSKN, 0x20))
                        {
                            CreateBitField (PSBR, 0x05, PDCC)
                            Store (One, PDCC)
                            Notify (VGA, 0x81)
                        }
                    }

                    Method (AFN6, 0, Serialized)
                    {
                        If (And (MSKN, 0x40))
                        {
                            CreateBitField (PSBR, 0x06, PXPS)
                            Store (One, PXPS)
                            Notify (VGA, 0x81)
                        }
                    }

                    Method (AF15, 0, NotSerialized)
                    {
                        Store (0xFF, P80H)
                        CreateWordField (ATIB, 0x02, DSZE)
                        Store (0x08, DSZE)
                        Acquire (^^^LPC0.PSMX, 0xFFFF)
                        Store (0x8D, BCMD)
                        Store (0x0F, DID)
                        Store (ATIB, INFO)
                        BSMI (Zero)
                        Store (INFO, ATIB)
                        Release (^^^LPC0.PSMX)
                        Return (ATIB)
                    }

                    Name (AT00, Buffer (0xFF) {})
                    Name (AT01, Buffer (0x03) {})
                    Method (ATCS, 2, Serialized)
                    {
                        If (LEqual (Arg0, Zero))
                        {
                            ATC0 ()
                        }

                        If (LEqual (Arg0, One))
                        {
                            ATC1 ()
                        }

                        If (LEqual (Arg0, 0x02))
                        {
                            ATC2 (Arg1)
                        }

                        If (LEqual (Arg0, 0x03))
                        {
                            ATC3 ()
                        }

                        If (LEqual (Arg0, 0x04))
                        {
                            ATC4 (Arg1)
                        }

                        Return (AT00)
                    }

                    Method (ATC0, 0, NotSerialized)
                    {
                        CreateWordField (AT00, Zero, SZZE)
                        CreateWordField (AT00, 0x02, INTF)
                        CreateDWordField (AT00, 0x04, SUPP)
                        Store (0x08, SZZE)
                        Store (One, INTF)
                        Store (0x0F, SUPP)
                    }

                    Method (ATC1, 0, Serialized)
                    {
                        CreateWordField (AT00, Zero, SZZE)
                        CreateDWordField (AT00, 0x02, VFMK)
                        CreateDWordField (AT00, 0x06, FLAG)
                        CreateField (AT00, 0x30, One, DOCK)
                        Store (0x0A, SZZE)
                        Store (One, VFMK)
                        Store (Zero, FLAG)
                        Store (One, DOCK)
                    }

                    Method (ATC2, 1, Serialized)
                    {
                        CreateField (Arg0, 0x10, 0x03, FUCC)
                        CreateField (Arg0, 0x13, 0x06, DEVV)
                        CreateByteField (Arg0, 0x03, BUSS)
                        CreateDWordField (Arg0, 0x04, VFMK)
                        CreateDWordField (Arg0, 0x06, FLAG)
                        CreateField (Arg0, 0x30, One, ADVC)
                        CreateField (Arg0, 0x31, One, WFCM)
                        CreateByteField (Arg0, 0x08, RQST)
                        CreateByteField (Arg0, 0x09, PFRQ)
                        CreateWordField (AT00, Zero, SZZE)
                        CreateByteField (AT00, 0x02, RETV)
                        Store (0x03, SZZE)
                        Store (One, RETV)
                        Store (ALIB (0x02, Arg0), AT00)
                    }

                    Method (ATC3, 0, Serialized)
                    {
                        CreateWordField (AT00, Zero, SZZE)
                        CreateByteField (AT00, 0x02, RETV)
                        CreateWordField (AT01, Zero, SZZB)
                        CreateByteField (AT01, 0x02, PSPP)
                        Store (0x03, SZZE)
                        Store (One, RETV)
                        Store (0x03, SZZB)
                        Store (One, PSPP)
                        Store (ALIB (0x03, AT01), AT00)
                    }

                    Method (ATC4, 1, Serialized)
                    {
                        CreateField (Arg0, 0x10, 0x03, FUCC)
                        CreateField (Arg0, 0x13, 0x06, DEVV)
                        CreateByteField (Arg0, 0x03, BUSS)
                        CreateByteField (Arg0, 0x04, NULN)
                        CreateWordField (AT00, Zero, SZZE)
                        CreateByteField (AT00, 0x02, NULM)
                        Store (0x03, SZZE)
                        Store (One, NULM)
                        Store (ALIB (0x04, Arg0), AT00)
                    }
                }

                Device (HDAU)
                {
                    Name (_ADR, One)  // _ADR: Address
                    OperationRegion (PCFG, PCI_Config, Zero, 0x50)
                    Field (PCFG, DWordAcc, NoLock, Preserve)
                    {
                        DVID,   32, 
                        Offset (0x2C), 
                        SVID,   32, 
                        Offset (0x4C), 
                        SMID,   32
                    }
                }
            }

            Device (PB4)
            {
                Name (_ADR, 0x00040000)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    If (LEqual (WKPM, One))
                    {
                        Return (GPRW (0x08, 0x05))
                    }
                    Else
                    {
                        Return (GPRW (0x08, Zero))
                    }
                }

                Name (PR03, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        LNKA, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        LNKB, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        LNKC, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        LNKD, 
                        Zero
                    }
                })
                Name (AR03, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        0x10
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        Zero, 
                        0x11
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        Zero, 
                        0x12
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        Zero, 
                        0x13
                    }
                })
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        Return (AR03)
                    }

                    Return (PR03)
                }

                OperationRegion (XPEX, SystemMemory, 0xF8020100, 0x0100)
                Field (XPEX, DWordAcc, NoLock, Preserve)
                {
                    Offset (0x28), 
                    VC0S,   32
                }

                OperationRegion (XPCB, PCI_Config, 0x58, 0x24)
                Field (XPCB, AnyAcc, NoLock, Preserve)
                {
                    Offset (0x10), 
                    LKCN,   16, 
                    LKST,   16, 
                    Offset (0x1A), 
                        ,   3, 
                    PDC2,   1, 
                        ,   2, 
                    PDS2,   1, 
                    Offset (0x1B), 
                    HPCS,   1, 
                    Offset (0x20), 
                    Offset (0x22), 
                    PMES,   1
                }

                OperationRegion (XPRI, PCI_Config, 0xE0, 0x08)
                Field (XPRI, ByteAcc, NoLock, Preserve)
                {
                    XPIR,   32, 
                    XPID,   32
                }

                OperationRegion (PCFG, PCI_Config, Zero, 0x20)
                Field (PCFG, DWordAcc, NoLock, Preserve)
                {
                    DVID,   32, 
                    Offset (0x18), 
                    SBUS,   32
                }

                Method (XPDL, 0, NotSerialized)
                {
                    If (And (VC0S, 0x00020000))
                    {
                        Return (Ones)
                    }
                    Else
                    {
                        Return (Zero)
                    }
                }

                Mutex (XPPM, 0x00)
                Method (XPRD, 1, NotSerialized)
                {
                    Acquire (XPPM, 0xFFFF)
                    Store (Arg0, XPIR)
                    Store (XPID, Local0)
                    Store (Zero, XPIR)
                    Release (XPPM)
                    Return (Local0)
                }

                Method (XPWR, 2, NotSerialized)
                {
                    Acquire (XPPM, 0xFFFF)
                    Store (Arg0, XPIR)
                    Store (Arg1, XPID)
                    Store (Zero, XPIR)
                    Release (XPPM)
                }

                Method (XPRT, 0, NotSerialized)
                {
                    Store (XPRD (0xA2), Local0)
                    And (Local0, 0xFFFFFFF8, Local0)
                    ShiftRight (Local0, 0x04, Local1)
                    And (Local1, 0x07, Local1)
                    Or (Local0, Local1, Local0)
                    Or (Local0, 0x0100, Local0)
                    XPWR (0xA2, Local0)
                }

                Method (XPR2, 0, NotSerialized)
                {
                    Store (LKCN, Local0)
                    And (Local0, 0xFFFFFFDF, Local0)
                    Store (Local0, LKCN)
                    Or (Local0, 0x20, Local0)
                    Store (Local0, LKCN)
                    Store (0x64, Local1)
                    Store (One, Local2)
                    While (LAnd (Local1, Local2))
                    {
                        Sleep (One)
                        Store (LKST, Local3)
                        If (And (Local3, 0x0800))
                        {
                            Decrement (Local1)
                        }
                        Else
                        {
                            Store (Zero, Local2)
                        }
                    }

                    And (Local0, 0xFFFFFFDF, Local0)
                    Store (Local0, LKCN)
                    If (LNot (Local2))
                    {
                        Return (Ones)
                    }
                    Else
                    {
                        Return (Zero)
                    }
                }

                Method (XPPB, 0, NotSerialized)
                {
                    Store (_ADR, Local0)
                    Store (ShiftRight (Local0, 0x10), Local1)
                    Store (ShiftLeft (Local1, 0x03), Local1)
                    Store (And (Local0, 0x0F), Local2)
                    Store (Or (Local1, Local2), Local3)
                    Return (Local3)
                }

                Method (XPPR, 1, NotSerialized)
                {
                    Name (HPOK, Zero)
                    Store (Zero, HPOK)
                    Store (ShiftLeft (XPPB (), 0x03), Local0)
                    If (Arg0)
                    {
                        XPLL (Local0, One)
                        XPLP (Local0, One)
                        Sleep (0xC8)
                        XPTR (Local0, One)
                        Store (0x0F, Local5)
                        While (LAnd (LNot (HPOK), LGreater (Local5, Zero)))
                        {
                            Store (One, PDC2)
                            Store (0x28, Local1)
                            While (LAnd (LNot (HPOK), LGreater (Local1, Zero)))
                            {
                                Store (XPRD (0xA5), Local2)
                                If (LEqual (And (Local2, 0xFF), 0x3F))
                                {
                                    Store (One, Local1)
                                }

                                If (LEqual (And (ShiftRight (Local2, 0x08), 0xFF), 0x3F))
                                {
                                    Store (One, Local1)
                                }

                                If (LEqual (And (ShiftRight (Local2, 0x08), 0xFF), 0x3F))
                                {
                                    Store (One, Local1)
                                }

                                If (LEqual (And (ShiftRight (Local2, 0x08), 0xFF), 0x3F))
                                {
                                    Store (One, Local1)
                                }

                                If (LGreaterEqual (And (Local2, 0xFF), 0x04))
                                {
                                    Store (One, HPOK)
                                }

                                Decrement (Local1)
                            }

                            If (HPOK)
                            {
                                Store (And (XPRD (0xA5), 0xFF), Local2)
                                Store (And (ShiftRight (XPRD (0xA2), 0x04), 0x07), Local3)
                                If (LAnd (LEqual (Local2, 0x06), LAnd (LGreater (Local3, One), LLess (
                                    Local3, 0x05))))
                                {
                                    Store (Zero, HPOK)
                                }
                            }

                            If (HPOK)
                            {
                                Store (0x07D0, Local1)
                                Store (Zero, HPOK)
                                While (LAnd (LNot (HPOK), Local1))
                                {
                                    Store (And (XPRD (0xA5), 0xFF), Local2)
                                    If (LEqual (Local2, 0x07))
                                    {
                                        Store (One, Local1)
                                        Store (XPDL (), Local4)
                                        If (Local4)
                                        {
                                            XPRT ()
                                            Decrement (Local5)
                                        }
                                    }

                                    If (LEqual (Local2, 0x10))
                                    {
                                        Store (One, HPOK)
                                    }

                                    Sleep (One)
                                    Decrement (Local1)
                                }
                            }
                        }
                    }

                    If (HPOK)
                    {
                        XPTR (Local0, Zero)
                        XPLP (Local0, Zero)
                        XPLL (Local0, Zero)
                    }

                    Return (Ones)
                }

                Device (XPDV)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    OperationRegion (PCFG, PCI_Config, Zero, 0xFF)
                    Field (PCFG, DWordAcc, NoLock, Preserve)
                    {
                        DVID,   32, 
                        PCMS,   32, 
                        Offset (0x45), 
                        WOL,    1
                    }

                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x08, 
                        0x05
                    })
                    Method (_PSW, 1, NotSerialized)  // _PSW: Power State Wake
                    {
                        Store (Arg0, ^^^LPC0.EC.WOL)
                    }
                }
            }

            Device (PB5)
            {
                Name (_ADR, 0x00050000)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    If (LEqual (WKPM, One))
                    {
                        Return (GPRW (0x08, 0x05))
                    }
                    Else
                    {
                        Return (GPRW (0x08, Zero))
                    }
                }

                Name (PR04, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        LNKB, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        LNKC, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        LNKD, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        LNKA, 
                        Zero
                    }
                })
                Name (AR04, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        0x11
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        Zero, 
                        0x12
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        Zero, 
                        0x13
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        Zero, 
                        0x10
                    }
                })
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        Return (AR04)
                    }

                    Return (PR04)
                }

                OperationRegion (XPEX, SystemMemory, 0xF8028100, 0x0100)
                Field (XPEX, DWordAcc, NoLock, Preserve)
                {
                    Offset (0x28), 
                    VC0S,   32
                }

                OperationRegion (PCFG, PCI_Config, Zero, 0x20)
                Field (PCFG, DWordAcc, NoLock, Preserve)
                {
                    DVID,   32, 
                    PCMS,   32, 
                    Offset (0x18), 
                    SBUS,   32
                }

                Device (XPDV)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    OperationRegion (PCFG, PCI_Config, Zero, 0x30)
                    Field (PCFG, AnyAcc, NoLock, Preserve)
                    {
                        WVIL,   8, 
                        WVIH,   8, 
                        WDIL,   8, 
                        WDIH,   8, 
                        Offset (0x2C), 
                        WSVL,   8, 
                        WSVH,   8, 
                        WSSL,   8, 
                        WSSH,   8
                    }
                }
            }

            Device (PB6)
            {
                Name (_ADR, 0x00060000)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    If (LEqual (WKPM, One))
                    {
                        Return (GPRW (0x08, 0x05))
                    }
                    Else
                    {
                        Return (GPRW (0x08, Zero))
                    }
                }

                Name (PR05, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        LNKC, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        LNKD, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        LNKA, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        LNKB, 
                        Zero
                    }
                })
                Name (AR05, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        0x12
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        Zero, 
                        0x13
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        Zero, 
                        0x10
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        Zero, 
                        0x11
                    }
                })
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        Return (AR05)
                    }

                    Return (PR05)
                }

                OperationRegion (XPEX, SystemMemory, 0xF8030100, 0x0100)
                Field (XPEX, DWordAcc, NoLock, Preserve)
                {
                    Offset (0x28), 
                    VC0S,   32
                }

                OperationRegion (XPCB, PCI_Config, 0x58, 0x24)
                Field (XPCB, AnyAcc, NoLock, Preserve)
                {
                    Offset (0x10), 
                    LKCN,   16, 
                    LKST,   16, 
                    Offset (0x1A), 
                        ,   3, 
                    PDC2,   1, 
                        ,   2, 
                    PDS2,   1, 
                    Offset (0x1B), 
                    HPCS,   1, 
                    Offset (0x20), 
                    Offset (0x22), 
                    PMES,   1
                }

                OperationRegion (XPRI, PCI_Config, 0xE0, 0x08)
                Field (XPRI, ByteAcc, NoLock, Preserve)
                {
                    XPIR,   32, 
                    XPID,   32
                }

                OperationRegion (PCFG, PCI_Config, Zero, 0x20)
                Field (PCFG, DWordAcc, NoLock, Preserve)
                {
                    DVID,   32, 
                    Offset (0x18), 
                    SBUS,   32
                }

                Method (XPDL, 0, NotSerialized)
                {
                    If (And (VC0S, 0x00020000))
                    {
                        Return (Ones)
                    }
                    Else
                    {
                        Return (Zero)
                    }
                }

                Mutex (XPPM, 0x00)
                Method (XPRD, 1, NotSerialized)
                {
                    Acquire (XPPM, 0xFFFF)
                    Store (Arg0, XPIR)
                    Store (XPID, Local0)
                    Store (Zero, XPIR)
                    Release (XPPM)
                    Return (Local0)
                }

                Method (XPWR, 2, NotSerialized)
                {
                    Acquire (XPPM, 0xFFFF)
                    Store (Arg0, XPIR)
                    Store (Arg1, XPID)
                    Store (Zero, XPIR)
                    Release (XPPM)
                }

                Method (XPRT, 0, NotSerialized)
                {
                    Store (XPRD (0xA2), Local0)
                    And (Local0, 0xFFFFFFF8, Local0)
                    ShiftRight (Local0, 0x04, Local1)
                    And (Local1, 0x07, Local1)
                    Or (Local0, Local1, Local0)
                    Or (Local0, 0x0100, Local0)
                    XPWR (0xA2, Local0)
                }

                Method (XPR2, 0, NotSerialized)
                {
                    Store (LKCN, Local0)
                    And (Local0, 0xFFFFFFDF, Local0)
                    Store (Local0, LKCN)
                    Or (Local0, 0x20, Local0)
                    Store (Local0, LKCN)
                    Store (0x64, Local1)
                    Store (One, Local2)
                    While (LAnd (Local1, Local2))
                    {
                        Sleep (One)
                        Store (LKST, Local3)
                        If (And (Local3, 0x0800))
                        {
                            Decrement (Local1)
                        }
                        Else
                        {
                            Store (Zero, Local2)
                        }
                    }

                    And (Local0, 0xFFFFFFDF, Local0)
                    Store (Local0, LKCN)
                    If (LNot (Local2))
                    {
                        Return (Ones)
                    }
                    Else
                    {
                        Return (Zero)
                    }
                }

                Method (XPPB, 0, NotSerialized)
                {
                    Store (_ADR, Local0)
                    Store (ShiftRight (Local0, 0x10), Local1)
                    Store (ShiftLeft (Local1, 0x03), Local1)
                    Store (And (Local0, 0x0F), Local2)
                    Store (Or (Local1, Local2), Local3)
                    Return (Local3)
                }

                Method (XPPR, 1, NotSerialized)
                {
                    Name (HPOK, Zero)
                    Store (Zero, HPOK)
                    Store (ShiftLeft (XPPB (), 0x03), Local0)
                    If (Arg0)
                    {
                        XPLL (Local0, One)
                        XPLP (Local0, One)
                        Sleep (0xC8)
                        XPTR (Local0, One)
                        Store (0x0F, Local5)
                        While (LAnd (LNot (HPOK), LGreater (Local5, Zero)))
                        {
                            Store (One, PDC2)
                            Store (0x28, Local1)
                            While (LAnd (LNot (HPOK), LGreater (Local1, Zero)))
                            {
                                Store (XPRD (0xA5), Local2)
                                If (LEqual (And (Local2, 0xFF), 0x3F))
                                {
                                    Store (One, Local1)
                                }

                                If (LEqual (And (ShiftRight (Local2, 0x08), 0xFF), 0x3F))
                                {
                                    Store (One, Local1)
                                }

                                If (LEqual (And (ShiftRight (Local2, 0x08), 0xFF), 0x3F))
                                {
                                    Store (One, Local1)
                                }

                                If (LEqual (And (ShiftRight (Local2, 0x08), 0xFF), 0x3F))
                                {
                                    Store (One, Local1)
                                }

                                If (LGreaterEqual (And (Local2, 0xFF), 0x04))
                                {
                                    Store (One, HPOK)
                                }

                                Decrement (Local1)
                            }

                            If (HPOK)
                            {
                                Store (And (XPRD (0xA5), 0xFF), Local2)
                                Store (And (ShiftRight (XPRD (0xA2), 0x04), 0x07), Local3)
                                If (LAnd (LEqual (Local2, 0x06), LAnd (LGreater (Local3, One), LLess (
                                    Local3, 0x05))))
                                {
                                    Store (Zero, HPOK)
                                }
                            }

                            If (HPOK)
                            {
                                Store (0x07D0, Local1)
                                Store (Zero, HPOK)
                                While (LAnd (LNot (HPOK), Local1))
                                {
                                    Store (And (XPRD (0xA5), 0xFF), Local2)
                                    If (LEqual (Local2, 0x07))
                                    {
                                        Store (One, Local1)
                                        Store (XPDL (), Local4)
                                        If (Local4)
                                        {
                                            XPRT ()
                                            Decrement (Local5)
                                        }
                                    }

                                    If (LEqual (Local2, 0x10))
                                    {
                                        Store (One, HPOK)
                                    }

                                    Sleep (One)
                                    Decrement (Local1)
                                }
                            }
                        }
                    }

                    If (HPOK)
                    {
                        XPTR (Local0, Zero)
                        XPLP (Local0, Zero)
                        XPLL (Local0, Zero)
                    }

                    Return (Ones)
                }

                Device (XPDV)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    OperationRegion (PCFG, PCI_Config, Zero, 0x08)
                    Field (PCFG, DWordAcc, NoLock, Preserve)
                    {
                        DVID,   32, 
                        PCMS,   32
                    }
                }
            }

            Device (PB7)
            {
                Name (_ADR, 0x00070000)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    If (LEqual (WKPM, One))
                    {
                        Return (GPRW (0x08, 0x05))
                    }
                    Else
                    {
                        Return (GPRW (0x08, Zero))
                    }
                }

                Name (PR06, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        LNKD, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        LNKA, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        LNKB, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        LNKC, 
                        Zero
                    }
                })
                Name (AR06, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        0x13
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        Zero, 
                        0x10
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        Zero, 
                        0x11
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        Zero, 
                        0x12
                    }
                })
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        Return (AR06)
                    }

                    Return (PR06)
                }

                OperationRegion (XPEX, SystemMemory, 0xF8038100, 0x0100)
                Field (XPEX, DWordAcc, NoLock, Preserve)
                {
                    Offset (0x28), 
                    VC0S,   32
                }

                OperationRegion (XPCB, PCI_Config, 0x58, 0x24)
                Field (XPCB, AnyAcc, NoLock, Preserve)
                {
                    Offset (0x10), 
                    LKCN,   16, 
                    LKST,   16, 
                    Offset (0x1A), 
                        ,   3, 
                    PDC2,   1, 
                        ,   2, 
                    PDS2,   1, 
                    Offset (0x1B), 
                    HPCS,   1, 
                    Offset (0x20), 
                    Offset (0x22), 
                    PMES,   1
                }

                OperationRegion (XPRI, PCI_Config, 0xE0, 0x08)
                Field (XPRI, ByteAcc, NoLock, Preserve)
                {
                    XPIR,   32, 
                    XPID,   32
                }

                OperationRegion (PCFG, PCI_Config, Zero, 0x20)
                Field (PCFG, DWordAcc, NoLock, Preserve)
                {
                    DVID,   32, 
                    Offset (0x18), 
                    SBUS,   32
                }

                Method (XPDL, 0, NotSerialized)
                {
                    If (And (VC0S, 0x00020000))
                    {
                        Return (Ones)
                    }
                    Else
                    {
                        Return (Zero)
                    }
                }

                Mutex (XPPM, 0x00)
                Method (XPRD, 1, NotSerialized)
                {
                    Acquire (XPPM, 0xFFFF)
                    Store (Arg0, XPIR)
                    Store (XPID, Local0)
                    Store (Zero, XPIR)
                    Release (XPPM)
                    Return (Local0)
                }

                Method (XPWR, 2, NotSerialized)
                {
                    Acquire (XPPM, 0xFFFF)
                    Store (Arg0, XPIR)
                    Store (Arg1, XPID)
                    Store (Zero, XPIR)
                    Release (XPPM)
                }

                Method (XPRT, 0, NotSerialized)
                {
                    Store (XPRD (0xA2), Local0)
                    And (Local0, 0xFFFFFFF8, Local0)
                    ShiftRight (Local0, 0x04, Local1)
                    And (Local1, 0x07, Local1)
                    Or (Local0, Local1, Local0)
                    Or (Local0, 0x0100, Local0)
                    XPWR (0xA2, Local0)
                }

                Method (XPR2, 0, NotSerialized)
                {
                    Store (LKCN, Local0)
                    And (Local0, 0xFFFFFFDF, Local0)
                    Store (Local0, LKCN)
                    Or (Local0, 0x20, Local0)
                    Store (Local0, LKCN)
                    Store (0x64, Local1)
                    Store (One, Local2)
                    While (LAnd (Local1, Local2))
                    {
                        Sleep (One)
                        Store (LKST, Local3)
                        If (And (Local3, 0x0800))
                        {
                            Decrement (Local1)
                        }
                        Else
                        {
                            Store (Zero, Local2)
                        }
                    }

                    And (Local0, 0xFFFFFFDF, Local0)
                    Store (Local0, LKCN)
                    If (LNot (Local2))
                    {
                        Return (Ones)
                    }
                    Else
                    {
                        Return (Zero)
                    }
                }

                Method (XPPB, 0, NotSerialized)
                {
                    Store (_ADR, Local0)
                    Store (ShiftRight (Local0, 0x10), Local1)
                    Store (ShiftLeft (Local1, 0x03), Local1)
                    Store (And (Local0, 0x0F), Local2)
                    Store (Or (Local1, Local2), Local3)
                    Return (Local3)
                }

                Method (XPPR, 1, NotSerialized)
                {
                    Name (HPOK, Zero)
                    Store (Zero, HPOK)
                    Store (ShiftLeft (XPPB (), 0x03), Local0)
                    If (Arg0)
                    {
                        XPLL (Local0, One)
                        XPLP (Local0, One)
                        Sleep (0xC8)
                        XPTR (Local0, One)
                        Store (0x0F, Local5)
                        While (LAnd (LNot (HPOK), LGreater (Local5, Zero)))
                        {
                            Store (One, PDC2)
                            Store (0x28, Local1)
                            While (LAnd (LNot (HPOK), LGreater (Local1, Zero)))
                            {
                                Store (XPRD (0xA5), Local2)
                                If (LEqual (And (Local2, 0xFF), 0x3F))
                                {
                                    Store (One, Local1)
                                }

                                If (LEqual (And (ShiftRight (Local2, 0x08), 0xFF), 0x3F))
                                {
                                    Store (One, Local1)
                                }

                                If (LEqual (And (ShiftRight (Local2, 0x08), 0xFF), 0x3F))
                                {
                                    Store (One, Local1)
                                }

                                If (LEqual (And (ShiftRight (Local2, 0x08), 0xFF), 0x3F))
                                {
                                    Store (One, Local1)
                                }

                                If (LGreaterEqual (And (Local2, 0xFF), 0x04))
                                {
                                    Store (One, HPOK)
                                }

                                Decrement (Local1)
                            }

                            If (HPOK)
                            {
                                Store (And (XPRD (0xA5), 0xFF), Local2)
                                Store (And (ShiftRight (XPRD (0xA2), 0x04), 0x07), Local3)
                                If (LAnd (LEqual (Local2, 0x06), LAnd (LGreater (Local3, One), LLess (
                                    Local3, 0x05))))
                                {
                                    Store (Zero, HPOK)
                                }
                            }

                            If (HPOK)
                            {
                                Store (0x07D0, Local1)
                                Store (Zero, HPOK)
                                While (LAnd (LNot (HPOK), Local1))
                                {
                                    Store (And (XPRD (0xA5), 0xFF), Local2)
                                    If (LEqual (Local2, 0x07))
                                    {
                                        Store (One, Local1)
                                        Store (XPDL (), Local4)
                                        If (Local4)
                                        {
                                            XPRT ()
                                            Decrement (Local5)
                                        }
                                    }

                                    If (LEqual (Local2, 0x10))
                                    {
                                        Store (One, HPOK)
                                    }

                                    Sleep (One)
                                    Decrement (Local1)
                                }
                            }
                        }
                    }

                    If (HPOK)
                    {
                        XPTR (Local0, Zero)
                        XPLP (Local0, Zero)
                        XPLL (Local0, Zero)
                    }

                    Return (Ones)
                }

                Device (XPDV)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    OperationRegion (PCFG, PCI_Config, Zero, 0xFF)
                    Field (PCFG, DWordAcc, NoLock, Preserve)
                    {
                        DVID,   32, 
                        PCMS,   32, 
                        Offset (0xDC), 
                        DISF,   32
                    }
                }
            }

            Device (SPB0)
            {
                Name (_ADR, 0x00150000)  // _ADR: Address
                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x08, 
                    0x04
                })
                Name (PR0A, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        LNKC, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        LNKD, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        LNKA, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        LNKB, 
                        Zero
                    }
                })
                Name (AR0A, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        0x12
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        Zero, 
                        0x13
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        Zero, 
                        0x10
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        Zero, 
                        0x11
                    }
                })
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        Return (AR0A)
                    }

                    Return (PR0A)
                }

                OperationRegion (PCFG, PCI_Config, Zero, 0x20)
                Field (PCFG, DWordAcc, NoLock, Preserve)
                {
                    DVID,   32, 
                    PCMS,   32, 
                    Offset (0x18), 
                    SBUS,   32
                }

                Device (XPDV)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    OperationRegion (PCFG, PCI_Config, Zero, 0x08)
                    Field (PCFG, DWordAcc, NoLock, Preserve)
                    {
                        DVID,   32, 
                        PCMS,   32
                    }
                }
            }

            Device (SPB1)
            {
                Name (_ADR, 0x00150001)  // _ADR: Address
                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x08, 
                    0x04
                })
                Name (PR0B, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        LNKD, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        LNKA, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        LNKB, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        LNKC, 
                        Zero
                    }
                })
                Name (AR0B, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        0x13
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        Zero, 
                        0x10
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        Zero, 
                        0x11
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        Zero, 
                        0x12
                    }
                })
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        Return (AR0B)
                    }

                    Return (PR0B)
                }

                OperationRegion (PCFG, PCI_Config, Zero, 0x20)
                Field (PCFG, DWordAcc, NoLock, Preserve)
                {
                    DVID,   32, 
                    PCMS,   32, 
                    Offset (0x18), 
                    SBUS,   32
                }

                Device (XPDV)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    OperationRegion (PCFG, PCI_Config, Zero, 0x08)
                    Field (PCFG, DWordAcc, NoLock, Preserve)
                    {
                        DVID,   32, 
                        PCMS,   32
                    }
                }
            }

            Device (SPB2)
            {
                Name (_ADR, 0x00150002)  // _ADR: Address
                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x08, 
                    0x04
                })
                Name (PR0C, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        LNKA, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        LNKB, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        LNKC, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        LNKD, 
                        Zero
                    }
                })
                Name (AR0C, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        0x10
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        Zero, 
                        0x11
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        Zero, 
                        0x12
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        Zero, 
                        0x13
                    }
                })
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        Return (AR0C)
                    }

                    Return (PR0C)
                }

                OperationRegion (PCFG, PCI_Config, Zero, 0x20)
                Field (PCFG, DWordAcc, NoLock, Preserve)
                {
                    DVID,   32, 
                    PCMS,   32, 
                    Offset (0x18), 
                    SBUS,   32
                }

                Device (XPDV)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    OperationRegion (PCFG, PCI_Config, Zero, 0x08)
                    Field (PCFG, DWordAcc, NoLock, Preserve)
                    {
                        DVID,   32, 
                        PCMS,   32
                    }
                }
            }

            Device (SPB3)
            {
                Name (_ADR, 0x00150003)  // _ADR: Address
                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x08, 
                    0x04
                })
                Name (PR0D, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        LNKB, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        LNKC, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        LNKD, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        LNKA, 
                        Zero
                    }
                })
                Name (AR0D, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        0x11
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        Zero, 
                        0x12
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        Zero, 
                        0x13
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        Zero, 
                        0x10
                    }
                })
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        Return (AR0D)
                    }

                    Return (PR0D)
                }

                OperationRegion (PCFG, PCI_Config, Zero, 0x20)
                Field (PCFG, DWordAcc, NoLock, Preserve)
                {
                    DVID,   32, 
                    PCMS,   32, 
                    Offset (0x18), 
                    SBUS,   32
                }

                Device (XPDV)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    OperationRegion (PCFG, PCI_Config, Zero, 0x08)
                    Field (PCFG, DWordAcc, NoLock, Preserve)
                    {
                        DVID,   32, 
                        PCMS,   32
                    }
                }
            }

            Device (HPET)
            {
                Name (_HID, EisaId ("PNP0103"))  // _HID: Hardware ID
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If (LEqual (And (HPAD, 0x03), 0x03))
                    {
                        If (LGreaterEqual (OSTB, 0x40))
                        {
                            Return (0x0F)
                        }

                        Store (And (HPAD, 0xFFFFFFE0), HPAD)
                        Return (One)
                    }

                    Return (One)
                }

                Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                {
                    Name (BUF0, ResourceTemplate ()
                    {
                        IRQNoFlags ()
                            {0}
                        IRQNoFlags ()
                            {8}
                        Memory32Fixed (ReadOnly,
                            0xFED00000,         // Address Base
                            0x00000400,         // Address Length
                            _Y03)
                    })
                    CreateDWordField (BUF0, \_SB.PCI0.HPET._CRS._Y03._BAS, HPEB)  // _BAS: Base Address
                    Store (HPAD, Local0)
                    And (Local0, 0xFFFFFC00, HPEB)
                    Return (BUF0)
                }
            }

            Device (AZAL)
            {
                Name (_ADR, 0x00140002)  // _ADR: Address
                OperationRegion (PCI, PCI_Config, Zero, 0x0100)
                Field (PCI, AnyAcc, NoLock, Preserve)
                {
                    Offset (0x42), 
                    DNSP,   1, 
                    DNSO,   1, 
                    ENSR,   1
                }
            }

            Device (GEC)
            {
                Name (_ADR, 0x00140006)  // _ADR: Address
                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x1A, 
                    0x04
                })
            }

            Device (OHC1)
            {
                Name (_ADR, 0x00120000)  // _ADR: Address
                OperationRegion (O1CS, PCI_Config, 0xC4, 0x04)
                Field (O1CS, DWordAcc, NoLock, Preserve)
                {
                    O1EN,   2
                }

                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x18, 0x03))
                }

                Device (XHUB)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Device (PRT1)
                    {
                        Name (_ADR, One)  // _ADR: Address
                        Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                        {
                            0xFF, 
                            Zero, 
                            Zero, 
                            Zero
                        })
                        Name (_PLD, Package (0x1)  // _PLD: Physical Location of Device
                        {
                            Buffer (0x10) {
                            /* 0000 */   0x81, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                            /* 0008 */   0xA1, 0x10, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
                            /*           Revision : 01     */
                            /*        IgnoreColor : 01     */
                            /*              Color : 000000 */
                            /*              Width : 0000   */
                            /*             Height : 0000   */
                            /*        UserVisible : 01     */
                            /*               Dock : 00     */
                            /*                Lid : 00     */
                            /*              Panel : 04     */
                            /*   VerticalPosition : 02     */
                            /* HorizontalPosition : 00     */
                            /*              Shape : 04     */
                            /*   GroupOrientation : 00     */
                            /*         GroupToken : 00     */
                            /*      GroupPosition : 00     */
                            /*                Bay : 00     */
                            /*          Ejectable : 01     */
                            /*  OspmEjectRequired : 01     */
                            /*      CabinetNumber : 00     */
                            /*     CardCageNumber : 00     */
                            /*          Reference : 00     */
                            /*           Rotation : 00     */
                            /*              Order : 00     */
                            /*     VerticalOffset : 0000   */
                            /*   HorizontalOffset : 0000   */
                            }
                        })
                    }

                    Device (PRT2)
                    {
                        Name (_ADR, 0x02)  // _ADR: Address
                        Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                        {
                            0xFF, 
                            Zero, 
                            Zero, 
                            Zero
                        })
                        Name (_PLD, Package (0x1)  // _PLD: Physical Location of Device
                        {
                            Buffer (0x10) {
                            /* 0000 */   0x81, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                            /* 0008 */   0xA1, 0x10, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
                            /*           Revision : 01     */
                            /*        IgnoreColor : 01     */
                            /*              Color : 000000 */
                            /*              Width : 0000   */
                            /*             Height : 0000   */
                            /*        UserVisible : 01     */
                            /*               Dock : 00     */
                            /*                Lid : 00     */
                            /*              Panel : 04     */
                            /*   VerticalPosition : 02     */
                            /* HorizontalPosition : 00     */
                            /*              Shape : 04     */
                            /*   GroupOrientation : 00     */
                            /*         GroupToken : 00     */
                            /*      GroupPosition : 00     */
                            /*                Bay : 00     */
                            /*          Ejectable : 01     */
                            /*  OspmEjectRequired : 01     */
                            /*      CabinetNumber : 00     */
                            /*     CardCageNumber : 00     */
                            /*          Reference : 00     */
                            /*           Rotation : 00     */
                            /*              Order : 00     */
                            /*     VerticalOffset : 0000   */
                            /*   HorizontalOffset : 0000   */
                            }
                        })
                    }

                    Device (PRT3)
                    {
                        Name (_ADR, 0x03)  // _ADR: Address
                        Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                        {
                            Zero, 
                            0xFF, 
                            Zero, 
                            Zero
                        })
                        Name (_PLD, Package (0x1)  // _PLD: Physical Location of Device
                        {
                            Buffer (0x10) {
                            /* 0000 */   0x81, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                            /* 0008 */   0xA0, 0x10, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
                            /*           Revision : 01     */
                            /*        IgnoreColor : 01     */
                            /*              Color : 000000 */
                            /*              Width : 0000   */
                            /*             Height : 0000   */
                            /*        UserVisible : 00     */
                            /*               Dock : 00     */
                            /*                Lid : 00     */
                            /*              Panel : 04     */
                            /*   VerticalPosition : 02     */
                            /* HorizontalPosition : 00     */
                            /*              Shape : 04     */
                            /*   GroupOrientation : 00     */
                            /*         GroupToken : 00     */
                            /*      GroupPosition : 00     */
                            /*                Bay : 00     */
                            /*          Ejectable : 01     */
                            /*  OspmEjectRequired : 01     */
                            /*      CabinetNumber : 00     */
                            /*     CardCageNumber : 00     */
                            /*          Reference : 00     */
                            /*           Rotation : 00     */
                            /*              Order : 00     */
                            /*     VerticalOffset : 0000   */
                            /*   HorizontalOffset : 0000   */
                            }
                        })
                    }

                    Device (PRT4)
                    {
                        Name (_ADR, 0x04)  // _ADR: Address
                        Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                        {
                            Zero, 
                            0xFF, 
                            Zero, 
                            Zero
                        })
                        Name (_PLD, Package (0x1)  // _PLD: Physical Location of Device
                        {
                            Buffer (0x10) {
                            /* 0000 */   0x81, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                            /* 0008 */   0xA0, 0x10, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
                            /*           Revision : 01     */
                            /*        IgnoreColor : 01     */
                            /*              Color : 000000 */
                            /*              Width : 0000   */
                            /*             Height : 0000   */
                            /*        UserVisible : 00     */
                            /*               Dock : 00     */
                            /*                Lid : 00     */
                            /*              Panel : 04     */
                            /*   VerticalPosition : 02     */
                            /* HorizontalPosition : 00     */
                            /*              Shape : 04     */
                            /*   GroupOrientation : 00     */
                            /*         GroupToken : 00     */
                            /*      GroupPosition : 00     */
                            /*                Bay : 00     */
                            /*          Ejectable : 01     */
                            /*  OspmEjectRequired : 01     */
                            /*      CabinetNumber : 00     */
                            /*     CardCageNumber : 00     */
                            /*          Reference : 00     */
                            /*           Rotation : 00     */
                            /*              Order : 00     */
                            /*     VerticalOffset : 0000   */
                            /*   HorizontalOffset : 0000   */
                            }
                        })
                    }

                    Device (PRT5)
                    {
                        Name (_ADR, 0x05)  // _ADR: Address
                        Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                        {
                            0xFF, 
                            Zero, 
                            Zero, 
                            Zero
                        })
                        Name (_PLD, Package (0x1)  // _PLD: Physical Location of Device
                        {
                            Buffer (0x10) {
                            /* 0000 */   0x81, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                            /* 0008 */   0xA0, 0x10, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
                            /*           Revision : 01     */
                            /*        IgnoreColor : 01     */
                            /*              Color : 000000 */
                            /*              Width : 0000   */
                            /*             Height : 0000   */
                            /*        UserVisible : 00     */
                            /*               Dock : 00     */
                            /*                Lid : 00     */
                            /*              Panel : 04     */
                            /*   VerticalPosition : 02     */
                            /* HorizontalPosition : 00     */
                            /*              Shape : 04     */
                            /*   GroupOrientation : 00     */
                            /*         GroupToken : 00     */
                            /*      GroupPosition : 00     */
                            /*                Bay : 00     */
                            /*          Ejectable : 01     */
                            /*  OspmEjectRequired : 01     */
                            /*      CabinetNumber : 00     */
                            /*     CardCageNumber : 00     */
                            /*          Reference : 00     */
                            /*           Rotation : 00     */
                            /*              Order : 00     */
                            /*     VerticalOffset : 0000   */
                            /*   HorizontalOffset : 0000   */
                            }
                        })
                    }
                }

                Method (_S3D, 0, NotSerialized)  // _S3D: S3 Device State
                {
                    Return (0x02)
                }

                Method (_S4D, 0, NotSerialized)  // _S4D: S4 Device State
                {
                    Return (0x02)
                }
            }

            Device (OHC2)
            {
                Name (_ADR, 0x00130000)  // _ADR: Address
                OperationRegion (O2CS, PCI_Config, 0xC4, 0x04)
                Field (O2CS, DWordAcc, NoLock, Preserve)
                {
                    O2EN,   2
                }

                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x18, 0x03))
                }

                Device (XHUB)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Device (PRT1)
                    {
                        Name (_ADR, One)  // _ADR: Address
                        Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                        {
                            0xFF, 
                            Zero, 
                            Zero, 
                            Zero
                        })
                        Name (_PLD, Package (0x1)  // _PLD: Physical Location of Device
                        {
                            Buffer (0x10) {
                            /* 0000 */   0x81, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                            /* 0008 */   0xA0, 0x10, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
                            /*           Revision : 01     */
                            /*        IgnoreColor : 01     */
                            /*              Color : 000000 */
                            /*              Width : 0000   */
                            /*             Height : 0000   */
                            /*        UserVisible : 00     */
                            /*               Dock : 00     */
                            /*                Lid : 00     */
                            /*              Panel : 04     */
                            /*   VerticalPosition : 02     */
                            /* HorizontalPosition : 00     */
                            /*              Shape : 04     */
                            /*   GroupOrientation : 00     */
                            /*         GroupToken : 00     */
                            /*      GroupPosition : 00     */
                            /*                Bay : 00     */
                            /*          Ejectable : 01     */
                            /*  OspmEjectRequired : 01     */
                            /*      CabinetNumber : 00     */
                            /*     CardCageNumber : 00     */
                            /*          Reference : 00     */
                            /*           Rotation : 00     */
                            /*              Order : 00     */
                            /*     VerticalOffset : 0000   */
                            /*   HorizontalOffset : 0000   */
                            }
                        })
                    }

                    Device (PRT2)
                    {
                        Name (_ADR, 0x02)  // _ADR: Address
                        Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                        {
                            0xFF, 
                            Zero, 
                            Zero, 
                            Zero
                        })
                        Name (_PLD, Package (0x1)  // _PLD: Physical Location of Device
                        {
                            Buffer (0x10) {
                            /* 0000 */   0x81, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                            /* 0008 */   0xA0, 0x10, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
                            /*           Revision : 01     */
                            /*        IgnoreColor : 01     */
                            /*              Color : 000000 */
                            /*              Width : 0000   */
                            /*             Height : 0000   */
                            /*        UserVisible : 00     */
                            /*               Dock : 00     */
                            /*                Lid : 00     */
                            /*              Panel : 04     */
                            /*   VerticalPosition : 02     */
                            /* HorizontalPosition : 00     */
                            /*              Shape : 04     */
                            /*   GroupOrientation : 00     */
                            /*         GroupToken : 00     */
                            /*      GroupPosition : 00     */
                            /*                Bay : 00     */
                            /*          Ejectable : 01     */
                            /*  OspmEjectRequired : 01     */
                            /*      CabinetNumber : 00     */
                            /*     CardCageNumber : 00     */
                            /*          Reference : 00     */
                            /*           Rotation : 00     */
                            /*              Order : 00     */
                            /*     VerticalOffset : 0000   */
                            /*   HorizontalOffset : 0000   */
                            }
                        })
                    }

                    Device (PRT3)
                    {
                        Name (_ADR, 0x03)  // _ADR: Address
                        Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                        {
                            0xFF, 
                            Zero, 
                            Zero, 
                            Zero
                        })
                        Name (_PLD, Package (0x1)  // _PLD: Physical Location of Device
                        {
                            Buffer (0x10) {
                            /* 0000 */   0x81, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                            /* 0008 */   0xA0, 0x10, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
                            /*           Revision : 01     */
                            /*        IgnoreColor : 01     */
                            /*              Color : 000000 */
                            /*              Width : 0000   */
                            /*             Height : 0000   */
                            /*        UserVisible : 00     */
                            /*               Dock : 00     */
                            /*                Lid : 00     */
                            /*              Panel : 04     */
                            /*   VerticalPosition : 02     */
                            /* HorizontalPosition : 00     */
                            /*              Shape : 04     */
                            /*   GroupOrientation : 00     */
                            /*         GroupToken : 00     */
                            /*      GroupPosition : 00     */
                            /*                Bay : 00     */
                            /*          Ejectable : 01     */
                            /*  OspmEjectRequired : 01     */
                            /*      CabinetNumber : 00     */
                            /*     CardCageNumber : 00     */
                            /*          Reference : 00     */
                            /*           Rotation : 00     */
                            /*              Order : 00     */
                            /*     VerticalOffset : 0000   */
                            /*   HorizontalOffset : 0000   */
                            }
                        })
                    }

                    Device (PRT4)
                    {
                        Name (_ADR, 0x04)  // _ADR: Address
                        Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                        {
                            Zero, 
                            0xFF, 
                            Zero, 
                            Zero
                        })
                        Name (_PLD, Package (0x1)  // _PLD: Physical Location of Device
                        {
                            Buffer (0x10) {
                            /* 0000 */   0x81, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                            /* 0008 */   0xA0, 0x10, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
                            /*           Revision : 01     */
                            /*        IgnoreColor : 01     */
                            /*              Color : 000000 */
                            /*              Width : 0000   */
                            /*             Height : 0000   */
                            /*        UserVisible : 00     */
                            /*               Dock : 00     */
                            /*                Lid : 00     */
                            /*              Panel : 04     */
                            /*   VerticalPosition : 02     */
                            /* HorizontalPosition : 00     */
                            /*              Shape : 04     */
                            /*   GroupOrientation : 00     */
                            /*         GroupToken : 00     */
                            /*      GroupPosition : 00     */
                            /*                Bay : 00     */
                            /*          Ejectable : 01     */
                            /*  OspmEjectRequired : 01     */
                            /*      CabinetNumber : 00     */
                            /*     CardCageNumber : 00     */
                            /*          Reference : 00     */
                            /*           Rotation : 00     */
                            /*              Order : 00     */
                            /*     VerticalOffset : 0000   */
                            /*   HorizontalOffset : 0000   */
                            }
                        })
                    }

                    Device (PRT5)
                    {
                        Name (_ADR, 0x05)  // _ADR: Address
                        Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                        {
                            Zero, 
                            0xFF, 
                            Zero, 
                            Zero
                        })
                        Name (_PLD, Package (0x1)  // _PLD: Physical Location of Device
                        {
                            Buffer (0x10) {
                            /* 0000 */   0x81, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                            /* 0008 */   0xA0, 0x10, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
                            /*           Revision : 01     */
                            /*        IgnoreColor : 01     */
                            /*              Color : 000000 */
                            /*              Width : 0000   */
                            /*             Height : 0000   */
                            /*        UserVisible : 00     */
                            /*               Dock : 00     */
                            /*                Lid : 00     */
                            /*              Panel : 04     */
                            /*   VerticalPosition : 02     */
                            /* HorizontalPosition : 00     */
                            /*              Shape : 04     */
                            /*   GroupOrientation : 00     */
                            /*         GroupToken : 00     */
                            /*      GroupPosition : 00     */
                            /*                Bay : 00     */
                            /*          Ejectable : 01     */
                            /*  OspmEjectRequired : 01     */
                            /*      CabinetNumber : 00     */
                            /*     CardCageNumber : 00     */
                            /*          Reference : 00     */
                            /*           Rotation : 00     */
                            /*              Order : 00     */
                            /*     VerticalOffset : 0000   */
                            /*   HorizontalOffset : 0000   */
                            }
                        })
                    }
                }

                Method (_S3D, 0, NotSerialized)  // _S3D: S3 Device State
                {
                    Return (0x02)
                }

                Method (_S4D, 0, NotSerialized)  // _S4D: S4 Device State
                {
                    Return (0x02)
                }
            }

            Device (OHC3)
            {
                Name (_ADR, 0x00160000)  // _ADR: Address
                OperationRegion (O3CS, PCI_Config, 0xC4, 0x04)
                Field (O3CS, DWordAcc, NoLock, Preserve)
                {
                    O3EN,   2
                }

                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x18, 0x03))
                }

                Device (XHUB)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Device (PRT1)
                    {
                        Name (_ADR, One)  // _ADR: Address
                        Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                        {
                            0xFF, 
                            Zero, 
                            Zero, 
                            Zero
                        })
                        Name (_PLD, Package (0x1)  // _PLD: Physical Location of Device
                        {
                            Buffer (0x10) {
                            /* 0000 */   0x81, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                            /* 0008 */   0xA1, 0x10, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
                            /*           Revision : 01     */
                            /*        IgnoreColor : 01     */
                            /*              Color : 000000 */
                            /*              Width : 0000   */
                            /*             Height : 0000   */
                            /*        UserVisible : 01     */
                            /*               Dock : 00     */
                            /*                Lid : 00     */
                            /*              Panel : 04     */
                            /*   VerticalPosition : 02     */
                            /* HorizontalPosition : 00     */
                            /*              Shape : 04     */
                            /*   GroupOrientation : 00     */
                            /*         GroupToken : 00     */
                            /*      GroupPosition : 00     */
                            /*                Bay : 00     */
                            /*          Ejectable : 01     */
                            /*  OspmEjectRequired : 01     */
                            /*      CabinetNumber : 00     */
                            /*     CardCageNumber : 00     */
                            /*          Reference : 00     */
                            /*           Rotation : 00     */
                            /*              Order : 00     */
                            /*     VerticalOffset : 0000   */
                            /*   HorizontalOffset : 0000   */
                            }
                        })
                    }

                    Device (PRT2)
                    {
                        Name (_ADR, 0x02)  // _ADR: Address
                        Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                        {
                            Zero, 
                            0xFF, 
                            Zero, 
                            Zero
                        })
                        Name (_PLD, Package (0x1)  // _PLD: Physical Location of Device
                        {
                            Buffer (0x10) {
                            /* 0000 */   0x81, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                            /* 0008 */   0xA0, 0x10, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
                            /*           Revision : 01     */
                            /*        IgnoreColor : 01     */
                            /*              Color : 000000 */
                            /*              Width : 0000   */
                            /*             Height : 0000   */
                            /*        UserVisible : 00     */
                            /*               Dock : 00     */
                            /*                Lid : 00     */
                            /*              Panel : 04     */
                            /*   VerticalPosition : 02     */
                            /* HorizontalPosition : 00     */
                            /*              Shape : 04     */
                            /*   GroupOrientation : 00     */
                            /*         GroupToken : 00     */
                            /*      GroupPosition : 00     */
                            /*                Bay : 00     */
                            /*          Ejectable : 01     */
                            /*  OspmEjectRequired : 01     */
                            /*      CabinetNumber : 00     */
                            /*     CardCageNumber : 00     */
                            /*          Reference : 00     */
                            /*           Rotation : 00     */
                            /*              Order : 00     */
                            /*     VerticalOffset : 0000   */
                            /*   HorizontalOffset : 0000   */
                            }
                        })
                    }

                    Device (PRT3)
                    {
                        Name (_ADR, 0x03)  // _ADR: Address
                        Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                        {
                            0xFF, 
                            Zero, 
                            Zero, 
                            Zero
                        })
                        Name (_PLD, Package (0x1)  // _PLD: Physical Location of Device
                        {
                            Buffer (0x10) {
                            /* 0000 */   0x81, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                            /* 0008 */   0xA1, 0x10, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
                            /*           Revision : 01     */
                            /*        IgnoreColor : 01     */
                            /*              Color : 000000 */
                            /*              Width : 0000   */
                            /*             Height : 0000   */
                            /*        UserVisible : 01     */
                            /*               Dock : 00     */
                            /*                Lid : 00     */
                            /*              Panel : 04     */
                            /*   VerticalPosition : 02     */
                            /* HorizontalPosition : 00     */
                            /*              Shape : 04     */
                            /*   GroupOrientation : 00     */
                            /*         GroupToken : 00     */
                            /*      GroupPosition : 00     */
                            /*                Bay : 00     */
                            /*          Ejectable : 01     */
                            /*  OspmEjectRequired : 01     */
                            /*      CabinetNumber : 00     */
                            /*     CardCageNumber : 00     */
                            /*          Reference : 00     */
                            /*           Rotation : 00     */
                            /*              Order : 00     */
                            /*     VerticalOffset : 0000   */
                            /*   HorizontalOffset : 0000   */
                            }
                        })
                    }

                    Device (PRT4)
                    {
                        Name (_ADR, 0x04)  // _ADR: Address
                        Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                        {
                            Zero, 
                            0xFF, 
                            Zero, 
                            Zero
                        })
                        Name (_PLD, Package (0x1)  // _PLD: Physical Location of Device
                        {
                            Buffer (0x10) {
                            /* 0000 */   0x81, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                            /* 0008 */   0xA0, 0x10, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
                            /*           Revision : 01     */
                            /*        IgnoreColor : 01     */
                            /*              Color : 000000 */
                            /*              Width : 0000   */
                            /*             Height : 0000   */
                            /*        UserVisible : 00     */
                            /*               Dock : 00     */
                            /*                Lid : 00     */
                            /*              Panel : 04     */
                            /*   VerticalPosition : 02     */
                            /* HorizontalPosition : 00     */
                            /*              Shape : 04     */
                            /*   GroupOrientation : 00     */
                            /*         GroupToken : 00     */
                            /*      GroupPosition : 00     */
                            /*                Bay : 00     */
                            /*          Ejectable : 01     */
                            /*  OspmEjectRequired : 01     */
                            /*      CabinetNumber : 00     */
                            /*     CardCageNumber : 00     */
                            /*          Reference : 00     */
                            /*           Rotation : 00     */
                            /*              Order : 00     */
                            /*     VerticalOffset : 0000   */
                            /*   HorizontalOffset : 0000   */
                            }
                        })
                    }
                }

                Method (_S3D, 0, NotSerialized)  // _S3D: S3 Device State
                {
                    Return (0x02)
                }

                Method (_S4D, 0, NotSerialized)  // _S4D: S4 Device State
                {
                    Return (0x02)
                }
            }

            Device (OHC4)
            {
                Name (_ADR, 0x00140005)  // _ADR: Address
                OperationRegion (O4CS, PCI_Config, 0xC4, 0x04)
                Field (O4CS, DWordAcc, NoLock, Preserve)
                {
                    O4EN,   2
                }

                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x18, 0x03))
                }

                Method (_S3D, 0, NotSerialized)  // _S3D: S3 Device State
                {
                    Return (0x02)
                }

                Method (_S4D, 0, NotSerialized)  // _S4D: S4 Device State
                {
                    Return (0x02)
                }
            }

            Device (EHC1)
            {
                Name (_ADR, 0x00120002)  // _ADR: Address
                OperationRegion (PCFG, PCI_Config, 0xA0, 0x04)
                Field (PCFG, DWordAcc, NoLock, Preserve)
                {
                    OSOW,   32
                }

                Method (STOS, 0, NotSerialized)
                {
                    Or (OSOW, 0x01000000, OSOW)
                }

                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x18, 0x03))
                }

                Device (XHUB)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Device (PRT1)
                    {
                        Name (_ADR, One)  // _ADR: Address
                        Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                        {
                            0xFF, 
                            Zero, 
                            Zero, 
                            Zero
                        })
                        Name (_PLD, Package (0x1)  // _PLD: Physical Location of Device
                        {
                            Buffer (0x10) {
                            /* 0000 */   0x81, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                            /* 0008 */   0xA1, 0x10, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
                            /*           Revision : 01     */
                            /*        IgnoreColor : 01     */
                            /*              Color : 000000 */
                            /*              Width : 0000   */
                            /*             Height : 0000   */
                            /*        UserVisible : 01     */
                            /*               Dock : 00     */
                            /*                Lid : 00     */
                            /*              Panel : 04     */
                            /*   VerticalPosition : 02     */
                            /* HorizontalPosition : 00     */
                            /*              Shape : 04     */
                            /*   GroupOrientation : 00     */
                            /*         GroupToken : 00     */
                            /*      GroupPosition : 00     */
                            /*                Bay : 00     */
                            /*          Ejectable : 01     */
                            /*  OspmEjectRequired : 01     */
                            /*      CabinetNumber : 00     */
                            /*     CardCageNumber : 00     */
                            /*          Reference : 00     */
                            /*           Rotation : 00     */
                            /*              Order : 00     */
                            /*     VerticalOffset : 0000   */
                            /*   HorizontalOffset : 0000   */
                            }
                        })
                    }

                    Device (PRT2)
                    {
                        Name (_ADR, 0x02)  // _ADR: Address
                        Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                        {
                            0xFF, 
                            Zero, 
                            Zero, 
                            Zero
                        })
                        Name (_PLD, Package (0x1)  // _PLD: Physical Location of Device
                        {
                            Buffer (0x10) {
                            /* 0000 */   0x81, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                            /* 0008 */   0xA1, 0x10, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
                            /*           Revision : 01     */
                            /*        IgnoreColor : 01     */
                            /*              Color : 000000 */
                            /*              Width : 0000   */
                            /*             Height : 0000   */
                            /*        UserVisible : 01     */
                            /*               Dock : 00     */
                            /*                Lid : 00     */
                            /*              Panel : 04     */
                            /*   VerticalPosition : 02     */
                            /* HorizontalPosition : 00     */
                            /*              Shape : 04     */
                            /*   GroupOrientation : 00     */
                            /*         GroupToken : 00     */
                            /*      GroupPosition : 00     */
                            /*                Bay : 00     */
                            /*          Ejectable : 01     */
                            /*  OspmEjectRequired : 01     */
                            /*      CabinetNumber : 00     */
                            /*     CardCageNumber : 00     */
                            /*          Reference : 00     */
                            /*           Rotation : 00     */
                            /*              Order : 00     */
                            /*     VerticalOffset : 0000   */
                            /*   HorizontalOffset : 0000   */
                            }
                        })
                    }

                    Device (PRT3)
                    {
                        Name (_ADR, 0x03)  // _ADR: Address
                        Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                        {
                            Zero, 
                            0xFF, 
                            Zero, 
                            Zero
                        })
                        Name (_PLD, Package (0x1)  // _PLD: Physical Location of Device
                        {
                            Buffer (0x10) {
                            /* 0000 */   0x81, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                            /* 0008 */   0xA0, 0x10, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
                            /*           Revision : 01     */
                            /*        IgnoreColor : 01     */
                            /*              Color : 000000 */
                            /*              Width : 0000   */
                            /*             Height : 0000   */
                            /*        UserVisible : 00     */
                            /*               Dock : 00     */
                            /*                Lid : 00     */
                            /*              Panel : 04     */
                            /*   VerticalPosition : 02     */
                            /* HorizontalPosition : 00     */
                            /*              Shape : 04     */
                            /*   GroupOrientation : 00     */
                            /*         GroupToken : 00     */
                            /*      GroupPosition : 00     */
                            /*                Bay : 00     */
                            /*          Ejectable : 01     */
                            /*  OspmEjectRequired : 01     */
                            /*      CabinetNumber : 00     */
                            /*     CardCageNumber : 00     */
                            /*          Reference : 00     */
                            /*           Rotation : 00     */
                            /*              Order : 00     */
                            /*     VerticalOffset : 0000   */
                            /*   HorizontalOffset : 0000   */
                            }
                        })
                    }

                    Device (PRT4)
                    {
                        Name (_ADR, 0x04)  // _ADR: Address
                        Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                        {
                            Zero, 
                            0xFF, 
                            Zero, 
                            Zero
                        })
                        Name (_PLD, Package (0x1)  // _PLD: Physical Location of Device
                        {
                            Buffer (0x10) {
                            /* 0000 */   0x81, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                            /* 0008 */   0xA0, 0x10, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
                            /*           Revision : 01     */
                            /*        IgnoreColor : 01     */
                            /*              Color : 000000 */
                            /*              Width : 0000   */
                            /*             Height : 0000   */
                            /*        UserVisible : 00     */
                            /*               Dock : 00     */
                            /*                Lid : 00     */
                            /*              Panel : 04     */
                            /*   VerticalPosition : 02     */
                            /* HorizontalPosition : 00     */
                            /*              Shape : 04     */
                            /*   GroupOrientation : 00     */
                            /*         GroupToken : 00     */
                            /*      GroupPosition : 00     */
                            /*                Bay : 00     */
                            /*          Ejectable : 01     */
                            /*  OspmEjectRequired : 01     */
                            /*      CabinetNumber : 00     */
                            /*     CardCageNumber : 00     */
                            /*          Reference : 00     */
                            /*           Rotation : 00     */
                            /*              Order : 00     */
                            /*     VerticalOffset : 0000   */
                            /*   HorizontalOffset : 0000   */
                            }
                        })
                    }

                    Device (PRT5)
                    {
                        Name (_ADR, 0x05)  // _ADR: Address
                        Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                        {
                            0xFF, 
                            Zero, 
                            Zero, 
                            Zero
                        })
                        Name (_PLD, Package (0x1)  // _PLD: Physical Location of Device
                        {
                            Buffer (0x10) {
                            /* 0000 */   0x81, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                            /* 0008 */   0xA0, 0x10, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
                            /*           Revision : 01     */
                            /*        IgnoreColor : 01     */
                            /*              Color : 000000 */
                            /*              Width : 0000   */
                            /*             Height : 0000   */
                            /*        UserVisible : 00     */
                            /*               Dock : 00     */
                            /*                Lid : 00     */
                            /*              Panel : 04     */
                            /*   VerticalPosition : 02     */
                            /* HorizontalPosition : 00     */
                            /*              Shape : 04     */
                            /*   GroupOrientation : 00     */
                            /*         GroupToken : 00     */
                            /*      GroupPosition : 00     */
                            /*                Bay : 00     */
                            /*          Ejectable : 01     */
                            /*  OspmEjectRequired : 01     */
                            /*      CabinetNumber : 00     */
                            /*     CardCageNumber : 00     */
                            /*          Reference : 00     */
                            /*           Rotation : 00     */
                            /*              Order : 00     */
                            /*     VerticalOffset : 0000   */
                            /*   HorizontalOffset : 0000   */
                            }
                        })
                    }
                }
            }

            Device (EHC2)
            {
                Name (_ADR, 0x00130002)  // _ADR: Address
                OperationRegion (PCFG, PCI_Config, 0xA0, 0x04)
                Field (PCFG, DWordAcc, NoLock, Preserve)
                {
                    OSOW,   32
                }

                Method (STOS, 0, NotSerialized)
                {
                    Or (OSOW, 0x01000000, OSOW)
                }

                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x18, 0x03))
                }

                Device (XHUB)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Device (PRT1)
                    {
                        Name (_ADR, One)  // _ADR: Address
                        Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                        {
                            0xFF, 
                            Zero, 
                            Zero, 
                            Zero
                        })
                        Name (_PLD, Package (0x1)  // _PLD: Physical Location of Device
                        {
                            Buffer (0x10) {
                            /* 0000 */   0x81, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                            /* 0008 */   0xA0, 0x10, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
                            /*           Revision : 01     */
                            /*        IgnoreColor : 01     */
                            /*              Color : 000000 */
                            /*              Width : 0000   */
                            /*             Height : 0000   */
                            /*        UserVisible : 00     */
                            /*               Dock : 00     */
                            /*                Lid : 00     */
                            /*              Panel : 04     */
                            /*   VerticalPosition : 02     */
                            /* HorizontalPosition : 00     */
                            /*              Shape : 04     */
                            /*   GroupOrientation : 00     */
                            /*         GroupToken : 00     */
                            /*      GroupPosition : 00     */
                            /*                Bay : 00     */
                            /*          Ejectable : 01     */
                            /*  OspmEjectRequired : 01     */
                            /*      CabinetNumber : 00     */
                            /*     CardCageNumber : 00     */
                            /*          Reference : 00     */
                            /*           Rotation : 00     */
                            /*              Order : 00     */
                            /*     VerticalOffset : 0000   */
                            /*   HorizontalOffset : 0000   */
                            }
                        })
                    }

                    Device (PRT2)
                    {
                        Name (_ADR, 0x02)  // _ADR: Address
                        Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                        {
                            0xFF, 
                            Zero, 
                            Zero, 
                            Zero
                        })
                        Name (_PLD, Package (0x1)  // _PLD: Physical Location of Device
                        {
                            Buffer (0x10) {
                            /* 0000 */   0x81, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                            /* 0008 */   0xA0, 0x10, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
                            /*           Revision : 01     */
                            /*        IgnoreColor : 01     */
                            /*              Color : 000000 */
                            /*              Width : 0000   */
                            /*             Height : 0000   */
                            /*        UserVisible : 00     */
                            /*               Dock : 00     */
                            /*                Lid : 00     */
                            /*              Panel : 04     */
                            /*   VerticalPosition : 02     */
                            /* HorizontalPosition : 00     */
                            /*              Shape : 04     */
                            /*   GroupOrientation : 00     */
                            /*         GroupToken : 00     */
                            /*      GroupPosition : 00     */
                            /*                Bay : 00     */
                            /*          Ejectable : 01     */
                            /*  OspmEjectRequired : 01     */
                            /*      CabinetNumber : 00     */
                            /*     CardCageNumber : 00     */
                            /*          Reference : 00     */
                            /*           Rotation : 00     */
                            /*              Order : 00     */
                            /*     VerticalOffset : 0000   */
                            /*   HorizontalOffset : 0000   */
                            }
                        })
                    }

                    Device (PRT3)
                    {
                        Name (_ADR, 0x03)  // _ADR: Address
                        Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                        {
                            0xFF, 
                            Zero, 
                            Zero, 
                            Zero
                        })
                        Name (_PLD, Package (0x1)  // _PLD: Physical Location of Device
                        {
                            Buffer (0x10) {
                            /* 0000 */   0x81, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                            /* 0008 */   0xA0, 0x10, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
                            /*           Revision : 01     */
                            /*        IgnoreColor : 01     */
                            /*              Color : 000000 */
                            /*              Width : 0000   */
                            /*             Height : 0000   */
                            /*        UserVisible : 00     */
                            /*               Dock : 00     */
                            /*                Lid : 00     */
                            /*              Panel : 04     */
                            /*   VerticalPosition : 02     */
                            /* HorizontalPosition : 00     */
                            /*              Shape : 04     */
                            /*   GroupOrientation : 00     */
                            /*         GroupToken : 00     */
                            /*      GroupPosition : 00     */
                            /*                Bay : 00     */
                            /*          Ejectable : 01     */
                            /*  OspmEjectRequired : 01     */
                            /*      CabinetNumber : 00     */
                            /*     CardCageNumber : 00     */
                            /*          Reference : 00     */
                            /*           Rotation : 00     */
                            /*              Order : 00     */
                            /*     VerticalOffset : 0000   */
                            /*   HorizontalOffset : 0000   */
                            }
                        })
                    }

                    Device (PRT4)
                    {
                        Name (_ADR, 0x04)  // _ADR: Address
                        Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                        {
                            Zero, 
                            0xFF, 
                            Zero, 
                            Zero
                        })
                        Name (_PLD, Package (0x1)  // _PLD: Physical Location of Device
                        {
                            Buffer (0x10) {
                            /* 0000 */   0x81, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                            /* 0008 */   0xA0, 0x10, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
                            /*           Revision : 01     */
                            /*        IgnoreColor : 01     */
                            /*              Color : 000000 */
                            /*              Width : 0000   */
                            /*             Height : 0000   */
                            /*        UserVisible : 00     */
                            /*               Dock : 00     */
                            /*                Lid : 00     */
                            /*              Panel : 04     */
                            /*   VerticalPosition : 02     */
                            /* HorizontalPosition : 00     */
                            /*              Shape : 04     */
                            /*   GroupOrientation : 00     */
                            /*         GroupToken : 00     */
                            /*      GroupPosition : 00     */
                            /*                Bay : 00     */
                            /*          Ejectable : 01     */
                            /*  OspmEjectRequired : 01     */
                            /*      CabinetNumber : 00     */
                            /*     CardCageNumber : 00     */
                            /*          Reference : 00     */
                            /*           Rotation : 00     */
                            /*              Order : 00     */
                            /*     VerticalOffset : 0000   */
                            /*   HorizontalOffset : 0000   */
                            }
                        })
                    }

                    Device (PRT5)
                    {
                        Name (_ADR, 0x05)  // _ADR: Address
                        Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                        {
                            Zero, 
                            0xFF, 
                            Zero, 
                            Zero
                        })
                        Name (_PLD, Package (0x1)  // _PLD: Physical Location of Device
                        {
                            Buffer (0x10) {
                            /* 0000 */   0x81, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                            /* 0008 */   0xA0, 0x10, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
                            /*           Revision : 01     */
                            /*        IgnoreColor : 01     */
                            /*              Color : 000000 */
                            /*              Width : 0000   */
                            /*             Height : 0000   */
                            /*        UserVisible : 00     */
                            /*               Dock : 00     */
                            /*                Lid : 00     */
                            /*              Panel : 04     */
                            /*   VerticalPosition : 02     */
                            /* HorizontalPosition : 00     */
                            /*              Shape : 04     */
                            /*   GroupOrientation : 00     */
                            /*         GroupToken : 00     */
                            /*      GroupPosition : 00     */
                            /*                Bay : 00     */
                            /*          Ejectable : 01     */
                            /*  OspmEjectRequired : 01     */
                            /*      CabinetNumber : 00     */
                            /*     CardCageNumber : 00     */
                            /*          Reference : 00     */
                            /*           Rotation : 00     */
                            /*              Order : 00     */
                            /*     VerticalOffset : 0000   */
                            /*   HorizontalOffset : 0000   */
                            }
                        })
                    }
                }
            }

            Device (EHC3)
            {
                Name (_ADR, 0x00160002)  // _ADR: Address
                OperationRegion (PCFG, PCI_Config, 0xA0, 0x04)
                Field (PCFG, DWordAcc, NoLock, Preserve)
                {
                    OSOW,   32
                }

                Method (STOS, 0, NotSerialized)
                {
                    Or (OSOW, 0x01000000, OSOW)
                }

                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x18, 0x03))
                }

                Device (XHUB)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Device (PRT1)
                    {
                        Name (_ADR, One)  // _ADR: Address
                        Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                        {
                            0xFF, 
                            Zero, 
                            Zero, 
                            Zero
                        })
                        Name (_PLD, Package (0x1)  // _PLD: Physical Location of Device
                        {
                            Buffer (0x10) {
                            /* 0000 */   0x81, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                            /* 0008 */   0xA1, 0x10, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
                            /*           Revision : 01     */
                            /*        IgnoreColor : 01     */
                            /*              Color : 000000 */
                            /*              Width : 0000   */
                            /*             Height : 0000   */
                            /*        UserVisible : 01     */
                            /*               Dock : 00     */
                            /*                Lid : 00     */
                            /*              Panel : 04     */
                            /*   VerticalPosition : 02     */
                            /* HorizontalPosition : 00     */
                            /*              Shape : 04     */
                            /*   GroupOrientation : 00     */
                            /*         GroupToken : 00     */
                            /*      GroupPosition : 00     */
                            /*                Bay : 00     */
                            /*          Ejectable : 01     */
                            /*  OspmEjectRequired : 01     */
                            /*      CabinetNumber : 00     */
                            /*     CardCageNumber : 00     */
                            /*          Reference : 00     */
                            /*           Rotation : 00     */
                            /*              Order : 00     */
                            /*     VerticalOffset : 0000   */
                            /*   HorizontalOffset : 0000   */
                            }
                        })
                    }

                    Device (PRT2)
                    {
                        Name (_ADR, 0x02)  // _ADR: Address
                        Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                        {
                            Zero, 
                            0xFF, 
                            Zero, 
                            Zero
                        })
                        Name (_PLD, Package (0x1)  // _PLD: Physical Location of Device
                        {
                            Buffer (0x10) {
                            /* 0000 */   0x81, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                            /* 0008 */   0xA0, 0x10, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
                            /*           Revision : 01     */
                            /*        IgnoreColor : 01     */
                            /*              Color : 000000 */
                            /*              Width : 0000   */
                            /*             Height : 0000   */
                            /*        UserVisible : 00     */
                            /*               Dock : 00     */
                            /*                Lid : 00     */
                            /*              Panel : 04     */
                            /*   VerticalPosition : 02     */
                            /* HorizontalPosition : 00     */
                            /*              Shape : 04     */
                            /*   GroupOrientation : 00     */
                            /*         GroupToken : 00     */
                            /*      GroupPosition : 00     */
                            /*                Bay : 00     */
                            /*          Ejectable : 01     */
                            /*  OspmEjectRequired : 01     */
                            /*      CabinetNumber : 00     */
                            /*     CardCageNumber : 00     */
                            /*          Reference : 00     */
                            /*           Rotation : 00     */
                            /*              Order : 00     */
                            /*     VerticalOffset : 0000   */
                            /*   HorizontalOffset : 0000   */
                            }
                        })
                    }

                    Device (PRT3)
                    {
                        Name (_ADR, 0x03)  // _ADR: Address
                        Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                        {
                            0xFF, 
                            Zero, 
                            Zero, 
                            Zero
                        })
                        Name (_PLD, Package (0x1)  // _PLD: Physical Location of Device
                        {
                            Buffer (0x10) {
                            /* 0000 */   0x81, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                            /* 0008 */   0xA1, 0x10, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
                            /*           Revision : 01     */
                            /*        IgnoreColor : 01     */
                            /*              Color : 000000 */
                            /*              Width : 0000   */
                            /*             Height : 0000   */
                            /*        UserVisible : 01     */
                            /*               Dock : 00     */
                            /*                Lid : 00     */
                            /*              Panel : 04     */
                            /*   VerticalPosition : 02     */
                            /* HorizontalPosition : 00     */
                            /*              Shape : 04     */
                            /*   GroupOrientation : 00     */
                            /*         GroupToken : 00     */
                            /*      GroupPosition : 00     */
                            /*                Bay : 00     */
                            /*          Ejectable : 01     */
                            /*  OspmEjectRequired : 01     */
                            /*      CabinetNumber : 00     */
                            /*     CardCageNumber : 00     */
                            /*          Reference : 00     */
                            /*           Rotation : 00     */
                            /*              Order : 00     */
                            /*     VerticalOffset : 0000   */
                            /*   HorizontalOffset : 0000   */
                            }
                        })
                    }

                    Device (PRT4)
                    {
                        Name (_ADR, 0x04)  // _ADR: Address
                        Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                        {
                            Zero, 
                            0xFF, 
                            Zero, 
                            Zero
                        })
                        Name (_PLD, Package (0x1)  // _PLD: Physical Location of Device
                        {
                            Buffer (0x10) {
                            /* 0000 */   0x81, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                            /* 0008 */   0xA0, 0x10, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
                            /*           Revision : 01     */
                            /*        IgnoreColor : 01     */
                            /*              Color : 000000 */
                            /*              Width : 0000   */
                            /*             Height : 0000   */
                            /*        UserVisible : 00     */
                            /*               Dock : 00     */
                            /*                Lid : 00     */
                            /*              Panel : 04     */
                            /*   VerticalPosition : 02     */
                            /* HorizontalPosition : 00     */
                            /*              Shape : 04     */
                            /*   GroupOrientation : 00     */
                            /*         GroupToken : 00     */
                            /*      GroupPosition : 00     */
                            /*                Bay : 00     */
                            /*          Ejectable : 01     */
                            /*  OspmEjectRequired : 01     */
                            /*      CabinetNumber : 00     */
                            /*     CardCageNumber : 00     */
                            /*          Reference : 00     */
                            /*           Rotation : 00     */
                            /*              Order : 00     */
                            /*     VerticalOffset : 0000   */
                            /*   HorizontalOffset : 0000   */
                            }
                        })
                    }
                }
            }

            Device (XHC0)
            {
                Name (_ADR, 0x00100000)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x18, 0x03))
                }

                Device (XHUB)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Device (PRT1)
                    {
                        Name (_ADR, One)  // _ADR: Address
                        Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                        {
                            0xFF, 
                            Zero, 
                            Zero, 
                            Zero
                        })
                        Name (_PLD, Package (0x1)  // _PLD: Physical Location of Device
                        {
                            Buffer (0x10) {
                            /* 0000 */   0x81, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                            /* 0008 */   0xA1, 0x10, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
                            /*           Revision : 01     */
                            /*        IgnoreColor : 01     */
                            /*              Color : 000000 */
                            /*              Width : 0000   */
                            /*             Height : 0000   */
                            /*        UserVisible : 01     */
                            /*               Dock : 00     */
                            /*                Lid : 00     */
                            /*              Panel : 04     */
                            /*   VerticalPosition : 02     */
                            /* HorizontalPosition : 00     */
                            /*              Shape : 04     */
                            /*   GroupOrientation : 00     */
                            /*         GroupToken : 00     */
                            /*      GroupPosition : 00     */
                            /*                Bay : 00     */
                            /*          Ejectable : 01     */
                            /*  OspmEjectRequired : 01     */
                            /*      CabinetNumber : 00     */
                            /*     CardCageNumber : 00     */
                            /*          Reference : 00     */
                            /*           Rotation : 00     */
                            /*              Order : 00     */
                            /*     VerticalOffset : 0000   */
                            /*   HorizontalOffset : 0000   */
                            }
                        })
                    }

                    Device (PRT2)
                    {
                        Name (_ADR, 0x02)  // _ADR: Address
                        Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                        {
                            Zero, 
                            0xFF, 
                            Zero, 
                            Zero
                        })
                        Name (_PLD, Package (0x1)  // _PLD: Physical Location of Device
                        {
                            Buffer (0x10) {
                            /* 0000 */   0x81, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                            /* 0008 */   0xA0, 0x10, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
                            /*           Revision : 01     */
                            /*        IgnoreColor : 01     */
                            /*              Color : 000000 */
                            /*              Width : 0000   */
                            /*             Height : 0000   */
                            /*        UserVisible : 00     */
                            /*               Dock : 00     */
                            /*                Lid : 00     */
                            /*              Panel : 04     */
                            /*   VerticalPosition : 02     */
                            /* HorizontalPosition : 00     */
                            /*              Shape : 04     */
                            /*   GroupOrientation : 00     */
                            /*         GroupToken : 00     */
                            /*      GroupPosition : 00     */
                            /*                Bay : 00     */
                            /*          Ejectable : 01     */
                            /*  OspmEjectRequired : 01     */
                            /*      CabinetNumber : 00     */
                            /*     CardCageNumber : 00     */
                            /*          Reference : 00     */
                            /*           Rotation : 00     */
                            /*              Order : 00     */
                            /*     VerticalOffset : 0000   */
                            /*   HorizontalOffset : 0000   */
                            }
                        })
                    }
                }
            }

            Device (XHC1)
            {
                Name (_ADR, 0x00100001)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x18, 0x03))
                }

                Device (XHUB)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Device (PRT1)
                    {
                        Name (_ADR, One)  // _ADR: Address
                        Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                        {
                            0xFF, 
                            Zero, 
                            Zero, 
                            Zero
                        })
                        Name (_PLD, Package (0x1)  // _PLD: Physical Location of Device
                        {
                            Buffer (0x10) {
                            /* 0000 */   0x81, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                            /* 0008 */   0xA1, 0x10, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
                            /*           Revision : 01     */
                            /*        IgnoreColor : 01     */
                            /*              Color : 000000 */
                            /*              Width : 0000   */
                            /*             Height : 0000   */
                            /*        UserVisible : 01     */
                            /*               Dock : 00     */
                            /*                Lid : 00     */
                            /*              Panel : 04     */
                            /*   VerticalPosition : 02     */
                            /* HorizontalPosition : 00     */
                            /*              Shape : 04     */
                            /*   GroupOrientation : 00     */
                            /*         GroupToken : 00     */
                            /*      GroupPosition : 00     */
                            /*                Bay : 00     */
                            /*          Ejectable : 01     */
                            /*  OspmEjectRequired : 01     */
                            /*      CabinetNumber : 00     */
                            /*     CardCageNumber : 00     */
                            /*          Reference : 00     */
                            /*           Rotation : 00     */
                            /*              Order : 00     */
                            /*     VerticalOffset : 0000   */
                            /*   HorizontalOffset : 0000   */
                            }
                        })
                    }

                    Device (PRT2)
                    {
                        Name (_ADR, 0x02)  // _ADR: Address
                        Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                        {
                            Zero, 
                            0xFF, 
                            Zero, 
                            Zero
                        })
                        Name (_PLD, Package (0x1)  // _PLD: Physical Location of Device
                        {
                            Buffer (0x10) {
                            /* 0000 */   0x81, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                            /* 0008 */   0xA0, 0x10, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
                            /*           Revision : 01     */
                            /*        IgnoreColor : 01     */
                            /*              Color : 000000 */
                            /*              Width : 0000   */
                            /*             Height : 0000   */
                            /*        UserVisible : 00     */
                            /*               Dock : 00     */
                            /*                Lid : 00     */
                            /*              Panel : 04     */
                            /*   VerticalPosition : 02     */
                            /* HorizontalPosition : 00     */
                            /*              Shape : 04     */
                            /*   GroupOrientation : 00     */
                            /*         GroupToken : 00     */
                            /*      GroupPosition : 00     */
                            /*                Bay : 00     */
                            /*          Ejectable : 01     */
                            /*  OspmEjectRequired : 01     */
                            /*      CabinetNumber : 00     */
                            /*     CardCageNumber : 00     */
                            /*          Reference : 00     */
                            /*           Rotation : 00     */
                            /*              Order : 00     */
                            /*     VerticalOffset : 0000   */
                            /*   HorizontalOffset : 0000   */
                            }
                        })
                    }
                }
            }

            Device (SMBS)
            {
                Name (_ADR, 0x00140000)  // _ADR: Address
                OperationRegion (IRQF, PCI_Config, Zero, 0x0100)
                Field (IRQF, AnyAcc, NoLock, Preserve)
                {
                    Offset (0x08), 
                    RVID,   8
                }

                OperationRegion (ERMM, SystemMemory, MMSO, 0x1000)
                Field (ERMM, AnyAcc, NoLock, Preserve)
                {
                    Offset (0x105), 
                        ,   5, 
                    E006,   1, 
                    O006,   1, 
                    I006,   1, 
                        ,   5, 
                    E007,   1, 
                    O007,   1, 
                    I007,   1, 
                    Offset (0x10A), 
                        ,   5, 
                    E011,   1, 
                    O011,   1, 
                    I011,   1, 
                        ,   5, 
                    E012,   1, 
                    O012,   1, 
                    I012,   1, 
                        ,   5, 
                    E013,   1, 
                    O013,   1, 
                    I013,   1, 
                        ,   5, 
                    E014,   1, 
                    O014,   1, 
                    I014,   1, 
                        ,   5, 
                    E015,   1, 
                    O015,   1, 
                    I015,   1, 
                        ,   5, 
                    E016,   1, 
                    O016,   1, 
                    I016,   1, 
                    Offset (0x113), 
                        ,   5, 
                    E020,   1, 
                    O020,   1, 
                    I020,   1, 
                        ,   5, 
                    E021,   1, 
                    O021,   1, 
                    I021,   1, 
                        ,   5, 
                    E022,   1, 
                    O022,   1, 
                    I022,   1, 
                        ,   5, 
                    E023,   1, 
                    O023,   1, 
                    I023,   1, 
                    Offset (0x11A), 
                        ,   5, 
                    E027,   1, 
                    O027,   1, 
                    I027,   1, 
                        ,   5, 
                    E028,   1, 
                    O028,   1, 
                    I028,   1, 
                    Offset (0x11F), 
                        ,   5, 
                    E032,   1, 
                    O032,   1, 
                    I032,   1, 
                        ,   5, 
                    E033,   1, 
                    O033,   1, 
                    I033,   1, 
                    Offset (0x122), 
                        ,   5, 
                    E035,   1, 
                    O035,   1, 
                    I035,   1, 
                    Offset (0x128), 
                        ,   1, 
                    H041,   1, 
                    S041,   1, 
                    U041,   1, 
                    D041,   1, 
                    E041,   1, 
                    O041,   1, 
                    I041,   1, 
                    Offset (0x12B), 
                        ,   5, 
                    E044,   1, 
                    O044,   1, 
                    I044,   1, 
                        ,   5, 
                    E045,   1, 
                    O045,   1, 
                    I045,   1, 
                        ,   1, 
                    H046,   1, 
                    S046,   1, 
                    U046,   1, 
                    D046,   1, 
                    E046,   1, 
                    O046,   1, 
                    I046,   1, 
                    Offset (0x132), 
                        ,   5, 
                    E051,   1, 
                    O051,   1, 
                    I051,   1, 
                    Offset (0x134), 
                        ,   5, 
                    E053,   1, 
                    O053,   1, 
                    I053,   1, 
                    Offset (0x136), 
                        ,   5, 
                    E055,   1, 
                    O055,   1, 
                    I055,   1, 
                    Offset (0x138), 
                        ,   5, 
                    E057,   1, 
                    O057,   1, 
                    I057,   1, 
                        ,   5, 
                    E058,   1, 
                    O058,   1, 
                    I058,   1, 
                        ,   5, 
                    E059,   1, 
                    O059,   1, 
                    I059,   1, 
                    Offset (0x13C), 
                        ,   1, 
                    H061,   1, 
                    S061,   1, 
                    U061,   1, 
                    D061,   1, 
                    E061,   1, 
                    O061,   1, 
                    I061,   1, 
                        ,   1, 
                    H062,   1, 
                    S062,   1, 
                    U062,   1, 
                    D062,   1, 
                    E062,   1, 
                    O062,   1, 
                    I062,   1, 
                        ,   1, 
                    H063,   1, 
                    S063,   1, 
                    U063,   1, 
                    D063,   1, 
                    E063,   1, 
                    O063,   1, 
                    I063,   1, 
                        ,   1, 
                    H064,   1, 
                    S064,   1, 
                    U064,   1, 
                    D064,   1, 
                    E064,   1, 
                    O064,   1, 
                    I064,   1, 
                    Offset (0x141), 
                        ,   5, 
                    E066,   1, 
                    O066,   1, 
                    I066,   1, 
                    Offset (0x162), 
                        ,   7, 
                    GE03,   1, 
                        ,   7, 
                    GE04,   1, 
                        ,   7, 
                    GE05,   1, 
                    Offset (0x16A), 
                        ,   7, 
                    GE09,   1, 
                        ,   7, 
                    GE12,   1, 
                    Offset (0x16D), 
                        ,   7, 
                    GE14,   1, 
                        ,   7, 
                    GE15,   1, 
                        ,   7, 
                    GE16,   1, 
                    Offset (0x175), 
                        ,   7, 
                    GE22,   1, 
                    Offset (0x1A5), 
                        ,   5, 
                    E166,   1, 
                    O166,   1, 
                    I166,   1, 
                    Offset (0x1A9), 
                        ,   5, 
                    E170,   1, 
                    O170,   1, 
                    I170,   1, 
                    Offset (0x1AE), 
                        ,   5, 
                    E175,   1, 
                    O175,   1, 
                    I175,   1, 
                        ,   5, 
                    E176,   1, 
                    O176,   1, 
                    I176,   1, 
                        ,   5, 
                    E177,   1, 
                    O177,   1, 
                    I177,   1, 
                        ,   5, 
                    E178,   1, 
                    O178,   1, 
                    I178,   1, 
                        ,   5, 
                    E179,   1, 
                    O179,   1, 
                    I179,   1, 
                        ,   5, 
                    E180,   1, 
                    O180,   1, 
                    I180,   1, 
                        ,   5, 
                    E181,   1, 
                    O181,   1, 
                    I181,   1, 
                        ,   5, 
                    E182,   1, 
                    O182,   1, 
                    I182,   1, 
                    Offset (0x1B7), 
                        ,   3, 
                    U184,   1, 
                    D184,   1, 
                    E184,   1, 
                    O184,   1, 
                    I184,   1, 
                    Offset (0x1C4), 
                        ,   5, 
                    E197,   1, 
                    O197,   1, 
                    I197,   1, 
                    Offset (0x1C7), 
                        ,   5, 
                    E200,   1, 
                    O200,   1, 
                    I200,   1, 
                    Offset (0x1FF), 
                        ,   1, 
                    G01S,   1, 
                        ,   3, 
                    G05S,   1, 
                        ,   8, 
                    G14S,   1, 
                    G15S,   1, 
                    G16S,   1, 
                        ,   5, 
                    G22S,   1, 
                    G23S,   1, 
                    Offset (0x203), 
                        ,   1, 
                    G01E,   1, 
                        ,   3, 
                    G05E,   1, 
                        ,   8, 
                    G14E,   1, 
                    G15E,   1, 
                    G16E,   1, 
                        ,   5, 
                    G22E,   1, 
                    G23E,   1, 
                    Offset (0x207), 
                        ,   1, 
                    G01T,   1, 
                        ,   3, 
                    G05T,   1, 
                        ,   8, 
                    G14T,   1, 
                    G15T,   1, 
                    G16T,   1, 
                        ,   5, 
                    G22T,   1, 
                    G23T,   1, 
                    Offset (0x20B), 
                        ,   1, 
                    G01L,   1, 
                        ,   3, 
                    G05L,   1, 
                        ,   9, 
                    G15L,   1, 
                    G16L,   1, 
                        ,   5, 
                    G22L,   1, 
                    G23L,   1, 
                    Offset (0x287), 
                        ,   1, 
                    CLPS,   1, 
                    Offset (0x298), 
                        ,   7, 
                    G15A,   1, 
                    Offset (0x2AF), 
                        ,   2, 
                    SLPS,   2, 
                    Offset (0x32B), 
                    SM0E,   1, 
                    Offset (0x32D), 
                        ,   1, 
                    SM0S,   2, 
                    Offset (0x361), 
                        ,   6, 
                    MT3A,   1, 
                    Offset (0x376), 
                    EPNM,   1, 
                    DPPF,   1, 
                    Offset (0x3BA), 
                        ,   6, 
                    PWDE,   1, 
                    Offset (0x3BD), 
                        ,   5, 
                    ALLS,   1, 
                    Offset (0x3C7), 
                        ,   2, 
                    TFTE,   1, 
                    Offset (0x3DE), 
                    BLNK,   2, 
                    Offset (0x3EF), 
                    PHYD,   1, 
                    Offset (0x3FF), 
                    F0CT,   8, 
                    F0MS,   8, 
                    F0FQ,   8, 
                    F0LD,   8, 
                    F0MD,   8, 
                    F0MP,   8, 
                    LT0L,   8, 
                    LT0H,   8, 
                    MT0L,   8, 
                    MT0H,   8, 
                    HT0L,   8, 
                    HT0H,   8, 
                    LRG0,   8, 
                    LHC0,   8, 
                    Offset (0x40F), 
                    F1CT,   8, 
                    F1MS,   8, 
                    F1FQ,   8, 
                    F1LD,   8, 
                    F1MD,   8, 
                    F1MP,   8, 
                    LT1L,   8, 
                    LT1H,   8, 
                    MT1L,   8, 
                    MT1H,   8, 
                    HT1L,   8, 
                    HT1H,   8, 
                    LRG1,   8, 
                    LHC1,   8, 
                    Offset (0x41F), 
                    F2CT,   8, 
                    F2MS,   8, 
                    F2FQ,   8, 
                    F2LD,   8, 
                    F2MD,   8, 
                    F2MP,   8, 
                    LT2L,   8, 
                    LT2H,   8, 
                    MT2L,   8, 
                    MT2H,   8, 
                    HT2L,   8, 
                    HT2H,   8, 
                    LRG2,   8, 
                    LHC2,   8, 
                    Offset (0x42F), 
                    F3CT,   8, 
                    F3MS,   8, 
                    F3FQ,   8, 
                    F3LD,   8, 
                    F3MD,   8, 
                    F3MP,   8, 
                    LT3L,   8, 
                    LT3H,   8, 
                    MT3L,   8, 
                    MT3H,   8, 
                    HT3L,   8, 
                    HT3H,   8, 
                    LRG3,   8, 
                    LHC3,   8, 
                    Offset (0x6FF), 
                    SEC,    8, 
                    Offset (0x701), 
                    MIN,    8, 
                    Offset (0xD06), 
                    MX07,   8, 
                    Offset (0xD0E), 
                    MX15,   8, 
                    MX16,   8, 
                    Offset (0xD14), 
                    MX21,   8, 
                    MX22,   8, 
                    MX23,   8, 
                    Offset (0xD1A), 
                    MX27,   8, 
                    MX28,   8, 
                    Offset (0xD1F), 
                    MX32,   8, 
                    MX33,   8, 
                    Offset (0xD2B), 
                    MX44,   8, 
                    Offset (0xD34), 
                    MX53,   8, 
                    Offset (0xD36), 
                    MX55,   8, 
                    Offset (0xD38), 
                    MX57,   8, 
                    MX58,   8, 
                    MX59,   8, 
                    Offset (0xD41), 
                    MX66,   8, 
                    Offset (0xD65), 
                    M102,   8, 
                    Offset (0xD6D), 
                    M110,   8, 
                    Offset (0xDA9), 
                    M170,   8, 
                    Offset (0xDAE), 
                    M175,   8, 
                    M176,   8, 
                    M177,   8, 
                    Offset (0xDB3), 
                    M180,   8, 
                    Offset (0xDB5), 
                    M182,   8, 
                    Offset (0xDC4), 
                    M197,   8, 
                    Offset (0xDC7), 
                    M200,   8, 
                    Offset (0xDFF), 
                    MS00,   8, 
                    MS01,   8, 
                    MS02,   8, 
                    MS03,   8, 
                    MS04,   8, 
                    Offset (0xE3F), 
                    MS40,   8, 
                    Offset (0xE80), 
                        ,   2, 
                    ECES,   1
                }

                Mutex (SBX0, 0x00)
                OperationRegion (SMB0, SystemIO, 0x0B00, 0x10)
                Field (SMB0, ByteAcc, NoLock, Preserve)
                {
                    HST0,   8, 
                    SLV0,   8, 
                    CNT0,   8, 
                    CMD0,   8, 
                    ADD0,   8, 
                    DT00,   8, 
                    DT10,   8, 
                    BLK0,   8
                }

                Method (WBD0, 1, NotSerialized)
                {
                    Store (Arg0, Local0)
                    Store (Zero, Local2)
                    Store (HST0, Local3)
                    Store (And (Local3, 0x80), Local1)
                    While (LNotEqual (Local1, 0x80))
                    {
                        If (LLess (Local0, 0x0A))
                        {
                            Store (0x18, Local2)
                            Store (Zero, Local1)
                        }
                        Else
                        {
                            Sleep (0x0A)
                            Subtract (Local0, 0x0A, Local0)
                            Store (HST0, Local3)
                            Store (And (Local3, 0x80), Local1)
                        }
                    }

                    If (LNotEqual (Local2, 0x18))
                    {
                        Store (And (HST0, 0x1C), Local1)
                        If (Local1)
                        {
                            Store (0x07, Local2)
                        }
                    }

                    Return (Local2)
                }

                Method (WTC0, 1, NotSerialized)
                {
                    Store (Arg0, Local0)
                    Store (0x07, Local2)
                    Store (One, Local1)
                    While (LEqual (Local1, One))
                    {
                        Store (And (HST0, 0x1D), Local3)
                        If (LNotEqual (Local3, Zero))
                        {
                            If (LEqual (Local3, One))
                            {
                                If (LLess (Local0, 0x0A))
                                {
                                    Store (0x18, Local2)
                                    Store (Zero, Local1)
                                }
                                Else
                                {
                                    Sleep (0x0A)
                                    Subtract (Local0, 0x0A, Local0)
                                }
                            }
                            Else
                            {
                                Store (0x07, Local2)
                                Store (Zero, Local1)
                            }
                        }
                        Else
                        {
                            Store (Zero, Local2)
                            Store (Zero, Local1)
                        }
                    }

                    Store (Or (HST0, 0x1F), HST0)
                    Return (Local2)
                }

                Method (SBR0, 3, NotSerialized)
                {
                    Store (Package (0x03)
                        {
                            0x07, 
                            Zero, 
                            Zero
                        }, Local0)
                    Store (And (Arg0, 0x5F), Local4)
                    If (LNotEqual (Local4, 0x03))
                    {
                        If (LNotEqual (Local4, 0x05))
                        {
                            If (LNotEqual (Local4, 0x07))
                            {
                                If (LNotEqual (Local4, 0x09))
                                {
                                    If (LNotEqual (Local4, 0x0B))
                                    {
                                        Store (0x19, Index (Local0, Zero))
                                        Return (Local0)
                                    }
                                }
                            }
                        }
                    }

                    If (LEqual (Acquire (SBX0, 0xFFFF), Zero))
                    {
                        Store (Or (ShiftLeft (Arg1, One), One), ADD0)
                        Store (Arg2, CMD0)
                        Store (Or (HST0, 0x1F), HST0)
                        Store (And (Arg0, 0xA0), Local1)
                        Store (Or (And (CNT0, 0x5F), Local1), CNT0)
                        If (LEqual (Local4, 0x03))
                        {
                            Store (Or (And (CNT0, 0xA0), 0x40), CNT0)
                        }

                        If (LEqual (Local4, 0x05))
                        {
                            Store (Or (And (CNT0, 0xA0), 0x44), CNT0)
                        }

                        If (LEqual (Local4, 0x07))
                        {
                            Store (Or (And (CNT0, 0xA0), 0x48), CNT0)
                        }

                        If (LEqual (Local4, 0x09))
                        {
                            Store (Or (And (CNT0, 0xA0), 0x4C), CNT0)
                        }

                        If (LEqual (Local4, 0x0B))
                        {
                            Store (Or (HST0, 0x80), HST0)
                            Store (Zero, DT00)
                            Store (Or (And (CNT0, 0xA0), 0x54), CNT0)
                        }

                        Store (WTC0 (0x03E8), Local1)
                        Store (Local1, Index (Local0, Zero))
                        If (LEqual (Local1, Zero))
                        {
                            If (LEqual (Local4, 0x05))
                            {
                                Store (One, Index (Local0, One))
                                Store (DT00, Index (Local0, 0x02))
                            }

                            If (LEqual (Local4, 0x07))
                            {
                                Store (One, Index (Local0, One))
                                Store (DT00, Index (Local0, 0x02))
                            }

                            If (LEqual (Local4, 0x09))
                            {
                                Store (0x02, Index (Local0, One))
                                Store (DT10, Local2)
                                ShiftLeft (Local2, 0x08, Local2)
                                Add (Local2, DT00, Local2)
                                Store (Local2, Index (Local0, 0x02))
                            }

                            If (LEqual (Local4, 0x0B))
                            {
                                Store (WBD0 (0x01F4), Local1)
                                If (LNotEqual (Local1, Zero))
                                {
                                    Store (Local1, Index (Local0, Zero))
                                }
                                Else
                                {
                                    Store (DT00, Index (Local0, One))
                                    Store (DT00, Local1)
                                    Store (CNT0, Local2)
                                    Store (Zero, Local2)
                                    While (LLess (Local2, Local1))
                                    {
                                        Add (0x02, Local2, Local3)
                                        Store (BLK0, Index (Local0, Local3))
                                        Add (One, Local2, Local2)
                                    }

                                    Store (Or (HST0, 0x80), HST0)
                                }
                            }
                        }

                        Store (And (CNT0, 0x5F), CNT0)
                        Release (SBX0)
                    }

                    Return (Local0)
                }

                Method (SBW0, 5, NotSerialized)
                {
                    Store (Package (0x01)
                        {
                            0x07
                        }, Local0)
                    Store (And (Arg0, 0x5F), Local4)
                    If (LNotEqual (Local4, 0x02))
                    {
                        If (LNotEqual (Local4, 0x04))
                        {
                            If (LNotEqual (Local4, 0x06))
                            {
                                If (LNotEqual (Local4, 0x08))
                                {
                                    If (LNotEqual (Local4, 0x0A))
                                    {
                                        Store (0x19, Index (Local0, Zero))
                                        Return (Local0)
                                    }
                                }
                            }
                        }
                    }

                    If (LEqual (Acquire (SBX0, 0xFFFF), Zero))
                    {
                        Store (ShiftLeft (Arg1, One), ADD0)
                        Store (Arg2, CMD0)
                        Store (Or (HST0, 0x1F), HST0)
                        Store (And (Arg0, 0xA0), Local1)
                        Store (Or (And (CNT0, 0x5F), Local1), CNT0)
                        If (LEqual (Local4, 0x02))
                        {
                            Store (Or (And (CNT0, 0xA0), 0x40), CNT0)
                        }

                        If (LEqual (Local4, 0x04))
                        {
                            Store (Or (And (CNT0, 0xA0), 0x44), CNT0)
                        }

                        If (LEqual (Local4, 0x06))
                        {
                            Store (Arg4, DT00)
                            Store (Or (And (CNT0, 0xA0), 0x48), CNT0)
                        }

                        If (LEqual (Local4, 0x08))
                        {
                            And (Arg4, 0xFF, DT00)
                            ShiftRight (Arg4, 0x08, DT10)
                            Store (Or (And (CNT0, 0xA0), 0x4C), CNT0)
                        }

                        If (LEqual (Local4, 0x0A))
                        {
                            Store (Or (HST0, 0x80), HST0)
                            Store (CNT0, Local1)
                            Store (Arg3, DT00)
                            Store (Zero, Local2)
                            While (LLess (Local2, Arg3))
                            {
                                Store (Index (Arg4, Local2), BLK0)
                                Add (One, Local2, Local2)
                            }

                            Store (Or (And (CNT0, 0xA0), 0x54), CNT0)
                        }

                        Store (WTC0 (0x03E8), Index (Local0, Zero))
                        Store (And (CNT0, 0x5F), CNT0)
                        Release (SBX0)
                    }

                    Return (Local0)
                }
            }

            Device (LPC0)
            {
                Name (_ADR, 0x00140003)  // _ADR: Address
                Mutex (PSMX, 0x00)
                Device (DMAC)
                {
                    Name (_HID, EisaId ("PNP0200"))  // _HID: Hardware ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x0000,             // Range Minimum
                            0x0000,             // Range Maximum
                            0x01,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x0081,             // Range Minimum
                            0x0081,             // Range Maximum
                            0x01,               // Alignment
                            0x0F,               // Length
                            )
                        IO (Decode16,
                            0x00C0,             // Range Minimum
                            0x00C0,             // Range Maximum
                            0x01,               // Alignment
                            0x20,               // Length
                            )
                        DMA (Compatibility, NotBusMaster, Transfer8_16, )
                            {4}
                    })
                }

                Device (COPR)
                {
                    Name (_HID, EisaId ("PNP0C04"))  // _HID: Hardware ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x00F0,             // Range Minimum
                            0x00F0,             // Range Maximum
                            0x01,               // Alignment
                            0x0F,               // Length
                            )
                        IRQNoFlags ()
                            {13}
                    })
                }

                Device (PIC)
                {
                    Name (_HID, EisaId ("PNP0000"))  // _HID: Hardware ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x0020,             // Range Minimum
                            0x0020,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x00A0,             // Range Minimum
                            0x00A0,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IRQNoFlags ()
                            {2}
                    })
                }

                Device (RTC)
                {
                    Name (_HID, EisaId ("PNP0B00"))  // _HID: Hardware ID
                    Name (BUF0, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0070,             // Range Minimum
                            0x0070,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                    })
                    Name (BUF1, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0070,             // Range Minimum
                            0x0070,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IRQNoFlags ()
                            {8}
                    })
                    Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
                    {
                        If (LEqual (And (HPAD, 0x03), 0x03))
                        {
                            Return (BUF0)
                        }

                        Return (BUF1)
                    }
                }

                Device (TMR)
                {
                    Name (_HID, EisaId ("PNP0100"))  // _HID: Hardware ID
                    Name (BUF0, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0040,             // Range Minimum
                            0x0040,             // Range Maximum
                            0x01,               // Alignment
                            0x04,               // Length
                            )
                    })
                    Name (BUF1, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0040,             // Range Minimum
                            0x0040,             // Range Maximum
                            0x01,               // Alignment
                            0x04,               // Length
                            )
                        IRQNoFlags ()
                            {0}
                    })
                    Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
                    {
                        If (LEqual (And (HPAD, 0x03), 0x03))
                        {
                            Return (BUF0)
                        }

                        Return (BUF1)
                    }
                }

                Device (KBC0)
                {
                    Name (_HID, EisaId ("PNP0303"))  // _HID: Hardware ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x0060,             // Range Minimum
                            0x0060,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0064,             // Range Minimum
                            0x0064,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IRQNoFlags ()
                            {1}
                    })
                }

                Device (PS2M)
                {
                    Name (_HID, EisaId ("SYN1E46"))  // _HID: Hardware ID
                    Name (_CID, Package (0x03)  // _CID: Compatible ID
                    {
                        EisaId ("SYN1E00"), 
                        EisaId ("SYN0002"), 
                        EisaId ("PNP0F13")
                    })
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IRQNoFlags ()
                            {12}
                    })
                }

                Device (SYSR)
                {
                    Name (_HID, EisaId ("PNP0C02"))  // _HID: Hardware ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x0010,             // Range Minimum
                            0x0010,             // Range Maximum
                            0x01,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x002E,             // Range Minimum
                            0x002E,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0072,             // Range Minimum
                            0x0072,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0080,             // Range Minimum
                            0x0080,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x00B0,             // Range Minimum
                            0x00B0,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0092,             // Range Minimum
                            0x0092,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0400,             // Range Minimum
                            0x0400,             // Range Maximum
                            0x01,               // Alignment
                            0xD0,               // Length
                            )
                        IO (Decode16,
                            0x04D0,             // Range Minimum
                            0x04D0,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x04D6,             // Range Minimum
                            0x04D6,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0680,             // Range Minimum
                            0x0680,             // Range Maximum
                            0x01,               // Alignment
                            0x80,               // Length
                            )
                        IO (Decode16,
                            0x077A,             // Range Minimum
                            0x077A,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0C00,             // Range Minimum
                            0x0C00,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0C14,             // Range Minimum
                            0x0C14,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0C50,             // Range Minimum
                            0x0C50,             // Range Maximum
                            0x01,               // Alignment
                            0x03,               // Length
                            )
                        IO (Decode16,
                            0x0C6C,             // Range Minimum
                            0x0C6C,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0C6F,             // Range Minimum
                            0x0C6F,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0CD0,             // Range Minimum
                            0x0CD0,             // Range Maximum
                            0x01,               // Alignment
                            0x0C,               // Length
                            )
                        IO (Decode16,
                            0x0840,             // Range Minimum
                            0x0840,             // Range Maximum
                            0x01,               // Alignment
                            0x08,               // Length
                            )
                    })
                }

                Device (MEM)
                {
                    Name (_HID, EisaId ("PNP0C01"))  // _HID: Hardware ID
                    Name (MSRC, ResourceTemplate ()
                    {
                        Memory32Fixed (ReadOnly,
                            0x000E0000,         // Address Base
                            0x00020000,         // Address Length
                            )
                        Memory32Fixed (ReadWrite,
                            0xFFF00000,         // Address Base
                            0x00100000,         // Address Length
                            _Y04)
                    })
                    Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                    {
                        CreateDWordField (MSRC, \_SB.PCI0.LPC0.MEM._Y04._LEN, PSIZ)  // _LEN: Length
                        CreateDWordField (MSRC, \_SB.PCI0.LPC0.MEM._Y04._BAS, PBAS)  // _BAS: Base Address
                        Store (ROMS, PSIZ)
                        Subtract (ROMS, One, Local0)
                        Subtract (Ones, Local0, PBAS)
                        Return (MSRC)
                    }
                }

                OperationRegion (LCLM, SystemIO, 0x0C50, 0x03)
                Field (LCLM, ByteAcc, NoLock, Preserve)
                {
                    CLMI,   8, 
                    CLMD,   8, 
                    CLGP,   8
                }

                IndexField (CLMI, CLMD, ByteAcc, NoLock, Preserve)
                {
                    IDRG,   8, 
                    Offset (0x02), 
                    TSTS,   8, 
                    TINT,   8, 
                    Offset (0x12), 
                    I2CC,   8, 
                    GPIO,   8
                }

                Method (RGPM, 0, NotSerialized)
                {
                    Store (GPIO, Local0)
                    And (Local0, 0xFFFFFF3F, Local0)
                    Store (Local0, GPIO)
                    Store (CLGP, Local1)
                    Return (Local1)
                }

                Device (EC)
                {
                    Name (_HID, EisaId ("PNP0C09"))  // _HID: Hardware ID
                    Name (_UID, One)  // _UID: Unique ID
                    Name (ECOK, Zero)
                    Name (_GPE, 0x16)  // _GPE: General Purpose Events
                    Mutex (MTX2, 0x00)
                    Name (THFG, Zero)
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x0062,             // Range Minimum
                            0x0062,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0066,             // Range Minimum
                            0x0066,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0068,             // Range Minimum
                            0x0068,             // Range Maximum
                            0x00,               // Alignment
                            0x05,               // Length
                            )
                    })
                    Method (_REG, 2, NotSerialized)  // _REG: Region Availability
                    {
                        If (LEqual (Arg0, 0x03))
                        {
                            Store (Arg1, ECOK)
                            Store (Arg1, ECOK)
                            If (_OSI ("Windows 2009"))
                            {
                                Store (One, WN7)
                            }
                        }
                    }

                    OperationRegion (ECF2, EmbeddedControl, Zero, 0xFF)
                    Field (ECF2, ByteAcc, Lock, Preserve)
                    {
                        Offset (0x02), 
                        UMAF,   1, 
                            ,   6, 
                        LPMF,   1, 
                        Offset (0x08), 
                        BDNB,   112, 
                        Offset (0x20), 
                        RTTE,   16, 
                        ATTE,   16, 
                        ATTF,   16, 
                        AVGC,   16, 
                        CHGV,   16, 
                        CHGC,   16, 
                        Offset (0x2F), 
                            ,   2, 
                        HOT4,   1, 
                        Offset (0x30), 
                        CTL,    128, 
                        Offset (0x42), 
                        GPRT,   8, 
                        GCMD,   8, 
                        GDA0,   8, 
                        GSTS,   7, 
                        GBRQ,   1, 
                        Offset (0x53), 
                        WSCR,   8, 
                        WTTS,   1, 
                        WRFG,   1, 
                        WWFG,   1, 
                        Offset (0x56), 
                            ,   2, 
                        ADDC,   1, 
                        OWAN,   1, 
                        FTCM,   1, 
                            ,   1, 
                        TRIC,   1, 
                        ACSC,   1, 
                        QKL,    8, 
                        QKH,    8, 
                        ACCS,   8, 
                        MMS,    8, 
                        DMS,    8, 
                        Offset (0x5E), 
                        W2BS,   8, 
                        W2BR,   8, 
                        W2BG,   8, 
                        Offset (0x62), 
                        HOT,    8, 
                        CRT,    8, 
                        Offset (0x65), 
                        PWM,    8, 
                        WN7,    1, 
                        VIS,    1, 
                        WXP,    1, 
                        Offset (0x67), 
                        WOL,    1, 
                        WOU,    1, 
                        WOR,    1, 
                        Offset (0x70), 
                        BSW,    16, 
                        WDA0,   8, 
                        Offset (0x7A), 
                        CRI,    8, 
                        Offset (0x7E), 
                        ECV,    16, 
                        Offset (0x81), 
                        SLP,    8, 
                            ,   2, 
                        ACP,    1, 
                        SMO,    1, 
                            ,   2, 
                        DFN,    1, 
                        B50,    1, 
                        LDS,    1, 
                            ,   3, 
                        TPS,    1, 
                            ,   2, 
                        ACOV,   1, 
                        ADP,    1, 
                        S3L,    1, 
                        BATP,   1, 
                            ,   1, 
                        BCNL,   1, 
                        BCCL,   1, 
                        BF25,   1, 
                        Offset (0x89), 
                        BDC,    16, 
                        Offset (0x8D), 
                        BFC,    16, 
                        BCY,    16, 
                        BTEC,   16, 
                        Offset (0x95), 
                        BDV,    16, 
                        Offset (0x99), 
                        BST,    16, 
                        Offset (0x9D), 
                        BPR,    16, 
                        Offset (0xA1), 
                        BRC,    16, 
                        Offset (0xA5), 
                        BPV,    16, 
                        Offset (0xA9), 
                        BMD,    16, 
                        Offset (0xAD), 
                        BCW,    16, 
                        Offset (0xB1), 
                        BCL,    16, 
                        Offset (0xB5), 
                        BG1,    16, 
                        Offset (0xBD), 
                        BMN,    16, 
                        Offset (0xC1), 
                        BTN,    64, 
                        BSN,    16, 
                        Offset (0xD1), 
                        BTY,    16, 
                        Offset (0xD9), 
                        BC4,    16, 
                        BC3,    16, 
                        BC2,    16, 
                        BC1,    16, 
                        CTS,    8, 
                        CT0,    8, 
                        CT1,    8, 
                        CT2,    8, 
                        CPT0,   8, 
                        SAS,    8, 
                        BTT,    16, 
                        Offset (0xEB), 
                        BPP,    8, 
                        Offset (0xEE), 
                        BPC,    1, 
                        BPF,    1, 
                        BPW,    1, 
                        BPT,    1, 
                        Offset (0xF0), 
                        LCBD,   4, 
                        LCBA,   4, 
                        Offset (0xF3), 
                        FAO,    1, 
                        FST,    1, 
                        PAE,    1, 
                            ,   1, 
                        QLB,    1, 
                        Offset (0xF5), 
                        WLS,    1, 
                            ,   1, 
                        WWS,    1, 
                        GPSS,   1, 
                        WLD,    1, 
                        WWD,    1, 
                        GPSD,   1, 
                        LTEC,   1, 
                        BTS,    1, 
                            ,   3, 
                        BTD,    1, 
                        Offset (0xF7), 
                        FAT,    8, 
                        BAB,    8, 
                        GLD,    1, 
                        Offset (0xFA), 
                        FSD,    8, 
                        TAU,    1, 
                        TCM,    1, 
                        TLG,    1, 
                        TSA,    1
                    }

                    Method (EGRW, 3, NotSerialized)
                    {
                        Store (0xFF, Local0)
                        Store (Arg0, GPRT)
                        Store (Arg1, GCMD)
                        Store (Arg2, GDA0)
                        Store (Zero, GSTS)
                        Store (One, GBRQ)
                        While (GBRQ)
                        {
                            Sleep (0x0A)
                        }

                        If (LEqual (GPRT, 0x07))
                        {
                            Store (GDA0, Local0)
                        }
                        Else
                        {
                            And (GSTS, 0x1F, Local0)
                        }

                        Return (Local0)
                    }

                    Method (_Q03, 0, NotSerialized)  // _Qxx: EC Query
                    {
                        Store (0x03, IO80)
                        Notify (BAT0, 0x80)
                    }

                    Method (_Q04, 0, NotSerialized)  // _Qxx: EC Query
                    {
                        Store (0x04, IO80)
                        Notify (BAT0, 0x80)
                    }

                    Method (_Q06, 0, NotSerialized)  // _Qxx: EC Query
                    {
                        Store (0x06, IO80)
                        If (ADP)
                        {
                            Store (Zero, ADDC)
                            Store (Zero, ACSC)
                            Store (Zero, FTCM)
                            Notify (BAT0, Zero)
                            Notify (BAT0, 0x80)
                        }
                        Else
                        {
                            Notify (BAT0, One)
                            Notify (BAT0, 0x80)
                        }

                        Store (0x03, ^^^^WMID.WMIU)
                        Store (Zero, ^^^^WMID.WMIV)
                        Notify (WMID, 0x80)
                    }

                    Method (_Q08, 0, NotSerialized)  // _Qxx: EC Query
                    {
                        Store (0x08, IO80)
                        ^^^^BAT0.INUT ()
                        Notify (BAT0, 0x80)
                    }

                    Method (_Q09, 0, NotSerialized)  // _Qxx: EC Query
                    {
                        Store (0x09, IO80)
                        ^^^^BAT0.UBST ()
                        Notify (BAT0, 0x80)
                    }

                    Method (_Q0A, 0, NotSerialized)  // _Qxx: EC Query
                    {
                        Store (0x0A, IO80)
                        Notify (LID, 0x80)
                    }

                    Method (_Q14, 0, NotSerialized)  // _Qxx: EC Query
                    {
                        Store (0x14, IO80)
                        Notify (VGA, 0x80)
                    }

                    Name (BRDN, Zero)
                    Method (_Q17, 0, NotSerialized)  // _Qxx: EC Query
                    {
                        Store (0x17, IO80)
                        Notify (^^^VGA.LCD, 0x87)
                        Store (One, BRDN)
                        If (BRLS)
                        {
                            ^^^VGA.LCD.BRAJ ()
                        }

                        Store (Zero, BRDN)
                    }

                    Name (BRUP, Zero)
                    Method (_Q18, 0, NotSerialized)  // _Qxx: EC Query
                    {
                        Store (0x18, IO80)
                        Notify (^^^VGA.LCD, 0x86)
                        Store (One, BRUP)
                        If (BRLS)
                        {
                            ^^^VGA.LCD.BRAJ ()
                        }

                        Store (Zero, BRUP)
                    }

                    Method (_Q1A, 0, NotSerialized)  // _Qxx: EC Query
                    {
                        Store (0x1A, IO80)
                        Store (One, THFG)
                    }

                    Method (_Q1C, 0, NotSerialized)  // _Qxx: EC Query
                    {
                        Store (0x1C, IO80)
                        Store (One, THFG)
                    }

                    Method (_Q1D, 0, NotSerialized)  // _Qxx: EC Query
                    {
                        Store (0x1D, IO80)
                    }

                    Method (_Q1F, 0, NotSerialized)  // _Qxx: EC Query
                    {
                        Store (0x1F, IO80)
                        Store (Zero, THFG)
                    }

                    Method (_Q20, 0, NotSerialized)  // _Qxx: EC Query
                    {
                        Store (0x20, IO80)
                        _Q1F ()
                        Sleep (0x14)
                        Notify (\_TZ.THRM, 0x80)
                    }

                    Method (_Q37, 0, NotSerialized)  // _Qxx: EC Query
                    {
                        Acquire (MTX2, 0xFFFF)
                        If (LLess (\_PR.C000._PPC, One)) {}
                        Release (MTX2)
                        Store (One, THFG)
                    }

                    Method (_Q38, 0, NotSerialized)  // _Qxx: EC Query
                    {
                        Acquire (MTX2, 0xFFFF)
                        If (LLess (\_PR.C000._PPC, 0x02)) {}
                        Release (MTX2)
                        Store (One, THFG)
                    }

                    Method (_Q39, 0, NotSerialized)  // _Qxx: EC Query
                    {
                        Store (One, THFG)
                    }

                    Method (_Q3A, 0, NotSerialized)  // _Qxx: EC Query
                    {
                        Acquire (MTX2, 0xFFFF)
                        If (LGreater (\_PR.C000._PPC, Zero))
                        {
                            Store (Zero, \_PR.C000._PPC)
                            Notify (\_PR.C000, 0x80)
                        }

                        Release (MTX2)
                        Store (Zero, THFG)
                    }

                    Method (_Q3B, 0, NotSerialized)  // _Qxx: EC Query
                    {
                        Acquire (MTX2, 0xFFFF)
                        If (LGreater (\_PR.C000._PPC, One))
                        {
                            Store (One, \_PR.C000._PPC)
                            Notify (\_PR.C000, 0x80)
                        }

                        Release (MTX2)
                        Store (One, THFG)
                    }

                    Method (_Q3C, 0, NotSerialized)  // _Qxx: EC Query
                    {
                        Store (One, THFG)
                    }

                    Name (WLSL, One)
                    Name (BTSL, One)
                    Name (WWSL, One)
                    Name (WLAS, One)
                    Method (_Q43, 0, NotSerialized)  // _Qxx: EC Query
                    {
                        Store (0x43, IO80)
                        If (BTNS)
                        {
                            Store (Zero, BTNS)
                            Store (Zero, BTNB)
                            If (WLS)
                            {
                                Store (Zero, WLD)
                            }

                            If (BTS)
                            {
                                Store (Zero, BTD)
                            }

                            If (WWS)
                            {
                                Store (Zero, WWD)
                            }
                        }
                        Else
                        {
                            Store (One, BTNS)
                            Store (One, BTNB)
                            If (WLAS)
                            {
                                If (LAnd (WLS, WLSL))
                                {
                                    If (WLWI)
                                    {
                                        Store (One, WLD)
                                    }
                                }

                                If (LAnd (BTS, BTSL))
                                {
                                    If (BTWI)
                                    {
                                        Store (One, BTD)
                                    }
                                }

                                If (LAnd (WWS, WWSL))
                                {
                                    If (WWWI)
                                    {
                                        Store (One, WWD)
                                    }
                                }
                            }
                            Else
                            {
                                If (LAnd (WLS, WLSL))
                                {
                                    Store (Zero, WLD)
                                }

                                If (LAnd (BTS, BTSL))
                                {
                                    Store (Zero, BTD)
                                }

                                If (LAnd (WWS, WWSL))
                                {
                                    Store (Zero, WWD)
                                }
                            }
                        }

                        Sleep (0xC8)
                        Store (0x05, ^^^^WMID.WMIU)
                        Store (Zero, ^^^^WMID.WMIV)
                        Notify (WMID, 0x80)
                    }

                    Method (_Q70, 0, NotSerialized)  // _Qxx: EC Query
                    {
                        Store (0x70, IO80)
                        Acquire (MTX2, 0xFFFF)
                        If (LEqual (^^^CPF3.CORN, 0x03))
                        {
                            Store (Zero, \_PR.C003._PPC)
                            Notify (\_PR.C003, 0x80)
                            Store (Zero, \_PR.C002._PPC)
                            Notify (\_PR.C002, 0x80)
                        }

                        Store (Zero, \_PR.C001._PPC)
                        Notify (\_PR.C001, 0x80)
                        Store (Zero, \_PR.C000._PPC)
                        Notify (\_PR.C000, 0x80)
                        Release (MTX2)
                        Store (Zero, THFG)
                    }

                    Method (_Q71, 0, NotSerialized)  // _Qxx: EC Query
                    {
                        Store (0x71, IO80)
                        Acquire (MTX2, 0xFFFF)
                        If (LPMF)
                        {
                            If (LEqual (^^^CPF3.CORN, 0x03))
                            {
                                Store (0x04, \_PR.C003._PPC)
                                Notify (\_PR.C003, 0x80)
                                Store (0x04, \_PR.C002._PPC)
                                Notify (\_PR.C002, 0x80)
                            }

                            Store (0x04, \_PR.C001._PPC)
                            Notify (\_PR.C001, 0x80)
                            Store (0x04, \_PR.C000._PPC)
                            Notify (\_PR.C000, 0x80)
                        }
                        Else
                        {
                            If (LEqual (^^^CPF3.CORN, 0x03))
                            {
                                Store (0x03, \_PR.C003._PPC)
                                Notify (\_PR.C003, 0x80)
                                Store (0x03, \_PR.C002._PPC)
                                Notify (\_PR.C002, 0x80)
                            }

                            Store (0x03, \_PR.C001._PPC)
                            Notify (\_PR.C001, 0x80)
                            Store (0x03, \_PR.C000._PPC)
                            Notify (\_PR.C000, 0x80)
                        }

                        Release (MTX2)
                        Store (One, THFG)
                    }

                    Method (_Q72, 0, NotSerialized)  // _Qxx: EC Query
                    {
                        Store (0x72, IO80)
                        Acquire (MTX2, 0xFFFF)
                        If (LPMF)
                        {
                            Store (0x06, \_PR.C000._PPC)
                            Notify (\_PR.C000, 0x80)
                            Store (0x06, \_PR.C001._PPC)
                            Notify (\_PR.C001, 0x80)
                            If (LEqual (^^^CPF3.CORN, 0x03))
                            {
                                Store (0x06, \_PR.C002._PPC)
                                Notify (\_PR.C002, 0x80)
                                Store (0x06, \_PR.C003._PPC)
                                Notify (\_PR.C003, 0x80)
                            }
                        }
                        Else
                        {
                            Store (0x05, \_PR.C000._PPC)
                            Notify (\_PR.C000, 0x80)
                            Store (0x05, \_PR.C001._PPC)
                            Notify (\_PR.C001, 0x80)
                            If (LEqual (^^^CPF3.CORN, 0x03))
                            {
                                Store (0x05, \_PR.C002._PPC)
                                Notify (\_PR.C002, 0x80)
                                Store (0x05, \_PR.C003._PPC)
                                Notify (\_PR.C003, 0x80)
                            }
                        }

                        Release (MTX2)
                        Store (One, THFG)
                    }

                    Method (_Q73, 0, NotSerialized)  // _Qxx: EC Query
                    {
                        Store (0x73, IO80)
                        If (LEqual (^^^CPF3.CORN, 0x03))
                        {
                            Store (^^^CPF3.PSNM, \_PR.C003._PPC)
                            Notify (\_PR.C003, 0x80)
                            Store (^^^CPF3.PSNM, \_PR.C002._PPC)
                            Notify (\_PR.C002, 0x80)
                            Store (^^^CPF3.PSNM, \_PR.C001._PPC)
                            Notify (\_PR.C001, 0x80)
                            Store (^^^CPF3.PSNM, \_PR.C000._PPC)
                            Notify (\_PR.C000, 0x80)
                        }
                        Else
                        {
                            Store (^^^CPF3.PSNM, \_PR.C001._PPC)
                            Notify (\_PR.C001, 0x80)
                            Store (^^^CPF3.PSNM, \_PR.C000._PPC)
                            Notify (\_PR.C000, 0x80)
                        }

                        Store (One, THFG)
                    }

                    Method (_Q76, 0, NotSerialized)  // _Qxx: EC Query
                    {
                        Store (0x76, IO80)
                        Acquire (MTX2, 0xFFFF)
                        If (LEqual (^^^CPF3.CORN, 0x03))
                        {
                            Store (One, \_PR.C003._PPC)
                            Notify (\_PR.C003, 0x80)
                            Store (One, \_PR.C002._PPC)
                            Notify (\_PR.C002, 0x80)
                        }

                        Store (One, \_PR.C001._PPC)
                        Notify (\_PR.C001, 0x80)
                        Store (One, \_PR.C000._PPC)
                        Notify (\_PR.C000, 0x80)
                        Release (MTX2)
                        Store (One, THFG)
                    }

                    Method (_QCE, 0, NotSerialized)  // _Qxx: EC Query
                    {
                        Store (0xCE, IO80)
                    }

                    Name (BUFR, Buffer (0x04)
                    {
                         0x00, 0x00, 0x00, 0x00
                    })
                    CreateByteField (BUFR, Zero, BF0)
                    CreateByteField (BUFR, One, BF1)
                    CreateByteField (BUFR, 0x02, BF2)
                    CreateByteField (BUFR, 0x03, BF3)
                    CreateBitField (BUFR, Zero, BF00)
                    CreateBitField (BUFR, One, BF01)
                    CreateBitField (BUFR, 0x02, BF02)
                    CreateBitField (BUFR, 0x03, BF03)
                    CreateBitField (BUFR, 0x04, BF04)
                    CreateBitField (BUFR, 0x05, BF05)
                    CreateBitField (BUFR, 0x06, BF06)
                    CreateBitField (BUFR, 0x07, BF07)
                    Name (DISQ, Buffer (0x06)
                    {
                         0x01, 0x02, 0x10, 0x03, 0x11, 0x01
                    })
                    Name (SWIN, 0x06)
                    Method (NSDP, 0, Serialized)
                    {
                        Store (ADDL, BF0)
                        Store (BF00, Local0)
                        Store (BF01, Local1)
                        Store (BF03, Local2)
                        Store (Zero, BF02)
                        Store (Zero, BF03)
                        Store (Local0, BF01)
                        Store (Local1, BF00)
                        Store (Local2, BF04)
                        Store (BF0, ADDL)
                        Store (CSTE, BF0)
                        Store (BF00, Local0)
                        Store (BF01, Local1)
                        Store (BF03, Local2)
                        Store (Zero, BF02)
                        Store (Zero, BF03)
                        Store (Local0, BF01)
                        Store (Local1, BF00)
                        Store (Local2, BF04)
                        Store (BF0, CSTE)
                        Store (Zero, Local0)
                        Store (CSTE, Local1)
                        Store (ADDL, Local2)
                        While (LLess (Local0, SWIN))
                        {
                            Store (DerefOf (Index (DISQ, Local0)), Local3)
                            If (LEqual (Local3, Local1))
                            {
                                While (LLess (Local0, SWIN))
                                {
                                    Store (Local0, Local4)
                                    Increment (Local4)
                                    Store (DerefOf (Index (DISQ, Local4)), Local5)
                                    If (LEqual (And (Local2, Local5), Local5))
                                    {
                                        Store (Local5, NSTE)
                                        Store (SWIN, Local0)
                                    }
                                    Else
                                    {
                                        Increment (Local0)
                                    }
                                }
                            }
                            Else
                            {
                                Increment (Local0)
                            }
                        }
                    }
                }
            }

            Device (P2P)
            {
                Name (_ADR, 0x00140004)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    If (LEqual (WKPM, One))
                    {
                        Return (GPRW (0x04, 0x05))
                    }
                    Else
                    {
                        Return (GPRW (0x04, Zero))
                    }
                }

                OperationRegion (PCPC, PCI_Config, Zero, 0xFF)
                Field (PCPC, ByteAcc, NoLock, Preserve)
                {
                    Offset (0x04), 
                    PCMD,   8, 
                    Offset (0x1C), 
                    IOW1,   8, 
                    IOW2,   8, 
                    Offset (0x48), 
                    PR48,   8, 
                    PR49,   8, 
                    PR4A,   8, 
                    PR4B,   8
                }

                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (LEqual (GPIC, Zero))
                    {
                        Return (PIC)
                    }
                    Else
                    {
                        Return (APIC)
                    }
                }

                Name (PIC, Package (0x0E)
                {
                    Package (0x04)
                    {
                        0x0004FFFF, 
                        Zero, 
                        LNKE, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0x0004FFFF, 
                        One, 
                        LNKF, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0x0005FFFF, 
                        Zero, 
                        LNKE, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0x0005FFFF, 
                        One, 
                        LNKF, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0x0005FFFF, 
                        0x02, 
                        LNKG, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0x0005FFFF, 
                        0x03, 
                        LNKH, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0x0006FFFF, 
                        Zero, 
                        LNKF, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0x0006FFFF, 
                        One, 
                        LNKG, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0x0006FFFF, 
                        0x02, 
                        LNKH, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0x0006FFFF, 
                        0x03, 
                        LNKE, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0x0007FFFF, 
                        Zero, 
                        LNKG, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0x0007FFFF, 
                        One, 
                        LNKH, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0x0007FFFF, 
                        0x02, 
                        LNKE, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0x0007FFFF, 
                        0x03, 
                        LNKF, 
                        Zero
                    }
                })
                Name (APIC, Package (0x0E)
                {
                    Package (0x04)
                    {
                        0x0004FFFF, 
                        Zero, 
                        Zero, 
                        0x14
                    }, 

                    Package (0x04)
                    {
                        0x0004FFFF, 
                        One, 
                        Zero, 
                        0x15
                    }, 

                    Package (0x04)
                    {
                        0x0005FFFF, 
                        Zero, 
                        Zero, 
                        0x14
                    }, 

                    Package (0x04)
                    {
                        0x0005FFFF, 
                        One, 
                        Zero, 
                        0x15
                    }, 

                    Package (0x04)
                    {
                        0x0005FFFF, 
                        0x02, 
                        Zero, 
                        0x16
                    }, 

                    Package (0x04)
                    {
                        0x0005FFFF, 
                        0x03, 
                        Zero, 
                        0x17
                    }, 

                    Package (0x04)
                    {
                        0x0006FFFF, 
                        Zero, 
                        Zero, 
                        0x15
                    }, 

                    Package (0x04)
                    {
                        0x0006FFFF, 
                        One, 
                        Zero, 
                        0x16
                    }, 

                    Package (0x04)
                    {
                        0x0006FFFF, 
                        0x02, 
                        Zero, 
                        0x17
                    }, 

                    Package (0x04)
                    {
                        0x0006FFFF, 
                        0x03, 
                        Zero, 
                        0x14
                    }, 

                    Package (0x04)
                    {
                        0x0007FFFF, 
                        Zero, 
                        Zero, 
                        0x16
                    }, 

                    Package (0x04)
                    {
                        0x0007FFFF, 
                        One, 
                        Zero, 
                        0x17
                    }, 

                    Package (0x04)
                    {
                        0x0007FFFF, 
                        0x02, 
                        Zero, 
                        0x14
                    }, 

                    Package (0x04)
                    {
                        0x0007FFFF, 
                        0x03, 
                        Zero, 
                        0x15
                    }
                })
            }

            Device (SATA)
            {
                Name (_ADR, 0x00110000)  // _ADR: Address
                Name (B5EN, Zero)
                Name (BA_5, Zero)
                Name (SBAR, 0xF0450000)
                OperationRegion (SATX, PCI_Config, Zero, 0x28)
                Field (SATX, AnyAcc, NoLock, Preserve)
                {
                    VIDI,   32, 
                    Offset (0x0A), 
                    STCL,   16, 
                    Offset (0x24), 
                    BA05,   32
                }

                Method (GBAA, 0, Serialized)
                {
                    Store (BA05, BA_5)
                    If (LOr (LEqual (BA_5, Ones), LNotEqual (STCL, 0x0101)))
                    {
                        Store (Zero, B5EN)
                        Return (SBAR)
                    }
                    Else
                    {
                        Store (One, B5EN)
                        Return (BA_5)
                    }
                }

                OperationRegion (BAR5, SystemMemory, GBAA (), 0x1000)
                Field (BAR5, AnyAcc, NoLock, Preserve)
                {
                    Offset (0x120), 
                        ,   7, 
                    BSY0,   1, 
                    Offset (0x128), 
                    DET0,   4, 
                    Offset (0x129), 
                    IPM0,   4, 
                    Offset (0x1A0), 
                        ,   7, 
                    BSY1,   1, 
                    Offset (0x1A8), 
                    DET1,   4, 
                    Offset (0x1A9), 
                    IPM1,   4, 
                    Offset (0x220), 
                        ,   7, 
                    BSY2,   1, 
                    Offset (0x228), 
                    DET2,   4, 
                    Offset (0x229), 
                    IPM2,   4, 
                    Offset (0x2A0), 
                        ,   7, 
                    BSY3,   1, 
                    Offset (0x2A8), 
                    DET3,   4, 
                    Offset (0x2A9), 
                    IPM3,   4, 
                    Offset (0x320), 
                        ,   7, 
                    BSY4,   1, 
                    Offset (0x328), 
                    DET4,   4, 
                    Offset (0x329), 
                    IPM4,   4, 
                    Offset (0x3A0), 
                        ,   7, 
                    BSY5,   1, 
                    Offset (0x3A8), 
                    DET5,   4, 
                    Offset (0x3A9), 
                    IPM5,   4
                }

                Method (_INI, 0, NotSerialized)  // _INI: Initialize
                {
                    GBAA ()
                }

                Device (PRID)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Name (SPTM, Buffer (0x14)
                    {
                        /* 0000 */   0x78, 0x00, 0x00, 0x00, 0x0F, 0x00, 0x00, 0x00,
                        /* 0008 */   0x78, 0x00, 0x00, 0x00, 0x0F, 0x00, 0x00, 0x00,
                        /* 0010 */   0x1F, 0x00, 0x00, 0x00
                    })
                    Method (_GTM, 0, NotSerialized)  // _GTM: Get Timing Mode
                    {
                        Return (SPTM)
                    }

                    Method (_STM, 3, NotSerialized)  // _STM: Set Timing Mode
                    {
                        Store (Arg0, SPTM)
                    }

                    Method (_PS0, 0, NotSerialized)  // _PS0: Power State 0
                    {
                        GBAA ()
                        If (LAnd (LOr (LGreaterEqual (TPOS, 0x40), LEqual (TPOS, 0x04)), 
                            B5EN))
                        {
                            If (IPM2)
                            {
                                Store (0x32, Local0)
                                While (LAnd (LEqual (BSY2, One), Local0))
                                {
                                    Sleep (0xFA)
                                    Decrement (Local0)
                                }
                            }
                        }
                    }

                    Method (_PS3, 0, NotSerialized)  // _PS3: Power State 3
                    {
                    }

                    Device (P_D0)
                    {
                        Name (_ADR, Zero)  // _ADR: Address
                        Method (_STA, 0, NotSerialized)  // _STA: Status
                        {
                            GBAA ()
                            If (LEqual (B5EN, Zero))
                            {
                                Return (Zero)
                            }

                            If (LEqual (DET0, 0x03))
                            {
                                Return (0x0F)
                            }
                            Else
                            {
                                Return (Zero)
                            }
                        }

                        Name (S12P, Zero)
                        Method (_PS0, 0, NotSerialized)  // _PS0: Power State 0
                        {
                            GBAA ()
                            If (LAnd (LAnd (LLess (TPOS, 0x40), LNotEqual (TPOS, 0x04)), 
                                B5EN))
                            {
                                Store (0x32, Local0)
                                While (LAnd (LEqual (BSY0, One), Local0))
                                {
                                    Sleep (0xFA)
                                    Decrement (Local0)
                                }
                            }
                        }

                        Method (_PS3, 0, NotSerialized)  // _PS3: Power State 3
                        {
                        }

                        Method (_GTF, 0, NotSerialized)  // _GTF: Get Task File
                        {
                            Store (Buffer (0x07)
                                {
                                     0x03, 0x46, 0x00, 0x00, 0x00, 0xA0, 0xEF
                                }, Local0)
                            Return (Local0)
                        }
                    }

                    Device (P_D1)
                    {
                        Name (_ADR, One)  // _ADR: Address
                        Method (_STA, 0, NotSerialized)  // _STA: Status
                        {
                            GBAA ()
                            If (LEqual (B5EN, Zero))
                            {
                                Return (Zero)
                            }

                            If (LEqual (DET2, 0x03))
                            {
                                Return (0x0F)
                            }
                            Else
                            {
                                Return (Zero)
                            }
                        }

                        Name (S12P, Zero)
                        Method (_PS0, 0, NotSerialized)  // _PS0: Power State 0
                        {
                            GBAA ()
                            If (LAnd (LAnd (LLess (TPOS, 0x40), LNotEqual (TPOS, 0x04)), 
                                B5EN))
                            {
                                Store (0x32, Local0)
                                While (LAnd (LEqual (BSY2, One), Local0))
                                {
                                    Sleep (0xFA)
                                    Decrement (Local0)
                                }
                            }
                        }

                        Method (_PS3, 0, NotSerialized)  // _PS3: Power State 3
                        {
                        }

                        Method (_GTF, 0, NotSerialized)  // _GTF: Get Task File
                        {
                            Store (Buffer (0x07)
                                {
                                     0x03, 0x46, 0x00, 0x00, 0x00, 0xA0, 0xEF
                                }, Local0)
                            Return (Local0)
                        }
                    }
                }

                Device (SECD)
                {
                    Name (_ADR, 0x05)  // _ADR: Address
                    Name (SPTM, Buffer (0x14)
                    {
                        /* 0000 */   0x78, 0x00, 0x00, 0x00, 0x0F, 0x00, 0x00, 0x00,
                        /* 0008 */   0x78, 0x00, 0x00, 0x00, 0x0F, 0x00, 0x00, 0x00,
                        /* 0010 */   0x1F, 0x00, 0x00, 0x00
                    })
                    Method (_GTM, 0, NotSerialized)  // _GTM: Get Timing Mode
                    {
                        Return (SPTM)
                    }

                    Method (_STM, 3, NotSerialized)  // _STM: Set Timing Mode
                    {
                        Store (Arg0, SPTM)
                    }

                    Method (_PS0, 0, NotSerialized)  // _PS0: Power State 0
                    {
                        GBAA ()
                        If (LAnd (LOr (LGreaterEqual (TPOS, 0x40), LEqual (TPOS, 0x04)), 
                            B5EN))
                        {
                            If (IPM1)
                            {
                                Store (0x32, Local0)
                                While (LAnd (LEqual (BSY1, One), Local0))
                                {
                                    Sleep (0xFA)
                                    Decrement (Local0)
                                }
                            }

                            If (IPM3)
                            {
                                Store (0x32, Local0)
                                While (LAnd (LEqual (BSY3, One), Local0))
                                {
                                    Sleep (0xFA)
                                    Decrement (Local0)
                                }
                            }
                        }
                    }

                    Method (_PS3, 0, NotSerialized)  // _PS3: Power State 3
                    {
                    }

                    Device (S_D0)
                    {
                        Name (_ADR, Zero)  // _ADR: Address
                        Method (_STA, 0, NotSerialized)  // _STA: Status
                        {
                            GBAA ()
                            If (LEqual (B5EN, Zero))
                            {
                                Return (Zero)
                            }

                            If (LEqual (DET1, 0x03))
                            {
                                Return (0x0F)
                            }
                            Else
                            {
                                Return (Zero)
                            }
                        }

                        Method (_PS0, 0, NotSerialized)  // _PS0: Power State 0
                        {
                            GBAA ()
                            If (LAnd (LAnd (LLess (TPOS, 0x40), LNotEqual (TPOS, 0x04)), 
                                B5EN))
                            {
                                Store (0x32, Local0)
                                While (LAnd (LEqual (BSY1, One), Local0))
                                {
                                    Sleep (0xFA)
                                    Decrement (Local0)
                                }
                            }
                        }

                        Method (_PS3, 0, NotSerialized)  // _PS3: Power State 3
                        {
                        }

                        Method (_GTF, 0, NotSerialized)  // _GTF: Get Task File
                        {
                            Store (Buffer (0x07)
                                {
                                     0x03, 0x46, 0x00, 0x00, 0x00, 0xA0, 0xEF
                                }, Local0)
                            Return (Local0)
                        }
                    }

                    Device (S_D1)
                    {
                        Name (_ADR, One)  // _ADR: Address
                        Method (_STA, 0, NotSerialized)  // _STA: Status
                        {
                            GBAA ()
                            If (LEqual (B5EN, Zero))
                            {
                                Return (Zero)
                            }

                            If (LEqual (DET3, 0x03))
                            {
                                Return (0x0F)
                            }
                            Else
                            {
                                Return (Zero)
                            }
                        }

                        Method (_PS0, 0, NotSerialized)  // _PS0: Power State 0
                        {
                            GBAA ()
                            If (LAnd (LAnd (LLess (TPOS, 0x40), LNotEqual (TPOS, 0x04)), 
                                B5EN))
                            {
                                Store (0x32, Local0)
                                While (LAnd (LEqual (BSY3, One), Local0))
                                {
                                    Sleep (0xFA)
                                    Decrement (Local0)
                                }
                            }
                        }

                        Method (_PS3, 0, NotSerialized)  // _PS3: Power State 3
                        {
                        }

                        Method (_GTF, 0, NotSerialized)  // _GTF: Get Task File
                        {
                            Store (Buffer (0x07)
                                {
                                     0x03, 0x46, 0x00, 0x00, 0x00, 0xA0, 0xEF
                                }, Local0)
                            Return (Local0)
                        }
                    }
                }

                Device (PRT1)
                {
                    Name (_ADR, One)  // _ADR: Address
                    Device (ODD)
                    {
                        Name (_ADR, Zero)  // _ADR: Address
                    }
                }

                Device (PRT3)
                {
                    Name (_ADR, 0x03)  // _ADR: Address
                    Device (ESAT)
                    {
                        Name (_ADR, Zero)  // _ADR: Address
                        Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                        {
                            Return (One)
                        }
                    }
                }
            }

            Device (IDE)
            {
                Name (_ADR, 0x00140001)  // _ADR: Address
                Name (UDMT, Package (0x08)
                {
                    0x78, 
                    0x5A, 
                    0x3C, 
                    0x2D, 
                    0x1E, 
                    0x14, 
                    Zero, 
                    Zero
                })
                Name (PIOT, Package (0x06)
                {
                    0x0258, 
                    0x0186, 
                    0x010E, 
                    0xB4, 
                    0x78, 
                    Zero
                })
                Name (PITR, Package (0x06)
                {
                    0x99, 
                    0x47, 
                    0x34, 
                    0x22, 
                    0x20, 
                    0x99
                })
                Name (MDMT, Package (0x04)
                {
                    0x01E0, 
                    0x96, 
                    0x78, 
                    Zero
                })
                Name (MDTR, Package (0x04)
                {
                    0x77, 
                    0x21, 
                    0x20, 
                    0xFF
                })
                OperationRegion (IDE, PCI_Config, 0x40, 0x20)
                Field (IDE, WordAcc, NoLock, Preserve)
                {
                    PPIT,   16, 
                    SPIT,   16, 
                    PMDT,   16, 
                    SMDT,   16, 
                    PPIC,   8, 
                    SPIC,   8, 
                    PPIM,   8, 
                    SPIM,   8, 
                    Offset (0x14), 
                    PUDC,   2, 
                    SUDC,   2, 
                    Offset (0x16), 
                    PUDM,   8, 
                    SUDM,   8
                }

                Method (GETT, 1, NotSerialized)
                {
                    Store (And (Arg0, 0x0F), Local0)
                    Store (ShiftRight (Arg0, 0x04), Local1)
                    Return (Multiply (0x1E, Add (Add (Local0, One), Add (Local1, 
                        One))))
                }

                Method (GTM, 1, NotSerialized)
                {
                    CreateByteField (Arg0, Zero, PIT1)
                    CreateByteField (Arg0, One, PIT0)
                    CreateByteField (Arg0, 0x02, MDT1)
                    CreateByteField (Arg0, 0x03, MDT0)
                    CreateByteField (Arg0, 0x04, PICX)
                    CreateByteField (Arg0, 0x05, UDCX)
                    CreateByteField (Arg0, 0x06, UDMX)
                    Name (BUF, Buffer (0x14)
                    {
                        /* 0000 */   0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF,
                        /* 0008 */   0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF,
                        /* 0010 */   0x00, 0x00, 0x00, 0x00
                    })
                    CreateDWordField (BUF, Zero, PIO0)
                    CreateDWordField (BUF, 0x04, DMA0)
                    CreateDWordField (BUF, 0x08, PIO1)
                    CreateDWordField (BUF, 0x0C, DMA1)
                    CreateDWordField (BUF, 0x10, FLAG)
                    If (And (PICX, One))
                    {
                        Return (BUF)
                    }

                    Store (GETT (PIT0), PIO0)
                    Store (GETT (PIT1), PIO1)
                    If (And (UDCX, One))
                    {
                        Or (FLAG, One, FLAG)
                        Store (DerefOf (Index (UDMT, And (UDMX, 0x0F))), DMA0)
                    }
                    Else
                    {
                        If (LNotEqual (MDT0, 0xFF))
                        {
                            Store (GETT (MDT0), DMA0)
                        }
                    }

                    If (And (UDCX, 0x02))
                    {
                        Or (FLAG, 0x04, FLAG)
                        Store (DerefOf (Index (UDMT, ShiftRight (UDMX, 0x04))), DMA1)
                    }
                    Else
                    {
                        If (LNotEqual (MDT1, 0xFF))
                        {
                            Store (GETT (MDT1), DMA1)
                        }
                    }

                    Or (FLAG, 0x1A, FLAG)
                    Return (BUF)
                }

                Method (STM, 3, NotSerialized)
                {
                    CreateDWordField (Arg0, Zero, PIO0)
                    CreateDWordField (Arg0, 0x04, DMA0)
                    CreateDWordField (Arg0, 0x08, PIO1)
                    CreateDWordField (Arg0, 0x0C, DMA1)
                    CreateDWordField (Arg0, 0x10, FLAG)
                    Name (BUF, Buffer (0x07)
                    {
                         0x00, 0x00, 0xFF, 0xFF, 0x00, 0x00, 0x00
                    })
                    CreateByteField (BUF, Zero, PIT1)
                    CreateByteField (BUF, One, PIT0)
                    CreateByteField (BUF, 0x02, MDT1)
                    CreateByteField (BUF, 0x03, MDT0)
                    CreateByteField (BUF, 0x04, PIMX)
                    CreateByteField (BUF, 0x05, UDCX)
                    CreateByteField (BUF, 0x06, UDMX)
                    Store (Match (PIOT, MLE, PIO0, MTR, Zero, Zero), Local0)
                    Divide (Local0, 0x05, Local0)
                    Store (Match (PIOT, MLE, PIO1, MTR, Zero, Zero), Local1)
                    Divide (Local1, 0x05, Local1)
                    Store (Or (ShiftLeft (Local1, 0x04), Local0), PIMX)
                    Store (DerefOf (Index (PITR, Local0)), PIT0)
                    Store (DerefOf (Index (PITR, Local1)), PIT1)
                    If (And (FLAG, One))
                    {
                        Store (Match (UDMT, MLE, DMA0, MTR, Zero, Zero), Local0)
                        Divide (Local0, 0x06, Local0)
                        Or (UDMX, Local0, UDMX)
                        Or (UDCX, One, UDCX)
                    }
                    Else
                    {
                        If (LNotEqual (DMA0, Ones))
                        {
                            Store (Match (MDMT, MLE, DMA0, MTR, Zero, Zero), Local0)
                            Store (DerefOf (Index (MDTR, Local0)), MDT0)
                        }
                    }

                    If (And (FLAG, 0x04))
                    {
                        Store (Match (UDMT, MLE, DMA1, MTR, Zero, Zero), Local0)
                        Divide (Local0, 0x06, Local0)
                        Or (UDMX, ShiftLeft (Local0, 0x04), UDMX)
                        Or (UDCX, 0x02, UDCX)
                    }
                    Else
                    {
                        If (LNotEqual (DMA1, Ones))
                        {
                            Store (Match (MDMT, MLE, DMA1, MTR, Zero, Zero), Local0)
                            Store (DerefOf (Index (MDTR, Local0)), MDT1)
                        }
                    }

                    Return (BUF)
                }

                Method (GTF, 2, NotSerialized)
                {
                    CreateByteField (Arg1, Zero, MDT1)
                    CreateByteField (Arg1, One, MDT0)
                    CreateByteField (Arg1, 0x02, PIMX)
                    CreateByteField (Arg1, 0x03, UDCX)
                    CreateByteField (Arg1, 0x04, UDMX)
                    If (LEqual (Arg0, 0xA0))
                    {
                        Store (And (PIMX, 0x0F), Local0)
                        Store (MDT0, Local1)
                        And (UDCX, One, Local2)
                        Store (And (UDMX, 0x0F), Local3)
                    }
                    Else
                    {
                        Store (ShiftRight (PIMX, 0x04), Local0)
                        Store (MDT1, Local1)
                        And (UDCX, 0x02, Local2)
                        Store (ShiftRight (UDMX, 0x04), Local3)
                    }

                    Name (BUF, Buffer (0x0E)
                    {
                        /* 0000 */   0x03, 0x00, 0x00, 0x00, 0x00, 0xFF, 0xEF, 0x03,
                        /* 0008 */   0x00, 0x00, 0x00, 0x00, 0xFF, 0xEF
                    })
                    CreateByteField (BUF, One, PMOD)
                    CreateByteField (BUF, 0x08, DMOD)
                    CreateByteField (BUF, 0x05, CMDA)
                    CreateByteField (BUF, 0x0C, CMDB)
                    Store (Arg0, CMDA)
                    Store (Arg0, CMDB)
                    Or (Local0, 0x08, PMOD)
                    If (Local2)
                    {
                        Or (Local3, 0x40, DMOD)
                    }
                    Else
                    {
                        If (LNotEqual (Local1, 0xFF))
                        {
                            Store (Match (MDMT, MLE, GETT (Local1), MTR, Zero, Zero), Local4)
                            If (LLess (Local4, 0x03))
                            {
                                Or (0x20, Local4, DMOD)
                            }
                        }
                    }

                    Return (BUF)
                }

                Device (PRID)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Method (_GTM, 0, NotSerialized)  // _GTM: Get Timing Mode
                    {
                        Name (BUF, Buffer (0x07)
                        {
                             0x00, 0x00, 0xFF, 0xFF, 0x00, 0x00, 0x00
                        })
                        CreateWordField (BUF, Zero, VPIT)
                        CreateWordField (BUF, 0x02, VMDT)
                        CreateByteField (BUF, 0x04, VPIC)
                        CreateByteField (BUF, 0x05, VUDC)
                        CreateByteField (BUF, 0x06, VUDM)
                        Store (PPIT, VPIT)
                        Store (PMDT, VMDT)
                        Store (PPIC, VPIC)
                        Store (PUDC, VUDC)
                        Store (PUDM, VUDM)
                        Return (GTM (BUF))
                    }

                    Method (_STM, 3, NotSerialized)  // _STM: Set Timing Mode
                    {
                        Name (BUF, Buffer (0x07)
                        {
                             0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                        })
                        CreateWordField (BUF, Zero, VPIT)
                        CreateWordField (BUF, 0x02, VMDT)
                        CreateByteField (BUF, 0x04, VPIM)
                        CreateByteField (BUF, 0x05, VUDC)
                        CreateByteField (BUF, 0x06, VUDM)
                        Store (STM (Arg0, Arg1, Arg2), BUF)
                        Store (VPIT, PPIT)
                        Store (VMDT, PMDT)
                        Store (VPIM, PPIM)
                        Store (VUDC, PUDC)
                        Store (VUDM, PUDM)
                    }

                    Device (P_D0)
                    {
                        Name (_ADR, Zero)  // _ADR: Address
                        Method (_GTF, 0, NotSerialized)  // _GTF: Get Task File
                        {
                            Name (BUF, Buffer (0x05)
                            {
                                 0x00, 0x00, 0x00, 0x00, 0x00
                            })
                            CreateWordField (BUF, Zero, VMDT)
                            CreateByteField (BUF, 0x02, VPIM)
                            CreateByteField (BUF, 0x03, VUDC)
                            CreateByteField (BUF, 0x04, VUDM)
                            Store (PMDT, VMDT)
                            Store (PPIM, VPIM)
                            Store (PUDC, VUDC)
                            Store (PUDM, VUDM)
                            Return (GTF (0xA0, BUF))
                        }
                    }

                    Device (P_D1)
                    {
                        Name (_ADR, One)  // _ADR: Address
                        Method (_GTF, 0, NotSerialized)  // _GTF: Get Task File
                        {
                            Name (BUF, Buffer (0x05)
                            {
                                 0x00, 0x00, 0x00, 0x00, 0x00
                            })
                            CreateWordField (BUF, Zero, VMDT)
                            CreateByteField (BUF, 0x02, VPIM)
                            CreateByteField (BUF, 0x03, VUDC)
                            CreateByteField (BUF, 0x04, VUDM)
                            Store (PMDT, VMDT)
                            Store (PPIM, VPIM)
                            Store (PUDC, VUDC)
                            Store (PUDM, VUDM)
                            Return (GTF (0xB0, BUF))
                        }
                    }
                }

                Device (SECD)
                {
                    Name (_ADR, One)  // _ADR: Address
                    Method (_GTM, 0, NotSerialized)  // _GTM: Get Timing Mode
                    {
                        Name (BUF, Buffer (0x07)
                        {
                             0x00, 0x00, 0xFF, 0xFF, 0x00, 0x00, 0x00
                        })
                        CreateWordField (BUF, Zero, VPIT)
                        CreateWordField (BUF, 0x02, VMDT)
                        CreateByteField (BUF, 0x04, VPIC)
                        CreateByteField (BUF, 0x05, VUDC)
                        CreateByteField (BUF, 0x06, VUDM)
                        Store (SPIT, VPIT)
                        Store (SMDT, VMDT)
                        Store (SPIC, VPIC)
                        Store (SUDC, VUDC)
                        Store (SUDM, VUDM)
                        Return (GTM (BUF))
                    }

                    Method (_STM, 3, NotSerialized)  // _STM: Set Timing Mode
                    {
                        Name (BUF, Buffer (0x07)
                        {
                             0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                        })
                        CreateWordField (BUF, Zero, VPIT)
                        CreateWordField (BUF, 0x02, VMDT)
                        CreateByteField (BUF, 0x04, VPIM)
                        CreateByteField (BUF, 0x05, VUDC)
                        CreateByteField (BUF, 0x06, VUDM)
                        Store (STM (Arg0, Arg1, Arg2), BUF)
                        Store (VPIT, SPIT)
                        Store (VMDT, SMDT)
                        Store (VPIM, SPIM)
                        Store (VUDC, SUDC)
                        Store (VUDM, SUDM)
                    }

                    Device (S_D0)
                    {
                        Name (_ADR, Zero)  // _ADR: Address
                        Method (_GTF, 0, NotSerialized)  // _GTF: Get Task File
                        {
                            Name (BUF, Buffer (0x05)
                            {
                                 0x00, 0x00, 0x00, 0x00, 0x00
                            })
                            CreateWordField (BUF, Zero, VMDT)
                            CreateByteField (BUF, 0x02, VPIM)
                            CreateByteField (BUF, 0x03, VUDC)
                            CreateByteField (BUF, 0x04, VUDM)
                            Store (SMDT, VMDT)
                            Store (SPIM, VPIM)
                            Store (SUDC, VUDC)
                            Store (SUDM, VUDM)
                            Return (GTF (0xA0, BUF))
                        }
                    }

                    Device (S_D1)
                    {
                        Name (_ADR, One)  // _ADR: Address
                        Method (_GTF, 0, NotSerialized)  // _GTF: Get Task File
                        {
                            Name (BUF, Buffer (0x05)
                            {
                                 0x00, 0x00, 0x00, 0x00, 0x00
                            })
                            CreateWordField (BUF, Zero, VMDT)
                            CreateByteField (BUF, 0x02, VPIM)
                            CreateByteField (BUF, 0x03, VUDC)
                            CreateByteField (BUF, 0x04, VUDM)
                            Store (SMDT, VMDT)
                            Store (SPIM, VPIM)
                            Store (SUDC, VUDC)
                            Store (SUDM, VUDM)
                            Return (GTF (0xB0, BUF))
                        }
                    }
                }
            }

            Name (AFCB, Buffer (0xB8) {})
            Name (CALB, Buffer (0x05) {})
            Device (AFD)
            {
                Name (_HID, "AFD0001")  // _HID: Hardware ID
                Name (HDD0, 0x80000000)
                Name (ODZP, 0x80000000)
                Name (DAT3, Buffer (0x0E)
                {
                    /* 0000 */   0x0E, 0x00, 0x03, 0x0C, 0x03, 0x00, 0x00, 0x00,
                    /* 0008 */   0x92, 0x00, 0x03, 0x00, 0x00, 0x00
                })
                Name (DAT4, Buffer (0x0E)
                {
                    /* 0000 */   0x0E, 0x00, 0x11, 0x0D, 0x03, 0x00, 0x00, 0x00,
                    /* 0008 */   0xA5, 0x00, 0x02, 0x00, 0x00, 0x00
                })
                Name (DAT5, Buffer (0x0E)
                {
                    /* 0000 */   0x0E, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0xFF,
                    /* 0008 */   0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                })
                Name (DAT6, Buffer (0x0E)
                {
                    /* 0000 */   0x0E, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00, 0xFF,
                    /* 0008 */   0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                })
                Name (DAT7, Buffer (0x0E)
                {
                    /* 0000 */   0x0E, 0x00, 0x03, 0x0C, 0x03, 0x00, 0x00, 0x00,
                    /* 0008 */   0x00, 0xFF, 0x00, 0x00, 0x00, 0x00
                })
                Name (DAT8, Buffer (0x0E)
                {
                    /* 0000 */   0x0E, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0xFF,
                    /* 0008 */   0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                })
                Name (DAT9, Buffer (0x0E)
                {
                    /* 0000 */   0x0E, 0x00, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0xFF,
                    /* 0008 */   0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                })
                Name (DATA, Buffer (0x0E)
                {
                    /* 0000 */   0x0E, 0x00, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0xFF,
                    /* 0008 */   0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                })
                Name (DATB, Buffer (0x0E)
                {
                    /* 0000 */   0x0E, 0x00, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0xFF,
                    /* 0008 */   0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                })
                Name (DATC, Buffer (0x0E)
                {
                    /* 0000 */   0x0E, 0x00, 0x01, 0x04, 0x00, 0x00, 0x00, 0xFF,
                    /* 0008 */   0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                })
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If (LEqual (AFUC, Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }

                Method (AFCM, 3, NotSerialized)
                {
                    And (Arg0, 0xFF, Arg0)
                    If (LEqual (Arg0, Zero))
                    {
                        Return (AFC0 ())
                    }

                    If (LEqual (Arg0, One))
                    {
                        Return (AFC1 ())
                    }

                    If (LEqual (Arg0, 0x02))
                    {
                        Return (AFC2 (Arg1, Arg2))
                    }
                    Else
                    {
                        CreateWordField (AFCB, Zero, SSZE)
                        CreateWordField (AFCB, 0x02, VERN)
                        CreateDWordField (AFCB, 0x04, SFUN)
                        Store (Zero, SSZE)
                        Store (Zero, VERN)
                        Store (Zero, SFUN)
                        Return (AFCB)
                    }
                }

                Method (AFC0, 0, NotSerialized)
                {
                    Store (0xAF00, P80H)
                    CreateWordField (AFCB, Zero, SSZE)
                    CreateWordField (AFCB, 0x02, VERN)
                    CreateDWordField (AFCB, 0x04, SFUN)
                    Store (0x08, SSZE)
                    Store (One, VERN)
                    Store (0x03, SFUN)
                    Store (0xAE00, P80H)
                    Return (AFCB)
                }

                Method (AFC1, 0, NotSerialized)
                {
                    Store (0xAF01, P80H)
                    CreateWordField (AFCB, Zero, SSZE)
                    CreateWordField (AFCB, 0x02, ESZ0)
                    CreateWordField (AFCB, 0x04, CCD0)
                    CreateWordField (AFCB, 0x06, EBU0)
                    CreateWordField (AFCB, 0x08, CFG0)
                    CreateWordField (AFCB, 0x0A, PCA0)
                    CreateWordField (AFCB, 0x0C, DCP0)
                    CreateWordField (AFCB, 0x0E, DRA0)
                    Store (0x0E, ESZ0)
                    Store (0x02, EBU0)
                    Store (Zero, CFG0)
                    Store (0x88, PCA0)
                    If (LEqual (^^SATA.VIDI, 0x78001022))
                    {
                        Store (One, EBU0)
                        Store (0x0101, CCD0)
                        Store (Zero, DCP0)
                        Store (Zero, DRA0)
                    }

                    If (LEqual (^^SATA.VIDI, 0x78011022))
                    {
                        Store (0x0106, CCD0)
                        Store (Zero, DCP0)
                        Store (Zero, DRA0)
                    }

                    If (LEqual (^^SATA.VIDI, 0x78021022))
                    {
                        Store (0x0104, CCD0)
                        Store (Zero, DCP0)
                        Store (Zero, DRA0)
                    }

                    If (LEqual (^^SATA.VIDI, 0x78031022))
                    {
                        Store (0x0104, CCD0)
                        Store (Zero, DCP0)
                        Store (Zero, DRA0)
                    }

                    If (LEqual (^^SATA.VIDI, 0x78041022))
                    {
                        Store (0x0106, CCD0)
                        Store (Zero, DCP0)
                        Store (Zero, DRA0)
                    }

                    CreateWordField (AFCB, 0x10, ESZ1)
                    CreateWordField (AFCB, 0x12, CCD1)
                    CreateWordField (AFCB, 0x14, EBU1)
                    CreateWordField (AFCB, 0x16, CFG1)
                    CreateWordField (AFCB, 0x18, PCA1)
                    CreateWordField (AFCB, 0x1A, DCP1)
                    CreateWordField (AFCB, 0x1C, DRA1)
                    Store (0x0E, ESZ1)
                    Store (0x02, EBU1)
                    Store (Zero, CFG1)
                    Store (0x88, PCA1)
                    If (LEqual (^^SATA.VIDI, 0x78001022))
                    {
                        Store (One, EBU1)
                        Store (0x0101, CCD1)
                        Store (One, DCP1)
                        Store (One, DRA1)
                    }

                    If (LEqual (^^SATA.VIDI, 0x78011022))
                    {
                        Store (0x0106, CCD1)
                        Store (One, DCP1)
                        Store (Zero, DRA1)
                    }

                    If (LEqual (^^SATA.VIDI, 0x78021022))
                    {
                        Store (0x0104, CCD1)
                        Store (Zero, DCP1)
                        Store (Zero, DRA1)
                    }

                    If (LEqual (^^SATA.VIDI, 0x78031022))
                    {
                        Store (0x0104, CCD1)
                        Store (Zero, DCP1)
                        Store (Zero, DRA1)
                    }

                    If (LEqual (^^SATA.VIDI, 0x78041022))
                    {
                        Store (0x0106, CCD1)
                        Store (One, DCP1)
                        Store (Zero, DRA1)
                    }

                    CreateWordField (AFCB, 0x1E, ESZ2)
                    CreateWordField (AFCB, 0x20, CCD2)
                    CreateWordField (AFCB, 0x22, EBU2)
                    CreateWordField (AFCB, 0x24, CFG2)
                    CreateWordField (AFCB, 0x26, PCA2)
                    CreateWordField (AFCB, 0x28, DCP2)
                    CreateWordField (AFCB, 0x2A, DRA2)
                    Store (0x0E, ESZ2)
                    Store (0x02, EBU2)
                    Store (Zero, CFG2)
                    Store (0x88, PCA2)
                    If (LEqual (^^SATA.VIDI, 0x78001022))
                    {
                        Store (One, EBU2)
                        Store (0x0101, CCD2)
                        Store (Zero, DCP2)
                        Store (One, DRA2)
                    }

                    If (LEqual (^^SATA.VIDI, 0x78011022))
                    {
                        Store (0x0106, CCD2)
                        Store (0x02, DCP2)
                        Store (Zero, DRA2)
                    }

                    If (LEqual (^^SATA.VIDI, 0x78021022))
                    {
                        Store (0x0104, CCD2)
                        Store (Zero, DCP2)
                        Store (Zero, DRA2)
                    }

                    If (LEqual (^^SATA.VIDI, 0x78031022))
                    {
                        Store (0x0104, CCD2)
                        Store (Zero, DCP2)
                        Store (Zero, DRA2)
                    }

                    If (LEqual (^^SATA.VIDI, 0x78041022))
                    {
                        Store (0x0106, CCD2)
                        Store (0x02, DCP2)
                        Store (Zero, DRA2)
                    }

                    CreateField (AFCB, 0x0160, 0x70, IDX3)
                    Store (DAT3, IDX3)
                    CreateField (AFCB, 0x01D0, 0x70, IDX4)
                    Store (DAT4, IDX4)
                    CreateField (AFCB, 0x0240, 0x70, IDX5)
                    CreateByteField (DAT5, 0x07, BUS5)
                    If (LEqual (^^VGA.PXEN, 0x80000000))
                    {
                        Store (0xFF, BUS5)
                    }
                    Else
                    {
                        If (LEqual (^^VGA.PXID, ^^PB2._ADR))
                        {
                            Store (^^PB2.SBUS, Local0)
                        }

                        If (LEqual (^^VGA.PXID, ^^PB3._ADR))
                        {
                            Store (^^PB3.SBUS, Local0)
                        }

                        ShiftRight (Local0, 0x08, Local0)
                        And (Local0, 0xFF, Local0)
                        Store (Local0, BUS5)
                    }

                    Store (DAT5, IDX5)
                    CreateField (AFCB, 0x02B0, 0x70, IDX6)
                    CreateByteField (DAT6, 0x07, BUS6)
                    Store (^^PB7.SBUS, Local0)
                    ShiftRight (Local0, 0x08, Local0)
                    And (Local0, 0xFF, Local0)
                    Store (Local0, BUS6)
                    Store (DAT6, IDX6)
                    CreateField (AFCB, 0x0320, 0x70, IDX7)
                    If (LEqual (EXUS, Zero))
                    {
                        CreateByteField (DAT7, 0x09, BUS7)
                        Store (^^SPB1.SBUS, Local0)
                        ShiftRight (Local0, 0x08, Local0)
                        And (Local0, 0xFF, Local0)
                        Store (Local0, BUS7)
                    }

                    Store (DAT7, IDX7)
                    CreateField (AFCB, 0x0390, 0x70, IDX8)
                    CreateByteField (DAT8, 0x07, BUS8)
                    Store (^^PB4.SBUS, Local0)
                    ShiftRight (Local0, 0x08, Local0)
                    And (Local0, 0xFF, Local0)
                    Store (Local0, BUS8)
                    Store (DAT8, IDX8)
                    CreateField (AFCB, 0x0400, 0x70, IDX9)
                    CreateByteField (DAT9, 0x07, BUS9)
                    Store (^^PB6.SBUS, Local0)
                    ShiftRight (Local0, 0x08, Local0)
                    And (Local0, 0xFF, Local0)
                    Store (Local0, BUS9)
                    Store (DAT9, IDX9)
                    CreateField (AFCB, 0x0470, 0x70, IDXA)
                    CreateByteField (DATA, 0x07, BUSA)
                    Store (^^SPB0.SBUS, Local0)
                    ShiftRight (Local0, 0x08, Local0)
                    And (Local0, 0xFF, Local0)
                    Store (Local0, BUSA)
                    Store (DATA, IDXA)
                    CreateField (AFCB, 0x04E0, 0x70, IDXB)
                    CreateByteField (DATB, 0x07, BUSB)
                    Store (^^PB5.SBUS, Local0)
                    ShiftRight (Local0, 0x08, Local0)
                    And (Local0, 0xFF, Local0)
                    Store (Local0, BUSB)
                    Store (DATB, IDXB)
                    CreateField (AFCB, 0x0550, 0x70, IDXC)
                    CreateByteField (DATC, 0x07, BUSC)
                    ShiftRight (Local0, 0x08, Local0)
                    And (Local0, 0xFF, Local0)
                    Store (Local0, BUSC)
                    Store (DATC, IDXC)
                    Store (0xB8, SSZE)
                    Store (0xAE01, P80H)
                    Return (AFCB)
                }

                Method (AFC2, 2, NotSerialized)
                {
                    Store (0xAF02, P80H)
                    CreateDWordField (AFCB, Zero, FLAG)
                    CreateByteField (AFCB, 0x04, PWST)
                    CreateByteField (AFCB, 0x05, DIND)
                    CreateWordField (CALB, Zero, SZZE)
                    CreateField (CALB, 0x10, 0x03, FUCC)
                    CreateField (CALB, 0x13, 0x05, DEVV)
                    CreateField (CALB, 0x18, 0x08, BUSS)
                    CreateByteField (CALB, 0x04, HPST)
                    Store (0x05, SZZE)
                    And (Arg0, 0xFF, PWST)
                    And (Arg1, 0xFF, DIND)
                    If (LEqual (DIND, Zero))
                    {
                        If (LOr (LEqual (^^SATA.VIDI, 0x78021022), LEqual (^^SATA.VIDI, 0x78031022)))
                        {
                            Or (FLAG, 0x80, FLAG)
                            Return (FLAG)
                        }

                        Store (One, ^^SMBS.MX57)
                        Store (One, ^^SMBS.M170)
                        If (LEqual (PWST, Zero))
                        {
                            If (LEqual (^^SATA.VIDI, 0x78001022))
                            {
                                Notify (^^SATA.PRID.P_D0, 0x03)
                            }

                            If (LOr (LEqual (^^SATA.VIDI, 0x78011022), LEqual (^^SATA.VIDI, 0x78041022)))
                            {
                                Notify (^^SATA.PRID, 0x03)
                            }

                            Store (Zero, FLAG)
                        }

                        If (LEqual (PWST, One))
                        {
                            Store (Zero, ^^SMBS.O170)
                            Store (Zero, ^^SMBS.E170)
                            Store (One, ^^SMBS.O057)
                            Store (Zero, ^^SMBS.E057)
                            Sleep (0x03E8)
                            If (LEqual (^^SATA.VIDI, 0x78001022))
                            {
                                Notify (^^SATA.PRID.P_D0, One)
                            }

                            If (LOr (LEqual (^^SATA.VIDI, 0x78011022), LEqual (^^SATA.VIDI, 0x78041022)))
                            {
                                Notify (^^SATA.PRID, One)
                            }

                            Store (One, FLAG)
                        }

                        If (LEqual (PWST, 0xFF))
                        {
                            Store (^^SMBS.O057, FLAG)
                        }
                    }

                    If (LEqual (DIND, One))
                    {
                        If (LOr (LEqual (^^SATA.VIDI, 0x78021022), LEqual (^^SATA.VIDI, 0x78031022)))
                        {
                            Or (FLAG, 0x80, FLAG)
                            Return (FLAG)
                        }

                        Store (One, ^^SMBS.MX55)
                        Store (One, ^^SMBS.M170)
                        If (LEqual (ODZC, Zero))
                        {
                            If (LEqual (PWST, Zero))
                            {
                                If (LEqual (^^SATA.VIDI, 0x78001022))
                                {
                                    Notify (^^SATA.PRT1.ODD, 0x03)
                                }

                                If (LOr (LEqual (^^SATA.VIDI, 0x78011022), LEqual (^^SATA.VIDI, 0x78041022)))
                                {
                                    If (LEqual (HDD0, One))
                                    {
                                        Notify (^^SATA.PRT1, 0x03)
                                    }
                                    Else
                                    {
                                        If (LGreaterEqual (TPOS, 0x50))
                                        {
                                            Notify (^^SATA.PRT1, 0x03)
                                        }
                                        Else
                                        {
                                            Notify (^^SATA.PRID, 0x03)
                                        }
                                    }
                                }

                                Store (Zero, FLAG)
                            }

                            If (LEqual (PWST, One))
                            {
                                Store (Zero, ^^SMBS.O170)
                                Store (Zero, ^^SMBS.E170)
                                Store (One, ^^SMBS.O055)
                                Store (Zero, ^^SMBS.E055)
                                Sleep (0x03E8)
                                If (LEqual (^^SATA.VIDI, 0x78001022))
                                {
                                    Notify (^^SATA.PRT1.ODD, One)
                                }

                                If (LOr (LEqual (^^SATA.VIDI, 0x78011022), LEqual (^^SATA.VIDI, 0x78041022)))
                                {
                                    If (LEqual (HDD0, One))
                                    {
                                        Notify (^^SATA.PRT1, One)
                                    }
                                    Else
                                    {
                                        If (LGreaterEqual (TPOS, 0x50))
                                        {
                                            Notify (^^SATA.PRT1, One)
                                        }
                                        Else
                                        {
                                            Notify (^^SATA.PRID, One)
                                        }
                                    }
                                }

                                Store (One, FLAG)
                            }

                            If (LEqual (PWST, 0xFF))
                            {
                                Store (^^SMBS.O055, FLAG)
                            }
                        }
                        Else
                        {
                            If (LEqual (^^SATA.VIDI, 0x78041022))
                            {
                                Store (^^SMBS.O055, FLAG)
                                Or (FLAG, 0xC0, FLAG)
                                Return (FLAG)
                            }

                            If (LEqual (PWST, Zero))
                            {
                                If (LEqual (^^SATA.VIDI, 0x78001022))
                                {
                                    Notify (^^SATA.ODDZ.ODD, 0x03)
                                }

                                If (LEqual (^^SATA.VIDI, 0x78011022))
                                {
                                    If (LEqual (HDD0, One))
                                    {
                                        Notify (^^SATA.ODDZ.ODD, 0x03)
                                    }
                                    Else
                                    {
                                        If (LGreaterEqual (TPOS, 0x50))
                                        {
                                            Notify (^^SATA.ODDZ.ODD, 0x03)
                                        }
                                        Else
                                        {
                                            Notify (^^SATA.PRID, 0x03)
                                        }
                                    }
                                }

                                Store (Zero, FLAG)
                            }

                            If (LEqual (PWST, One))
                            {
                                Store (Zero, ^^SMBS.O170)
                                Store (Zero, ^^SMBS.E170)
                                Store (One, ^^SMBS.O055)
                                Store (Zero, ^^SMBS.E055)
                                Sleep (0x03E8)
                                If (LEqual (^^SATA.VIDI, 0x78001022))
                                {
                                    Notify (^^SATA.ODDZ.ODD, One)
                                }

                                If (LEqual (^^SATA.VIDI, 0x78011022))
                                {
                                    If (LEqual (HDD0, One))
                                    {
                                        Notify (^^SATA.ODDZ.ODD, One)
                                    }
                                    Else
                                    {
                                        If (LGreaterEqual (TPOS, 0x50))
                                        {
                                            Notify (^^SATA.ODDZ.ODD, One)
                                        }
                                        Else
                                        {
                                            Notify (^^SATA.PRID, One)
                                        }
                                    }
                                }

                                Store (One, FLAG)
                            }

                            If (LEqual (PWST, 0xFF))
                            {
                                Store (^^SMBS.O055, FLAG)
                                If (LOr (LEqual (^^SATA.VIDI, 0x78001022), LEqual (^^SATA.VIDI, 0x78011022)))
                                {
                                    And (FLAG, 0x7F, FLAG)
                                }
                                Else
                                {
                                    Or (FLAG, 0x80, FLAG)
                                }

                                Or (FLAG, 0x40, FLAG)
                            }
                        }
                    }

                    If (LEqual (DIND, 0x02))
                    {
                        If (LOr (LEqual (^^SATA.VIDI, 0x78021022), LEqual (^^SATA.VIDI, 0x78031022)))
                        {
                            Or (FLAG, 0x80, FLAG)
                            Return (FLAG)
                        }

                        Store (One, ^^SMBS.MX58)
                        Store (One, ^^SMBS.M170)
                        If (LEqual (PWST, Zero))
                        {
                            If (LEqual (^^SATA.VIDI, 0x78001022))
                            {
                                Notify (^^SATA.PRID.P_D1, 0x03)
                            }

                            If (LOr (LEqual (^^SATA.VIDI, 0x78011022), LEqual (^^SATA.VIDI, 0x78041022)))
                            {
                                Notify (^^SATA.SECD, 0x03)
                            }

                            Store (Zero, FLAG)
                        }

                        If (LEqual (PWST, One))
                        {
                            Store (Zero, ^^SMBS.O170)
                            Store (Zero, ^^SMBS.E170)
                            Sleep (0x03E8)
                            Store (One, ^^SMBS.O058)
                            Store (Zero, ^^SMBS.E058)
                            Sleep (0x03E8)
                            Store (One, ^^SMBS.O170)
                            Store (Zero, ^^SMBS.E170)
                            If (LEqual (^^SATA.VIDI, 0x78001022))
                            {
                                Notify (^^SATA.PRID.P_D1, One)
                            }

                            If (LOr (LEqual (^^SATA.VIDI, 0x78011022), LEqual (^^SATA.VIDI, 0x78041022)))
                            {
                                Notify (^^SATA.SECD, One)
                            }

                            Store (One, FLAG)
                        }

                        If (LEqual (PWST, 0xFF))
                        {
                            Store (^^SMBS.O058, FLAG)
                        }
                    }

                    If (LEqual (DIND, 0x03))
                    {
                        Store (One, ^^SMBS.MX66)
                        If (LEqual (PWST, Zero))
                        {
                            Store (One, ^^SMBS.O066)
                            Store (Zero, ^^SMBS.E066)
                            Store (Zero, FLAG)
                        }

                        If (LEqual (PWST, One))
                        {
                            Store (Zero, ^^SMBS.O066)
                            Store (Zero, ^^SMBS.E066)
                            Sleep (0x28)
                            Store (One, FLAG)
                        }

                        If (LEqual (PWST, 0xFF))
                        {
                            Store (^^SMBS.O066, FLAG)
                        }
                    }

                    If (LEqual (DIND, 0x04))
                    {
                        Store (One, ^^SMBS.MX07)
                        If (LEqual (PWST, Zero))
                        {
                            Notify (^^OHC4.RHUB.PRT2, 0x03)
                            Store (Zero, FLAG)
                        }

                        If (LEqual (PWST, One))
                        {
                            Store (One, ^^SMBS.O007)
                            Store (Zero, ^^SMBS.E007)
                            Sleep (0x28)
                            Notify (^^OHC4.RHUB.PRT2, One)
                            Store (One, FLAG)
                        }

                        If (LEqual (PWST, 0xFF))
                        {
                            Store (^^SMBS.O007, FLAG)
                        }
                    }

                    If (LEqual (DIND, 0x05))
                    {
                        If (LEqual (^^VGA.PXEN, 0x80000000))
                        {
                            Store (^^SMBS.O045, FLAG)
                            Or (FLAG, 0x80, FLAG)
                            Return (FLAG)
                        }

                        If (LEqual (PWST, Zero))
                        {
                            Notify (^^PB2.VGA, 0x03)
                            Store (Zero, FLAG)
                        }

                        If (LEqual (PWST, One))
                        {
                            ^^VGA.PX02 (One)
                            Notify (^^PB2.VGA, One)
                            Store (One, FLAG)
                        }

                        If (LEqual (PWST, 0xFF))
                        {
                            Store (^^SMBS.O045, FLAG)
                        }
                    }

                    If (LEqual (DIND, 0x06))
                    {
                        Store (0x02, ^^SMBS.MX59)
                        Store (One, ^^SMBS.MX27)
                        If (LEqual (PWST, Zero))
                        {
                            Notify (^^PB7.XPDV, 0x03)
                            Store (Zero, FLAG)
                            Store (0xAF60, P80H)
                        }

                        If (LEqual (PWST, One))
                        {
                            Store (Zero, ^^SMBS.O027)
                            Store (Zero, ^^SMBS.E027)
                            Sleep (0x28)
                            Store (One, ^^SMBS.O059)
                            Store (Zero, ^^SMBS.E059)
                            Sleep (0x28)
                            Store (^^SMBS.MS04, Local0)
                            Or (Local0, 0x0F, Local1)
                            Store (Local1, ^^SMBS.MS04)
                            Sleep (0x28)
                            Store (One, ^^SMBS.O027)
                            Store (Zero, ^^SMBS.E027)
                            Sleep (0x28)
                            Store (One, ^^SMBS.H041)
                            Store (One, ^^SMBS.S041)
                            Store (Zero, ^^SMBS.U041)
                            Sleep (0x28)
                            Store (Zero, FUCC)
                            Store (0x07, DEVV)
                            Store (Zero, BUSS)
                            Store (One, HPST)
                            ALIB (0x06, CALB)
                            Sleep (0x28)
                            Store (^^PB7.XPDV.DISF, Local0)
                            And (Local0, 0xFFFFFFF9, Local0)
                            Store (Local0, ^^PB7.XPDV.DISF)
                            Notify (^^PB7.XPDV, One)
                            Store (One, FLAG)
                            Store (0xAF61, P80H)
                        }

                        If (LEqual (PWST, 0xFF))
                        {
                            Store (^^SMBS.O059, FLAG)
                        }
                    }

                    If (LEqual (DIND, 0x07))
                    {
                        Store (0x02, ^^SMBS.M200)
                        If (LEqual (PWST, Zero))
                        {
                            Notify (^^SPB1.XPDV, 0x03)
                            Store (Zero, FLAG)
                            Store (0xAE70, P80H)
                        }

                        If (LEqual (PWST, One))
                        {
                            Store (One, ^^SMBS.O200)
                            Store (Zero, ^^SMBS.E200)
                            Sleep (0x28)
                            Store (^^SMBS.MS03, Local0)
                            Or (Local0, 0xF0, Local1)
                            Store (Local1, ^^SMBS.MS03)
                            Store (One, ^^SMBS.H046)
                            Store (One, ^^SMBS.S046)
                            Store (Zero, ^^SMBS.U046)
                            Sleep (0x28)
                            Notify (^^SPB1.XPDV, One)
                            Store (One, FLAG)
                            Store (0xAE71, P80H)
                        }

                        If (LEqual (PWST, 0xFF))
                        {
                            Store (^^SMBS.O200, FLAG)
                        }
                    }

                    If (LEqual (DIND, 0x08))
                    {
                        Store (0x02, ^^SMBS.M197)
                        If (LEqual (PWST, Zero))
                        {
                            Notify (^^PB4.XPDV, 0x03)
                            Store (Zero, FLAG)
                        }

                        If (LEqual (PWST, One))
                        {
                            Store (One, ^^SMBS.O197)
                            Store (Zero, ^^SMBS.E197)
                            Sleep (0xC8)
                            Store (^^SMBS.MS01, Local0)
                            Or (Local0, 0xF0, Local1)
                            Store (Local1, ^^SMBS.MS01)
                            Store (One, ^^SMBS.H063)
                            Store (One, ^^SMBS.S063)
                            Store (Zero, ^^SMBS.U063)
                            Sleep (0xC8)
                            Store (Zero, FUCC)
                            Store (0x04, DEVV)
                            Store (Zero, BUSS)
                            Store (One, HPST)
                            ALIB (0x06, CALB)
                            Notify (^^PB4.XPDV, One)
                            Store (One, FLAG)
                        }

                        If (LEqual (PWST, 0xFF))
                        {
                            Store (^^SMBS.O197, FLAG)
                        }
                    }

                    If (LEqual (DIND, 0x09))
                    {
                        Store (One, ^^SMBS.M176)
                        If (LEqual (PWST, Zero))
                        {
                            Notify (^^PB6.XPDV, 0x03)
                            Store (Zero, FLAG)
                        }

                        If (LEqual (PWST, One))
                        {
                            Sleep (0x28)
                            Store (One, ^^SMBS.O014)
                            Store (Zero, ^^SMBS.E014)
                            Store (Zero, ^^SMBS.O176)
                            Store (Zero, ^^SMBS.E176)
                            Sleep (0xC8)
                            Store (^^SMBS.MS02, Local0)
                            Or (Local0, 0x0F, Local1)
                            Store (Local1, ^^SMBS.MS02)
                            Sleep (0x28)
                            Store (One, ^^SMBS.H064)
                            Store (One, ^^SMBS.S064)
                            Store (Zero, ^^SMBS.U064)
                            Sleep (0xC8)
                            Store (Zero, FUCC)
                            Store (0x06, DEVV)
                            Store (Zero, BUSS)
                            Store (One, HPST)
                            ALIB (0x06, CALB)
                            Notify (^^PB6.XPDV, One)
                            Store (One, FLAG)
                        }

                        If (LEqual (PWST, 0xFF))
                        {
                            Store (^^SMBS.O176, Local0)
                            And (Local0, One, Local0)
                            XOr (Local0, One, Local0)
                            Store (Local0, FLAG)
                        }
                    }

                    If (LEqual (DIND, 0x0A))
                    {
                        Store (One, ^^SMBS.M175)
                        If (LEqual (PWST, Zero))
                        {
                            Notify (^^SPB0.XPDV, 0x03)
                            Store (Zero, FLAG)
                        }

                        If (LEqual (PWST, One))
                        {
                            Store (One, ^^SMBS.O012)
                            Store (Zero, ^^SMBS.E012)
                            Sleep (0x28)
                            Store (Zero, ^^SMBS.O175)
                            Store (Zero, ^^SMBS.E175)
                            Sleep (0xC8)
                            Notify (^^SPB0.XPDV, One)
                            Store (One, FLAG)
                        }

                        If (LEqual (PWST, 0xFF))
                        {
                            Store (^^SMBS.O175, Local0)
                            And (Local0, One, Local0)
                            XOr (Local0, One, Local0)
                            Store (Local0, FLAG)
                        }
                    }

                    If (LEqual (DIND, 0x0B))
                    {
                        Store (One, ^^SMBS.M177)
                        If (LEqual (PWST, Zero))
                        {
                            Notify (^^PB5.XPDV, 0x03)
                            Store (Zero, FLAG)
                        }

                        If (LEqual (PWST, One))
                        {
                            Sleep (0x28)
                            Store (One, ^^SMBS.O013)
                            Store (Zero, ^^SMBS.E013)
                            Store (Zero, ^^SMBS.O177)
                            Store (Zero, ^^SMBS.E177)
                            Sleep (0xC8)
                            Store (^^SMBS.MS01, Local0)
                            Or (Local0, 0x0F, Local1)
                            Store (Local1, ^^SMBS.MS01)
                            Sleep (0x28)
                            Store (One, ^^SMBS.H062)
                            Store (One, ^^SMBS.S062)
                            Store (Zero, ^^SMBS.U062)
                            Sleep (0xC8)
                            Store (Zero, FUCC)
                            Store (0x05, DEVV)
                            Store (Zero, BUSS)
                            Store (One, HPST)
                            ALIB (0x06, CALB)
                            Notify (^^PB5.XPDV, One)
                            Store (One, FLAG)
                        }

                        If (LEqual (PWST, 0xFF))
                        {
                            Store (^^SMBS.O177, Local0)
                            And (Local0, One, Local0)
                            XOr (Local0, One, Local0)
                            Store (Local0, FLAG)
                        }
                    }

                    If (LEqual (DIND, 0x0C))
                    {
                        Store (One, ^^SMBS.MX23)
                        If (LEqual (PWST, Zero))
                        {
                            Store (Zero, ^^SMBS.O023)
                            Store (Zero, ^^SMBS.E023)
                            Store (Zero, FLAG)
                        }

                        If (LEqual (PWST, One))
                        {
                            Store (One, ^^SMBS.O023)
                            Store (Zero, ^^SMBS.E023)
                            Sleep (0xC8)
                            Store (One, FLAG)
                        }

                        If (LEqual (PWST, 0xFF))
                        {
                            Store (^^SMBS.O023, FLAG)
                        }
                    }

                    Store (0xAE02, P80H)
                    Return (FLAG)
                }
            }

            Scope (SATA.PRID)
            {
                Method (XEJX, 1, NotSerialized)
                {
                    Store (Zero, ^^^SMBS.O170)
                    Store (Zero, ^^^SMBS.E170)
                    Sleep (0x28)
                    If (LEqual (^^^AFD.HDD0, One))
                    {
                        Store (Zero, ^^^SMBS.O057)
                        Store (Zero, ^^^SMBS.E057)
                    }
                    Else
                    {
                        Store (Zero, ^^^SMBS.O055)
                        Store (Zero, ^^^SMBS.E055)
                    }

                    Sleep (0x28)
                    Store (One, ^^^SMBS.O170)
                    Store (Zero, ^^^SMBS.E170)
                    Sleep (0x28)
                }
            }

            Scope (SATA.PRID.P_D0)
            {
                Method (XEJX, 1, NotSerialized)
                {
                    Store (Zero, ^^^^SMBS.O170)
                    Store (Zero, ^^^^SMBS.E170)
                    Sleep (0x28)
                    Store (Zero, ^^^^SMBS.O057)
                    Store (Zero, ^^^^SMBS.E057)
                    Sleep (0x28)
                    Store (One, ^^^^SMBS.O170)
                    Store (Zero, ^^^^SMBS.E170)
                    Sleep (0x28)
                }
            }

            Scope (SATA.PRT1)
            {
                Method (XEJX, 1, NotSerialized)
                {
                    Store (Zero, ^^^SMBS.O170)
                    Store (Zero, ^^^SMBS.E170)
                    Sleep (0x28)
                    Store (Zero, ^^^SMBS.O055)
                    Store (Zero, ^^^SMBS.E055)
                    Sleep (0x28)
                    Store (One, ^^^SMBS.O170)
                    Store (Zero, ^^^SMBS.E170)
                    Sleep (0x28)
                }
            }

            Scope (SATA.PRT1.ODD)
            {
                Method (XEJX, 1, NotSerialized)
                {
                    Store (Zero, ^^^^SMBS.O170)
                    Store (Zero, ^^^^SMBS.E170)
                    Sleep (0x28)
                    Store (Zero, ^^^^SMBS.O055)
                    Store (Zero, ^^^^SMBS.E055)
                    Sleep (0x28)
                    Store (One, ^^^^SMBS.O170)
                    Store (Zero, ^^^^SMBS.E170)
                    Sleep (0x28)
                }
            }

            Scope (SATA.SECD)
            {
                Method (XEJX, 1, NotSerialized)
                {
                    Store (Zero, ^^^SMBS.O170)
                    Store (Zero, ^^^SMBS.E170)
                    Sleep (0x28)
                    Store (Zero, ^^^SMBS.O058)
                    Store (Zero, ^^^SMBS.E058)
                    Sleep (0x28)
                    Store (One, ^^^SMBS.O170)
                    Store (Zero, ^^^SMBS.E170)
                    Sleep (0x28)
                }
            }

            Scope (SATA.PRID.P_D1)
            {
                Method (XEJX, 1, NotSerialized)
                {
                    Store (Zero, ^^^^SMBS.O170)
                    Store (Zero, ^^^^SMBS.E170)
                    Sleep (0x28)
                    Store (Zero, ^^^^SMBS.O058)
                    Store (Zero, ^^^^SMBS.E058)
                    Sleep (0x28)
                    Store (One, ^^^^SMBS.O170)
                    Store (Zero, ^^^^SMBS.E170)
                    Sleep (0x28)
                }
            }

            Scope (OHC4)
            {
                Device (RHUB)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Device (PRT1)
                    {
                        Name (_ADR, One)  // _ADR: Address
                    }

                    Device (PRT2)
                    {
                        Name (_ADR, 0x02)  // _ADR: Address
                        Method (XEJX, 1, NotSerialized)
                        {
                            Sleep (0x28)
                            Store (Zero, ^^^^SMBS.O007)
                            Store (Zero, ^^^^SMBS.E007)
                            Sleep (0x28)
                        }
                    }
                }
            }

            Scope (PB2.VGA)
            {
                Method (XEJX, 1, NotSerialized)
                {
                    Sleep (0x28)
                    ^^^VGA.PX02 (Zero)
                    Sleep (0x28)
                }
            }

            Scope (PB3.VGA)
            {
                Method (XEJX, 1, NotSerialized)
                {
                    Sleep (0x28)
                    ^^^VGA.PX02 (Zero)
                    Sleep (0x28)
                }
            }

            Scope (PB7.XPDV)
            {
                Method (XEJX, 1, NotSerialized)
                {
                    CreateWordField (CALB, Zero, SZZE)
                    CreateField (CALB, 0x10, 0x03, FUCC)
                    CreateField (CALB, 0x13, 0x05, DEVV)
                    CreateField (CALB, 0x18, 0x08, BUSS)
                    CreateByteField (CALB, 0x04, HPST)
                    Store (0x05, SZZE)
                    Store (Zero, FUCC)
                    Store (0x07, DEVV)
                    Store (Zero, BUSS)
                    Store (Zero, HPST)
                    ALIB (0x06, CALB)
                    Sleep (0x28)
                    Store (One, ^^^SMBS.H041)
                    Store (One, ^^^SMBS.S041)
                    Store (One, ^^^SMBS.U041)
                    Sleep (0x28)
                    Store (^^^SMBS.MS04, Local0)
                    And (Local0, 0xFFFFFFF0, Local1)
                    Store (Local1, ^^^SMBS.MS04)
                    Sleep (0x28)
                    Store (Zero, ^^^SMBS.O170)
                    Store (Zero, ^^^SMBS.E170)
                    Sleep (0x28)
                    Store (Zero, ^^^SMBS.O059)
                    Store (Zero, ^^^SMBS.E059)
                    Sleep (0x28)
                    Store (One, ^^^SMBS.O170)
                    Store (Zero, ^^^SMBS.E170)
                    Sleep (0x28)
                }
            }

            Scope (SPB1.XPDV)
            {
                Method (XEJX, 1, NotSerialized)
                {
                    Store (One, ^^^SMBS.H046)
                    Store (One, ^^^SMBS.S046)
                    Store (One, ^^^SMBS.U046)
                    Sleep (0x28)
                    Store (^^^SMBS.MS03, Local0)
                    And (Local0, 0xFFFFFF0F, Local1)
                    Store (Local1, ^^^SMBS.MS03)
                    Store (Zero, ^^^SMBS.O200)
                    Store (Zero, ^^^SMBS.E200)
                    Sleep (0x28)
                }
            }

            Scope (SPB0.XPDV)
            {
                Method (XEJX, 1, NotSerialized)
                {
                    Store (One, ^^^SMBS.O175)
                    Store (Zero, ^^^SMBS.E175)
                    Store (Zero, ^^^SMBS.O012)
                    Store (Zero, ^^^SMBS.E012)
                    Sleep (0x28)
                }
            }

            Scope (PB4.XPDV)
            {
                Method (XEJX, 1, NotSerialized)
                {
                    CreateWordField (CALB, Zero, SZZE)
                    CreateField (CALB, 0x10, 0x03, FUCC)
                    CreateField (CALB, 0x13, 0x05, DEVV)
                    CreateField (CALB, 0x18, 0x08, BUSS)
                    CreateByteField (CALB, 0x04, HPST)
                    Store (0x05, SZZE)
                    Store (Zero, FUCC)
                    Store (0x04, DEVV)
                    Store (Zero, BUSS)
                    Store (Zero, HPST)
                    ALIB (0x06, CALB)
                    Sleep (0x28)
                    Store (One, ^^^SMBS.H063)
                    Store (One, ^^^SMBS.S063)
                    Store (One, ^^^SMBS.U063)
                    Sleep (0x28)
                    Store (^^^SMBS.MS01, Local0)
                    And (Local0, 0xFFFFFF0F, Local1)
                    Store (Local1, ^^^SMBS.MS01)
                    Sleep (0x28)
                    Store (Zero, ^^^SMBS.O197)
                    Store (Zero, ^^^SMBS.E197)
                    Sleep (0x28)
                }
            }

            Scope (PB5.XPDV)
            {
                Method (XEJX, 1, NotSerialized)
                {
                    CreateWordField (CALB, Zero, SZZE)
                    CreateField (CALB, 0x10, 0x03, FUCC)
                    CreateField (CALB, 0x13, 0x05, DEVV)
                    CreateField (CALB, 0x18, 0x08, BUSS)
                    CreateByteField (CALB, 0x04, HPST)
                    Store (0x05, SZZE)
                    Store (Zero, FUCC)
                    Store (0x05, DEVV)
                    Store (Zero, BUSS)
                    Store (Zero, HPST)
                    ALIB (0x06, CALB)
                    Sleep (0x28)
                    Store (One, ^^^SMBS.H062)
                    Store (One, ^^^SMBS.S062)
                    Store (One, ^^^SMBS.U062)
                    Sleep (0x28)
                    Store (^^^SMBS.MS01, Local0)
                    And (Local0, 0xFFFFFFF0, Local1)
                    Store (Local1, ^^^SMBS.MS01)
                    Sleep (0x28)
                    Store (One, ^^^SMBS.O177)
                    Store (Zero, ^^^SMBS.E177)
                    Sleep (0x28)
                    Store (Zero, ^^^SMBS.O013)
                    Store (Zero, ^^^SMBS.E013)
                    Sleep (0x28)
                }
            }

            Scope (PB6.XPDV)
            {
                Method (XEJX, 1, NotSerialized)
                {
                    CreateWordField (CALB, Zero, SZZE)
                    CreateField (CALB, 0x10, 0x03, FUCC)
                    CreateField (CALB, 0x13, 0x05, DEVV)
                    CreateField (CALB, 0x18, 0x08, BUSS)
                    CreateByteField (CALB, 0x04, HPST)
                    Store (0x05, SZZE)
                    Store (Zero, FUCC)
                    Store (0x06, DEVV)
                    Store (Zero, BUSS)
                    Store (Zero, HPST)
                    ALIB (0x06, CALB)
                    Sleep (0x28)
                    Store (One, ^^^SMBS.H064)
                    Store (One, ^^^SMBS.S064)
                    Store (One, ^^^SMBS.U064)
                    Sleep (0x28)
                    Store (^^^SMBS.MS02, Local0)
                    And (Local0, 0xFFFFFFF0, Local1)
                    Store (Local1, ^^^SMBS.MS02)
                    Sleep (0x28)
                    Store (One, ^^^SMBS.O176)
                    Store (Zero, ^^^SMBS.E176)
                    Sleep (0x28)
                    Store (Zero, ^^^SMBS.O014)
                    Store (Zero, ^^^SMBS.E014)
                    Sleep (0x28)
                }
            }

            Scope (SATA)
            {
                Device (ODDZ)
                {
                    Name (_ADR, 0x02)  // _ADR: Address
                    Name (ODPS, Zero)
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        If (LEqual (ODZC, Zero))
                        {
                            Return (Zero)
                        }
                        Else
                        {
                            Return (0x0F)
                        }
                    }

                    Method (_PS0, 0, NotSerialized)  // _PS0: Power State 0
                    {
                        Store (0xDF00, P80H)
                        If (LEqual (ODZC, One))
                        {
                            If (LEqual (VIDI, 0x78041022))
                            {
                                Sleep (0x28)
                                Store (One, ^^^SMBS.O055)
                                Store (Zero, ^^^SMBS.E055)
                                Sleep (0x28)
                            }
                        }

                        Store (Zero, ODPS)
                    }

                    Method (_PS3, 0, NotSerialized)  // _PS3: Power State 3
                    {
                        Store (0xDF03, P80H)
                        If (LEqual (ODZC, One))
                        {
                            If (LEqual (VIDI, 0x78041022))
                            {
                                Sleep (0x28)
                                Store (Zero, ^^^SMBS.O055)
                                Store (Zero, ^^^SMBS.E055)
                                Sleep (0x28)
                            }
                        }

                        Store (0x03, ODPS)
                    }

                    Method (_PSC, 0, NotSerialized)  // _PSC: Power State Current
                    {
                        Return (ODPS)
                    }

                    Device (ODD)
                    {
                        Name (_ADR, Zero)  // _ADR: Address
                        Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                        {
                            Return (One)
                        }

                        Method (XEJX, 1, NotSerialized)
                        {
                            Sleep (0x28)
                            Store (Zero, ^^^^SMBS.O055)
                            Store (Zero, ^^^^SMBS.E055)
                            Sleep (0x28)
                        }
                    }
                }
            }
        }

        OperationRegion (PIRQ, SystemIO, 0x0C00, 0x02)
        Field (PIRQ, ByteAcc, NoLock, Preserve)
        {
            PIDX,   8, 
            PDAT,   8
        }

        IndexField (PIDX, PDAT, ByteAcc, NoLock, Preserve)
        {
            PIRA,   8, 
            PIRB,   8, 
            PIRC,   8, 
            PIRD,   8, 
            PIRE,   8, 
            PIRF,   8, 
            PIRG,   8, 
            PIRH,   8, 
            Offset (0x10), 
            PIRS,   8, 
            Offset (0x13), 
            HDAD,   8, 
            Offset (0x15), 
            GEC,    8, 
            Offset (0x30), 
            USB1,   8, 
            USB2,   8, 
            USB3,   8, 
            USB4,   8, 
            USB5,   8, 
            USB6,   8, 
            USB7,   8, 
            Offset (0x40), 
            IDE,    8, 
            SATA,   8, 
            Offset (0x50), 
            GPP0,   8, 
            GPP1,   8, 
            GPP2,   8, 
            GPP3,   8
        }

        OperationRegion (KBDD, SystemIO, 0x64, One)
        Field (KBDD, ByteAcc, NoLock, Preserve)
        {
            PD64,   8
        }

        Method (DSPI, 0, NotSerialized)
        {
            INTA (0x1F)
            INTB (0x1F)
            INTC (0x1F)
            INTD (0x1F)
            Store (PD64, Local1)
            Store (0x1F, PIRE)
            Store (0x1F, PIRF)
            Store (0x1F, PIRG)
            Store (0x1F, PIRH)
        }

        Method (INTA, 1, NotSerialized)
        {
            Store (Arg0, PIRA)
            Store (Arg0, HDAD)
            Store (Arg0, GEC)
            Store (Arg0, GPP0)
            Store (Arg0, GPP0)
        }

        Method (INTB, 1, NotSerialized)
        {
            Store (Arg0, PIRB)
            Store (Arg0, USB2)
            Store (Arg0, USB4)
            Store (Arg0, USB6)
            Store (Arg0, GPP1)
            Store (Arg0, IDE)
        }

        Method (INTC, 1, NotSerialized)
        {
            Store (Arg0, PIRC)
            Store (Arg0, USB1)
            Store (Arg0, USB3)
            Store (Arg0, USB5)
            Store (Arg0, USB7)
            Store (Arg0, GPP2)
        }

        Method (INTD, 1, NotSerialized)
        {
            Store (Arg0, PIRD)
            Store (Arg0, SATA)
            Store (Arg0, GPP3)
        }

        Name (PRS1, ResourceTemplate ()
        {
            IRQ (Level, ActiveLow, Shared, )
                {3,4,5,7,10,11,12,14,15}
        })
        Name (BUFA, ResourceTemplate ()
        {
            IRQ (Level, ActiveLow, Shared, )
                {15}
        })
        Name (IPRA, ResourceTemplate ()
        {
            IRQ (Level, ActiveLow, Shared, )
                {5,10,11}
        })
        Name (IPRB, ResourceTemplate ()
        {
            IRQ (Level, ActiveLow, Shared, )
                {5,10,11}
        })
        Name (IPRC, ResourceTemplate ()
        {
            IRQ (Level, ActiveLow, Shared, )
                {5,10,11}
        })
        Name (IPRD, ResourceTemplate ()
        {
            IRQ (Level, ActiveLow, Shared, )
                {5,10,11}
        })
        Device (LNKA)
        {
            Name (_HID, EisaId ("PNP0C0F"))  // _HID: Hardware ID
            Name (_UID, One)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (PIRA)
                {
                    Return (0x0B)
                }
                Else
                {
                    Return (0x09)
                }
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (PRS1)
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                INTA (0x1F)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                CreateWordField (BUFA, One, IRQX)
                ShiftLeft (One, PIRA, IRQX)
                Return (BUFA)
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                CreateWordField (Arg0, One, IRA)
                FindSetRightBit (IRA, Local0)
                Decrement (Local0)
                Store (Local0, PIRA)
            }
        }

        Device (LNKB)
        {
            Name (_HID, EisaId ("PNP0C0F"))  // _HID: Hardware ID
            Name (_UID, 0x02)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (PIRB)
                {
                    Return (0x0B)
                }
                Else
                {
                    Return (0x09)
                }
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (PRS1)
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                INTB (0x1F)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                CreateWordField (BUFA, One, IRQX)
                ShiftLeft (One, PIRB, IRQX)
                Return (BUFA)
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                CreateWordField (Arg0, One, IRA)
                FindSetRightBit (IRA, Local0)
                Decrement (Local0)
                Store (Local0, PIRB)
            }
        }

        Device (LNKC)
        {
            Name (_HID, EisaId ("PNP0C0F"))  // _HID: Hardware ID
            Name (_UID, 0x03)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (PIRC)
                {
                    Return (0x0B)
                }
                Else
                {
                    Return (0x09)
                }
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (PRS1)
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                INTC (0x1F)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                CreateWordField (BUFA, One, IRQX)
                ShiftLeft (One, PIRC, IRQX)
                Return (BUFA)
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                CreateWordField (Arg0, One, IRA)
                FindSetRightBit (IRA, Local0)
                Decrement (Local0)
                Store (Local0, PIRC)
            }
        }

        Device (LNKD)
        {
            Name (_HID, EisaId ("PNP0C0F"))  // _HID: Hardware ID
            Name (_UID, 0x04)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (PIRD)
                {
                    Return (0x0B)
                }
                Else
                {
                    Return (0x09)
                }
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (PRS1)
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                INTD (0x1F)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                CreateWordField (BUFA, One, IRQX)
                ShiftLeft (One, PIRD, IRQX)
                Return (BUFA)
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                CreateWordField (Arg0, One, IRA)
                FindSetRightBit (IRA, Local0)
                Decrement (Local0)
                Store (Local0, PIRD)
            }
        }

        Device (LNKE)
        {
            Name (_HID, EisaId ("PNP0C0F"))  // _HID: Hardware ID
            Name (_UID, 0x05)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (PIRE)
                {
                    Return (0x0B)
                }
                Else
                {
                    Return (0x09)
                }
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (PRS1)
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                Store (0x1F, PIRE)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                CreateWordField (BUFA, One, IRQX)
                ShiftLeft (One, PIRE, IRQX)
                Return (BUFA)
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                CreateWordField (Arg0, One, IRA)
                FindSetRightBit (IRA, Local0)
                Decrement (Local0)
                Store (Local0, PIRE)
            }
        }

        Device (LNKF)
        {
            Name (_HID, EisaId ("PNP0C0F"))  // _HID: Hardware ID
            Name (_UID, 0x06)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (PIRF)
                {
                    Return (0x0B)
                }
                Else
                {
                    Return (0x09)
                }
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (PRS1)
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                Store (0x1F, PIRF)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                CreateWordField (BUFA, One, IRQX)
                ShiftLeft (One, PIRF, IRQX)
                Return (BUFA)
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                CreateWordField (Arg0, One, IRA)
                FindSetRightBit (IRA, Local0)
                Decrement (Local0)
                Store (Local0, PIRF)
            }
        }

        Device (LNKG)
        {
            Name (_HID, EisaId ("PNP0C0F"))  // _HID: Hardware ID
            Name (_UID, 0x07)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (PIRG)
                {
                    Return (0x0B)
                }
                Else
                {
                    Return (0x09)
                }
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (PRS1)
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                Store (0x1F, PIRG)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                CreateWordField (BUFA, One, IRQX)
                ShiftLeft (One, PIRG, IRQX)
                Return (BUFA)
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                CreateWordField (Arg0, One, IRA)
                FindSetRightBit (IRA, Local0)
                Decrement (Local0)
                Store (Local0, PIRG)
            }
        }

        Device (LNKH)
        {
            Name (_HID, EisaId ("PNP0C0F"))  // _HID: Hardware ID
            Name (_UID, 0x08)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (PIRH)
                {
                    Return (0x0B)
                }
                Else
                {
                    Return (0x09)
                }
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (PRS1)
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                Store (0x1F, PIRH)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                CreateWordField (BUFA, One, IRQX)
                ShiftLeft (One, PIRH, IRQX)
                Return (BUFA)
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                CreateWordField (Arg0, One, IRA)
                FindSetRightBit (IRA, Local0)
                Decrement (Local0)
                Store (Local0, PIRH)
            }
        }

        Method (GSMI, 1, NotSerialized)
        {
            Store (Arg0, APMD)
            Store (0xE4, APMC)
            Stall (0xFF)
            Stall (0xFF)
            Stall (0xFF)
            Stall (0xFF)
            Stall (0xFF)
            Stall (0xFF)
        }

        Method (S80H, 1, NotSerialized)
        {
            Store (Arg0, APMD)
            Store (0xE5, APMC)
            Stall (0xFF)
            Stall (0xFF)
            Stall (0xFF)
            Stall (0xFF)
            Stall (0xFF)
            Stall (0xFF)
        }

        Method (BSMI, 1, NotSerialized)
        {
            Store (Arg0, APMD)
            Store (0xBE, APMC)
            Stall (0xFF)
        }

        Method (JSMI, 2, NotSerialized)
        {
            Acquire (_GL, 0xFFFF)
            Store (One, JYNC)
            Store (Arg1, APMD)
            Store (Arg0, APMC)
            While (JYNC)
            {
                Sleep (0x0A)
            }

            Release (_GL)
        }

        Device (BAT0)
        {
            Name (_HID, EisaId ("PNP0C0A"))  // _HID: Hardware ID
            Name (_UID, Zero)  // _UID: Unique ID
            Name (_PCL, Package (0x01)  // _PCL: Power Consumer List
            {
                _SB
            })
            Name (BIFB, Package (0x0D)
            {
                One, 
                0x0514, 
                0x0514, 
                One, 
                0x2A30, 
                0x0138, 
                0x9C, 
                0x0D, 
                0x0D, 
                "CA54200", 
                "Li4402A", 
                " ", 
                " HP  "
            })
            Name (BSTB, Package (0x04)
            {
                Zero, 
                Ones, 
                Ones, 
                0x2710
            })
            Name (MDLS, Package (0x07)
            {
                "Unknown", 
                " 3500", 
                " 3800", 
                " 4500", 
                " 2600", 
                " 3000", 
                " 3200"
            })
            Name (CHAR, Package (0x10)
            {
                "0", 
                "1", 
                "2", 
                "3", 
                "4", 
                "5", 
                "6", 
                "7", 
                "8", 
                "9", 
                "A", 
                "B", 
                "C", 
                "D", 
                "E", 
                "F"
            })
            Method (PBFE, 3, NotSerialized)
            {
                CreateByteField (Arg0, Arg1, TIDX)
                Store (Arg2, TIDX)
            }

            Method (ITOS, 1, NotSerialized)
            {
                Store ("", Local0)
                Store (0x08, Local1)
                While (Local1)
                {
                    Decrement (Local1)
                    And (ShiftRight (Arg0, ShiftLeft (Local1, 0x02)), 0x0F, Local4)
                    Store (DerefOf (Index (CHAR, Local4)), Local2)
                    Concatenate (Local0, Local2, Local5)
                    Store (Local5, Local0)
                }

                Return (Local0)
            }

            Method (Z00C, 1, NotSerialized)
            {
                Store ("", Local0)
                Store (0x04, Local1)
                While (Local1)
                {
                    Decrement (Local1)
                    And (ShiftRight (Arg0, ShiftLeft (Local1, 0x02)), 0x0F, Local4)
                    Store (DerefOf (Index (CHAR, Local4)), Local2)
                    Concatenate (Local0, Local2, Local5)
                    Store (Local5, Local0)
                }

                Return (Local0)
            }

            Method (ITSN, 2, NotSerialized)
            {
                Store ("", Local0)
                Store (Arg1, Local1)
                While (Local1)
                {
                    Decrement (Local1)
                    And (ShiftRight (Arg0, ShiftLeft (Local1, 0x02)), 0x0F, Local4)
                    Store (DerefOf (Index (CHAR, Local4)), Local2)
                    Concatenate (Local0, Local2, Local5)
                    Store (Local5, Local0)
                }

                Return (Local0)
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (LEqual (^^PCI0.LPC0.EC.ECOK, Zero))
                {
                    Return (0x0F)
                }
                Else
                {
                    Store (^^PCI0.LPC0.EC.BATP, Local0)
                    Or (Local0, Local0, Local0)
                    If (Local0)
                    {
                        Return (0x1F)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Method (_BIF, 0, NotSerialized)  // _BIF: Battery Information
            {
                If (LEqual (^^PCI0.LPC0.EC.ECOK, Zero))
                {
                    Store (One, Index (BIFB, Zero))
                    Store (0x0514, Index (BIFB, One))
                    Store (0x0514, Index (BIFB, 0x02))
                    Store (One, Index (BIFB, 0x03))
                    Store (0x2A30, Index (BIFB, 0x04))
                    Store (0x0138, Index (BIFB, 0x05))
                    Store (0x9C, Index (BIFB, 0x06))
                    Store (0x0D, Index (BIFB, 0x07))
                    Store (0x0D, Index (BIFB, 0x08))
                    Store ("CA54200", Index (BIFB, 0x09))
                    Store ("Li4402A", Index (BIFB, 0x0A))
                    Store (" ", Index (BIFB, 0x0B))
                    Store (" HP  ", Index (BIFB, 0x0C))
                }
                Else
                {
                    Store (Zero, Index (BIFB, Zero))
                    Store (^^PCI0.LPC0.EC.BDV, Local1)
                    Store (^^PCI0.LPC0.EC.BDC, Local0)
                    Multiply (Local0, Local1, Local0)
                    Divide (Local0, 0x03E8, Local2, Local0)
                    Store (Local0, Index (BIFB, One))
                    Store (^^PCI0.LPC0.EC.BFC, Local0)
                    Multiply (Local0, Local1, Local0)
                    Divide (Local0, 0x03E8, Local2, Local0)
                    Store (Local0, Index (BIFB, 0x02))
                    Store (^^PCI0.LPC0.EC.BTEC, Index (BIFB, 0x03))
                    Store (^^PCI0.LPC0.EC.BDV, Index (BIFB, 0x04))
                    Store (^^PCI0.LPC0.EC.BCW, Local0)
                    Multiply (Local0, Local1, Local0)
                    Divide (Local0, 0x03E8, Local2, Local0)
                    Store (Local0, Index (BIFB, 0x05))
                    Store (^^PCI0.LPC0.EC.BCL, Local0)
                    Multiply (Local0, Local1, Local0)
                    Divide (Local0, 0x03E8, Local2, Local0)
                    Store (Local0, Index (BIFB, 0x06))
                    Store (^^PCI0.LPC0.EC.BFC, Local0)
                    Multiply (Local0, Local1, Local0)
                    Divide (Local0, 0x000186A0, Local2, Local0)
                    Store (Local0, Index (BIFB, 0x07))
                    Store (^^PCI0.LPC0.EC.BFC, Local0)
                    Multiply (Local0, Local1, Local0)
                    Divide (Local0, 0x000186A0, Local2, Local0)
                    Store (Local0, Index (BIFB, 0x08))
                    Store (^^PCI0.LPC0.EC.BMN, Local5)
                    And (Local5, 0x0F, Local5)
                    If (LGreater (Local5, 0x06))
                    {
                        Store (DerefOf (Index (MDLS, Zero)), Index (BIFB, 0x09))
                    }
                    Else
                    {
                        Store ("---------------- NABT < 6 ", Debug)
                        Store (^^PCI0.LPC0.EC.BMN, Local5)
                        And (Local5, 0x0F, Local5)
                        Store (Zero, Local1)
                        If (LEqual (Local5, One))
                        {
                            Store (One, Local1)
                        }

                        If (LEqual (Local5, 0x04))
                        {
                            Store (One, Local1)
                        }

                        Store (^^PCI0.LPC0.EC.BDC, Local0)
                        If (LEqual (Local1, One))
                        {
                            Store ("---------------------NiMH battery, NABT =1,4 ", Debug)
                            If (LGreaterEqual (Local0, 0x0ED8))
                            {
                                Store (Z00C (ToBCD (Local0)), Local1)
                                Store (Local1, Index (BIFB, 0x09))
                                Store ("-------------------- DC > 3800 ", Debug)
                            }
                            Else
                            {
                                Store ("3800", Index (BIFB, 0x09))
                                Store ("-------------------- DC <= 3800 ", Debug)
                            }

                            Store (^^PCI0.LPC0.EC.BDC, Local0)
                            If (LEqual (Local0, 0x11C6))
                            {
                                Store ("3800", Index (BIFB, 0x09))
                                Store ("-------------------- DC =4550 ", Debug)
                            }
                        }
                        Else
                        {
                            Store ("---------------- Li Battery ", Debug)
                            If (LGreaterEqual (Local0, 0x0BB8))
                            {
                                Store (Z00C (ToBCD (Local0)), Local1)
                                Store (Local1, Index (BIFB, 0x09))
                                Store ("--------------------- DC >= 3000 ", Debug)
                            }
                            Else
                            {
                                Store ("2600", Index (BIFB, 0x09))
                                Store ("--------------------- DC < 3000 ", Debug)
                            }
                        }
                    }

                    Store (^^PCI0.LPC0.EC.BSN, Local0)
                    Store (^^PCI0.LPC0.EC.BTY, Local0)
                    Store (Buffer (0x05) {}, Local4)
                    PBFE (Local4, Zero, Local0)
                    PBFE (Local4, 0x04, Zero)
                    Name (Z00D, "xxxxxxxx")
                    Store (Local4, Z00D)
                    Store ("Li", Index (BIFB, 0x0B))
                    If (^^PCI0.LPC0.EC.BATP)
                    {
                        Store (" Hewlett-Packard ", Index (BIFB, 0x0C))
                    }
                    Else
                    {
                        Store (" ", Index (BIFB, 0x0C))
                    }

                    Return (BIFB)
                }

                Return (BIFB)
            }

            Method (_BST, 0, NotSerialized)  // _BST: Battery Status
            {
                If (^^PCI0.LPC0.EC.ECOK)
                {
                    UBST ()
                }

                Return (BSTB)
            }

            Name (CRIT, Zero)
            Method (UBST, 0, NotSerialized)
            {
                Store (^^PCI0.LPC0.EC.BST, Index (BSTB, Zero))
                Store (^^PCI0.LPC0.EC.BPR, Local0)
                Store (^^PCI0.LPC0.EC.BDV, Local1)
                If (LGreaterEqual (Local0, 0x8000))
                {
                    Subtract (0x00010000, Local0, Local0)
                    Multiply (Local0, Local1, Local0)
                    Divide (Local0, 0x03E8, Local2, Local0)
                }
                Else
                {
                    Multiply (Local0, Local1, Local0)
                    Divide (Local0, 0x03E8, Local2, Local0)
                }

                Store (Local0, Index (BSTB, One))
                Store (^^PCI0.LPC0.EC.BFC, Local0)
                Multiply (Local0, Local1, Local0)
                Divide (Local0, 0x03E8, Local2, Local0)
                Store (^^PCI0.LPC0.EC.BPP, Local2)
                Multiply (Local0, Local2, Local0)
                Divide (Local0, 0x64, Local2, Local0)
                Add (Local0, One, Local0)
                Store (Local0, Index (BSTB, 0x02))
                Store (^^PCI0.LPC0.EC.BPV, Index (BSTB, 0x03))
                Store (DerefOf (Index (BSTB, Zero)), Local0)
                If (^^PCI0.LPC0.EC.ECOK)
                {
                    Store (^^PCI0.LPC0.EC.BCCL, Local1)
                }

                And (Local0, 0xFFFB, Local0)
                ShiftLeft (Local1, 0x02, Local1)
                Add (Local0, Local1, Local0)
                Store (Local0, Index (BSTB, Zero))
            }

            Method (INUT, 0, NotSerialized)
            {
                If (^^PCI0.LPC0.EC.ECOK)
                {
                    If (LEqual (_STA (), 0x1F))
                    {
                        UBST ()
                        _BIF ()
                        Sleep (0x01F4)
                        Notify (AC, Zero)
                        Notify (BAT0, Zero)
                        Notify (BAT0, 0x80)
                        Notify (BAT0, 0x81)
                    }
                    Else
                    {
                        UBST ()
                        Notify (AC, Zero)
                        Notify (BAT0, Zero)
                        Notify (BAT0, 0x80)
                        Notify (BAT0, 0x81)
                    }

                    ^^AC.FLPA ()
                }
            }
        }

        Device (AC)
        {
            Name (_HID, "ACPI0003")  // _HID: Hardware ID
            Name (_PCL, Package (0x01)  // _PCL: Power Consumer List
            {
                _SB
            })
            Name (XX00, Buffer (0x03) {})
            Name (ACP, Zero)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Store ("---------------------------- AC _STA", Debug)
                Return (0x0F)
            }

            Method (_PSR, 0, NotSerialized)  // _PSR: Power Source
            {
                Store ("---------------------------- AC _PSR", Debug)
                Store (ACP, Local0)
                If (^^PCI0.LPC0.EC.ECOK)
                {
                    Store (^^PCI0.LPC0.EC.ADP, Local0)
                    If (LNotEqual (Local0, ACP))
                    {
                        FLPA ()
                    }
                }

                CreateWordField (XX00, Zero, SSZE)
                CreateByteField (XX00, 0x02, ACST)
                Store (0x03, SSZE)
                If (Local0)
                {
                    Store ("---------------------------- AC on line", Debug)
                    Store (Zero, ACST)
                }
                Else
                {
                    Store ("---------------------------- AC off line", Debug)
                    Store (One, ACST)
                }

                ALIB (One, XX00)
                Return (Local0)
            }

            Method (CHAC, 0, NotSerialized)
            {
                Store ("---------------------------- AC _CHAC", Debug)
                If (^^PCI0.LPC0.EC.ECOK)
                {
                    Store (^^PCI0.LPC0.EC.ADP, Local0)
                    If (LNotEqual (Local0, ACP))
                    {
                        FLPA ()
                    }
                }
            }

            Method (FLPA, 0, NotSerialized)
            {
                Store ("---------------------------- AC _FLPA", Debug)
                If (ACP)
                {
                    Store (Zero, ACP)
                }
                Else
                {
                    Store (One, ACP)
                }

                Notify (AC, Zero)
            }
        }

        Device (ACEL)
        {
            Name (_HID, EisaId ("HPQ0004"))  // _HID: Hardware ID
            Name (DEPT, 0xFF)
            Name (CTST, 0xFF)
            Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
            {
                Interrupt (ResourceConsumer, Edge, ActiveLow, Exclusive, ,, )
                {
                    0x00000017,
                }
            })
            Name (GSEN, One)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (_OSI ("Windows 2009"))
                {
                    If (GSEN)
                    {
                        Store (0x0F, DEPT)
                    }
                    Else
                    {
                        Store (Zero, DEPT)
                    }
                }
                Else
                {
                    Store (Zero, DEPT)
                }

                Return (DEPT)
            }

            Method (CLRI, 0, Serialized)
            {
                Store (Zero, Local2)
                If (LEqual (^^PCI0.LPC0.EC.ADP, Zero))
                {
                    Store (0x04, Local0)
                    If (LEqual (^^BAT0._STA (), 0x1F))
                    {
                        Store (One, Local0)
                    }

                    If (And (Local0, 0x04))
                    {
                        Store (One, Local2)
                    }
                }

                Return (Local2)
            }

            Method (ALRD, 1, NotSerialized)
            {
                Store (^^PCI0.LPC0.EC.EGRW (0x07, Arg0, Zero), Local0)
                Return (Local0)
            }

            Method (ALWR, 2, NotSerialized)
            {
                Store (^^PCI0.LPC0.EC.EGRW (0x06, Arg0, Arg1), Local0)
                Return (Local0)
            }

            Method (ALID, 1, NotSerialized)
            {
                Return (^^PCI0.LPC0.EC.LDS)
            }

            Method (ALED, 1, NotSerialized)
            {
                If (Arg0)
                {
                    Store (One, ^^PCI0.LPC0.EC.GLD)
                }
                Else
                {
                    Store (Zero, ^^PCI0.LPC0.EC.GLD)
                }
            }

            Method (ADSN, 0, NotSerialized)
            {
                Store (Zero, Local0)
                Return (Local0)
            }
        }

        Device (LID)
        {
            Name (_HID, EisaId ("PNP0C0D"))  // _HID: Hardware ID
            Method (_LID, 0, NotSerialized)  // _LID: Lid Status
            {
                If (^^PCI0.LPC0.EC.ECOK)
                {
                    Store (^^PCI0.LPC0.EC.LDS, Local0)
                    If (Local0)
                    {
                        Notify (PCI0, Zero)
                        Return (One)
                    }
                    Else
                    {
                        Return (Zero)
                    }
                }
                Else
                {
                    Notify (PCI0, Zero)
                    Return (One)
                }
            }

            Method (_PSW, 1, NotSerialized)  // _PSW: Power State Wake
            {
            }
        }

        Device (WMID)
        {
            Method (CSTA, 0, NotSerialized)
            {
                Store (Package (0x03)
                    {
                        Zero, 
                        0x04, 
                        Buffer (0x04)
                        {
                             0x00, 0x00, 0x00, 0x00
                        }
                    }, Local0)
                Store (One, IAOR)
                Store (0xC1, SSMP)
                If (LEqual (IAOR, One))
                {
                    Store (0x1C, Index (Local0, Zero))
                }
                Else
                {
                    Store (IAOR, Index (Local0, Zero))
                    Store (And (CDAT, 0xFF), Index (DerefOf (Index (Local0, 0x02
                        )), Zero))
                }

                Return (Local0)
            }

            Method (CACT, 1, NotSerialized)
            {
                Store (Package (0x02)
                    {
                        Zero, 
                        Zero
                    }, Local0)
                Store (0x02, IAOR)
                Store (Arg0, CDAT)
                Store (0xC1, SSMP)
                If (LEqual (IAOR, 0x02))
                {
                    Store (0x1C, Index (Local0, Zero))
                }
                Else
                {
                    Store (IAOR, Index (Local0, Zero))
                }

                Store (Zero, CDAT)
                Return (Local0)
            }

            Method (CDAC, 1, NotSerialized)
            {
                Store (Package (0x02)
                    {
                        Zero, 
                        Zero
                    }, Local0)
                Store (0x03, IAOR)
                Store (Arg0, CDAT)
                Store (0xC1, SSMP)
                If (LEqual (IAOR, 0x03))
                {
                    Store (0x1C, Index (Local0, Zero))
                }
                Else
                {
                    Store (IAOR, Index (Local0, Zero))
                }

                Store (Zero, CDAT)
                Return (Local0)
            }

            Method (HDWC, 2, NotSerialized)
            {
                CreateDWordField (Arg1, 0x04, WMI7)
                CreateDWordField (Arg1, 0x08, WMI8)
                CreateDWordField (Arg1, 0x0C, WMI9)
                If (LEqual (Arg0, One))
                {
                    Store (Zero, Local0)
                }

                If (LEqual (Arg0, 0x02))
                {
                    Store (0x04, Local0)
                }

                If (LEqual (Arg0, 0x03))
                {
                    Store (0x80, Local0)
                }

                If (LEqual (Arg0, 0x04))
                {
                    Store (0x0400, Local0)
                }

                If (LEqual (Arg0, 0x05))
                {
                    Store (0x1000, Local0)
                }

                Store (Buffer (Add (0x08, Local0)) {}, Local1)
                CreateDWordField (Local1, Zero, WMIA)
                CreateDWordField (Local1, 0x04, WMIB)
                Store (0x4C494146, WMIA)
                Store (0x02, WMIB)
                Store (0x03, WMIB)
                If (LEqual (WMI7, One))
                {
                    Store (0x04, WMIB)
                    If (LEqual (WMI8, 0x07))
                    {
                        If (WMI9)
                        {
                            Store (DerefOf (Index (Arg1, 0x10)), Local3)
                            Store (GTBI (Local3), Local2)
                            Store (Zero, WMIB)
                        }
                        Else
                        {
                            Store (0x05, WMIB)
                        }
                    }

                    If (LEqual (WMI8, 0x08))
                    {
                        Store (BBHT (), Local2)
                        Store (Zero, WMIB)
                    }

                    If (LEqual (WMI8, 0x09))
                    {
                        Store (WKHC (), Local2)
                        Store (Zero, WMIB)
                    }

                    If (LEqual (WMI8, 0x0A))
                    {
                        Store (WKHF (), Local2)
                        Store (Zero, WMIB)
                    }

                    If (LEqual (WMI8, 0x0B))
                    {
                        Store (BEBA (), Local2)
                        Store (Zero, WMIB)
                    }

                    If (LEqual (WMI8, 0x0C))
                    {
                        Store (WKLB (), Local2)
                        Store (Zero, WMIB)
                    }

                    If (LEqual (WMI8, 0x0D))
                    {
                        Store (FRPT (), Local2)
                        Store (Zero, WMIB)
                    }

                    If (LEqual (WMI8, 0x0F))
                    {
                        Store (WMSA (), Local2)
                        Store (Zero, WMIB)
                    }

                    If (LEqual (WMI8, 0x10))
                    {
                        Store (GHPI (), Local2)
                        Store (Zero, WMIB)
                    }

                    If (LEqual (WMI8, 0x14))
                    {
                        Store (WPTG (), Local2)
                        Store (Zero, WMIB)
                    }

                    If (LEqual (WMI8, 0x1B))
                    {
                        Store (GWDI (), Local2)
                        Store (Zero, WMIB)
                    }

                    If (LEqual (WMI8, 0x1D))
                    {
                        Store (GDLC (), Local2)
                        Store (Zero, WMIB)
                    }

                    If (LEqual (WMI8, 0x1E))
                    {
                        Store (GBUS (), Local2)
                        Store (Zero, WMIB)
                    }

                    If (LEqual (WMI8, 0x1F))
                    {
                        Store (WMBG (), Local2)
                        Store (Zero, WMIB)
                    }

                    If (LEqual (WMI8, 0x28))
                    {
                        Store (DerefOf (Index (Arg1, 0x10)), Local3)
                        Store (GTDC (Local3), Local2)
                        Store (Zero, WMIB)
                    }

                    If (LEqual (WMI8, 0x29))
                    {
                        Store (GFCC (), Local2)
                        Store (Zero, WMIB)
                    }

                    If (LEqual (WMI8, 0x2A))
                    {
                        Store (GPES (), Local2)
                        Store (Zero, WMIB)
                    }

                    If (LEqual (WMI8, 0x2B))
                    {
                        Store (GBCO (), Local2)
                        Store (Zero, WMIB)
                    }

                    If (LEqual (WMI8, 0x2C))
                    {
                        Store (GTCS (), Local2)
                        Store (Zero, WMIB)
                    }
                }

                If (LEqual (WMI7, 0x02))
                {
                    Store (0x04, WMIB)
                    If (LAnd (LGreater (WMI8, Zero), LLessEqual (WMI8, 0x32)))
                    {
                        If (LLess (WMI9, DerefOf (Index (WMI4, Subtract (WMI8, One)
                            ))))
                        {
                            Store (0x05, WMIB)
                        }
                        Else
                        {
                            CreateDWordField (Arg1, 0x10, WMIL)
                            If (LEqual (WMI8, 0x09))
                            {
                                Store (WMIN (WMIL), Local2)
                                Store (Zero, WMIB)
                            }

                            If (LEqual (WMI8, 0x0A))
                            {
                                Store (WMIO (WMIL), Local2)
                                Store (Zero, WMIB)
                            }

                            If (LEqual (WMI8, 0x10))
                            {
                                Store (WWAR (Arg1), Local2)
                                Store (Zero, WMIB)
                            }

                            If (LEqual (WMI8, 0x14))
                            {
                                Store (WPTS (WMIL), Local2)
                                Store (Zero, WMIB)
                            }

                            If (LEqual (WMI8, 0x1B))
                            {
                                Store (SWDS (WMIL), Local2)
                                Store (Zero, WMIB)
                            }

                            If (LEqual (WMI8, 0x1D))
                            {
                                Store (SDLC (WMIL), Local2)
                                Store (Zero, WMIB)
                            }

                            If (LEqual (WMI8, 0x1E))
                            {
                                Store (SBUS (WMIL), Local2)
                                Store (Zero, WMIB)
                            }

                            If (LEqual (WMI8, 0x1F))
                            {
                                Store (Package (0x03)
                                    {
                                        Zero, 
                                        Zero, 
                                        Zero
                                    }, Local2)
                                Store (WMSG (WMIL), Index (Local2, Zero))
                                Store (Zero, WMIB)
                            }

                            If (LEqual (WMI8, 0x28))
                            {
                                Store (STDC (WMIL), Local2)
                                Store (Zero, WMIB)
                            }

                            If (LEqual (WMI8, 0x29))
                            {
                                Store (SFCC (WMIL), Local2)
                                Store (Zero, WMIB)
                            }

                            If (LEqual (WMI8, 0x2A))
                            {
                                Store (SPES (WMIL), Local2)
                                Store (Zero, WMIB)
                            }

                            If (LEqual (WMI8, 0x2B))
                            {
                                Store (Package (0x03)
                                    {
                                        Zero, 
                                        Zero, 
                                        Zero
                                    }, Local2)
                                Store (SBCO (WMIL), Index (Local2, Zero))
                                Store (Zero, WMIB)
                            }

                            If (LEqual (WMI8, 0x2C))
                            {
                                Store (STCS (WMIL), Local2)
                                Store (Zero, WMIB)
                            }
                        }
                    }
                }

                If (LEqual (WMI7, 0x00020002))
                {
                    Store (0x04, WMIB)
                    If (LAnd (LGreater (WMI8, Zero), LLessEqual (WMI8, 0x03)))
                    {
                        If (LLess (WMI9, DerefOf (Index (WMI5, Subtract (WMI8, One)
                            ))))
                        {
                            Store (0x05, WMIB)
                        }
                        Else
                        {
                            CreateDWordField (Arg1, 0x10, WMCT)
                            If (LEqual (WMI8, One))
                            {
                                Store (Package (0x03)
                                    {
                                        Zero, 
                                        0x04, 
                                        Buffer (0x04)
                                        {
                                             0x00, 0x00, 0x00, 0x00
                                        }
                                    }, Local2)
                                Store (CSTA (), Local2)
                                Store (Zero, WMIB)
                            }

                            If (LEqual (WMI8, 0x02))
                            {
                                Store (Package (0x03)
                                    {
                                        Zero, 
                                        Zero, 
                                        Zero
                                    }, Local2)
                                Store (IAOR, Index (Local2, Zero))
                                Store (CACT (WMCT), Local2)
                                Store (Zero, WMIB)
                            }

                            If (LEqual (WMI8, 0x03))
                            {
                                Store (Package (0x03)
                                    {
                                        Zero, 
                                        Zero, 
                                        Zero
                                    }, Local2)
                                Store (CDAC (WMCT), Local2)
                                Store (Zero, WMIB)
                            }
                        }
                    }
                }

                If (LEqual (WMIB, Zero))
                {
                    Store (DerefOf (Index (Local2, Zero)), WMIB)
                    If (LEqual (WMIB, Zero))
                    {
                        If (LLessEqual (DerefOf (Index (Local2, One)), Local0))
                        {
                            Store (Zero, Local0)
                            While (LLess (Local0, DerefOf (Index (Local2, One))))
                            {
                                Store (DerefOf (Index (DerefOf (Index (Local2, 0x02)), Local0)), 
                                    Index (Local1, Add (Local0, 0x08)))
                                Increment (Local0)
                            }

                            Store (0x53534150, WMIA)
                        }
                        Else
                        {
                            Store (0x05, WMIB)
                        }
                    }
                }

                Return (Local1)
            }

            Name (WMI4, Package (0x32)
            {
                0x04, 
                0x04, 
                0x04, 
                Zero, 
                0x04, 
                0x04, 
                Zero, 
                Zero, 
                0x04, 
                0x04, 
                0x0C, 
                Zero, 
                Zero, 
                Zero, 
                Zero, 
                0x08, 
                Zero, 
                Zero, 
                0x04, 
                Zero, 
                Zero, 
                Zero, 
                Zero, 
                Zero, 
                Zero, 
                Zero, 
                Zero, 
                Zero, 
                0x04, 
                0x04, 
                0x04, 
                Zero, 
                Zero, 
                0x04, 
                Zero, 
                0x04, 
                Zero, 
                Zero, 
                Zero, 
                Zero, 
                0x04, 
                0x04, 
                0x04, 
                0x04, 
                Zero, 
                Zero, 
                Zero, 
                Zero, 
                Zero, 
                Zero
            })
            Name (WMI5, Package (0x03)
            {
                Zero, 
                0x04, 
                0x04
            })
            Name (_HID, "PNP0C14")  // _HID: Hardware ID
            Name (_UID, Zero)  // _UID: Unique ID
            Name (WMIU, Zero)
            Name (WMIV, Zero)
            Name (ETYP, Buffer (One) {})
            Name (S001, Buffer (0x32) {})
            Name (BF2S, "                                                                                             ")
            Name (EVNT, Package (0x03)
            {
                Package (0x05)
                {
                    "BIOS Configuration Change", 
                    "BIOS Settings", 
                    0x04, 
                    0x05, 
                    0x02
                }, 

                Package (0x05)
                {
                    "BIOS Configuration Security", 
                    "An attempt has been made to Access BIOS features unsuccessfully", 
                    0x04, 
                    0x0A, 
                    0x06
                }, 

                Package (0x05)
                {
                    "Unknown Event", 
                    "Unknown event type", 
                    Zero, 
                    Zero, 
                    Zero
                }
            })
            Name (WMIY, Zero)
            Name (WMIZ, Zero)
            Name (WEVT, Zero)
            Name (WMBF, Buffer (0x80) {})
            CreateByteField (WMBF, Zero, WB00)
            Name (BUFF, Buffer (0x04)
            {
                 0x00, 0x00, 0x00, 0x00
            })
            CreateByteField (BUFF, Zero, OB0)
            CreateByteField (BUFF, One, OB1)
            CreateByteField (BUFF, 0x02, OB2)
            CreateByteField (BUFF, 0x03, OB3)
            CreateBitField (BUFF, Zero, OB00)
            CreateBitField (BUFF, One, OB01)
            CreateBitField (BUFF, 0x02, OB02)
            CreateBitField (BUFF, 0x03, OB03)
            CreateBitField (BUFF, 0x04, OB04)
            CreateBitField (BUFF, 0x05, OB05)
            CreateBitField (BUFF, 0x06, OB06)
            CreateBitField (BUFF, 0x07, OB07)
            CreateBitField (BUFF, 0x08, OB10)
            CreateBitField (BUFF, 0x09, OB11)
            CreateBitField (BUFF, 0x0A, OB12)
            CreateBitField (BUFF, 0x0B, OB13)
            CreateBitField (BUFF, 0x0C, OB14)
            CreateBitField (BUFF, 0x10, OB20)
            CreateBitField (BUFF, 0x11, OB21)
            CreateBitField (BUFF, 0x12, OB22)
            CreateBitField (BUFF, 0x13, OB23)
            CreateBitField (BUFF, 0x18, OB30)
            CreateBitField (BUFF, 0x19, OB31)
            CreateBitField (BUFF, 0x1A, OB32)
            CreateBitField (BUFF, 0x1B, OB33)
            CreateBitField (BUFF, 0x1C, OB34)
            CreateBitField (BUFF, 0x1D, OB35)
            CreateBitField (BUFF, 0x1E, OB36)
            CreateBitField (BUFF, 0x1F, OB37)
            Name (_WDG, Buffer (0x50)
            {
                /* 0000 */   0x34, 0xF0, 0xB7, 0x5F, 0x63, 0x2C, 0xE9, 0x45,
                /* 0008 */   0xBE, 0x91, 0x3D, 0x44, 0xE2, 0xC7, 0x07, 0xE4,
                /* 0010 */   0x41, 0x44, 0x01, 0x02, 0x79, 0x42, 0xF2, 0x95,
                /* 0018 */   0x7B, 0x4D, 0x34, 0x43, 0x93, 0x87, 0xAC, 0xCD,
                /* 0020 */   0xC6, 0x7E, 0xF6, 0x1C, 0x80, 0x00, 0x01, 0x08,
                /* 0028 */   0x21, 0x12, 0x90, 0x05, 0x66, 0xD5, 0xD1, 0x11,
                /* 0030 */   0xB2, 0xF0, 0x00, 0xA0, 0xC9, 0x06, 0x29, 0x10,
                /* 0038 */   0x41, 0x45, 0x01, 0x00, 0xD4, 0x2B, 0x99, 0xD0,
                /* 0040 */   0x7C, 0xA4, 0xFE, 0x4E, 0xB0, 0x72, 0x32, 0x4A,
                /* 0048 */   0xEC, 0x92, 0x29, 0x6C, 0x42, 0x43, 0x01, 0x00
            })
            Method (WMAD, 3, Serialized)
            {
                Store (HDWC (Arg1, Arg2), Local0)
                Return (Local0)
            }

            Name (SUBC, Zero)
            Name (SIZE, Zero)
            Name (TDA0, Zero)
            Method (GTBI, 1, NotSerialized)
            {
                Store ("HP WMI Command 0x7 (BIOS Read)", Debug)
                If (Arg0)
                {
                    Store (Package (0x02)
                        {
                            0x06, 
                            Zero
                        }, Local0)
                    Sleep (0x96)
                    Return (Local0)
                }

                If (^^PCI0.LPC0.EC.BATP)
                {
                    Store (Package (0x03)
                        {
                            Zero, 
                            0x80, 
                            Buffer (0x80) {}
                        }, Local0)
                    Store (^^PCI0.LPC0.EC.BDC, Local1)
                    Divide (Local1, 0x0100, Local2, Index (DerefOf (Index (Local0, 0x02)), 
                        One))
                    Store (Local2, Index (DerefOf (Index (Local0, 0x02)), Zero))
                    Store (^^PCI0.LPC0.EC.BFC, Local1)
                    Divide (Local1, 0x0100, Local2, Index (DerefOf (Index (Local0, 0x02)), 
                        0x03))
                    Store (Local2, Index (DerefOf (Index (Local0, 0x02)), 0x02))
                    Store (^^PCI0.LPC0.EC.BFC, Local1)
                    Divide (Local1, 0x0100, Local2, Index (DerefOf (Index (Local0, 0x02)), 
                        0x05))
                    Store (Local2, Index (DerefOf (Index (Local0, 0x02)), 0x04))
                    Store (^^PCI0.LPC0.EC.BTT, Local1)
                    Subtract (Local1, 0x0AAA, Local1)
                    Divide (Local1, 0x0A, Local2, Local1)
                    Divide (Local1, 0x0100, Local2, Index (DerefOf (Index (Local0, 0x02)), 
                        0x0B))
                    Store (Local2, Index (DerefOf (Index (Local0, 0x02)), 0x0A))
                    Store (^^PCI0.LPC0.EC.BPV, Local1)
                    Divide (Local1, 0x0100, Local2, Index (DerefOf (Index (Local0, 0x02)), 
                        0x0D))
                    Store (Local2, Index (DerefOf (Index (Local0, 0x02)), 0x0C))
                    Store (^^PCI0.LPC0.EC.BPR, Local1)
                    Divide (Local1, 0x0100, Local2, Index (DerefOf (Index (Local0, 0x02)), 
                        0x0F))
                    Store (Local2, Index (DerefOf (Index (Local0, 0x02)), 0x0E))
                    Store (^^PCI0.LPC0.EC.BDV, Local1)
                    Divide (Local1, 0x0100, Local2, Index (DerefOf (Index (Local0, 0x02)), 
                        0x11))
                    Store (Local2, Index (DerefOf (Index (Local0, 0x02)), 0x10))
                    Store (^^PCI0.LPC0.EC.BST, Local1)
                    Divide (Local1, 0x0100, Local2, Index (DerefOf (Index (Local0, 0x02)), 
                        0x13))
                    Store (Local2, Index (DerefOf (Index (Local0, 0x02)), 0x12))
                    Store (^^PCI0.LPC0.EC.BC1, Local1)
                    Divide (Local1, 0x0100, Local2, Index (DerefOf (Index (Local0, 0x02)), 
                        0x15))
                    Store (Local2, Index (DerefOf (Index (Local0, 0x02)), 0x14))
                    Store (^^PCI0.LPC0.EC.BC2, Local1)
                    Divide (Local1, 0x0100, Local2, Index (DerefOf (Index (Local0, 0x02)), 
                        0x17))
                    Store (Local2, Index (DerefOf (Index (Local0, 0x02)), 0x16))
                    Store (^^PCI0.LPC0.EC.BC3, Local1)
                    Divide (Local1, 0x0100, Local2, Index (DerefOf (Index (Local0, 0x02)), 
                        0x19))
                    Store (Local2, Index (DerefOf (Index (Local0, 0x02)), 0x18))
                    Store (^^PCI0.LPC0.EC.BC4, Local1)
                    Divide (Local1, 0x0100, Local2, Index (DerefOf (Index (Local0, 0x02)), 
                        0x1B))
                    Store (Local2, Index (DerefOf (Index (Local0, 0x02)), 0x1A))
                    Store (^^BAT0.ITSN (ToBCD (^^PCI0.LPC0.EC.BSN), 0x05), Local1)
                    Concatenate (Local1, " ", Local4)
                    Store (^^PCI0.LPC0.EC.BMD, Local1)
                    And (Local1, 0xFF, Local2)
                    And (Local1, 0xFF00, Local3)
                    ShiftLeft (Local2, 0x08, Local2)
                    ShiftRight (Local3, 0x08, Local3)
                    Or (Local2, Local3, Local1)
                    And (Local1, 0x01E0, Local2)
                    ShiftRight (Local2, 0x05, Local2)
                    Store (^^BAT0.ITSN (ToBCD (Local2), 0x02), Local2)
                    Concatenate (Local4, Local2, Local3)
                    Concatenate (Local3, "/", Local4)
                    And (Local1, 0x1F, Local2)
                    Store (^^BAT0.ITSN (ToBCD (Local2), 0x02), Local2)
                    Concatenate (Local4, Local2, Local3)
                    Concatenate (Local3, "/", Local4)
                    And (Local1, 0xFE00, Local2)
                    ShiftRight (Local2, 0x09, Local2)
                    Add (Local2, 0x07BC, Local2)
                    Store (^^BAT0.ITSN (ToBCD (Local2), 0x04), Local2)
                    Concatenate (Local4, Local2, Local3)
                    Name (SNUM, Buffer (0x10) {})
                    Store (Local3, SNUM)
                    Store (SNUM, Local3)
                    Store (0x1C, Local2)
                    Store (Zero, Local4)
                    Store (0x10, Local1)
                    While (Local1)
                    {
                        Store (DerefOf (Index (Local3, Local4)), Local5)
                        ^^BAT0.PBFE (DerefOf (Index (Local0, 0x02)), Local2, Local5)
                        Decrement (Local1)
                        Increment (Local2)
                        Increment (Local4)
                    }

                    Store (Zero, Index (DerefOf (Index (Local0, 0x02)), Local2))
                    Store (Buffer (0x10)
                        {
                            "Hewlett-Packard"
                        }, Local3)
                    Store (^^PCI0.LPC0.EC.BTN, Local3)
                    Store (0x2C, Local2)
                    Store (Zero, Local4)
                    Store (0x08, Local1)
                    While (Local1)
                    {
                        Store (DerefOf (Index (Local3, Local4)), Local5)
                        ^^BAT0.PBFE (DerefOf (Index (Local0, 0x02)), Local2, Local5)
                        Decrement (Local1)
                        Increment (Local2)
                        Increment (Local4)
                    }

                    Store (Zero, Index (DerefOf (Index (Local0, 0x02)), Local2))
                    Store (^^PCI0.LPC0.EC.CTL, Local3)
                    Store (0x3E, Local2)
                    Store (Zero, Local4)
                    Store (0x0F, Local1)
                    While (Local1)
                    {
                        Store (DerefOf (Index (Local3, Local4)), Local5)
                        Store (Local5, Index (DerefOf (Index (Local0, 0x02)), Local2))
                        Decrement (Local1)
                        Increment (Local2)
                        Increment (Local4)
                    }

                    Store (Zero, Index (DerefOf (Index (Local0, 0x02)), Local2))
                    Store (^^PCI0.LPC0.EC.BDNB, Local3)
                    Store (0x4F, Local2)
                    Store (Zero, Local4)
                    Store (0x07, Local1)
                    While (Local1)
                    {
                        Store (DerefOf (Index (Local3, Local4)), Local5)
                        Store (Local5, Index (DerefOf (Index (Local0, 0x02)), Local2))
                        Decrement (Local1)
                        Increment (Local2)
                        Increment (Local4)
                    }

                    Store (Buffer (0x05)
                        {
                            "LION"
                        }, Local3)
                    Store (0x56, Local2)
                    Store (Zero, Local4)
                    Store (0x04, Local1)
                    While (Local1)
                    {
                        Store (DerefOf (Index (Local3, Local4)), Local5)
                        Store (Local5, Index (DerefOf (Index (Local0, 0x02)), Local2))
                        Decrement (Local1)
                        Increment (Local2)
                        Increment (Local4)
                    }

                    Store (Zero, Index (DerefOf (Index (Local0, 0x02)), 0x5A))
                    Store (Zero, Index (DerefOf (Index (Local0, 0x02)), 0x5B))
                    Store (^^PCI0.LPC0.EC.BMD, Local1)
                    Divide (Local1, 0x0100, Local2, Index (DerefOf (Index (Local0, 0x02)), 
                        0x5D))
                    Store (Local2, Index (DerefOf (Index (Local0, 0x02)), 0x5C))
                    Store (^^PCI0.LPC0.EC.CHGC, Local1)
                    Divide (Local1, 0x0100, Local2, Index (DerefOf (Index (Local0, 0x02)), 
                        0x5F))
                    Store (Local2, Index (DerefOf (Index (Local0, 0x02)), 0x5E))
                    Store (^^PCI0.LPC0.EC.CHGV, Local1)
                    Divide (Local1, 0x0100, Local2, Index (DerefOf (Index (Local0, 0x02)), 
                        0x61))
                    Store (Local2, Index (DerefOf (Index (Local0, 0x02)), 0x60))
                    Store (^^PCI0.LPC0.EC.AVGC, Local1)
                    Divide (Local1, 0x0100, Local2, Index (DerefOf (Index (Local0, 0x02)), 
                        0x63))
                    Store (Local2, Index (DerefOf (Index (Local0, 0x02)), 0x62))
                    Store (^^PCI0.LPC0.EC.RTTE, Local1)
                    Divide (Local1, 0x0100, Local2, Index (DerefOf (Index (Local0, 0x02)), 
                        0x65))
                    Store (Local2, Index (DerefOf (Index (Local0, 0x02)), 0x64))
                    Store (^^PCI0.LPC0.EC.ATTE, Local1)
                    Divide (Local1, 0x0100, Local2, Index (DerefOf (Index (Local0, 0x02)), 
                        0x67))
                    Store (Local2, Index (DerefOf (Index (Local0, 0x02)), 0x66))
                    Store (^^PCI0.LPC0.EC.ATTF, Local1)
                    Divide (Local1, 0x0100, Local2, Index (DerefOf (Index (Local0, 0x02)), 
                        0x69))
                    Store (Local2, Index (DerefOf (Index (Local0, 0x02)), 0x68))
                    Store (One, Index (DerefOf (Index (Local0, 0x02)), 0x6A))
                }
                Else
                {
                    Store (Package (0x02)
                        {
                            0x06, 
                            Zero
                        }, Local0)
                    Sleep (0x96)
                }

                Return (Local0)
            }

            Method (BBHT, 0, NotSerialized)
            {
                Store (Package (0x03)
                    {
                        Zero, 
                        0x80, 
                        Buffer (0x80) {}
                    }, Local0)
                CBHB (Zero, 0x0131)
                CBHB (0x02, 0x0265)
                CBHB (0x04, 0x0267)
                CBHB (0x06, 0x0268)
                CBHB (0x08, 0x026A)
                CBHB (0x0A, 0x026B)
                CBHB (0x0C, 0x026C)
                CBHB (0x0E, 0xFFFF)
                CBHB (0x10, 0x21A9)
                CBHB (0x12, Zero)
                Store (BFHT, Index (Local0, 0x02))
                Return (Local0)
            }

            Name (BFHT, Buffer (0x80) {})
            Method (CBHB, 2, NotSerialized)
            {
                CreateWordField (BFHT, Arg0, PIO0)
                Store (Arg1, PIO0)
            }

            Method (WKHC, 0, NotSerialized)
            {
                Store (Package (0x03)
                    {
                        Zero, 
                        0x04, 
                        Buffer (0x04)
                        {
                             0x00, 0x00, 0x00, 0x00
                        }
                    }, Local0)
                If (^^PCI0.LPC0.EC.ECOK)
                {
                    Store (^^PCI0.LPC0.EC.QLB, Local1)
                    If (Local1)
                    {
                        Store (0x6E, Index (DerefOf (Index (Local0, 0x02)), Zero))
                    }
                    Else
                    {
                        Store (Zero, Index (DerefOf (Index (Local0, 0x02)), Zero))
                    }
                }
                Else
                {
                    Store (Package (0x02)
                        {
                            0x0D, 
                            Zero
                        }, Local0)
                }

                Return (Local0)
            }

            Method (WMIN, 1, NotSerialized)
            {
                If (^^PCI0.LPC0.EC.ECOK)
                {
                    If (LEqual (Arg0, 0x6E))
                    {
                        Store (One, ^^PCI0.LPC0.EC.QLB)
                        Return (Package (0x02)
                        {
                            Zero, 
                            Zero
                        })
                    }

                    If (LEqual (Arg0, Zero))
                    {
                        Store (Zero, ^^PCI0.LPC0.EC.QLB)
                        Return (Package (0x02)
                        {
                            Zero, 
                            Zero
                        })
                    }

                    Return (Package (0x02)
                    {
                        0x06, 
                        Zero
                    })
                }
                Else
                {
                    Return (Package (0x02)
                    {
                        0x0D, 
                        Zero
                    })
                }
            }

            Method (WKHF, 0, NotSerialized)
            {
                If (^^PCI0.LPC0.EC.ECOK)
                {
                    Store (Package (0x03)
                        {
                            Zero, 
                            0x04, 
                            Buffer (0x04)
                            {
                                 0x00, 0x00, 0x00, 0x00
                            }
                        }, Local0)
                    Store (^^PCI0.LPC0.EC.QKL, Index (DerefOf (Index (Local0, 0x02)), Zero))
                    Store (^^PCI0.LPC0.EC.QKH, Index (DerefOf (Index (Local0, 0x02)), One))
                    Store (^^PCI0.LPC0.EC.QKH, Local1)
                    Store (^^PCI0.LPC0.EC.QKL, Local2)
                    If (LAnd (LEqual (Local2, 0xB7), LEqual (Local1, One)))
                    {
                        If (LEqual (^^PCI0.LPC0.EC.ADP, One))
                        {
                            Store (^^PCI0.LPC0.EC.LCBA, Index (DerefOf (Index (Local0, 0x02)), 0x02))
                        }
                        Else
                        {
                            Store (^^PCI0.LPC0.EC.LCBD, Index (DerefOf (Index (Local0, 0x02)), 0x02))
                        }

                        Store (0x0A, Index (DerefOf (Index (Local0, 0x02)), 0x03))
                        Notify (^^PCI0.VGA.LCD, 0x86)
                    }

                    If (LAnd (LEqual (Local2, 0xB6), LEqual (Local1, One)))
                    {
                        If (LEqual (^^PCI0.LPC0.EC.ADP, One))
                        {
                            Store (^^PCI0.LPC0.EC.LCBA, Index (DerefOf (Index (Local0, 0x02)), 0x02))
                        }
                        Else
                        {
                            Store (^^PCI0.LPC0.EC.LCBD, Index (DerefOf (Index (Local0, 0x02)), 0x02))
                        }

                        Store (0x0A, Index (DerefOf (Index (Local0, 0x02)), 0x03))
                        Notify (^^PCI0.VGA.LCD, 0x87)
                    }

                    If (LAnd (LEqual (Local2, 0xAE), LEqual (Local1, One)))
                    {
                        Store (0x70, BCMD)
                        BSMI (Zero)
                        ^^PCI0.LPC0.EC.NSDP ()
                        Store (And (NSTE, One), ^^PCI0.VGA.LCDA)
                        Store (ShiftRight (And (NSTE, 0x02), One), ^^PCI0.VGA.CRTA)
                        Store (ShiftRight (And (NSTE, 0x10), 0x04), ^^PCI0.VGA.HDMA)
                        Store (NSTE, Index (DerefOf (Index (Local0, 0x02)), 0x02))
                        Store (CSTE, Index (DerefOf (Index (Local0, 0x02)), 0x03))
                        Notify (^^PCI0.VGA, 0x80)
                    }

                    Store (Zero, ^^PCI0.LPC0.EC.QKH)
                    Store (Zero, ^^PCI0.LPC0.EC.QKL)
                    Store (0x8A, IO80)
                    Return (Local0)
                }
                Else
                {
                    Store (Package (0x02)
                        {
                            0x0D, 
                            Zero
                        }, Local0)
                    Return (Local0)
                }
            }

            Method (WMIO, 1, NotSerialized)
            {
                If (^^PCI0.LPC0.EC.ECOK)
                {
                    Store (Package (0x03)
                        {
                            Zero, 
                            0x04, 
                            Buffer (0x04)
                            {
                                 0x00, 0x00, 0x00, 0x00
                            }
                        }, Local0)
                    Store (Arg0, Local1)
                    Store (Local1, Index (DerefOf (Index (Local0, 0x02)), Zero))
                    Store (ShiftRight (Local1, 0x08), Index (DerefOf (Index (Local0, 0x02
                        )), One))
                    If (LEqual (Arg0, 0x01AE))
                    {
                        Store (0x70, BCMD)
                        BSMI (Zero)
                        ^^PCI0.LPC0.EC.NSDP ()
                        Store (And (NSTE, One), ^^PCI0.VGA.LCDA)
                        Store (ShiftRight (And (NSTE, 0x02), One), ^^PCI0.VGA.CRTA)
                        Store (ShiftRight (And (NSTE, 0x10), 0x04), ^^PCI0.VGA.HDMA)
                        Store (NSTE, Index (DerefOf (Index (Local0, 0x02)), 0x02))
                        Store (CSTE, Index (DerefOf (Index (Local0, 0x02)), 0x03))
                        Notify (^^PCI0.VGA, 0x80)
                    }

                    If (LEqual (Arg0, 0x01B7))
                    {
                        If (LEqual (^^PCI0.LPC0.EC.ADP, One))
                        {
                            Store (^^PCI0.LPC0.EC.LCBA, Index (DerefOf (Index (Local0, 0x02)), 0x02))
                        }
                        Else
                        {
                            Store (^^PCI0.LPC0.EC.LCBD, Index (DerefOf (Index (Local0, 0x02)), 0x02))
                        }

                        Store (0x0A, Index (DerefOf (Index (Local0, 0x02)), 0x03))
                        Notify (^^PCI0.VGA.LCD, 0x86)
                    }

                    If (LEqual (Arg0, 0x01B6))
                    {
                        If (LEqual (^^PCI0.LPC0.EC.ADP, One))
                        {
                            Store (^^PCI0.LPC0.EC.LCBA, Index (DerefOf (Index (Local0, 0x02)), 0x02))
                        }
                        Else
                        {
                            Store (^^PCI0.LPC0.EC.LCBD, Index (DerefOf (Index (Local0, 0x02)), 0x02))
                        }

                        Store (0x0A, Index (DerefOf (Index (Local0, 0x02)), 0x03))
                        Notify (^^PCI0.VGA.LCD, 0x87)
                    }
                }
                Else
                {
                    Store (Package (0x02)
                        {
                            0x0D, 
                            Zero
                        }, Local0)
                    Return (Local0)
                }

                Return (Local0)
            }

            Method (BEBA, 0, NotSerialized)
            {
                Store (Package (0x03)
                    {
                        Zero, 
                        0x04, 
                        Buffer (0x04)
                        {
                             0x00, 0x00, 0x00, 0x00
                        }
                    }, Local0)
                Return (Local0)
            }

            Method (WKLB, 0, NotSerialized)
            {
                Store (0x5C, IO80)
                Store (Package (0x03)
                    {
                        Zero, 
                        0x04, 
                        Buffer (0x04)
                        {
                             0x00, 0x00, 0x00, 0x00
                        }
                    }, Local0)
                If (^^PCI0.LPC0.EC.ECOK)
                {
                    Store (^^PCI0.LPC0.EC.QKH, Local1)
                    Store (^^PCI0.LPC0.EC.QKL, Local2)
                    Store (Local1, Index (DerefOf (Index (Local0, 0x02)), One))
                    Store (Local2, Index (DerefOf (Index (Local0, 0x02)), Zero))
                    If (LAnd (LEqual (Local2, 0xA9), LEqual (Local1, 0x21)))
                    {
                        Store (^^PCI0.LPC0.EC.TPS, Index (DerefOf (Index (Local0, 0x02)), 0x02))
                        Store (Zero, Index (DerefOf (Index (Local0, 0x02)), 0x03))
                    }

                    Store (Zero, ^^PCI0.LPC0.EC.QKH)
                    Store (Zero, ^^PCI0.LPC0.EC.QKL)
                }
                Else
                {
                    Store (Package (0x02)
                        {
                            0x0D, 
                            Zero
                        }, Local0)
                }

                Store (0x7C, IO80)
                Return (Local0)
            }

            Method (FRPT, 0, NotSerialized)
            {
                Store (Package (0x03)
                    {
                        Zero, 
                        0x80, 
                        Buffer (0x80) {}
                    }, Local0)
                Store (Zero, OB0)
                Store (One, OB00)
                Store (One, OB01)
                Store (Zero, OB02)
                Store (Zero, OB03)
                Store (One, OB04)
                Store (One, OB05)
                Store (Zero, OB06)
                Store (One, OB07)
                Store (OB0, Index (DerefOf (Index (Local0, 0x02)), Zero))
                Store (^^PCI0.CPF3.SVMC, Local1)
                Or (Local1, 0x08, Local1)
                Or (Local1, 0x10, Local1)
                Store (Local1, Index (DerefOf (Index (Local0, 0x02)), One))
                Store (One, Index (DerefOf (Index (Local0, 0x02)), 0x02))
                Store (0x03, Local1)
                Store (0x7D, Local2)
                While (Local2)
                {
                    Store (Zero, Index (DerefOf (Index (Local0, 0x02)), Local1))
                    Decrement (Local2)
                    Increment (Local1)
                }

                Return (Local0)
            }

            Method (WMSA, 0, NotSerialized)
            {
                Store (Package (0x03)
                    {
                        Zero, 
                        0x04, 
                        Buffer (0x04)
                        {
                             0x00, 0x00, 0x00, 0x00
                        }
                    }, Local0)
                Store (^^PCI0.LPC0.EC.SAS, Index (DerefOf (Index (Local0, 0x02)), Zero))
                Return (Local0)
            }

            Method (GHPI, 0, NotSerialized)
            {
                Store (Package (0x03)
                    {
                        Zero, 
                        0x80, 
                        Buffer (0x80) {}
                    }, Local0)
                JSMI (0xC4, Zero)
                Store (SID0, Index (DerefOf (Index (Local0, 0x02)), Zero))
                Store (SID1, Index (DerefOf (Index (Local0, 0x02)), One))
                Store (SID2, Index (DerefOf (Index (Local0, 0x02)), 0x02))
                Store (SID3, Index (DerefOf (Index (Local0, 0x02)), 0x03))
                Store (SID4, Index (DerefOf (Index (Local0, 0x02)), 0x04))
                Store (SID5, Index (DerefOf (Index (Local0, 0x02)), 0x05))
                Store (SID6, Index (DerefOf (Index (Local0, 0x02)), 0x06))
                Store (SID7, Index (DerefOf (Index (Local0, 0x02)), 0x07))
                Return (Local0)
            }

            Method (WWAR, 1, NotSerialized)
            {
                Store ("HP WMI Command 0x10 (BIOS Write)", Debug)
                CreateByteField (Arg0, 0x10, DA0)
                CreateByteField (Arg0, 0x11, DA1)
                CreateByteField (Arg0, 0x12, DA2)
                CreateByteField (Arg0, 0x13, DA3)
                CreateByteField (Arg0, 0x14, DA4)
                CreateByteField (Arg0, 0x15, DA5)
                CreateByteField (Arg0, 0x16, DA6)
                CreateByteField (Arg0, 0x17, DA7)
                Store (DA0, SID0)
                Store (DA1, SID1)
                Store (DA2, SID2)
                Store (DA3, SID3)
                Store (DA4, SID4)
                Store (DA5, SID5)
                Store (DA6, SID6)
                Store (DA7, SID7)
                JSMI (0xC3, Zero)
                Return (Package (0x02)
                {
                    Zero, 
                    Zero
                })
            }

            Method (WPTG, 0, NotSerialized)
            {
                Store (Package (0x03)
                    {
                        Zero, 
                        0x04, 
                        Buffer (0x04)
                        {
                             0x00, 0x00, 0x00, 0x00
                        }
                    }, Local0)
                Store (WAPT, Index (DerefOf (Index (Local0, 0x02)), Zero))
                Return (Local0)
            }

            Method (WPTS, 1, NotSerialized)
            {
                And (Arg0, 0xFF, Local0)
                Store (Local0, WAPT)
                Return (Package (0x02)
                {
                    Zero, 
                    Zero
                })
            }

            Method (GWDI, 0, NotSerialized)
            {
                If (LNot (^^PCI0.LPC0.EC.WLAS))
                {
                    Store (One, ^^PCI0.LPC0.EC.WLAS)
                }

                Store (Package (0x03)
                    {
                        Zero, 
                        0x80, 
                        Buffer (0x80) {}
                    }, Local0)
                Store (One, Index (DerefOf (Index (Local0, 0x02)), Zero))
                Store (Zero, Index (DerefOf (Index (Local0, 0x02)), One))
                Store (Zero, Local2)
                Store (Local2, Index (DerefOf (Index (Local0, 0x02)), 0x02))
                Store (Local2, Index (DerefOf (Index (Local0, 0x02)), 0x03))
                Store (Local2, Index (DerefOf (Index (Local0, 0x02)), 0x04))
                Store (Local2, Index (DerefOf (Index (Local0, 0x02)), 0x05))
                Store (0x03, Index (DerefOf (Index (Local0, 0x02)), 0x06))
                Store (Zero, Index (DerefOf (Index (Local0, 0x02)), 0x07))
                Store (Zero, Index (DerefOf (Index (Local0, 0x02)), 0x08))
                Store (Zero, Index (DerefOf (Index (Local0, 0x02)), 0x09))
                Store (Zero, Index (DerefOf (Index (Local0, 0x02)), 0x0A))
                Store (Zero, Index (DerefOf (Index (Local0, 0x02)), 0x0B))
                Store (Zero, Index (DerefOf (Index (Local0, 0x02)), 0x0C))
                Store (Zero, Index (DerefOf (Index (Local0, 0x02)), 0x0D))
                Store (Zero, Index (DerefOf (Index (Local0, 0x02)), 0x0E))
                Store (Zero, Index (DerefOf (Index (Local0, 0x02)), 0x0F))
                Store (Zero, Local2)
                If (^^PCI0.LPC0.EC.WLS)
                {
                    Add (Local2, One, Local2)
                    Store (Local2, Index (DerefOf (Index (Local0, 0x02)), 0x07))
                    Store (Zero, Index (DerefOf (Index (Local0, 0x02)), Multiply (Local2, 
                        0x10)))
                    Store (Zero, Index (DerefOf (Index (Local0, 0x02)), Add (Multiply (
                        Local2, 0x10), One)))
                    Store (^^PCI0.PB5.XPDV.WVIL, Index (DerefOf (Index (Local0, 0x02)), Add (Multiply (
                        Local2, 0x10), 0x02)))
                    Store (^^PCI0.PB5.XPDV.WVIH, Index (DerefOf (Index (Local0, 0x02)), Add (Multiply (
                        Local2, 0x10), 0x03)))
                    Store (^^PCI0.PB5.XPDV.WDIL, Index (DerefOf (Index (Local0, 0x02)), Add (Multiply (
                        Local2, 0x10), 0x04)))
                    Store (^^PCI0.PB5.XPDV.WDIH, Index (DerefOf (Index (Local0, 0x02)), Add (Multiply (
                        Local2, 0x10), 0x05)))
                    Store (^^PCI0.PB5.XPDV.WSVL, Index (DerefOf (Index (Local0, 0x02)), Add (Multiply (
                        Local2, 0x10), 0x06)))
                    Store (^^PCI0.PB5.XPDV.WSVH, Index (DerefOf (Index (Local0, 0x02)), Add (Multiply (
                        Local2, 0x10), 0x07)))
                    Store (^^PCI0.PB5.XPDV.WSSL, Index (DerefOf (Index (Local0, 0x02)), Add (Multiply (
                        Local2, 0x10), 0x08)))
                    Store (^^PCI0.PB5.XPDV.WSSH, Index (DerefOf (Index (Local0, 0x02)), Add (Multiply (
                        Local2, 0x10), 0x09)))
                    Store (Zero, Index (DerefOf (Index (Local0, 0x02)), Add (Multiply (
                        Local2, 0x10), 0x0A)))
                    Store (Zero, Local1)
                    If (^^PCI0.LPC0.EC.WLD)
                    {
                        Or (Local1, One, Local1)
                    }

                    If (WLWI)
                    {
                        Or (Local1, 0x02, Local1)
                    }

                    If (^^PCI0.LPC0.EC.WLSL)
                    {
                        Or (Local1, 0x04, Local1)
                    }

                    If (BTNS)
                    {
                        Or (Local1, 0x08, Local1)
                    }

                    Store (Local1, Index (DerefOf (Index (Local0, 0x02)), Add (Multiply (
                        Local2, 0x10), 0x0B)))
                    Store (Zero, Index (DerefOf (Index (Local0, 0x02)), Add (Multiply (
                        Local2, 0x10), 0x0C)))
                    Store (Zero, Index (DerefOf (Index (Local0, 0x02)), Add (Multiply (
                        Local2, 0x10), 0x0D)))
                    Store (Zero, Index (DerefOf (Index (Local0, 0x02)), Add (Multiply (
                        Local2, 0x10), 0x0E)))
                    Store (Zero, Index (DerefOf (Index (Local0, 0x02)), Add (Multiply (
                        Local2, 0x10), 0x0F)))
                }

                If (^^PCI0.LPC0.EC.WWS)
                {
                    Add (Local2, One, Local2)
                    Store (Local2, Index (DerefOf (Index (Local0, 0x02)), 0x07))
                    Store (0x02, Index (DerefOf (Index (Local0, 0x02)), Multiply (Local2, 
                        0x10)))
                    Store (One, Index (DerefOf (Index (Local0, 0x02)), Add (Multiply (
                        Local2, 0x10), One)))
                    And (WWVD, 0xFF, Local1)
                    Store (Local1, Index (DerefOf (Index (Local0, 0x02)), Add (Multiply (
                        Local2, 0x10), 0x02)))
                    ShiftRight (WWVD, 0x08, Local1)
                    And (Local1, 0xFF, Local1)
                    Store (Local1, Index (DerefOf (Index (Local0, 0x02)), Add (Multiply (
                        Local2, 0x10), 0x03)))
                    And (WWDD, 0xFF, Local1)
                    Store (Local1, Index (DerefOf (Index (Local0, 0x02)), Add (Multiply (
                        Local2, 0x10), 0x04)))
                    ShiftRight (WWDD, 0x08, Local1)
                    And (Local1, 0xFF, Local1)
                    Store (Local1, Index (DerefOf (Index (Local0, 0x02)), Add (Multiply (
                        Local2, 0x10), 0x05)))
                    Store (Zero, Index (DerefOf (Index (Local0, 0x02)), Add (Multiply (
                        Local2, 0x10), 0x06)))
                    Store (Zero, Index (DerefOf (Index (Local0, 0x02)), Add (Multiply (
                        Local2, 0x10), 0x07)))
                    Store (Zero, Index (DerefOf (Index (Local0, 0x02)), Add (Multiply (
                        Local2, 0x10), 0x08)))
                    Store (Zero, Index (DerefOf (Index (Local0, 0x02)), Add (Multiply (
                        Local2, 0x10), 0x09)))
                    Store (One, Index (DerefOf (Index (Local0, 0x02)), Add (Multiply (
                        Local2, 0x10), 0x0A)))
                    Store (Zero, Local1)
                    If (^^PCI0.LPC0.EC.OWAN)
                    {
                        If (WAPT)
                        {
                            Or (Local1, One, Local1)
                        }
                        Else
                        {
                            If (^^PCI0.LPC0.EC.WWD)
                            {
                                Or (Local1, One, Local1)
                            }
                        }
                    }
                    Else
                    {
                        If (WAPT)
                        {
                            If (^^PCI0.LPC0.EC.BATP)
                            {
                                If (^^PCI0.LPC0.EC.WWD)
                                {
                                    Or (Local1, One, Local1)
                                }
                            }
                            Else
                            {
                                And (Local1, 0xFE, Local1)
                            }
                        }
                        Else
                        {
                            If (^^PCI0.LPC0.EC.WWD)
                            {
                                Or (Local1, One, Local1)
                            }
                        }
                    }

                    If (WWWI)
                    {
                        Or (Local1, 0x02, Local1)
                    }

                    If (^^PCI0.LPC0.EC.WWSL)
                    {
                        Or (Local1, 0x04, Local1)
                    }

                    If (BTNS)
                    {
                        Or (Local1, 0x08, Local1)
                    }

                    Store (Local1, Index (DerefOf (Index (Local0, 0x02)), Add (Multiply (
                        Local2, 0x10), 0x0B)))
                    Store (Zero, Local1)
                    If (LNot (^^PCI0.LPC0.EC.OWAN))
                    {
                        If (SIMD)
                        {
                            Or (Local1, One, Local1)
                        }
                    }

                    Store (Local1, Index (DerefOf (Index (Local0, 0x02)), Add (Multiply (
                        Local2, 0x10), 0x0C)))
                    Store (Zero, Index (DerefOf (Index (Local0, 0x02)), Add (Multiply (
                        Local2, 0x10), 0x0D)))
                    Store (Zero, Index (DerefOf (Index (Local0, 0x02)), Add (Multiply (
                        Local2, 0x10), 0x0E)))
                    Store (Zero, Index (DerefOf (Index (Local0, 0x02)), Add (Multiply (
                        Local2, 0x10), 0x0F)))
                }

                If (^^PCI0.LPC0.EC.BTS)
                {
                    Add (Local2, One, Local2)
                    Store (Local2, Index (DerefOf (Index (Local0, 0x02)), 0x07))
                    Store (One, Index (DerefOf (Index (Local0, 0x02)), Multiply (Local2, 
                        0x10)))
                    Store (One, Index (DerefOf (Index (Local0, 0x02)), Add (Multiply (
                        Local2, 0x10), One)))
                    And (BTVD, 0xFF, Local1)
                    Store (Local1, Index (DerefOf (Index (Local0, 0x02)), Add (Multiply (
                        Local2, 0x10), 0x02)))
                    ShiftRight (BTVD, 0x08, Local1)
                    And (Local1, 0xFF, Local1)
                    Store (Local1, Index (DerefOf (Index (Local0, 0x02)), Add (Multiply (
                        Local2, 0x10), 0x03)))
                    And (BTDD, 0xFF, Local1)
                    Store (Local1, Index (DerefOf (Index (Local0, 0x02)), Add (Multiply (
                        Local2, 0x10), 0x04)))
                    ShiftRight (BTDD, 0x08, Local1)
                    And (Local1, 0xFF, Local1)
                    Store (Local1, Index (DerefOf (Index (Local0, 0x02)), Add (Multiply (
                        Local2, 0x10), 0x05)))
                    Store (Zero, Index (DerefOf (Index (Local0, 0x02)), Add (Multiply (
                        Local2, 0x10), 0x06)))
                    Store (Zero, Index (DerefOf (Index (Local0, 0x02)), Add (Multiply (
                        Local2, 0x10), 0x07)))
                    Store (Zero, Index (DerefOf (Index (Local0, 0x02)), Add (Multiply (
                        Local2, 0x10), 0x08)))
                    Store (Zero, Index (DerefOf (Index (Local0, 0x02)), Add (Multiply (
                        Local2, 0x10), 0x09)))
                    And (BTVD, 0xFFFF, Local1)
                    If (LEqual (Local1, 0x0A5C))
                    {
                        And (BTDD, 0xFFFF, Local1)
                        If (LEqual (Local1, 0x21B4))
                        {
                            Store (One, WBCB)
                        }
                        Else
                        {
                            If (LEqual (Local1, 0x21E3))
                            {
                                Store (One, WBCB)
                            }
                        }
                    }
                    Else
                    {
                        Store (Zero, WBCB)
                    }

                    If (WBCB)
                    {
                        Store (Zero, Index (DerefOf (Index (Local0, 0x02)), Add (Multiply (
                            Local2, 0x10), 0x0A)))
                    }
                    Else
                    {
                        Store (0x02, Index (DerefOf (Index (Local0, 0x02)), Add (Multiply (
                            Local2, 0x10), 0x0A)))
                    }

                    Store (Zero, Local1)
                    If (WBCB)
                    {
                        If (^^PCI0.LPC0.EC.WLD)
                        {
                            Or (Local1, One, Local1)
                        }

                        If (WLWI)
                        {
                            Or (Local1, 0x02, Local1)
                        }

                        If (^^PCI0.LPC0.EC.WLSL)
                        {
                            Or (Local1, 0x04, Local1)
                        }
                    }
                    Else
                    {
                        If (^^PCI0.LPC0.EC.BTD)
                        {
                            Or (Local1, One, Local1)
                        }

                        If (BTWI)
                        {
                            Or (Local1, 0x02, Local1)
                        }

                        If (^^PCI0.LPC0.EC.BTSL)
                        {
                            Or (Local1, 0x04, Local1)
                        }
                    }

                    If (BTNS)
                    {
                        Or (Local1, 0x08, Local1)
                    }

                    Store (Local1, Index (DerefOf (Index (Local0, 0x02)), Add (Multiply (
                        Local2, 0x10), 0x0B)))
                    Store (Zero, Index (DerefOf (Index (Local0, 0x02)), Add (Multiply (
                        Local2, 0x10), 0x0C)))
                    Store (Zero, Index (DerefOf (Index (Local0, 0x02)), Add (Multiply (
                        Local2, 0x10), 0x0D)))
                    Store (Zero, Index (DerefOf (Index (Local0, 0x02)), Add (Multiply (
                        Local2, 0x10), 0x0E)))
                    Store (Zero, Index (DerefOf (Index (Local0, 0x02)), Add (Multiply (
                        Local2, 0x10), 0x0F)))
                }

                Return (Local0)
            }

            Method (SWDS, 1, NotSerialized)
            {
                Store (0xD2, INDX)
                Store (DATA, Local5)
                And (Local5, 0x08, Local5)
                If (Local5)
                {
                    If (Or (Or (^^PCI0.LPC0.EC.WLS, ^^PCI0.LPC0.EC.BTS), ^^PCI0.LPC0.EC.WWS))
                    {
                        Store (Arg0, Local3)
                        And (Local3, 0xFF, Local0)
                        ShiftRight (Local3, 0x08, Local1)
                        And (Local1, 0xFF, Local1)
                        ShiftRight (Local3, 0x10, Local2)
                        And (Local2, 0xFF, Local2)
                        ShiftRight (Local3, 0x18, Local3)
                        And (Local3, 0xFF, Local3)
                        And (BTVD, 0xFFFF, Local1)
                        If (LEqual (Local1, 0x0A5C))
                        {
                            And (BTDD, 0xFFFF, Local1)
                            If (LEqual (Local1, 0x21B4))
                            {
                                Store (One, WBCB)
                            }
                            Else
                            {
                                If (LEqual (Local1, 0x21E3))
                                {
                                    Store (One, WBCB)
                                }
                            }
                        }
                        Else
                        {
                            Store (Zero, WBCB)
                        }

                        If (LEqual (Local3, One))
                        {
                            If (LEqual (Local2, Zero))
                            {
                                If (WBCB)
                                {
                                    Store (One, BTNS)
                                    SWLS (One)
                                    SBTS (One)
                                }
                                Else
                                {
                                    SWLS (One)
                                }
                            }

                            If (LEqual (Local2, One))
                            {
                                SWWS (One)
                            }

                            If (LEqual (Local2, 0x02))
                            {
                                SBTS (One)
                            }

                            If (LEqual (Local2, 0xFE))
                            {
                                SWLS (One)
                                SBTS (One)
                                SWWS (One)
                            }

                            If (LEqual (Local2, 0xFF))
                            {
                                Store (One, BTNS)
                                SWLS (One)
                                SBTS (One)
                                SWWS (One)
                            }
                        }
                        Else
                        {
                            If (LEqual (Local2, Zero))
                            {
                                If (WBCB)
                                {
                                    SWLS (Zero)
                                    SBTS (Zero)
                                }
                                Else
                                {
                                    SWLS (Zero)
                                }
                            }

                            If (LEqual (Local2, One))
                            {
                                SWWS (Zero)
                            }

                            If (LEqual (Local2, 0x02))
                            {
                                SBTS (Zero)
                            }

                            If (LEqual (Local2, 0xFE))
                            {
                                SWLS (Zero)
                                SBTS (Zero)
                                SWWS (Zero)
                            }

                            If (LEqual (Local2, 0xFF))
                            {
                                Store (Zero, BTNS)
                                SWLS (Zero)
                                SBTS (Zero)
                                SWWS (Zero)
                            }
                        }
                    }
                }
                Else
                {
                    Return (Package (0x02)
                    {
                        0x0D, 
                        Zero
                    })
                }

                Sleep (0xC8)
                Store (0x05, WMIU)
                Store (Zero, WMIV)
                Notify (WMID, 0x80)
                Store (0x85, IO80)
                Return (Package (0x02)
                {
                    Zero, 
                    Zero
                })
            }

            Method (SBTS, 1, NotSerialized)
            {
                Store (Arg0, Local0)
                And (Local0, One, Local0)
                If (LAnd (^^PCI0.LPC0.EC.BTS, ^^PCI0.LPC0.EC.BTSL))
                {
                    Store (Local0, BTWI)
                    Store (Local0, ^^PCI0.LPC0.EC.BTD)
                    Store (Local0, BTBK)
                }
            }

            Method (SWLS, 1, NotSerialized)
            {
                Store (Arg0, Local0)
                And (Local0, One, Local0)
                If (LAnd (^^PCI0.LPC0.EC.WLS, ^^PCI0.LPC0.EC.WLSL))
                {
                    Store (Local0, WLWI)
                    Store (Local0, ^^PCI0.LPC0.EC.WLD)
                    Store (Local0, WLBK)
                }
            }

            Method (SWWS, 1, NotSerialized)
            {
                Store (Arg0, Local0)
                And (Local0, One, Local0)
                If (LAnd (^^PCI0.LPC0.EC.WWS, ^^PCI0.LPC0.EC.WWSL))
                {
                    Store (Local0, WWWI)
                    Store (Local0, ^^PCI0.LPC0.EC.WWD)
                    Store (Local0, WWBK)
                }
            }

            Method (GDLC, 0, NotSerialized)
            {
                Store (Package (0x03)
                    {
                        Zero, 
                        0x04, 
                        Buffer (0x04)
                        {
                             0x00, 0x00, 0x00, 0x00
                        }
                    }, Local0)
                Store (HSDC, Index (DerefOf (Index (Local0, 0x02)), Zero))
                Store (HSDS, Index (DerefOf (Index (Local0, 0x02)), One))
                Return (Local0)
            }

            Method (SDLC, 1, NotSerialized)
            {
                Store (0x1D, HWCT)
                Store (0x02, HWBC)
                Store (Arg0, Index (WMBF, Zero))
                Store (WMBF, HWBF)
                Store (0xC3, SSMP)
                Return (Package (0x02)
                {
                    Zero, 
                    Zero
                })
            }

            Method (GBUS, 0, NotSerialized)
            {
                Store (Package (0x03)
                    {
                        Zero, 
                        0x04, 
                        Buffer (0x04) {}
                    }, Local2)
                If (LAnd (HBUC, One))
                {
                    Store (One, Local0)
                }
                Else
                {
                    Store (Zero, Local0)
                }

                Store (HBUS, Local1)
                Store (Local0, Index (DerefOf (Index (Local2, 0x02)), Zero))
                Store (Local1, Index (DerefOf (Index (Local2, 0x02)), One))
                Return (Local2)
            }

            Method (SBUS, 1, NotSerialized)
            {
                Store (Arg0, HBUC)
                Return (Package (0x02)
                {
                    Zero, 
                    Zero
                })
            }

            Method (WMBG, 0, NotSerialized)
            {
                Store (Package (0x03)
                    {
                        Zero, 
                        0x04, 
                        Buffer (0x04)
                        {
                             0x00, 0x00, 0x00, 0x00
                        }
                    }, Local0)
                If (^^PCI0.LPC0.EC.BATP)
                {
                    If (^^PCI0.LPC0.EC.ACSC)
                    {
                        Store (0x03, Index (DerefOf (Index (Local0, 0x02)), Zero))
                    }
                    Else
                    {
                        If (^^PCI0.LPC0.EC.ADDC)
                        {
                            Store (0x02, Index (DerefOf (Index (Local0, 0x02)), Zero))
                        }
                        Else
                        {
                            If (And (^^PCI0.LPC0.EC.BST, 0x02))
                            {
                                Store (One, Index (DerefOf (Index (Local0, 0x02)), Zero))
                            }
                            Else
                            {
                                Store (Zero, Index (DerefOf (Index (Local0, 0x02)), Zero))
                            }
                        }
                    }
                }
                Else
                {
                    Store (0xFF, Index (DerefOf (Index (Local0, 0x02)), Zero))
                }

                Store (0xFF, Index (DerefOf (Index (Local0, 0x02)), One))
                Return (Local0)
            }

            Method (WMSG, 1, NotSerialized)
            {
                Store (Arg0, Local1)
                And (Local1, 0xFF, Local0)
                ShiftRight (Local1, 0x08, Local1)
                And (Local1, 0xFF, Local1)
                If (LEqual (Local0, Zero))
                {
                    If (^^PCI0.LPC0.EC.BATP)
                    {
                        If (LEqual (Local1, Zero))
                        {
                            Store (Zero, ^^PCI0.LPC0.EC.ADDC)
                            Store (Zero, ^^PCI0.LPC0.EC.ACSC)
                            Store (Zero, Local0)
                            Return (Local0)
                        }

                        If (LEqual (Local1, One))
                        {
                            Store (Zero, ^^PCI0.LPC0.EC.ADDC)
                            Store (Zero, ^^PCI0.LPC0.EC.ACSC)
                            Store (Zero, Local0)
                            Return (Local0)
                        }

                        If (LEqual (Local1, 0x02))
                        {
                            Store (One, ^^PCI0.LPC0.EC.ADDC)
                            Store (Zero, ^^PCI0.LPC0.EC.ACSC)
                            Store (Zero, Local0)
                            Return (Local0)
                        }
                    }
                    Else
                    {
                        Store (0xFF, Local0)
                        Return (Local0)
                    }
                }

                If (LEqual (Local0, One))
                {
                    Store (0xFF, Local0)
                    Return (Local0)
                }

                If (LEqual (Local0, 0x63))
                {
                    If (^^PCI0.LPC0.EC.BATP)
                    {
                        If (LEqual (Local1, Zero))
                        {
                            Store (Zero, ^^PCI0.LPC0.EC.ADDC)
                            Store (Zero, ^^PCI0.LPC0.EC.ACSC)
                            Store (Zero, Local0)
                            Return (Local0)
                        }

                        If (LEqual (Local1, One))
                        {
                            Store (One, ^^PCI0.LPC0.EC.ADDC)
                            Store (Zero, ^^PCI0.LPC0.EC.ACSC)
                            Store (Zero, Local0)
                            Return (Local0)
                        }

                        If (LEqual (Local1, 0x02))
                        {
                            Store (Zero, ^^PCI0.LPC0.EC.ADDC)
                            Store (One, ^^PCI0.LPC0.EC.ACSC)
                            Store (Zero, Local0)
                            Return (Local0)
                        }
                    }
                    Else
                    {
                        Store (0xFF, Local0)
                        Return (Local0)
                    }
                }

                Return (Local0)
            }

            Method (GTDC, 1, NotSerialized)
            {
                Store (Package (0x03)
                    {
                        Zero, 
                        0x80, 
                        Buffer (0x80) {}
                    }, Local0)
                If (LEqual (Arg0, Zero))
                {
                    Store (One, Index (DerefOf (Index (Local0, 0x02)), Zero))
                    Store (^^PCI0.LPC0.EC.CPT0, Index (DerefOf (Index (Local0, 0x02)), One))
                }

                If (LEqual (Arg0, One))
                {
                    If (LEqual (^^PCI0.LPC0.EC.UMAF, Zero))
                    {
                        Store (One, Index (DerefOf (Index (Local0, 0x02)), Zero))
                        Store (Arg0, ^^PCI0.LPC0.EC.WSCR)
                        Store (One, ^^PCI0.LPC0.EC.WRFG)
                        While (^^PCI0.LPC0.EC.WRFG)
                        {
                            Stall (0x0A)
                        }

                        Store (^^PCI0.LPC0.EC.WDA0, Index (DerefOf (Index (Local0, 0x02)), One))
                    }
                }

                If (LEqual (Arg0, 0x03))
                {
                    Store (One, Index (DerefOf (Index (Local0, 0x02)), Zero))
                    Store (Arg0, ^^PCI0.LPC0.EC.WSCR)
                    Store (One, ^^PCI0.LPC0.EC.WRFG)
                    While (^^PCI0.LPC0.EC.WRFG)
                    {
                        Stall (0x0A)
                    }

                    Store (^^PCI0.LPC0.EC.WDA0, Index (DerefOf (Index (Local0, 0x02)), One))
                }

                If (LEqual (Arg0, 0x04))
                {
                    If (^^PCI0.LPC0.EC.BATP)
                    {
                        Store (One, Index (DerefOf (Index (Local0, 0x02)), Zero))
                        Store (Arg0, ^^PCI0.LPC0.EC.WSCR)
                        Store (One, ^^PCI0.LPC0.EC.WRFG)
                        While (^^PCI0.LPC0.EC.WRFG)
                        {
                            Stall (0x0A)
                        }

                        Store (^^PCI0.LPC0.EC.WDA0, Index (DerefOf (Index (Local0, 0x02)), One))
                    }
                }

                If (LEqual (Arg0, 0x06))
                {
                    If (LGreaterEqual (^^PCI0.CPF3.CORN, Zero))
                    {
                        Store (One, Index (DerefOf (Index (Local0, 0x02)), Zero))
                        Store (^^PCI0.LPC0.EC.THFG, Index (DerefOf (Index (Local0, 0x02)), One))
                    }

                    If (LGreaterEqual (^^PCI0.CPF3.CORN, One))
                    {
                        Store (0x02, Index (DerefOf (Index (Local0, 0x02)), Zero))
                        Store (^^PCI0.LPC0.EC.THFG, Index (DerefOf (Index (Local0, 0x02)), 0x02))
                    }

                    If (LGreaterEqual (^^PCI0.CPF3.CORN, 0x02))
                    {
                        Store (0x03, Index (DerefOf (Index (Local0, 0x02)), Zero))
                        Store (^^PCI0.LPC0.EC.THFG, Index (DerefOf (Index (Local0, 0x02)), 0x03))
                    }

                    If (LGreaterEqual (^^PCI0.CPF3.CORN, 0x03))
                    {
                        Store (0x04, Index (DerefOf (Index (Local0, 0x02)), Zero))
                        Store (^^PCI0.LPC0.EC.THFG, Index (DerefOf (Index (Local0, 0x02)), 0x04))
                    }
                }

                If (LEqual (Arg0, 0x10))
                {
                    Store (One, Index (DerefOf (Index (Local0, 0x02)), Zero))
                    Store (CDA0, Index (DerefOf (Index (Local0, 0x02)), One))
                }

                If (LEqual (Arg0, 0x11))
                {
                    If (LEqual (^^PCI0.LPC0.EC.UMAF, Zero))
                    {
                        Store (One, Index (DerefOf (Index (Local0, 0x02)), Zero))
                        Store (GDA0, Index (DerefOf (Index (Local0, 0x02)), One))
                    }
                }

                If (LEqual (Arg0, 0x13))
                {
                    Store (One, Index (DerefOf (Index (Local0, 0x02)), Zero))
                    Store (FDA0, Index (DerefOf (Index (Local0, 0x02)), One))
                }

                If (LEqual (Arg0, 0x14))
                {
                    If (^^PCI0.LPC0.EC.BATP)
                    {
                        Store (One, Index (DerefOf (Index (Local0, 0x02)), Zero))
                        Store (BDA0, Index (DerefOf (Index (Local0, 0x02)), One))
                    }
                }

                If (LEqual (Arg0, 0x20))
                {
                    Store (One, Index (DerefOf (Index (Local0, 0x02)), Zero))
                    Store (Arg0, ^^PCI0.LPC0.EC.WSCR)
                    Store (One, ^^PCI0.LPC0.EC.WRFG)
                    While (^^PCI0.LPC0.EC.WRFG)
                    {
                        Stall (0x0A)
                    }

                    Store (^^PCI0.LPC0.EC.WDA0, Index (DerefOf (Index (Local0, 0x02)), One))
                }

                If (LEqual (Arg0, 0x21))
                {
                    If (LEqual (^^PCI0.LPC0.EC.UMAF, Zero))
                    {
                        Store (One, Index (DerefOf (Index (Local0, 0x02)), Zero))
                        Store (Arg0, ^^PCI0.LPC0.EC.WSCR)
                        Store (One, ^^PCI0.LPC0.EC.WRFG)
                        While (^^PCI0.LPC0.EC.WRFG)
                        {
                            Stall (0x0A)
                        }

                        Store (^^PCI0.LPC0.EC.WDA0, Index (DerefOf (Index (Local0, 0x02)), One))
                    }
                }

                If (LEqual (Arg0, 0x23))
                {
                    Store (One, Index (DerefOf (Index (Local0, 0x02)), Zero))
                    Store (Arg0, ^^PCI0.LPC0.EC.WSCR)
                    Store (One, ^^PCI0.LPC0.EC.WRFG)
                    While (^^PCI0.LPC0.EC.WRFG)
                    {
                        Stall (0x0A)
                    }

                    Store (^^PCI0.LPC0.EC.WDA0, Index (DerefOf (Index (Local0, 0x02)), One))
                }

                If (LEqual (Arg0, 0x24))
                {
                    If (^^PCI0.LPC0.EC.BATP)
                    {
                        Store (One, Index (DerefOf (Index (Local0, 0x02)), Zero))
                        Store (Arg0, ^^PCI0.LPC0.EC.WSCR)
                        Store (One, ^^PCI0.LPC0.EC.WRFG)
                        While (^^PCI0.LPC0.EC.WRFG)
                        {
                            Stall (0x0A)
                        }

                        Store (^^PCI0.LPC0.EC.WDA0, Index (DerefOf (Index (Local0, 0x02)), One))
                    }
                }

                If (LEqual (Arg0, 0xAA))
                {
                    Store (^^PCI0.LPC0.EC.WTTS, Index (DerefOf (Index (Local0, 0x02)), Zero))
                }

                Return (Local0)
            }

            Method (STDC, 1, NotSerialized)
            {
                Store (Arg0, Local1)
                And (Local1, 0xFF, SUBC)
                ShiftRight (Local1, 0x08, Local1)
                And (Local1, 0xFF, SIZE)
                ShiftRight (Local1, 0x08, Local1)
                And (Local1, 0xFF, TDA0)
                If (LGreaterEqual (SIZE, 0x02))
                {
                    Return (Package (0x02)
                    {
                        0x06, 
                        Zero
                    })
                }

                If (LEqual (SUBC, 0x10))
                {
                    Store (0x55, CDAF)
                    Store (TDA0, CDA0)
                    Return (Package (0x02)
                    {
                        Zero, 
                        Zero
                    })
                }

                If (LEqual (SUBC, 0x11))
                {
                    If (LEqual (^^PCI0.LPC0.EC.UMAF, Zero))
                    {
                        Store (0x55, GDAF)
                        Store (TDA0, GDA0)
                    }

                    Return (Package (0x02)
                    {
                        Zero, 
                        Zero
                    })
                }

                If (LEqual (SUBC, 0x13))
                {
                    Store (0x55, FDAF)
                    Store (TDA0, FDA0)
                    Return (Package (0x02)
                    {
                        Zero, 
                        Zero
                    })
                }

                If (LEqual (SUBC, 0x14))
                {
                    If (^^PCI0.LPC0.EC.BATP)
                    {
                        Store (0x55, BDAF)
                        Store (TDA0, BDA0)
                    }

                    Return (Package (0x02)
                    {
                        Zero, 
                        Zero
                    })
                }

                If (LEqual (SUBC, 0x20))
                {
                    Store (SUBC, ^^PCI0.LPC0.EC.WSCR)
                    Store (TDA0, ^^PCI0.LPC0.EC.WDA0)
                    Store (One, ^^PCI0.LPC0.EC.WWFG)
                    Return (Package (0x02)
                    {
                        Zero, 
                        Zero
                    })
                }

                If (LEqual (SUBC, 0x21))
                {
                    If (LEqual (^^PCI0.LPC0.EC.UMAF, Zero))
                    {
                        Store (SUBC, ^^PCI0.LPC0.EC.WSCR)
                        Store (TDA0, ^^PCI0.LPC0.EC.WDA0)
                        Store (One, ^^PCI0.LPC0.EC.WWFG)
                    }

                    Return (Package (0x02)
                    {
                        Zero, 
                        Zero
                    })
                }

                If (LEqual (SUBC, 0x23))
                {
                    Store (SUBC, ^^PCI0.LPC0.EC.WSCR)
                    Store (TDA0, ^^PCI0.LPC0.EC.WDA0)
                    Store (One, ^^PCI0.LPC0.EC.WWFG)
                    Return (Package (0x02)
                    {
                        Zero, 
                        Zero
                    })
                }

                If (LEqual (SUBC, 0x24))
                {
                    If (^^PCI0.LPC0.EC.BATP)
                    {
                        Store (SUBC, ^^PCI0.LPC0.EC.WSCR)
                        Store (TDA0, ^^PCI0.LPC0.EC.WDA0)
                        Store (One, ^^PCI0.LPC0.EC.WWFG)
                    }

                    Return (Package (0x02)
                    {
                        Zero, 
                        Zero
                    })
                }

                If (LEqual (SUBC, 0xAA))
                {
                    Store (SUBC, ^^PCI0.LPC0.EC.WSCR)
                    Store (One, ^^PCI0.LPC0.EC.WWFG)
                    Return (Package (0x02)
                    {
                        Zero, 
                        Zero
                    })
                }

                Return (Package (0x02)
                {
                    0x06, 
                    Zero
                })
            }

            Method (GFCC, 0, NotSerialized)
            {
                Store (Package (0x03)
                    {
                        Zero, 
                        0x04, 
                        Buffer (0x04)
                        {
                             0x00, 0x00, 0x00, 0x00
                        }
                    }, Local0)
                Store (FACM, Index (DerefOf (Index (Local0, 0x02)), Zero))
                Return (Local0)
            }

            Method (SFCC, 1, NotSerialized)
            {
                Store (0x29, HWCT)
                Store (0x02, HWBC)
                Store (Arg0, Index (WMBF, Zero))
                Store (WMBF, HWBF)
                Store (0xC3, SSMP)
                Store (Arg0, FACM)
                Return (Package (0x02)
                {
                    Zero, 
                    Zero
                })
            }

            Method (GPES, 0, NotSerialized)
            {
                Store (Package (0x03)
                    {
                        Zero, 
                        0x04, 
                        Buffer (0x04)
                        {
                             0x00, 0x00, 0x00, 0x00
                        }
                    }, Local0)
                Store (0x2A, HWCT)
                Store (One, HWBC)
                Store (0xC3, SSMP)
                Store (HWBF, WMBF)
                Store (WB00, Index (DerefOf (Index (Local0, 0x02)), Zero))
                Return (Local0)
            }

            Method (SPES, 1, NotSerialized)
            {
                Store (0x2A, HWCT)
                Store (0x02, HWBC)
                Store (Arg0, Index (WMBF, Zero))
                Store (WMBF, HWBF)
                Store (0xC3, SSMP)
                Return (Package (0x02)
                {
                    Zero, 
                    Zero
                })
            }

            Method (GBCO, 0, NotSerialized)
            {
                Store (Package (0x03)
                    {
                        Zero, 
                        0x04, 
                        Buffer (0x04)
                        {
                             0x00, 0x00, 0x00, 0x00
                        }
                    }, Local0)
                If (^^PCI0.LPC0.EC.BATP)
                {
                    Store (^^PCI0.LPC0.EC.W2BG, Index (DerefOf (Index (Local0, 0x02)), Zero))
                }
                Else
                {
                    Store (0xFF, Index (DerefOf (Index (Local0, 0x02)), Zero))
                }

                Store (0xFF, Index (DerefOf (Index (Local0, 0x02)), One))
                Return (Local0)
            }

            Method (SBCO, 1, NotSerialized)
            {
                Store (Arg0, Local1)
                And (Local1, 0xFF, Local0)
                ShiftRight (Local1, 0x08, Local1)
                And (Local1, 0xFF, Local1)
                If (LEqual (Local0, Zero))
                {
                    If (^^PCI0.LPC0.EC.BATP)
                    {
                        Store (Local1, ^^PCI0.LPC0.EC.W2BS)
                        Return (^^PCI0.LPC0.EC.W2BR)
                    }
                    Else
                    {
                        Store (0x36, Local0)
                        Return (Local0)
                    }
                }

                If (LEqual (Local0, One))
                {
                    Store (0x36, Local0)
                    Return (Local0)
                }

                Return (Local0)
            }

            Method (GTCS, 0, NotSerialized)
            {
                Store (Package (0x03)
                    {
                        Zero, 
                        0x04, 
                        Buffer (0x04)
                        {
                             0x00, 0x00, 0x00, 0x00
                        }
                    }, Local0)
                Store (^^PCI0.LPC0.EC.ACCS, Index (DerefOf (Index (Local0, 0x02)), Zero))
                Store (^^PCI0.LPC0.EC.MMS, Index (DerefOf (Index (Local0, 0x02)), One))
                Store (^^PCI0.LPC0.EC.DMS, Index (DerefOf (Index (Local0, 0x02)), 0x02))
                Return (Local0)
            }

            Method (STCS, 1, NotSerialized)
            {
                Store (Arg0, Local3)
                ShiftRight (Local3, 0x08, Local1)
                And (Local1, 0xFF, ^^PCI0.LPC0.EC.MMS)
                ShiftRight (Local3, 0x10, Local2)
                And (Local2, 0xFF, ^^PCI0.LPC0.EC.DMS)
                Return (Package (0x02)
                {
                    Zero, 
                    Zero
                })
            }

            Method (_WED, 1, NotSerialized)  // _Wxx: Wake Event
            {
                If (LEqual (Arg0, 0xA0))
                {
                    If (LEqual (DerefOf (Index (ETYP, Zero)), Zero))
                    {
                        Store (S001, BF2S)
                        Store (BF2S, Index (DerefOf (Index (EVNT, Zero)), One))
                        Return (DerefOf (Index (EVNT, Zero)))
                    }

                    If (LEqual (DerefOf (Index (ETYP, Zero)), One))
                    {
                        Return (DerefOf (Index (EVNT, One)))
                    }
                    Else
                    {
                        Return (DerefOf (Index (EVNT, 0x02)))
                    }
                }
                Else
                {
                    Store (Buffer (0x08)
                        {
                             0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                        }, Local0)
                    CreateDWordField (Local0, Zero, EVID)
                    CreateDWordField (Local0, 0x04, EVDA)
                    Store (WMIU, EVID)
                    Store (WMIV, EVDA)
                    If (LNotEqual (WMIY, Zero))
                    {
                        Store (WMIY, WMIU)
                        Store (WMIZ, WMIV)
                        Store (WMIU, EVID)
                        Store (WMIV, EVDA)
                        Store (Zero, WMIY)
                        Store (Zero, WMIZ)
                        If (LEqual (WEVT, Zero))
                        {
                            Store (One, WEVT)
                            Notify (WMID, 0x80)
                        }
                    }
                    Else
                    {
                        Store (Zero, WMIU)
                        Store (Zero, WMIV)
                    }

                    Return (Local0)
                }
            }

            Name (WQAE, Buffer (0x08A9)
            {
                /* 0000 */   0x46, 0x4F, 0x4D, 0x42, 0x01, 0x00, 0x00, 0x00,
                /* 0008 */   0x99, 0x08, 0x00, 0x00, 0x8A, 0x3A, 0x00, 0x00,
                /* 0010 */   0x44, 0x53, 0x00, 0x01, 0x1A, 0x7D, 0xDA, 0x54,
                /* 0018 */   0x98, 0x4B, 0x9C, 0x00, 0x01, 0x06, 0x18, 0x42,
                /* 0020 */   0x10, 0x13, 0x10, 0x22, 0x21, 0x04, 0x12, 0x01,
                /* 0028 */   0xA1, 0xC8, 0x2C, 0x0C, 0x86, 0x10, 0x38, 0x2E,
                /* 0030 */   0x84, 0x1C, 0x40, 0x88, 0x59, 0x50, 0x08, 0x21,
                /* 0038 */   0x10, 0xEA, 0x4F, 0x20, 0xBF, 0x02, 0x10, 0x3A,
                /* 0040 */   0x14, 0x20, 0x53, 0x80, 0x41, 0x01, 0x4E, 0x11,
                /* 0048 */   0x44, 0xD0, 0xAB, 0x00, 0x9B, 0x02, 0x4C, 0x0A,
                /* 0050 */   0xB0, 0x28, 0x40, 0xBB, 0x00, 0xCB, 0x02, 0x74,
                /* 0058 */   0x0B, 0x90, 0x0E, 0x4B, 0x44, 0x82, 0xA3, 0xC4,
                /* 0060 */   0x80, 0xA3, 0x74, 0x62, 0x0B, 0x37, 0x6C, 0xF0,
                /* 0068 */   0x42, 0x51, 0x34, 0x83, 0x28, 0x09, 0x2A, 0x17,
                /* 0070 */   0xE0, 0x1B, 0x41, 0xE0, 0xE5, 0x0A, 0x90, 0x3C,
                /* 0078 */   0x01, 0x69, 0x16, 0x60, 0x58, 0x80, 0x75, 0x01,
                /* 0080 */   0xB2, 0x87, 0x40, 0xA5, 0x0E, 0x01, 0x25, 0x67,
                /* 0088 */   0x08, 0xA8, 0x01, 0xB4, 0x3A, 0x01, 0xE1, 0x57,
                /* 0090 */   0x3A, 0x25, 0x24, 0x41, 0x38, 0x63, 0x15, 0x8F,
                /* 0098 */   0xAF, 0x59, 0x34, 0x3D, 0x27, 0x39, 0xC7, 0x90,
                /* 00A0 */   0xE3, 0x71, 0xA1, 0x07, 0xC1, 0x05, 0x78, 0x18,
                /* 00A8 */   0x06, 0x1D, 0xB2, 0x22, 0x6B, 0x80, 0xC1, 0x58,
                /* 00B0 */   0x18, 0x0B, 0x75, 0x31, 0x6A, 0xD4, 0x48, 0xD9,
                /* 00B8 */   0x80, 0x0C, 0x51, 0x12, 0x1C, 0x6A, 0xD4, 0x96,
                /* 00C0 */   0x28, 0xC0, 0xFC, 0x38, 0x34, 0xBB, 0xB6, 0xC7,
                /* 00C8 */   0x42, 0x20, 0x99, 0xB4, 0xA1, 0xA0, 0xA4, 0x40,
                /* 00D0 */   0x68, 0x6C, 0x67, 0xEA, 0x19, 0x45, 0x3C, 0x52,
                /* 00D8 */   0xC3, 0x24, 0xF0, 0x28, 0x22, 0x1B, 0x8D, 0x43,
                /* 00E0 */   0x63, 0x87, 0xE1, 0x61, 0x06, 0x3B, 0x88, 0xC3,
                /* 00E8 */   0x38, 0xE6, 0xC8, 0x09, 0x3C, 0xA1, 0x23, 0x3D,
                /* 00F0 */   0xF2, 0xC2, 0xE6, 0x29, 0xD4, 0x18, 0xCD, 0x41,
                /* 00F8 */   0x11, 0xB8, 0xD0, 0x18, 0x19, 0x10, 0xF2, 0x3C,
                /* 0100 */   0x7E, 0x8D, 0xC4, 0x04, 0x76, 0x2F, 0xC0, 0x1A,
                /* 0108 */   0xA6, 0x60, 0x1B, 0x9B, 0x98, 0xFE, 0xFF, 0x10,
                /* 0110 */   0x47, 0x1E, 0xA3, 0xAD, 0xB9, 0x0B, 0x29, 0x4C,
                /* 0118 */   0x8C, 0x28, 0xC1, 0xE2, 0x55, 0x3C, 0x0D, 0xA1,
                /* 0120 */   0x3C, 0x29, 0x84, 0x8A, 0x54, 0x19, 0x8A, 0x86,
                /* 0128 */   0x1E, 0xA5, 0x42, 0x01, 0xCE, 0xE6, 0x21, 0xDC,
                /* 0130 */   0x1A, 0x41, 0x85, 0x10, 0x2B, 0x52, 0xAC, 0xF6,
                /* 0138 */   0x07, 0x41, 0x42, 0x2E, 0x5B, 0xC7, 0x07, 0x47,
                /* 0140 */   0x1A, 0x0D, 0xEA, 0x50, 0xE0, 0xB1, 0x7B, 0xDC,
                /* 0148 */   0xCF, 0x02, 0x3E, 0x08, 0x9C, 0x5B, 0x90, 0xA3,
                /* 0150 */   0x3B, 0x8B, 0x47, 0x85, 0x83, 0xF6, 0xF0, 0xD8,
                /* 0158 */   0x6D, 0xC0, 0x67, 0x08, 0x9F, 0x02, 0xF0, 0xAE,
                /* 0160 */   0x01, 0x35, 0xFD, 0x83, 0x67, 0x82, 0xE0, 0x50,
                /* 0168 */   0x43, 0xF4, 0xA8, 0xC3, 0x9D, 0xC0, 0x21, 0x32,
                /* 0170 */   0x40, 0x4F, 0xEA, 0xB8, 0xB1, 0x83, 0x3B, 0x99,
                /* 0178 */   0x83, 0x7E, 0x6F, 0x68, 0xF6, 0xC6, 0x40, 0x08,
                /* 0180 */   0x8E, 0xC7, 0x97, 0x05, 0x36, 0xE1, 0x04, 0x96,
                /* 0188 */   0x3F, 0x08, 0xD4, 0xC8, 0x0C, 0xED, 0x51, 0x9E,
                /* 0190 */   0x56, 0xCC, 0x90, 0xCF, 0x0C, 0x26, 0xB0, 0x58,
                /* 0198 */   0x08, 0x29, 0x80, 0xD0, 0x78, 0xC0, 0x7F, 0x03,
                /* 01A0 */   0x78, 0xC0, 0xF0, 0xCD, 0xC0, 0xF3, 0x35, 0xC1,
                /* 01A8 */   0xB0, 0x10, 0x32, 0xB2, 0x0A, 0x8F, 0x87, 0x8E,
                /* 01B0 */   0xC2, 0xD7, 0x83, 0xC3, 0x39, 0xAD, 0x78, 0x26,
                /* 01B8 */   0x18, 0x0E, 0x42, 0x27, 0x09, 0x8B, 0x1A, 0x36,
                /* 01C0 */   0x3D, 0x39, 0xF0, 0x43, 0x03, 0xBB, 0x19, 0x9C,
                /* 01C8 */   0xC1, 0x23, 0x80, 0x47, 0x72, 0x42, 0xFE, 0x98,
                /* 01D0 */   0x78, 0x60, 0xF0, 0x01, 0xF1, 0xDE, 0xA7, 0x4C,
                /* 01D8 */   0x46, 0x70, 0xA6, 0x06, 0xF4, 0x71, 0xC0, 0xFF,
                /* 01E0 */   0xFF, 0xA1, 0xF0, 0x21, 0x7A, 0x7C, 0xA7, 0x7C,
                /* 01E8 */   0xBC, 0x96, 0x00, 0x21, 0x59, 0xE3, 0x84, 0x7E,
                /* 01F0 */   0x87, 0xF0, 0xF1, 0xC3, 0x47, 0x16, 0x47, 0x84,
                /* 01F8 */   0x90, 0x93, 0x53, 0x00, 0x1A, 0xF8, 0x74, 0xCF,
                /* 0200 */   0x2E, 0xC2, 0xE9, 0x7A, 0x52, 0x0E, 0x34, 0x0C,
                /* 0208 */   0x3A, 0x4E, 0x70, 0x9C, 0x07, 0xC0, 0x31, 0x4E,
                /* 0210 */   0xF8, 0xE7, 0x02, 0xF8, 0x03, 0xE4, 0xA7, 0x8C,
                /* 0218 */   0x57, 0x8C, 0x04, 0x8E, 0x39, 0x42, 0xF4, 0xB9,
                /* 0220 */   0xC6, 0x23, 0xC4, 0xC2, 0x3F, 0x55, 0x14, 0x3E,
                /* 0228 */   0x10, 0x32, 0x46, 0x70, 0x01, 0x7A, 0x8C, 0xC0,
                /* 0230 */   0x37, 0xE0, 0x18, 0xD1, 0x47, 0x09, 0xAE, 0xFE,
                /* 0238 */   0xA0, 0x41, 0x07, 0x88, 0xFB, 0xFF, 0x0F, 0x10,
                /* 0240 */   0x3E, 0xA8, 0x07, 0x08, 0x7C, 0xA3, 0x1F, 0x3D,
                /* 0248 */   0xD0, 0xE3, 0xB2, 0xE8, 0xF3, 0x80, 0x8C, 0x9F,
                /* 0250 */   0x68, 0x34, 0x2F, 0x7E, 0x3A, 0xE0, 0x87, 0x0F,
                /* 0258 */   0xF0, 0x80, 0x7A, 0x48, 0x38, 0x50, 0xCC, 0xB4,
                /* 0260 */   0x39, 0xE8, 0xB3, 0xCB, 0xA1, 0x63, 0x87, 0x0B,
                /* 0268 */   0xFE, 0x13, 0x08, 0xB8, 0xE4, 0x1D, 0xC2, 0x40,
                /* 0270 */   0x31, 0x62, 0xFC, 0x39, 0xC8, 0xA7, 0x30, 0xF0,
                /* 0278 */   0xFF, 0xFF, 0x4F, 0x61, 0xB8, 0x11, 0xF0, 0x20,
                /* 0280 */   0xAF, 0x05, 0x9F, 0xB6, 0xA8, 0x74, 0x18, 0xD4,
                /* 0288 */   0x81, 0x0B, 0x30, 0x09, 0x1A, 0xE1, 0x59, 0xA2,
                /* 0290 */   0x36, 0x08, 0x01, 0xBF, 0x4D, 0xBC, 0x6D, 0xF9,
                /* 0298 */   0x16, 0x10, 0xE7, 0xC8, 0x7B, 0x3B, 0x70, 0x11,
                /* 02A0 */   0x8C, 0x08, 0xA7, 0x1D, 0xCA, 0x63, 0x88, 0x18,
                /* 02A8 */   0x23, 0xCA, 0xE3, 0x96, 0x51, 0xDE, 0xB6, 0x5E,
                /* 02B0 */   0x00, 0xE2, 0x9D, 0xE5, 0xF3, 0x96, 0x31, 0x82,
                /* 02B8 */   0x47, 0x7E, 0xE0, 0x62, 0x62, 0xDF, 0x13, 0xFA,
                /* 02C0 */   0xB9, 0xF9, 0xC0, 0x05, 0x38, 0xFB, 0xFF, 0x1F,
                /* 02C8 */   0xB8, 0x00, 0x0E, 0x05, 0x3D, 0x0C, 0xA1, 0x87,
                /* 02D0 */   0xE1, 0xA9, 0x9C, 0xCB, 0x13, 0xE5, 0xA9, 0x44,
                /* 02D8 */   0x8C, 0x1A, 0x26, 0xEA, 0x33, 0x94, 0x2F, 0x1A,
                /* 02E0 */   0x3E, 0x10, 0x81, 0xEF, 0xCC, 0x05, 0xFC, 0xFE,
                /* 02E8 */   0xFF, 0x07, 0x22, 0x38, 0x02, 0xCF, 0x34, 0xA0,
                /* 02F0 */   0xF4, 0x39, 0x03, 0x81, 0x9C, 0x8A, 0x0F, 0x35,
                /* 02F8 */   0xC0, 0x48, 0xF4, 0xAB, 0xC1, 0x27, 0x1A, 0x2A,
                /* 0300 */   0x13, 0x06, 0x75, 0xA8, 0x01, 0x4C, 0x5E, 0x61,
                /* 0308 */   0x9E, 0x46, 0xCF, 0xF9, 0x59, 0xC6, 0xA7, 0x1A,
                /* 0310 */   0x1F, 0x4A, 0x8D, 0x63, 0x88, 0x97, 0x99, 0x87,
                /* 0318 */   0x1A, 0x1F, 0x0B, 0x5E, 0x49, 0x7D, 0xA8, 0x31,
                /* 0320 */   0x54, 0x9C, 0x87, 0x1A, 0x9F, 0x48, 0x03, 0x45,
                /* 0328 */   0x7D, 0xB3, 0x79, 0xB6, 0x31, 0x7A, 0x7C, 0xDF,
                /* 0330 */   0x50, 0x0D, 0xF1, 0x50, 0xC3, 0x84, 0xBD, 0x23,
                /* 0338 */   0xF4, 0xC1, 0xF5, 0xA1, 0x06, 0x1C, 0xFF, 0xFF,
                /* 0340 */   0x43, 0x0D, 0xC0, 0xFF, 0xFF, 0xFF, 0xA1, 0x06,
                /* 0348 */   0x70, 0x74, 0x34, 0x80, 0x73, 0x64, 0xC4, 0x1D,
                /* 0350 */   0x0D, 0xC0, 0x75, 0x28, 0x05, 0x0E, 0x47, 0x03,
                /* 0358 */   0xE0, 0x71, 0x14, 0x02, 0xF3, 0x85, 0xC6, 0x47,
                /* 0360 */   0x21, 0x60, 0xF1, 0xFF, 0x3F, 0x0A, 0xE1, 0x64,
                /* 0368 */   0x9F, 0x83, 0x50, 0x42, 0x8F, 0x42, 0x80, 0x54,
                /* 0370 */   0xC8, 0xA7, 0x88, 0x67, 0x1F, 0x5F, 0x7E, 0x1E,
                /* 0378 */   0x08, 0x22, 0xBC, 0xE6, 0xFB, 0x14, 0xE4, 0x43,
                /* 0380 */   0xBE, 0x8F, 0x42, 0x0C, 0xC6, 0x50, 0xBE, 0x06,
                /* 0388 */   0xF9, 0x28, 0xC4, 0xA0, 0x5E, 0x83, 0x7C, 0xDF,
                /* 0390 */   0x37, 0xC8, 0x91, 0x18, 0xFB, 0x99, 0xC0, 0x47,
                /* 0398 */   0x21, 0x26, 0xED, 0x28, 0x04, 0x28, 0xFC, 0xFF,
                /* 03A0 */   0x1F, 0x85, 0x00, 0xFE, 0xFF, 0xFF, 0x8F, 0x42,
                /* 03A8 */   0x80, 0xB3, 0x00, 0x47, 0x03, 0xD0, 0x4D, 0xEB,
                /* 03B0 */   0x51, 0x08, 0xBC, 0x77, 0x96, 0xD3, 0x3E, 0x01,
                /* 03B8 */   0x9F, 0x85, 0x00, 0xB3, 0xFF, 0xFF, 0xB3, 0x10,
                /* 03C0 */   0x30, 0x3B, 0x0A, 0x45, 0x3D, 0xE8, 0x57, 0xA1,
                /* 03C8 */   0x27, 0x80, 0x17, 0x80, 0x18, 0x61, 0xDE, 0x81,
                /* 03D0 */   0x5E, 0x32, 0xD9, 0x5D, 0xDC, 0x38, 0x4F, 0x2E,
                /* 03D8 */   0xA7, 0x6D, 0x94, 0x97, 0x20, 0x1F, 0x28, 0x9E,
                /* 03E0 */   0x85, 0x0C, 0xF5, 0x2E, 0x14, 0xF4, 0x8D, 0xDC,
                /* 03E8 */   0xA3, 0x8C, 0x19, 0x3F, 0xC4, 0xF3, 0x90, 0x21,
                /* 03F0 */   0x9E, 0x85, 0x00, 0x76, 0xFD, 0xFF, 0xCF, 0x42,
                /* 03F8 */   0x00, 0xFF, 0xFF, 0xFF, 0x47, 0x03, 0xF8, 0x2F,
                /* 0400 */   0x00, 0x9F, 0x85, 0x80, 0xE7, 0x09, 0xE0, 0x41,
                /* 0408 */   0xDB, 0x67, 0x21, 0x80, 0x33, 0x87, 0xCB, 0xF3,
                /* 0410 */   0x0F, 0x7A, 0x60, 0xEF, 0x11, 0x9E, 0xF5, 0x71,
                /* 0418 */   0xBF, 0x5E, 0x7A, 0xE0, 0x0F, 0x05, 0xCF, 0x42,
                /* 0420 */   0x0C, 0xEB, 0x98, 0x7C, 0x16, 0x62, 0x10, 0x2F,
                /* 0428 */   0x9A, 0x86, 0x78, 0xE1, 0xF4, 0x61, 0xC0, 0xFF,
                /* 0430 */   0x7F, 0xBC, 0xC0, 0xAF, 0x9C, 0x06, 0x0A, 0x12,
                /* 0438 */   0xE8, 0x59, 0x08, 0x60, 0xFC, 0xFF, 0xFF, 0x2C,
                /* 0440 */   0x04, 0x90, 0x71, 0x8D, 0x3A, 0x0B, 0x01, 0xCB,
                /* 0448 */   0x63, 0x0C, 0x3B, 0xAD, 0x24, 0xF8, 0xFF, 0x3F,
                /* 0450 */   0x0B, 0x01, 0x9F, 0x5C, 0x46, 0x0E, 0x42, 0x98,
                /* 0458 */   0x88, 0x6F, 0x05, 0x1F, 0x33, 0x01, 0xA5, 0xE7,
                /* 0460 */   0xA0, 0x17, 0x77, 0x63, 0x04, 0x7E, 0x91, 0x78,
                /* 0468 */   0xCC, 0x64, 0x47, 0x4D, 0xC3, 0x3C, 0x0B, 0x19,
                /* 0470 */   0xEF, 0x30, 0xCE, 0xE0, 0x09, 0xDE, 0x93, 0x7F,
                /* 0478 */   0x16, 0x62, 0x60, 0xC7, 0x18, 0xEC, 0x51, 0xC8,
                /* 0480 */   0xA0, 0x06, 0x8F, 0x1D, 0x22, 0x4C, 0xA0, 0x67,
                /* 0488 */   0x21, 0x16, 0x6A, 0xDC, 0x3A, 0x7F, 0xF8, 0x2C,
                /* 0490 */   0x04, 0xBC, 0xFF, 0xFF, 0x67, 0x21, 0xC0, 0xD3,
                /* 0498 */   0x61, 0xC3, 0x67, 0x0D, 0xF0, 0x0C, 0xDF, 0xA3,
                /* 04A0 */   0x3A, 0x87, 0xC7, 0x63, 0xE0, 0x92, 0x55, 0xC7,
                /* 04A8 */   0x09, 0x83, 0xE5, 0x5E, 0xA7, 0x6C, 0x9C, 0x61,
                /* 04B0 */   0xE8, 0x20, 0xAC, 0x0E, 0x48, 0xC3, 0xC1, 0xDC,
                /* 04B8 */   0x43, 0x0E, 0xE2, 0x7C, 0xD8, 0x40, 0xAD, 0x08,
                /* 04C0 */   0x4E, 0xC7, 0x24, 0x0F, 0xDA, 0x5A, 0x28, 0xA4,
                /* 04C8 */   0x80, 0x46, 0x03, 0x32, 0xBC, 0x33, 0x9F, 0x96,
                /* 04D0 */   0x28, 0x88, 0x01, 0x7D, 0x02, 0xB2, 0x8D, 0x73,
                /* 04D8 */   0x00, 0x6A, 0x2F, 0x9A, 0x02, 0x39, 0xDA, 0x60,
                /* 04E0 */   0xF4, 0x5F, 0x16, 0xE8, 0x6C, 0x7C, 0x0D, 0xE0,
                /* 04E8 */   0x1A, 0x20, 0x74, 0x30, 0x30, 0xB4, 0xD5, 0xDC,
                /* 04F0 */   0x62, 0x50, 0x60, 0xC6, 0x7F, 0x70, 0x31, 0x81,
                /* 04F8 */   0x8F, 0x2E, 0xF8, 0xB3, 0x00, 0xEE, 0xFF, 0x3F,
                /* 0500 */   0x5C, 0x8F, 0xF6, 0x5D, 0xA0, 0xEA, 0xC9, 0xEA,
                /* 0508 */   0x8A, 0x60, 0x75, 0x97, 0x17, 0x08, 0x33, 0x32,
                /* 0510 */   0x41, 0x7D, 0x07, 0x02, 0x50, 0x00, 0xF9, 0x0E,
                /* 0518 */   0xE0, 0xA3, 0xD3, 0x73, 0x00, 0x9B, 0x48, 0x88,
                /* 0520 */   0x30, 0xD1, 0x8C, 0x8E, 0x98, 0x30, 0x2A, 0xFA,
                /* 0528 */   0x84, 0x29, 0x88, 0x27, 0xEC, 0x58, 0x13, 0x46,
                /* 0530 */   0xCF, 0xC4, 0x77, 0x1B, 0x36, 0x62, 0x4C, 0x88,
                /* 0538 */   0xDB, 0x06, 0xB4, 0x09, 0x06, 0xF5, 0x3D, 0x08,
                /* 0540 */   0xD6, 0x90, 0xF9, 0x58, 0x7C, 0x67, 0xC0, 0x4D,
                /* 0548 */   0x19, 0x8C, 0x73, 0x62, 0xD7, 0x04, 0x0B, 0x9C,
                /* 0550 */   0x33, 0xC8, 0xE1, 0x31, 0xD7, 0x2F, 0x7E, 0x5B,
                /* 0558 */   0xF2, 0xE8, 0xF8, 0x41, 0xC1, 0x37, 0x1C, 0x86,
                /* 0560 */   0xFD, 0x30, 0xE6, 0x19, 0xBD, 0x8A, 0xF9, 0xE6,
                /* 0568 */   0x86, 0x81, 0xF5, 0x78, 0x39, 0xAC, 0xD1, 0xC2,
                /* 0570 */   0x1E, 0xDA, 0xAB, 0x87, 0xCF, 0x2D, 0x3E, 0x4F,
                /* 0578 */   0x18, 0x23, 0xAC, 0x2F, 0x2C, 0xE0, 0x00, 0xFC,
                /* 0580 */   0xFF, 0xBF, 0x5A, 0xC1, 0xBE, 0x6B, 0x80, 0xE7,
                /* 0588 */   0x26, 0xE4, 0xBB, 0x06, 0xC0, 0xDA, 0xFF, 0xFF,
                /* 0590 */   0x5D, 0x03, 0xFE, 0x35, 0xC1, 0x77, 0x0D, 0xE0,
                /* 0598 */   0x3D, 0x74, 0xDF, 0x35, 0x80, 0x6B, 0xF6, 0xBB,
                /* 05A0 */   0x06, 0xEA, 0x18, 0x60, 0x85, 0x77, 0x0D, 0x68,
                /* 05A8 */   0xB7, 0xB4, 0x57, 0xB4, 0x87, 0x2A, 0x6B, 0xBA,
                /* 05B0 */   0x6C, 0xA0, 0xD4, 0x5C, 0x36, 0x00, 0x6D, 0xFF,
                /* 05B8 */   0xFF, 0xCB, 0x06, 0xB0, 0x91, 0x32, 0x61, 0x54,
                /* 05C0 */   0xF8, 0x09, 0x53, 0x10, 0x4F, 0xD8, 0xC1, 0x2E,
                /* 05C8 */   0x1B, 0xA0, 0x88, 0x71, 0xD9, 0x00, 0xFD, 0xD8,
                /* 05D0 */   0x5E, 0x36, 0x80, 0xC1, 0x3D, 0x81, 0xDF, 0x36,
                /* 05D8 */   0x80, 0x37, 0xA4, 0x6F, 0x1B, 0xC0, 0xF4, 0xFF,
                /* 05E0 */   0x0F, 0x31, 0xFF, 0x6D, 0x03, 0xC5, 0x61, 0x95,
                /* 05E8 */   0xB7, 0x0D, 0x88, 0x87, 0x77, 0x46, 0x60, 0x55,
                /* 05F0 */   0xD7, 0x0D, 0x94, 0x9E, 0xEB, 0x06, 0x40, 0x02,
                /* 05F8 */   0x31, 0x13, 0x46, 0xC5, 0x9F, 0x30, 0x05, 0xF1,
                /* 0600 */   0x84, 0x1D, 0xED, 0xBA, 0x01, 0x8A, 0x20, 0xD7,
                /* 0608 */   0x0D, 0xD0, 0xCF, 0xEB, 0x94, 0xC1, 0xFA, 0xFF,
                /* 0610 */   0xBF, 0x6E, 0x60, 0x2F, 0x0A, 0x98, 0xFB, 0x06,
                /* 0618 */   0xF0, 0x86, 0xE5, 0xF7, 0x0D, 0xC0, 0xC7, 0xE5,
                /* 0620 */   0x1B, 0x73, 0xDF, 0x00, 0x6C, 0xFE, 0xFF, 0xEF,
                /* 0628 */   0x1B, 0x00, 0x13, 0x2E, 0x0A, 0xB8, 0xFB, 0x06,
                /* 0630 */   0xF0, 0xBE, 0x48, 0xFB, 0xBE, 0x01, 0x5C, 0x83,
                /* 0638 */   0x49, 0xF8, 0xFF, 0xDF, 0xF5, 0xE8, 0x0B, 0x40,
                /* 0640 */   0x51, 0x60, 0x50, 0x43, 0xF2, 0x99, 0x00, 0x3F,
                /* 0648 */   0xBA, 0x83, 0x3B, 0xA6, 0xE0, 0x4C, 0x12, 0x1C,
                /* 0650 */   0x6A, 0xE0, 0xBE, 0x02, 0x3C, 0xCD, 0x9F, 0xD6,
                /* 0658 */   0x7B, 0xBD, 0xE7, 0xF1, 0x24, 0x10, 0x92, 0x1D,
                /* 0660 */   0x61, 0x7C, 0x6C, 0x43, 0x9C, 0x0C, 0xC8, 0x41,
                /* 0668 */   0xDC, 0x47, 0xF7, 0x88, 0xEF, 0xE1, 0x86, 0x49,
                /* 0670 */   0xE0, 0x21, 0x33, 0x34, 0x0E, 0x8D, 0x1D, 0x86,
                /* 0678 */   0xEF, 0x02, 0xC1, 0x0E, 0xE2, 0x30, 0xCE, 0xD7,
                /* 0680 */   0x04, 0x9E, 0xD0, 0x83, 0xC0, 0x7B, 0xF9, 0xA3,
                /* 0688 */   0x41, 0xF1, 0x77, 0x03, 0x4A, 0x60, 0xB8, 0xD0,
                /* 0690 */   0x98, 0x91, 0xFA, 0x6C, 0xFF, 0x8E, 0x70, 0x24,
                /* 0698 */   0x26, 0xB0, 0x7B, 0x48, 0x59, 0x13, 0xA0, 0xF1,
                /* 06A0 */   0x96, 0x43, 0x20, 0x7A, 0xC3, 0x91, 0x2D, 0x14,
                /* 06A8 */   0xCD, 0x2D, 0xCA, 0xFB, 0x42, 0x14, 0x3B, 0x43,
                /* 06B0 */   0x10, 0x46, 0x94, 0x60, 0x41, 0x9E, 0xD6, 0x62,
                /* 06B8 */   0x45, 0x79, 0x66, 0x37, 0x42, 0xC4, 0x10, 0xAF,
                /* 06C0 */   0x0C, 0x81, 0x5E, 0x12, 0xC2, 0x07, 0x79, 0xEC,
                /* 06C8 */   0x89, 0xD3, 0xFE, 0x20, 0x88, 0xF8, 0x17, 0x82,
                /* 06D0 */   0x3C, 0x80, 0x28, 0xD2, 0x68, 0x50, 0xE7, 0x06,
                /* 06D8 */   0x8F, 0xDD, 0x87, 0x10, 0x5F, 0xFE, 0x7D, 0xB8,
                /* 06E0 */   0xF7, 0xE8, 0x0E, 0xEE, 0x45, 0xFE, 0xA0, 0x3D,
                /* 06E8 */   0x3C, 0x76, 0xC2, 0xF0, 0x41, 0x03, 0x8E, 0x6B,
                /* 06F0 */   0x40, 0x4D, 0xFF, 0x19, 0x01, 0x2C, 0x97, 0x7F,
                /* 06F8 */   0xF8, 0xE3, 0xF1, 0x3D, 0xC1, 0xF3, 0x39, 0xE1,
                /* 0700 */   0x04, 0x96, 0x3F, 0x08, 0xD4, 0x71, 0x84, 0xCF,
                /* 0708 */   0xF3, 0x85, 0xC3, 0x90, 0xCF, 0x02, 0x87, 0xC5,
                /* 0710 */   0xC4, 0x0A, 0xF8, 0xFF, 0x9F, 0x4C, 0xD8, 0x78,
                /* 0718 */   0xC0, 0x7F, 0x0F, 0x79, 0xFD, 0xF7, 0xCD, 0xC0,
                /* 0720 */   0xF3, 0x35, 0xC1, 0x88, 0x10, 0x72, 0x32, 0x1E,
                /* 0728 */   0x34, 0xE8, 0xD9, 0xF8, 0x80, 0xE1, 0xEB, 0x09,
                /* 0730 */   0x3B, 0x77, 0x70, 0x51, 0xE7, 0x0E, 0xD4, 0xD1,
                /* 0738 */   0xC1, 0xA7, 0x06, 0x76, 0xB3, 0xC1, 0x1C, 0xB7,
                /* 0740 */   0xF9, 0x59, 0x03, 0xFC, 0x23, 0x84, 0x7F, 0x7B,
                /* 0748 */   0xF0, 0xBC, 0x7C, 0x65, 0x78, 0x75, 0x48, 0xE0,
                /* 0750 */   0x90, 0x23, 0x44, 0x8F, 0xCB, 0x23, 0xC4, 0x9C,
                /* 0758 */   0x6F, 0x30, 0x43, 0x04, 0xD7, 0x59, 0x00, 0x1C,
                /* 0760 */   0x43, 0x04, 0x3E, 0x67, 0x4C, 0x9F, 0x71, 0x60,
                /* 0768 */   0xFE, 0xFF, 0xCF, 0x38, 0xEC, 0xD2, 0xC3, 0x07,
                /* 0770 */   0x6A, 0x78, 0x13, 0xF8, 0xFE, 0x8C, 0x3B, 0xD2,
                /* 0778 */   0x18, 0x9C, 0x1F, 0x33, 0x1E, 0x76, 0x18, 0xF8,
                /* 0780 */   0xFB, 0x8E, 0x67, 0x70, 0x34, 0x3E, 0xA0, 0x18,
                /* 0788 */   0x21, 0xF8, 0x73, 0xC9, 0x73, 0x8A, 0x35, 0x0F,
                /* 0790 */   0x52, 0x33, 0x7A, 0x67, 0x38, 0x04, 0x76, 0xB3,
                /* 0798 */   0xC2, 0x1D, 0x38, 0x3C, 0x04, 0x3E, 0x80, 0x56,
                /* 07A0 */   0x27, 0x47, 0x4E, 0x3F, 0xA7, 0x84, 0x1B, 0x3E,
                /* 07A8 */   0xBF, 0x0A, 0x60, 0x0E, 0x41, 0x38, 0x85, 0x36,
                /* 07B0 */   0x7D, 0x6A, 0x34, 0x6A, 0xD5, 0xA0, 0x4C, 0x8D,
                /* 07B8 */   0x32, 0x0D, 0x6A, 0xF5, 0xA9, 0xD4, 0x98, 0xB1,
                /* 07C0 */   0x0B, 0x8B, 0x03, 0xBE, 0x02, 0x74, 0x1C, 0xB0,
                /* 07C8 */   0x3C, 0x0A, 0x1D, 0xC1, 0xC8, 0x9B, 0x40, 0x20,
                /* 07D0 */   0x0E, 0x0B, 0x42, 0x23, 0xBD, 0x71, 0x04, 0x62,
                /* 07D8 */   0xC9, 0xEF, 0x2F, 0x81, 0x58, 0xEE, 0x03, 0x45,
                /* 07E0 */   0x20, 0x0E, 0x68, 0x02, 0x9C, 0xAA, 0x00, 0xA7,
                /* 07E8 */   0xAF, 0x01, 0x81, 0x38, 0x32, 0x08, 0x15, 0xFA,
                /* 07F0 */   0x35, 0x13, 0x88, 0x63, 0x82, 0xD0, 0x50, 0x3E,
                /* 07F8 */   0x40, 0x98, 0xF4, 0x17, 0x80, 0x00, 0x89, 0x11,
                /* 0800 */   0x10, 0x16, 0xEE, 0xE5, 0x20, 0x10, 0x4B, 0x7B,
                /* 0808 */   0x2D, 0x08, 0xC4, 0x42, 0xAC, 0x80, 0xB0, 0xB8,
                /* 0810 */   0x20, 0x34, 0x9C, 0x16, 0x10, 0x26, 0xC9, 0x0C,
                /* 0818 */   0x08, 0x0B, 0x04, 0x42, 0xE5, 0x3F, 0xD3, 0x04,
                /* 0820 */   0x62, 0x91, 0x6E, 0x00, 0xE9, 0xBA, 0x05, 0xE2,
                /* 0828 */   0x20, 0x7A, 0x40, 0x98, 0x0C, 0x3F, 0x20, 0x2C,
                /* 0830 */   0x34, 0x08, 0x8D, 0xF6, 0x6C, 0x10, 0x20, 0x31,
                /* 0838 */   0x04, 0xC2, 0xE2, 0x3B, 0x02, 0x61, 0xE2, 0xDF,
                /* 0840 */   0x44, 0x02, 0x71, 0x4A, 0x4B, 0x10, 0x37, 0xA5,
                /* 0848 */   0x01, 0x06, 0x11, 0x90, 0x93, 0x6A, 0x02, 0x62,
                /* 0850 */   0xB9, 0x41, 0x34, 0x24, 0xF2, 0xB0, 0x10, 0x90,
                /* 0858 */   0x93, 0x82, 0x68, 0xC0, 0xC4, 0x14, 0x90, 0xFF,
                /* 0860 */   0xFF, 0x43, 0x13, 0x88, 0x80, 0x9C, 0xCA, 0x15,
                /* 0868 */   0x10, 0x8B, 0x08, 0x22, 0x20, 0x27, 0x7B, 0x52,
                /* 0870 */   0x09, 0xC8, 0x39, 0x41, 0x74, 0x04, 0x20, 0xBA,
                /* 0878 */   0x80, 0x58, 0x3E, 0x10, 0x01, 0x39, 0x96, 0x2F,
                /* 0880 */   0x20, 0x16, 0x12, 0x44, 0x40, 0x4E, 0xF4, 0xF3,
                /* 0888 */   0x09, 0x44, 0xE2, 0x81, 0x68, 0x10, 0xE4, 0x3F,
                /* 0890 */   0x21, 0x20, 0x67, 0x04, 0x11, 0x10, 0x79, 0x12,
                /* 0898 */   0x05, 0x21, 0x9A, 0x3E, 0x62, 0x02, 0x71, 0x6A,
                /* 08A0 */   0x10, 0x9A, 0xEC, 0x27, 0x14, 0x84, 0xFC, 0xFF,
                /* 08A8 */   0x01
            })
        }
    }
}

