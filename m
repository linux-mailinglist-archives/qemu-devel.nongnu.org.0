Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B413E2EFB
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 19:48:35 +0200 (CEST)
Received: from localhost ([::1]:32962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mC3xS-0002WY-Tg
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 13:48:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mC3wK-00019c-I3
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 13:47:24 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:37635)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mC3wI-0003aX-Sh
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 13:47:24 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 dw2-20020a17090b0942b0290177cb475142so23860955pjb.2
 for <qemu-devel@nongnu.org>; Fri, 06 Aug 2021 10:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zDO6NNSufmjMlegta4TKxt6nTXndLrs6VdFp0lQa3iY=;
 b=FS2vzgSASnSVQPCbHl7LkR7HZ61BFL7D7+sfWU3RtVj0ypGOKDXfKZkUppz/KXhmqY
 dVEzFf6NzTBMmiAiGxi+txodFCBl9Y8WH0o/pYtUUBWMYhPrGfXhhgDYn+ph4p4YL0bz
 F8Q6Yvjoa+oUykwdbv/pCJPbBzcHJ0IN1onBv4Nqgap0NbFpCOzheNm0U7Se5m5N3jFz
 gGA2nTKIigfFIFD0EhF0WNw+n1zt9ew7mnVJwR1kS6E0vxd8oaxMN8vdv+Lhhlj8eQyA
 Y9X+hmEKkvTgzUNdwj3RvQgabAPsfKn8lYlX5DnnNqZPdbjQZvKMs2mb8w6Cet+bZBEK
 U0qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zDO6NNSufmjMlegta4TKxt6nTXndLrs6VdFp0lQa3iY=;
 b=f26dBZoAG+uXxHjKr2ZNWCB41BnZyjQT3irafxjLCAqk/Cy2O5Cyd0KjCflUQy6qhH
 D8dEdT76NV1bFHPEuip62SBg3DeWndy1YNlmrNIA3pKAal6bmbfqenKx2N5rABbmhCF9
 E/Rtey/7C4i6VE6/AcgaPHurdoS6T7BlvAkwz7u2FiGw1xDwtYg8y0K/MJQCF2CTrMrj
 EpYSFgxeSod4g21eW+6sIhRa2Kq1q/5qzBRQnGCOTjwGxaZOIoZ+0SFt5ciwf5Upmwbb
 0Ej20bMScPCwoYDiIv4SQ+jRDz6Dlw6CdVW5Arc3bvwakmVHK1E/D6WEImvh+Q+K9JQi
 1/Yg==
X-Gm-Message-State: AOAM531HgTxxsgi5tUt8btx3P9Yn7AR2ckG0XAtM/oTs5A5wVccvRDL8
 HKRKq+t4J5Y9xk5Z/5oxamdI19XSdEi5UA==
X-Google-Smtp-Source: ABdhPJx8QTdeoq1FZIZsWIsHI/IMQrRuQJgCXroYwOhwNKGvGmOcx7GvgdVe31jFAwGFsp4ieSwBhA==
X-Received: by 2002:a17:902:edce:b029:12c:f0c3:e4d6 with SMTP id
 q14-20020a170902edceb029012cf0c3e4d6mr1877541plk.18.1628272041323; 
 Fri, 06 Aug 2021 10:47:21 -0700 (PDT)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([115.96.106.6])
 by smtp.googlemail.com with ESMTPSA id ms8sm13561980pjb.36.2021.08.06.10.47.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Aug 2021 10:47:20 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH] tests/acpi/pcihp: add unit tests for hotplug on
 multifunction bridges for q35
Date: Fri,  6 Aug 2021 23:16:42 +0530
Message-Id: <20210806174642.490023-2-ani@anisinha.ca>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210806174642.490023-1-ani@anisinha.ca>
References: <20210806174642.490023-1-ani@anisinha.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::1029;
 envelope-from=ani@anisinha.ca; helo=mail-pj1-x1029.google.com
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
Cc: Ani Sinha <ani@anisinha.ca>, imammedo@redhat.com,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

commit d7346e614f4ec ("acpi: x86: pcihp: add support hotplug on multifunction bridges")
added ACPI hotplug descriptions for cold plugged bridges for functions other
than 0. For all other devices, the ACPI hotplug descriptions are limited to
function 0 only. This change adds unit tests for this feature.

The diff of ACPI DSDT table before and after the change d7346e614f4e with the
same newly added unit test is provided below:

@@ -5,13 +5,13 @@
  *
  * Disassembling to symbolic ASL+ operators
  *
- * Disassembly of /tmp/aml-35UR70, Fri Aug  6 21:00:03 2021
+ * Disassembly of /tmp/aml-GY8760, Fri Aug  6 21:10:31 2021
  *
  * Original Table Header:
  *     Signature        "DSDT"
- *     Length           0x0000206A (8298)
+ *     Length           0x000020F3 (8435)
  *     Revision         0x01 **** 32-bit table (V1), no 64-bit math support
- *     Checksum         0x59
+ *     Checksum         0x1B
  *     OEM ID           "BOCHS "
  *     OEM Table ID     "BXPC    "
  *     OEM Revision     0x00000001 (1)
@@ -20,28 +20,6 @@
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
-    External (_SB_.PCI0.S09_.PCNT, MethodObj)    // Warning: Unknown method, guessing 1 arguments
-
     Scope (\)
     {
         OperationRegion (DBG, SystemIO, 0x0402, One)
@@ -3280,9 +3258,45 @@
                 }
             }

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
+                }
+            }
+
             Method (PCNT, 0, NotSerialized)
             {
-                ^S09.PCNT (^S08.PCNT ())
+                ^S09.PCNT ()
+                ^S08.PCNT ()
             }
         }
     }

Signed-off-by: Ani Sinha <ani@anisinha.ca>
---
 tests/qtest/bios-tables-test.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index 51d3a4e239..c92b70e8b8 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -859,6 +859,33 @@ static void test_acpi_q35_tcg_bridge(void)
     free_test_data(&data);
 }
 
+static void test_acpi_q35_multif_bridge(void)
+{
+    test_data data = {
+        .machine = MACHINE_Q35,
+        .variant = ".multi-bridge",
+        .required_struct_types = base_required_struct_types,
+        .required_struct_types_len = ARRAY_SIZE(base_required_struct_types)
+    };
+    /*
+     * lets try three things:
+     * (a) a multifunction bridge device
+     * (b) a bridge device with function 1
+     * (c) a non-bridge device with function 2
+     * We should see AML hotplug descriptions for (a) and (b) in DSDT.
+     * For (a) it should have a hotplug AML description for function 0.
+     */
+    test_acpi_one("-nodefaults -device pcie-root-port,id=pcie-root-port-0,"
+                  "multifunction=on,"
+                  "port=0x0,chassis=1,addr=0x1,bus=pcie.0 "
+                  "-device pcie-root-port,id=pcie-root-port-1,"
+                  "port=0x1,chassis=2,addr=0x1.0x1,bus=pcie.0 "
+                  "-device virtio-balloon,id=balloon0,"
+                  "bus=pcie.0,addr=0x1.0x2",
+                  &data);
+    free_test_data(&data);
+}
+
 static void test_acpi_q35_tcg_mmio64(void)
 {
     test_data data = {
@@ -1528,6 +1555,7 @@ int main(int argc, char *argv[])
                        test_acpi_piix4_no_acpi_pci_hotplug);
         qtest_add_func("acpi/q35", test_acpi_q35_tcg);
         qtest_add_func("acpi/q35/bridge", test_acpi_q35_tcg_bridge);
+        qtest_add_func("acpi/q35/multif-bridge", test_acpi_q35_multif_bridge);
         qtest_add_func("acpi/q35/mmio64", test_acpi_q35_tcg_mmio64);
         qtest_add_func("acpi/piix4/ipmi", test_acpi_piix4_tcg_ipmi);
         qtest_add_func("acpi/q35/ipmi", test_acpi_q35_tcg_ipmi);
-- 
2.25.1


