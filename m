Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A88A2608C53
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Oct 2022 13:11:05 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omAdl-00007Y-0t; Sat, 22 Oct 2022 05:18:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1omAdi-00007G-GM
 for qemu-devel@nongnu.org; Sat, 22 Oct 2022 05:17:58 -0400
Received: from mout.kundenserver.de ([212.227.126.133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1omAdg-0008O5-7X
 for qemu-devel@nongnu.org; Sat, 22 Oct 2022 05:17:58 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MvKGv-1p3QPJ12un-00rGSL; Sat, 22
 Oct 2022 11:17:52 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>, "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PULL 1/2] m68k: rework BI_VIRT_RNG_SEED as BI_RNG_SEED
Date: Sat, 22 Oct 2022 11:17:49 +0200
Message-Id: <20221022091750.2713763-2-laurent@vivier.eu>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221022091750.2713763-1-laurent@vivier.eu>
References: <20221022091750.2713763-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:8fWbqrSmaGfx7Wbjl/+9Ma7gYgM8ePSycI9b9J7Zr8QNISmXj+5
 3+T3Tcx8p9kxl8wQe6vAF2P0bW4oLw22d98Tu3FSwtPPuz0myTv7bDia3L6+ayx5jic1p4o
 jNC2C5f1GUH9n8xSGcpdC0FP8rDaRpZPr/Mvd+WnoD+zMA6mqVg4pRHuBiAjEK1bPKykkul
 1rZwZ0Xc6W/PFG5QaD0dQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:9Lbq5DBceTY=:7GmOWHtVlAbvgl4MsdUZNI
 exDYeWGH4BVeBAgdAL3PCNtCNTT4dXnEdbMm6JXANWKhOJGWRTkw1pNcZMPjR9Ml4rCRT9ja+
 gleMawPFy/9N2VEV1w/S7Wy4ttHaPndXOpkFfW0Epo15soSS5QH9YzPghnA6uyPjBmEAqN1jN
 eux/OrQI5Sf7Uj+tjuzwA1ZgBk2qD6rEWc/zZQ2U3rvZx7zzp4prxW+AmjMQ9HRj4GuuhopC9
 TQ1E83Dirb2b4a2pLiAO/VaUSK8tIbaxTYwH7G6k6gyXZdAy5EuqRFSBzZDkEkWJQauLbwFKX
 q4BEY05/vTjio/WdKONV0qeQPowFUR1FHUUilE6ieZVcL2K35zxTYcywAJXLElq7sYOGdwbF0
 ruPPgyWS26yyboYiJH8r6NeZG+u8c5OcT5TouwIxrCy5kmgPPnD2EuZNqwbt/mt69N/g0Px+B
 S62kpH8g9MbDEjAWy9r2IdBDWq9wymm9Ud8uPn8p+UoGk/s9PDIScsEz2K6dicNlSxrYRWSml
 jf+hg+w/+6UqxcZEFClEMNzfHkRTKKczKA6TbeOHfccSPf4vP52/v/GO9FVqbu7eQtYlj0yYp
 f9KgDpGYd2RT5W0s09CwybOU5UWUaSdNeZPRXTJviawi4fyH1IY/+J7VgfvWLnwL5CPbUUzRI
 /ysbfGx9zG2EZKxVJNlUGRl0QgUaDN2IT+fU3RZtSk5JEzCWkeOEyg4MAyrgZ7KCJL0s0Dm+I
 GyHaik84NmzCGzQAgBs0n8T5HP5zmjQcZoroKMzI1er7NkjdZRBy8hIUNl/q/ZT76KC+IoOl/
 bu5sUdG
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: "Jason A. Donenfeld" <Jason@zx2c4.com>

Following a change on the kernel side (see link), pass BI_RNG_SEED
instead of BI_VIRT_RNG_SEED. This should have no impact on
compatibility, as there will simply be no effect if it's an old kernel,
which is how things have always been. We then use this as an opportunity
to add this to q800, since now we can, which is a nice improvement.

Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Laurent Vivier <laurent@vivier.eu>
Link: https://lore.kernel.org/lkml/20220923170340.4099226-3-Jason@zx2c4.com/
Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
Message-Id: <20220926113900.1256630-1-Jason@zx2c4.com>
[lv: s/^I/         /g]
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 include/standard-headers/asm-m68k/bootinfo-virt.h | 4 +++-
 include/standard-headers/asm-m68k/bootinfo.h      | 8 +++++++-
 hw/m68k/q800.c                                    | 7 +++++++
 hw/m68k/virt.c                                    | 8 ++++----
 4 files changed, 21 insertions(+), 6 deletions(-)

diff --git a/include/standard-headers/asm-m68k/bootinfo-virt.h b/include/standard-headers/asm-m68k/bootinfo-virt.h
index 1b1ffd4705d6..75ac6bbd7d73 100644
--- a/include/standard-headers/asm-m68k/bootinfo-virt.h
+++ b/include/standard-headers/asm-m68k/bootinfo-virt.h
@@ -12,7 +12,9 @@
 #define BI_VIRT_GF_TTY_BASE	0x8003
 #define BI_VIRT_VIRTIO_BASE	0x8004
 #define BI_VIRT_CTRL_BASE	0x8005
-#define BI_VIRT_RNG_SEED	0x8006
+
+/* No longer used -- replaced with BI_RNG_SEED -- but don't reuse this index:
+ * #define BI_VIRT_RNG_SEED	0x8006 */
 
 #define VIRT_BOOTI_VERSION	MK_BI_VERSION(2, 0)
 
diff --git a/include/standard-headers/asm-m68k/bootinfo.h b/include/standard-headers/asm-m68k/bootinfo.h
index 7b790e8ec8d6..b7a8dd2514fe 100644
--- a/include/standard-headers/asm-m68k/bootinfo.h
+++ b/include/standard-headers/asm-m68k/bootinfo.h
@@ -57,7 +57,13 @@ struct mem_info {
 					/* (struct mem_info) */
 #define BI_COMMAND_LINE		0x0007	/* kernel command line parameters */
 					/* (string) */
-
+/*
+ * A random seed used to initialize the RNG. Record format:
+ *
+ *   - length       [ 2 bytes, 16-bit big endian ]
+ *   - seed data    [ `length` bytes, padded to preserve 4-byte struct alignment ]
+ */
+#define BI_RNG_SEED		0x0008
 
     /*
      *  Linux/m68k Architectures (BI_MACHTYPE)
diff --git a/hw/m68k/q800.c b/hw/m68k/q800.c
index 101ab0f803f6..a4590c2cb0b1 100644
--- a/hw/m68k/q800.c
+++ b/hw/m68k/q800.c
@@ -23,6 +23,7 @@
 #include "qemu/osdep.h"
 #include "qemu/units.h"
 #include "qemu/datadir.h"
+#include "qemu/guest-random.h"
 #include "sysemu/sysemu.h"
 #include "cpu.h"
 #include "hw/boards.h"
@@ -385,6 +386,7 @@ static void q800_init(MachineState *machine)
     NubusBus *nubus;
     DeviceState *glue;
     DriveInfo *dinfo;
+    uint8_t rng_seed[32];
 
     linux_boot = (kernel_filename != NULL);
 
@@ -634,6 +636,11 @@ static void q800_init(MachineState *machine)
                         kernel_cmdline);
         }
 
+        /* Pass seed to RNG. */
+        qemu_guest_getrandom_nofail(rng_seed, sizeof(rng_seed));
+        BOOTINFODATA(cs->as, parameters_base, BI_RNG_SEED,
+                     rng_seed, sizeof(rng_seed));
+
         /* load initrd */
         if (initrd_filename) {
             initrd_size = get_image_size(initrd_filename);
diff --git a/hw/m68k/virt.c b/hw/m68k/virt.c
index 2f3ffc0de677..f7b903ea1b62 100644
--- a/hw/m68k/virt.c
+++ b/hw/m68k/virt.c
@@ -248,10 +248,10 @@ static void virt_init(MachineState *machine)
                         kernel_cmdline);
         }
 
-	/* Pass seed to RNG. */
-	qemu_guest_getrandom_nofail(rng_seed, sizeof(rng_seed));
-	BOOTINFODATA(cs->as, parameters_base, BI_VIRT_RNG_SEED,
-		     rng_seed, sizeof(rng_seed));
+        /* Pass seed to RNG. */
+        qemu_guest_getrandom_nofail(rng_seed, sizeof(rng_seed));
+        BOOTINFODATA(cs->as, parameters_base, BI_RNG_SEED,
+                     rng_seed, sizeof(rng_seed));
 
         /* load initrd */
         if (initrd_filename) {
-- 
2.37.3


