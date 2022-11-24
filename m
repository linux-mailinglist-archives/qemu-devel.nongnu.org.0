Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 763076380B9
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Nov 2022 22:45:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oyJnD-0006V8-G1; Thu, 24 Nov 2022 16:29:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1oyJn8-0006U6-Pb
 for qemu-devel@nongnu.org; Thu, 24 Nov 2022 16:29:54 -0500
Received: from out4-smtp.messagingengine.com ([66.111.4.28])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1oyJn5-00048g-V0
 for qemu-devel@nongnu.org; Thu, 24 Nov 2022 16:29:54 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 16F725C0164;
 Thu, 24 Nov 2022 16:29:49 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 24 Nov 2022 16:29:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1669325389; x=1669411789; bh=NV
 ASDkIUsv979JZfuz+w6mcItalyx1NpWgIx6+TAYfc=; b=TtXl2rpd4fhE5BBcUg
 e4VHblpJuD+Np5X4pgLcgsS2gQ4iau3ruCmZjgWDh6/1Zj7BzXKzb7Fm7n2HbR+p
 Z3AgRklVpjG5j+ggvxqPEYb+CoJ7Lov0X/PS4yTNkJrYmMDB3DyWscCc9JbXYE68
 GDRCYAn2xdft/7xq+bQXzq1mKwWT+vnjHlMZHsI7rBiwLkoDMk7/3B3m1aTl7oYb
 GZ8BlWKkMY6AcWHRf8hRuSWC2bNzi8Obxp7Yc1iZMA+WcHkhLlQBpeX6LNbj7PCw
 bDLtCpUnO4pm9a7ZfS2zlRcgAYLF2XkO97xZ7JsSNoyuWAlS4P4YLkOVotoXNc/M
 AVLg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1669325389; x=1669411789; bh=NVASDkIUsv979
 JZfuz+w6mcItalyx1NpWgIx6+TAYfc=; b=S9rmlklHlH62zs+MBlPhxvNckH0lz
 y/t8HOY0ggnVra4D5ny1IZeY0a8j4acY1cKwTsXaknoIpuaxDF1BQKIRnD0tmR34
 0U5XrPe4VskuLrAs3N9nKlr2VhqyMe7E+cX1noMBPQ8qNYqiLlZ2Zr/TzSmoYhAV
 jFtfRQd6aBkAA7re1rB7B86lXURWXthroNNEybw0he+nbFklLeRz778bWsQSgqAR
 fBli4DEZLmPp+MznnKjzIWOqQE10SfBG9PhxBB65sYfsOuFFtzYk5fnriOkZaqS9
 dfbuSaKoDqElAarH1UrQDNug2rQv57KFB9ao7u9tN8W7N4Ul0m039yaAg==
X-ME-Sender: <xms:TOJ_YyvliTP0VX6LpofmrY6OMwctWPgPuraQrs33kXPutgJq7Jmnwg>
 <xme:TOJ_Y3dRNavwtbMRcsl2fhWMNU7PFsdFBcx8SOVRdYSUgvYbiQQx0hKvNCkVXy-8_
 1DH2MCtqkjNk7rY784>
X-ME-Received: <xmr:TOJ_Y9zx-A_b7H5cdpFzbp8huJ6cDyQAMI2fKIGWkPGzTfpc22mr6tvSxg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrieefgdduhedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtke
 ertdertddtnecuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghn
 ghesfhhlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepfeeludefheegvdeuvd
 dvgeekgfdvtdettdelieeihfegtedugeekhfdvhfejfedtnecuvehluhhsthgvrhfuihii
 vgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhi
 hgohgrthdrtghomh
X-ME-Proxy: <xmx:TOJ_Y9MO_nlpYYaLBITicZiFSU9z-RgbovSa4tUnEpOr2naka9vDZg>
 <xmx:TOJ_Yy-mRROtpTWvu00HKs7Qip9FlbVGqcqnnCf6s0XOXGtXSsfFXg>
 <xmx:TOJ_Y1WYMD4tP7pAHeO0Q3dIJgVERoL_pX356ua05uJk46X-S_rPVA>
 <xmx:TeJ_Y4kBy9G-h6R7YJmXBNrwgSxXEdEj4GHhtVsRUYXW6uMhWRVYDg>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 24 Nov 2022 16:29:48 -0500 (EST)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
To: qemu-devel@nongnu.org
Cc: f4bug@amsat.org,
	Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [RFC PATCH 2/3] hw/misc: Add MIPS Trickbox device
Date: Thu, 24 Nov 2022 21:29:15 +0000
Message-Id: <20221124212916.723490-3-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221124212916.723490-1-jiaxun.yang@flygoat.com>
References: <20221124212916.723490-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.28; envelope-from=jiaxun.yang@flygoat.com;
 helo=out4-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

MIPS Trickbox is a emulated device present in MIPS's proprietary
simulators for decadeds. It's capable for managing simulator status,
signaling interrupts, doing DMA and EJTAG stimulations.

For now we just borrow this device and implement power management
related functions.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 hw/misc/Kconfig                 |  3 +
 hw/misc/meson.build             |  1 +
 hw/misc/mips_trickbox.c         | 97 +++++++++++++++++++++++++++++++++
 hw/misc/trace-events            |  4 ++
 include/hw/misc/mips_trickbox.h | 41 ++++++++++++++
 5 files changed, 146 insertions(+)
 create mode 100644 hw/misc/mips_trickbox.c
 create mode 100644 include/hw/misc/mips_trickbox.h

diff --git a/hw/misc/Kconfig b/hw/misc/Kconfig
index cbabe9f78c..fa92c439ec 100644
--- a/hw/misc/Kconfig
+++ b/hw/misc/Kconfig
@@ -89,6 +89,9 @@ config STM32F4XX_EXTI
 config MIPS_ITU
     bool
 
+config MIPS_TRICKBOX
+    bool
+
 config MPS2_FPGAIO
     bool
     select LED
diff --git a/hw/misc/meson.build b/hw/misc/meson.build
index 95268eddc0..116eff8890 100644
--- a/hw/misc/meson.build
+++ b/hw/misc/meson.build
@@ -133,6 +133,7 @@ specific_ss.add(when: 'CONFIG_MAC_VIA', if_true: files('mac_via.c'))
 
 specific_ss.add(when: 'CONFIG_MIPS_CPS', if_true: files('mips_cmgcr.c', 'mips_cpc.c'))
 specific_ss.add(when: 'CONFIG_MIPS_ITU', if_true: files('mips_itu.c'))
+specific_ss.add(when: 'CONFIG_MIPS_TRICKBOX', if_true: files('mips_trickbox.c'))
 
 specific_ss.add(when: 'CONFIG_SBSA_REF', if_true: files('sbsa_ec.c'))
 
diff --git a/hw/misc/mips_trickbox.c b/hw/misc/mips_trickbox.c
new file mode 100644
index 0000000000..20349b774b
--- /dev/null
+++ b/hw/misc/mips_trickbox.c
@@ -0,0 +1,97 @@
+/*
+ * SPDX-License-Identifier: LGPL-2.0-or-later
+ *
+ * MIPS Trickbox
+ */
+
+#include "qemu/osdep.h"
+#include "hw/sysbus.h"
+#include "qapi/error.h"
+#include "qemu/log.h"
+#include "qemu/module.h"
+#include "trace.h"
+#include "sysemu/runstate.h"
+#include "hw/misc/mips_trickbox.h"
+
+static uint64_t mips_trickbox_read(void *opaque, hwaddr addr, unsigned int size)
+{
+    uint64_t value = 0;
+
+    qemu_log_mask(LOG_UNIMP,
+                    "%s: unimplemented register read 0x%02"HWADDR_PRIx"\n",
+                    __func__, addr);
+    trace_mips_trickbox_read(size, value);
+
+    return 0;
+}
+
+static void mips_trickbox_write(void *opaque, hwaddr addr,
+           uint64_t val64, unsigned int size)
+{
+    trace_mips_trickbox_write(size, val64);
+
+    switch (addr) {
+    case REG_SIM_CMD:
+        switch (val64 & 0xffffffff) {
+        case TRICK_PANIC:
+            qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_PANIC);
+            break;
+        case TRICK_HALT:
+            qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
+            break;
+        case TRICK_SUSPEND:
+            qemu_system_suspend_request();
+            break;
+        case TRICK_RESET:
+            qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_RESET);
+            break;
+        case TRICK_PASS_MIPS:
+        case TRICK_PASS_NANOMIPS:
+            exit(EXIT_SUCCESS);
+            break;
+        case TRICK_FAIL_MIPS:
+        case TRICK_FAIL_NANOMIPS:
+            exit(EXIT_FAILURE);
+            break;
+        }
+        break;
+    default:
+        qemu_log_mask(LOG_UNIMP,
+                      "%s: unimplemented register write 0x%02"HWADDR_PRIx"\n",
+                      __func__, addr);
+        break;
+    }
+}
+
+static const MemoryRegionOps mips_trickbox_ops = {
+    .read = mips_trickbox_read,
+    .write = mips_trickbox_write,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+    .valid = {
+        .min_access_size = 2,
+        .max_access_size = 4
+    }
+};
+
+static void mips_trickbox_init(Object *obj)
+{
+    MIPSTrickboxState *s = MIPS_TRICKBOX(obj);
+
+    memory_region_init_io(&s->mmio, obj, &mips_trickbox_ops, s,
+                          TYPE_MIPS_TRICKBOX, 0x100);
+    sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->mmio);
+}
+
+static const TypeInfo mips_trickbox_info = {
+    .name          = TYPE_MIPS_TRICKBOX,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(MIPSTrickboxState),
+    .instance_init = mips_trickbox_init,
+};
+
+static void mips_trickbox_register_types(void)
+{
+    type_register_static(&mips_trickbox_info);
+}
+
+type_init(mips_trickbox_register_types)
diff --git a/hw/misc/trace-events b/hw/misc/trace-events
index c18bc0605e..6df0e42450 100644
--- a/hw/misc/trace-events
+++ b/hw/misc/trace-events
@@ -274,3 +274,7 @@ virt_ctrl_instance_init(void *dev) "ctrl: %p"
 lasi_chip_mem_valid(uint64_t addr, uint32_t val) "access to addr 0x%"PRIx64" is %d"
 lasi_chip_read(uint64_t addr, uint32_t val) "addr 0x%"PRIx64" val 0x%08x"
 lasi_chip_write(uint64_t addr, uint32_t val) "addr 0x%"PRIx64" val 0x%08x"
+
+# mips_trickbox.c
+mips_trickbox_read(uint64_t addr, uint32_t val) "addr 0x%"PRIx64" val 0x%08x"
+mips_trickbox_write(uint64_t addr, uint32_t val) "addr 0x%"PRIx64" val 0x%08x"
diff --git a/include/hw/misc/mips_trickbox.h b/include/hw/misc/mips_trickbox.h
new file mode 100644
index 0000000000..386a767937
--- /dev/null
+++ b/include/hw/misc/mips_trickbox.h
@@ -0,0 +1,41 @@
+/*
+ * SPDX-License-Identifier: LGPL-2.0-or-later
+ *
+ * MIPS Trickbox
+ */
+
+
+#ifndef HW_MIPS_TRICKBOX_H
+#define HW_MIPS_TRICKBOX_H
+
+#include "hw/sysbus.h"
+#include "qom/object.h"
+
+#define TYPE_MIPS_TRICKBOX "mips.trickbox"
+
+typedef struct MIPSTrickboxState MIPSTrickboxState;
+DECLARE_INSTANCE_CHECKER(MIPSTrickboxState, MIPS_TRICKBOX,
+                         TYPE_MIPS_TRICKBOX)
+
+struct MIPSTrickboxState {
+    /*< private >*/
+    SysBusDevice parent_obj;
+
+    /*< public >*/
+    MemoryRegion mmio;
+};
+
+#define REG_SIM_CMD 0x0
+
+enum {
+    TRICK_PANIC = 1,
+    TRICK_HALT = 2,
+    TRICK_SUSPEND = 3,
+    TRICK_RESET = 4,
+    TRICK_FAIL_MIPS = 0x2c00abc1,
+    TRICK_PASS_MIPS = 0x2c00abc2,
+    TRICK_FAIL_NANOMIPS = 0x80005bc1,
+    TRICK_PASS_NANOMIPS = 0x80005bc2
+};
+
+#endif
-- 
2.37.1 (Apple Git-137.1)


