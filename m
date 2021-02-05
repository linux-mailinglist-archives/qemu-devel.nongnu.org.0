Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EEA4310D1B
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 16:21:59 +0100 (CET)
Received: from localhost ([::1]:60118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l82vm-0000ec-8z
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 10:21:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1l82f0-0004jj-0U
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 10:04:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25841)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1l82eq-0003Ah-3x
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 10:04:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612537463;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7kUFX9AmsgkZPsv6dHdddK3V3nr3r0gT8vGMVZWZW88=;
 b=MORKwZvpSmyOdszRtJPtFsw06DvEWya4d192CNsGIiNU4WAyFr4Ltynk+L4bnpwDm8sTRV
 BCUtVKWcDiRb34IVxSpevrdQq7SiW4WixnXStS2hYdkNJJQRh9vBvFVoj+7Tv7s46UxBfM
 VrbQhEAEG4AX4B22YoB/bKejsT8xeao=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-585-T-BbwkBaPQiomDtDCCXoKw-1; Fri, 05 Feb 2021 10:04:21 -0500
X-MC-Unique: T-BbwkBaPQiomDtDCCXoKw-1
Received: by mail-ej1-f72.google.com with SMTP id m4so6803435ejc.14
 for <qemu-devel@nongnu.org>; Fri, 05 Feb 2021 07:04:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=7kUFX9AmsgkZPsv6dHdddK3V3nr3r0gT8vGMVZWZW88=;
 b=VL/7HaXCJ4k4og6rfrbAFOf6EVQI3tF+Yv315PArd+0LhwDHXps9FkP8+KVp4E3rKu
 yoDQreiLTueQciYBRZGaxoMgdtbxiU5rNOoR4AC/Pog+/NJ8jqUpoJ5I2HvGneCH1AML
 bTxtJe24dCAkRkrI9Wa77nqp0ZyfeOIw4Hk+x8cySBKhjB2AD2pipYyDzSzLSuali3nG
 4YwBmwnhaQDMvNvh2VJpldQT5bu8C1Jz927IEHAfnIp7OmUdLrNee4mMVrjhBK7OF9dB
 H9MOHSYQnzaW1YOm1DYzYYoVFLOQneHmsDi59GMqOoebFJhk1Br0SQggxc3FzeKL0Ow3
 GomQ==
X-Gm-Message-State: AOAM533jan1gZXrLxgwgRFcR05NVZdlx5SVOMSlP9jP+gI7NmewGfoYt
 v3kZ0kKALItKrEX5gGN5LS0yX12RpeoDbP+OBGPKqh6zv4x/v/9MI12x9ug1VRwsgmh5pZ9bREa
 SFIxIJWvmbtn5O5C60T2s4NGDI0fueU/ZDRqqPPYme1Vx6AHkgk22e7Be6pmG
X-Received: by 2002:a17:907:3f29:: with SMTP id
 hq41mr4429896ejc.227.1612537457258; 
 Fri, 05 Feb 2021 07:04:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwEX0a9g5Bj8Y2CkVzdy3Zbt264KigQkbUzCABPQwsNUf12C1yjWyPVG5UnqGNEIqroR0BZ5Q==
X-Received: by 2002:a17:907:3f29:: with SMTP id
 hq41mr4429458ejc.227.1612537452460; 
 Fri, 05 Feb 2021 07:04:12 -0800 (PST)
Received: from redhat.com (bzq-79-180-2-31.red.bezeqint.net. [79.180.2.31])
 by smtp.gmail.com with ESMTPSA id f22sm4029480eje.34.2021.02.05.07.04.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 07:04:11 -0800 (PST)
Date: Fri, 5 Feb 2021 10:04:09 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 14/16] tests/acpi: add OEM ID and OEM TABLE ID test
Message-ID: <20210205150135.94643-15-mst@redhat.com>
References: <20210205150135.94643-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210205150135.94643-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.352,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 Marian Postevca <posteuca@mutex.one>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marian Postevca <posteuca@mutex.one>

Add support for testing the fields OEM ID and
OEM TABLE ID in all ACPI tables for PC,Q35,MICROVM,AARCH64

Full diff of changed files disassembly:
Table tests/data/acpi/virt/FACP diff:
@@ -3,7 +3,7 @@
  * AML/ASL+ Disassembler version 20200326 (64-bit version)
  * Copyright (c) 2000 - 2020 Intel Corporation
  *
- * Disassembly of tests/data/acpi/virt/FACP, Mon Jan 18 23:55:00 2021
+ * Disassembly of /tmp/aml-VQIIX0, Mon Jan 18 23:55:00 2021
  *
  * ACPI Data Table [FACP]
  *
@@ -13,9 +13,9 @@
 [000h 0000   4]                    Signature : "FACP"    [Fixed ACPI Description Table (FADT)]
 [004h 0004   4]                 Table Length : 0000010C
 [008h 0008   1]                     Revision : 05
-[009h 0009   1]                     Checksum : BB
+[009h 0009   1]                     Checksum : 55
 [00Ah 0010   6]                       Oem ID : "BOCHS "
-[010h 0016   8]                 Oem Table ID : "BXPCFACP"
+[010h 0016   8]                 Oem Table ID : "BXPC    "
 [018h 0024   4]                 Oem Revision : 00000001
 [01Ch 0028   4]              Asl Compiler ID : "BXPC"
 [020h 0032   4]        Asl Compiler Revision : 00000001

Table tests/data/acpi/virt/APIC diff:
@@ -3,7 +3,7 @@
  * AML/ASL+ Disassembler version 20200326 (64-bit version)
  * Copyright (c) 2000 - 2020 Intel Corporation
  *
- * Disassembly of tests/data/acpi/virt/APIC, Mon Jan 18 23:55:00 2021
+ * Disassembly of /tmp/aml-BQIIX0, Mon Jan 18 23:55:00 2021
  *
  * ACPI Data Table [APIC]
  *
@@ -13,9 +13,9 @@
 [000h 0000   4]                    Signature : "APIC"    [Multiple APIC Description Table (MADT)]
 [004h 0004   4]                 Table Length : 000000A8
 [008h 0008   1]                     Revision : 03
-[009h 0009   1]                     Checksum : B3
+[009h 0009   1]                     Checksum : 50
 [00Ah 0010   6]                       Oem ID : "BOCHS "
-[010h 0016   8]                 Oem Table ID : "BXPCAPIC"
+[010h 0016   8]                 Oem Table ID : "BXPC    "
 [018h 0024   4]                 Oem Revision : 00000001
 [01Ch 0028   4]              Asl Compiler ID : "BXPC"
 [020h 0032   4]        Asl Compiler Revision : 00000001

Table tests/data/acpi/virt/GTDT diff:
@@ -3,7 +3,7 @@
  * AML/ASL+ Disassembler version 20200326 (64-bit version)
  * Copyright (c) 2000 - 2020 Intel Corporation
  *
- * Disassembly of tests/data/acpi/virt/GTDT, Mon Jan 18 23:55:00 2021
+ * Disassembly of /tmp/aml-QQIIX0, Mon Jan 18 23:55:00 2021
  *
  * ACPI Data Table [GTDT]
  *
@@ -13,9 +13,9 @@
 [000h 0000   4]                    Signature : "GTDT"    [Generic Timer Description Table]
 [004h 0004   4]                 Table Length : 00000060
 [008h 0008   1]                     Revision : 02
-[009h 0009   1]                     Checksum : D9
+[009h 0009   1]                     Checksum : 8C
 [00Ah 0010   6]                       Oem ID : "BOCHS "
-[010h 0016   8]                 Oem Table ID : "BXPCGTDT"
+[010h 0016   8]                 Oem Table ID : "BXPC    "
 [018h 0024   4]                 Oem Revision : 00000001
 [01Ch 0028   4]              Asl Compiler ID : "BXPC"
 [020h 0032   4]        Asl Compiler Revision : 00000001

Table tests/data/acpi/virt/MCFG diff:
@@ -3,7 +3,7 @@
  * AML/ASL+ Disassembler version 20200326 (64-bit version)
  * Copyright (c) 2000 - 2020 Intel Corporation
  *
- * Disassembly of tests/data/acpi/virt/MCFG, Mon Jan 18 23:55:00 2021
+ * Disassembly of /tmp/aml-OQIIX0, Mon Jan 18 23:55:00 2021
  *
  * ACPI Data Table [MCFG]
  *
@@ -13,9 +13,9 @@
 [000h 0000   4]                    Signature : "MCFG"    [Memory Mapped Configuration table]
 [004h 0004   4]                 Table Length : 0000003C
 [008h 0008   1]                     Revision : 01
-[009h 0009   1]                     Checksum : 4F
+[009h 0009   1]                     Checksum : EC
 [00Ah 0010   6]                       Oem ID : "BOCHS "
-[010h 0016   8]                 Oem Table ID : "BXPCMCFG"
+[010h 0016   8]                 Oem Table ID : "BXPC    "
 [018h 0024   4]                 Oem Revision : 00000001
 [01Ch 0028   4]              Asl Compiler ID : "BXPC"
 [020h 0032   4]        Asl Compiler Revision : 00000001

Table tests/data/acpi/virt/SPCR diff:
@@ -3,7 +3,7 @@
  * AML/ASL+ Disassembler version 20200326 (64-bit version)
  * Copyright (c) 2000 - 2020 Intel Corporation
  *
- * Disassembly of tests/data/acpi/virt/SPCR, Mon Jan 18 23:55:00 2021
+ * Disassembly of /tmp/aml-EMIIX0, Mon Jan 18 23:55:00 2021
  *
  * ACPI Data Table [SPCR]
  *
@@ -13,9 +13,9 @@
 [000h 0000   4]                    Signature : "SPCR"    [Serial Port Console Redirection table]
 [004h 0004   4]                 Table Length : 00000050
 [008h 0008   1]                     Revision : 02
-[009h 0009   1]                     Checksum : 13
+[009h 0009   1]                     Checksum : CB
 [00Ah 0010   6]                       Oem ID : "BOCHS "
-[010h 0016   8]                 Oem Table ID : "BXPCSPCR"
+[010h 0016   8]                 Oem Table ID : "BXPC    "
 [018h 0024   4]                 Oem Revision : 00000001
 [01Ch 0028   4]              Asl Compiler ID : "BXPC"
 [020h 0032   4]        Asl Compiler Revision : 00000001

Table tests/data/acpi/virt/DSDT diff:
@@ -5,20 +5,20 @@
  *
  * Disassembling to symbolic ASL+ operators
  *
- * Disassembly of tests/data/acpi/virt/DSDT, Mon Jan 18 23:55:00 2021
+ * Disassembly of /tmp/aml-RMIIX0, Mon Jan 18 23:55:00 2021
  *
  * Original Table Header:
  *     Signature        "DSDT"
  *     Length           0x00001454 (5204)
  *     Revision         0x02
- *     Checksum         0x60
+ *     Checksum         0x0F
  *     OEM ID           "BOCHS "
- *     OEM Table ID     "BXPCDSDT"
+ *     OEM Table ID     "BXPC    "
  *     OEM Revision     0x00000001 (1)
  *     Compiler ID      "BXPC"
  *     Compiler Version 0x00000001 (1)
  */
-DefinitionBlock ("", "DSDT", 2, "BOCHS ", "BXPCDSDT", 0x00000001)
+DefinitionBlock ("", "DSDT", 2, "BOCHS ", "BXPC    ", 0x00000001)
 {
     Scope (\_SB)
     {

Table tests/data/acpi/virt/FACP.numamem diff:
@@ -3,7 +3,7 @@
  * AML/ASL+ Disassembler version 20200326 (64-bit version)
  * Copyright (c) 2000 - 2020 Intel Corporation
  *
- * Disassembly of tests/data/acpi/virt/FACP.numamem, Mon Jan 18 23:55:27 2021
+ * Disassembly of /tmp/aml-JROMX0, Mon Jan 18 23:55:27 2021
  *
  * ACPI Data Table [FACP]
  *
@@ -13,9 +13,9 @@
 [000h 0000   4]                    Signature : "FACP"    [Fixed ACPI Description Table (FADT)]
 [004h 0004   4]                 Table Length : 0000010C
 [008h 0008   1]                     Revision : 05
-[009h 0009   1]                     Checksum : BB
+[009h 0009   1]                     Checksum : 55
 [00Ah 0010   6]                       Oem ID : "BOCHS "
-[010h 0016   8]                 Oem Table ID : "BXPCFACP"
+[010h 0016   8]                 Oem Table ID : "BXPC    "
 [018h 0024   4]                 Oem Revision : 00000001
 [01Ch 0028   4]              Asl Compiler ID : "BXPC"
 [020h 0032   4]        Asl Compiler Revision : 00000001

Table tests/data/acpi/virt/APIC.numamem diff:
@@ -3,7 +3,7 @@
  * AML/ASL+ Disassembler version 20200326 (64-bit version)
  * Copyright (c) 2000 - 2020 Intel Corporation
  *
- * Disassembly of tests/data/acpi/virt/APIC.numamem, Mon Jan 18 23:55:27 2021
+ * Disassembly of /tmp/aml-2ROMX0, Mon Jan 18 23:55:27 2021
  *
  * ACPI Data Table [APIC]
  *
@@ -13,9 +13,9 @@
 [000h 0000   4]                    Signature : "APIC"    [Multiple APIC Description Table (MADT)]
 [004h 0004   4]                 Table Length : 000000A8
 [008h 0008   1]                     Revision : 03
-[009h 0009   1]                     Checksum : B3
+[009h 0009   1]                     Checksum : 50
 [00Ah 0010   6]                       Oem ID : "BOCHS "
-[010h 0016   8]                 Oem Table ID : "BXPCAPIC"
+[010h 0016   8]                 Oem Table ID : "BXPC    "
 [018h 0024   4]                 Oem Revision : 00000001
 [01Ch 0028   4]              Asl Compiler ID : "BXPC"
 [020h 0032   4]        Asl Compiler Revision : 00000001

Table tests/data/acpi/virt/GTDT.numamem diff:
@@ -3,7 +3,7 @@
  * AML/ASL+ Disassembler version 20200326 (64-bit version)
  * Copyright (c) 2000 - 2020 Intel Corporation
  *
- * Disassembly of tests/data/acpi/virt/GTDT.numamem, Mon Jan 18 23:55:27 2021
+ * Disassembly of /tmp/aml-WROMX0, Mon Jan 18 23:55:27 2021
  *
  * ACPI Data Table [GTDT]
  *
@@ -13,9 +13,9 @@
 [000h 0000   4]                    Signature : "GTDT"    [Generic Timer Description Table]
 [004h 0004   4]                 Table Length : 00000060
 [008h 0008   1]                     Revision : 02
-[009h 0009   1]                     Checksum : D9
+[009h 0009   1]                     Checksum : 8C
 [00Ah 0010   6]                       Oem ID : "BOCHS "
-[010h 0016   8]                 Oem Table ID : "BXPCGTDT"
+[010h 0016   8]                 Oem Table ID : "BXPC    "
 [018h 0024   4]                 Oem Revision : 00000001
 [01Ch 0028   4]              Asl Compiler ID : "BXPC"
 [020h 0032   4]        Asl Compiler Revision : 00000001

Table tests/data/acpi/virt/MCFG.numamem diff:
@@ -3,7 +3,7 @@
  * AML/ASL+ Disassembler version 20200326 (64-bit version)
  * Copyright (c) 2000 - 2020 Intel Corporation
  *
- * Disassembly of tests/data/acpi/virt/MCFG.numamem, Mon Jan 18 23:55:27 2021
+ * Disassembly of /tmp/aml-YOOMX0, Mon Jan 18 23:55:27 2021
  *
  * ACPI Data Table [MCFG]
  *
@@ -13,9 +13,9 @@
 [000h 0000   4]                    Signature : "MCFG"    [Memory Mapped Configuration table]
 [004h 0004   4]                 Table Length : 0000003C
 [008h 0008   1]                     Revision : 01
-[009h 0009   1]                     Checksum : 4F
+[009h 0009   1]                     Checksum : EC
 [00Ah 0010   6]                       Oem ID : "BOCHS "
-[010h 0016   8]                 Oem Table ID : "BXPCMCFG"
+[010h 0016   8]                 Oem Table ID : "BXPC    "
 [018h 0024   4]                 Oem Revision : 00000001
 [01Ch 0028   4]              Asl Compiler ID : "BXPC"
 [020h 0032   4]        Asl Compiler Revision : 00000001

Table tests/data/acpi/virt/SPCR.numamem diff:
@@ -3,7 +3,7 @@
  * AML/ASL+ Disassembler version 20200326 (64-bit version)
  * Copyright (c) 2000 - 2020 Intel Corporation
  *
- * Disassembly of tests/data/acpi/virt/SPCR.numamem, Mon Jan 18 23:55:27 2021
+ * Disassembly of /tmp/aml-TOOMX0, Mon Jan 18 23:55:27 2021
  *
  * ACPI Data Table [SPCR]
  *
@@ -13,9 +13,9 @@
 [000h 0000   4]                    Signature : "SPCR"    [Serial Port Console Redirection table]
 [004h 0004   4]                 Table Length : 00000050
 [008h 0008   1]                     Revision : 02
-[009h 0009   1]                     Checksum : 13
+[009h 0009   1]                     Checksum : CB
 [00Ah 0010   6]                       Oem ID : "BOCHS "
-[010h 0016   8]                 Oem Table ID : "BXPCSPCR"
+[010h 0016   8]                 Oem Table ID : "BXPC    "
 [018h 0024   4]                 Oem Revision : 00000001
 [01Ch 0028   4]              Asl Compiler ID : "BXPC"
 [020h 0032   4]        Asl Compiler Revision : 00000001

Table tests/data/acpi/virt/SRAT.numamem diff:
@@ -3,7 +3,7 @@
  * AML/ASL+ Disassembler version 20200326 (64-bit version)
  * Copyright (c) 2000 - 2020 Intel Corporation
  *
- * Disassembly of tests/data/acpi/virt/SRAT.numamem, Mon Jan 18 23:55:27 2021
+ * Disassembly of /tmp/aml-LPOMX0, Mon Jan 18 23:55:27 2021
  *
  * ACPI Data Table [SRAT]
  *
@@ -13,9 +13,9 @@
 [000h 0000   4]                    Signature : "SRAT"    [System Resource Affinity Table]
 [004h 0004   4]                 Table Length : 0000006A
 [008h 0008   1]                     Revision : 03
-[009h 0009   1]                     Checksum : AB
+[009h 0009   1]                     Checksum : 65
 [00Ah 0010   6]                       Oem ID : "BOCHS "
-[010h 0016   8]                 Oem Table ID : "BXPCSRAT"
+[010h 0016   8]                 Oem Table ID : "BXPC    "
 [018h 0024   4]                 Oem Revision : 00000001
 [01Ch 0028   4]              Asl Compiler ID : "BXPC"
 [020h 0032   4]        Asl Compiler Revision : 00000001

Table tests/data/acpi/virt/DSDT.numamem diff:
@@ -5,20 +5,20 @@
  *
  * Disassembling to symbolic ASL+ operators
  *
- * Disassembly of tests/data/acpi/virt/DSDT.numamem, Mon Jan 18 23:55:27 2021
+ * Disassembly of /tmp/aml-HPOMX0, Mon Jan 18 23:55:27 2021
  *
  * Original Table Header:
  *     Signature        "DSDT"
  *     Length           0x00001454 (5204)
  *     Revision         0x02
- *     Checksum         0x60
+ *     Checksum         0x0F
  *     OEM ID           "BOCHS "
- *     OEM Table ID     "BXPCDSDT"
+ *     OEM Table ID     "BXPC    "
  *     OEM Revision     0x00000001 (1)
  *     Compiler ID      "BXPC"
  *     Compiler Version 0x00000001 (1)
  */
-DefinitionBlock ("", "DSDT", 2, "BOCHS ", "BXPCDSDT", 0x00000001)
+DefinitionBlock ("", "DSDT", 2, "BOCHS ", "BXPC    ", 0x00000001)
 {
     Scope (\_SB)
     {

Table tests/data/acpi/virt/FACP.memhp diff:
@@ -3,7 +3,7 @@
  * AML/ASL+ Disassembler version 20200326 (64-bit version)
  * Copyright (c) 2000 - 2020 Intel Corporation
  *
- * Disassembly of tests/data/acpi/virt/FACP.memhp, Mon Jan 18 23:55:41 2021
+ * Disassembly of /tmp/aml-OERTX0, Mon Jan 18 23:55:41 2021
  *
  * ACPI Data Table [FACP]
  *
@@ -13,9 +13,9 @@
 [000h 0000   4]                    Signature : "FACP"    [Fixed ACPI Description Table (FADT)]
 [004h 0004   4]                 Table Length : 0000010C
 [008h 0008   1]                     Revision : 05
-[009h 0009   1]                     Checksum : BB
+[009h 0009   1]                     Checksum : 55
 [00Ah 0010   6]                       Oem ID : "BOCHS "
-[010h 0016   8]                 Oem Table ID : "BXPCFACP"
+[010h 0016   8]                 Oem Table ID : "BXPC    "
 [018h 0024   4]                 Oem Revision : 00000001
 [01Ch 0028   4]              Asl Compiler ID : "BXPC"
 [020h 0032   4]        Asl Compiler Revision : 00000001

Table tests/data/acpi/virt/APIC.memhp diff:
@@ -3,7 +3,7 @@
  * AML/ASL+ Disassembler version 20200326 (64-bit version)
  * Copyright (c) 2000 - 2020 Intel Corporation
  *
- * Disassembly of tests/data/acpi/virt/APIC.memhp, Mon Jan 18 23:55:41 2021
+ * Disassembly of /tmp/aml-FERTX0, Mon Jan 18 23:55:41 2021
  *
  * ACPI Data Table [APIC]
  *
@@ -13,9 +13,9 @@
 [000h 0000   4]                    Signature : "APIC"    [Multiple APIC Description Table (MADT)]
 [004h 0004   4]                 Table Length : 000000A8
 [008h 0008   1]                     Revision : 03
-[009h 0009   1]                     Checksum : B3
+[009h 0009   1]                     Checksum : 50
 [00Ah 0010   6]                       Oem ID : "BOCHS "
-[010h 0016   8]                 Oem Table ID : "BXPCAPIC"
+[010h 0016   8]                 Oem Table ID : "BXPC    "
 [018h 0024   4]                 Oem Revision : 00000001
 [01Ch 0028   4]              Asl Compiler ID : "BXPC"
 [020h 0032   4]        Asl Compiler Revision : 00000001

Table tests/data/acpi/virt/GTDT.memhp diff:
@@ -3,7 +3,7 @@
  * AML/ASL+ Disassembler version 20200326 (64-bit version)
  * Copyright (c) 2000 - 2020 Intel Corporation
  *
- * Disassembly of tests/data/acpi/virt/GTDT.memhp, Mon Jan 18 23:55:41 2021
+ * Disassembly of /tmp/aml-BERTX0, Mon Jan 18 23:55:41 2021
  *
  * ACPI Data Table [GTDT]
  *
@@ -13,9 +13,9 @@
 [000h 0000   4]                    Signature : "GTDT"    [Generic Timer Description Table]
 [004h 0004   4]                 Table Length : 00000060
 [008h 0008   1]                     Revision : 02
-[009h 0009   1]                     Checksum : D9
+[009h 0009   1]                     Checksum : 8C
 [00Ah 0010   6]                       Oem ID : "BOCHS "
-[010h 0016   8]                 Oem Table ID : "BXPCGTDT"
+[010h 0016   8]                 Oem Table ID : "BXPC    "
 [018h 0024   4]                 Oem Revision : 00000001
 [01Ch 0028   4]              Asl Compiler ID : "BXPC"
 [020h 0032   4]        Asl Compiler Revision : 00000001

Table tests/data/acpi/virt/MCFG.memhp diff:
@@ -3,7 +3,7 @@
  * AML/ASL+ Disassembler version 20200326 (64-bit version)
  * Copyright (c) 2000 - 2020 Intel Corporation
  *
- * Disassembly of tests/data/acpi/virt/MCFG.memhp, Mon Jan 18 23:55:41 2021
+ * Disassembly of /tmp/aml-8DRTX0, Mon Jan 18 23:55:41 2021
  *
  * ACPI Data Table [MCFG]
  *
@@ -13,9 +13,9 @@
 [000h 0000   4]                    Signature : "MCFG"    [Memory Mapped Configuration table]
 [004h 0004   4]                 Table Length : 0000003C
 [008h 0008   1]                     Revision : 01
-[009h 0009   1]                     Checksum : 4F
+[009h 0009   1]                     Checksum : EC
 [00Ah 0010   6]                       Oem ID : "BOCHS "
-[010h 0016   8]                 Oem Table ID : "BXPCMCFG"
+[010h 0016   8]                 Oem Table ID : "BXPC    "
 [018h 0024   4]                 Oem Revision : 00000001
 [01Ch 0028   4]              Asl Compiler ID : "BXPC"
 [020h 0032   4]        Asl Compiler Revision : 00000001

Table tests/data/acpi/virt/SPCR.memhp diff:
@@ -3,7 +3,7 @@
  * AML/ASL+ Disassembler version 20200326 (64-bit version)
  * Copyright (c) 2000 - 2020 Intel Corporation
  *
- * Disassembly of tests/data/acpi/virt/SPCR.memhp, Mon Jan 18 23:55:41 2021
+ * Disassembly of /tmp/aml-IN6NX0, Mon Jan 18 23:55:41 2021
  *
  * ACPI Data Table [SPCR]
  *
@@ -13,9 +13,9 @@
 [000h 0000   4]                    Signature : "SPCR"    [Serial Port Console Redirection table]
 [004h 0004   4]                 Table Length : 00000050
 [008h 0008   1]                     Revision : 02
-[009h 0009   1]                     Checksum : 13
+[009h 0009   1]                     Checksum : CB
 [00Ah 0010   6]                       Oem ID : "BOCHS "
-[010h 0016   8]                 Oem Table ID : "BXPCSPCR"
+[010h 0016   8]                 Oem Table ID : "BXPC    "
 [018h 0024   4]                 Oem Revision : 00000001
 [01Ch 0028   4]              Asl Compiler ID : "BXPC"
 [020h 0032   4]        Asl Compiler Revision : 00000001

Table tests/data/acpi/virt/SRAT.memhp diff:
@@ -3,7 +3,7 @@
  * AML/ASL+ Disassembler version 20200326 (64-bit version)
  * Copyright (c) 2000 - 2020 Intel Corporation
  *
- * Disassembly of tests/data/acpi/virt/SRAT.memhp, Mon Jan 18 23:55:41 2021
+ * Disassembly of /tmp/aml-FN6NX0, Mon Jan 18 23:55:41 2021
  *
  * ACPI Data Table [SRAT]
  *
@@ -13,9 +13,9 @@
 [000h 0000   4]                    Signature : "SRAT"    [System Resource Affinity Table]
 [004h 0004   4]                 Table Length : 000000E2
 [008h 0008   1]                     Revision : 03
-[009h 0009   1]                     Checksum : 5C
+[009h 0009   1]                     Checksum : 16
 [00Ah 0010   6]                       Oem ID : "BOCHS "
-[010h 0016   8]                 Oem Table ID : "BXPCSRAT"
+[010h 0016   8]                 Oem Table ID : "BXPC    "
 [018h 0024   4]                 Oem Revision : 00000001
 [01Ch 0028   4]              Asl Compiler ID : "BXPC"
 [020h 0032   4]        Asl Compiler Revision : 00000001

Table tests/data/acpi/virt/SLIT.memhp diff:
@@ -3,7 +3,7 @@
  * AML/ASL+ Disassembler version 20200326 (64-bit version)
  * Copyright (c) 2000 - 2020 Intel Corporation
  *
- * Disassembly of tests/data/acpi/virt/SLIT.memhp, Mon Jan 18 23:55:41 2021
+ * Disassembly of /tmp/aml-CN6NX0, Mon Jan 18 23:55:41 2021
  *
  * ACPI Data Table [SLIT]
  *
@@ -13,9 +13,9 @@
 [000h 0000   4]                    Signature : "SLIT"    [System Locality Information Table]
 [004h 0004   4]                 Table Length : 00000030
 [008h 0008   1]                     Revision : 01
-[009h 0009   1]                     Checksum : 2C
+[009h 0009   1]                     Checksum : E8
 [00Ah 0010   6]                       Oem ID : "BOCHS "
-[010h 0016   8]                 Oem Table ID : "BXPCSLIT"
+[010h 0016   8]                 Oem Table ID : "BXPC    "
 [018h 0024   4]                 Oem Revision : 00000001
 [01Ch 0028   4]              Asl Compiler ID : "BXPC"
 [020h 0032   4]        Asl Compiler Revision : 00000001

Table tests/data/acpi/virt/SSDT.memhp diff:
@@ -5,20 +5,20 @@
  *
  * Disassembling to symbolic ASL+ operators
  *
- * Disassembly of tests/data/acpi/virt/SSDT.memhp, Mon Jan 18 23:55:41 2021
+ * Disassembly of /tmp/aml-9M6NX0, Mon Jan 18 23:55:41 2021
  *
  * Original Table Header:
  *     Signature        "SSDT"
  *     Length           0x000002E0 (736)
  *     Revision         0x01
- *     Checksum         0x3F
+ *     Checksum         0xFF
  *     OEM ID           "BOCHS "
- *     OEM Table ID     "NVDIMM"
+ *     OEM Table ID     "NVDIMM  "
  *     OEM Revision     0x00000001 (1)
  *     Compiler ID      "BXPC"
  *     Compiler Version 0x00000001 (1)
  */
-DefinitionBlock ("", "SSDT", 1, "BOCHS ", "NVDIMM", 0x00000001)
+DefinitionBlock ("", "SSDT", 1, "BOCHS ", "NVDIMM  ", 0x00000001)
 {
     Scope (\_SB)
     {

Table tests/data/acpi/virt/NFIT.memhp diff:
@@ -3,7 +3,7 @@
  * AML/ASL+ Disassembler version 20200326 (64-bit version)
  * Copyright (c) 2000 - 2020 Intel Corporation
  *
- * Disassembly of tests/data/acpi/virt/NFIT.memhp, Mon Jan 18 23:55:41 2021
+ * Disassembly of /tmp/aml-6M6NX0, Mon Jan 18 23:55:41 2021
  *
  * ACPI Data Table [NFIT]
  *
@@ -13,9 +13,9 @@
 [000h 0000   4]                    Signature : "NFIT"    [NVDIMM Firmware Interface Table]
 [004h 0004   4]                 Table Length : 000000E0
 [008h 0008   1]                     Revision : 01
-[009h 0009   1]                     Checksum : D1
+[009h 0009   1]                     Checksum : 82
 [00Ah 0010   6]                       Oem ID : "BOCHS "
-[010h 0016   8]                 Oem Table ID : "BXPCNFIT"
+[010h 0016   8]                 Oem Table ID : "BXPC    "
 [018h 0024   4]                 Oem Revision : 00000001
 [01Ch 0028   4]              Asl Compiler ID : "BXPC"
 [020h 0032   4]        Asl Compiler Revision : 00000001

Table tests/data/acpi/virt/DSDT.memhp diff:
@@ -5,20 +5,20 @@
  *
  * Disassembling to symbolic ASL+ operators
  *
- * Disassembly of tests/data/acpi/virt/DSDT.memhp, Mon Jan 18 23:55:41 2021
+ * Disassembly of /tmp/aml-3M6NX0, Mon Jan 18 23:55:41 2021
  *
  * Original Table Header:
  *     Signature        "DSDT"
  *     Length           0x000019A5 (6565)
  *     Revision         0x02
- *     Checksum         0x90
+ *     Checksum         0x3F
  *     OEM ID           "BOCHS "
- *     OEM Table ID     "BXPCDSDT"
+ *     OEM Table ID     "BXPC    "
  *     OEM Revision     0x00000001 (1)
  *     Compiler ID      "BXPC"
  *     Compiler Version 0x00000001 (1)
  */
-DefinitionBlock ("", "DSDT", 2, "BOCHS ", "BXPCDSDT", 0x00000001)
+DefinitionBlock ("", "DSDT", 2, "BOCHS ", "BXPC    ", 0x00000001)
 {
     External (_SB_.NVDR, UnknownObj)

Table tests/data/acpi/virt/FACP.pxb diff:
@@ -3,7 +3,7 @@
  * AML/ASL+ Disassembler version 20200326 (64-bit version)
  * Copyright (c) 2000 - 2020 Intel Corporation
  *
- * Disassembly of tests/data/acpi/virt/FACP, Mon Jan 18 23:55:52 2021
+ * Disassembly of /tmp/aml-206LX0, Mon Jan 18 23:55:52 2021
  *
  * ACPI Data Table [FACP]
  *
@@ -13,9 +13,9 @@
 [000h 0000   4]                    Signature : "FACP"    [Fixed ACPI Description Table (FADT)]
 [004h 0004   4]                 Table Length : 0000010C
 [008h 0008   1]                     Revision : 05
-[009h 0009   1]                     Checksum : BB
+[009h 0009   1]                     Checksum : 55
 [00Ah 0010   6]                       Oem ID : "BOCHS "
-[010h 0016   8]                 Oem Table ID : "BXPCFACP"
+[010h 0016   8]                 Oem Table ID : "BXPC    "
 [018h 0024   4]                 Oem Revision : 00000001
 [01Ch 0028   4]              Asl Compiler ID : "BXPC"
 [020h 0032   4]        Asl Compiler Revision : 00000001

Table tests/data/acpi/virt/APIC.pxb diff:
@@ -3,7 +3,7 @@
  * AML/ASL+ Disassembler version 20200326 (64-bit version)
  * Copyright (c) 2000 - 2020 Intel Corporation
  *
- * Disassembly of tests/data/acpi/virt/APIC, Mon Jan 18 23:55:52 2021
+ * Disassembly of /tmp/aml-E16LX0, Mon Jan 18 23:55:52 2021
  *
  * ACPI Data Table [APIC]
  *
@@ -13,9 +13,9 @@
 [000h 0000   4]                    Signature : "APIC"    [Multiple APIC Description Table (MADT)]
 [004h 0004   4]                 Table Length : 000000A8
 [008h 0008   1]                     Revision : 03
-[009h 0009   1]                     Checksum : B3
+[009h 0009   1]                     Checksum : 50
 [00Ah 0010   6]                       Oem ID : "BOCHS "
-[010h 0016   8]                 Oem Table ID : "BXPCAPIC"
+[010h 0016   8]                 Oem Table ID : "BXPC    "
 [018h 0024   4]                 Oem Revision : 00000001
 [01Ch 0028   4]              Asl Compiler ID : "BXPC"
 [020h 0032   4]        Asl Compiler Revision : 00000001

Table tests/data/acpi/virt/GTDT.pxb diff:
@@ -3,7 +3,7 @@
  * AML/ASL+ Disassembler version 20200326 (64-bit version)
  * Copyright (c) 2000 - 2020 Intel Corporation
  *
- * Disassembly of tests/data/acpi/virt/GTDT, Mon Jan 18 23:55:52 2021
+ * Disassembly of /tmp/aml-J16LX0, Mon Jan 18 23:55:52 2021
  *
  * ACPI Data Table [GTDT]
  *
@@ -13,9 +13,9 @@
 [000h 0000   4]                    Signature : "GTDT"    [Generic Timer Description Table]
 [004h 0004   4]                 Table Length : 00000060
 [008h 0008   1]                     Revision : 02
-[009h 0009   1]                     Checksum : D9
+[009h 0009   1]                     Checksum : 8C
 [00Ah 0010   6]                       Oem ID : "BOCHS "
-[010h 0016   8]                 Oem Table ID : "BXPCGTDT"
+[010h 0016   8]                 Oem Table ID : "BXPC    "
 [018h 0024   4]                 Oem Revision : 00000001
 [01Ch 0028   4]              Asl Compiler ID : "BXPC"
 [020h 0032   4]        Asl Compiler Revision : 00000001

Table tests/data/acpi/virt/MCFG.pxb diff:
@@ -3,7 +3,7 @@
  * AML/ASL+ Disassembler version 20200326 (64-bit version)
  * Copyright (c) 2000 - 2020 Intel Corporation
  *
- * Disassembly of tests/data/acpi/virt/MCFG, Mon Jan 18 23:55:52 2021
+ * Disassembly of /tmp/aml-N16LX0, Mon Jan 18 23:55:52 2021
  *
  * ACPI Data Table [MCFG]
  *
@@ -13,9 +13,9 @@
 [000h 0000   4]                    Signature : "MCFG"    [Memory Mapped Configuration table]
 [004h 0004   4]                 Table Length : 0000003C
 [008h 0008   1]                     Revision : 01
-[009h 0009   1]                     Checksum : 4F
+[009h 0009   1]                     Checksum : EC
 [00Ah 0010   6]                       Oem ID : "BOCHS "
-[010h 0016   8]                 Oem Table ID : "BXPCMCFG"
+[010h 0016   8]                 Oem Table ID : "BXPC    "
 [018h 0024   4]                 Oem Revision : 00000001
 [01Ch 0028   4]              Asl Compiler ID : "BXPC"
 [020h 0032   4]        Asl Compiler Revision : 00000001

Table tests/data/acpi/virt/SPCR.pxb diff:
@@ -3,7 +3,7 @@
  * AML/ASL+ Disassembler version 20200326 (64-bit version)
  * Copyright (c) 2000 - 2020 Intel Corporation
  *
- * Disassembly of tests/data/acpi/virt/SPCR, Mon Jan 18 23:55:52 2021
+ * Disassembly of /tmp/aml-B16LX0, Mon Jan 18 23:55:52 2021
  *
  * ACPI Data Table [SPCR]
  *
@@ -13,9 +13,9 @@
 [000h 0000   4]                    Signature : "SPCR"    [Serial Port Console Redirection table]
 [004h 0004   4]                 Table Length : 00000050
 [008h 0008   1]                     Revision : 02
-[009h 0009   1]                     Checksum : 13
+[009h 0009   1]                     Checksum : CB
 [00Ah 0010   6]                       Oem ID : "BOCHS "
-[010h 0016   8]                 Oem Table ID : "BXPCSPCR"
+[010h 0016   8]                 Oem Table ID : "BXPC    "
 [018h 0024   4]                 Oem Revision : 00000001
 [01Ch 0028   4]              Asl Compiler ID : "BXPC"
 [020h 0032   4]        Asl Compiler Revision : 00000001

Table tests/data/acpi/virt/DSDT.pxb diff:
@@ -5,20 +5,20 @@
  *
  * Disassembling to symbolic ASL+ operators
  *
- * Disassembly of tests/data/acpi/virt/DSDT.pxb, Mon Jan 18 23:55:52 2021
+ * Disassembly of /tmp/aml-G16LX0, Mon Jan 18 23:55:52 2021
  *
  * Original Table Header:
  *     Signature        "DSDT"
  *     Length           0x00001E09 (7689)
  *     Revision         0x02
- *     Checksum         0x30
+ *     Checksum         0xDF
  *     OEM ID           "BOCHS "
- *     OEM Table ID     "BXPCDSDT"
+ *     OEM Table ID     "BXPC    "
  *     OEM Revision     0x00000001 (1)
  *     Compiler ID      "BXPC"
  *     Compiler Version 0x00000001 (1)
  */
-DefinitionBlock ("", "DSDT", 2, "BOCHS ", "BXPCDSDT", 0x00000001)
+DefinitionBlock ("", "DSDT", 2, "BOCHS ", "BXPC    ", 0x00000001)
 {
     Scope (\_SB)
     {

Table tests/data/acpi/pc/HPET diff:
@@ -3,7 +3,7 @@
  * AML/ASL+ Disassembler version 20200326 (64-bit version)
  * Copyright (c) 2000 - 2020 Intel Corporation
  *
- * Disassembly of tests/data/acpi/pc/HPET, Mon Jan 18 23:58:53 2021
+ * Disassembly of /tmp/aml-QNVAX0, Mon Jan 18 23:58:53 2021
  *
  * ACPI Data Table [HPET]
  *
@@ -13,9 +13,9 @@
 [000h 0000   4]                    Signature : "HPET"    [High Precision Event Timer table]
 [004h 0004   4]                 Table Length : 00000038
 [008h 0008   1]                     Revision : 01
-[009h 0009   1]                     Checksum : 03
+[009h 0009   1]                     Checksum : B4
 [00Ah 0010   6]                       Oem ID : "BOCHS "
-[010h 0016   8]                 Oem Table ID : "BXPCHPET"
+[010h 0016   8]                 Oem Table ID : "BXPC    "
 [018h 0024   4]                 Oem Revision : 00000001
 [01Ch 0028   4]              Asl Compiler ID : "BXPC"
 [020h 0032   4]        Asl Compiler Revision : 00000001

Table tests/data/acpi/pc/WAET diff:
@@ -3,7 +3,7 @@
  * AML/ASL+ Disassembler version 20200326 (64-bit version)
  * Copyright (c) 2000 - 2020 Intel Corporation
  *
- * Disassembly of tests/data/acpi/pc/WAET, Mon Jan 18 23:58:53 2021
+ * Disassembly of /tmp/aml-NNVAX0, Mon Jan 18 23:58:53 2021
  *
  * ACPI Data Table [WAET]
  *
@@ -13,9 +13,9 @@
 [000h 0000   4]                    Signature : "WAET"    [Windows ACPI Emulated Devices Table]
 [004h 0004   4]                 Table Length : 00000028
 [008h 0008   1]                     Revision : 01
-[009h 0009   1]                     Checksum : 88
+[009h 0009   1]                     Checksum : 39
 [00Ah 0010   6]                       Oem ID : "BOCHS "
-[010h 0016   8]                 Oem Table ID : "BXPCWAET"
+[010h 0016   8]                 Oem Table ID : "BXPC    "
 [018h 0024   4]                 Oem Revision : 00000001
 [01Ch 0028   4]              Asl Compiler ID : "BXPC"
 [020h 0032   4]        Asl Compiler Revision : 00000001

Table tests/data/acpi/q35/FACP.tis diff:
@@ -3,7 +3,7 @@
  * AML/ASL+ Disassembler version 20200326 (64-bit version)
  * Copyright (c) 2000 - 2020 Intel Corporation
  *
- * Disassembly of tests/data/acpi/q35/FACP, Mon Jan 18 23:58:55 2021
+ * Disassembly of /tmp/aml-MB7EX0, Mon Jan 18 23:58:55 2021
  *
  * ACPI Data Table [FACP]
  *
@@ -13,9 +13,9 @@
 [000h 0000   4]                    Signature : "FACP"    [Fixed ACPI Description Table (FADT)]
 [004h 0004   4]                 Table Length : 000000F4
 [008h 0008   1]                     Revision : 03
-[009h 0009   1]                     Checksum : 1F
+[009h 0009   1]                     Checksum : B9
 [00Ah 0010   6]                       Oem ID : "BOCHS "
-[010h 0016   8]                 Oem Table ID : "BXPCFACP"
+[010h 0016   8]                 Oem Table ID : "BXPC    "
 [018h 0024   4]                 Oem Revision : 00000001
 [01Ch 0028   4]              Asl Compiler ID : "BXPC"
 [020h 0032   4]        Asl Compiler Revision : 00000001

Table tests/data/acpi/q35/APIC.tis diff:
@@ -3,7 +3,7 @@
  * AML/ASL+ Disassembler version 20200326 (64-bit version)
  * Copyright (c) 2000 - 2020 Intel Corporation
  *
- * Disassembly of tests/data/acpi/q35/APIC, Mon Jan 18 23:58:55 2021
+ * Disassembly of /tmp/aml-3C7EX0, Mon Jan 18 23:58:55 2021
  *
  * ACPI Data Table [APIC]
  *
@@ -13,9 +13,9 @@
 [000h 0000   4]                    Signature : "APIC"    [Multiple APIC Description Table (MADT)]
 [004h 0004   4]                 Table Length : 00000078
 [008h 0008   1]                     Revision : 01
-[009h 0009   1]                     Checksum : ED
+[009h 0009   1]                     Checksum : 8A
 [00Ah 0010   6]                       Oem ID : "BOCHS "
-[010h 0016   8]                 Oem Table ID : "BXPCAPIC"
+[010h 0016   8]                 Oem Table ID : "BXPC    "
 [018h 0024   4]                 Oem Revision : 00000001
 [01Ch 0028   4]              Asl Compiler ID : "BXPC"
 [020h 0032   4]        Asl Compiler Revision : 00000001

Table tests/data/acpi/q35/HPET.tis diff:
@@ -3,7 +3,7 @@
  * AML/ASL+ Disassembler version 20200326 (64-bit version)
  * Copyright (c) 2000 - 2020 Intel Corporation
  *
- * Disassembly of tests/data/acpi/q35/HPET, Mon Jan 18 23:58:55 2021
+ * Disassembly of /tmp/aml-0C7EX0, Mon Jan 18 23:58:55 2021
  *
  * ACPI Data Table [HPET]
  *
@@ -13,9 +13,9 @@
 [000h 0000   4]                    Signature : "HPET"    [High Precision Event Timer table]
 [004h 0004   4]                 Table Length : 00000038
 [008h 0008   1]                     Revision : 01
-[009h 0009   1]                     Checksum : 03
+[009h 0009   1]                     Checksum : B4
 [00Ah 0010   6]                       Oem ID : "BOCHS "
-[010h 0016   8]                 Oem Table ID : "BXPCHPET"
+[010h 0016   8]                 Oem Table ID : "BXPC    "
 [018h 0024   4]                 Oem Revision : 00000001
 [01Ch 0028   4]              Asl Compiler ID : "BXPC"
 [020h 0032   4]        Asl Compiler Revision : 00000001

Table tests/data/acpi/q35/TPM2.tis diff:
@@ -3,7 +3,7 @@
  * AML/ASL+ Disassembler version 20200326 (64-bit version)
  * Copyright (c) 2000 - 2020 Intel Corporation
  *
- * Disassembly of tests/data/acpi/q35/TPM2.tis, Mon Jan 18 23:58:55 2021
+ * Disassembly of /tmp/aml-ZC7EX0, Mon Jan 18 23:58:55 2021
  *
  * ACPI Data Table [TPM2]
  *
@@ -13,9 +13,9 @@
 [000h 0000   4]                    Signature : "TPM2"    [Trusted Platform Module hardware interface table]
 [004h 0004   4]                 Table Length : 0000004C
 [008h 0008   1]                     Revision : 04
-[009h 0009   1]                     Checksum : 72
+[009h 0009   1]                     Checksum : 15
 [00Ah 0010   6]                       Oem ID : "BOCHS "
-[010h 0016   8]                 Oem Table ID : "BXPCTPM2"
+[010h 0016   8]                 Oem Table ID : "BXPC    "
 [018h 0024   4]                 Oem Revision : 00000001
 [01Ch 0028   4]              Asl Compiler ID : "BXPC"
 [020h 0032   4]        Asl Compiler Revision : 00000001

Table tests/data/acpi/q35/MCFG.tis diff:
@@ -3,7 +3,7 @@
  * AML/ASL+ Disassembler version 20200326 (64-bit version)
  * Copyright (c) 2000 - 2020 Intel Corporation
  *
- * Disassembly of tests/data/acpi/q35/MCFG, Mon Jan 18 23:58:55 2021
+ * Disassembly of /tmp/aml-XC7EX0, Mon Jan 18 23:58:55 2021
  *
  * ACPI Data Table [MCFG]
  *
@@ -13,9 +13,9 @@
 [000h 0000   4]                    Signature : "MCFG"    [Memory Mapped Configuration table]
 [004h 0004   4]                 Table Length : 0000003C
 [008h 0008   1]                     Revision : 01
-[009h 0009   1]                     Checksum : EF
+[009h 0009   1]                     Checksum : 8C
 [00Ah 0010   6]                       Oem ID : "BOCHS "
-[010h 0016   8]                 Oem Table ID : "BXPCMCFG"
+[010h 0016   8]                 Oem Table ID : "BXPC    "
 [018h 0024   4]                 Oem Revision : 00000001
 [01Ch 0028   4]              Asl Compiler ID : "BXPC"
 [020h 0032   4]        Asl Compiler Revision : 00000001

Table tests/data/acpi/q35/WAET.tis diff:
@@ -3,7 +3,7 @@
  * AML/ASL+ Disassembler version 20200326 (64-bit version)
  * Copyright (c) 2000 - 2020 Intel Corporation
  *
- * Disassembly of tests/data/acpi/q35/WAET, Mon Jan 18 23:58:55 2021
+ * Disassembly of /tmp/aml-VC7EX0, Mon Jan 18 23:58:55 2021
  *
  * ACPI Data Table [WAET]
  *
@@ -13,9 +13,9 @@
 [000h 0000   4]                    Signature : "WAET"    [Windows ACPI Emulated Devices Table]
 [004h 0004   4]                 Table Length : 00000028
 [008h 0008   1]                     Revision : 01
-[009h 0009   1]                     Checksum : 88
+[009h 0009   1]                     Checksum : 39
 [00Ah 0010   6]                       Oem ID : "BOCHS "
-[010h 0016   8]                 Oem Table ID : "BXPCWAET"
+[010h 0016   8]                 Oem Table ID : "BXPC    "
 [018h 0024   4]                 Oem Revision : 00000001
 [01Ch 0028   4]              Asl Compiler ID : "BXPC"
 [020h 0032   4]        Asl Compiler Revision : 00000001

Table tests/data/acpi/q35/DSDT.tis diff:
@@ -5,20 +5,20 @@
  *
  * Disassembling to symbolic ASL+ operators
  *
- * Disassembly of tests/data/acpi/q35/DSDT.tis, Mon Jan 18 23:58:55 2021
+ * Disassembly of /tmp/aml-RC7EX0, Mon Jan 18 23:58:55 2021
  *
  * Original Table Header:
  *     Signature        "DSDT"
  *     Length           0x000020D7 (8407)
  *     Revision         0x01 **** 32-bit table (V1), no 64-bit math support
- *     Checksum         0xC8
+ *     Checksum         0x77
  *     OEM ID           "BOCHS "
- *     OEM Table ID     "BXPCDSDT"
+ *     OEM Table ID     "BXPC    "
  *     OEM Revision     0x00000001 (1)
  *     Compiler ID      "BXPC"
  *     Compiler Version 0x00000001 (1)
  */
-DefinitionBlock ("", "DSDT", 1, "BOCHS ", "BXPCDSDT", 0x00000001)
+DefinitionBlock ("", "DSDT", 1, "BOCHS ", "BXPC    ", 0x00000001)
 {
     Scope (\)
     {

Table tests/data/acpi/q35/FACP.bridge diff:
@@ -3,7 +3,7 @@
  * AML/ASL+ Disassembler version 20200326 (64-bit version)
  * Copyright (c) 2000 - 2020 Intel Corporation
  *
- * Disassembly of tests/data/acpi/q35/FACP, Mon Jan 18 23:58:55 2021
+ * Disassembly of /tmp/aml-3N7NX0, Mon Jan 18 23:58:55 2021
  *
  * ACPI Data Table [FACP]
  *
@@ -13,9 +13,9 @@
 [000h 0000   4]                    Signature : "FACP"    [Fixed ACPI Description Table (FADT)]
 [004h 0004   4]                 Table Length : 000000F4
 [008h 0008   1]                     Revision : 03
-[009h 0009   1]                     Checksum : 1F
+[009h 0009   1]                     Checksum : B9
 [00Ah 0010   6]                       Oem ID : "BOCHS "
-[010h 0016   8]                 Oem Table ID : "BXPCFACP"
+[010h 0016   8]                 Oem Table ID : "BXPC    "
 [018h 0024   4]                 Oem Revision : 00000001
 [01Ch 0028   4]              Asl Compiler ID : "BXPC"
 [020h 0032   4]        Asl Compiler Revision : 00000001

Table tests/data/acpi/q35/APIC.bridge diff:
@@ -3,7 +3,7 @@
  * AML/ASL+ Disassembler version 20200326 (64-bit version)
  * Copyright (c) 2000 - 2020 Intel Corporation
  *
- * Disassembly of tests/data/acpi/q35/APIC, Mon Jan 18 23:58:55 2021
+ * Disassembly of /tmp/aml-WN7NX0, Mon Jan 18 23:58:55 2021
  *
  * ACPI Data Table [APIC]
  *
@@ -13,9 +13,9 @@
 [000h 0000   4]                    Signature : "APIC"    [Multiple APIC Description Table (MADT)]
 [004h 0004   4]                 Table Length : 00000078
 [008h 0008   1]                     Revision : 01
-[009h 0009   1]                     Checksum : ED
+[009h 0009   1]                     Checksum : 8A
 [00Ah 0010   6]                       Oem ID : "BOCHS "
-[010h 0016   8]                 Oem Table ID : "BXPCAPIC"
+[010h 0016   8]                 Oem Table ID : "BXPC    "
 [018h 0024   4]                 Oem Revision : 00000001
 [01Ch 0028   4]              Asl Compiler ID : "BXPC"
 [020h 0032   4]        Asl Compiler Revision : 00000001

Table tests/data/acpi/q35/HPET.bridge diff:
@@ -3,7 +3,7 @@
  * AML/ASL+ Disassembler version 20200326 (64-bit version)
  * Copyright (c) 2000 - 2020 Intel Corporation
  *
- * Disassembly of tests/data/acpi/q35/HPET, Mon Jan 18 23:58:55 2021
+ * Disassembly of /tmp/aml-DI7NX0, Mon Jan 18 23:58:55 2021
  *
  * ACPI Data Table [HPET]
  *
@@ -13,9 +13,9 @@
 [000h 0000   4]                    Signature : "HPET"    [High Precision Event Timer table]
 [004h 0004   4]                 Table Length : 00000038
 [008h 0008   1]                     Revision : 01
-[009h 0009   1]                     Checksum : 03
+[009h 0009   1]                     Checksum : B4
 [00Ah 0010   6]                       Oem ID : "BOCHS "
-[010h 0016   8]                 Oem Table ID : "BXPCHPET"
+[010h 0016   8]                 Oem Table ID : "BXPC    "
 [018h 0024   4]                 Oem Revision : 00000001
 [01Ch 0028   4]              Asl Compiler ID : "BXPC"
 [020h 0032   4]        Asl Compiler Revision : 00000001

Table tests/data/acpi/q35/MCFG.bridge diff:
@@ -3,7 +3,7 @@
  * AML/ASL+ Disassembler version 20200326 (64-bit version)
  * Copyright (c) 2000 - 2020 Intel Corporation
  *
- * Disassembly of tests/data/acpi/q35/MCFG, Mon Jan 18 23:58:55 2021
+ * Disassembly of /tmp/aml-BI7NX0, Mon Jan 18 23:58:55 2021
  *
  * ACPI Data Table [MCFG]
  *
@@ -13,9 +13,9 @@
 [000h 0000   4]                    Signature : "MCFG"    [Memory Mapped Configuration table]
 [004h 0004   4]                 Table Length : 0000003C
 [008h 0008   1]                     Revision : 01
-[009h 0009   1]                     Checksum : EF
+[009h 0009   1]                     Checksum : 8C
 [00Ah 0010   6]                       Oem ID : "BOCHS "
-[010h 0016   8]                 Oem Table ID : "BXPCMCFG"
+[010h 0016   8]                 Oem Table ID : "BXPC    "
 [018h 0024   4]                 Oem Revision : 00000001
 [01Ch 0028   4]              Asl Compiler ID : "BXPC"
 [020h 0032   4]        Asl Compiler Revision : 00000001

Table tests/data/acpi/q35/WAET.bridge diff:
@@ -3,7 +3,7 @@
  * AML/ASL+ Disassembler version 20200326 (64-bit version)
  * Copyright (c) 2000 - 2020 Intel Corporation
  *
- * Disassembly of tests/data/acpi/q35/WAET, Mon Jan 18 23:58:55 2021
+ * Disassembly of /tmp/aml-9H7NX0, Mon Jan 18 23:58:55 2021
  *
  * ACPI Data Table [WAET]
  *
@@ -13,9 +13,9 @@
 [000h 0000   4]                    Signature : "WAET"    [Windows ACPI Emulated Devices Table]
 [004h 0004   4]                 Table Length : 00000028
 [008h 0008   1]                     Revision : 01
-[009h 0009   1]                     Checksum : 88
+[009h 0009   1]                     Checksum : 39
 [00Ah 0010   6]                       Oem ID : "BOCHS "
-[010h 0016   8]                 Oem Table ID : "BXPCWAET"
+[010h 0016   8]                 Oem Table ID : "BXPC    "
 [018h 0024   4]                 Oem Revision : 00000001
 [01Ch 0028   4]              Asl Compiler ID : "BXPC"
 [020h 0032   4]        Asl Compiler Revision : 00000001

Table tests/data/acpi/q35/DSDT.bridge diff:
@@ -5,20 +5,20 @@
  *
  * Disassembling to symbolic ASL+ operators
  *
- * Disassembly of tests/data/acpi/q35/DSDT.bridge, Mon Jan 18 23:58:55 2021
+ * Disassembly of /tmp/aml-6H7NX0, Mon Jan 18 23:58:55 2021
  *
  * Original Table Header:
  *     Signature        "DSDT"
  *     Length           0x00001E8B (7819)
  *     Revision         0x01 **** 32-bit table (V1), no 64-bit math support
- *     Checksum         0x8F
+ *     Checksum         0x3E
  *     OEM ID           "BOCHS "
- *     OEM Table ID     "BXPCDSDT"
+ *     OEM Table ID     "BXPC    "
  *     OEM Revision     0x00000001 (1)
  *     Compiler ID      "BXPC"
  *     Compiler Version 0x00000001 (1)
  */
-DefinitionBlock ("", "DSDT", 1, "BOCHS ", "BXPCDSDT", 0x00000001)
+DefinitionBlock ("", "DSDT", 1, "BOCHS ", "BXPC    ", 0x00000001)
 {
     Scope (\)
     {

Table tests/data/acpi/q35/FACP.mmio64 diff:
@@ -3,7 +3,7 @@
  * AML/ASL+ Disassembler version 20200326 (64-bit version)
  * Copyright (c) 2000 - 2020 Intel Corporation
  *
- * Disassembly of tests/data/acpi/q35/FACP, Mon Jan 18 23:58:56 2021
+ * Disassembly of /tmp/aml-KW0GX0, Mon Jan 18 23:58:56 2021
  *
  * ACPI Data Table [FACP]
  *
@@ -13,9 +13,9 @@
 [000h 0000   4]                    Signature : "FACP"    [Fixed ACPI Description Table (FADT)]
 [004h 0004   4]                 Table Length : 000000F4
 [008h 0008   1]                     Revision : 03
-[009h 0009   1]                     Checksum : 1F
+[009h 0009   1]                     Checksum : B9
 [00Ah 0010   6]                       Oem ID : "BOCHS "
-[010h 0016   8]                 Oem Table ID : "BXPCFACP"
+[010h 0016   8]                 Oem Table ID : "BXPC    "
 [018h 0024   4]                 Oem Revision : 00000001
 [01Ch 0028   4]              Asl Compiler ID : "BXPC"
 [020h 0032   4]        Asl Compiler Revision : 00000001

Table tests/data/acpi/q35/APIC.mmio64 diff:
@@ -3,7 +3,7 @@
  * AML/ASL+ Disassembler version 20200326 (64-bit version)
  * Copyright (c) 2000 - 2020 Intel Corporation
  *
- * Disassembly of tests/data/acpi/q35/APIC, Mon Jan 18 23:58:56 2021
+ * Disassembly of /tmp/aml-HR0GX0, Mon Jan 18 23:58:56 2021
  *
  * ACPI Data Table [APIC]
  *
@@ -13,9 +13,9 @@
 [000h 0000   4]                    Signature : "APIC"    [Multiple APIC Description Table (MADT)]
 [004h 0004   4]                 Table Length : 00000078
 [008h 0008   1]                     Revision : 01
-[009h 0009   1]                     Checksum : ED
+[009h 0009   1]                     Checksum : 8A
 [00Ah 0010   6]                       Oem ID : "BOCHS "
-[010h 0016   8]                 Oem Table ID : "BXPCAPIC"
+[010h 0016   8]                 Oem Table ID : "BXPC    "
 [018h 0024   4]                 Oem Revision : 00000001
 [01Ch 0028   4]              Asl Compiler ID : "BXPC"
 [020h 0032   4]        Asl Compiler Revision : 00000001

Table tests/data/acpi/q35/HPET.mmio64 diff:
@@ -3,7 +3,7 @@
  * AML/ASL+ Disassembler version 20200326 (64-bit version)
  * Copyright (c) 2000 - 2020 Intel Corporation
  *
- * Disassembly of tests/data/acpi/q35/HPET, Mon Jan 18 23:58:56 2021
+ * Disassembly of /tmp/aml-LR0GX0, Mon Jan 18 23:58:56 2021
  *
  * ACPI Data Table [HPET]
  *
@@ -13,9 +13,9 @@
 [000h 0000   4]                    Signature : "HPET"    [High Precision Event Timer table]
 [004h 0004   4]                 Table Length : 00000038
 [008h 0008   1]                     Revision : 01
-[009h 0009   1]                     Checksum : 03
+[009h 0009   1]                     Checksum : B4
 [00Ah 0010   6]                       Oem ID : "BOCHS "
-[010h 0016   8]                 Oem Table ID : "BXPCHPET"
+[010h 0016   8]                 Oem Table ID : "BXPC    "
 [018h 0024   4]                 Oem Revision : 00000001
 [01Ch 0028   4]              Asl Compiler ID : "BXPC"
 [020h 0032   4]        Asl Compiler Revision : 00000001

Table tests/data/acpi/q35/SRAT.mmio64 diff:
@@ -3,7 +3,7 @@
  * AML/ASL+ Disassembler version 20200326 (64-bit version)
  * Copyright (c) 2000 - 2020 Intel Corporation
  *
- * Disassembly of tests/data/acpi/q35/SRAT.mmio64, Mon Jan 18 23:58:56 2021
+ * Disassembly of /tmp/aml-OR0GX0, Mon Jan 18 23:58:56 2021
  *
  * ACPI Data Table [SRAT]
  *
@@ -13,9 +13,9 @@
 [000h 0000   4]                    Signature : "SRAT"    [System Resource Affinity Table]
 [004h 0004   4]                 Table Length : 000000E0
 [008h 0008   1]                     Revision : 01
-[009h 0009   1]                     Checksum : 3B
+[009h 0009   1]                     Checksum : F5
 [00Ah 0010   6]                       Oem ID : "BOCHS "
-[010h 0016   8]                 Oem Table ID : "BXPCSRAT"
+[010h 0016   8]                 Oem Table ID : "BXPC    "
 [018h 0024   4]                 Oem Revision : 00000001
 [01Ch 0028   4]              Asl Compiler ID : "BXPC"
 [020h 0032   4]        Asl Compiler Revision : 00000001

Table tests/data/acpi/q35/MCFG.mmio64 diff:
@@ -3,7 +3,7 @@
  * AML/ASL+ Disassembler version 20200326 (64-bit version)
  * Copyright (c) 2000 - 2020 Intel Corporation
  *
- * Disassembly of tests/data/acpi/q35/MCFG, Mon Jan 18 23:58:56 2021
+ * Disassembly of /tmp/aml-TR0GX0, Mon Jan 18 23:58:56 2021
  *
  * ACPI Data Table [MCFG]
  *
@@ -13,9 +13,9 @@
 [000h 0000   4]                    Signature : "MCFG"    [Memory Mapped Configuration table]
 [004h 0004   4]                 Table Length : 0000003C
 [008h 0008   1]                     Revision : 01
-[009h 0009   1]                     Checksum : EF
+[009h 0009   1]                     Checksum : 8C
 [00Ah 0010   6]                       Oem ID : "BOCHS "
-[010h 0016   8]                 Oem Table ID : "BXPCMCFG"
+[010h 0016   8]                 Oem Table ID : "BXPC    "
 [018h 0024   4]                 Oem Revision : 00000001
 [01Ch 0028   4]              Asl Compiler ID : "BXPC"
 [020h 0032   4]        Asl Compiler Revision : 00000001

Table tests/data/acpi/q35/WAET.mmio64 diff:
@@ -3,7 +3,7 @@
  * AML/ASL+ Disassembler version 20200326 (64-bit version)
  * Copyright (c) 2000 - 2020 Intel Corporation
  *
- * Disassembly of tests/data/acpi/q35/WAET, Mon Jan 18 23:58:56 2021
+ * Disassembly of /tmp/aml-ZR0GX0, Mon Jan 18 23:58:56 2021
  *
  * ACPI Data Table [WAET]
  *
@@ -13,9 +13,9 @@
 [000h 0000   4]                    Signature : "WAET"    [Windows ACPI Emulated Devices Table]
 [004h 0004   4]                 Table Length : 00000028
 [008h 0008   1]                     Revision : 01
-[009h 0009   1]                     Checksum : 88
+[009h 0009   1]                     Checksum : 39
 [00Ah 0010   6]                       Oem ID : "BOCHS "
-[010h 0016   8]                 Oem Table ID : "BXPCWAET"
+[010h 0016   8]                 Oem Table ID : "BXPC    "
 [018h 0024   4]                 Oem Revision : 00000001
 [01Ch 0028   4]              Asl Compiler ID : "BXPC"
 [020h 0032   4]        Asl Compiler Revision : 00000001

Table tests/data/acpi/q35/DSDT.mmio64 diff:
@@ -5,20 +5,20 @@
  *
  * Disassembling to symbolic ASL+ operators
  *
- * Disassembly of tests/data/acpi/q35/DSDT.mmio64, Mon Jan 18 23:58:56 2021
+ * Disassembly of /tmp/aml-7R0GX0, Mon Jan 18 23:58:56 2021
  *
  * Original Table Header:
  *     Signature        "DSDT"
  *     Length           0x000022E4 (8932)
  *     Revision         0x01 **** 32-bit table (V1), no 64-bit math support
- *     Checksum         0x9D
+ *     Checksum         0x4C
  *     OEM ID           "BOCHS "
- *     OEM Table ID     "BXPCDSDT"
+ *     OEM Table ID     "BXPC    "
  *     OEM Revision     0x00000001 (1)
  *     Compiler ID      "BXPC"
  *     Compiler Version 0x00000001 (1)
  */
-DefinitionBlock ("", "DSDT", 1, "BOCHS ", "BXPCDSDT", 0x00000001)
+DefinitionBlock ("", "DSDT", 1, "BOCHS ", "BXPC    ", 0x00000001)
 {
     Scope (\)
     {

Table tests/data/acpi/q35/FACP.ipmibt diff:
@@ -3,7 +3,7 @@
  * AML/ASL+ Disassembler version 20200326 (64-bit version)
  * Copyright (c) 2000 - 2020 Intel Corporation
  *
- * Disassembly of tests/data/acpi/q35/FACP, Mon Jan 18 23:58:56 2021
+ * Disassembly of /tmp/aml-VVX8W0, Mon Jan 18 23:58:56 2021
  *
  * ACPI Data Table [FACP]
  *
@@ -13,9 +13,9 @@
 [000h 0000   4]                    Signature : "FACP"    [Fixed ACPI Description Table (FADT)]
 [004h 0004   4]                 Table Length : 000000F4
 [008h 0008   1]                     Revision : 03
-[009h 0009   1]                     Checksum : 1F
+[009h 0009   1]                     Checksum : B9
 [00Ah 0010   6]                       Oem ID : "BOCHS "
-[010h 0016   8]                 Oem Table ID : "BXPCFACP"
+[010h 0016   8]                 Oem Table ID : "BXPC    "
 [018h 0024   4]                 Oem Revision : 00000001
 [01Ch 0028   4]              Asl Compiler ID : "BXPC"
 [020h 0032   4]        Asl Compiler Revision : 00000001

Table tests/data/acpi/q35/APIC.ipmibt diff:
@@ -3,7 +3,7 @@
  * AML/ASL+ Disassembler version 20200326 (64-bit version)
  * Copyright (c) 2000 - 2020 Intel Corporation
  *
- * Disassembly of tests/data/acpi/q35/APIC, Mon Jan 18 23:58:56 2021
+ * Disassembly of /tmp/aml-GUX8W0, Mon Jan 18 23:58:56 2021
  *
  * ACPI Data Table [APIC]
  *
@@ -13,9 +13,9 @@
 [000h 0000   4]                    Signature : "APIC"    [Multiple APIC Description Table (MADT)]
 [004h 0004   4]                 Table Length : 00000078
 [008h 0008   1]                     Revision : 01
-[009h 0009   1]                     Checksum : ED
+[009h 0009   1]                     Checksum : 8A
 [00Ah 0010   6]                       Oem ID : "BOCHS "
-[010h 0016   8]                 Oem Table ID : "BXPCAPIC"
+[010h 0016   8]                 Oem Table ID : "BXPC    "
 [018h 0024   4]                 Oem Revision : 00000001
 [01Ch 0028   4]              Asl Compiler ID : "BXPC"
 [020h 0032   4]        Asl Compiler Revision : 00000001

Table tests/data/acpi/q35/HPET.ipmibt diff:
@@ -3,7 +3,7 @@
  * AML/ASL+ Disassembler version 20200326 (64-bit version)
  * Copyright (c) 2000 - 2020 Intel Corporation
  *
- * Disassembly of tests/data/acpi/q35/HPET, Mon Jan 18 23:58:56 2021
+ * Disassembly of /tmp/aml-LUX8W0, Mon Jan 18 23:58:56 2021
  *
  * ACPI Data Table [HPET]
  *
@@ -13,9 +13,9 @@
 [000h 0000   4]                    Signature : "HPET"    [High Precision Event Timer table]
 [004h 0004   4]                 Table Length : 00000038
 [008h 0008   1]                     Revision : 01
-[009h 0009   1]                     Checksum : 03
+[009h 0009   1]                     Checksum : B4
 [00Ah 0010   6]                       Oem ID : "BOCHS "
-[010h 0016   8]                 Oem Table ID : "BXPCHPET"
+[010h 0016   8]                 Oem Table ID : "BXPC    "
 [018h 0024   4]                 Oem Revision : 00000001
 [01Ch 0028   4]              Asl Compiler ID : "BXPC"
 [020h 0032   4]        Asl Compiler Revision : 00000001

Table tests/data/acpi/q35/MCFG.ipmibt diff:
@@ -3,7 +3,7 @@
  * AML/ASL+ Disassembler version 20200326 (64-bit version)
  * Copyright (c) 2000 - 2020 Intel Corporation
  *
- * Disassembly of tests/data/acpi/q35/MCFG, Mon Jan 18 23:58:56 2021
+ * Disassembly of /tmp/aml-QUX8W0, Mon Jan 18 23:58:56 2021
  *
  * ACPI Data Table [MCFG]
  *
@@ -13,9 +13,9 @@
 [000h 0000   4]                    Signature : "MCFG"    [Memory Mapped Configuration table]
 [004h 0004   4]                 Table Length : 0000003C
 [008h 0008   1]                     Revision : 01
-[009h 0009   1]                     Checksum : EF
+[009h 0009   1]                     Checksum : 8C
 [00Ah 0010   6]                       Oem ID : "BOCHS "
-[010h 0016   8]                 Oem Table ID : "BXPCMCFG"
+[010h 0016   8]                 Oem Table ID : "BXPC    "
 [018h 0024   4]                 Oem Revision : 00000001
 [01Ch 0028   4]              Asl Compiler ID : "BXPC"
 [020h 0032   4]        Asl Compiler Revision : 00000001

Table tests/data/acpi/q35/WAET.ipmibt diff:
@@ -3,7 +3,7 @@
  * AML/ASL+ Disassembler version 20200326 (64-bit version)
  * Copyright (c) 2000 - 2020 Intel Corporation
  *
- * Disassembly of tests/data/acpi/q35/WAET, Mon Jan 18 23:58:56 2021
+ * Disassembly of /tmp/aml-VUX8W0, Mon Jan 18 23:58:56 2021
  *
  * ACPI Data Table [WAET]
  *
@@ -13,9 +13,9 @@
 [000h 0000   4]                    Signature : "WAET"    [Windows ACPI Emulated Devices Table]
 [004h 0004   4]                 Table Length : 00000028
 [008h 0008   1]                     Revision : 01
-[009h 0009   1]                     Checksum : 88
+[009h 0009   1]                     Checksum : 39
 [00Ah 0010   6]                       Oem ID : "BOCHS "
-[010h 0016   8]                 Oem Table ID : "BXPCWAET"
+[010h 0016   8]                 Oem Table ID : "BXPC    "
 [018h 0024   4]                 Oem Revision : 00000001
 [01Ch 0028   4]              Asl Compiler ID : "BXPC"
 [020h 0032   4]        Asl Compiler Revision : 00000001

Table tests/data/acpi/q35/DSDT.ipmibt diff:
@@ -5,20 +5,20 @@
  *
  * Disassembling to symbolic ASL+ operators
  *
- * Disassembly of tests/data/acpi/q35/DSDT.ipmibt, Mon Jan 18 23:58:56 2021
+ * Disassembly of /tmp/aml-3UX8W0, Mon Jan 18 23:58:56 2021
  *
  * Original Table Header:
  *     Signature        "DSDT"
  *     Length           0x00001EC4 (7876)
  *     Revision         0x01 **** 32-bit table (V1), no 64-bit math support
- *     Checksum         0x2A
+ *     Checksum         0xD9
  *     OEM ID           "BOCHS "
- *     OEM Table ID     "BXPCDSDT"
+ *     OEM Table ID     "BXPC    "
  *     OEM Revision     0x00000001 (1)
  *     Compiler ID      "BXPC"
  *     Compiler Version 0x00000001 (1)
  */
-DefinitionBlock ("", "DSDT", 1, "BOCHS ", "BXPCDSDT", 0x00000001)
+DefinitionBlock ("", "DSDT", 1, "BOCHS ", "BXPC    ", 0x00000001)
 {
     Scope (\)
     {

Table tests/data/acpi/q35/FACP.cphp diff:
@@ -3,7 +3,7 @@
  * AML/ASL+ Disassembler version 20200326 (64-bit version)
  * Copyright (c) 2000 - 2020 Intel Corporation
  *
- * Disassembly of tests/data/acpi/q35/FACP, Mon Jan 18 23:58:56 2021
+ * Disassembly of /tmp/aml-2HJNX0, Mon Jan 18 23:58:56 2021
  *
  * ACPI Data Table [FACP]
  *
@@ -13,9 +13,9 @@
 [000h 0000   4]                    Signature : "FACP"    [Fixed ACPI Description Table (FADT)]
 [004h 0004   4]                 Table Length : 000000F4
 [008h 0008   1]                     Revision : 03
-[009h 0009   1]                     Checksum : 1F
+[009h 0009   1]                     Checksum : B9
 [00Ah 0010   6]                       Oem ID : "BOCHS "
-[010h 0016   8]                 Oem Table ID : "BXPCFACP"
+[010h 0016   8]                 Oem Table ID : "BXPC    "
 [018h 0024   4]                 Oem Revision : 00000001
 [01Ch 0028   4]              Asl Compiler ID : "BXPC"
 [020h 0032   4]        Asl Compiler Revision : 00000001

Table tests/data/acpi/q35/APIC.cphp diff:
@@ -3,7 +3,7 @@
  * AML/ASL+ Disassembler version 20200326 (64-bit version)
  * Copyright (c) 2000 - 2020 Intel Corporation
  *
- * Disassembly of tests/data/acpi/q35/APIC.cphp, Mon Jan 18 23:58:56 2021
+ * Disassembly of /tmp/aml-ARJNX0, Mon Jan 18 23:58:56 2021
  *
  * ACPI Data Table [APIC]
  *
@@ -13,9 +13,9 @@
 [000h 0000   4]                    Signature : "APIC"    [Multiple APIC Description Table (MADT)]
 [004h 0004   4]                 Table Length : 000000A0
 [008h 0008   1]                     Revision : 01
-[009h 0009   1]                     Checksum : 7B
+[009h 0009   1]                     Checksum : 18
 [00Ah 0010   6]                       Oem ID : "BOCHS "
-[010h 0016   8]                 Oem Table ID : "BXPCAPIC"
+[010h 0016   8]                 Oem Table ID : "BXPC    "
 [018h 0024   4]                 Oem Revision : 00000001
 [01Ch 0028   4]              Asl Compiler ID : "BXPC"
 [020h 0032   4]        Asl Compiler Revision : 00000001

Table tests/data/acpi/q35/HPET.cphp diff:
@@ -3,7 +3,7 @@
  * AML/ASL+ Disassembler version 20200326 (64-bit version)
  * Copyright (c) 2000 - 2020 Intel Corporation
  *
- * Disassembly of tests/data/acpi/q35/HPET, Mon Jan 18 23:58:56 2021
+ * Disassembly of /tmp/aml-ERJNX0, Mon Jan 18 23:58:56 2021
  *
  * ACPI Data Table [HPET]
  *
@@ -13,9 +13,9 @@
 [000h 0000   4]                    Signature : "HPET"    [High Precision Event Timer table]
 [004h 0004   4]                 Table Length : 00000038
 [008h 0008   1]                     Revision : 01
-[009h 0009   1]                     Checksum : 03
+[009h 0009   1]                     Checksum : B4
 [00Ah 0010   6]                       Oem ID : "BOCHS "
-[010h 0016   8]                 Oem Table ID : "BXPCHPET"
+[010h 0016   8]                 Oem Table ID : "BXPC    "
 [018h 0024   4]                 Oem Revision : 00000001
 [01Ch 0028   4]              Asl Compiler ID : "BXPC"
 [020h 0032   4]        Asl Compiler Revision : 00000001

Table tests/data/acpi/q35/SRAT.cphp diff:
@@ -3,7 +3,7 @@
  * AML/ASL+ Disassembler version 20200326 (64-bit version)
  * Copyright (c) 2000 - 2020 Intel Corporation
  *
- * Disassembly of tests/data/acpi/q35/SRAT.cphp, Mon Jan 18 23:58:56 2021
+ * Disassembly of /tmp/aml-IRJNX0, Mon Jan 18 23:58:56 2021
  *
  * ACPI Data Table [SRAT]
  *
@@ -13,9 +13,9 @@
 [000h 0000   4]                    Signature : "SRAT"    [System Resource Affinity Table]
 [004h 0004   4]                 Table Length : 00000130
 [008h 0008   1]                     Revision : 01
-[009h 0009   1]                     Checksum : 36
+[009h 0009   1]                     Checksum : F0
 [00Ah 0010   6]                       Oem ID : "BOCHS "
-[010h 0016   8]                 Oem Table ID : "BXPCSRAT"
+[010h 0016   8]                 Oem Table ID : "BXPC    "
 [018h 0024   4]                 Oem Revision : 00000001
 [01Ch 0028   4]              Asl Compiler ID : "BXPC"
 [020h 0032   4]        Asl Compiler Revision : 00000001

Table tests/data/acpi/q35/SLIT.cphp diff:
@@ -3,7 +3,7 @@
  * AML/ASL+ Disassembler version 20200326 (64-bit version)
  * Copyright (c) 2000 - 2020 Intel Corporation
  *
- * Disassembly of tests/data/acpi/q35/SLIT.cphp, Mon Jan 18 23:58:56 2021
+ * Disassembly of /tmp/aml-MRJNX0, Mon Jan 18 23:58:56 2021
  *
  * ACPI Data Table [SLIT]
  *
@@ -13,9 +13,9 @@
 [000h 0000   4]                    Signature : "SLIT"    [System Locality Information Table]
 [004h 0004   4]                 Table Length : 00000030
 [008h 0008   1]                     Revision : 01
-[009h 0009   1]                     Checksum : 2C
+[009h 0009   1]                     Checksum : E8
 [00Ah 0010   6]                       Oem ID : "BOCHS "
-[010h 0016   8]                 Oem Table ID : "BXPCSLIT"
+[010h 0016   8]                 Oem Table ID : "BXPC    "
 [018h 0024   4]                 Oem Revision : 00000001
 [01Ch 0028   4]              Asl Compiler ID : "BXPC"
 [020h 0032   4]        Asl Compiler Revision : 00000001

Table tests/data/acpi/q35/MCFG.cphp diff:
@@ -3,7 +3,7 @@
  * AML/ASL+ Disassembler version 20200326 (64-bit version)
  * Copyright (c) 2000 - 2020 Intel Corporation
  *
- * Disassembly of tests/data/acpi/q35/MCFG, Mon Jan 18 23:58:56 2021
+ * Disassembly of /tmp/aml-PRJNX0, Mon Jan 18 23:58:56 2021
  *
  * ACPI Data Table [MCFG]
  *
@@ -13,9 +13,9 @@
 [000h 0000   4]                    Signature : "MCFG"    [Memory Mapped Configuration table]
 [004h 0004   4]                 Table Length : 0000003C
 [008h 0008   1]                     Revision : 01
-[009h 0009   1]                     Checksum : EF
+[009h 0009   1]                     Checksum : 8C
 [00Ah 0010   6]                       Oem ID : "BOCHS "
-[010h 0016   8]                 Oem Table ID : "BXPCMCFG"
+[010h 0016   8]                 Oem Table ID : "BXPC    "
 [018h 0024   4]                 Oem Revision : 00000001
 [01Ch 0028   4]              Asl Compiler ID : "BXPC"
 [020h 0032   4]        Asl Compiler Revision : 00000001

Table tests/data/acpi/q35/WAET.cphp diff:
@@ -3,7 +3,7 @@
  * AML/ASL+ Disassembler version 20200326 (64-bit version)
  * Copyright (c) 2000 - 2020 Intel Corporation
  *
- * Disassembly of tests/data/acpi/q35/WAET, Mon Jan 18 23:58:57 2021
+ * Disassembly of /tmp/aml-TRJNX0, Mon Jan 18 23:58:57 2021
  *
  * ACPI Data Table [WAET]
  *
@@ -13,9 +13,9 @@
 [000h 0000   4]                    Signature : "WAET"    [Windows ACPI Emulated Devices Table]
 [004h 0004   4]                 Table Length : 00000028
 [008h 0008   1]                     Revision : 01
-[009h 0009   1]                     Checksum : 88
+[009h 0009   1]                     Checksum : 39
 [00Ah 0010   6]                       Oem ID : "BOCHS "
-[010h 0016   8]                 Oem Table ID : "BXPCWAET"
+[010h 0016   8]                 Oem Table ID : "BXPC    "
 [018h 0024   4]                 Oem Revision : 00000001
 [01Ch 0028   4]              Asl Compiler ID : "BXPC"
 [020h 0032   4]        Asl Compiler Revision : 00000001

Table tests/data/acpi/q35/DSDT.cphp diff:
@@ -5,20 +5,20 @@
  *
  * Disassembling to symbolic ASL+ operators
  *
- * Disassembly of tests/data/acpi/q35/DSDT.cphp, Mon Jan 18 23:58:57 2021
+ * Disassembly of /tmp/aml-2RJNX0, Mon Jan 18 23:58:57 2021
  *
  * Original Table Header:
  *     Signature        "DSDT"
  *     Length           0x00002049 (8265)
  *     Revision         0x01 **** 32-bit table (V1), no 64-bit math support
- *     Checksum         0x5A
+ *     Checksum         0x09
  *     OEM ID           "BOCHS "
- *     OEM Table ID     "BXPCDSDT"
+ *     OEM Table ID     "BXPC    "
  *     OEM Revision     0x00000001 (1)
  *     Compiler ID      "BXPC"
  *     Compiler Version 0x00000001 (1)
  */
-DefinitionBlock ("", "DSDT", 1, "BOCHS ", "BXPCDSDT", 0x00000001)
+DefinitionBlock ("", "DSDT", 1, "BOCHS ", "BXPC    ", 0x00000001)
 {
     Scope (\)
     {

Table tests/data/acpi/q35/HPET.memhp diff:
@@ -3,7 +3,7 @@
  * AML/ASL+ Disassembler version 20200326 (64-bit version)
  * Copyright (c) 2000 - 2020 Intel Corporation
  *
- * Disassembly of tests/data/acpi/q35/HPET, Mon Jan 18 23:58:57 2021
+ * Disassembly of /tmp/aml-V1NBX0, Mon Jan 18 23:58:57 2021
  *
  * ACPI Data Table [HPET]
  *
@@ -13,9 +13,9 @@
 [000h 0000   4]                    Signature : "HPET"    [High Precision Event Timer table]
 [004h 0004   4]                 Table Length : 00000038
 [008h 0008   1]                     Revision : 01
-[009h 0009   1]                     Checksum : 03
+[009h 0009   1]                     Checksum : B4
 [00Ah 0010   6]                       Oem ID : "BOCHS "
-[010h 0016   8]                 Oem Table ID : "BXPCHPET"
+[010h 0016   8]                 Oem Table ID : "BXPC    "
 [018h 0024   4]                 Oem Revision : 00000001
 [01Ch 0028   4]              Asl Compiler ID : "BXPC"
 [020h 0032   4]        Asl Compiler Revision : 00000001

Table tests/data/acpi/q35/WAET.memhp diff:
@@ -3,7 +3,7 @@
  * AML/ASL+ Disassembler version 20200326 (64-bit version)
  * Copyright (c) 2000 - 2020 Intel Corporation
  *
- * Disassembly of tests/data/acpi/q35/WAET, Mon Jan 18 23:58:57 2021
+ * Disassembly of /tmp/aml-B2NBX0, Mon Jan 18 23:58:57 2021
  *
  * ACPI Data Table [WAET]
  *
@@ -13,9 +13,9 @@
 [000h 0000   4]                    Signature : "WAET"    [Windows ACPI Emulated Devices Table]
 [004h 0004   4]                 Table Length : 00000028
 [008h 0008   1]                     Revision : 01
-[009h 0009   1]                     Checksum : 88
+[009h 0009   1]                     Checksum : 39
 [00Ah 0010   6]                       Oem ID : "BOCHS "
-[010h 0016   8]                 Oem Table ID : "BXPCWAET"
+[010h 0016   8]                 Oem Table ID : "BXPC    "
 [018h 0024   4]                 Oem Revision : 00000001
 [01Ch 0028   4]              Asl Compiler ID : "BXPC"
 [020h 0032   4]        Asl Compiler Revision : 00000001

Table tests/data/acpi/q35/HPET.numamem diff:
@@ -3,7 +3,7 @@
  * AML/ASL+ Disassembler version 20200326 (64-bit version)
  * Copyright (c) 2000 - 2020 Intel Corporation
  *
- * Disassembly of tests/data/acpi/q35/HPET, Mon Jan 18 23:58:57 2021
+ * Disassembly of /tmp/aml-BJ6PX0, Mon Jan 18 23:58:57 2021
  *
  * ACPI Data Table [HPET]
  *
@@ -13,9 +13,9 @@
 [000h 0000   4]                    Signature : "HPET"    [High Precision Event Timer table]
 [004h 0004   4]                 Table Length : 00000038
 [008h 0008   1]                     Revision : 01
-[009h 0009   1]                     Checksum : 03
+[009h 0009   1]                     Checksum : B4
 [00Ah 0010   6]                       Oem ID : "BOCHS "
-[010h 0016   8]                 Oem Table ID : "BXPCHPET"
+[010h 0016   8]                 Oem Table ID : "BXPC    "
 [018h 0024   4]                 Oem Revision : 00000001
 [01Ch 0028   4]              Asl Compiler ID : "BXPC"
 [020h 0032   4]        Asl Compiler Revision : 00000001

Table tests/data/acpi/q35/WAET.numamem diff:
@@ -3,7 +3,7 @@
  * AML/ASL+ Disassembler version 20200326 (64-bit version)
  * Copyright (c) 2000 - 2020 Intel Corporation
  *
- * Disassembly of tests/data/acpi/q35/WAET, Mon Jan 18 23:58:57 2021
+ * Disassembly of /tmp/aml-UH6PX0, Mon Jan 18 23:58:57 2021
  *
  * ACPI Data Table [WAET]
  *
@@ -13,9 +13,9 @@
 [000h 0000   4]                    Signature : "WAET"    [Windows ACPI Emulated Devices Table]
 [004h 0004   4]                 Table Length : 00000028
 [008h 0008   1]                     Revision : 01
-[009h 0009   1]                     Checksum : 88
+[009h 0009   1]                     Checksum : 39
 [00Ah 0010   6]                       Oem ID : "BOCHS "
-[010h 0016   8]                 Oem Table ID : "BXPCWAET"
+[010h 0016   8]                 Oem Table ID : "BXPC    "
 [018h 0024   4]                 Oem Revision : 00000001
 [01Ch 0028   4]              Asl Compiler ID : "BXPC"
 [020h 0032   4]        Asl Compiler Revision : 00000001

Table tests/data/acpi/q35/FACP.dimmpxm diff:
@@ -3,7 +3,7 @@
  * AML/ASL+ Disassembler version 20200326 (64-bit version)
  * Copyright (c) 2000 - 2020 Intel Corporation
  *
- * Disassembly of tests/data/acpi/q35/FACP, Mon Jan 18 23:58:58 2021
+ * Disassembly of /tmp/aml-ITDEX0, Mon Jan 18 23:58:58 2021
  *
  * ACPI Data Table [FACP]
  *
@@ -13,9 +13,9 @@
 [000h 0000   4]                    Signature : "FACP"    [Fixed ACPI Description Table (FADT)]
 [004h 0004   4]                 Table Length : 000000F4
 [008h 0008   1]                     Revision : 03
-[009h 0009   1]                     Checksum : 1F
+[009h 0009   1]                     Checksum : B9
 [00Ah 0010   6]                       Oem ID : "BOCHS "
-[010h 0016   8]                 Oem Table ID : "BXPCFACP"
+[010h 0016   8]                 Oem Table ID : "BXPC    "
 [018h 0024   4]                 Oem Revision : 00000001
 [01Ch 0028   4]              Asl Compiler ID : "BXPC"
 [020h 0032   4]        Asl Compiler Revision : 00000001

Table tests/data/acpi/q35/APIC.dimmpxm diff:
@@ -3,7 +3,7 @@
  * AML/ASL+ Disassembler version 20200326 (64-bit version)
  * Copyright (c) 2000 - 2020 Intel Corporation
  *
- * Disassembly of tests/data/acpi/q35/APIC.dimmpxm, Mon Jan 18 23:58:58 2021
+ * Disassembly of /tmp/aml-STDEX0, Mon Jan 18 23:58:58 2021
  *
  * ACPI Data Table [APIC]
  *
@@ -13,9 +13,9 @@
 [000h 0000   4]                    Signature : "APIC"    [Multiple APIC Description Table (MADT)]
 [004h 0004   4]                 Table Length : 00000090
 [008h 0008   1]                     Revision : 01
-[009h 0009   1]                     Checksum : AE
+[009h 0009   1]                     Checksum : 4B
 [00Ah 0010   6]                       Oem ID : "BOCHS "
-[010h 0016   8]                 Oem Table ID : "BXPCAPIC"
+[010h 0016   8]                 Oem Table ID : "BXPC    "
 [018h 0024   4]                 Oem Revision : 00000001
 [01Ch 0028   4]              Asl Compiler ID : "BXPC"
 [020h 0032   4]        Asl Compiler Revision : 00000001

Table tests/data/acpi/q35/HPET.dimmpxm diff:
@@ -3,7 +3,7 @@
  * AML/ASL+ Disassembler version 20200326 (64-bit version)
  * Copyright (c) 2000 - 2020 Intel Corporation
  *
- * Disassembly of tests/data/acpi/q35/HPET, Mon Jan 18 23:58:58 2021
+ * Disassembly of /tmp/aml-WTDEX0, Mon Jan 18 23:58:58 2021
  *
  * ACPI Data Table [HPET]
  *
@@ -13,9 +13,9 @@
 [000h 0000   4]                    Signature : "HPET"    [High Precision Event Timer table]
 [004h 0004   4]                 Table Length : 00000038
 [008h 0008   1]                     Revision : 01
-[009h 0009   1]                     Checksum : 03
+[009h 0009   1]                     Checksum : B4
 [00Ah 0010   6]                       Oem ID : "BOCHS "
-[010h 0016   8]                 Oem Table ID : "BXPCHPET"
+[010h 0016   8]                 Oem Table ID : "BXPC    "
 [018h 0024   4]                 Oem Revision : 00000001
 [01Ch 0028   4]              Asl Compiler ID : "BXPC"
 [020h 0032   4]        Asl Compiler Revision : 00000001

Table tests/data/acpi/q35/SRAT.dimmpxm diff:
@@ -3,7 +3,7 @@
  * AML/ASL+ Disassembler version 20200326 (64-bit version)
  * Copyright (c) 2000 - 2020 Intel Corporation
  *
- * Disassembly of tests/data/acpi/q35/SRAT.dimmpxm, Mon Jan 18 23:58:58 2021
+ * Disassembly of /tmp/aml-XTJEX0, Mon Jan 18 23:58:58 2021
  *
  * ACPI Data Table [SRAT]
  *
@@ -13,9 +13,9 @@
 [000h 0000   4]                    Signature : "SRAT"    [System Resource Affinity Table]
 [004h 0004   4]                 Table Length : 00000188
 [008h 0008   1]                     Revision : 01
-[009h 0009   1]                     Checksum : 68
+[009h 0009   1]                     Checksum : 22
 [00Ah 0010   6]                       Oem ID : "BOCHS "
-[010h 0016   8]                 Oem Table ID : "BXPCSRAT"
+[010h 0016   8]                 Oem Table ID : "BXPC    "
 [018h 0024   4]                 Oem Revision : 00000001
 [01Ch 0028   4]              Asl Compiler ID : "BXPC"
 [020h 0032   4]        Asl Compiler Revision : 00000001

Table tests/data/acpi/q35/MCFG.dimmpxm diff:
@@ -3,7 +3,7 @@
  * AML/ASL+ Disassembler version 20200326 (64-bit version)
  * Copyright (c) 2000 - 2020 Intel Corporation
  *
- * Disassembly of tests/data/acpi/q35/MCFG, Mon Jan 18 23:58:58 2021
+ * Disassembly of /tmp/aml-0TDEX0, Mon Jan 18 23:58:58 2021
  *
  * ACPI Data Table [MCFG]
  *
@@ -13,9 +13,9 @@
 [000h 0000   4]                    Signature : "MCFG"    [Memory Mapped Configuration table]
 [004h 0004   4]                 Table Length : 0000003C
 [008h 0008   1]                     Revision : 01
-[009h 0009   1]                     Checksum : EF
+[009h 0009   1]                     Checksum : 8C
 [00Ah 0010   6]                       Oem ID : "BOCHS "
-[010h 0016   8]                 Oem Table ID : "BXPCMCFG"
+[010h 0016   8]                 Oem Table ID : "BXPC    "
 [018h 0024   4]                 Oem Revision : 00000001
 [01Ch 0028   4]              Asl Compiler ID : "BXPC"
 [020h 0032   4]        Asl Compiler Revision : 00000001

Table tests/data/acpi/q35/SSDT.dimmpxm diff:
@@ -5,20 +5,20 @@
  *
  * Disassembling to symbolic ASL+ operators
  *
- * Disassembly of tests/data/acpi/q35/SSDT.dimmpxm, Mon Jan 18 23:58:58 2021
+ * Disassembly of /tmp/aml-8TDEX0, Mon Jan 18 23:58:58 2021
  *
  * Original Table Header:
  *     Signature        "SSDT"
  *     Length           0x000002DE (734)
  *     Revision         0x01
- *     Checksum         0x46
+ *     Checksum         0x06
  *     OEM ID           "BOCHS "
- *     OEM Table ID     "NVDIMM"
+ *     OEM Table ID     "NVDIMM  "
  *     OEM Revision     0x00000001 (1)
  *     Compiler ID      "BXPC"
  *     Compiler Version 0x00000001 (1)
  */
-DefinitionBlock ("", "SSDT", 1, "BOCHS ", "NVDIMM", 0x00000001)
+DefinitionBlock ("", "SSDT", 1, "BOCHS ", "NVDIMM  ", 0x00000001)
 {
     Scope (\_SB)
     {

Table tests/data/acpi/q35/NFIT.dimmpxm diff:
@@ -3,7 +3,7 @@
  * AML/ASL+ Disassembler version 20200326 (64-bit version)
  * Copyright (c) 2000 - 2020 Intel Corporation
  *
- * Disassembly of tests/data/acpi/q35/NFIT.dimmpxm, Mon Jan 18 23:58:58 2021
+ * Disassembly of /tmp/aml-9VDEX0, Mon Jan 18 23:58:58 2021
  *
  * ACPI Data Table [NFIT]
  *
@@ -13,9 +13,9 @@
 [000h 0000   4]                    Signature : "NFIT"    [NVDIMM Firmware Interface Table]
 [004h 0004   4]                 Table Length : 000000F0
 [008h 0008   1]                     Revision : 01
-[009h 0009   1]                     Checksum : 24
+[009h 0009   1]                     Checksum : D5
 [00Ah 0010   6]                       Oem ID : "BOCHS "
-[010h 0016   8]                 Oem Table ID : "BXPCNFIT"
+[010h 0016   8]                 Oem Table ID : "BXPC    "
 [018h 0024   4]                 Oem Revision : 00000001
 [01Ch 0028   4]              Asl Compiler ID : "BXPC"
 [020h 0032   4]        Asl Compiler Revision : 00000001

Table tests/data/acpi/q35/WAET.dimmpxm diff:
@@ -3,7 +3,7 @@
  * AML/ASL+ Disassembler version 20200326 (64-bit version)
  * Copyright (c) 2000 - 2020 Intel Corporation
  *
- * Disassembly of tests/data/acpi/q35/WAET, Mon Jan 18 23:58:58 2021
+ * Disassembly of /tmp/aml-DWDEX0, Mon Jan 18 23:58:58 2021
  *
  * ACPI Data Table [WAET]
  *
@@ -13,9 +13,9 @@
 [000h 0000   4]                    Signature : "WAET"    [Windows ACPI Emulated Devices Table]
 [004h 0004   4]                 Table Length : 00000028
 [008h 0008   1]                     Revision : 01
-[009h 0009   1]                     Checksum : 88
+[009h 0009   1]                     Checksum : 39
 [00Ah 0010   6]                       Oem ID : "BOCHS "
-[010h 0016   8]                 Oem Table ID : "BXPCWAET"
+[010h 0016   8]                 Oem Table ID : "BXPC    "
 [018h 0024   4]                 Oem Revision : 00000001
 [01Ch 0028   4]              Asl Compiler ID : "BXPC"
 [020h 0032   4]        Asl Compiler Revision : 00000001

Table tests/data/acpi/q35/DSDT.dimmpxm diff:
@@ -5,20 +5,20 @@
  *
  * Disassembling to symbolic ASL+ operators
  *
- * Disassembly of tests/data/acpi/q35/DSDT.dimmpxm, Mon Jan 18 23:58:58 2021
+ * Disassembly of /tmp/aml-IWDEX0, Mon Jan 18 23:58:58 2021
  *
  * Original Table Header:
  *     Signature        "DSDT"
  *     Length           0x000024EF (9455)
  *     Revision         0x01 **** 32-bit table (V1), no 64-bit math support
- *     Checksum         0x26
+ *     Checksum         0xD5
  *     OEM ID           "BOCHS "
- *     OEM Table ID     "BXPCDSDT"
+ *     OEM Table ID     "BXPC    "
  *     OEM Revision     0x00000001 (1)
  *     Compiler ID      "BXPC"
  *     Compiler Version 0x00000001 (1)
  */
-DefinitionBlock ("", "DSDT", 1, "BOCHS ", "BXPCDSDT", 0x00000001)
+DefinitionBlock ("", "DSDT", 1, "BOCHS ", "BXPC    ", 0x00000001)
 {
     External (_SB_.NVDR, UnknownObj)

Table tests/data/acpi/q35/FACP.acpihmat diff:
@@ -3,7 +3,7 @@
  * AML/ASL+ Disassembler version 20200326 (64-bit version)
  * Copyright (c) 2000 - 2020 Intel Corporation
  *
- * Disassembly of tests/data/acpi/q35/FACP, Mon Jan 18 23:58:58 2021
+ * Disassembly of /tmp/aml-OKSOX0, Mon Jan 18 23:58:58 2021
  *
  * ACPI Data Table [FACP]
  *
@@ -13,9 +13,9 @@
 [000h 0000   4]                    Signature : "FACP"    [Fixed ACPI Description Table (FADT)]
 [004h 0004   4]                 Table Length : 000000F4
 [008h 0008   1]                     Revision : 03
-[009h 0009   1]                     Checksum : 1F
+[009h 0009   1]                     Checksum : B9
 [00Ah 0010   6]                       Oem ID : "BOCHS "
-[010h 0016   8]                 Oem Table ID : "BXPCFACP"
+[010h 0016   8]                 Oem Table ID : "BXPC    "
 [018h 0024   4]                 Oem Revision : 00000001
 [01Ch 0028   4]              Asl Compiler ID : "BXPC"
 [020h 0032   4]        Asl Compiler Revision : 00000001

Table tests/data/acpi/q35/APIC.acpihmat diff:
@@ -3,7 +3,7 @@
  * AML/ASL+ Disassembler version 20200326 (64-bit version)
  * Copyright (c) 2000 - 2020 Intel Corporation
  *
- * Disassembly of tests/data/acpi/q35/APIC.acpihmat, Mon Jan 18 23:58:58 2021
+ * Disassembly of /tmp/aml-0KSOX0, Mon Jan 18 23:58:58 2021
  *
  * ACPI Data Table [APIC]
  *
@@ -13,9 +13,9 @@
 [000h 0000   4]                    Signature : "APIC"    [Multiple APIC Description Table (MADT)]
 [004h 0004   4]                 Table Length : 00000080
 [008h 0008   1]                     Revision : 01
-[009h 0009   1]                     Checksum : DA
+[009h 0009   1]                     Checksum : 77
 [00Ah 0010   6]                       Oem ID : "BOCHS "
-[010h 0016   8]                 Oem Table ID : "BXPCAPIC"
+[010h 0016   8]                 Oem Table ID : "BXPC    "
 [018h 0024   4]                 Oem Revision : 00000001
 [01Ch 0028   4]              Asl Compiler ID : "BXPC"
 [020h 0032   4]        Asl Compiler Revision : 00000001

Table tests/data/acpi/q35/HPET.acpihmat diff:
@@ -3,7 +3,7 @@
  * AML/ASL+ Disassembler version 20200326 (64-bit version)
  * Copyright (c) 2000 - 2020 Intel Corporation
  *
- * Disassembly of tests/data/acpi/q35/HPET, Mon Jan 18 23:58:58 2021
+ * Disassembly of /tmp/aml-5KSOX0, Mon Jan 18 23:58:58 2021
  *
  * ACPI Data Table [HPET]
  *
@@ -13,9 +13,9 @@
 [000h 0000   4]                    Signature : "HPET"    [High Precision Event Timer table]
 [004h 0004   4]                 Table Length : 00000038
 [008h 0008   1]                     Revision : 01
-[009h 0009   1]                     Checksum : 03
+[009h 0009   1]                     Checksum : B4
 [00Ah 0010   6]                       Oem ID : "BOCHS "
-[010h 0016   8]                 Oem Table ID : "BXPCHPET"
+[010h 0016   8]                 Oem Table ID : "BXPC    "
 [018h 0024   4]                 Oem Revision : 00000001
 [01Ch 0028   4]              Asl Compiler ID : "BXPC"
 [020h 0032   4]        Asl Compiler Revision : 00000001

Table tests/data/acpi/q35/SRAT.acpihmat diff:
@@ -3,7 +3,7 @@
  * AML/ASL+ Disassembler version 20200326 (64-bit version)
  * Copyright (c) 2000 - 2020 Intel Corporation
  *
- * Disassembly of tests/data/acpi/q35/SRAT.acpihmat, Mon Jan 18 23:58:58 2021
+ * Disassembly of /tmp/aml-9KSOX0, Mon Jan 18 23:58:58 2021
  *
  * ACPI Data Table [SRAT]
  *
@@ -13,9 +13,9 @@
 [000h 0000   4]                    Signature : "SRAT"    [System Resource Affinity Table]
 [004h 0004   4]                 Table Length : 00000118
 [008h 0008   1]                     Revision : 01
-[009h 0009   1]                     Checksum : C0
+[009h 0009   1]                     Checksum : 7A
 [00Ah 0010   6]                       Oem ID : "BOCHS "
-[010h 0016   8]                 Oem Table ID : "BXPCSRAT"
+[010h 0016   8]                 Oem Table ID : "BXPC    "
 [018h 0024   4]                 Oem Revision : 00000001
 [01Ch 0028   4]              Asl Compiler ID : "BXPC"
 [020h 0032   4]        Asl Compiler Revision : 00000001

Table tests/data/acpi/q35/HMAT.acpihmat diff:
@@ -3,7 +3,7 @@
  * AML/ASL+ Disassembler version 20200326 (64-bit version)
  * Copyright (c) 2000 - 2020 Intel Corporation
  *
- * Disassembly of tests/data/acpi/q35/HMAT.acpihmat, Mon Jan 18 23:58:58 2021
+ * Disassembly of /tmp/aml-ALYOX0, Mon Jan 18 23:58:58 2021
  *
  * ACPI Data Table [HMAT]
  *
@@ -13,9 +13,9 @@
 [000h 0000   4]                    Signature : "HMAT"    [Heterogeneous Memory Attributes Table]
 [004h 0004   4]                 Table Length : 00000118
 [008h 0008   1]                     Revision : 02
-[009h 0009   1]                     Checksum : 98
+[009h 0009   1]                     Checksum : 42
 [00Ah 0010   6]                       Oem ID : "BOCHS "
-[010h 0016   8]                 Oem Table ID : "BXPCHMAT"
+[010h 0016   8]                 Oem Table ID : "BXPC    "
 [018h 0024   4]                 Oem Revision : 00000001
 [01Ch 0028   4]              Asl Compiler ID : "BXPC"
 [020h 0032   4]        Asl Compiler Revision : 00000001

Table tests/data/acpi/q35/MCFG.acpihmat diff:
@@ -3,7 +3,7 @@
  * AML/ASL+ Disassembler version 20200326 (64-bit version)
  * Copyright (c) 2000 - 2020 Intel Corporation
  *
- * Disassembly of tests/data/acpi/q35/MCFG, Mon Jan 18 23:58:58 2021
+ * Disassembly of /tmp/aml-ELSOX0, Mon Jan 18 23:58:58 2021
  *
  * ACPI Data Table [MCFG]
  *
@@ -13,9 +13,9 @@
 [000h 0000   4]                    Signature : "MCFG"    [Memory Mapped Configuration table]
 [004h 0004   4]                 Table Length : 0000003C
 [008h 0008   1]                     Revision : 01
-[009h 0009   1]                     Checksum : EF
+[009h 0009   1]                     Checksum : 8C
 [00Ah 0010   6]                       Oem ID : "BOCHS "
-[010h 0016   8]                 Oem Table ID : "BXPCMCFG"
+[010h 0016   8]                 Oem Table ID : "BXPC    "
 [018h 0024   4]                 Oem Revision : 00000001
 [01Ch 0028   4]              Asl Compiler ID : "BXPC"
 [020h 0032   4]        Asl Compiler Revision : 00000001

Table tests/data/acpi/q35/WAET.acpihmat diff:
@@ -3,7 +3,7 @@
  * AML/ASL+ Disassembler version 20200326 (64-bit version)
  * Copyright (c) 2000 - 2020 Intel Corporation
  *
- * Disassembly of tests/data/acpi/q35/WAET, Mon Jan 18 23:58:58 2021
+ * Disassembly of /tmp/aml-ILSOX0, Mon Jan 18 23:58:58 2021
  *
  * ACPI Data Table [WAET]
  *
@@ -13,9 +13,9 @@
 [000h 0000   4]                    Signature : "WAET"    [Windows ACPI Emulated Devices Table]
 [004h 0004   4]                 Table Length : 00000028
 [008h 0008   1]                     Revision : 01
-[009h 0009   1]                     Checksum : 88
+[009h 0009   1]                     Checksum : 39
 [00Ah 0010   6]                       Oem ID : "BOCHS "
-[010h 0016   8]                 Oem Table ID : "BXPCWAET"
+[010h 0016   8]                 Oem Table ID : "BXPC    "
 [018h 0024   4]                 Oem Revision : 00000001
 [01Ch 0028   4]              Asl Compiler ID : "BXPC"
 [020h 0032   4]        Asl Compiler Revision : 00000001

Table tests/data/acpi/q35/DSDT.acpihmat diff:
@@ -5,20 +5,20 @@
  *
  * Disassembling to symbolic ASL+ operators
  *
- * Disassembly of tests/data/acpi/q35/DSDT.acpihmat, Mon Jan 18 23:58:58 2021
+ * Disassembly of /tmp/aml-2JSOX0, Mon Jan 18 23:58:58 2021
  *
  * Original Table Header:
  *     Signature        "DSDT"
  *     Length           0x000023A6 (9126)
  *     Revision         0x01 **** 32-bit table (V1), no 64-bit math support
- *     Checksum         0xB3
+ *     Checksum         0x62
  *     OEM ID           "BOCHS "
- *     OEM Table ID     "BXPCDSDT"
+ *     OEM Table ID     "BXPC    "
  *     OEM Revision     0x00000001 (1)
  *     Compiler ID      "BXPC"
  *     Compiler Version 0x00000001 (1)
  */
-DefinitionBlock ("", "DSDT", 1, "BOCHS ", "BXPCDSDT", 0x00000001)
+DefinitionBlock ("", "DSDT", 1, "BOCHS ", "BXPC    ", 0x00000001)
 {
     Scope (\)
     {

Table tests/data/acpi/pc/FACP.ipmikcs diff:
@@ -3,7 +3,7 @@
  * AML/ASL+ Disassembler version 20200326 (64-bit version)
  * Copyright (c) 2000 - 2020 Intel Corporation
  *
- * Disassembly of tests/data/acpi/pc/FACP, Mon Jan 18 23:58:59 2021
+ * Disassembly of /tmp/aml-1HH9W0, Mon Jan 18 23:58:59 2021
  *
  * ACPI Data Table [FACP]
  *
@@ -13,9 +13,9 @@
 [000h 0000   4]                    Signature : "FACP"    [Fixed ACPI Description Table (FADT)]
 [004h 0004   4]                 Table Length : 00000074
 [008h 0008   1]                     Revision : 01
-[009h 0009   1]                     Checksum : A1
+[009h 0009   1]                     Checksum : 3B
 [00Ah 0010   6]                       Oem ID : "BOCHS "
-[010h 0016   8]                 Oem Table ID : "BXPCFACP"
+[010h 0016   8]                 Oem Table ID : "BXPC    "
 [018h 0024   4]                 Oem Revision : 00000001
 [01Ch 0028   4]              Asl Compiler ID : "BXPC"
 [020h 0032   4]        Asl Compiler Revision : 00000001

Table tests/data/acpi/pc/APIC.ipmikcs diff:
@@ -3,7 +3,7 @@
  * AML/ASL+ Disassembler version 20200326 (64-bit version)
  * Copyright (c) 2000 - 2020 Intel Corporation
  *
- * Disassembly of tests/data/acpi/pc/APIC, Mon Jan 18 23:58:59 2021
+ * Disassembly of /tmp/aml-GIH9W0, Mon Jan 18 23:58:59 2021
  *
  * ACPI Data Table [APIC]
  *
@@ -13,9 +13,9 @@
 [000h 0000   4]                    Signature : "APIC"    [Multiple APIC Description Table (MADT)]
 [004h 0004   4]                 Table Length : 00000078
 [008h 0008   1]                     Revision : 01
-[009h 0009   1]                     Checksum : ED
+[009h 0009   1]                     Checksum : 8A
 [00Ah 0010   6]                       Oem ID : "BOCHS "
-[010h 0016   8]                 Oem Table ID : "BXPCAPIC"
+[010h 0016   8]                 Oem Table ID : "BXPC    "
 [018h 0024   4]                 Oem Revision : 00000001
 [01Ch 0028   4]              Asl Compiler ID : "BXPC"
 [020h 0032   4]        Asl Compiler Revision : 00000001

Table tests/data/acpi/pc/HPET.ipmikcs diff:
@@ -3,7 +3,7 @@
  * AML/ASL+ Disassembler version 20200326 (64-bit version)
  * Copyright (c) 2000 - 2020 Intel Corporation
  *
- * Disassembly of tests/data/acpi/pc/HPET, Mon Jan 18 23:58:59 2021
+ * Disassembly of /tmp/aml-PIH9W0, Mon Jan 18 23:58:59 2021
  *
  * ACPI Data Table [HPET]
  *
@@ -13,9 +13,9 @@
 [000h 0000   4]                    Signature : "HPET"    [High Precision Event Timer table]
 [004h 0004   4]                 Table Length : 00000038
 [008h 0008   1]                     Revision : 01
-[009h 0009   1]                     Checksum : 03
+[009h 0009   1]                     Checksum : B4
 [00Ah 0010   6]                       Oem ID : "BOCHS "
-[010h 0016   8]                 Oem Table ID : "BXPCHPET"
+[010h 0016   8]                 Oem Table ID : "BXPC    "
 [018h 0024   4]                 Oem Revision : 00000001
 [01Ch 0028   4]              Asl Compiler ID : "BXPC"
 [020h 0032   4]        Asl Compiler Revision : 00000001

Table tests/data/acpi/pc/WAET.ipmikcs diff:
@@ -3,7 +3,7 @@
  * AML/ASL+ Disassembler version 20200326 (64-bit version)
  * Copyright (c) 2000 - 2020 Intel Corporation
  *
- * Disassembly of tests/data/acpi/pc/WAET, Mon Jan 18 23:58:59 2021
+ * Disassembly of /tmp/aml-OIH9W0, Mon Jan 18 23:58:59 2021
  *
  * ACPI Data Table [WAET]
  *
@@ -13,9 +13,9 @@
 [000h 0000   4]                    Signature : "WAET"    [Windows ACPI Emulated Devices Table]
 [004h 0004   4]                 Table Length : 00000028
 [008h 0008   1]                     Revision : 01
-[009h 0009   1]                     Checksum : 88
+[009h 0009   1]                     Checksum : 39
 [00Ah 0010   6]                       Oem ID : "BOCHS "
-[010h 0016   8]                 Oem Table ID : "BXPCWAET"
+[010h 0016   8]                 Oem Table ID : "BXPC    "
 [018h 0024   4]                 Oem Revision : 00000001
 [01Ch 0028   4]              Asl Compiler ID : "BXPC"
 [020h 0032   4]        Asl Compiler Revision : 00000001

Table tests/data/acpi/pc/DSDT.ipmikcs diff:
@@ -5,20 +5,20 @@
  *
  * Disassembling to symbolic ASL+ operators
  *
- * Disassembly of tests/data/acpi/pc/DSDT.ipmikcs, Mon Jan 18 23:58:59 2021
+ * Disassembly of /tmp/aml-9GH9W0, Mon Jan 18 23:58:59 2021
  *
  * Original Table Header:
  *     Signature        "DSDT"
  *     Length           0x00001411 (5137)
  *     Revision         0x01 **** 32-bit table (V1), no 64-bit math support
- *     Checksum         0x33
+ *     Checksum         0xE2
  *     OEM ID           "BOCHS "
- *     OEM Table ID     "BXPCDSDT"
+ *     OEM Table ID     "BXPC    "
  *     OEM Revision     0x00000001 (1)
  *     Compiler ID      "BXPC"
  *     Compiler Version 0x00000001 (1)
  */
-DefinitionBlock ("", "DSDT", 1, "BOCHS ", "BXPCDSDT", 0x00000001)
+DefinitionBlock ("", "DSDT", 1, "BOCHS ", "BXPC    ", 0x00000001)
 {
     Scope (\)
     {

Table tests/data/acpi/pc/FACP.roothp diff:
@@ -3,7 +3,7 @@
  * AML/ASL+ Disassembler version 20200326 (64-bit version)
  * Copyright (c) 2000 - 2020 Intel Corporation
  *
- * Disassembly of tests/data/acpi/pc/FACP, Mon Jan 18 23:59:01 2021
+ * Disassembly of /tmp/aml-84PIX0, Mon Jan 18 23:59:01 2021
  *
  * ACPI Data Table [FACP]
  *
@@ -13,9 +13,9 @@
 [000h 0000   4]                    Signature : "FACP"    [Fixed ACPI Description Table (FADT)]
 [004h 0004   4]                 Table Length : 00000074
 [008h 0008   1]                     Revision : 01
-[009h 0009   1]                     Checksum : A1
+[009h 0009   1]                     Checksum : 3B
 [00Ah 0010   6]                       Oem ID : "BOCHS "
-[010h 0016   8]                 Oem Table ID : "BXPCFACP"
+[010h 0016   8]                 Oem Table ID : "BXPC    "
 [018h 0024   4]                 Oem Revision : 00000001
 [01Ch 0028   4]              Asl Compiler ID : "BXPC"
 [020h 0032   4]        Asl Compiler Revision : 00000001

Table tests/data/acpi/pc/APIC.roothp diff:
@@ -3,7 +3,7 @@
  * AML/ASL+ Disassembler version 20200326 (64-bit version)
  * Copyright (c) 2000 - 2020 Intel Corporation
  *
- * Disassembly of tests/data/acpi/pc/APIC, Mon Jan 18 23:59:01 2021
+ * Disassembly of /tmp/aml-D5PIX0, Mon Jan 18 23:59:01 2021
  *
  * ACPI Data Table [APIC]
  *
@@ -13,9 +13,9 @@
 [000h 0000   4]                    Signature : "APIC"    [Multiple APIC Description Table (MADT)]
 [004h 0004   4]                 Table Length : 00000078
 [008h 0008   1]                     Revision : 01
-[009h 0009   1]                     Checksum : ED
+[009h 0009   1]                     Checksum : 8A
 [00Ah 0010   6]                       Oem ID : "BOCHS "
-[010h 0016   8]                 Oem Table ID : "BXPCAPIC"
+[010h 0016   8]                 Oem Table ID : "BXPC    "
 [018h 0024   4]                 Oem Revision : 00000001
 [01Ch 0028   4]              Asl Compiler ID : "BXPC"
 [020h 0032   4]        Asl Compiler Revision : 00000001

Table tests/data/acpi/pc/HPET.roothp diff:
@@ -3,7 +3,7 @@
  * AML/ASL+ Disassembler version 20200326 (64-bit version)
  * Copyright (c) 2000 - 2020 Intel Corporation
  *
- * Disassembly of tests/data/acpi/pc/HPET, Mon Jan 18 23:59:01 2021
+ * Disassembly of /tmp/aml-P5PIX0, Mon Jan 18 23:59:01 2021
  *
  * ACPI Data Table [HPET]
  *
@@ -13,9 +13,9 @@
 [000h 0000   4]                    Signature : "HPET"    [High Precision Event Timer table]
 [004h 0004   4]                 Table Length : 00000038
 [008h 0008   1]                     Revision : 01
-[009h 0009   1]                     Checksum : 03
+[009h 0009   1]                     Checksum : B4
 [00Ah 0010   6]                       Oem ID : "BOCHS "
-[010h 0016   8]                 Oem Table ID : "BXPCHPET"
+[010h 0016   8]                 Oem Table ID : "BXPC    "
 [018h 0024   4]                 Oem Revision : 00000001
 [01Ch 0028   4]              Asl Compiler ID : "BXPC"
 [020h 0032   4]        Asl Compiler Revision : 00000001

Table tests/data/acpi/pc/WAET.roothp diff:
@@ -3,7 +3,7 @@
  * AML/ASL+ Disassembler version 20200326 (64-bit version)
  * Copyright (c) 2000 - 2020 Intel Corporation
  *
- * Disassembly of tests/data/acpi/pc/WAET, Mon Jan 18 23:59:01 2021
+ * Disassembly of /tmp/aml-N5PIX0, Mon Jan 18 23:59:01 2021
  *
  * ACPI Data Table [WAET]
  *
@@ -13,9 +13,9 @@
 [000h 0000   4]                    Signature : "WAET"    [Windows ACPI Emulated Devices Table]
 [004h 0004   4]                 Table Length : 00000028
 [008h 0008   1]                     Revision : 01
-[009h 0009   1]                     Checksum : 88
+[009h 0009   1]                     Checksum : 39
 [00Ah 0010   6]                       Oem ID : "BOCHS "
-[010h 0016   8]                 Oem Table ID : "BXPCWAET"
+[010h 0016   8]                 Oem Table ID : "BXPC    "
 [018h 0024   4]                 Oem Revision : 00000001
 [01Ch 0028   4]              Asl Compiler ID : "BXPC"
 [020h 0032   4]        Asl Compiler Revision : 00000001

Table tests/data/acpi/pc/DSDT.roothp diff:
@@ -5,20 +5,20 @@
  *
  * Disassembling to symbolic ASL+ operators
  *
- * Disassembly of tests/data/acpi/pc/DSDT.roothp, Mon Jan 18 23:59:02 2021
+ * Disassembly of /tmp/aml-83PIX0, Mon Jan 18 23:59:02 2021
  *
  * Original Table Header:
  *     Signature        "DSDT"
  *     Length           0x0000148D (5261)
  *     Revision         0x01 **** 32-bit table (V1), no 64-bit math support
- *     Checksum         0xC6
+ *     Checksum         0x75
  *     OEM ID           "BOCHS "
- *     OEM Table ID     "BXPCDSDT"
+ *     OEM Table ID     "BXPC    "
  *     OEM Revision     0x00000001 (1)
  *     Compiler ID      "BXPC"
  *     Compiler Version 0x00000001 (1)
  */
-DefinitionBlock ("", "DSDT", 1, "BOCHS ", "BXPCDSDT", 0x00000001)
+DefinitionBlock ("", "DSDT", 1, "BOCHS ", "BXPC    ", 0x00000001)
 {
     Scope (\)
     {

Table tests/data/acpi/pc/FACP.hpbridge diff:
@@ -3,7 +3,7 @@
  * AML/ASL+ Disassembler version 20200326 (64-bit version)
  * Copyright (c) 2000 - 2020 Intel Corporation
  *
- * Disassembly of tests/data/acpi/pc/FACP, Mon Jan 18 23:59:02 2021
+ * Disassembly of /tmp/aml-2ZSAX0, Mon Jan 18 23:59:02 2021
  *
  * ACPI Data Table [FACP]
  *
@@ -13,9 +13,9 @@
 [000h 0000   4]                    Signature : "FACP"    [Fixed ACPI Description Table (FADT)]
 [004h 0004   4]                 Table Length : 00000074
 [008h 0008   1]                     Revision : 01
-[009h 0009   1]                     Checksum : A1
+[009h 0009   1]                     Checksum : 3B
 [00Ah 0010   6]                       Oem ID : "BOCHS "
-[010h 0016   8]                 Oem Table ID : "BXPCFACP"
+[010h 0016   8]                 Oem Table ID : "BXPC    "
 [018h 0024   4]                 Oem Revision : 00000001
 [01Ch 0028   4]              Asl Compiler ID : "BXPC"
 [020h 0032   4]        Asl Compiler Revision : 00000001

Table tests/data/acpi/pc/APIC.hpbridge diff:
@@ -3,7 +3,7 @@
  * AML/ASL+ Disassembler version 20200326 (64-bit version)
  * Copyright (c) 2000 - 2020 Intel Corporation
  *
- * Disassembly of tests/data/acpi/pc/APIC, Mon Jan 18 23:59:02 2021
+ * Disassembly of /tmp/aml-B0SAX0, Mon Jan 18 23:59:02 2021
  *
  * ACPI Data Table [APIC]
  *
@@ -13,9 +13,9 @@
 [000h 0000   4]                    Signature : "APIC"    [Multiple APIC Description Table (MADT)]
 [004h 0004   4]                 Table Length : 00000078
 [008h 0008   1]                     Revision : 01
-[009h 0009   1]                     Checksum : ED
+[009h 0009   1]                     Checksum : 8A
 [00Ah 0010   6]                       Oem ID : "BOCHS "
-[010h 0016   8]                 Oem Table ID : "BXPCAPIC"
+[010h 0016   8]                 Oem Table ID : "BXPC    "
 [018h 0024   4]                 Oem Revision : 00000001
 [01Ch 0028   4]              Asl Compiler ID : "BXPC"
 [020h 0032   4]        Asl Compiler Revision : 00000001

Table tests/data/acpi/pc/HPET.hpbridge diff:
@@ -3,7 +3,7 @@
  * AML/ASL+ Disassembler version 20200326 (64-bit version)
  * Copyright (c) 2000 - 2020 Intel Corporation
  *
- * Disassembly of tests/data/acpi/pc/HPET, Mon Jan 18 23:59:02 2021
+ * Disassembly of /tmp/aml-G2SAX0, Mon Jan 18 23:59:02 2021
  *
  * ACPI Data Table [HPET]
  *
@@ -13,9 +13,9 @@
 [000h 0000   4]                    Signature : "HPET"    [High Precision Event Timer table]
 [004h 0004   4]                 Table Length : 00000038
 [008h 0008   1]                     Revision : 01
-[009h 0009   1]                     Checksum : 03
+[009h 0009   1]                     Checksum : B4
 [00Ah 0010   6]                       Oem ID : "BOCHS "
-[010h 0016   8]                 Oem Table ID : "BXPCHPET"
+[010h 0016   8]                 Oem Table ID : "BXPC    "
 [018h 0024   4]                 Oem Revision : 00000001
 [01Ch 0028   4]              Asl Compiler ID : "BXPC"
 [020h 0032   4]        Asl Compiler Revision : 00000001

Table tests/data/acpi/pc/WAET.hpbridge diff:
@@ -3,7 +3,7 @@
  * AML/ASL+ Disassembler version 20200326 (64-bit version)
  * Copyright (c) 2000 - 2020 Intel Corporation
  *
- * Disassembly of tests/data/acpi/pc/WAET, Mon Jan 18 23:59:02 2021
+ * Disassembly of /tmp/aml-F2SAX0, Mon Jan 18 23:59:02 2021
  *
  * ACPI Data Table [WAET]
  *
@@ -13,9 +13,9 @@
 [000h 0000   4]                    Signature : "WAET"    [Windows ACPI Emulated Devices Table]
 [004h 0004   4]                 Table Length : 00000028
 [008h 0008   1]                     Revision : 01
-[009h 0009   1]                     Checksum : 88
+[009h 0009   1]                     Checksum : 39
 [00Ah 0010   6]                       Oem ID : "BOCHS "
-[010h 0016   8]                 Oem Table ID : "BXPCWAET"
+[010h 0016   8]                 Oem Table ID : "BXPC    "
 [018h 0024   4]                 Oem Revision : 00000001
 [01Ch 0028   4]              Asl Compiler ID : "BXPC"
 [020h 0032   4]        Asl Compiler Revision : 00000001

Table tests/data/acpi/pc/DSDT.hpbridge diff:
@@ -5,20 +5,20 @@
  *
  * Disassembling to symbolic ASL+ operators
  *
- * Disassembly of tests/data/acpi/pc/DSDT.hpbridge, Mon Jan 18 23:59:02 2021
+ * Disassembly of /tmp/aml-R2SAX0, Mon Jan 18 23:59:02 2021
  *
  * Original Table Header:
  *     Signature        "DSDT"
  *     Length           0x000013A2 (5026)
  *     Revision         0x01 **** 32-bit table (V1), no 64-bit math support
- *     Checksum         0xD9
+ *     Checksum         0x88
  *     OEM ID           "BOCHS "
- *     OEM Table ID     "BXPCDSDT"
+ *     OEM Table ID     "BXPC    "
  *     OEM Revision     0x00000001 (1)
  *     Compiler ID      "BXPC"
  *     Compiler Version 0x00000001 (1)
  */
-DefinitionBlock ("", "DSDT", 1, "BOCHS ", "BXPCDSDT", 0x00000001)
+DefinitionBlock ("", "DSDT", 1, "BOCHS ", "BXPC    ", 0x00000001)
 {
     Scope (\)
     {

Table tests/data/acpi/pc/FACP.hpbrroot diff:
@@ -3,7 +3,7 @@
  * AML/ASL+ Disassembler version 20200326 (64-bit version)
  * Copyright (c) 2000 - 2020 Intel Corporation
  *
- * Disassembly of tests/data/acpi/pc/FACP, Mon Jan 18 23:59:02 2021
+ * Disassembly of /tmp/aml-D9COX0, Mon Jan 18 23:59:02 2021
  *
  * ACPI Data Table [FACP]
  *
@@ -13,9 +13,9 @@
 [000h 0000   4]                    Signature : "FACP"    [Fixed ACPI Description Table (FADT)]
 [004h 0004   4]                 Table Length : 00000074
 [008h 0008   1]                     Revision : 01
-[009h 0009   1]                     Checksum : A1
+[009h 0009   1]                     Checksum : 3B
 [00Ah 0010   6]                       Oem ID : "BOCHS "
-[010h 0016   8]                 Oem Table ID : "BXPCFACP"
+[010h 0016   8]                 Oem Table ID : "BXPC    "
 [018h 0024   4]                 Oem Revision : 00000001
 [01Ch 0028   4]              Asl Compiler ID : "BXPC"
 [020h 0032   4]        Asl Compiler Revision : 00000001

Table tests/data/acpi/pc/APIC.hpbrroot diff:
@@ -3,7 +3,7 @@
  * AML/ASL+ Disassembler version 20200326 (64-bit version)
  * Copyright (c) 2000 - 2020 Intel Corporation
  *
- * Disassembly of tests/data/acpi/pc/APIC, Mon Jan 18 23:59:02 2021
+ * Disassembly of /tmp/aml-K9COX0, Mon Jan 18 23:59:02 2021
  *
  * ACPI Data Table [APIC]
  *
@@ -13,9 +13,9 @@
 [000h 0000   4]                    Signature : "APIC"    [Multiple APIC Description Table (MADT)]
 [004h 0004   4]                 Table Length : 00000078
 [008h 0008   1]                     Revision : 01
-[009h 0009   1]                     Checksum : ED
+[009h 0009   1]                     Checksum : 8A
 [00Ah 0010   6]                       Oem ID : "BOCHS "
-[010h 0016   8]                 Oem Table ID : "BXPCAPIC"
+[010h 0016   8]                 Oem Table ID : "BXPC    "
 [018h 0024   4]                 Oem Revision : 00000001
 [01Ch 0028   4]              Asl Compiler ID : "BXPC"
 [020h 0032   4]        Asl Compiler Revision : 00000001

Table tests/data/acpi/pc/HPET.hpbrroot diff:
@@ -3,7 +3,7 @@
  * AML/ASL+ Disassembler version 20200326 (64-bit version)
  * Copyright (c) 2000 - 2020 Intel Corporation
  *
- * Disassembly of tests/data/acpi/pc/HPET, Mon Jan 18 23:59:02 2021
+ * Disassembly of /tmp/aml-L4COX0, Mon Jan 18 23:59:02 2021
  *
  * ACPI Data Table [HPET]
  *
@@ -13,9 +13,9 @@
 [000h 0000   4]                    Signature : "HPET"    [High Precision Event Timer table]
 [004h 0004   4]                 Table Length : 00000038
 [008h 0008   1]                     Revision : 01
-[009h 0009   1]                     Checksum : 03
+[009h 0009   1]                     Checksum : B4
 [00Ah 0010   6]                       Oem ID : "BOCHS "
-[010h 0016   8]                 Oem Table ID : "BXPCHPET"
+[010h 0016   8]                 Oem Table ID : "BXPC    "
 [018h 0024   4]                 Oem Revision : 00000001
 [01Ch 0028   4]              Asl Compiler ID : "BXPC"
 [020h 0032   4]        Asl Compiler Revision : 00000001

Table tests/data/acpi/pc/WAET.hpbrroot diff:
@@ -3,7 +3,7 @@
  * AML/ASL+ Disassembler version 20200326 (64-bit version)
  * Copyright (c) 2000 - 2020 Intel Corporation
  *
- * Disassembly of tests/data/acpi/pc/WAET, Mon Jan 18 23:59:02 2021
+ * Disassembly of /tmp/aml-W4COX0, Mon Jan 18 23:59:02 2021
  *
  * ACPI Data Table [WAET]
  *
@@ -13,9 +13,9 @@
 [000h 0000   4]                    Signature : "WAET"    [Windows ACPI Emulated Devices Table]
 [004h 0004   4]                 Table Length : 00000028
 [008h 0008   1]                     Revision : 01
-[009h 0009   1]                     Checksum : 88
+[009h 0009   1]                     Checksum : 39
 [00Ah 0010   6]                       Oem ID : "BOCHS "
-[010h 0016   8]                 Oem Table ID : "BXPCWAET"
+[010h 0016   8]                 Oem Table ID : "BXPC    "
 [018h 0024   4]                 Oem Revision : 00000001
 [01Ch 0028   4]              Asl Compiler ID : "BXPC"
 [020h 0032   4]        Asl Compiler Revision : 00000001

Table tests/data/acpi/pc/DSDT.hpbrroot diff:
@@ -5,20 +5,20 @@
  *
  * Disassembling to symbolic ASL+ operators
  *
- * Disassembly of tests/data/acpi/pc/DSDT.hpbrroot, Mon Jan 18 23:59:02 2021
+ * Disassembly of /tmp/aml-S4COX0, Mon Jan 18 23:59:02 2021
  *
  * Original Table Header:
  *     Signature        "DSDT"
  *     Length           0x00000C0C (3084)
  *     Revision         0x01 **** 32-bit table (V1), no 64-bit math support
- *     Checksum         0x81
+ *     Checksum         0x30
  *     OEM ID           "BOCHS "
- *     OEM Table ID     "BXPCDSDT"
+ *     OEM Table ID     "BXPC    "
  *     OEM Revision     0x00000001 (1)
  *     Compiler ID      "BXPC"
  *     Compiler Version 0x00000001 (1)
  */
-DefinitionBlock ("", "DSDT", 1, "BOCHS ", "BXPCDSDT", 0x00000001)
+DefinitionBlock ("", "DSDT", 1, "BOCHS ", "BXPC    ", 0x00000001)
 {
     Scope (\)
     {

Table tests/data/acpi/microvm/FACP.usb diff:
@@ -3,7 +3,7 @@
  * AML/ASL+ Disassembler version 20200326 (64-bit version)
  * Copyright (c) 2000 - 2020 Intel Corporation
  *
- * Disassembly of tests/data/acpi/microvm/FACP, Mon Jan 18 23:59:03 2021
+ * Disassembly of /tmp/aml-PZ3FX0, Mon Jan 18 23:59:03 2021
  *
  * ACPI Data Table [FACP]
  *
@@ -13,9 +13,9 @@
 [000h 0000   4]                    Signature : "FACP"    [Fixed ACPI Description Table (FADT)]
 [004h 0004   4]                 Table Length : 0000010C
 [008h 0008   1]                     Revision : 05
-[009h 0009   1]                     Checksum : 7E
+[009h 0009   1]                     Checksum : 18
 [00Ah 0010   6]                       Oem ID : "BOCHS "
-[010h 0016   8]                 Oem Table ID : "BXPCFACP"
+[010h 0016   8]                 Oem Table ID : "BXPC    "
 [018h 0024   4]                 Oem Revision : 00000001
 [01Ch 0028   4]              Asl Compiler ID : "BXPC"
 [020h 0032   4]        Asl Compiler Revision : 00000001

Table tests/data/acpi/microvm/APIC.usb diff:
@@ -3,7 +3,7 @@
  * AML/ASL+ Disassembler version 20200326 (64-bit version)
  * Copyright (c) 2000 - 2020 Intel Corporation
  *
- * Disassembly of tests/data/acpi/microvm/APIC, Mon Jan 18 23:59:03 2021
+ * Disassembly of /tmp/aml-ZZ3FX0, Mon Jan 18 23:59:03 2021
  *
  * ACPI Data Table [APIC]
  *
@@ -13,9 +13,9 @@
 [000h 0000   4]                    Signature : "APIC"    [Multiple APIC Description Table (MADT)]
 [004h 0004   4]                 Table Length : 00000046
 [008h 0008   1]                     Revision : 01
-[009h 0009   1]                     Checksum : D7
+[009h 0009   1]                     Checksum : 74
 [00Ah 0010   6]                       Oem ID : "BOCHS "
-[010h 0016   8]                 Oem Table ID : "BXPCAPIC"
+[010h 0016   8]                 Oem Table ID : "BXPC    "
 [018h 0024   4]                 Oem Revision : 00000001
 [01Ch 0028   4]              Asl Compiler ID : "BXPC"
 [020h 0032   4]        Asl Compiler Revision : 00000001

Table tests/data/acpi/microvm/DSDT.usb diff:
@@ -5,20 +5,20 @@
  *
  * Disassembling to symbolic ASL+ operators
  *
- * Disassembly of tests/data/acpi/microvm/DSDT.usb, Mon Jan 18 23:59:03 2021
+ * Disassembly of /tmp/aml-XZ3FX0, Mon Jan 18 23:59:03 2021
  *
  * Original Table Header:
  *     Signature        "DSDT"
  *     Length           0x0000019E (414)
  *     Revision         0x02
- *     Checksum         0x72
+ *     Checksum         0x21
  *     OEM ID           "BOCHS "
- *     OEM Table ID     "BXPCDSDT"
+ *     OEM Table ID     "BXPC    "
  *     OEM Revision     0x00000001 (1)
  *     Compiler ID      "BXPC"
  *     Compiler Version 0x00000001 (1)
  */
-DefinitionBlock ("", "DSDT", 2, "BOCHS ", "BXPCDSDT", 0x00000001)
+DefinitionBlock ("", "DSDT", 2, "BOCHS ", "BXPC    ", 0x00000001)
 {
     Scope (_SB)
     {

Table tests/data/acpi/microvm/FACP.rtc diff:
@@ -3,7 +3,7 @@
  * AML/ASL+ Disassembler version 20200326 (64-bit version)
  * Copyright (c) 2000 - 2020 Intel Corporation
  *
- * Disassembly of tests/data/acpi/microvm/FACP, Mon Jan 18 23:59:03 2021
+ * Disassembly of /tmp/aml-TX8BX0, Mon Jan 18 23:59:03 2021
  *
  * ACPI Data Table [FACP]
  *
@@ -13,9 +13,9 @@
 [000h 0000   4]                    Signature : "FACP"    [Fixed ACPI Description Table (FADT)]
 [004h 0004   4]                 Table Length : 0000010C
 [008h 0008   1]                     Revision : 05
-[009h 0009   1]                     Checksum : 7E
+[009h 0009   1]                     Checksum : 18
 [00Ah 0010   6]                       Oem ID : "BOCHS "
-[010h 0016   8]                 Oem Table ID : "BXPCFACP"
+[010h 0016   8]                 Oem Table ID : "BXPC    "
 [018h 0024   4]                 Oem Revision : 00000001
 [01Ch 0028   4]              Asl Compiler ID : "BXPC"
 [020h 0032   4]        Asl Compiler Revision : 00000001

Table tests/data/acpi/microvm/APIC.rtc diff:
@@ -3,7 +3,7 @@
  * AML/ASL+ Disassembler version 20200326 (64-bit version)
  * Copyright (c) 2000 - 2020 Intel Corporation
  *
- * Disassembly of tests/data/acpi/microvm/APIC, Mon Jan 18 23:59:03 2021
+ * Disassembly of /tmp/aml-QS8BX0, Mon Jan 18 23:59:03 2021
  *
  * ACPI Data Table [APIC]
  *
@@ -13,9 +13,9 @@
 [000h 0000   4]                    Signature : "APIC"    [Multiple APIC Description Table (MADT)]
 [004h 0004   4]                 Table Length : 00000046
 [008h 0008   1]                     Revision : 01
-[009h 0009   1]                     Checksum : D7
+[009h 0009   1]                     Checksum : 74
 [00Ah 0010   6]                       Oem ID : "BOCHS "
-[010h 0016   8]                 Oem Table ID : "BXPCAPIC"
+[010h 0016   8]                 Oem Table ID : "BXPC    "
 [018h 0024   4]                 Oem Revision : 00000001
 [01Ch 0028   4]              Asl Compiler ID : "BXPC"
 [020h 0032   4]        Asl Compiler Revision : 00000001

Table tests/data/acpi/microvm/DSDT.rtc diff:
@@ -5,20 +5,20 @@
  *
  * Disassembling to symbolic ASL+ operators
  *
- * Disassembly of tests/data/acpi/microvm/DSDT.rtc, Mon Jan 18 23:59:03 2021
+ * Disassembly of /tmp/aml-4S8BX0, Mon Jan 18 23:59:03 2021
  *
  * Original Table Header:
  *     Signature        "DSDT"
  *     Length           0x00000194 (404)
  *     Revision         0x02
- *     Checksum         0x30
+ *     Checksum         0xDF
  *     OEM ID           "BOCHS "
- *     OEM Table ID     "BXPCDSDT"
+ *     OEM Table ID     "BXPC    "
  *     OEM Revision     0x00000001 (1)
  *     Compiler ID      "BXPC"
  *     Compiler Version 0x00000001 (1)
  */
-DefinitionBlock ("", "DSDT", 2, "BOCHS ", "BXPCDSDT", 0x00000001)
+DefinitionBlock ("", "DSDT", 2, "BOCHS ", "BXPC    ", 0x00000001)
 {
     Scope (_SB)
     {

Table tests/data/acpi/microvm/FACP.ioapic2 diff:
@@ -3,7 +3,7 @@
  * AML/ASL+ Disassembler version 20200326 (64-bit version)
  * Copyright (c) 2000 - 2020 Intel Corporation
  *
- * Disassembly of tests/data/acpi/microvm/FACP, Mon Jan 18 23:59:03 2021
+ * Disassembly of /tmp/aml-ZRMOX0, Mon Jan 18 23:59:03 2021
  *
  * ACPI Data Table [FACP]
  *
@@ -13,9 +13,9 @@
 [000h 0000   4]                    Signature : "FACP"    [Fixed ACPI Description Table (FADT)]
 [004h 0004   4]                 Table Length : 0000010C
 [008h 0008   1]                     Revision : 05
-[009h 0009   1]                     Checksum : 7E
+[009h 0009   1]                     Checksum : 18
 [00Ah 0010   6]                       Oem ID : "BOCHS "
-[010h 0016   8]                 Oem Table ID : "BXPCFACP"
+[010h 0016   8]                 Oem Table ID : "BXPC    "
 [018h 0024   4]                 Oem Revision : 00000001
 [01Ch 0028   4]              Asl Compiler ID : "BXPC"
 [020h 0032   4]        Asl Compiler Revision : 00000001

Table tests/data/acpi/microvm/APIC.ioapic2 diff:
@@ -3,7 +3,7 @@
  * AML/ASL+ Disassembler version 20200326 (64-bit version)
  * Copyright (c) 2000 - 2020 Intel Corporation
  *
- * Disassembly of tests/data/acpi/microvm/APIC.ioapic2, Mon Jan 18 23:59:03 2021
+ * Disassembly of /tmp/aml-VMMOX0, Mon Jan 18 23:59:03 2021
  *
  * ACPI Data Table [APIC]
  *
@@ -13,9 +13,9 @@
 [000h 0000   4]                    Signature : "APIC"    [Multiple APIC Description Table (MADT)]
 [004h 0004   4]                 Table Length : 00000052
 [008h 0008   1]                     Revision : 01
-[009h 0009   1]                     Checksum : E6
+[009h 0009   1]                     Checksum : 83
 [00Ah 0010   6]                       Oem ID : "BOCHS "
-[010h 0016   8]                 Oem Table ID : "BXPCAPIC"
+[010h 0016   8]                 Oem Table ID : "BXPC    "
 [018h 0024   4]                 Oem Revision : 00000001
 [01Ch 0028   4]              Asl Compiler ID : "BXPC"
 [020h 0032   4]        Asl Compiler Revision : 00000001

Table tests/data/acpi/microvm/DSDT.ioapic2 diff:
@@ -5,20 +5,20 @@
  *
  * Disassembling to symbolic ASL+ operators
  *
- * Disassembly of tests/data/acpi/microvm/DSDT.ioapic2, Mon Jan 18 23:59:03 2021
+ * Disassembly of /tmp/aml-TMMOX0, Mon Jan 18 23:59:03 2021
  *
  * Original Table Header:
  *     Signature        "DSDT"
  *     Length           0x0000016D (365)
  *     Revision         0x02
- *     Checksum         0x1C
+ *     Checksum         0xCB
  *     OEM ID           "BOCHS "
- *     OEM Table ID     "BXPCDSDT"
+ *     OEM Table ID     "BXPC    "
  *     OEM Revision     0x00000001 (1)
  *     Compiler ID      "BXPC"
  *     Compiler Version 0x00000001 (1)
  */
-DefinitionBlock ("", "DSDT", 2, "BOCHS ", "BXPCDSDT", 0x00000001)
+DefinitionBlock ("", "DSDT", 2, "BOCHS ", "BXPC    ", 0x00000001)
 {
     Scope (_SB)
     {

Table tests/data/acpi/microvm/FACP.pcie diff:
@@ -3,7 +3,7 @@
  * AML/ASL+ Disassembler version 20200326 (64-bit version)
  * Copyright (c) 2000 - 2020 Intel Corporation
  *
- * Disassembly of tests/data/acpi/microvm/FACP, Tue Jan 19 00:03:13 2021
+ * Disassembly of /tmp/aml-M6CGX0, Tue Jan 19 00:03:13 2021
  *
  * ACPI Data Table [FACP]
  *
@@ -13,9 +13,9 @@
 [000h 0000   4]                    Signature : "FACP"    [Fixed ACPI Description Table (FADT)]
 [004h 0004   4]                 Table Length : 0000010C
 [008h 0008   1]                     Revision : 05
-[009h 0009   1]                     Checksum : 7E
+[009h 0009   1]                     Checksum : 18
 [00Ah 0010   6]                       Oem ID : "BOCHS "
-[010h 0016   8]                 Oem Table ID : "BXPCFACP"
+[010h 0016   8]                 Oem Table ID : "BXPC    "
 [018h 0024   4]                 Oem Revision : 00000001
 [01Ch 0028   4]              Asl Compiler ID : "BXPC"
 [020h 0032   4]        Asl Compiler Revision : 00000001

Table tests/data/acpi/microvm/APIC.pcie diff:
@@ -3,7 +3,7 @@
  * AML/ASL+ Disassembler version 20200326 (64-bit version)
  * Copyright (c) 2000 - 2020 Intel Corporation
  *
- * Disassembly of tests/data/acpi/microvm/APIC.pcie, Tue Jan 19 00:03:13 2021
+ * Disassembly of /tmp/aml-V6CGX0, Tue Jan 19 00:03:13 2021
  *
  * ACPI Data Table [APIC]
  *
@@ -13,9 +13,9 @@
 [000h 0000   4]                    Signature : "APIC"    [Multiple APIC Description Table (MADT)]
 [004h 0004   4]                 Table Length : 0000006E
 [008h 0008   1]                     Revision : 01
-[009h 0009   1]                     Checksum : DF
+[009h 0009   1]                     Checksum : 7C
 [00Ah 0010   6]                       Oem ID : "BOCHS "
-[010h 0016   8]                 Oem Table ID : "BXPCAPIC"
+[010h 0016   8]                 Oem Table ID : "BXPC    "
 [018h 0024   4]                 Oem Revision : 00000001
 [01Ch 0028   4]              Asl Compiler ID : "BXPC"
 [020h 0032   4]        Asl Compiler Revision : 00000001

Table tests/data/acpi/microvm/DSDT.pcie diff:
@@ -5,20 +5,20 @@
  *
  * Disassembling to symbolic ASL+ operators
  *
- * Disassembly of tests/data/acpi/microvm/DSDT.pcie, Tue Jan 19 00:03:13 2021
+ * Disassembly of /tmp/aml-16CGX0, Tue Jan 19 00:03:13 2021
  *
  * Original Table Header:
  *     Signature        "DSDT"
  *     Length           0x00000BD7 (3031)
  *     Revision         0x02
- *     Checksum         0x99
+ *     Checksum         0x48
  *     OEM ID           "BOCHS "
- *     OEM Table ID     "BXPCDSDT"
+ *     OEM Table ID     "BXPC    "
  *     OEM Revision     0x00000001 (1)
  *     Compiler ID      "BXPC"
  *     Compiler Version 0x00000001 (1)
  */
-DefinitionBlock ("", "DSDT", 2, "BOCHS ", "BXPCDSDT", 0x00000001)
+DefinitionBlock ("", "DSDT", 2, "BOCHS ", "BXPC    ", 0x00000001)
 {
     Scope (_SB)
     {

Signed-off-by: Marian Postevca <posteuca@mutex.one>
Message-Id: <20210119003216.17637-4-posteuca@mutex.one>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/bios-tables-test.c | 170 ++++++++++++++++++++++++++++-----
 1 file changed, 146 insertions(+), 24 deletions(-)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index 669202fc95..77053975aa 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -64,13 +64,17 @@
 #include "boot-sector.h"
 #include "tpm-emu.h"
 #include "hw/acpi/tpm.h"
-
+#include "qemu/cutils.h"
 
 #define MACHINE_PC "pc"
 #define MACHINE_Q35 "q35"
 
 #define ACPI_REBUILD_EXPECTED_AML "TEST_ACPI_REBUILD_AML"
 
+#define OEM_ID             "TEST"
+#define OEM_TABLE_ID       "OEM"
+#define OEM_TEST_ARGS      "-machine oem-id="OEM_ID",oem-table-id="OEM_TABLE_ID
+
 typedef struct {
     bool tcg_only;
     const char *machine;
@@ -654,17 +658,28 @@ static void test_smbios_structs(test_data *data)
     }
 }
 
-static void test_acpi_one(const char *params, test_data *data)
+static void test_acpi_load_tables(test_data *data, bool use_uefi)
+{
+    if (use_uefi) {
+        g_assert(data->scan_len);
+        data->rsdp_addr = acpi_find_rsdp_address_uefi(data->qts,
+            data->ram_start, data->scan_len);
+    } else {
+        boot_sector_test(data->qts);
+        data->rsdp_addr = acpi_find_rsdp_address(data->qts);
+        g_assert_cmphex(data->rsdp_addr, <, 0x100000);
+    }
+
+    data->tables = g_array_new(false, true, sizeof(AcpiSdtTable));
+    test_acpi_rsdp_table(data);
+    test_acpi_rxsdt_table(data);
+    test_acpi_fadt_table(data);
+}
+
+static char *test_acpi_create_args(test_data *data, const char *params,
+                                   bool use_uefi)
 {
     char *args;
-    bool use_uefi = data->uefi_fl1 && data->uefi_fl2;
-
-#ifndef CONFIG_TCG
-    if (data->tcg_only) {
-        g_test_skip("TCG disabled, skipping ACPI tcg_only test");
-        return;
-    }
-#endif /* CONFIG_TCG */
 
     if (use_uefi) {
         /*
@@ -695,23 +710,24 @@ static void test_acpi_one(const char *params, test_data *data)
              params ? params : "", disk,
              data->blkdev ?: "ide-hd");
     }
+    return args;
+}
 
-    data->qts = qtest_init(args);
+static void test_acpi_one(const char *params, test_data *data)
+{
+    char *args;
+    bool use_uefi = data->uefi_fl1 && data->uefi_fl2;
 
-    if (use_uefi) {
-        g_assert(data->scan_len);
-        data->rsdp_addr = acpi_find_rsdp_address_uefi(data->qts,
-            data->ram_start, data->scan_len);
-    } else {
-        boot_sector_test(data->qts);
-        data->rsdp_addr = acpi_find_rsdp_address(data->qts);
-        g_assert_cmphex(data->rsdp_addr, <, 0x100000);
+#ifndef CONFIG_TCG
+    if (data->tcg_only) {
+        g_test_skip("TCG disabled, skipping ACPI tcg_only test");
+        return;
     }
+#endif /* CONFIG_TCG */
 
-    data->tables = g_array_new(false, true, sizeof(AcpiSdtTable));
-    test_acpi_rsdp_table(data);
-    test_acpi_rxsdt_table(data);
-    test_acpi_fadt_table(data);
+    args = test_acpi_create_args(data, params, use_uefi);
+    data->qts = qtest_init(args);
+    test_acpi_load_tables(data, use_uefi);
 
     if (getenv(ACPI_REBUILD_EXPECTED_AML)) {
         dump_aml_files(data, true);
@@ -1292,6 +1308,109 @@ static void test_acpi_virt_tcg(void)
     free_test_data(&data);
 }
 
+static void test_oem_fields(test_data *data)
+{
+    int i;
+    char oem_id[6];
+    char oem_table_id[8];
+
+    strpadcpy(oem_id, sizeof oem_id, OEM_ID, ' ');
+    strpadcpy(oem_table_id, sizeof oem_table_id, OEM_TABLE_ID, ' ');
+    for (i = 0; i < data->tables->len; ++i) {
+        AcpiSdtTable *sdt;
+
+        sdt = &g_array_index(data->tables, AcpiSdtTable, i);
+        /* FACS doesn't have OEMID and OEMTABLEID fields */
+        if (compare_signature(sdt, "FACS")) {
+            continue;
+        }
+
+        g_assert(memcmp(sdt->aml + 10, oem_id, 6) == 0);
+        g_assert(memcmp(sdt->aml + 16, oem_table_id, 8) == 0);
+    }
+}
+
+static void test_acpi_oem_fields_pc(void)
+{
+    test_data data;
+    char *args;
+
+    memset(&data, 0, sizeof(data));
+    data.machine = MACHINE_PC;
+    data.required_struct_types = base_required_struct_types;
+    data.required_struct_types_len = ARRAY_SIZE(base_required_struct_types);
+
+    args = test_acpi_create_args(&data,
+                                 OEM_TEST_ARGS, false);
+    data.qts = qtest_init(args);
+    test_acpi_load_tables(&data, false);
+    test_oem_fields(&data);
+    qtest_quit(data.qts);
+    free_test_data(&data);
+    g_free(args);
+}
+
+static void test_acpi_oem_fields_q35(void)
+{
+    test_data data;
+    char *args;
+
+    memset(&data, 0, sizeof(data));
+    data.machine = MACHINE_Q35;
+    data.required_struct_types = base_required_struct_types;
+    data.required_struct_types_len = ARRAY_SIZE(base_required_struct_types);
+
+    args = test_acpi_create_args(&data,
+                                 OEM_TEST_ARGS, false);
+    data.qts = qtest_init(args);
+    test_acpi_load_tables(&data, false);
+    test_oem_fields(&data);
+    qtest_quit(data.qts);
+    free_test_data(&data);
+    g_free(args);
+}
+
+static void test_acpi_oem_fields_microvm(void)
+{
+    test_data data;
+    char *args;
+
+    test_acpi_microvm_prepare(&data);
+
+    args = test_acpi_create_args(&data,
+                                 OEM_TEST_ARGS",acpi=on", false);
+    data.qts = qtest_init(args);
+    test_acpi_load_tables(&data, false);
+    test_oem_fields(&data);
+    qtest_quit(data.qts);
+    free_test_data(&data);
+    g_free(args);
+}
+
+static void test_acpi_oem_fields_virt(void)
+{
+    test_data data = {
+        .machine = "virt",
+        .tcg_only = true,
+        .uefi_fl1 = "pc-bios/edk2-aarch64-code.fd",
+        .uefi_fl2 = "pc-bios/edk2-arm-vars.fd",
+        .cd = "tests/data/uefi-boot-images/bios-tables-test.aarch64.iso.qcow2",
+        .ram_start = 0x40000000ULL,
+        .scan_len = 128ULL * 1024 * 1024,
+    };
+    char *args;
+
+    args = test_acpi_create_args(&data,
+                                 "-cpu cortex-a57 "OEM_TEST_ARGS, true);
+    data.qts = qtest_init(args);
+    test_acpi_load_tables(&data, true);
+    test_oem_fields(&data);
+    qtest_quit(data.qts);
+    free_test_data(&data);
+    g_free(args);
+}
+
+
 int main(int argc, char *argv[])
 {
     const char *arch = qtest_get_arch();
@@ -1304,9 +1423,10 @@ int main(int argc, char *argv[])
         if (ret) {
             return ret;
         }
-
+        qtest_add_func("acpi/q35/oem-fields", test_acpi_oem_fields_q35);
         qtest_add_func("acpi/q35/tpm-tis", test_acpi_q35_tcg_tpm_tis);
         qtest_add_func("acpi/piix4", test_acpi_piix4_tcg);
+        qtest_add_func("acpi/oem-fields", test_acpi_oem_fields_pc);
         qtest_add_func("acpi/piix4/bridge", test_acpi_piix4_tcg_bridge);
         qtest_add_func("acpi/piix4/pci-hotplug/no_root_hotplug",
                        test_acpi_piix4_no_root_hotplug);
@@ -1333,6 +1453,7 @@ int main(int argc, char *argv[])
         qtest_add_func("acpi/microvm/usb", test_acpi_microvm_usb_tcg);
         qtest_add_func("acpi/microvm/rtc", test_acpi_microvm_rtc_tcg);
         qtest_add_func("acpi/microvm/ioapic2", test_acpi_microvm_ioapic2_tcg);
+        qtest_add_func("acpi/microvm/oem-fields", test_acpi_oem_fields_microvm);
         if (strcmp(arch, "x86_64") == 0) {
             qtest_add_func("acpi/microvm/pcie", test_acpi_microvm_pcie_tcg);
         }
@@ -1341,6 +1462,7 @@ int main(int argc, char *argv[])
         qtest_add_func("acpi/virt/numamem", test_acpi_virt_tcg_numamem);
         qtest_add_func("acpi/virt/memhp", test_acpi_virt_tcg_memhp);
         qtest_add_func("acpi/virt/pxb", test_acpi_virt_tcg_pxb);
+        qtest_add_func("acpi/virt/oem-fields", test_acpi_oem_fields_virt);
     }
     ret = g_test_run();
     boot_sector_cleanup(disk);
-- 
MST


