Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6B6F6AACFF
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Mar 2023 23:39:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYaW5-0001cP-Pn; Sat, 04 Mar 2023 17:38:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1pYaW3-0001bf-4Y
 for qemu-devel@nongnu.org; Sat, 04 Mar 2023 17:38:11 -0500
Received: from out4-smtp.messagingengine.com ([66.111.4.28])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1pYaW1-0005qz-9r
 for qemu-devel@nongnu.org; Sat, 04 Mar 2023 17:38:10 -0500
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 9E05D5C00E5;
 Sat,  4 Mar 2023 17:38:08 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Sat, 04 Mar 2023 17:38:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 cc:cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1677969488; x=
 1678055888; bh=UHjmaV+sM30XeFhoWbu2qmmyhzqG8q0jBI5JNTBUBj0=; b=M
 kOfvTPaliM3oxHl/yHGyb7o1Uk7AmEjYgZT8+ghUVpGzRdOugEdrtg8k5zK526CG
 5Jui8wNO0MN4pF7k7CJZOZS+7NOU3t4brK0mhr0nIW3/2tBGEUziz13ToN+f8gK+
 igTdA0Rn+n+aV6gSZ2iqANIaaDmgDLyQdlZ+lxMG89Cw3g9NKAUebuAekmEqkNLG
 WMhBs4HbbuYPWL08syqOQ2U9NcpCOcAu3oPzsMucI+x5Iqv71/VbV2hjMTa1ah2D
 9KjjM0zeyI5vwWhOJ76XKkx/KQR8PoL3o5JObGwggXejbcJ7NWSJt5u0O86ZQ1/k
 04rm/0bjr6aqQ731FeDEw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1677969488; x=
 1678055888; bh=UHjmaV+sM30XeFhoWbu2qmmyhzqG8q0jBI5JNTBUBj0=; b=s
 1aEBw62vlI0uOYK7yj1NyEzX6HKP6ew5LoV5OIrsMBR5OAlzVnN6A74m75UCMId/
 ejzDNmiqBwfoLRKjgGMvyfudS/+Kw5FFOwBJsr/2k05RnNTRdt21lLmrpPFquKPl
 iKqqrPEqSx9ulmdUGeU11B0XY1Yql32Y0H8aG0sv3ZWg+JqtcUJmzadkv2RDNKoe
 SRPhs4f/qzpYGGFiyNyeyAwxOcwE5qCqlqcHe8p12wqG0klSh4Eb4B7oGyw6TVfU
 ugvEALnNVSyszLK10EgHJIeR1mSfcqCZGOrqBry+1N/kxMGBmRGrMe3sWlEHEduW
 DwqMMufq/RAVPiTYr81IQ==
X-ME-Sender: <xms:UMgDZMnjLWHnTOINoGDbs0rtwydYNXLb-f63kVOfAquGqdPlaNdS5w>
 <xme:UMgDZL2uci6o-ela5vIS00uWk1DKyiZ0tKLYv3P0EUIIKmtm9z1kdpKdlcnBMBKbd
 2-Qnm_Mj-Z2Up-mZo0>
X-ME-Received: <xmr:UMgDZKqMbsMDOa5dlAPny7WAUEpQrF6uYUsSV6o2yJsMGSOU_2pUUgfZd8TZ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvddtuddgudeitdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgjfhgggfestd
 ekredtredttdenucfhrhhomheplfhirgiguhhnucgjrghnghcuoehjihgrgihunhdrhigr
 nhhgsehflhihghhorghtrdgtohhmqeenucggtffrrghtthgvrhhnpeefledufeehgedvue
 dvvdegkefgvddttedtleeiiefhgeetudegkefhvdfhjeeftdenucevlhhushhtvghrufhi
 iigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflh
 ihghhorghtrdgtohhm
X-ME-Proxy: <xmx:UMgDZIkMDuZ125O5ZbZeUd8Uf4Mg2nF8mFcEina6kkjkmRMIlEmqPA>
 <xmx:UMgDZK0wzise-6HF9OzgJMCskz15A5_4lcVPktKTyW_RRucJ6r0_bg>
 <xmx:UMgDZPvD6EynCQs0z81t630JC9udedIlB5LA9mHpo5xpi0GvGhklEQ>
 <xmx:UMgDZP_UfO35Kla5j3OELyNsDZIPQjzuKslfoMxtyARHLOXfG63fBQ>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 4 Mar 2023 17:38:07 -0500 (EST)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
To: qemu-devel@nongnu.org
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH v2 1/2] hw/misc: Add MIPS Trickbox device
Date: Sat,  4 Mar 2023 22:38:02 +0000
Message-Id: <20230304223803.55764-2-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
In-Reply-To: <20230304223803.55764-1-jiaxun.yang@flygoat.com>
References: <20230304223803.55764-1-jiaxun.yang@flygoat.com>
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

MIPS Trickbox is a emulated device present in MIPS's IASIM simulator
for decades. It's capable of managing simulator status, signaling
interrupts, doing DMA and EJTAG signal stimulations.

For now we just use definition of this device and implement power
management related functions.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
v1: Rewording commit message
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
index 2ef5781ef87b..9f09da23c191 100644
--- a/hw/misc/Kconfig
+++ b/hw/misc/Kconfig
@@ -85,6 +85,9 @@ config STM32F4XX_EXTI
 config MIPS_ITU
     bool
 
+config MIPS_TRICKBOX
+    bool
+
 config MPS2_FPGAIO
     bool
     select LED
diff --git a/hw/misc/meson.build b/hw/misc/meson.build
index fe869b98ca4d..1b58fd7df7b2 100644
--- a/hw/misc/meson.build
+++ b/hw/misc/meson.build
@@ -134,6 +134,7 @@ specific_ss.add(when: 'CONFIG_MAC_VIA', if_true: files('mac_via.c'))
 
 specific_ss.add(when: 'CONFIG_MIPS_CPS', if_true: files('mips_cmgcr.c', 'mips_cpc.c'))
 specific_ss.add(when: 'CONFIG_MIPS_ITU', if_true: files('mips_itu.c'))
+specific_ss.add(when: 'CONFIG_MIPS_TRICKBOX', if_true: files('mips_trickbox.c'))
 
 softmmu_ss.add(when: 'CONFIG_SBSA_REF', if_true: files('sbsa_ec.c'))
 
diff --git a/hw/misc/mips_trickbox.c b/hw/misc/mips_trickbox.c
new file mode 100644
index 000000000000..20349b774b2f
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
index c47876a90262..8603cf0d5ad2 100644
--- a/hw/misc/trace-events
+++ b/hw/misc/trace-events
@@ -279,3 +279,7 @@ virt_ctrl_instance_init(void *dev) "ctrl: %p"
 lasi_chip_mem_valid(uint64_t addr, uint32_t val) "access to addr 0x%"PRIx64" is %d"
 lasi_chip_read(uint64_t addr, uint32_t val) "addr 0x%"PRIx64" val 0x%08x"
 lasi_chip_write(uint64_t addr, uint32_t val) "addr 0x%"PRIx64" val 0x%08x"
+
+# mips_trickbox.c
+mips_trickbox_read(uint64_t addr, uint32_t val) "addr 0x%"PRIx64" val 0x%08x"
+mips_trickbox_write(uint64_t addr, uint32_t val) "addr 0x%"PRIx64" val 0x%08x"
diff --git a/include/hw/misc/mips_trickbox.h b/include/hw/misc/mips_trickbox.h
new file mode 100644
index 000000000000..386a767937cb
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


