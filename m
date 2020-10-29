Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0453129EE2C
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Oct 2020 15:27:42 +0100 (CET)
Received: from localhost ([::1]:50526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kY8tx-0003Az-1N
	for lists+qemu-devel@lfdr.de; Thu, 29 Oct 2020 10:27:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=56447669b=alistair.francis@wdc.com>)
 id 1kY8rs-0001QR-O4
 for qemu-devel@nongnu.org; Thu, 29 Oct 2020 10:25:32 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:42881)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=56447669b=alistair.francis@wdc.com>)
 id 1kY8rp-0005fG-MV
 for qemu-devel@nongnu.org; Thu, 29 Oct 2020 10:25:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1603981529; x=1635517529;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bxfmTayuMlAkbdWAwkDMu9qmrbCTEm5F3jlbPoZ/kFE=;
 b=DG6WAdPWHmZD6JGt3EtCkO/RbfJ4839Wv+j2W6zG9uMFaADMF/vgmMEl
 +OEAOR/mvmBdv0zNVPfqijbl3JX6NncoT66ZnHDZwidTxm14JoogaGjQJ
 8AcEvxUamZ+iSHvudKqJBkxSW58bmS9g/Db9Ubgq2xfT6HsfypwTS/9jA
 tNnMkLVsebudXiryBWVEHzf6ZuwciJwQDv6NUlEKwxfDtL/cdd8W9b2pz
 baYnsSba6CvsGMYRZQsK2fFVkd64bYLG7ys6BgrUHqy7d8S3uE++lyYYR
 zWbU/nOi6lJP16vKD2jqUG8JMrHxbKJ122WyiC5i4TbhIKeIHncbCS9J4 g==;
IronPort-SDR: xsQgYOGqYSFFTwzSWhApPs4y/Qd3kaXMUKKLexxc2oyXrZq4gK/g7awU17LTmFFinJkDvKPELQ
 AkG2ZCAUzxcjS3LkJhMTfzMB775tsLbNRd58XKm7wiAbowT7bAVlmcNqlokTH2dJfG7mmt9iGY
 908nC0Az2y5BAWMP0q/q8btuU9mbOj+c7mC4oY0xzBJ5Fm3+0aAidFBBsoMI7ImboNKQjf12S2
 U6KugoLFEp4sofAB4Qqk1KiFMQJVzZoxvk8tvKHL49a4aqYyIW9UgVFBAdxakBOxto1u50fUOp
 e80=
X-IronPort-AV: E=Sophos;i="5.77,430,1596470400"; d="scan'208";a="151317868"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 29 Oct 2020 22:25:26 +0800
IronPort-SDR: I5c16FPdcENwKr5pqqki3WcluefdkMgbwlmAOBkselqeh4ACkwIyxyKUsh4p072JwnyMLJCT4L
 ljNp57ctlaynxO5HLQrRotNB29PzFBQrC4r3QNrQFD//q2kRQ9Aj9v38I0pUn5M+6ubepVkvj3
 nqCGoiAPBFGnoxyM3YZ5wKQ8mN3wjoGg36GwuVwqYR+ql2PYeo02DB8E5W9KdBTkWloe/jzxVg
 dZIwLeL4eU9nAYUlJ7UTKArDwj1MhcneRv7NNdmvf6WRVWxGhVCCdHLu/YLay5WTdhmMunB2Hl
 qDtsmj9f1joeKkO7LpP8mqLo
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2020 07:11:41 -0700
IronPort-SDR: BBKrLImkmy8KZOODXm2YGyVMv9+3I5QCLfU0hkPZ4KQPkGVaDwAaVD/1KUfbQUNo//kBmzq1rp
 iSq43dZ4BpZT/9dB6xnc3jUsVn9oMtmSYzRPjJ/a63wIgQYp7I3FDxZvpeYW56s6E8DEy8jWAe
 WFkGiSrnR4Y5L6HrzOu6yv3A0xV6vUlgAqNw0pZFtZTjIMKov1HK0/MXZN/Z8S9kLapYJzg3qs
 6JBzTlTDV7k0R6HbKJ+t+lDr2WOIShnvS7H8FOJPCLI2G6VFfFiF25iVFPJVD2PdKShY3q33en
 qQ8=
WDCIronportException: Internal
Received: from usa003000.ad.shared (HELO risc6-mainframe.hgst.com)
 ([10.86.60.131])
 by uls-op-cesaip01.wdc.com with ESMTP; 29 Oct 2020 07:25:27 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL 01/18] hw/riscv: sifive_u: Allow passing custom DTB
Date: Thu, 29 Oct 2020 07:13:41 -0700
Message-Id: <20201029141358.3102636-2-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201029141358.3102636-1-alistair.francis@wdc.com>
References: <20201029141358.3102636-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=56447669b=alistair.francis@wdc.com;
 helo=esa5.hgst.iphmx.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/29 10:25:26
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: alistair23@gmail.com, Anup Patel <anup.patel@wdc.com>,
 Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Anup Patel <anup.patel@wdc.com>

Extend sifive_u machine to allow passing custom DTB using "-dtb"
command-line parameter. This will help users pass modified DTB
or Linux SiFive DTB to sifive_u machine.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20201022053225.2596110-1-anup.patel@wdc.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/sifive_u.c | 28 ++++++++++++++++++++--------
 1 file changed, 20 insertions(+), 8 deletions(-)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index b2472c6627..2f19a9cda2 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -100,14 +100,25 @@ static void create_fdt(SiFiveUState *s, const struct MemmapEntry *memmap,
     int cpu;
     uint32_t *cells;
     char *nodename;
+    const char *dtb_filename;
     char ethclk_names[] = "pclk\0hclk";
     uint32_t plic_phandle, prci_phandle, gpio_phandle, phandle = 1;
     uint32_t hfclk_phandle, rtcclk_phandle, phy_phandle;
 
-    fdt = s->fdt = create_device_tree(&s->fdt_size);
-    if (!fdt) {
-        error_report("create_device_tree() failed");
-        exit(1);
+    dtb_filename = qemu_opt_get(qemu_get_machine_opts(), "dtb");
+    if (dtb_filename) {
+        fdt = s->fdt = load_device_tree(dtb_filename, &s->fdt_size);
+        if (!fdt) {
+            error_report("load_device_tree() failed");
+            exit(1);
+        }
+        goto update_bootargs;
+    } else {
+        fdt = s->fdt = create_device_tree(&s->fdt_size);
+        if (!fdt) {
+            error_report("create_device_tree() failed");
+            exit(1);
+        }
     }
 
     qemu_fdt_setprop_string(fdt, "/", "model", "SiFive HiFive Unleashed A00");
@@ -390,13 +401,14 @@ static void create_fdt(SiFiveUState *s, const struct MemmapEntry *memmap,
 
     qemu_fdt_add_subnode(fdt, "/chosen");
     qemu_fdt_setprop_string(fdt, "/chosen", "stdout-path", nodename);
-    if (cmdline) {
-        qemu_fdt_setprop_string(fdt, "/chosen", "bootargs", cmdline);
-    }
-
     qemu_fdt_setprop_string(fdt, "/aliases", "serial0", nodename);
 
     g_free(nodename);
+
+update_bootargs:
+    if (cmdline) {
+        qemu_fdt_setprop_string(fdt, "/chosen", "bootargs", cmdline);
+    }
 }
 
 static void sifive_u_machine_reset(void *opaque, int n, int level)
-- 
2.28.0


