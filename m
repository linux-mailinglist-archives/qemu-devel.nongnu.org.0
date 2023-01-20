Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 275CD674E42
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 08:41:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIm0B-0007p0-NT; Fri, 20 Jan 2023 02:39:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=37747d9ec=alistair.francis@opensource.wdc.com>)
 id 1pIm00-0007hE-Ar
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 02:39:44 -0500
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=37747d9ec=alistair.francis@opensource.wdc.com>)
 id 1pIlzy-0004pU-Hh
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 02:39:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1674200382; x=1705736382;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Dn0Zj4RzxYf4APRsmtpX9Q+QAR9mj1mPr4QlaOcuf7s=;
 b=UL5YEV9m5Y57czROWsH027st05+SuEVFjd6+o1Q1iFO6gponp5xVNjrE
 RTkGIDxGvLOYTldsWc0ri7fn6uLToIePY3LAqHXfBlt8gkT484cJusRg/
 RvLTly5XUcl4EbMfYPDm4GOyVmeZTDrStowwybWGJcauLQCSEi1oWDK9S
 5ia96Lw4Gl5nueF+WvqYLiG/LnvN1F59Fdaoj0bYPwj4JwW64ZPFwA5vc
 EcEZHe8zM8UYN4Bo/0RbuduiVOzLUd+nPbDL2iyDMU3VpSrRld/NyThH6
 RuIgMaYyrDpfSy12mW3V7BHG/chSvg6KBdqqSFbL5AdOcntEvI1TMo6/h A==;
X-IronPort-AV: E=Sophos;i="5.97,231,1669046400"; d="scan'208";a="221176691"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 20 Jan 2023 15:39:40 +0800
IronPort-SDR: j2Mho/oh8iDdfu/EHhtQEF5RvXO4A1sSKTjTE/qWB4rbZTb7oeRt2Itjb0ElNGJe7d7vlEb/q4
 h+KTKkF+ddcjeIUrxu4+nWcDLhdFD7v/5p2qpSnSAlAwNSQ0tC7BmgnLZoW9BuLZKD8ZyYKDeT
 rHmjm//Lp9eKi2usD7xJYoQPwoDZZS/I/zTWH+nbozvXvAJMJ16Qv0YDDYTOVGz1M8iLomj22K
 NlJ7m9aVq7ZxFPoGl/3MDrmctFVYqFGhoBBYZgKWd6V1+efNXt1TwsrRlTu4Cipg/NU9taXOgE
 GZs=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Jan 2023 22:57:18 -0800
IronPort-SDR: MANW0yAq++OCLktwZL6AP6gOkIGl+RDCz95qoUSxeWFKNvBfHBSZTgKy8WKAqYwqo6McZO0GsJ
 64+rUZTPjV6K2S+pCH4/HEkdwzLYSyJ1WVW/If+PimtZnkTi14pQZlFJO7GqlT+WLT/n9zp60N
 mc+YWf2SkRSSFZNNzEV8U4OLZ7Vd/9jZYgcEYt8hpGijEq/x3maZx+tPKf/w5FhOkxcTuDtsPJ
 WblGXM0Fo8CSPQf9y4jlQsl1ZaONaSexBwXjxlUgjBTrnUE8POVWp3orMTEkYziXxNaTmHpkL6
 Y9w=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Jan 2023 23:39:40 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Nyrx80DJDz1RwtC
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 23:39:40 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:references:in-reply-to:x-mailer:message-id:date
 :subject:to:from; s=dkim; t=1674200379; x=1676792380; bh=Dn0Zj4R
 zxYf4APRsmtpX9Q+QAR9mj1mPr4QlaOcuf7s=; b=GY1nMVGIFJqWWizekdvVoUH
 38TJdT7I0Z4ImPK58z7vemhAhPdlpJtJ9Hsq8q0ZtNoUB6VTHRy89GHSjAd3sO5L
 9rFUCwsjI12SQ5ebgzhOGIeFGUVxwJZHSz3m5EO9AOMXUCaFkGBrHuXQCMLE5WLF
 nJyEytxNlar6Ye8idVirsE8GcsIBOP0XlxW3gr04ELxcN+6i32i+pg+lajXkmuDZ
 D2iFm78UI2Ska1Pb/FKSd/hfYo4lHU+rq7s6BpgcJDAoLvBOvuT5fyoRlul93kAJ
 RoE6MzPhu729cm5/kYo9xqTIof5CF00JDFZbkFZ6BuKnpoNB+OYazSsqfF3/LcQ=
 =
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 6PAJ2usp3Q18 for <qemu-devel@nongnu.org>;
 Thu, 19 Jan 2023 23:39:39 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.167.38])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Nyrx55l3Sz1Rwrq;
 Thu, 19 Jan 2023 23:39:37 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng@tinylab.org>
Subject: [PULL 09/37] hw/riscv/boot.c: make riscv_find_firmware() static
Date: Fri, 20 Jan 2023 17:38:45 +1000
Message-Id: <20230120073913.1028407-10-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230120073913.1028407-1-alistair.francis@opensource.wdc.com>
References: <20230120073913.1028407-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

The only caller is riscv_find_and_load_firmware(), which is in the same
file.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng@tinylab.org>
Signed-off-by: Bin Meng <bmeng@tinylab.org>
Message-Id: <20221221182300.307900-5-dbarboza@ventanamicro.com>
Message-Id: <20221229091828.1945072-10-bmeng@tinylab.org>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 include/hw/riscv/boot.h |  1 -
 hw/riscv/boot.c         | 44 ++++++++++++++++++++---------------------
 2 files changed, 22 insertions(+), 23 deletions(-)

diff --git a/include/hw/riscv/boot.h b/include/hw/riscv/boot.h
index 93e5f8760d..c03e4e74c5 100644
--- a/include/hw/riscv/boot.h
+++ b/include/hw/riscv/boot.h
@@ -37,7 +37,6 @@ target_ulong riscv_find_and_load_firmware(MachineState =
*machine,
                                           const char *default_machine_fi=
rmware,
                                           hwaddr firmware_load_addr,
                                           symbol_fn_t sym_cb);
-char *riscv_find_firmware(const char *firmware_filename);
 target_ulong riscv_load_firmware(const char *firmware_filename,
                                  hwaddr firmware_load_addr,
                                  symbol_fn_t sym_cb);
diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
index ebd351c840..7361d5c0d8 100644
--- a/hw/riscv/boot.c
+++ b/hw/riscv/boot.c
@@ -75,6 +75,28 @@ target_ulong riscv_calc_kernel_start_addr(RISCVHartArr=
ayState *harts,
     }
 }
=20
+static char *riscv_find_firmware(const char *firmware_filename)
+{
+    char *filename;
+
+    filename =3D qemu_find_file(QEMU_FILE_TYPE_BIOS, firmware_filename);
+    if (filename =3D=3D NULL) {
+        if (!qtest_enabled()) {
+            /*
+             * We only ship OpenSBI binary bios images in the QEMU sourc=
e.
+             * For machines that use images other than the default bios,
+             * running QEMU test will complain hence let's suppress the =
error
+             * report for QEMU testing.
+             */
+            error_report("Unable to load the RISC-V firmware \"%s\"",
+                         firmware_filename);
+            exit(1);
+        }
+    }
+
+    return filename;
+}
+
 target_ulong riscv_find_and_load_firmware(MachineState *machine,
                                           const char *default_machine_fi=
rmware,
                                           hwaddr firmware_load_addr,
@@ -104,28 +126,6 @@ target_ulong riscv_find_and_load_firmware(MachineSta=
te *machine,
     return firmware_end_addr;
 }
=20
-char *riscv_find_firmware(const char *firmware_filename)
-{
-    char *filename;
-
-    filename =3D qemu_find_file(QEMU_FILE_TYPE_BIOS, firmware_filename);
-    if (filename =3D=3D NULL) {
-        if (!qtest_enabled()) {
-            /*
-             * We only ship OpenSBI binary bios images in the QEMU sourc=
e.
-             * For machines that use images other than the default bios,
-             * running QEMU test will complain hence let's suppress the =
error
-             * report for QEMU testing.
-             */
-            error_report("Unable to load the RISC-V firmware \"%s\"",
-                         firmware_filename);
-            exit(1);
-        }
-    }
-
-    return filename;
-}
-
 target_ulong riscv_load_firmware(const char *firmware_filename,
                                  hwaddr firmware_load_addr,
                                  symbol_fn_t sym_cb)
--=20
2.39.0


