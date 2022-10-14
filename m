Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E61F5FE98B
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Oct 2022 09:28:32 +0200 (CEST)
Received: from localhost ([::1]:43680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ojF7P-0004nm-3S
	for lists+qemu-devel@lfdr.de; Fri, 14 Oct 2022 03:28:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1ojF3A-0008On-7p
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 03:24:13 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:41751)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1ojF37-0004rs-EJ
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 03:24:08 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue108
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MYNS0-1ofViW1Y3u-00VRlF; Fri, 14
 Oct 2022 09:23:58 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>, "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PULL 1/2] m68k: rework BI_VIRT_RNG_SEED as BI_RNG_SEED
Date: Fri, 14 Oct 2022 09:23:55 +0200
Message-Id: <20221014072356.2075517-2-laurent@vivier.eu>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221014072356.2075517-1-laurent@vivier.eu>
References: <20221014072356.2075517-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:OtVz0zF8+/DJF7qgTPHVihbqtIASO/fHtKo/tgQj0NJrOeCBT8E
 fQCJCwye7IxU3tJ98HvMCGr4AqPHeovyp4qd8hQY+RKKKAFEkUbo16DBe1c6CzqGYHsIPnh
 9yZSII4Bz0YSMEFW9BihLBSpy0SGQeyTOGxOkimshRZvqmgl5e/AfM1rIn5HBU7zY4OIj2O
 nih9p84KM+FwgTe5IQ8ZA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:E4C/QbJ3gJI=:PPwAjOgQYtVYe99lumNUzP
 E3urka2bqxXpEcVeiWLhVxaQQ6OEUpwO5ZIqaxPpiHcerTpSd1HHunZDiU32OoWJuF5NbEcHg
 SYtTsYXaxB5vuCBXgrhBecVcFS00gaY2IsHHJYU4gDG94XzPrF2NKYBCb2LSQGwOkOoKNissh
 MQGv0WWUjfIHCR6YeUgqOa2i8scKhKSwS7Xc6pcgLGt0WRU0BYRK5k2B2nUp9BOscABdvE2VZ
 WoPbnS7fBXStBHu8c8QNy95l7THXYEJ8HefOtnHCZMTmHGpp+ttMjvU1mcNzliYlrimhyd9SI
 ZONw5eB5Hy1Yr40u+D6sv90m/fy+sLVL1wbdOd4nTklBzF06QrVq8FeNyTmFkEqm1bNDZPScD
 AzXs2MIhWaN9I6YHcpyp1sUSaetqRISv1nzo+JJ7md0V19vdGdcuq4UVbmaTKZflQmabtvIvs
 xwAWPyN230tK0xoOjRilHqFLuFpaO947DAkZfUezQnAFTY0ubY7fMgKEE+D/ueM/Y/PE1VF6i
 /TdPLVy4je5762tmG+hGDd2J+l+LG/Q7/ZQ2XgPlVmM3Crjq00wS0l9Zvi6jBSR6Keg603TSV
 jVAoFwd2XVpKpea0M2HkYleQgqpvb9TxUxXgGZeoPGg9wvPQvtQUDvfaLjU08INpOU9wk1HWB
 K3lS6tIQrAZRrDs+6z47rJ8WoYuFStCc5xm1iyELXXVvMAKaVZ/xcy2jFUxb9cTUGaNGpukkd
 ADo6l0cCOrVNO46jlPCTvahUIv1PvP7WP7lH//x4li41hCAUDDoWVzJh5P3HAA9snZcmKM4wo
 eShv3Al
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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


