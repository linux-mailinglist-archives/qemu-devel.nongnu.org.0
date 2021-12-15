Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 376C947580C
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 12:43:09 +0100 (CET)
Received: from localhost ([::1]:36506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxSge-0004qS-BJ
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 06:43:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mxRik-0007RQ-Oe
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 05:41:14 -0500
Received: from [2a00:1450:4864:20::334] (port=46742
 helo=mail-wm1-x334.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mxRih-0000P3-FL
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 05:41:14 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 d198-20020a1c1dcf000000b0034569cdd2a2so705389wmd.5
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 02:41:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=gNzXUu0OrlHTO9BQfopM0W7JsU+2JwfO+ymcTMcHXMc=;
 b=co4L6APL2FYRDcppKfLhuribZ/QnCgv0mgiHk9BRqz7wcZVsmhnLTYHTxMzI7EGzVl
 WvvtDRmnWJc4PrWs2DJcI48VXtYOSysN523cpyFpHJ43rTdFdhH2EF/jMQdw7lZHsYs6
 GNR/chaGnSo6UNfmBy5oHNvM7zuwfiF03Q1CWbg1g1Hy4rNFDcZevYLCV0X0v0gNsxwy
 bIIrcaDA1Ngu5OEAuOWn6RucuzTLsXyHaoSJtzIIScsiyshPp2faxBUVccXoOpTThkg1
 gaXhN69+cumrUBvagHgsjFMQcm+Ry5d4QohHva2jAwBTgH2EeN34DuDQAGY5ukvdG/py
 gi1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gNzXUu0OrlHTO9BQfopM0W7JsU+2JwfO+ymcTMcHXMc=;
 b=DEV9bLTLfAZ0rwD3aiYcXmeBSfZ5rtZ0d52eH2XJr1irO7XxDc6Ia2vx7Esi/e6x48
 SYU2DeS4p03abzEeT+L6R0KainCM73sEMAIVpzXjEsUyExzgJW5I7iLdXNxaGMRlSTBW
 o0j+p+M1OP5aNFGQbQIfIPx8ESwj2CbWUT2jz4tG2To82gOQJM6xsukr5iBspoC5IoAu
 oAxZSYyXdYVZ4Eq+3o/T4FcWUjenNWalcq83OZTsXwVH+8k1F/KfwysSB0csi/7tJ1tc
 xBdWkbBGCQmmY9qyWx/8THA4jcgvTSH/UZkmXHffBHNpoknPNsphxwUTdPBPjBCq/qkG
 adnA==
X-Gm-Message-State: AOAM532BjQuyS/6uHyR3PUK1tRiV/JF7m5/C8nBfk2A/8ChfeLwb+Fcc
 Wlukxz4zPVHovKY40Fvo4QXjt1dwE1Ep8g==
X-Google-Smtp-Source: ABdhPJwqnt1a4TuKxMM2XeQwPEVR+aH+VXadBYO43eCUXT+auyIXIBNwPJ2c1pyoWPsZLw+v3IW0nQ==
X-Received: by 2002:a1c:1bd8:: with SMTP id b207mr4152526wmb.114.1639564868963; 
 Wed, 15 Dec 2021 02:41:08 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id e18sm1600815wrs.48.2021.12.15.02.41.08
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 02:41:08 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 32/33] tests/acpi: add expected blobs for VIOT test on q35
 machine
Date: Wed, 15 Dec 2021 10:40:48 +0000
Message-Id: <20211215104049.2030475-33-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211215104049.2030475-1-peter.maydell@linaro.org>
References: <20211215104049.2030475-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::334
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

From: Jean-Philippe Brucker <jean-philippe@linaro.org>

Add expected blobs of the VIOT and DSDT table for the VIOT test on the
q35 machine.

Since the test instantiates a virtio device and two PCIe expander
bridges, DSDT.viot has more blocks than the base DSDT.

The VIOT table generated for the q35 test is:

[000h 0000   4]                    Signature : "VIOT"    [Virtual I/O Translation Table]
[004h 0004   4]                 Table Length : 00000070
[008h 0008   1]                     Revision : 00
[009h 0009   1]                     Checksum : 3D
[00Ah 0010   6]                       Oem ID : "BOCHS "
[010h 0016   8]                 Oem Table ID : "BXPC    "
[018h 0024   4]                 Oem Revision : 00000001
[01Ch 0028   4]              Asl Compiler ID : "BXPC"
[020h 0032   4]        Asl Compiler Revision : 00000001

[024h 0036   2]                   Node count : 0003
[026h 0038   2]                  Node offset : 0030
[028h 0040   8]                     Reserved : 0000000000000000

[030h 0048   1]                         Type : 03 [VirtIO-PCI IOMMU]
[031h 0049   1]                     Reserved : 00
[032h 0050   2]                       Length : 0010

[034h 0052   2]                  PCI Segment : 0000
[036h 0054   2]               PCI BDF number : 0010
[038h 0056   8]                     Reserved : 0000000000000000

[040h 0064   1]                         Type : 01 [PCI Range]
[041h 0065   1]                     Reserved : 00
[042h 0066   2]                       Length : 0018

[044h 0068   4]               Endpoint start : 00003000
[048h 0072   2]            PCI Segment start : 0000
[04Ah 0074   2]              PCI Segment end : 0000
[04Ch 0076   2]                PCI BDF start : 3000
[04Eh 0078   2]                  PCI BDF end : 30FF
[050h 0080   2]                  Output node : 0030
[052h 0082   6]                     Reserved : 000000000000

[058h 0088   1]                         Type : 01 [PCI Range]
[059h 0089   1]                     Reserved : 00
[05Ah 0090   2]                       Length : 0018

[05Ch 0092   4]               Endpoint start : 00001000
[060h 0096   2]            PCI Segment start : 0000
[062h 0098   2]              PCI Segment end : 0000
[064h 0100   2]                PCI BDF start : 1000
[066h 0102   2]                  PCI BDF end : 10FF
[068h 0104   2]                  Output node : 0030
[06Ah 0106   6]                     Reserved : 000000000000

And the DSDT diff is:

@@ -5,13 +5,13 @@
  *
  * Disassembling to symbolic ASL+ operators
  *
- * Disassembly of tests/data/acpi/q35/DSDT, Fri Dec 10 15:03:08 2021
+ * Disassembly of /tmp/aml-H9Y5D1, Fri Dec 10 15:02:27 2021
  *
  * Original Table Header:
  *     Signature        "DSDT"
- *     Length           0x00002061 (8289)
+ *     Length           0x000024B6 (9398)
  *     Revision         0x01 **** 32-bit table (V1), no 64-bit math support
- *     Checksum         0xFA
+ *     Checksum         0xA7
  *     OEM ID           "BOCHS "
  *     OEM Table ID     "BXPC    "
  *     OEM Revision     0x00000001 (1)
@@ -3114,6 +3114,339 @@
         }
     }

+    Scope (\_SB)
+    {
+        Device (PC30)
+        {
+            Name (_UID, 0x30)  // _UID: Unique ID
+            Name (_BBN, 0x30)  // _BBN: BIOS Bus Number
+            Name (_HID, EisaId ("PNP0A08") /* PCI Express Bus */)  // _HID: Hardware ID
+            Name (_CID, EisaId ("PNP0A03") /* PCI Bus */)  // _CID: Compatible ID
+            Method (_OSC, 4, NotSerialized)  // _OSC: Operating System Capabilities
+            {
+                CreateDWordField (Arg3, Zero, CDW1)
+                If ((Arg0 == ToUUID ("33db4d5b-1ff7-401c-9657-7441c03dd766") /* PCI Host Bridge Device */))
+                {
+                    CreateDWordField (Arg3, 0x04, CDW2)
+                    CreateDWordField (Arg3, 0x08, CDW3)
+                    Local0 = CDW3 /* \_SB_.PC30._OSC.CDW3 */
+                    Local0 &= 0x1F
+                    If ((Arg1 != One))
+                    {
+                        CDW1 |= 0x08
+                    }
+
+                    If ((CDW3 != Local0))
+                    {
+                        CDW1 |= 0x10
+                    }
+
+                    CDW3 = Local0
+                }
+                Else
+                {
+                    CDW1 |= 0x04
+                }
+
+                Return (Arg3)
+            }
+
+            Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
+            {
+                Local0 = Package (0x80){}
+                Local1 = Zero
+                While ((Local1 < 0x80))
+                {
+                    Local2 = (Local1 >> 0x02)
+                    Local3 = ((Local1 + Local2) & 0x03)
+                    If ((Local3 == Zero))
+                    {
+                        Local4 = Package (0x04)
+                            {
+                                Zero,
+                                Zero,
+                                LNKD,
+                                Zero
+                            }
+                    }
+
+                    If ((Local3 == One))
+                    {
+                        Local4 = Package (0x04)
+                            {
+                                Zero,
+                                Zero,
+                                LNKA,
+                                Zero
+                            }
+                    }
+
+                    If ((Local3 == 0x02))
+                    {
+                        Local4 = Package (0x04)
+                            {
+                                Zero,
+                                Zero,
+                                LNKB,
+                                Zero
+                            }
+                    }
+
+                    If ((Local3 == 0x03))
+                    {
+                        Local4 = Package (0x04)
+                            {
+                                Zero,
+                                Zero,
+                                LNKC,
+                                Zero
+                            }
+                    }
+
+                    Local4 [Zero] = ((Local2 << 0x10) | 0xFFFF)
+                    Local4 [One] = (Local1 & 0x03)
+                    Local0 [Local1] = Local4
+                    Local1++
+                }
+
+                Return (Local0)
+            }
+
+            Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
+            {
+                WordBusNumber (ResourceProducer, MinFixed, MaxFixed, PosDecode,
+                    0x0000,             // Granularity
+                    0x0030,             // Range Minimum
+                    0x0030,             // Range Maximum
+                    0x0000,             // Translation Offset
+                    0x0001,             // Length
+                    ,, )
+            })
+        }
+    }
+
+    Scope (\_SB)
+    {
+        Device (PC20)
+        {
+            Name (_UID, 0x20)  // _UID: Unique ID
+            Name (_BBN, 0x20)  // _BBN: BIOS Bus Number
+            Name (_HID, EisaId ("PNP0A08") /* PCI Express Bus */)  // _HID: Hardware ID
+            Name (_CID, EisaId ("PNP0A03") /* PCI Bus */)  // _CID: Compatible ID
+            Method (_OSC, 4, NotSerialized)  // _OSC: Operating System Capabilities
+            {
+                CreateDWordField (Arg3, Zero, CDW1)
+                If ((Arg0 == ToUUID ("33db4d5b-1ff7-401c-9657-7441c03dd766") /* PCI Host Bridge Device */))
+                {
+                    CreateDWordField (Arg3, 0x04, CDW2)
+                    CreateDWordField (Arg3, 0x08, CDW3)
+                    Local0 = CDW3 /* \_SB_.PC20._OSC.CDW3 */
+                    Local0 &= 0x1F
+                    If ((Arg1 != One))
+                    {
+                        CDW1 |= 0x08
+                    }
+
+                    If ((CDW3 != Local0))
+                    {
+                        CDW1 |= 0x10
+                    }
+
+                    CDW3 = Local0
+                }
+                Else
+                {
+                    CDW1 |= 0x04
+                }
+
+                Return (Arg3)
+            }
+
+            Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
+            {
+                Local0 = Package (0x80){}
+                Local1 = Zero
+                While ((Local1 < 0x80))
+                {
+                    Local2 = (Local1 >> 0x02)
+                    Local3 = ((Local1 + Local2) & 0x03)
+                    If ((Local3 == Zero))
+                    {
+                        Local4 = Package (0x04)
+                            {
+                                Zero,
+                                Zero,
+                                LNKD,
+                                Zero
+                            }
+                    }
+
+                    If ((Local3 == One))
+                    {
+                        Local4 = Package (0x04)
+                            {
+                                Zero,
+                                Zero,
+                                LNKA,
+                                Zero
+                            }
+                    }
+
+                    If ((Local3 == 0x02))
+                    {
+                        Local4 = Package (0x04)
+                            {
+                                Zero,
+                                Zero,
+                                LNKB,
+                                Zero
+                            }
+                    }
+
+                    If ((Local3 == 0x03))
+                    {
+                        Local4 = Package (0x04)
+                            {
+                                Zero,
+                                Zero,
+                                LNKC,
+                                Zero
+                            }
+                    }
+
+                    Local4 [Zero] = ((Local2 << 0x10) | 0xFFFF)
+                    Local4 [One] = (Local1 & 0x03)
+                    Local0 [Local1] = Local4
+                    Local1++
+                }
+
+                Return (Local0)
+            }
+
+            Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
+            {
+                WordBusNumber (ResourceProducer, MinFixed, MaxFixed, PosDecode,
+                    0x0000,             // Granularity
+                    0x0020,             // Range Minimum
+                    0x0020,             // Range Maximum
+                    0x0000,             // Translation Offset
+                    0x0001,             // Length
+                    ,, )
+            })
+        }
+    }
+
+    Scope (\_SB)
+    {
+        Device (PC10)
+        {
+            Name (_UID, 0x10)  // _UID: Unique ID
+            Name (_BBN, 0x10)  // _BBN: BIOS Bus Number
+            Name (_HID, EisaId ("PNP0A08") /* PCI Express Bus */)  // _HID: Hardware ID
+            Name (_CID, EisaId ("PNP0A03") /* PCI Bus */)  // _CID: Compatible ID
+            Method (_OSC, 4, NotSerialized)  // _OSC: Operating System Capabilities
+            {
+                CreateDWordField (Arg3, Zero, CDW1)
+                If ((Arg0 == ToUUID ("33db4d5b-1ff7-401c-9657-7441c03dd766") /* PCI Host Bridge Device */))
+                {
+                    CreateDWordField (Arg3, 0x04, CDW2)
+                    CreateDWordField (Arg3, 0x08, CDW3)
+                    Local0 = CDW3 /* \_SB_.PC10._OSC.CDW3 */
+                    Local0 &= 0x1F
+                    If ((Arg1 != One))
+                    {
+                        CDW1 |= 0x08
+                    }
+
+                    If ((CDW3 != Local0))
+                    {
+                        CDW1 |= 0x10
+                    }
+
+                    CDW3 = Local0
+                }
+                Else
+                {
+                    CDW1 |= 0x04
+                }
+
+                Return (Arg3)
+            }
+
+            Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
+            {
+                Local0 = Package (0x80){}
+                Local1 = Zero
+                While ((Local1 < 0x80))
+                {
+                    Local2 = (Local1 >> 0x02)
+                    Local3 = ((Local1 + Local2) & 0x03)
+                    If ((Local3 == Zero))
+                    {
+                        Local4 = Package (0x04)
+                            {
+                                Zero,
+                                Zero,
+                                LNKD,
+                                Zero
+                            }
+                    }
+
+                    If ((Local3 == One))
+                    {
+                        Local4 = Package (0x04)
+                            {
+                                Zero,
+                                Zero,
+                                LNKA,
+                                Zero
+                            }
+                    }
+
+                    If ((Local3 == 0x02))
+                    {
+                        Local4 = Package (0x04)
+                            {
+                                Zero,
+                                Zero,
+                                LNKB,
+                                Zero
+                            }
+                    }
+
+                    If ((Local3 == 0x03))
+                    {
+                        Local4 = Package (0x04)
+                            {
+                                Zero,
+                                Zero,
+                                LNKC,
+                                Zero
+                            }
+                    }
+
+                    Local4 [Zero] = ((Local2 << 0x10) | 0xFFFF)
+                    Local4 [One] = (Local1 & 0x03)
+                    Local0 [Local1] = Local4
+                    Local1++
+                }
+
+                Return (Local0)
+            }
+
+            Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
+            {
+                WordBusNumber (ResourceProducer, MinFixed, MaxFixed, PosDecode,
+                    0x0000,             // Granularity
+                    0x0010,             // Range Minimum
+                    0x0010,             // Range Maximum
+                    0x0000,             // Translation Offset
+                    0x0001,             // Length
+                    ,, )
+            })
+        }
+    }
+
     Scope (\_SB.PCI0)
     {
         Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
@@ -3121,9 +3454,9 @@
             WordBusNumber (ResourceProducer, MinFixed, MaxFixed, PosDecode,
                 0x0000,             // Granularity
                 0x0000,             // Range Minimum
-                0x00FF,             // Range Maximum
+                0x000F,             // Range Maximum
                 0x0000,             // Translation Offset
-                0x0100,             // Length
+                0x0010,             // Length
                 ,, )
             IO (Decode16,
                 0x0CF8,             // Range Minimum
@@ -3278,6 +3611,26 @@
                 }
             }

+            Device (S10)
+            {
+                Name (_ADR, 0x00020000)  // _ADR: Address
+            }
+
+            Device (S18)
+            {
+                Name (_ADR, 0x00030000)  // _ADR: Address
+            }
+
+            Device (S20)
+            {
+                Name (_ADR, 0x00040000)  // _ADR: Address
+            }
+
+            Device (S28)
+            {
+                Name (_ADR, 0x00050000)  // _ADR: Address
+            }
+
             Method (PCNT, 0, NotSerialized)
             {
             }

Reviewed-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Message-id: 20211210170415.583179-8-jean-philippe@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 tests/qtest/bios-tables-test-allowed-diff.h |   2 --
 tests/data/acpi/q35/DSDT.viot               | Bin 0 -> 9398 bytes
 tests/data/acpi/q35/VIOT.viot               | Bin 0 -> 112 bytes
 3 files changed, 2 deletions(-)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index 29b5b1eabc7..8367ffe1d40 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,4 +1,2 @@
 /* List of comma-separated changed AML files to ignore */
 "tests/data/acpi/virt/VIOT",
-"tests/data/acpi/q35/DSDT.viot",
-"tests/data/acpi/q35/VIOT.viot",
diff --git a/tests/data/acpi/q35/DSDT.viot b/tests/data/acpi/q35/DSDT.viot
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..1c3b4da5cbe81ecab5e1ef50d383b561c5e0f55f 100644
GIT binary patch
literal 9398
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
Gu>S+TT-130

literal 0
HcmV?d00001

diff --git a/tests/data/acpi/q35/VIOT.viot b/tests/data/acpi/q35/VIOT.viot
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..9b179266ccbf84f1c250ee646812d17e27987764 100644
GIT binary patch
literal 112
zcmWIZ^baXu00LVle`k+i1*eDrX9XZ&1PX!JAex!M0Hgv8m>C3sGzdcgBZCA3T-xBj
Q0Zb)W9Hva*zW_`e0M!8s0RR91

literal 0
HcmV?d00001

-- 
2.25.1


