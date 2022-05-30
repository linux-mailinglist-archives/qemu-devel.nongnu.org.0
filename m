Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96AD95373C5
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 05:46:56 +0200 (CEST)
Received: from localhost ([::1]:33198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvWMp-0004rD-Ny
	for lists+qemu-devel@lfdr.de; Sun, 29 May 2022 23:46:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robert.hu@linux.intel.com>)
 id 1nvWHC-0005EF-OK
 for qemu-devel@nongnu.org; Sun, 29 May 2022 23:41:06 -0400
Received: from mga14.intel.com ([192.55.52.115]:36566)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robert.hu@linux.intel.com>)
 id 1nvWHA-0006yK-2O
 for qemu-devel@nongnu.org; Sun, 29 May 2022 23:41:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653882064; x=1685418064;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8knV924GoJ6whfr29FzDEc9ykSvbb15BF0Akz/MhJTE=;
 b=msUxdJPFPcwzS0zNur25Qhm/pNtzawa84KEM4fjdDou8LqOlFiipIRRa
 7WvP91jXwoObZAvG1+7kc7r6Ret7FL46QYB+WPneRpN6fPySlJdkdey/t
 hUxTQjjxJtjbkspZZamH/KmbhGUAOSdZXvUqKq6FZWzjjPEUcGtPaGQh3
 TXXt+IbmdOfOgNs8LDL3c4ed74X1hut2jBgC702LpgUFyIRS3NpT6pxXf
 JoXJP3gjJC6Sz3+1FpKe09R8u10E+8vD3ZyIQu45Lr9WW7AER+3pXHNTj
 UMyHlU2vfraU1SUVGW0oN5s+63PojH8Eori+RFnP7wUs8565fA8Sh4OeT g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10362"; a="274974858"
X-IronPort-AV: E=Sophos;i="5.91,261,1647327600"; d="scan'208";a="274974858"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2022 20:41:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,261,1647327600"; d="scan'208";a="528993834"
Received: from sqa-gate.sh.intel.com (HELO robert-clx2.tsp.org)
 ([10.239.48.212])
 by orsmga003.jf.intel.com with ESMTP; 29 May 2022 20:40:59 -0700
From: Robert Hoo <robert.hu@linux.intel.com>
To: imammedo@redhat.com, mst@redhat.com, xiaoguangrong.eric@gmail.com,
 ani@anisinha.ca, dan.j.williams@intel.com, jingqi.liu@intel.com
Cc: qemu-devel@nongnu.org,
	robert.hu@intel.com
Subject: [QEMU PATCH v2 5/6] test/acpi/bios-tables-test: SSDT: update golden
 master binaries
Date: Mon, 30 May 2022 11:40:46 +0800
Message-Id: <20220530034047.730356-6-robert.hu@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220530034047.730356-1-robert.hu@linux.intel.com>
References: <20220530034047.730356-1-robert.hu@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=192.55.52.115;
 envelope-from=robert.hu@linux.intel.com; helo=mga14.intel.com
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_HI=-5,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Diff in disassembled ASL files
@@ -1,100 +1,103 @@
 /*
  * Intel ACPI Component Architecture
  * AML/ASL+ Disassembler version 20190509 (64-bit version)
  * Copyright (c) 2000 - 2019 Intel Corporation
  *
  * Disassembling to symbolic ASL+ operators
  *
- * Disassembly of tests/data/acpi/q35/SSDT.dimmpxm, Wed May 25 11:02:18 2022
+ * Disassembly of /tmp/aml-U0ONM1, Wed May 25 11:02:18 2022
  *
  * Original Table Header:
  *     Signature        "SSDT"
- *     Length           0x000002DE (734)
+ *     Length           0x00000725 (1829)
  *     Revision         0x01
- *     Checksum         0x46
+ *     Checksum         0xEA
  *     OEM ID           "BOCHS "
  *     OEM Table ID     "NVDIMM"
  *     OEM Revision     0x00000001 (1)
  *     Compiler ID      "BXPC"
  *     Compiler Version 0x00000001 (1)
  */
 DefinitionBlock ("", "SSDT", 1, "BOCHS ", "NVDIMM", 0x00000001)
 {
+    Name (MEMA, 0x07FFF000)
     Scope (\_SB)
     {
         Device (NVDR)
         {
             Name (_HID, "ACPI0012" /* NVDIMM Root Device */)  // _HID: Hardware ID
+            OperationRegion (NPIO, SystemIO, 0x0A18, 0x04)
+            Field (NPIO, DWordAcc, NoLock, Preserve)
+            {
+                NTFI,   32
+            }
+
             Method (NCAL, 5, Serialized)
             {
                 Local6 = MEMA /* \MEMA */
-                OperationRegion (NPIO, SystemIO, 0x0A18, 0x04)
                 OperationRegion (NRAM, SystemMemory, Local6, 0x1000)
-                Field (NPIO, DWordAcc, NoLock, Preserve)
-                {
-                    NTFI,   32
-                }
-
                 Field (NRAM, DWordAcc, NoLock, Preserve)
                 {
                     HDLE,   32,
+                    MTHD,   32,
                     REVS,   32,
                     FUNC,   32,
-                    FARG,   32672
+                    FARG,   32640
                 }

                 Field (NRAM, DWordAcc, NoLock, Preserve)
                 {
                     RLEN,   32,
                     ODAT,   32736
                 }

                 If ((Arg4 == Zero))
                 {
                     Local0 = ToUUID ("2f10e7a4-9e91-11e4-89d3-123b93f75cba")
                 }
                 ElseIf ((Arg4 == 0x00010000))
                 {
                     Local0 = ToUUID ("648b9cf2-cda1-4312-8ad9-49c4af32bd62")
                 }
                 Else
                 {
                     Local0 = ToUUID ("4309ac30-0d11-11e4-9191-0800200c9a66")
                 }

-                If (((Local6 == Zero) | (Arg0 != Local0)))
+                If (((Local6 == Zero) || (Arg0 != Local0)))
                 {
                     If ((Arg2 == Zero))
                     {
                         Return (Buffer (One)
                         {
                              0x00                                             // .
                         })
                     }

                     Return (Buffer (One)
                     {
                          0x01                                             // .
                     })
                 }

+                MTHD = Zero
                 HDLE = Arg4
                 REVS = Arg1
                 FUNC = Arg2
-                If (((ObjectType (Arg3) == 0x04) & (SizeOf (Arg3) == One)))
+                If (((ObjectType (Arg3) == 0x04) && (SizeOf (Arg3) == One)))
                 {
                     Local2 = Arg3 [Zero]
                     Local3 = DerefOf (Local2)
                     FARG = Local3
                 }

                 NTFI = Local6
                 Local1 = (RLEN - 0x04)
                 If ((Local1 < 0x08))
                 {
                     Local2 = Zero
                     Name (TBUF, Buffer (One)
                     {
                          0x00                                             // .
                     })
                     Local7 = Buffer (Zero){}
@@ -161,45 +164,304 @@
                     Else
                     {
                         If ((Local1 == Zero))
                         {
                             Return (Local2)
                         }

                         Local3 += Local1
                         Concatenate (Local2, Local0, Local2)
                     }
                 }
             }

             Device (NV00)
             {
                 Name (_ADR, One)  // _ADR: Address
+                OperationRegion (NRAM, SystemMemory, MEMA, 0x1000)
+                Method (_LSI, 0, Serialized)  // _LSI: Label Storage Information
+                {
+                    Field (NRAM, DWordAcc, NoLock, Preserve)
+                    {
+                        HDLE,   32,
+                        MTHD,   32
+                    }
+
+                    Field (NRAM, DWordAcc, NoLock, Preserve)
+                    {
+                        RLEN,   32,
+                        STUS,   32,
+                        SIZE,   32,
+                        MAXT,   32
+                    }
+
+                    HDLE = One
+                    MTHD = 0x0100
+                    NTFI = MEMA /* \MEMA */
+                    Name (RPKG, Package (0x03)
+                    {
+                        STUS,
+                        SIZE,
+                        MAXT
+                    })
+                    Return (RPKG) /* \_SB_.NVDR.NV00._LSI.RPKG */
+                }
+
+                Method (_LSR, 2, Serialized)  // _LSR: Label Storage Read
+                {
+                    Field (NRAM, DWordAcc, NoLock, Preserve)
+                    {
+                        HDLE,   32,
+                        MTHD,   32,
+                        OFST,   32,
+                        TRSL,   32
+                    }
+
+                    Field (NRAM, DWordAcc, NoLock, Preserve)
+                    {
+                        RLEN,   32,
+                        STUS,   32,
+                        ODAT,   32704
+                    }
+
+                    HDLE = One
+                    MTHD = 0x0101
+                    OFST = Arg0
+                    TRSL = Arg1
+                    NTFI = MEMA /* \MEMA */
+                    Local1 = (Arg1 << 0x03)
+                    CreateField (ODAT, Zero, Local1, OBUF)
+                    Name (RPKG, Package (0x02)
+                    {
+                        STUS,
+                        OBUF
+                    })
+                    Return (RPKG) /* \_SB_.NVDR.NV00._LSR.RPKG */
+                }
+
+                Method (_LSW, 3, Serialized)  // _LSW: Label Storage Write
+                {
+                    Field (NRAM, DWordAcc, NoLock, Preserve)
+                    {
+                        HDLE,   32,
+                        MTHD,   32,
+                        OFST,   32,
+                        TRSL,   32,
+                        IDAT,   32640
+                    }
+
+                    Field (NRAM, DWordAcc, NoLock, Preserve)
+                    {
+                        RLEN,   32,
+                        STUS,   32
+                    }
+
+                    HDLE = One
+                    MTHD = 0x0102
+                    OFST = Arg0
+                    TRSL = Arg1
+                    IDAT = Arg2
+                    NTFI = MEMA /* \MEMA */
+                    Return (STUS) /* \_SB_.NVDR.NV00._LSW.STUS */
+                }
+
                 Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                 {
                     Return (NCAL (Arg0, Arg1, Arg2, Arg3, One))
                 }
             }

             Device (NV01)
             {
                 Name (_ADR, 0x02)  // _ADR: Address
+                OperationRegion (NRAM, SystemMemory, MEMA, 0x1000)
+                Method (_LSI, 0, Serialized)  // _LSI: Label Storage Information
+                {
+                    Field (NRAM, DWordAcc, NoLock, Preserve)
+                    {
+                        HDLE,   32,
+                        MTHD,   32
+                    }
+
+                    Field (NRAM, DWordAcc, NoLock, Preserve)
+                    {
+                        RLEN,   32,
+                        STUS,   32,
+                        SIZE,   32,
+                        MAXT,   32
+                    }
+
+                    HDLE = 0x02
+                    MTHD = 0x0100
+                    NTFI = MEMA /* \MEMA */
+                    Name (RPKG, Package (0x03)
+                    {
+                        STUS,
+                        SIZE,
+                        MAXT
+                    })
+                    Return (RPKG) /* \_SB_.NVDR.NV01._LSI.RPKG */
+                }
+
+                Method (_LSR, 2, Serialized)  // _LSR: Label Storage Read
+                {
+                    Field (NRAM, DWordAcc, NoLock, Preserve)
+                    {
+                        HDLE,   32,
+                        MTHD,   32,
+                        OFST,   32,
+                        TRSL,   32
+                    }
+
+                    Field (NRAM, DWordAcc, NoLock, Preserve)
+                    {
+                        RLEN,   32,
+                        STUS,   32,
+                        ODAT,   32704
+                    }
+
+                    HDLE = 0x02
+                    MTHD = 0x0101
+                    OFST = Arg0
+                    TRSL = Arg1
+                    NTFI = MEMA /* \MEMA */
+                    Local1 = (Arg1 << 0x03)
+                    CreateField (ODAT, Zero, Local1, OBUF)
+                    Name (RPKG, Package (0x02)
+                    {
+                        STUS,
+                        OBUF
+                    })
+                    Return (RPKG) /* \_SB_.NVDR.NV01._LSR.RPKG */
+                }
+
+                Method (_LSW, 3, Serialized)  // _LSW: Label Storage Write
+                {
+                    Field (NRAM, DWordAcc, NoLock, Preserve)
+                    {
+                        HDLE,   32,
+                        MTHD,   32,
+                        OFST,   32,
+                        TRSL,   32,
+                        IDAT,   32640
+                    }
+
+                    Field (NRAM, DWordAcc, NoLock, Preserve)
+                    {
+                        RLEN,   32,
+                        STUS,   32
+                    }
+
+                    HDLE = 0x02
+                    MTHD = 0x0102
+                    OFST = Arg0
+                    TRSL = Arg1
+                    IDAT = Arg2
+                    NTFI = MEMA /* \MEMA */
+                    Return (STUS) /* \_SB_.NVDR.NV01._LSW.STUS */
+                }
+
                 Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                 {
                     Return (NCAL (Arg0, Arg1, Arg2, Arg3, 0x02))
                 }
             }

             Device (NV02)
             {
                 Name (_ADR, 0x03)  // _ADR: Address
+                OperationRegion (NRAM, SystemMemory, MEMA, 0x1000)
+                Method (_LSI, 0, Serialized)  // _LSI: Label Storage Information
+                {
+                    Field (NRAM, DWordAcc, NoLock, Preserve)
+                    {
+                        HDLE,   32,
+                        MTHD,   32
+                    }
+
+                    Field (NRAM, DWordAcc, NoLock, Preserve)
+                    {
+                        RLEN,   32,
+                        STUS,   32,
+                        SIZE,   32,
+                        MAXT,   32
+                    }
+
+                    HDLE = 0x03
+                    MTHD = 0x0100
+                    NTFI = MEMA /* \MEMA */
+                    Name (RPKG, Package (0x03)
+                    {
+                        STUS,
+                        SIZE,
+                        MAXT
+                    })
+                    Return (RPKG) /* \_SB_.NVDR.NV02._LSI.RPKG */
+                }
+
+                Method (_LSR, 2, Serialized)  // _LSR: Label Storage Read
+                {
+                    Field (NRAM, DWordAcc, NoLock, Preserve)
+                    {
+                        HDLE,   32,
+                        MTHD,   32,
+                        OFST,   32,
+                        TRSL,   32
+                    }
+
+                    Field (NRAM, DWordAcc, NoLock, Preserve)
+                    {
+                        RLEN,   32,
+                        STUS,   32,
+                        ODAT,   32704
+                    }
+
+                    HDLE = 0x03
+                    MTHD = 0x0101
+                    OFST = Arg0
+                    TRSL = Arg1
+                    NTFI = MEMA /* \MEMA */
+                    Local1 = (Arg1 << 0x03)
+                    CreateField (ODAT, Zero, Local1, OBUF)
+                    Name (RPKG, Package (0x02)
+                    {
+                        STUS,
+                        OBUF
+                    })
+                    Return (RPKG) /* \_SB_.NVDR.NV02._LSR.RPKG */
+                }
+
+                Method (_LSW, 3, Serialized)  // _LSW: Label Storage Write
+                {
+                    Field (NRAM, DWordAcc, NoLock, Preserve)
+                    {
+                        HDLE,   32,
+                        MTHD,   32,
+                        OFST,   32,
+                        TRSL,   32,
+                        IDAT,   32640
+                    }
+
+                    Field (NRAM, DWordAcc, NoLock, Preserve)
+                    {
+                        RLEN,   32,
+                        STUS,   32
+                    }
+
+                    HDLE = 0x03
+                    MTHD = 0x0102
+                    OFST = Arg0
+                    TRSL = Arg1
+                    IDAT = Arg2
+                    NTFI = MEMA /* \MEMA */
+                    Return (STUS) /* \_SB_.NVDR.NV02._LSW.STUS */
+                }
+
                 Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                 {
                     Return (NCAL (Arg0, Arg1, Arg2, Arg3, 0x03))
                 }
             }
         }
     }
-
-    Name (MEMA, 0x07FFF000)
 }

Signed-off-by: Robert Hoo <robert.hu@linux.intel.com>
Reviewed-by: Jingqi Liu <jingqi.liu@intel.com>
---
 tests/data/acpi/pc/SSDT.dimmpxm             | Bin 734 -> 1829 bytes
 tests/data/acpi/q35/SSDT.dimmpxm            | Bin 734 -> 1829 bytes
 tests/qtest/bios-tables-test-allowed-diff.h |   2 --
 3 files changed, 2 deletions(-)

diff --git a/tests/data/acpi/pc/SSDT.dimmpxm b/tests/data/acpi/pc/SSDT.dimmpxm
index ac55387d57e48adb99eb738a102308688a262fb8..672d51bc348366f667b1d3aeeec45dd06727fd5b 100644
GIT binary patch
literal 1829
zcmc&!L1@!p6n<&Tnx&mIU14LQ#DizM9YpXTY16E6O<R(54l`(yO1rj0f80Fmwr+>b
z31Sy^5s`G{D0mmVdG+MUn}>mSFN%no_jh&JUFJ6M^8d-7?|<)m@B3bKT{5ml0hsTZ
zQZ}y(#d%3l)!-cfG7IG_?yQ<q#W;NW6-~$w7OQ%uYHq0a1Ej`Q^NKVkX3I)CJv{^F
zda<mOnAjx8Ma)hNU&2L0R)mzADrUvP7{N&O0H%p5)MJn^J6G^IoR<nYK{fJ{pylRu
zL9P_Df-GvY>))bgCrKe%Ay*Vil4z{|jCxb<G7x^8OZcA?*Saqc_{SfTH{Gv`Z>-)8
z@3Olb#|kLm%Zn%Xdhe6josY`9*E4S&t2aT<)2~Le{MZ5C?Xn=mpVuvKvg_7i*Ilx_
zQMUy?A7<#n5I|yN899<B@*^!I=v{o~K5cUmcdN~i?KXfzHk}%&A#YO0x>u1i7qPwT
zdp5@sa9AT#kufmgL(tg2wCC7la~q3tU>m;ytTb?MJaYU7S+lt?*ycC_z%B*nJ}#+5
zRnpank1btlw%WjIx*<YJjcT%DjIt$JH-IeRMi7I28g2u_Bu5xT&`w!976c(G1Q!hE
z#dlqL;s->@mSwNnSO@FcK~F+pj$52S*#&fDAD7gvYLJ}8!W;s%{WL?6P0hmF9`9n*
z7%+qHy@WS{!JLORySCz3j=3RC7U$Dxwkk>*b7&E?OW=}JZlqe!71rz|hTLLyrjE>^
z8x>v9mAiqH#05hj3{@;hO7+87C<?2U=Vp@^!iYvNVtqVI&9XrjjT^)~@+9_2Ff_d&
zn4O8CeAJOYqJv~iKUu%|O}s-rkBP}zb6Czk7cPWcsJxWNZLIcA?D%XP@lbFMa5nl4
zp|e5DAMgkr=h4DTf7tj4A9fOBZYZe2G*y8M4ap#%N(L_Uk2>VfqQfBDc?dCg79j>i
pPN)R`_e=-9?@KY$mm+*VQqUhQIr&JOO^U;8|6htjBBzuh{2L~m{ty5F

delta 297
zcmZ3=caN1TIM^lR9uortW7tG4sXPIHt(f>=r}*e5H!Z&~mmrRK4^J0fN9O=f0|P@N
z1`%ITKW9fD-U44&U&plQ2EPDLe@1QzE-n@zJIK+OA&r|sAi9woB+l#?;^wIk-6#W+
zVD@nFaa9O%4GUIq3-xnWaB~cDZ}>HFVU~qt?c_9uNs}`Y7#46&&SF?1$jk^P7z=Vh
zdI~Z@nhLT&x)#V(Pwva+Vwv2Y&B(CXozaCcO~x<Gz<?v((ItpcL?GTJ*q3Dq$blJ|
oS=o%yO>#h4L$E9tlZYUyG#3*@-UuSkj3Lj=0rDgd!-N0q0JVcq&Hw-a

diff --git a/tests/data/acpi/q35/SSDT.dimmpxm b/tests/data/acpi/q35/SSDT.dimmpxm
index 98e6f0e3f3bb02dd419e36bdd1db9b94c728c406..ef8ecc186ddd3c0a2016e12bb92c026b8682fe5e 100644
GIT binary patch
literal 1829
zcmc&!L1@!p6n<&Tnx&mIU14LQ#DizM9YpXTY16E6O<R(54l`(yO1rj0f80Fmwr+>b
z31Sy^5s`G{D0mmVdG+MU`#|s{Ui2Vp-rv<>cbVJ3%l{{TzW=@Nz3+R`b;-CI1z<jB
zO4+<F6z3&HRfBf`$SjnzxU*_b731*bS2Q6%Sgh)qs=1-w50DyL%`4KFm@O;m^z;mv
z>&3ECVq%jV7co0Ad<ho~SrJlds+biEV+14B1DGbNP>(^v>|DX;a9%3p1l7n(f|i@t
z1-Vkp3bLrpu78i3og{^5g<Mf6Nusg-GwMyb%Ru;XF5!PlT<g9(;2(cT-gLh$zOi~Y
zyvy!#94nxJuP>h5>%C8AcRnibUeCOBtlk7YPrn+?@?!^lx66VMe_pq|$*x<6U3bay
zM%@<pe3+pNLjZ}9W#mYj$d9y;pm*_^`?SqP+^sf4w%Y&>*>q~8hP+7~>t039T*UUS
z@7Wwnz+sI{MaIB{4?$!9(w<|J&222ofo=Q-u+qT2@yPKTWX<NnV4LFz0J{{N`?#bM
zRY_MPKDKnJ*=hr;>4pd?HLA&qG0K)?-2k$L8$k^AX}ApxlN@0XK|5vbSP+D$5L_^r
z7vFX1i60OpTb8|QV;!t(2R#XaIc{+RWf#zqeOywvszGuV3v&q6_R|bOHZ==xd%TNL
zW55i)_Y&R+26G<P?AnTBIp&5mS)5O&*{UdM%%MflE`du@xshr?S6H)?7;=l*nL09u
zZd7zZSMCN*5*G}CFjTQ1Db){Sp(w0Yo|{cx2qPN7i1qO-HOmHBG;R>{$dlM7!O--A
zV0I>k@=-_rhz^o5{bc>-H}MYjJSHY<&0#tFT(}T&q4H85x3StgvE#FG#6!V3z}e_G
zgw6&nf50PjoJR{U{bA!HeAr2hxuKv6(^Lg6G$ez3DjB%YKkAS_iw=Wq=OM)0S%er6
pIiV8#-!mQbzAwd0UyAVgNI`$J<m4l9HYpCX{eLMAiJVf3@NXo1{ty5F

delta 297
zcmZ3=caN1TIM^lR9uortquWF-sXPIHt(f>=r}*e5H!Z&~mmrRK4^J0fN9O=f0|P@N
z1`%ITKW9fD-U44&U&plQ2EPDLe@1QzE-n@zJIK+OA&r|sAi9woB+l#?;^wIk-6#W+
zVD@nFaa9O%4GUIq3-xnWaB~cDZ}>HFVU~qt?c_9uNs}`Y7#46&&SF?1$jk^P7z=Vh
zdI~Z@nhLT&x)#V(Pwva+Vwv2Y&B(CXozaCcO~x<Gz<?v((ItpcL?GTJ*q3Dq$blJ|
oS=o%yO>#h4L$E9tlZYUyG#3*@-UuSkj3Lj=0rDgd!-xOu0Hgy@&Hw-a

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index eb8bae1407..dfb8523c8b 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,3 +1 @@
 /* List of comma-separated changed AML files to ignore */
-"tests/data/acpi/pc/SSDT.dimmpxm",
-"tests/data/acpi/q35/SSDT.dimmpxm",
-- 
2.31.1


