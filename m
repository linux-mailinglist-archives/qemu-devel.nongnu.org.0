Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E2AE59BC9B
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Aug 2022 11:18:34 +0200 (CEST)
Received: from localhost ([::1]:45384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQ3Zp-0007MY-Cd
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 05:18:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1oQ3NI-0005Zg-I6
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 05:05:39 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:43970)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1oQ3NE-0006wf-VZ
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 05:05:35 -0400
Received: by mail-pf1-x42e.google.com with SMTP id w138so7088678pfc.10
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 02:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=q0ObOxK2MiZq3VBWDXHBVl7juOt1W6dENpR2gzKgWb4=;
 b=4eofeI19LDEm3uV3xeRycSKvCOIONNitbSe5Ak5NovpuURm2awfUY0BjtQ5Ef53XSz
 /J19YfhxnTbESySv67kvuWrAFa6CJF0QMqqBTRbYChQHy5LbDkpHMuLdnFmUB4orfcv1
 gSQ3XyIm58Yv7yQlUa9cWua5TbOfq8SEuEXEn0sJsD/YGPDSwseahjVcJqwaHLkeCqj2
 o5M8s7fForWsVxlG9byeSwfygdiRQUGCVqDf2DCx0oOvDqYY7/aP7pmCaYs7B6QiJZRe
 MrDiXDdo9LSRZneq5+cTSXyNX2vzznxhGxOGH82DB9DbhRXtJHKzjflpGng2/ZvnO4cA
 /R9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=q0ObOxK2MiZq3VBWDXHBVl7juOt1W6dENpR2gzKgWb4=;
 b=4eMewhFLys2pT9yl091JBT7waMWVodaqxmE/vWOK/tzRj92MhtkkbMKw8Fw6ZatGJE
 m7b4+flkDuQfUlNyqOW055m+Mkg+ruvZCih9jSXDLrGx7wXU7xEm9JjmTUkWqIpCwlj2
 2JL7/iCTbrP4Z4SBMnZwU33DyYcZiWJEd099b/fROWo2i7e4u9d8A+GI6gPudYULuZCh
 50Z0u4Q1p1xU/I+ZpV9UzPjcGrXI5vMD7G2QAOcgM8SsRANvWHraFC33TJ8gR0HJ2lvQ
 MRQv+qBil3nMl3tf4DCI2m/+GECYUlUXE503S6JXNZvwrcsmI2QfnFaBONTRrq6SVdoi
 EI+Q==
X-Gm-Message-State: ACgBeo37BmovkLzqD8G7YwkHTBaO+5KZyVA80jJwLqWfTpydigVWisw5
 CupuUSc9QgJBmegOfmKVE8rVgTY5ASuH5w==
X-Google-Smtp-Source: AA6agR7iiDrMQgdRaDuH4yOe1Cl6O5lLiA7s6ZOFE/ClkYjvaSwkUh3iXSq3ccjbtJqzKLiQ+2TNUg==
X-Received: by 2002:a65:6052:0:b0:429:9cea:dcd8 with SMTP id
 a18-20020a656052000000b004299ceadcd8mr15651070pgp.461.1661159130404; 
 Mon, 22 Aug 2022 02:05:30 -0700 (PDT)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([116.73.134.198])
 by smtp.googlemail.com with ESMTPSA id
 n34-20020a635c62000000b0041c3ab14ca1sm7015428pgm.0.2022.08.22.02.05.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 02:05:29 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
To: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Cc: yvugenfi@redhat.com, jusual@redhat.com, kkostiuk@redhat.com,
 ybendito@redhat.com
Subject: [PATCH 4/4] tests/acpi/bios-tables-test: update DSDT and DMAR table
 blobs
Date: Mon, 22 Aug 2022 14:34:38 +0530
Message-Id: <20220822090438.426748-6-ani@anisinha.ca>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220822090438.426748-1-ani@anisinha.ca>
References: <20220822090438.426748-1-ani@anisinha.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::42e;
 envelope-from=ani@anisinha.ca; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, LOTS_OF_MONEY=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
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

Changes include explicit addition of pcie root ports in the ATS capability
reporting structure and addition of a single pcie root port device in the DMAR
bios table tests.

The following DSDT and DMAR table changes happen as a result of the above
changes:

DMAR:

 [000h 0000   4]                    Signature : "DMAR"    [DMA Remapping table]
-[004h 0004   4]                 Table Length : 00000078
+[004h 0004   4]                 Table Length : 00000088
 [008h 0008   1]                     Revision : 01
-[009h 0009   1]                     Checksum : 15
+[009h 0009   1]                     Checksum : DE
 [00Ah 0010   6]                       Oem ID : "BOCHS "
 [010h 0016   8]                 Oem Table ID : "BXPC    "
 [018h 0024   4]                 Oem Revision : 00000001
 [01Ch 0028   4]              Asl Compiler ID : "BXPC"
 [020h 0032   4]        Asl Compiler Revision : 00000001

 [024h 0036   1]           Host Address Width : 26
 [025h 0037   1]                        Flags : 01
 [026h 0038  10]                     Reserved : 00 00 00 00 00 00 00 00 00 00

 [030h 0048   2]                Subtable Type : 0000 [Hardware Unit Definition]
-[032h 0050   2]                       Length : 0040
+[032h 0050   2]                       Length : 0048

 [034h 0052   1]                        Flags : 00
 [035h 0053   1]                     Reserved : 00
 [036h 0054   2]           PCI Segment Number : 0000
 [038h 0056   8]        Register Base Address : 00000000FED90000

 [040h 0064   1]            Device Scope Type : 03 [IOAPIC Device]
 [041h 0065   1]                 Entry Length : 08
 [042h 0066   2]                     Reserved : 0000
 [044h 0068   1]               Enumeration ID : 00
 [045h 0069   1]               PCI Bus Number : FF

 [046h 0070   2]                     PCI Path : 00,00

 [048h 0072   1]            Device Scope Type : 01 [PCI Endpoint Device]
@@ -46,60 +46,79 @@
 [04Ah 0074   2]                     Reserved : 0000
 [04Ch 0076   1]               Enumeration ID : 00
 [04Dh 0077   1]               PCI Bus Number : 00

 [04Eh 0078   2]                     PCI Path : 00,00

 [050h 0080   1]            Device Scope Type : 01 [PCI Endpoint Device]
 [051h 0081   1]                 Entry Length : 08
 [052h 0082   2]                     Reserved : 0000
 [054h 0084   1]               Enumeration ID : 00
 [055h 0085   1]               PCI Bus Number : 00

 [056h 0086   2]                     PCI Path : 01,00

-[058h 0088   1]            Device Scope Type : 01 [PCI Endpoint Device]
+[058h 0088   1]            Device Scope Type : 02 [PCI Bridge Device]
 [059h 0089   1]                 Entry Length : 08
 [05Ah 0090   2]                     Reserved : 0000
 [05Ch 0092   1]               Enumeration ID : 00
 [05Dh 0093   1]               PCI Bus Number : 00

-[05Eh 0094   2]                     PCI Path : 1F,00
+[05Eh 0094   2]                     PCI Path : 02,00

 [060h 0096   1]            Device Scope Type : 01 [PCI Endpoint Device]
 [061h 0097   1]                 Entry Length : 08
 [062h 0098   2]                     Reserved : 0000
 [064h 0100   1]               Enumeration ID : 00
 [065h 0101   1]               PCI Bus Number : 00

-[066h 0102   2]                     PCI Path : 1F,02
+[066h 0102   2]                     PCI Path : 1F,00

 [068h 0104   1]            Device Scope Type : 01 [PCI Endpoint Device]
 [069h 0105   1]                 Entry Length : 08
 [06Ah 0106   2]                     Reserved : 0000
 [06Ch 0108   1]               Enumeration ID : 00
 [06Dh 0109   1]               PCI Bus Number : 00

-[06Eh 0110   2]                     PCI Path : 1F,03
+[06Eh 0110   2]                     PCI Path : 1F,02

-[070h 0112   2]                Subtable Type : 0002 [Root Port ATS Capability]
-[072h 0114   2]                       Length : 0008
+[070h 0112   1]            Device Scope Type : 01 [PCI Endpoint Device]
+[071h 0113   1]                 Entry Length : 08
+[072h 0114   2]                     Reserved : 0000
+[074h 0116   1]               Enumeration ID : 00
+[075h 0117   1]               PCI Bus Number : 00

-[074h 0116   1]                        Flags : 01
-[075h 0117   1]                     Reserved : 00
-[076h 0118   2]           PCI Segment Number : 0000
+[076h 0118   2]                     PCI Path : 1F,03

-Raw Table Data: Length 120 (0x78)

-    0000: 44 4D 41 52 78 00 00 00 01 15 42 4F 43 48 53 20  // DMARx.....BOCHS
+[078h 0120   2]                Subtable Type : 0002 [Root Port ATS Capability]
+[07Ah 0122   2]                       Length : 0010
+
+[07Ch 0124   1]                        Flags : 00
+[07Dh 0125   1]                     Reserved : 00
+[07Eh 0126   2]           PCI Segment Number : 0000
+
+[080h 0128   1]            Device Scope Type : 02 [PCI Bridge Device]
+[081h 0129   1]                 Entry Length : 08
+[082h 0130   2]                     Reserved : 0000
+[084h 0132   1]               Enumeration ID : 00
+[085h 0133   1]               PCI Bus Number : 00
+
+[086h 0134   2]                     PCI Path : 02,00
+

DSDT:

 DefinitionBlock ("", "DSDT", 1, "BOCHS ", "BXPC    ", 0x00000001)
 {
     Scope (\)
     {
         OperationRegion (DBG, SystemIO, 0x0402, One)
         Field (DBG, ByteAcc, NoLock, Preserve)
         {
             DBGB,   8
         }

@@ -3261,23 +3261,59 @@
                 Method (_S1D, 0, NotSerialized)  // _S1D: S1 Device State
                 {
                     Return (Zero)
                 }

                 Method (_S2D, 0, NotSerialized)  // _S2D: S2 Device State
                 {
                     Return (Zero)
                 }

                 Method (_S3D, 0, NotSerialized)  // _S3D: S3 Device State
                 {
                     Return (Zero)
                 }
             }

+            Device (S10)
+            {
+                Name (_ADR, 0x00020000)  // _ADR: Address
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
+                Method (DVNT, 2, NotSerialized)
+                {
+                    If ((Arg0 & One))
+                    {
+                        Notify (S00, Arg1)
+                    }
+                }
+
+                Method (PCNT, 0, NotSerialized)
+                {
+                    BNUM = Zero
+                    DVNT (PCIU, One)
+                    DVNT (PCID, 0x03)
+                }
+            }
+
             Method (PCNT, 0, NotSerialized)
             {
+                ^S10.PCNT ()
             }
         }
     }
 }

Signed-off-by: Ani Sinha <ani@anisinha.ca>
---
 tests/data/acpi/q35/DMAR.dmar               | Bin 120 -> 136 bytes
 tests/data/acpi/q35/DSDT.dmar               | Bin 0 -> 8421 bytes
 tests/qtest/bios-tables-test-allowed-diff.h |   2 --
 3 files changed, 2 deletions(-)

diff --git a/tests/data/acpi/q35/DMAR.dmar b/tests/data/acpi/q35/DMAR.dmar
index 0dca6e68ad8a8ca5b981bcfbc745385a63e9f216..1c1a935ddab174059b8570f67f3b4cfbe3df2193 100644
GIT binary patch
delta 71
zcmb>EVB~V~bqwlYU|?XpH<3$&(PN^qssR%Rkk7!xzzC-0VKftz&&<Ri08+pJQwIQR
CE(T)&

delta 32
mcmeBRtl)C-bquOtU|?VroyeuZ=rGY(bz*`P8wUd;Pz(TZ`US-R

diff --git a/tests/data/acpi/q35/DSDT.dmar b/tests/data/acpi/q35/DSDT.dmar
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..a1f0285904f62c0de437fbbae5a7bccbdd6c669a 100644
GIT binary patch
literal 8421
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

literal 0
HcmV?d00001

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index 4efed12b59..dfb8523c8b 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,3 +1 @@
 /* List of comma-separated changed AML files to ignore */
-"tests/data/acpi/q35/DSDT.dmar",
-"tests/data/acpi/q35/DMAR.dmar",
-- 
2.25.1


