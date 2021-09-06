Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD5C0401923
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Sep 2021 11:47:27 +0200 (CEST)
Received: from localhost ([::1]:44680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNBDp-0007XH-Nw
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 05:47:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mNB6H-00075n-Li
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 05:39:38 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:39866)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mNB6D-0001rS-ID
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 05:39:37 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 mj9-20020a17090b368900b001965618d019so3933099pjb.4
 for <qemu-devel@nongnu.org>; Mon, 06 Sep 2021 02:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IoCWghIjlelodCaBa4rFFT6aagv03YrabtxZqEa5v7o=;
 b=ZgPkW8FZeYGWTOVF/yjbNh8vzn+Vt8y/M8UPjJvmg01sTn/fjiBvJ7MccGSFGDk3/d
 pJ3bogKs5MulLhspAqtd8tOjab4JlDNFOaFnra49R2siNnF4X8CYUNxoCQBHLb2fXE/I
 rogNP8VWurRxvcIVc6+paf+KKxqWLl6P4UaV38i/+9XJlIxp/D6fjdStGI+sWptfSMWl
 TNB7zWCtT5izoPLTlCN0iBnSA1NXiVO0PUB9uv6Og1OUR+tcI2gKIDjSDPnx7FehgzMW
 i/BADZQO7oAcZg+cPI0uepB0YOjfnrrEfPQ8h701HTSxj1yPjDXCS9YO60X80eBc8pew
 oQCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IoCWghIjlelodCaBa4rFFT6aagv03YrabtxZqEa5v7o=;
 b=ErvoCUy7+2emrHquhTCSMQB0wHJ5NYOCokeUPpPcgz0XSM5+mixUI7CdLKv7cRmVT3
 p1CSZec+Np0QpCJmdZJ+/Bl+jlLP/LBFPslxpB3WJiVdwUgyd0wSZ7y+8X4zfWWi3Lk8
 arR13fnC8agyfxQIBR4V9D1Adz9KW1W/SzO4EhH/Ofh+gzWSyr+yakupKqxk0uffqJXg
 7vqoV0FQwFFkqSERH5ay5+fOcqvGSbeY0030sO+brtJ8ODsMOEwaA/WQ6zofOFSiuR7i
 rJJdVM48vK+MdBvbwYF6Dc6TgOl9L51rtgF9IfKJDlqfsQqpT8ZuUlz6h4qkXJjiRHK/
 +S5w==
X-Gm-Message-State: AOAM531IvlvNgNWYEJaWw2sLjIid15qfSOblAB3xh4NXpAJmiM6u4cZu
 lwLwflY8vZp7lveHd18oOlJQkuMe5MjW3Q==
X-Google-Smtp-Source: ABdhPJy8de+2lT5NDtm9kuzOVwJACYNpwQmc97FY4U//2IEzFY9FEsVsX3n/wAZJzxGKaF73zJTdYA==
X-Received: by 2002:a17:90a:4093:: with SMTP id
 l19mr12952389pjg.118.1630921170627; 
 Mon, 06 Sep 2021 02:39:30 -0700 (PDT)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([115.96.142.175])
 by smtp.googlemail.com with ESMTPSA id
 z131sm7111183pfc.159.2021.09.06.02.39.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Sep 2021 02:39:30 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/3] tests/acpi: add DSDT binary blob for the unit test added
 in the previous commit
Date: Mon,  6 Sep 2021 15:09:11 +0530
Message-Id: <20210906093911.2069140-4-ani@anisinha.ca>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210906093911.2069140-1-ani@anisinha.ca>
References: <20210906093911.2069140-1-ani@anisinha.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::102a;
 envelope-from=ani@anisinha.ca; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, LOTS_OF_MONEY=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Ani Sinha <ani@anisinha.ca>, Igor Mammedov <imammedo@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

change 7feffbbf45 ("tests/acpi/pcihp: add unit tests for hotplug on multifunction bridges for q35")
adds a new unit test to exercize multifunction bridge support in ACPI for q35.
This change adds the ACPI DSDT table blob for this unit test. The changes that
this unit test brings to the DSDT table is outlined in the following diff:

@@ -1,30 +1,30 @@
 /*
  * Intel ACPI Component Architecture
  * AML/ASL+ Disassembler version 20190509 (64-bit version)
  * Copyright (c) 2000 - 2019 Intel Corporation
  *
  * Disassembling to symbolic ASL+ operators
  *
- * Disassembly of tests/data/acpi/q35/DSDT, Mon Sep  6 13:29:23 2021
+ * Disassembly of /tmp/aml-GFM480, Mon Sep  6 13:29:23 2021
  *
  * Original Table Header:
  *     Signature        "DSDT"
- *     Length           0x00002061 (8289)
+ *     Length           0x000020F3 (8435)
  *     Revision         0x01 **** 32-bit table (V1), no 64-bit math support
- *     Checksum         0xE5
+ *     Checksum         0x1B
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

@@ -171,68 +171,32 @@
                 IRQNoFlags ()
                     {1}
             })
         }

         Device (MOU)
         {
             Name (_HID, EisaId ("PNP0F13") /* PS/2 Mouse */)  // _HID: Hardware ID
             Name (_STA, 0x0F)  // _STA: Status
             Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
             {
                 IRQNoFlags ()
                     {12}
             })
         }

-        Device (LPT1)
-        {
-            Name (_HID, EisaId ("PNP0400") /* Standard LPT Parallel Port */)  // _HID: Hardware ID
-            Name (_UID, One)  // _UID: Unique ID
-            Name (_STA, 0x0F)  // _STA: Status
-            Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
-            {
-                IO (Decode16,
-                    0x0378,             // Range Minimum
-                    0x0378,             // Range Maximum
-                    0x08,               // Alignment
-                    0x08,               // Length
-                    )
-                IRQNoFlags ()
-                    {7}
-            })
-        }
-
-        Device (COM1)
-        {
-            Name (_HID, EisaId ("PNP0501") /* 16550A-compatible COM Serial Port */)  // _HID: Hardware ID
-            Name (_UID, One)  // _UID: Unique ID
-            Name (_STA, 0x0F)  // _STA: Status
-            Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
-            {
-                IO (Decode16,
-                    0x03F8,             // Range Minimum
-                    0x03F8,             // Range Maximum
-                    0x00,               // Alignment
-                    0x08,               // Length
-                    )
-                IRQNoFlags ()
-                    {4}
-            })
-        }
-
         Device (RTC)
         {
             Name (_HID, EisaId ("PNP0B00") /* AT Real-Time Clock */)  // _HID: Hardware ID
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
@@ -3249,39 +3213,92 @@
             })
         }
     }

     Scope (\_SB)
     {
         Scope (PCI0)
         {
             Device (S00)
             {
                 Name (_ADR, Zero)  // _ADR: Address
             }

             Device (S08)
             {
                 Name (_ADR, 0x00010000)  // _ADR: Address
-                Method (_S1D, 0, NotSerialized)  // _S1D: S1 Device State
+                Name (BSEL, One)
+                Device (S00)
                 {
-                    Return (Zero)
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
                 }

-                Method (_S2D, 0, NotSerialized)  // _S2D: S2 Device State
+                Method (DVNT, 2, NotSerialized)
                 {
-                    Return (Zero)
+                    If ((Arg0 & One))
+                    {
+                        Notify (S00, Arg1)
+                    }
                 }

-                Method (_S3D, 0, NotSerialized)  // _S3D: S3 Device State
+                Method (PCNT, 0, NotSerialized)
                 {
-                    Return (Zero)
+                    BNUM = One
+                    DVNT (PCIU, One)
+                    DVNT (PCID, 0x03)
+                }
+            }
+
+            Device (S09)
+            {
+                Name (_ADR, 0x00010001)  // _ADR: Address
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
                 }
             }

             Method (PCNT, 0, NotSerialized)
             {
+                ^S09.PCNT ()
+                ^S08.PCNT ()
             }
         }
     }
 }

Signed-off-by: Ani Sinha <ani@anisinha.ca>
---
 tests/data/acpi/q35/DSDT.multi-bridge       | Bin 0 -> 8435 bytes
 tests/qtest/bios-tables-test-allowed-diff.h |   1 -
 2 files changed, 1 deletion(-)

diff --git a/tests/data/acpi/q35/DSDT.multi-bridge b/tests/data/acpi/q35/DSDT.multi-bridge
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..a6565acc5cc390826f4ac23585912f9cf1d9acb9 100644
GIT binary patch
literal 8435
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

literal 0
HcmV?d00001

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dabc024f53..dfb8523c8b 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,2 +1 @@
 /* List of comma-separated changed AML files to ignore */
-"tests/data/acpi/q35/DSDT.multi-bridge",
-- 
2.25.1


