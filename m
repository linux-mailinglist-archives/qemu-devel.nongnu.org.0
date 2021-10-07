Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52B634254F6
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 16:03:08 +0200 (CEST)
Received: from localhost ([::1]:60644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYTzG-0002mG-TP
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 10:03:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mYTuk-0008Cx-Bj
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 09:58:27 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:51081)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mYTui-0000z5-HD
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 09:58:26 -0400
Received: by mail-pj1-x102b.google.com with SMTP id k23so4969201pji.0
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 06:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xDvZkZPduV0YZzkx1a9jG5giYPDiBVcmwOowVfVZ+cs=;
 b=z7EJY+UeRjwMba84VoONYbhxScRrnIqlFH0IvZggQaBmG4/5aZOMop1ewoga2Y2QmX
 zDdYqi9Q0FOUEF6IWbMefP7Zy+/56ZNs0nKv6uYE83we9oaZml9xnvq7pEvx24Y+odWo
 xzOaY2t6/zDNZDcVzbVyQAhMaQmi+b4/n5dclmHW/m0NxBNXpKzvtI+ix0OR/n0S9UZH
 buu7HcnRsf7hswPuWww5XKY7CPV9ZLor1CfvEippPH4WkHSPk9uFVrJgZwHCQx6RHR3c
 3a04Xi9wSPyXx0Wj0cq4fVtYzPRb50J/gvFzTkigXIxgo1IU+3Q1NgKNw+5lCIJkZmBt
 8Sjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xDvZkZPduV0YZzkx1a9jG5giYPDiBVcmwOowVfVZ+cs=;
 b=gcbTGnaOPQrB6gwI0Xg+xYeOFzEY3MpRHyAqXJhBAIdhTs1QpzCr/Foc5t/6yk2N/r
 h4HPa/IQXGJ5AqZtZtsRIgfsjTZMJ2jinWEYvpBLVjT7tfr4fi2zO3l2elsx9vqyAkoM
 WlzdBaOknz5joqbnKlYPzk8mOWUAD6f2qGLGQBqGQKMDrLNgsgNTUHQFOO1Vj/3oat8M
 p2CtEVgAwcE/1LKiFbhPw6IGo3JEYKegTTjvweo/DcGCzIgilkDK9SjxBLmdZ+eHqv7G
 /f+VbEB27ygXMJeh0va/C7v1LJh7wCTkdRLmDvT3epB+aGUjVPNX0h6VYWOy/uM4BaiY
 /HKQ==
X-Gm-Message-State: AOAM53055xiaBBxGqwDJlYG3ov4ATRIm0ueRoYDOZYwL6XASCHiWx/6N
 R7Uz+UB1zLeH2F+SWCySTQfBoFGDpXydKw==
X-Google-Smtp-Source: ABdhPJzx5TQPg28EefwScwXdDPKO0nqazjf1OXZI2PS8j/OaTDBY4A7JaYDKy3vDJQ5d+6wiYcx3Tg==
X-Received: by 2002:a17:902:bf0a:b0:13d:f4b8:111 with SMTP id
 bi10-20020a170902bf0a00b0013df4b80111mr4121581plb.35.1633615102844; 
 Thu, 07 Oct 2021 06:58:22 -0700 (PDT)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([115.96.196.214])
 by smtp.googlemail.com with ESMTPSA id
 p189sm24283400pfp.167.2021.10.07.06.58.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 06:58:22 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 2/3] tests/acpi/pcihp: add unit tests for hotplug on
 multifunction bridges for q35
Date: Thu,  7 Oct 2021 19:27:49 +0530
Message-Id: <20211007135750.1277213-3-ani@anisinha.ca>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211007135750.1277213-1-ani@anisinha.ca>
References: <20211007135750.1277213-1-ani@anisinha.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::102b;
 envelope-from=ani@anisinha.ca; helo=mail-pj1-x102b.google.com
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
Cc: Ani Sinha <ani@anisinha.ca>, Igor Mammedov <imammedo@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

commit d7346e614f4ec ("acpi: x86: pcihp: add support hotplug on multifunction bridges")
added ACPI hotplug descriptions for cold plugged bridges for functions other
than 0. For all other devices, the ACPI hotplug descriptions are limited to
function 0 only. This change adds unit tests for this feature.

This test adds the following devices to qemu and then checks the changes
introduced in the DSDT table due to the addition of the following devices:

(a) a multifunction bridge device
(b) a bridge device with function 1
(c) a non-bridge device with function 2

In the DSDT table, we should see AML hotplug descriptions for (a) and (b).
For (a) we should find a hotplug AML description for function 0.

The following diff compares the DSDT table AML with the new unit test before
and after the change d7346e614f4ec is introduced. In other words,
this diff reflects the changes that occurs in the DSDT table due to the change
d7346e614f4ec .

@@ -1,60 +1,38 @@
 /*
  * Intel ACPI Component Architecture
  * AML/ASL+ Disassembler version 20190509 (64-bit version)
  * Copyright (c) 2000 - 2019 Intel Corporation
  *
  * Disassembling to symbolic ASL+ operators
  *
- * Disassembly of tests/data/acpi/q35/DSDT.multi-bridge, Thu Oct  7 18:56:05 2021
+ * Disassembly of /tmp/aml-AN0DA1, Thu Oct  7 18:56:05 2021
  *
  * Original Table Header:
  *     Signature        "DSDT"
- *     Length           0x000020FE (8446)
+ *     Length           0x00002187 (8583)
  *     Revision         0x01 **** 32-bit table (V1), no 64-bit math support
- *     Checksum         0xDE
+ *     Checksum         0x8D
  *     OEM ID           "BOCHS "
  *     OEM Table ID     "BXPC    "
  *     OEM Revision     0x00000001 (1)
  *     Compiler ID      "BXPC"
  *     Compiler Version 0x00000001 (1)
  */
 DefinitionBlock ("", "DSDT", 1, "BOCHS ", "BXPC    ", 0x00000001)
 {
-    /*
-     * iASL Warning: There was 1 external control method found during
-     * disassembly, but only 0 were resolved (1 unresolved). Additional
-     * ACPI tables may be required to properly disassemble the code. This
-     * resulting disassembler output file may not compile because the
-     * disassembler did not know how many arguments to assign to the
-     * unresolved methods. Note: SSDTs can be dynamically loaded at
-     * runtime and may or may not be available via the host OS.
-     *
-     * In addition, the -fe option can be used to specify a file containing
-     * control method external declarations with the associated method
-     * argument counts. Each line of the file must be of the form:
-     *     External (<method pathname>, MethodObj, <argument count>)
-     * Invocation:
-     *     iasl -fe refs.txt -d dsdt.aml
-     *
-     * The following methods were unresolved and many not compile properly
-     * because the disassembler had to guess at the number of arguments
-     * required for each:
-     */
-    External (_SB_.PCI0.S19_.PCNT, MethodObj)    // Warning: Unknown method, guessing 1 arguments
-
     Scope (\)
     {
         OperationRegion (DBG, SystemIO, 0x0402, One)
         Field (DBG, ByteAcc, NoLock, Preserve)
         {
             DBGB,   8
         }

         Method (DBUG, 1, NotSerialized)
         {
             ToHexString (Arg0, Local0)
             ToBuffer (Local0, Local0)
             Local1 = (SizeOf (Local0) - One)
             Local2 = Zero
             While ((Local2 < Local1))
             {
@@ -3322,24 +3300,60 @@
                 Method (DVNT, 2, NotSerialized)
                 {
                     If ((Arg0 & One))
                     {
                         Notify (S00, Arg1)
                     }
                 }

                 Method (PCNT, 0, NotSerialized)
                 {
                     BNUM = One
                     DVNT (PCIU, One)
                     DVNT (PCID, 0x03)
                 }
             }

+            Device (S19)
+            {
+                Name (_ADR, 0x00030001)  // _ADR: Address
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
-                ^S19.PCNT (^S10.PCNT ())
+                ^S19.PCNT ()
+                ^S10.PCNT ()
             }
         }
     }
 }

Signed-off-by: Ani Sinha <ani@anisinha.ca>
---
 tests/qtest/bios-tables-test.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index 4f11d03055..33107caeed 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -859,6 +859,23 @@ static void test_acpi_q35_tcg_bridge(void)
     free_test_data(&data);
 }
 
+static void test_acpi_q35_multif_bridge(void)
+{
+    test_data data = {
+        .machine = MACHINE_Q35,
+        .variant = ".multi-bridge",
+    };
+    test_acpi_one("-device pcie-root-port,id=pcie-root-port-0,"
+                  "multifunction=on,"
+                  "port=0x0,chassis=1,addr=0x2,bus=pcie.0 "
+                  "-device pcie-root-port,id=pcie-root-port-1,"
+                  "port=0x1,chassis=2,addr=0x3.0x1,bus=pcie.0 "
+                  "-device virtio-balloon,id=balloon0,"
+                  "bus=pcie.0,addr=0x4.0x2",
+                  &data);
+    free_test_data(&data);
+}
+
 static void test_acpi_q35_tcg_mmio64(void)
 {
     test_data data = {
@@ -1534,6 +1551,7 @@ int main(int argc, char *argv[])
                        test_acpi_piix4_no_acpi_pci_hotplug);
         qtest_add_func("acpi/q35", test_acpi_q35_tcg);
         qtest_add_func("acpi/q35/bridge", test_acpi_q35_tcg_bridge);
+        qtest_add_func("acpi/q35/multif-bridge", test_acpi_q35_multif_bridge);
         qtest_add_func("acpi/q35/mmio64", test_acpi_q35_tcg_mmio64);
         qtest_add_func("acpi/piix4/ipmi", test_acpi_piix4_tcg_ipmi);
         qtest_add_func("acpi/q35/ipmi", test_acpi_q35_tcg_ipmi);
-- 
2.25.1


