Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C55633C79A8
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 00:30:44 +0200 (CEST)
Received: from localhost ([::1]:38784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3QvK-0006dO-Ft
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 18:30:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m3QeH-0004RO-2u
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 18:13:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34860)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m3QeE-0001EA-71
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 18:13:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626214381;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pxbNJIFUIVQZ8eiUNei7sLj1LzsgmxfPLrXR8qYMHRc=;
 b=HJlOKwXWEQvxozkYlk6q1fy2zOkVwzOI6hH7m+jKCdrKQfn5Zy6GyRuY6On6TVlVyQI2C+
 XkAXDJm2IBxzzYsshsIYeu0wOIQqyMqjoGSnkqbvWQPDVAAUpLwN4EGu1i6bo7O1GOT+YC
 AGoaNZ4n8UJ1EufHDMpIKyJxYg7opZE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-158-8GxZs48vPIuVxosVoPVpow-1; Tue, 13 Jul 2021 18:10:29 -0400
X-MC-Unique: 8GxZs48vPIuVxosVoPVpow-1
Received: by mail-wm1-f70.google.com with SMTP id
 j141-20020a1c23930000b0290212502cb19aso158120wmj.0
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 15:10:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=pxbNJIFUIVQZ8eiUNei7sLj1LzsgmxfPLrXR8qYMHRc=;
 b=C4mVZgJrhgi1VVcZeVMbDRP216husQaP3iEtWWJOkcDueeOd9MO8dF2N0+IrIqsPt9
 0TmrrD/TcyCWf8rEr8+h49i37SRLiKz/9OqGBNnIbcCVe8RrLTiWI7fYrKKRhvRv3eGf
 v92AgGd7gB0L5PcShg7+eInv8nLkxDuZu/ut3zOQjMF9yiOtifzBkI+jeLxwApUMKBah
 YhEUye/h1BrQCiqkHEfDRUYW+OJnXQGLQKmZIKEr0mSQDYvL38jYS1x1EwoNnGn5hXBx
 q3u4GYqlxyELw3B0Uzufjv5K+Z6zJ5EAkZ1pnjzrbQ2W29f38lK+AbHtBOBr5aRF+8Dk
 IUgQ==
X-Gm-Message-State: AOAM533Vjf0SSoOYPPuWEq1l7G5mgPw9+RqEX5WBWJrFVLtOGzf6BV73
 Ldl+9FmAXSSeIjHcoetSKSjf1NpmWokbJ8j+pNMZqJBwXflDo3MYNi98dm35PYq3MssbGmx9mwC
 PEzFAOMq442CPuYjmPmuXZLKAAnnrHDhNDnsx+Acv23tth9fj/MCwrASFNhex
X-Received: by 2002:a05:600c:35c6:: with SMTP id
 r6mr438074wmq.14.1626214227439; 
 Tue, 13 Jul 2021 15:10:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwTimTJLLtcm+wbG00Bcal5xpgAD+oLCH35a+nZ86gZ+ktKf4BGakLouxCo9ljBzFhrXb4VaQ==
X-Received: by 2002:a05:600c:35c6:: with SMTP id
 r6mr438051wmq.14.1626214227117; 
 Tue, 13 Jul 2021 15:10:27 -0700 (PDT)
Received: from redhat.com ([2.55.15.23])
 by smtp.gmail.com with ESMTPSA id m4sm139422wrs.14.2021.07.13.15.10.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 15:10:26 -0700 (PDT)
Date: Tue, 13 Jul 2021 18:10:23 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 06/23] bios-tables-test: Update golden binaries
Message-ID: <20210713220946.212562-7-mst@redhat.com>
References: <20210713220946.212562-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210713220946.212562-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Julia Suvorova <jusual@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Julia Suvorova <jusual@redhat.com>

Add ACPI hot-plug registers to DSDT Q35 tables.
Changes in the tables:

+    Scope (_SB.PCI0)
+    {
+        OperationRegion (PCST, SystemIO, 0x0CC4, 0x08)
+        Field (PCST, DWordAcc, NoLock, WriteAsZeros)
+        {
+            PCIU,   32,
+            PCID,   32
+        }
+
+        OperationRegion (SEJ, SystemIO, 0x0CCC, 0x04)
+        Field (SEJ, DWordAcc, NoLock, WriteAsZeros)
+        {
+            B0EJ,   32
+        }
+
+        OperationRegion (BNMR, SystemIO, 0x0CD4, 0x08)
+        Field (BNMR, DWordAcc, NoLock, WriteAsZeros)
+        {
+            BNUM,   32,
+            PIDX,   32
+        }
+
+        Mutex (BLCK, 0x00)
+        Method (PCEJ, 2, NotSerialized)
+        {
+            Acquire (BLCK, 0xFFFF)
+            BNUM = Arg0
+            B0EJ = (One << Arg1)
+            Release (BLCK)
+            Return (Zero)
+        }
+
+        Method (AIDX, 2, NotSerialized)
+        {
+            Acquire (BLCK, 0xFFFF)
+            BNUM = Arg0
+            PIDX = (One << Arg1)
+            Local0 = PIDX /* \_SB_.PCI0.PIDX */
+            Release (BLCK)
+            Return (Local0)
+        }
+
+        Method (PDSM, 6, Serialized)
+        {
+            If ((Arg0 == ToUUID ("e5c937d0-3553-4d7a-9117-ea4d19c3434d") /* Device Labeling Interface */))
+            {
+                Local0 = AIDX (Arg4, Arg5)
+                If ((Arg2 == Zero))
+                {
+                    If ((Arg1 == 0x02))
+                    {
+                        If (!((Local0 == Zero) | (Local0 == 0xFFFFFFFF)))
+                        {
+                            Return (Buffer (One)
+                            {
+                                 0x81                                             // .
+                            })
+                        }
+                    }
+
+                    Return (Buffer (One)
+                    {
+                         0x00                                             // .
+                    })
+                }
+                ElseIf ((Arg2 == 0x07))
+                {
+                    Local1 = Package (0x02)
+                        {
+                            Zero,
+                            ""
+                        }
+                    Local1 [Zero] = Local0
+                    Return (Local1)
+                }
+            }
+        }
+    }
+
...

     Scope (_GPE)
     {
         Name (_HID, "ACPI0006" /* GPE Block Device */)  // _HID: Hardware ID
+        Method (_E01, 0, NotSerialized)  // _Exx: Edge-Triggered GPE, xx=0x00-0xFF
+        {
+            Acquire (\_SB.PCI0.BLCK, 0xFFFF)
+            \_SB.PCI0.PCNT ()
+            Release (\_SB.PCI0.BLCK)
+        }
...

+
+        Device (PHPR)
+        {
+            Name (_HID, "PNP0A06" /* Generic Container Device */)  // _HID: Hardware ID
+            Name (_UID, "PCI Hotplug resources")  // _UID: Unique ID
+            Name (_STA, 0x0B)  // _STA: Status
+            Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
+            {
+                IO (Decode16,
+                    0x0CC4,             // Range Minimum
+                    0x0CC4,             // Range Maximum
+                    0x01,               // Alignment
+                    0x18,               // Length
+                    )
+            })
+        }
     }
...

And if there is a port in configuration:

             Device (S10)
             {
                 Name (_ADR, 0x00020000)  // _ADR: Address
+                Name (BSEL, Zero)
+                Device (S00)
+                {
+                    Name (_SUN, Zero)  // _SUN: Slot User Number
+                    Name (_ADR, Zero)  // _ADR: Address
+                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device, x=0-9
+                    {
+                        PCEJ (BSEL, _SUN)
+                    }
+
+                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
+                    {
+                        Return (PDSM (Arg0, Arg1, Arg2, Arg3, BSEL, _SUN))
+                    }
+                }
+
...

+                Method (DVNT, 2, NotSerialized)
+                {
+                    If ((Arg0 & One))
+                    {
+                        Notify (S00, Arg1)
+                    }
...

Signed-off-by: Julia Suvorova <jusual@redhat.com>
Message-Id: <20210713004205.775386-7-jusual@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h |  11 -----------
 tests/data/acpi/q35/DSDT                    | Bin 7859 -> 8289 bytes
 tests/data/acpi/q35/DSDT.acpihmat           | Bin 9184 -> 9614 bytes
 tests/data/acpi/q35/DSDT.bridge             | Bin 7877 -> 11003 bytes
 tests/data/acpi/q35/DSDT.cphp               | Bin 8323 -> 8753 bytes
 tests/data/acpi/q35/DSDT.dimmpxm            | Bin 9513 -> 9943 bytes
 tests/data/acpi/q35/DSDT.ipmibt             | Bin 7934 -> 8364 bytes
 tests/data/acpi/q35/DSDT.memhp              | Bin 9218 -> 9648 bytes
 tests/data/acpi/q35/DSDT.mmio64             | Bin 8990 -> 9419 bytes
 tests/data/acpi/q35/DSDT.nohpet             | Bin 7717 -> 8147 bytes
 tests/data/acpi/q35/DSDT.numamem            | Bin 7865 -> 8295 bytes
 tests/data/acpi/q35/DSDT.tis                | Bin 8465 -> 8894 bytes
 12 files changed, 11 deletions(-)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index c5167f48af..dfb8523c8b 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,12 +1 @@
 /* List of comma-separated changed AML files to ignore */
-"tests/data/acpi/q35/DSDT",
-"tests/data/acpi/q35/DSDT.tis",
-"tests/data/acpi/q35/DSDT.bridge",
-"tests/data/acpi/q35/DSDT.mmio64",
-"tests/data/acpi/q35/DSDT.ipmibt",
-"tests/data/acpi/q35/DSDT.cphp",
-"tests/data/acpi/q35/DSDT.memhp",
-"tests/data/acpi/q35/DSDT.acpihmat",
-"tests/data/acpi/q35/DSDT.numamem",
-"tests/data/acpi/q35/DSDT.dimmpxm",
-"tests/data/acpi/q35/DSDT.nohpet",
diff --git a/tests/data/acpi/q35/DSDT b/tests/data/acpi/q35/DSDT
index cccf92f0466fa4eaf2e9e06675b3b102c7a8eb86..842533f53e6db40935c3cdecd1d182edba6c17d4 100644
GIT binary patch
delta 466
zcmdmN`_O^QCD<h-QGtPh@##jc-%Rxaeu8@O!A|i3&YlL*4FS%<A&lHdc(^#C8wEfd
zXP|hf0+4V~h;9gW^@?ZYKEuPs65YrR;y61QxOxF4ocw%)7`d-Nw1GIzPJW@j3IU!j
z5em_aPCm}w3?ixl&aPfe(aIp+|NjLUAQc6b^^BPeAVZ?nLE=joM6?}&nlO|BRe=mE
z01*jLwFx3FYymF8zI+ROSSM!)3UdiuFhBV;*tE)bqWCLc$-~aR1t7C>auXIPPtIak
zAUQdci)n%Iq}s^|43iUh{sRHS5=B8~#>OQ;f?=Wf0@2A?T<irxtV|5N42cB^9f=GK
zOA<G;GT)YD@@JX+P)68R#4_I1z>pzYIYyru7HSX=AqfOH`-McSBME?12>6O_{w~AM
zs2<(q#S-8V5X2Gh;pxH~;1^)vXkf;`5g!WTIeRL2<d+oWl%`L9C@af$gy#qkqr_wu
axlArUmKczQ0&Xmm%j9g?Mc6>LFaQ7^vWU|F

delta 57
zcmaFpu-TT&CD<iovm65h<GYPqznM0xu-ukp6q(E@C(JD1D7ZOLj-PSz8u@fiH<p<A
NV5fKiyUDT&wgCMJ5G4Qr

diff --git a/tests/data/acpi/q35/DSDT.acpihmat b/tests/data/acpi/q35/DSDT.acpihmat
index b3c1dd6bc40210425ac37dba88a650b0ea60ce1c..8d00f2ea0dd78f962e136273d68cb0c568e43c27 100644
GIT binary patch
delta 465
zcmaFh-sjEb66_Mvr^>*<xM(BSZ>D+yKS90tV5j&1XHSFZh5+Z_5Jv7JJX{>njRGK!
zGf+HK0Z6zgL^lMxdc`wxpW)$RiEiWuah#nDT)lu2PJX^YjNDfs+CUs<C%;f%g#b^N
z2!&`yCm&~T1`*W&XIC$#Xk`%Z|NnvvkcxuJdd5r!kRj3PAn_#(BHE5XO&H36sz8Pn
zfQSUB+5{07wg8u4U%mxCtdlbYg}DSSn4f$aY+B_zQT&y!<Y8yu0+3lbxd{uDCucD%
zker;!#k4?pQtjjfhRF#$|AByEiJ~AgW8)Ga!LU$#f#~EcF7^T;Rwf2shQxw|jzk8A
zC5f9^nK|Tx{8{4N16(=cJv?1_9i0O_4Gav-7(^`NT@4HwqLpLxnPFiF@g9;ufU{pn
zv^tUiNQHo}=w=lqenyVyCNGu%kAR@bfwCgpz+hJJ$S*0#DNUcur!32Mgy#qkqr_xG
a<xDO=mKcx?0&Xmm7c1Mci?D%=WdHyz0)`?0

delta 71
zcmeD4e&EjK66_N4K$(GoarH*7-%OiTSUBXxMdIB9Tsh)BJY9GlodY}#3=GT|1RMo7
b*D3QePQIy<&gsSy6CdmpFJL#>OVt(t-l7wM

diff --git a/tests/data/acpi/q35/DSDT.bridge b/tests/data/acpi/q35/DSDT.bridge
index eb5d27d95b2cdeda5f7e1f6b151cfea02e6bd907..55ad4bd7ab4759d68031b2f1d0307355a7332fe7 100644
GIT binary patch
delta 3198
zcmb7{PjBNy7{<qr)4Gn+I*q$&cAGY+LX|*TvUJ;~5-Xb6L2YP^RW}I9E1aH4$|7<A
zA*j%#J*>Ebzd(?3;ItCjk3cyfap1s>(;m2R;mDzf?)%1mvr$RXI0q}wJmcRyGxq%P
zuaB<kis_igS8p&T{QI+VC34M5-S?cbXB!6vw__X5v5>e_71=%4P#92N&%?#cyB()e
z^@POlsv^1P2^2=TP^p4ZwrWR0;?LkV6h_&q*Yfs(`BB~#%7@1LOn==rDpk>4M|FMO
zZeor0*IZ~Zgt!}6-edZkCAjH-)u0x_+IVS%bsM@lW1CKGzIzz=o2j&-{ju}g-_F)I
zweK_k)Uv-AwKlSzeAei$`=_j%^;?SAP5<z%-(Y@2y@ns_y_Sjz=RLTvA2Z!0|5TZ6
zFUCcdWGC&$cPEVXPM*hOe`UoFB>%-q`jNitRSFN7yZ-pC7>!!cp`ilXu#Vl0p#rR-
z)s~+Bx3VB?xEEE)-nWlrZ~wqd+Lm1?6}Fk|)lnG-`TftoXg~S#6aPgnH*=|8s=~4_
zt)9+3dyMUAd(Zr@R^R2;PtJpaCwnFHNM%f9a@naIGWX&gr+~#y-2x(*OkeaW)q;Ry
zk5$moGaihZ+QYGHwoX5#a`&PnIfY_yyFhGV6oQXul%*gUG^B_G5l2BLGr}B7j2N*Y
z2A`rc5ajJ}EEI_#(hy`y1_g-|BhGXlWmF-^CIy)x$V}uQn-pYL_IU8zXCp%%QV^Mf
z$k7=^kN00OWsV?oks(_YL?MO}fx#{J0)};qh9p6dL<C5{*rp&VG1S``e0bJCkZlT*
zBuMgh$PLC01(_$t{8$DbIej6>4h2~t$ii62I7X3zXvENNGWg_m1cDSPNQxk-n~+->
zyA))R7>gl;Pr0B$kX;IrCP+GRkP-#aLk4GhbO;4mq999=8RaktSMCtxPIL$b$q*wG
zmBAf@hGdx_%TXbYK|!*_$WF=N{f(@@2ACA&E<x^22^nHgkbA_qH<`h2?ws(VRVc^`
zK~^S1MlmQzju^R-3_f-Xham4!kX3@Lj)Y8PP>?lZtPL|bof*dM;kuPGKeUd;ZsM#d
zu%~z`X?4}JrXr#!hC%`X$C$v8QIMm7fZaQA@+ipJ1F^};>Yzd^dDcuYYzcO_P+?OK
z2OhQsn@;FqW3YRK3R{DHAXL~KEa;)a_F!oa6}AU!EN^ue&YE!Y5*QS~f=OEJYrHw|
zCDgEvk(T@Vm9L?O<%RrwU%&GAP{XVzzth)6J}Bt-873oDfV1FJoLB>m{f0R*(AaZx
z$j83Jt2^-XsE7PL(C|hL{0?dyR(%c6xvb6bAde3lzZ8V<kEz6T_<jKY<NNrC@$XB%
CMohN=

delta 73
zcmewzdeoN7CD<k8s2l?WWBW#~-%OiTSZ+%)icDsd6J{206x<vr$Im!<jeG_tYfOBw
dQ@nr!>ttC4dw%|4LxXsZct@8Y9tH*`1^^Ot5>o&G

diff --git a/tests/data/acpi/q35/DSDT.cphp b/tests/data/acpi/q35/DSDT.cphp
index e55d12990c98d8eed760b858ce18a036b612da1c..ccde2add9f87db0c0eaf0cc155717d5744e4ef40 100644
GIT binary patch
delta 466
zcmZp6+~~sP66_LUsKmg)=(&;WH&eZUpP*iRuv2`1v!_9HLx6K|2qX6q9xjgPMgb7V
z87LmA03=)#q8ox;z2X_U&+u@uL^pDSIL=N6u3kV1CqLgHM(!&RZ6J=blV7N>LV%}B
zghDi<laI4EgNSN?v#S?Vv@(eI|9?RSNJT+qJ!2*V$dG7tkoXb?5p74HCJbdjRUpF(
zKtuvmZGwmkTYyWjFW&+m*2x)y!dwCu%uhZIHm&lVDE`V<^02dS0m!VJ+=K<nld~8W
zNKVe=Vp<?PsdjP#!{h{>|3JX7L{X5Lv2h8IU|1-=Ky-2z7khyaD-#1RLt;TfM<N5m
zlElrd%&VoD{8=V%loPfUv5a>$Fl2~Uj?rg^g&M>|NCE-Qej(B7NCF@g0=}Y~kIV5h
zsz*0@u>^Po1aZWBc)IWg_yrg^8kjL~#D{`-&YlV$`6UH8rRkG5%FD7H;W@&?C^7kp
Zd?uG4OAN?D0XLS(ZVI;SB5WXA7y#g;hnxTa

delta 57
zcmdn!((K6P66_MvtiZs)7_^b=H`8VnmetaXB9kx53o{Ei3T{?Z;Afm%qnOU=#u5`B
N>=Z9xH~FoiEdbPr5E}ph

diff --git a/tests/data/acpi/q35/DSDT.dimmpxm b/tests/data/acpi/q35/DSDT.dimmpxm
index 95901f94c0d445919cb84dd1f6d98c646ae8176e..b062e30117f955c7a2ac9629a0512324bbd28bf2 100644
GIT binary patch
delta 500
zcmZ4Kb={ZCCD<k8x*7umqwz+r-%Rxaeu8@O!A|i3&YlL*4FS%<A&lHdc(^#C8wEfd
zXP|hf0+4V~h;9gW^@?ZYKEuPs65YrR;y61QxOxF4ocw%)7`d-Nw1GIzPJW@j3IU!j
z5em_aPCm}w3?ixl&aPfe(aIp+|NjLUAQc6b^^BPeAVZ?nLE=joM6?}&nlO|BRe=mE
z01*jLwFx3FYymF8zI+ROSSM!)3UdiuFhBV;*tE)bqWCLc$-~aR1t7C>auXIPPtIak
zAUQdci)n%Iq}s^|43iUh{sRHS5=B8~#>OQ;f?=Wf0@2A?T<irxtV|5N42cB^9f=GK
zOA<G;GTSPoIkUyP2e@*?dw9C=Iywh<8W<RuF^E{kyBZiWL@USWGsD6V;yomR0B66D
zXmun3kO~oDpiUEpwis~O`-Qm#aWx3|if+zT=4VuoZt`LY@CXQk*cRXyVBiR}j3Yi2
zXg4q>6g=`v3UW%*Cx@%ZvK`?$!ow&rxk@FI%a0`n<Ol&bmdS5aY}rNFKsGY~09jj*
AH2?qr

delta 75
zcmccayV8rxCD<iIQ<Z^%QFbHOZ>G&EEVc?F8u9J{t{m|mo-VwO&H<hV1_ovflQ*b{
fGC2xvKCZ&gI9W+8ozsmaCO+6HUchehWHnm=`KA-;

diff --git a/tests/data/acpi/q35/DSDT.ipmibt b/tests/data/acpi/q35/DSDT.ipmibt
index ce07e9f152def6a22ab29b3bde98b7d1f15a0522..1c5737692f56fc678e685a4ad0bb1df38d487a14 100644
GIT binary patch
delta 480
zcmZWlF;Buk7`=lEq!cYuqYRQ7Vi+`92Q>~3^jZa^<w7AbIg*x1AQ(I7povkOT=o7y
zO&DE_zre_1;^5%s?Bb6Q?}8>I-tdz5?tSm&`@XmD^P=GxwR;r+n0^p<!WXigTyY)U
z#i*!}ON^Wvj1MF+MtU+Qi0O5efuWL1$1J%p{wj$A>BTugx@MNxhi+R{7=Is)ae{Qa
zZmGCv?5hOoWwZyBMU2c+h-5h%4*eE)_@@`J4R{F2alH?er92z@XJalN=5z3Vy`Ex3
zu;EyfL3x6<k||Ms+kE+S*3Yb)*)J>oj4YpLbq~EDOFJM))3z82Qn%;S1Jsj-?1BD5
zG7Nit2H<Wsn4ujp>Q7IEKms&<@45*<zxjy6AL(jEaCfm8a|=Zykw>_wY1#%*wp>$N
z10>s64gcM6wBDG2kzFIXF@ZZ|Yvxg(pMp7ZRT6LkS4YX%##){Q$J{#WVOLiRN5_8m
i<bW<`<|6}XAi+6W$+SgVXz)ULN1#uc?WhvrE#L<Umx=`d

delta 71
zcmZ4E_|KNhCD<k8pBw`NqtZq$H|EXxEVm`aMdIB9Tsh)BJY9GlodY}#3=GT|1RMo7
b&ynM2ocvurozsmaCO+6HUchd0hJq~s<(w1f

diff --git a/tests/data/acpi/q35/DSDT.memhp b/tests/data/acpi/q35/DSDT.memhp
index 7acf6243f08cd906aa8a02d3acf1d720b36385ea..7b6f6487b229cac3424a5215c8f1755c0c85310c 100644
GIT binary patch
delta 480
zcmZqj*x=3O66_MPL6w1l@%l!t-%Rxaeu8@O!A|i3&YlL*4FS%<A&lHdc(^#C8wEfd
zXP|hf0+4V~h;9gW^@?ZYKEuPs65YrR;y61QxOxF4ocw%)7`d-Nw1GIzPJW@j3IU!j
z5em_aPCm}w3?ixl&aPfe(aIp+|NjLUAQc6b^^BPeAVZ?nLE=joM6?}&nlO|BRe=mE
z01*jLwFx3FYymF8zI+ROSSM!)3UdiuFhBV;*tE)bqWCLc$-~aR1t7C>auXIPPtIak
zAUQdci)n%Iq}s^|43iUh{sRHS5=B8~#>OQ;f?=Wf0@2A?T<irxtV|5N42cB^9f=GK
zOA<G;GHb~P`Lo2k2e@*?dw9C=Iywh<8W<RuF^E{kyBZiWL@USWGsD6V;yomR0B66D
zXmun3kO~1`(amm3{EX_+O<pVk9sxlRlLPz$3><+5bHs-N?E!|mf=7NyK~8D<WCLYc
jwj(@8co-!n2P<cC`LV=+EEI5KnS4~)mR*DmWD5fTV<d`8

delta 71
zcmdns-Q>aL66_Mfq{6_!cz+|;Z>G&EEL!s7BJu74t{m|mo-VwO&H<hV1_ovf0*->4
b7bx>HPX4Wu&gsSy6CdmpFJL!0N7WVpu^|&B

diff --git a/tests/data/acpi/q35/DSDT.mmio64 b/tests/data/acpi/q35/DSDT.mmio64
index 77d46369e48efca9a9e5024542c77cd26144beff..2e0a772a85275c9c3b4c9317d98cc7c3d27417f3 100644
GIT binary patch
delta 479
zcmZWl%}T>S7~Ji@Y1C9x)PoXRr3XPH_=Db>O|+>dU78kztt36!iee6WP!L;BUUlyh
zp)Vjlg1v}>9()BazJiCkOBDq7Ffg<8&G3D<8_%YoJ9_1L1^`I!g|E<sWT)m`M{_YU
zRno%9sla4c6cVH@ae|m$RT$_BX*ovGg~=CDh>&)Y6Qrp|k$q^kRffs;{un1nv#XYZ
zO?^ipP}@dZK%T|OD27OuvtG|{aEE_-0h@q_kQ~=LK%UF9p?@~!;$c1q@5k%OdJOB1
zH56<|X(Kf%NN=l8AI|cbbv^cJO*|sY=UE4bUXZ2xAef*{Ary?>oKp`_PwcS=I@75z
zY<C!dyRjfm_l3AW5)FYtQ1`v7Isl#eLo~cJRW3!`O>89Gf~gPY5jIs-T><i%Yp9EW
zWNQoI-y8PV`y*gvS4i%Uz#Wp6e!$biFh?$n5nRCKeloVPnrFcYx5|3h)s@20v43!~
hN7plxv98z^;W*vRGzUu28ZVSK>1(DGmt(vHd;|L@ije>S

delta 71
zcmX@@InRyDCD<iIPMLv$amq%n-%OiTSWM)^MdIB9Tsh)BJY9GlodY}#3=GT|1RMo7
buTtV?oXo0{&gsD#6CdmpFW@k_RK*_vr*sly

diff --git a/tests/data/acpi/q35/DSDT.nohpet b/tests/data/acpi/q35/DSDT.nohpet
index 0b10128e42af0c7b65e010963085bbf690a64065..ceb61f4115c2ccf4bcbb0d529551236933ecee15 100644
GIT binary patch
delta 504
zcmZ2#bJ?EDCD<k8vOEI=<NA$UxlHu}eu8@O!A|i3&YlL*4FS%<A&lHdc(^#C8wEfd
zXP|hf0+4V~h;9gW^@?ZYKEuPs65YrR;y61QxOxF4ocw%)7`d-Nw1GIzPJW@j3IU!j
z5em_aPCm}w3?ixl&aPfe(aIp+|NjLUAQc6b^^BPeAVZ?nLE=joM6?}&nlO|BRe=mE
z01*jLwFx3FYymF8zI+ROSSM!)3UdiuFhBV;*tE)bqWCLc$-~aR1t7C>auXIPPtIak
zAUQdci)n%Iq}s^|43iUh{sRHS5=B8~#>OQ;f?=Wf0@2A?T<irxtV|5N42cB^9f=GK
zOA<GiGu@U9@@I*64{+s(_waP#b#xB!G%zqQV-T^7cQr6%h*pl#XNH9##Cu2r0nUCQ
z(dtM7AQb|>qMI{i_!+&To4i;8JOY9sCI|Qh7&rnA=7<jk+5-%A1&{oaf}GNHg`(8r
z{L-T2)MB7qaEK!pH%Gj4P_Q5`7neKZ5uPJFj1rT}WHY(^SYkj95pZLf{6f~2U4#u}
GI|BgciIJ56

delta 71
zcmca?zto1yCD<iIRgQsyar;KDT&B&_m~Tspi^RJJxN^jMc)IX9ItO?f7#Nr_2sjFE
bJ}k@6I9X0UozsmaCO+6HUchd0zq~B~$tDvn

diff --git a/tests/data/acpi/q35/DSDT.numamem b/tests/data/acpi/q35/DSDT.numamem
index e4c4582e7f76b072ab1123c748b89ea33ea1db87..a3f846df541a70ce0730d0351954b78818bbcdd0 100644
GIT binary patch
delta 480
zcmdmK``m%cCD<h-U4emtv411iZ>D+yKS90tV5j&1XHSFZh5+Z_5Jv7JJX{>njRGK!
zGf+HK0Z6zgL^lMxdc`wxpW)$RiEiWuah#nDT)lu2PJX^YjNDfs+CUs<C%;f%g#b^N
z2!&`yCm&~T1`*W&XIC$#Xk`%Z|NnvvkcxuJdd5r!kRj3PAn_#(BHE5XO&H36sz8Pn
zfQSUB+5{07wg8u4U%mxCtdlbYg}DSSn4f$aY+B_zQT&y!<Y8yu0+3lbxd{uDCucD%
zker;!#k4?pQtjjfhRF#$|AByEiJ~AgW8)Ga!LU$#f#~EcF7^T;Rwf2shQxw|jzk8A
zC5f9^nIB39`Lo2k2e@*?dw9C=Iywh<8W<RuF^E{kyBZiWL@USWGsD6V;yomR0B66D
zXmun3kO~1`(anEl_!-rso4i;8JOY9sCI|Qh7&rnA=7<jk+5-%A1&{oaf}GOy$<JkF
j*^clW;bD}R%q5q}<;M~OvQWT{Wpa(2ExQOC$QA|wu$qg6

delta 71
zcmaFvu+x^yCD<ioryK(V<BW}5znM0xusoC$7m0TdaOH^i@O0sIbPn(|FfcG<5O5US
b94^PtIC+zNI;R^;Onk6Yynx+gWd&OR`Gym&

diff --git a/tests/data/acpi/q35/DSDT.tis b/tests/data/acpi/q35/DSDT.tis
index 15a26a14e4be5280c0f1cc09f66428311100b7ab..d1433e3c14570bbd17b029a9aec6bc53134c3b7d 100644
GIT binary patch
delta 469
zcmbQ}w9l2xCD<iopArKD<JpZ|znSU<`~>ylgPr07oIMSq8v>kzLm0V_@NjWNHwu6_
z&Oq@{1t8&~5Zw^$>J`t(eTIjNCAyIt#Bp{qaP<O8IQjVoF>+slXajMao%}+56#_h6
zA{3$-oqU|V8AMbAoL#+`qLo3s|NjdzKq?9<>lrf{K!!xCgT$9Gh-f<kHDM?Nssb5S
z03s5gY7<0U*aBRFefbvnuujep6y_4RV1DvxuxXX=MDbU?l82pr3qWS&<R&aoo}9(7
zKyq>>7t;daNwt#`7$zt1{09PtC5nQ~jEzfx1j9n{1)`I)xY!GXSeY1j84?Q;IuaQe
zmLzUwWxg%R<j*qsp^UJth-JL1fgwY*a*RGREYu(#LJ|mY_6vztM-l+35bzY+{9Q(x
zQ9ZiJizUD#Ac!O0!_$Q~z%RhS(ZGy>BR&+wbM{p5$S*0#DNUdJR#ukn2+t87Mv2J+
da+#d|nlT^?1>7e$$=R`quz@Vuyk9Pe2>{`!ixL0;

delta 62
zcmdnzI?;*CCD<iIP?3RwasNiH-%OiTSZ+%)icDsd6J{3h72F&sC(Sr{hkQDxhh|KC
Suv5H%!(<HwyUn=@flL4**AWN+

-- 
MST


