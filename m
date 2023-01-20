Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7923674E43
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 08:41:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIm0F-0007uw-BU; Fri, 20 Jan 2023 02:39:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=37747d9ec=alistair.francis@opensource.wdc.com>)
 id 1pIm0C-0007qd-Sh
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 02:39:56 -0500
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=37747d9ec=alistair.francis@opensource.wdc.com>)
 id 1pIm0B-0004pU-0X
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 02:39:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1674200394; x=1705736394;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nqQG7k5fhFlJn1OmbIYfAXBTtjCCcG5eoJ1I/boo0bQ=;
 b=Hs0GebFmkIYgAy0o73grv6R6bGy7EbOEYOrL94voEKQbVb72eB+D7vIY
 Mbh7KXlDhwoagEMlB/2/QA8x3yf27Kh8Qqg2fcdZALIvZQLg4YiKBZMkW
 avAImVO5JONobm2GjVdDI7UgnGCW2SKr/gewfINysOEszU7zUyjLBriIO
 Rln7aI+266LnZ+zD/4Sc1cJQMpVYUlU4WAA7NYaaA1iAAhRH4y1AU3fpf
 V2Aov+xq5mujx6icFvlPL8FKK3riN0xFhx9feRYETfofnjYChrXu1OhYx
 dalIa45NZcCnjJzANZQJYq1qZrg4FYqtdDlfAYCCNvSB0DTFVtd/jSGcs A==;
X-IronPort-AV: E=Sophos;i="5.97,231,1669046400"; d="scan'208";a="221176695"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 20 Jan 2023 15:39:44 +0800
IronPort-SDR: SqqDfuIkd5Pb/sCkhA9vC1GKmJsCI3/3gK6OemoixRGoDnfY+FyruqkGLNV97GHMM7WxrEpQBq
 NN+OzHAiVBi0SbOLuKs40mgQDUVNfQoTFroZMwy9o28Hu6ihjMqpUsZrChcSycwel3p+MUfT+l
 kU3+p7Xgn/YeNmtcW9beVe9AqTtEJr9m/fjhWseMnwJmFcv1y83HcWBBJjcjJuyy6tWdS/FV9+
 Sg9SASekFhUbV1yULGVxMEfXc0i7k0VCGAKQu+raD6sU04Zlj92GObFsunc9cJJfET9Ceh9GN2
 dWM=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Jan 2023 22:57:22 -0800
IronPort-SDR: 16GAIto4lGjgLEofgK6UfrXI2cqN2ttL6iqttuj06XtQUhksmJSpIG4Zr9EKU9/Zig6ZDMdlzD
 SRiTHD4ypnFrPSWnr7IvyVws4m2Qlb0AedHZuvGVgAuzQSChA3xLCFAWwgvh4pU+5lZi0Y8A6Q
 vDwoI/pbHrCDdv5Ard/A1PI+iOuIdTMYLSSd7s2fZOP6P6x4vU8h/AdZ6nf4XbwsLXb+JjY8KP
 D2sLV4T7x2ds748CYvP1yROLGK/VGV23USKb/N0uMQv7+3fc8WnRzote0r+T6Xuh9TqFHvfirN
 DIk=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Jan 2023 23:39:44 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4NyrxC6xNdz1Rwt8
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 23:39:43 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1674200383; x=1676792384; bh=nqQG7k5fhFlJn1OmbI
 YfAXBTtjCCcG5eoJ1I/boo0bQ=; b=jUFNnvthHlVKCxjaKTCkuNm8d/PH5gwx+x
 +B4jqTQfu6OP/6UBMz06hBrnmaNzt3GDs5rOXeThF11s2CNPPGEMFtcOX1PiTCym
 hlPV6zx191zbZrD6SYPzOLBdV/1bQCa//PiiJ7P9PhJW3PjiCp5Dv87QplmTHLb3
 nKi4uEPl4rtBpWdZJ7a46sVsFsTMVb9QZjBvpPTBMcZbt40wNUU7LePbjeIvK7OF
 V0Mqx6NFJ9pv+Zvs3a8xNwBRD8KfZDeJeqpolzQcvXSbwe1N3YZGPchQpseQQJyl
 mX4FYj2UC1sddfsmI4oyjL329tonkkvQndRSiFHdFBrmgwzVVeUA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id OUzEhusAviYc for <qemu-devel@nongnu.org>;
 Thu, 19 Jan 2023 23:39:43 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.167.38])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4NyrxB07PPz1RvTp;
 Thu, 19 Jan 2023 23:39:41 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Bin Meng <bmeng@tinylab.org>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 11/37] hw/riscv/boot.c: Introduce riscv_find_firmware()
Date: Fri, 20 Jan 2023 17:38:47 +1000
Message-Id: <20230120073913.1028407-12-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230120073913.1028407-1-alistair.francis@opensource.wdc.com>
References: <20230120073913.1028407-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=37747d9ec=alistair.francis@opensource.wdc.com;
 helo=esa5.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Bin Meng <bmeng@tinylab.org>

Rename previous riscv_find_firmware() to riscv_find_bios(), and
introduce a new riscv_find_firmware() to implement the first half
part of the work done in riscv_find_and_load_firmware().

This new API is helpful for machine that wants to know the final
chosen firmware file name but does not want to load it.

Signed-off-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20221229091828.1945072-12-bmeng@tinylab.org>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 include/hw/riscv/boot.h |  2 ++
 hw/riscv/boot.c         | 39 +++++++++++++++++++++++++--------------
 2 files changed, 27 insertions(+), 14 deletions(-)

diff --git a/include/hw/riscv/boot.h b/include/hw/riscv/boot.h
index 60cf320c88..b273ab22f7 100644
--- a/include/hw/riscv/boot.h
+++ b/include/hw/riscv/boot.h
@@ -38,6 +38,8 @@ target_ulong riscv_find_and_load_firmware(MachineState =
*machine,
                                           hwaddr firmware_load_addr,
                                           symbol_fn_t sym_cb);
 const char *riscv_default_firmware_name(RISCVHartArrayState *harts);
+char *riscv_find_firmware(const char *firmware_filename,
+                          const char *default_machine_firmware);
 target_ulong riscv_load_firmware(const char *firmware_filename,
                                  hwaddr firmware_load_addr,
                                  symbol_fn_t sym_cb);
diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
index e1a544b1d9..98b80af51b 100644
--- a/hw/riscv/boot.c
+++ b/hw/riscv/boot.c
@@ -84,11 +84,11 @@ const char *riscv_default_firmware_name(RISCVHartArra=
yState *harts)
     return RISCV64_BIOS_BIN;
 }
=20
-static char *riscv_find_firmware(const char *firmware_filename)
+static char *riscv_find_bios(const char *bios_filename)
 {
     char *filename;
=20
-    filename =3D qemu_find_file(QEMU_FILE_TYPE_BIOS, firmware_filename);
+    filename =3D qemu_find_file(QEMU_FILE_TYPE_BIOS, bios_filename);
     if (filename =3D=3D NULL) {
         if (!qtest_enabled()) {
             /*
@@ -97,8 +97,8 @@ static char *riscv_find_firmware(const char *firmware_f=
ilename)
              * running QEMU test will complain hence let's suppress the =
error
              * report for QEMU testing.
              */
-            error_report("Unable to load the RISC-V firmware \"%s\"",
-                         firmware_filename);
+            error_report("Unable to find the RISC-V BIOS \"%s\"",
+                         bios_filename);
             exit(1);
         }
     }
@@ -106,25 +106,36 @@ static char *riscv_find_firmware(const char *firmwa=
re_filename)
     return filename;
 }
=20
-target_ulong riscv_find_and_load_firmware(MachineState *machine,
-                                          const char *default_machine_fi=
rmware,
-                                          hwaddr firmware_load_addr,
-                                          symbol_fn_t sym_cb)
+char *riscv_find_firmware(const char *firmware_filename,
+                          const char *default_machine_firmware)
 {
-    char *firmware_filename =3D NULL;
-    target_ulong firmware_end_addr =3D firmware_load_addr;
+    char *filename =3D NULL;
=20
-    if ((!machine->firmware) || (!strcmp(machine->firmware, "default")))=
 {
+    if ((!firmware_filename) || (!strcmp(firmware_filename, "default")))=
 {
         /*
          * The user didn't specify -bios, or has specified "-bios defaul=
t".
          * That means we are going to load the OpenSBI binary included i=
n
          * the QEMU source.
          */
-        firmware_filename =3D riscv_find_firmware(default_machine_firmwa=
re);
-    } else if (strcmp(machine->firmware, "none")) {
-        firmware_filename =3D riscv_find_firmware(machine->firmware);
+        filename =3D riscv_find_bios(default_machine_firmware);
+    } else if (strcmp(firmware_filename, "none")) {
+        filename =3D riscv_find_bios(firmware_filename);
     }
=20
+    return filename;
+}
+
+target_ulong riscv_find_and_load_firmware(MachineState *machine,
+                                          const char *default_machine_fi=
rmware,
+                                          hwaddr firmware_load_addr,
+                                          symbol_fn_t sym_cb)
+{
+    char *firmware_filename;
+    target_ulong firmware_end_addr =3D firmware_load_addr;
+
+    firmware_filename =3D riscv_find_firmware(machine->firmware,
+                                            default_machine_firmware);
+
     if (firmware_filename) {
         /* If not "none" load the firmware */
         firmware_end_addr =3D riscv_load_firmware(firmware_filename,
--=20
2.39.0


