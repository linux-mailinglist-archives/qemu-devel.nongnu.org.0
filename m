Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 383AD4953E5
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 19:11:32 +0100 (CET)
Received: from localhost ([::1]:47080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAbu8-000238-S2
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 13:11:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nAWgM-0004AI-Iy
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 07:36:51 -0500
Received: from [2a00:1450:4864:20::32d] (port=53888
 helo=mail-wm1-x32d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nAWgI-00039H-RP
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 07:36:49 -0500
Received: by mail-wm1-x32d.google.com with SMTP id n8so11773714wmk.3
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 04:36:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=qfyJb/sQ4VdSLxqMkRq8iOSNvW9SZMwppbA8FN64ZVE=;
 b=czCeS5av/SmGGFBYY1QYWAu0IqjseqY1KNqEPdv2sDZlbSInjzlCCTi1f+mupnVOY/
 Hpud8V8AzPKcwTdkqSePgNTEaC/SRJbCo5zadBpECyp7qGduq2rmg+hNeY1rgw0U1KFm
 yaU3D6MdoE7FxYF8swojfAR3T/uwMwU8IPqarT2+b9l9j58QT+NqzIdfUqVLT53p4AfU
 3lA/VSpescigqXLyYyi/58VCtPKj9whSitmP/LV2pTxtOWS02tczKfOoWnltllKC0Kz/
 GRaLUt88mUSiwHmi1fyMYfGwcQvjA6e7AvAc4LTs68W9dxCe/TIyToRNZa9J/GvPVdJr
 05GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qfyJb/sQ4VdSLxqMkRq8iOSNvW9SZMwppbA8FN64ZVE=;
 b=vdzfqVPAiazqH5LugkNWhoZ55jOaz/bwBIyj39+EsTG3+Nc+89HO6UbEMycBUsGJCH
 ITIckoCIM+MKDKZvTmJAF2LWWmYJ+eBbDlpQ51NLQQrlNS5pIyHe2/9DJX4pYYmZAfUz
 3429k5Eb0khEBE7Hbc+5vvgf0IEiUTj1Yo4KJRuLM/sEUoTg3wwba2nfP9zk04B+zLRq
 bP5rPAUM4sqyNPAVcf2JRVbFWxf49TZKzRhh8xaTnU9x4RZqT8qM5DK9PN2O9Bkwoudv
 zXEFpVN4MDBIq0dr11DR7yStN4S7jdS1RIrexeoNjCxASloIEYWyCdpSMhvRUo34YRJz
 Gd9g==
X-Gm-Message-State: AOAM530XdwdPA8MMwIL2V3WAnRGBkHL/RcwyTTLlI0vKnyh0wI0yqotz
 5kKybbf/OgoPXDTc+T2OHscTl+iFp4EXgA==
X-Google-Smtp-Source: ABdhPJwOk+d4OqExdp8uGBLF8UhV7ugGY7SsGta7a3dLuXyqAatz6r0552/DoKnpQHPl/k3i0Pbs+g==
X-Received: by 2002:adf:dfc8:: with SMTP id q8mr34992748wrn.142.1642682201329; 
 Thu, 20 Jan 2022 04:36:41 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id t8sm7993324wmq.43.2022.01.20.04.36.40
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jan 2022 04:36:40 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 10/38] tests/acpi/bios-table-test: Update expected virt/PPTT
 file
Date: Thu, 20 Jan 2022 12:36:02 +0000
Message-Id: <20220120123630.267975-11-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220120123630.267975-1-peter.maydell@linaro.org>
References: <20220120123630.267975-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

From: Yanan Wang <wangyanan55@huawei.com>

Run ./tests/data/acpi/rebuild-expected-aml.sh from build directory
to update PPTT binary. Also empty bios-tables-test-allowed-diff.h.

The disassembled differences between actual and expected PPTT:

 /*
  * Intel ACPI Component Architecture
  * AML/ASL+ Disassembler version 20200528 (64-bit version)
  * Copyright (c) 2000 - 2020 Intel Corporation
  *
- * Disassembly of tests/data/acpi/virt/PPTT, Tue Jan  4 12:51:11 2022
+ * Disassembly of /tmp/aml-2ZGOF1, Tue Jan  4 12:51:11 2022
  *
  * ACPI Data Table [PPTT]
  *
  * Format: [HexOffset DecimalOffset ByteLength]  FieldName : FieldValue
  */

 [000h 0000   4]                    Signature : "PPTT"    [Processor Properties Topology Table]
-[004h 0004   4]                 Table Length : 0000004C
+[004h 0004   4]                 Table Length : 00000060
 [008h 0008   1]                     Revision : 02
-[009h 0009   1]                     Checksum : A8
+[009h 0009   1]                     Checksum : 48
 [00Ah 0010   6]                       Oem ID : "BOCHS "
 [010h 0016   8]                 Oem Table ID : "BXPC    "
 [018h 0024   4]                 Oem Revision : 00000001
 [01Ch 0028   4]              Asl Compiler ID : "BXPC"
 [020h 0032   4]        Asl Compiler Revision : 00000001

 [024h 0036   1]                Subtable Type : 00 [Processor Hierarchy Node]
 [025h 0037   1]                       Length : 14
 [026h 0038   2]                     Reserved : 0000
 [028h 0040   4]        Flags (decoded below) : 00000001
                             Physical package : 1
                      ACPI Processor ID valid : 0
                        Processor is a thread : 0
                               Node is a leaf : 0
                     Identical Implementation : 0
 [02Ch 0044   4]                       Parent : 00000000
 [030h 0048   4]            ACPI Processor ID : 00000000
 [034h 0052   4]      Private Resource Number : 00000000

 [038h 0056   1]                Subtable Type : 00 [Processor Hierarchy Node]
 [039h 0057   1]                       Length : 14
 [03Ah 0058   2]                     Reserved : 0000
-[03Ch 0060   4]        Flags (decoded below) : 0000000A
+[03Ch 0060   4]        Flags (decoded below) : 00000000
                             Physical package : 0
-                     ACPI Processor ID valid : 1
+                     ACPI Processor ID valid : 0
                        Processor is a thread : 0
-                              Node is a leaf : 1
+                              Node is a leaf : 0
                     Identical Implementation : 0
 [040h 0064   4]                       Parent : 00000024
 [044h 0068   4]            ACPI Processor ID : 00000000
 [048h 0072   4]      Private Resource Number : 00000000

-Raw Table Data: Length 76 (0x4C)
+[04Ch 0076   1]                Subtable Type : 00 [Processor Hierarchy Node]
+[04Dh 0077   1]                       Length : 14
+[04Eh 0078   2]                     Reserved : 0000
+[050h 0080   4]        Flags (decoded below) : 0000000A
+                            Physical package : 0
+                     ACPI Processor ID valid : 1
+                       Processor is a thread : 0
+                              Node is a leaf : 1
+                    Identical Implementation : 0
+[054h 0084   4]                       Parent : 00000038
+[058h 0088   4]            ACPI Processor ID : 00000000
+[05Ch 0092   4]      Private Resource Number : 00000000
+
+Raw Table Data: Length 96 (0x60)

-    0000: 50 50 54 54 4C 00 00 00 02 A8 42 4F 43 48 53 20  // PPTTL.....BOCHS
+    0000: 50 50 54 54 60 00 00 00 02 48 42 4F 43 48 53 20  // PPTT`....HBOCHS
     0010: 42 58 50 43 20 20 20 20 01 00 00 00 42 58 50 43  // BXPC    ....BXPC
     0020: 01 00 00 00 00 14 00 00 01 00 00 00 00 00 00 00  // ................
-    0030: 00 00 00 00 00 00 00 00 00 14 00 00 0A 00 00 00  // ................
-    0040: 24 00 00 00 00 00 00 00 00 00 00 00              // $...........
+    0030: 00 00 00 00 00 00 00 00 00 14 00 00 00 00 00 00  // ................
+    0040: 24 00 00 00 00 00 00 00 00 00 00 00 00 14 00 00  // $...............
+    0050: 0A 00 00 00 38 00 00 00 00 00 00 00 00 00 00 00  // ....8...........

Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
Reviewed-by: Ani Sinha <ani@anisinha.ca>
Message-id: 20220107083232.16256-7-wangyanan55@huawei.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 tests/qtest/bios-tables-test-allowed-diff.h |   1 -
 tests/data/acpi/virt/PPTT                   | Bin 76 -> 96 bytes
 2 files changed, 1 deletion(-)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index cb143a55a64..dfb8523c8bf 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,2 +1 @@
 /* List of comma-separated changed AML files to ignore */
-"tests/data/acpi/virt/PPTT",
diff --git a/tests/data/acpi/virt/PPTT b/tests/data/acpi/virt/PPTT
index 7a1258ecf123555b24462c98ccbb76b4ac1d0c2b..f56ea63b369a604877374ad696c396e796ab1c83 100644
GIT binary patch
delta 53
pcmeZC;0g!`2}xjJU|{l?$YrDgWH5jU5Ca567#O&Klm(arApowi1QY-O

delta 32
fcmYfB;R*-{3GrcIU|?D?k;`ae01J-_kOKn%ZFdCM

-- 
2.25.1


