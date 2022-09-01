Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0CF95A8BF5
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 05:36:54 +0200 (CEST)
Received: from localhost ([::1]:34436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTb0f-0000j9-Pu
	for lists+qemu-devel@lfdr.de; Wed, 31 Aug 2022 23:36:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robert.hu@linux.intel.com>)
 id 1oTarz-0000FV-Mv
 for qemu-devel@nongnu.org; Wed, 31 Aug 2022 23:27:55 -0400
Received: from mga12.intel.com ([192.55.52.136]:17697)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robert.hu@linux.intel.com>)
 id 1oTarp-0007w7-Oj
 for qemu-devel@nongnu.org; Wed, 31 Aug 2022 23:27:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662002865; x=1693538865;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=//B9Et46IkTNA4liFhpc2ukBu1B2iGHUJzNNGzVHG68=;
 b=VfWHxSziWLFbLDuL/b7aqYv2x0aVS9HNofu6exrq5LAN6kiMUVJ0lvun
 dQ7wEJu8HxLXlGCyki5+Kk+Kgv5hPA8CINI470QOgqLQH5jU46E3VEJgn
 gJz+hA+dD3pBMcSP92vPUPBt3fVBLR2s67OkFVA5FKEV+qT3/j/jAWwBG
 8V/nl2tb9hsAE1CMsvXPQkLPG/8WxirNiHVUf5auc+3CSLpogcNYSLVEW
 KECEOQXeJXr95zFm2vBJDWKiwcvCHcRoVZFDLvjLe4zJBDV4cvlVBbSYb
 q3v3xmOMUBBvq+HNW+Evtn1tkVEVoKnDq79a2WxhsvN9ylwJXpckoEewU g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10456"; a="275354039"
X-IronPort-AV: E=Sophos;i="5.93,280,1654585200"; d="scan'208";a="275354039"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2022 20:27:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,280,1654585200"; d="scan'208";a="642142725"
Received: from sqa-gate.sh.intel.com (HELO robert-clx2.tsp.org)
 ([10.239.48.212])
 by orsmga008.jf.intel.com with ESMTP; 31 Aug 2022 20:27:38 -0700
From: Robert Hoo <robert.hu@linux.intel.com>
To: imammedo@redhat.com, mst@redhat.com, xiaoguangrong.eric@gmail.com,
 ani@anisinha.ca, dan.j.williams@intel.com, jingqi.liu@intel.com
Cc: qemu-devel@nongnu.org, robert.hu@intel.com,
 Robert Hoo <robert.hu@linux.intel.com>
Subject: [PATCH v3 5/5] test/acpi/bios-tables-test: SSDT: update golden master
 binaries
Date: Thu,  1 Sep 2022 11:27:21 +0800
Message-Id: <20220901032721.1392482-6-robert.hu@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220901032721.1392482-1-robert.hu@linux.intel.com>
References: <20220901032721.1392482-1-robert.hu@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=192.55.52.136;
 envelope-from=robert.hu@linux.intel.com; helo=mga12.intel.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, SPF_HELO_PASS=-0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

And empty bios-tables-test-allowed-diff.h.

Diff of ASL form, cited from qtest testlog.txt:

--- /tmp/asl-0WHMR1.dsl	2022-08-30 11:38:09.406635934 +0800
+++ /tmp/asl-APDMR1.dsl	2022-08-30 11:38:09.403635663 +0800
@@ -1,30 +1,30 @@
 /*
  * Intel ACPI Component Architecture
  * AML/ASL+ Disassembler version 20180629 (64-bit version)
  * Copyright (c) 2000 - 2018 Intel Corporation
  *
  * Disassembling to symbolic ASL+ operators
  *
- * Disassembly of tests/data/acpi/pc/SSDT.dimmpxm, Tue Aug 30 11:38:09 2022
+ * Disassembly of /tmp/aml-1AEMR1, Tue Aug 30 11:38:09 2022
  *
  * Original Table Header:
  *     Signature        "SSDT"
- *     Length           0x000002DE (734)
+ *     Length           0x00000765 (1893)
  *     Revision         0x01
- *     Checksum         0x56
+ *     Checksum         0x36
  *     OEM ID           "BOCHS "
  *     OEM Table ID     "NVDIMM"
  *     OEM Revision     0x00000001 (1)
  *     Compiler ID      "BXPC"
  *     Compiler Version 0x00000001 (1)
  */
 DefinitionBlock ("", "SSDT", 1, "BOCHS ", "NVDIMM", 0x00000001)
 {
     Scope (\_SB)
     {
         Device (NVDR)
         {
             Name (_HID, "ACPI0012" /* NVDIMM Root Device */)  // _HID: Hardware ID
             Method (NCAL, 5, Serialized)
             {
                 Local6 = MEMA /* \MEMA */
@@ -49,52 +49,52 @@
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
@@ -161,45 +161,234 @@
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
+                Method (_LSI, 0, Serialized)  // _LSI: Label Storage Information
+                {
+                    Local0 = NCAL (ToUUID ("4309ac30-0d11-11e4-9191-0800200c9a66"), One, 0x04, Zero, One)
+                    CreateDWordField (Local0, Zero, STTS)
+                    CreateDWordField (Local0, 0x04, SLSA)
+                    CreateDWordField (Local0, 0x08, MAXT)
+                    Name (RET, Package (0x03)
+                    {
+                        STTS,
+                        SLSA,
+                        MAXT
+                    })
+                    Return (RET) /* \_SB_.NVDR.NV00._LSI.RET_ */
+                }
+
+                Method (_LSR, 2, Serialized)  // _LSR: Label Storage Read
+                {
+                    Name (INPT, Buffer (0x08)
+                    {
+                         0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   // ........
+                    })
+                    CreateDWordField (INPT, Zero, OFST)
+                    CreateDWordField (INPT, 0x04, LEN)
+                    OFST = Arg0
+                    LEN = Arg1
+                    Name (PKG1, Package (0x01)
+                    {
+                        INPT
+                    })
+                    Local3 = NCAL (ToUUID ("4309ac30-0d11-11e4-9191-0800200c9a66"), One, 0x05, PKG1, One)
+                    CreateDWordField (Local3, Zero, STTS)
+                    CreateField (Local3, 0x20, (LEN << 0x03), LDAT)
+                    Name (LSA, Buffer (Zero){})
+                    ToBuffer (LDAT, LSA) /* \_SB_.NVDR.NV00._LSR.LSA_ */
+                    Name (RET, Package (0x02)
+                    {
+                        STTS,
+                        LSA
+                    })
+                    Return (RET) /* \_SB_.NVDR.NV00._LSR.RET_ */
+                }
+
+                Method (_LSW, 3, Serialized)  // _LSW: Label Storage Write
+                {
+                    Local2 = Arg2
+                    Name (INPT, Buffer (0x08)
+                    {
+                         0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   // ........
+                    })
+                    CreateDWordField (INPT, Zero, OFST)
+                    CreateDWordField (INPT, 0x04, TLEN)
+                    OFST = Arg0
+                    TLEN = Arg1
+                    Concatenate (INPT, Local2, INPT) /* \_SB_.NVDR.NV00._LSW.INPT */
+                    Name (PKG1, Package (0x01)
+                    {
+                        INPT
+                    })
+                    Local3 = NCAL (ToUUID ("4309ac30-0d11-11e4-9191-0800200c9a66"), One, 0x06, PKG1, One)
+                    CreateDWordField (Local3, Zero, STTS)
+                    Return (ToInteger (STTS))
+                }
+
                 Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                 {
                     Return (NCAL (Arg0, Arg1, Arg2, Arg3, One))
                 }
             }
	     ... // iterates in each NV devices

Signed-off-by: Robert Hoo <robert.hu@linux.intel.com>
Reviewed-by: Jingqi Liu <jingqi.liu@intel.com>
---
 tests/data/acpi/pc/SSDT.dimmpxm             | Bin 734 -> 1893 bytes
 tests/data/acpi/q35/SSDT.dimmpxm            | Bin 734 -> 1893 bytes
 tests/qtest/bios-tables-test-allowed-diff.h |   2 --
 3 files changed, 2 deletions(-)

diff --git a/tests/data/acpi/pc/SSDT.dimmpxm b/tests/data/acpi/pc/SSDT.dimmpxm
index ac55387d57e48adb99eb738a102308688a262fb8..2316d8f959267a178b12379dbcb439a6306b0db5 100644
GIT binary patch
literal 1893
zcmdUw&ubGw6vt<?X)~Rql1(Dk`h)!sOnWGT2ig4Cc4;;VyW3jW!v4~vO?nubdhpgC
zht>#Ux>Qg^Hf4{3cfp%iPoBJaD0ufGcu?nUe@F{zMJT$5nKy6VzWvPiJ0!YZGVUZ0
z;wB2U;*>5{XG@BzvNb}eFjp_aoR&NDmR_*Tb#<BTYuK7nO2bmIuH^G$<0v<MzFL$j
z!&EJ+Qo~%W)|DEU93dpmVog#}BZ<=HS`zYn)sPj@T)PY#{8Xt@7Pa!MF3L02q9{w+
z<m#7%xt57`wMw}v)=HAG`ZW=Z`b&rkS&|Mvrmyv$?+N$cWp4PN=U>_V>%mojDFw(;
z!KY^rZuj42irx3ho0sFSUAuoF%I9AU6@}qFq1VGmOg(Mb!AQ?<plyG_4u<>|3I(2v
z297QP7+nN1+5)uT(j)(2o5cOiHb=MG2)T5_^{5BLv;k*Y0a_Awf{7i6V2WI96lP>-
zNrf0{?q1n(9lEgv$8pgX>><=?!rZ*;hE00UAv|)-EEFK8#_}NyxwKW%)p!U3FD$m&
z2y40_p`4n~WW^Z5HCZ<hU4V%~4JdR{0FKKHa!?UzWOr@ETFg)wpjnXG_M=S5K<TFK
ztT=EE>^n@27&5aq5hFT=BZn~LZd&Z)7!KxA<n87;3N)S#ZwG=8U6Y7A-0!D@L1^YK
zdydy}ZI|7ni`ChD9$QjL<8tzVRnZlE#DCH#j>HkSk8S8(o5b~sF0mP_(wu>{vSDS;
z@w#E?kcV6dxm=mBwi>}owQdMWg4somo-QO1=n+LE&Wy7TBwU0T*QY1Pm}F4*3#b7o
z<GilN#4~g=>oJ+&b>?G*nTQ#T#T0rB3yAkgNerrCy-!)djPh2Jw%p%?8m#>xD8wBg
zbYVCp^58M#@Cl%xlUIy0*9)V}p0UUt63b1V!XFa*bA#lwFo?wd)}i8=JM@G3&?4dZ
luK<Z1cr?E65q~<5_<z+S{y+5Si1}w8@fiLOQ|QCD#CMx$@elw2

delta 150
zcmaFLcaN1TIM^lR9uortW7tG4X>Nb5nD}6)_~<4#t%(LAjJ^|Hw{uC>PEKQ(G&v)I
zVKOVD5|2#v<i2b!mdWkej0~HN7+n~>Wc<Pm3^?K)U4j@z1mazSeOZ?HIXn7fWM*YE
eMmNa;WevfyTudT@sM1_a5P2hrJo98vb{PO-TPR%s

diff --git a/tests/data/acpi/q35/SSDT.dimmpxm b/tests/data/acpi/q35/SSDT.dimmpxm
index 98e6f0e3f3bb02dd419e36bdd1db9b94c728c406..cfb1f0515293f2e3630b755da26d558f43c91bc4 100644
GIT binary patch
literal 1893
zcmdUwO=uHA6vt<?X)~R)l1(Dk`aw=!O?wc*gKRe0c4;;VyW3jW!hUJeCOr&IJ$UQK
zp*4b-E)^7!P1&R1UGV1BlPB*5ui{1Upw8R0l@`>BP;?J7Z{ECp`<wrNNOZku+({tB
zT`5$hDLq%2Eh?(Y)(D}(Tup*GCAa4-y<nN^>N4Bcur;L=M?|Tn<n!YbC_8<&B8lY@
zs+Lr-Zmw2pN|j5F5)x;zCaS2OL@9GE33<L^$V$#!y9gWnRIyyjX{A{`C(l%*oGfaS
zt6vi4S~}X*%B4!KS`>}duZdvHUqV#KkW}~~b+!9^Pq_aseZ&7e|H|%N4=(#l!+;zW
ze0uiacJFOk>bzIpyqtLL+P!m8KL27!5=QofZWp86@YA{-jCTDx+V&UhV90NxP~f>}
z;OG*7(M2GmO+X7SJn|p5NZj9SadfMNkV`jQk9t5%>u{zOpe1o9xVGaEOp%L?!i)?p
zsSrbr-Ag;JLpQeII4;_PJ%ri~m>YN9utD!Rgh!5<fdb@ISw4gzo3e_!8V^C>g~etI
zVNEwglvNX&tQbSMD(eQK3oucr0fmkWz;Wq84k{vz?2e6Cix~<7Gz*5e{U{SMP`YV5
zD-N6k`wmkhhRlpjauFTFkwX}=H!b#Y3<q;5@^<qa1sczWw*$e4u1Ull?DtZ^AT)EA
zJ;!Uiw#)9(`O0iQk1esNaano5D(eb9<Uei{N8*U<V;g$MCUL#2i)_ZKIA>t3WLW7l
zylxme<RKSAE?Xk3twyj?sTo3&V0MwCrvnKDdPEV4Gvlm%2^S&8wdu)mCK=TI0%`!t
zIIrU|@eJL}cuXdEo%vX1CSnF-F@+w(0^&X?i9t22`;-ODC~qZc)BQcD!P*~yLfi&I
z7lsoe4<11dp8yIve#JO*y)ee?8ISBCvFzjt{2{SFH%LAWgGlUe9g<Gnp&!f#770gx
l1xRe)qlvyp{K-7x|5cCp|InjD=AU`QWB5NDMjyW=z5^xL@elw2

delta 150
zcmaFLcaN1TIM^lR9uortquWF-X>Nb5nD}6)_~<4#t%(LAjJ^|Hw{uC>PEKQ(G&v)I
zVKOVD5|2#v<i2b!mdWkej0~HN7+n~>Wc<Pm3^?K)U4j@z1mazSeOZ?HIXn7fWM*YE
eMmNa;WevfyTudT@sM1_a5P2hrJo98vb{PO!+bB%{

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


