Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 749CF6E1D59
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Apr 2023 09:37:54 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pnDyO-0007FH-73; Fri, 14 Apr 2023 03:35:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slankes@eonerc.rwth-aachen.de>)
 id 1pnDyH-0007F0-6I; Fri, 14 Apr 2023 03:35:49 -0400
Received: from mail-out-4.itc.rwth-aachen.de ([2a00:8a60:1:e501::5:49])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slankes@eonerc.rwth-aachen.de>)
 id 1pnDyD-0005sL-D6; Fri, 14 Apr 2023 03:35:48 -0400
X-IPAS-Result: =?us-ascii?q?A2DIAgAJAjlk/5gagoZaHAEBAQEBAQcBARIBAQQEAQGCD?=
 =?us-ascii?q?4R9tV8PAQEBAQEBAQEBCAFEBAEBhQYChTwnOBMBAgQBAQEBAwIDAQEBAQEBA?=
 =?us-ascii?q?wEBBgEBAQEBAQYEgR2FL0aGBAIBAycLAUYQUVcGDgWCfoJdsA8zgQGEcppqg?=
 =?us-ascii?q?WcJAYE3i3SFRkKBSUSBS4EGjTMEmk0KgTR0gSAOSnKBBAIJAhFrgRAIaYF5Q?=
 =?us-ascii?q?AINYwsOb4FJgU6BXAQCFEcOEjcDCQMHBSwdQAMLGA0WOhMsNRQfXGwtEhIFA?=
 =?us-ascii?q?wsVKkcECDgGHDQRAggPEg8sRAxCNzMTBlwBKQsOEQNPQhlsBIEKgQEGASYkn?=
 =?us-ascii?q?kZPBoEIgmmSdrEGgjKBVqBtGjOXF5Irl3WjSoQsAgQCBAUCFoF6gX4zGggcF?=
 =?us-ascii?q?IMiUhcCD44sFpNLcz0CBwsBAQMJi0UBAQ?=
IronPort-Data: A9a23:ZzKjraMUPcqWea3vrR3PlsFynXyQoLVcMsEvi/4bfWQNrUon3zYGy
 zcbXWnUP/3eYDCgctskb4uw/UkDupaDnNY3HnM5pCpnJ55oRWspJvzEdBuqb3PKRiHnZBg6h
 ynLQoCYdKjYdleF+lH3dOKJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYx6TSCK17L6
 IKaT/H3Ygf/gGYoaz5MsspvlTs21BjMkGJA1rABTa0T1LPuvyF9JI4SI6i3M0z5TuF8dgJtb
 7+epF0R1jqxEyYFUrtJoJ6iGqE5auK60Ty1t5Zjc/PKbi5q+3ZuiPZrbJLwXm8M49mBt4gZJ
 NygLvVcQy9xVkHHsLx1vxW1j0iSMIUekIIrL0RTvuSR70PebXH04sl/Um1rJ6oTxfpXDlNBo
 KlwxDAlNnhvhsqs3667R/kpnZ1mJY/xI58f/3hsiz3UZRokacmYH+OTvocehml2350UdRrdT
 5NxhT5HdxDJZR5CIX8aD5QzhuzunGbjc3hRoVmVqKxx72W7IAlZieeyaIqJJ4PVLSlTtmifq
 FrN83T/PiEhO/eU62eJrWyvr/CayEsXX6pXTtVU7MVCmVCW2ykfBQMbUXO9pv+2jFP4XMhQQ
 2QM9zYjt+43/V2nQ935dxm5pneeuVgbQdU4O/Q37RzIw7DRywCeAGcCU3hGctNOiSMtbSY1y
 l+Ej5byXHlm9qeKVXLY/7vSoT7a1TUpEFLurBQsFWMti+QPaqlp5v4TZr6PyJKIs+A=
IronPort-HdrOrdr: A9a23:Ta4mSK2LYH5WDQD++YgMVAqjBIMkLtp133Aq2lEZdPRUGvb1qy
 nIpoV+6faUskd3ZJhOo7690cW7K080sKQFgrX5Xo3SOTUO2lHIEGgK1+KLqAEIWReOlNK1vZ
 0QFZSWY+eeMbEVt6vHCF7SKadZ/DD+ysCVbLDlvg5QcT0=
X-Talos-CUID: 9a23:+LbNx2F8p9owJy91qmJl1EAMBMo9U0HMkluNOWizNnpJR4+aHAo=
X-Talos-MUID: 9a23:ijtkdAY4IwzJd+BTmTjivDpuJMFU05+hI0svzJlZpcqtKnkl
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.99,195,1677538800"; d="scan'208";a="177084577"
Received: from rwthex-s1-a.rwth-ad.de ([134.130.26.152])
 by mail-in-4.itc.rwth-aachen.de with ESMTP; 14 Apr 2023 09:35:37 +0200
Received: from Tartaros.fritz.box (2a0a:a540:ee49:0:4dac:dbd1:97f4:c51) by
 rwthex-s1-a.rwth-ad.de (2a00:8a60:1:e500::26:152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 14 Apr 2023 09:35:35 +0200
From: Stefan Lankes <slankes@eonerc.rwth-aachen.de>
To: <qemu-devel@nongnu.org>
CC: <peter.maydell@linaro.org>, <qemu-arm@nongnu.org>, Stefan Lankes
 <slankes@eonerc.rwth-aachen.de>
Subject: [RFC 1/1] add support of `--initrd` for ELF-ARM kernels
Date: Fri, 14 Apr 2023 09:34:32 +0200
Message-ID: <20230414073432.36000-2-slankes@eonerc.rwth-aachen.de>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20230414073432.36000-1-slankes@eonerc.rwth-aachen.de>
References: <20230414073432.36000-1-slankes@eonerc.rwth-aachen.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [2a0a:a540:ee49:0:4dac:dbd1:97f4:c51]
X-ClientProxiedBy: rwthex-w1-a.rwth-ad.de (2a00:8a60:1:e500::26:156) To
 rwthex-s1-a.rwth-ad.de (2a00:8a60:1:e500::26:152)
Received-SPF: pass client-ip=2a00:8a60:1:e501::5:49;
 envelope-from=slankes@eonerc.rwth-aachen.de;
 helo=mail-out-4.itc.rwth-aachen.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Currently, the flag `--initrd` is only support for Linux ARM kernels.
However, also other ELF kernels could depend on an initial ramdisk.
This PR loads also the initrd for ELF kernels and announce the
location by the nodes "/chosen/initrd-start" and
"/chosen/initrd-end" within the device tree.

Signed-off-by: Stefan Lankes <slankes@eonerc.rwth-aachen.de>
---
 hw/arm/boot.c | 106 +++++++++++++++++++++++++++++---------------------
 1 file changed, 62 insertions(+), 44 deletions(-)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index 54f6a3e0b3..f767a4809e 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -657,20 +657,38 @@ int arm_load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
     }
 
     if (binfo->initrd_size) {
-        rc = qemu_fdt_setprop_sized_cells(fdt, "/chosen", "linux,initrd-start",
+        if (binfo->is_linux) {
+            rc = qemu_fdt_setprop_sized_cells(fdt, "/chosen", "linux,initrd-start",
                                           acells, binfo->initrd_start);
-        if (rc < 0) {
-            fprintf(stderr, "couldn't set /chosen/linux,initrd-start\n");
-            goto fail;
-        }
+            if (rc < 0) {
+                fprintf(stderr, "couldn't set /chosen/linux,initrd-start\n");
+                goto fail;
+            }
 
-        rc = qemu_fdt_setprop_sized_cells(fdt, "/chosen", "linux,initrd-end",
-                                          acells,
-                                          binfo->initrd_start +
-                                          binfo->initrd_size);
-        if (rc < 0) {
-            fprintf(stderr, "couldn't set /chosen/linux,initrd-end\n");
-            goto fail;
+            rc = qemu_fdt_setprop_sized_cells(fdt, "/chosen", "linux,initrd-end",
+                                              acells,
+                                              binfo->initrd_start +
+                                              binfo->initrd_size);
+            if (rc < 0) {
+                fprintf(stderr, "couldn't set /chosen/linux,initrd-end\n");
+                goto fail;
+            }
+        } else {
+            rc = qemu_fdt_setprop_sized_cells(fdt, "/chosen", "initrd-start",
+                                          acells, binfo->initrd_start);
+            if (rc < 0) {
+                fprintf(stderr, "couldn't set /chosen/initrd-start\n");
+                goto fail;
+            }
+
+            rc = qemu_fdt_setprop_sized_cells(fdt, "/chosen", "initrd-end",
+                                              acells,
+                                              binfo->initrd_start +
+                                              binfo->initrd_size);
+            if (rc < 0) {
+                fprintf(stderr, "couldn't set /chosen/initrd-end\n");
+                goto fail;
+            }
         }
     }
 
@@ -1099,41 +1117,41 @@ static void arm_setup_direct_kernel_boot(ARMCPU *cpu,
     }
     info->initrd_start = TARGET_PAGE_ALIGN(info->initrd_start);
 
-    if (is_linux) {
-        uint32_t fixupcontext[FIXUP_MAX];
-
-        if (info->initrd_filename) {
+    if (info->initrd_filename) {
 
-            if (info->initrd_start >= ram_end) {
-                error_report("not enough space after kernel to load initrd");
-                exit(1);
-            }
+        if (info->initrd_start >= ram_end) {
+            error_report("not enough space after kernel to load initrd");
+            exit(1);
+        }
 
-            initrd_size = load_ramdisk_as(info->initrd_filename,
-                                          info->initrd_start,
-                                          ram_end - info->initrd_start, as);
-            if (initrd_size < 0) {
-                initrd_size = load_image_targphys_as(info->initrd_filename,
-                                                     info->initrd_start,
-                                                     ram_end -
-                                                     info->initrd_start,
-                                                     as);
-            }
-            if (initrd_size < 0) {
-                error_report("could not load initrd '%s'",
-                             info->initrd_filename);
-                exit(1);
-            }
-            if (info->initrd_start + initrd_size > ram_end) {
-                error_report("could not load initrd '%s': "
-                             "too big to fit into RAM after the kernel",
-                             info->initrd_filename);
-                exit(1);
-            }
-        } else {
-            initrd_size = 0;
+        initrd_size = load_ramdisk_as(info->initrd_filename,
+                                      info->initrd_start,
+                                      ram_end - info->initrd_start, as);
+        if (initrd_size < 0) {
+            initrd_size = load_image_targphys_as(info->initrd_filename,
+                                                 info->initrd_start,
+                                                 ram_end -
+                                                 info->initrd_start,
+                                                 as);
+        }
+        if (initrd_size < 0) {
+            error_report("could not load initrd '%s'",
+                         info->initrd_filename);
+            exit(1);
+        }
+        if (info->initrd_start + initrd_size > ram_end) {
+            error_report("could not load initrd '%s': "
+                         "too big to fit into RAM after the kernel",
+                         info->initrd_filename);
+            exit(1);
         }
-        info->initrd_size = initrd_size;
+    } else {
+        initrd_size = 0;
+    }
+    info->initrd_size = initrd_size;
+
+    if (is_linux) {
+        uint32_t fixupcontext[FIXUP_MAX];
 
         fixupcontext[FIXUP_BOARDID] = info->board_id;
         fixupcontext[FIXUP_BOARD_SETUP] = info->board_setup_addr;
-- 
2.39.2 (Apple Git-143)


