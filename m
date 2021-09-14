Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5BDE40A5AD
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 06:58:31 +0200 (CEST)
Received: from localhost ([::1]:55740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ0Wc-0006Hs-QN
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 00:58:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mQ0Sw-0000uD-Mo
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 00:54:42 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:41645)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mQ0St-0006gB-0z
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 00:54:42 -0400
Received: by mail-pl1-x636.google.com with SMTP id v2so3447024plp.8
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 21:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3WaRS1m2WqhVjPlU6yS10/4QrF9NPERLHlPcVVLCzXo=;
 b=uLZeYHiGX7JeRSzzgBJLGyJha+xV3t53qo8ME777RqyhhrPqwngHWsdo2mEGymfAoZ
 bAGLeRVBCnHUgZipvBCF83ztA4VHFIxllEtmh3FFzN1gXPfu33GGLYg6fw1uWr8xlMLr
 lXxNNTU8t0X6vv63K6/8Qjspzk0Qo51zUuE5X6q8H+DE7xgwOCMNPoJKI9wS8ilYjfpN
 iSCQbBWqrJno1V6uqq6MzSt7o2i+nYowgYRfq0J9p2rbtpmMgNA2Tzjl6GkVaWSrcrZw
 t3kSuoJ7mW43P9xlvY5bJWCglVzJYDj4tuk4MawBBrxD9eWNooSaGczSXYBKJvliBf89
 YH1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3WaRS1m2WqhVjPlU6yS10/4QrF9NPERLHlPcVVLCzXo=;
 b=2ICXpI7g8K5EZ3M8lC+kiaUOuX2SdHFSYwZWCnDWp2JT0fLCWKwrIQgLtk6/2FBy6/
 9Do02jKZevLsfUAnX1u/yYsuQ9U33KQCER7lXrHC7/Ba7rXFa/ztFJWCLP4X3Val/2Ue
 hYKBUyrfDreA7WVd8NAxm9ZN3nijjNCTRMhkmyHPG/oH1hW43UV9r7KMvgXkYqONPv0A
 sogip1Aw1RxS2xN+obPJZakzWudQlqj/LqMuaGaaHHkv94iH/i8bxkuTU0Ab0aSFhejO
 r54wAxU7k7vCTSURX8nGhDD+ZOIExHXWLpR2ptNpEpTjFtsM14EFwcWsZ+MDROFoJ8GW
 wDdw==
X-Gm-Message-State: AOAM533+OLPX8Fe1pykVwlzaa0XMVv46cp2niYiMN6+pHoPKBTZiRgnh
 DbXUXLfERJs3TArB7KbM4/C6o9mA8YB4mA==
X-Google-Smtp-Source: ABdhPJwwkVv/Ndyo5fPPvq2QapvbVyFSMBmm7BkGpd2A9bB5XLPb4i925sgmsu7eGixRk9Q+mhGMXw==
X-Received: by 2002:a17:90a:5583:: with SMTP id
 c3mr3317041pji.133.1631595277465; 
 Mon, 13 Sep 2021 21:54:37 -0700 (PDT)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([203.163.239.215])
 by smtp.googlemail.com with ESMTPSA id u24sm9262522pfm.27.2021.09.13.21.54.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 21:54:37 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/3] bios-tables-test: Update ACPI DSDT table golden blobs for
 q35
Date: Tue, 14 Sep 2021 10:24:10 +0530
Message-Id: <20210914045410.3380946-4-ani@anisinha.ca>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210914045410.3380946-1-ani@anisinha.ca>
References: <20210914045410.3380946-1-ani@anisinha.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::636;
 envelope-from=ani@anisinha.ca; helo=mail-pl1-x636.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, jusual@redhat.com,
 Ani Sinha <ani@anisinha.ca>, Igor Mammedov <imammedo@redhat.com>,
 philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We have modified the IO address range for ACPI pci hotplug in q35. See change:

36f98d0d4f ("hw/i386/acpi: fix conflicting IO address range for acpi pci hotplug in q35")

The ACPI DSDT table golden blobs must be regenrated in order to make the unit tests
pass. This change updates the golden ACPI DSDT table blobs.

Following is the ASL diff between the blobs:

@@ -1,30 +1,30 @@
 /*
  * Intel ACPI Component Architecture
  * AML/ASL+ Disassembler version 20190509 (64-bit version)
  * Copyright (c) 2000 - 2019 Intel Corporation
  *
  * Disassembling to symbolic ASL+ operators
  *
- * Disassembly of tests/data/acpi/q35/DSDT, Tue Sep 14 09:04:06 2021
+ * Disassembly of /tmp/aml-52DP90, Tue Sep 14 09:04:06 2021
  *
  * Original Table Header:
  *     Signature        "DSDT"
  *     Length           0x00002061 (8289)
  *     Revision         0x01 **** 32-bit table (V1), no 64-bit math support
- *     Checksum         0xE5
+ *     Checksum         0xF9
  *     OEM ID           "BOCHS "
  *     OEM Table ID     "BXPC    "
  *     OEM Revision     0x00000001 (1)
  *     Compiler ID      "BXPC"
  *     Compiler Version 0x00000001 (1)
  */
 DefinitionBlock ("", "DSDT", 1, "BOCHS ", "BXPC    ", 0x00000001)
 {
     Scope (\)
     {
         OperationRegion (DBG, SystemIO, 0x0402, One)
         Field (DBG, ByteAcc, NoLock, Preserve)
         {
             DBGB,   8
         }

@@ -226,46 +226,46 @@
             Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
             {
                 IO (Decode16,
                     0x0070,             // Range Minimum
                     0x0070,             // Range Maximum
                     0x01,               // Alignment
                     0x08,               // Length
                     )
                 IRQNoFlags ()
                     {8}
             })
         }
     }

     Scope (_SB.PCI0)
     {
-        OperationRegion (PCST, SystemIO, 0x0CC4, 0x08)
+        OperationRegion (PCST, SystemIO, 0x0CC0, 0x08)
         Field (PCST, DWordAcc, NoLock, WriteAsZeros)
         {
             PCIU,   32,
             PCID,   32
         }

-        OperationRegion (SEJ, SystemIO, 0x0CCC, 0x04)
+        OperationRegion (SEJ, SystemIO, 0x0CC8, 0x04)
         Field (SEJ, DWordAcc, NoLock, WriteAsZeros)
         {
             B0EJ,   32
         }

-        OperationRegion (BNMR, SystemIO, 0x0CD4, 0x08)
+        OperationRegion (BNMR, SystemIO, 0x0CD0, 0x08)
         Field (BNMR, DWordAcc, NoLock, WriteAsZeros)
         {
             BNUM,   32,
             PIDX,   32
         }

         Mutex (BLCK, 0x00)
         Method (PCEJ, 2, NotSerialized)
         {
             Acquire (BLCK, 0xFFFF)
             BNUM = Arg0
             B0EJ = (One << Arg1)
             Release (BLCK)
             Return (Zero)
         }

@@ -3185,34 +3185,34 @@
                     0x0620,             // Range Minimum
                     0x0620,             // Range Maximum
                     0x01,               // Alignment
                     0x10,               // Length
                     )
             })
         }

         Device (PHPR)
         {
             Name (_HID, "PNP0A06" /* Generic Container Device */)  // _HID: Hardware ID
             Name (_UID, "PCI Hotplug resources")  // _UID: Unique ID
             Name (_STA, 0x0B)  // _STA: Status
             Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
             {
                 IO (Decode16,
-                    0x0CC4,             // Range Minimum
-                    0x0CC4,             // Range Maximum
+                    0x0CC0,             // Range Minimum
+                    0x0CC0,             // Range Maximum
                     0x01,               // Alignment
                     0x18,               // Length
                     )
             })
         }
     }

     Scope (\)
     {
         Name (_S3, Package (0x04)  // _S3_: S3 System State
         {
             One,
             One,
             Zero,
             Zero
         })

Signed-off-by: Ani Sinha <ani@anisinha.ca>
---
 tests/data/acpi/q35/DSDT                    | Bin 8289 -> 8289 bytes
 tests/data/acpi/q35/DSDT.acpihmat           | Bin 9614 -> 9614 bytes
 tests/data/acpi/q35/DSDT.bridge             | Bin 11003 -> 11003 bytes
 tests/data/acpi/q35/DSDT.cphp               | Bin 8753 -> 8753 bytes
 tests/data/acpi/q35/DSDT.dimmpxm            | Bin 9943 -> 9943 bytes
 tests/data/acpi/q35/DSDT.ipmibt             | Bin 8364 -> 8364 bytes
 tests/data/acpi/q35/DSDT.memhp              | Bin 9648 -> 9648 bytes
 tests/data/acpi/q35/DSDT.mmio64             | Bin 9419 -> 9419 bytes
 tests/data/acpi/q35/DSDT.nohpet             | Bin 8147 -> 8147 bytes
 tests/data/acpi/q35/DSDT.numamem            | Bin 8295 -> 8295 bytes
 tests/data/acpi/q35/DSDT.tis                | Bin 8894 -> 8894 bytes
 tests/qtest/bios-tables-test-allowed-diff.h |  11 -----------
 12 files changed, 11 deletions(-)

diff --git a/tests/data/acpi/q35/DSDT b/tests/data/acpi/q35/DSDT
index 842533f53e6db40935c3cdecd1d182edba6c17d4..281fc82c03b2562d2e6b7caec0d817b034a47138 100644
GIT binary patch
delta 65
zcmaFp@X&$FCD<h-QGtPh@#jV^erCo4lckttrB3j0u|zj=2fKR3J3AS;dMQLVIQjVo
VF>+tn9LO9j!+e0}z~trfy8v~b6W9O%

delta 65
zcmaFp@X&$FCD<h-QGtPh@##h`erCoalckttrOxnhu|zj=2fKR3J3AS;dMQLVIQjVo
VF>+to9LO9j!+eD2$mHeny8v@q6W9O%

diff --git a/tests/data/acpi/q35/DSDT.acpihmat b/tests/data/acpi/q35/DSDT.acpihmat
index 8d00f2ea0dd78f962e136273d68cb0c568e43c27..8c1e05a11a328ec1cc6f86e36e52c28f41f9744e 100644
GIT binary patch
delta 65
zcmeD4?(^ny33dtTQ)OUa+_sU6pPBK%WGQA@sS`Y0EYXeJ!LDBM&Q1odUJB6-PJX^Y
VjNBJC2QoJ(G9TbMF!_qgE&x%Q6Po}4

delta 65
zcmeD4?(^ny33dtTQ)OUaT(pskpPBK<WGQA@sWUuWEYXeJ!LDBM&Q1odUJB6-PJX^Y
VjNDf?2QoJ(G9TeNGWm+iE&xwf6Po}4

diff --git a/tests/data/acpi/q35/DSDT.bridge b/tests/data/acpi/q35/DSDT.bridge
index 55ad4bd7ab4759d68031b2f1d0307355a7332fe7..6f1464b6c712d7f33cb4b891b7ce76fe228f44c9 100644
GIT binary patch
delta 66
zcmewz`a6`%CD<k8w-y5fBlAWserCo4lckttrB3j0u|zj=2fKR3J3AS;dMQLVIQjVo
WF>+tn9LO9j!+e0}z~<%hA>06yixa5;

delta 66
zcmewz`a6`%CD<k8w-y5f<NJ+V{LG9;CQC8PN}b{1Vu^0#4tDj5cXl#x^-_p#aPspF
WV&uNEIgmM6hWQB3k<H8HL%0FOM--_5

diff --git a/tests/data/acpi/q35/DSDT.cphp b/tests/data/acpi/q35/DSDT.cphp
index ccde2add9f87db0c0eaf0cc155717d5744e4ef40..f8337ff5191a37a47dcf7c09a6c39c4e704a15bf 100644
GIT binary patch
delta 65
zcmdn!veAXhCD<jzP>F$oF?J&tKQrTj$x_U+QYU!0SfU%bgI&Giot+F^y%eGwocw%)
V7`ZQO4rErAV?MxhU~;+QE&wzZ5?TNN

delta 65
zcmdn!veAXhCD<jzP>F$o(Q_jgKQrTz$x_U+QfGL$SfU%bgI&Giot+F^y%eGwocw%)
V7`d-(4rErAV?M%jWOBLUE&wso5?TNN

diff --git a/tests/data/acpi/q35/DSDT.dimmpxm b/tests/data/acpi/q35/DSDT.dimmpxm
index b062e30117f955c7a2ac9629a0512324bbd28bf2..fe5820d93d057ef09a001662369b15afbc5b87e2 100644
GIT binary patch
delta 65
zcmccad)=4ICD<k8x*7umqx(iKerCo4lckttrB3j0u|zj=2fKR3J3AS;dMQLVIQjVo
VF>+tn9LRi9iTMD}fyuIJy8v<O6QKYA

delta 65
zcmccad)=4ICD<k8x*7umqwz*AerCoalckttrOxnhu|zj=2fKR3J3AS;dMQLVIQjVo
VF>+to9LRi9iTMc6k;$@Zy8v&d6QKYA

diff --git a/tests/data/acpi/q35/DSDT.ipmibt b/tests/data/acpi/q35/DSDT.ipmibt
index 1c5737692f56fc678e685a4ad0bb1df38d487a14..631741065860fd5036aa303904dabd1d2839f9c6 100644
GIT binary patch
delta 89
zcmZ4ExW<voCD<iojRFG$qwYqoC}xWTJX{>njRFDA!6D88&YqzPK*B{Kx*^!rE1r@2
p1P>QWbR##2<LqSM>IIZ=^79R1<i4<Z4s);!^8ua%lRwGt0sv3%8ejkb

delta 89
zcmZ4ExW<voCD<iojRFG$qvS@eC}xWzJX{>njRFDA!6D88&YqzPK*B{Kx*^!rE1r@2
p3=bDebR##2<LqSM>IIZ=^79R1<i4_b4s);!^AVmSlRwGt0su@a8ejkb

diff --git a/tests/data/acpi/q35/DSDT.memhp b/tests/data/acpi/q35/DSDT.memhp
index 7b6f6487b229cac3424a5215c8f1755c0c85310c..9bc11518fc57687ca789dc70793b48b29a0d74ed 100644
GIT binary patch
delta 65
zcmV-H0KWgQOR!4{L{mgmuq6Nh0qd~}4+8<flNtjZ8psR^1Y3a%Q$<Q&Lqae`N+4T+
XLQYLm0SnNxQ3IkO1HcTxllCOKc2g93

delta 65
zcmV-H0KWgQOR!4{L{mgmuq6Nh0oSn#4+8<jlNtjZ8q5p|1Y3a%Q$<Q&Lqae`N+4T+
XLQYLm0SnZ#Q3IkO1H=r(llCOKbPp7I

diff --git a/tests/data/acpi/q35/DSDT.mmio64 b/tests/data/acpi/q35/DSDT.mmio64
index 2e0a772a85275c9c3b4c9317d98cc7c3d27417f3..713288a12ef2b70a20b4e8836c036ba4db3a57a8 100644
GIT binary patch
delta 64
zcmV-G0KfmsNy|wJL{mgm%On5*0jIGF4+8<flNtjZ8psR^1Y3a%Q$<Q&Lqae`N+4T+
WLQYLm0SnNxQ3I?X1HcTxk|fJz%oC*m

delta 64
zcmV-G0KfmsNy|wJL{mgm%On5*0h6%`4+8<jlNtjZ8q5p|1Y3a%Q$<Q&Lqae`N+4T+
WLQYLm0SnZ#Q3I?X1H=r(k|fJxh!dp%

diff --git a/tests/data/acpi/q35/DSDT.nohpet b/tests/data/acpi/q35/DSDT.nohpet
index ceb61f4115c2ccf4bcbb0d529551236933ecee15..e8202e6ddfbe96071f32f1ec05758f650569943e 100644
GIT binary patch
delta 65
zcmV-H0KWgzKhr-7L{mgm(;ol;0mHEhfdT=*lZ*l#8psR^1Y3a%Q$<Q&Lqae`N+4T+
XLQYLm0SnNx!va$r1HcTxlNlenr{@&9

delta 65
zcmV-H0KWgzKhr-7L{mgm(;ol;0k5$NfdT=<lZ*l#8q5p|1Y3a%Q$<Q&Lqae`N+4T+
XLQYLm0SnZ#!va$r1H=r(lNlenrK1$O

diff --git a/tests/data/acpi/q35/DSDT.numamem b/tests/data/acpi/q35/DSDT.numamem
index a3f846df541a70ce0730d0351954b78818bbcdd0..151e7cf42953f3f5fe61ff0140ab7b976fe9e5b8 100644
GIT binary patch
delta 65
zcmaFv@Z5pRCD<h-U4emtaq&hjerCo4lckttrB3j0u|zj=2fKR3J3AS;dMQLVIQjVo
VF>+tn9LO9g!+e0}z~r^^y8vk#6QBS9

delta 65
zcmaFv@Z5pRCD<h-U4emtv40~MKQrTz$x_U+QfGL$SfU%bgI&Giot+F^y%eGwocw%)
V7`d-(4rGp$VLrlhWb#`1T>xg*6QBS9

diff --git a/tests/data/acpi/q35/DSDT.tis b/tests/data/acpi/q35/DSDT.tis
index d1433e3c14570bbd17b029a9aec6bc53134c3b7d..c92d4d29c79352a60974ea9f665d0b9a410a4bac 100644
GIT binary patch
delta 66
zcmdnzy3du%CD<iopArKD<HL<y{LG98CQC8PN}b^0Vu^0#4tDj5cXl#x^-_p#aPspF
WV&uNCIgmMChWP-`fz6xcxtRfqZWC_+

delta 66
zcmdnzy3du%CD<iopArKD<JpZ|{LG9;CQC8PN}b{1Vu^0#4tDj5cXl#x^-_p#aPspF
WV&uNEIgmMChWQB3k<FXsxtRfoDid!2

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index a02b88305c..dfb8523c8b 100644
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
-"tests/data/acpi/q35/DSDT.numamem",
-"tests/data/acpi/q35/DSDT.nohpet",
-"tests/data/acpi/q35/DSDT.dimmpxm",
-"tests/data/acpi/q35/DSDT.acpihmat",
-- 
2.25.1


