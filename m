Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2FFE36F309
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 01:45:18 +0200 (CEST)
Received: from localhost ([::1]:55010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcGLN-0007pQ-T5
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 19:45:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1lcGIQ-0005el-NL
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 19:42:15 -0400
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e]:40788)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1lcGIH-0004KJ-3Q
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 19:42:14 -0400
Received: by mail-qk1-x72e.google.com with SMTP id q136so48077936qka.7
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 16:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=boM6Riy6JgccZzvfJbFYDWCW5T+Et2LWIVhV8LUnzjA=;
 b=YwU1+wE2xpHyFW4HG0zZgpot8iZ0p9aIGbvsEB9Rhh90st3qYW1J+yOs4sXDmRCEXr
 x6nYV0HBuubaE+vOQmBTPVWxxWt4ybpwBq6lF9xYNNKlcLYH9+LFXaMpKq9I618vEAYl
 Q1EFo8Pwc9QsFa1nQdwT/jQ2Q+O5vvWinPPNUF4tUsv1Ml9gAmdLIaUNjX1pTDniWZaL
 8C2cxn8UqFfUBNMC7Hl4W/whtTGPjXuBqFHNSwA9HXaoxV1roruwcB0yuOyTuvF7eM6n
 BrycC9Id+s3oKRwTVfh1l2CGkM8lwj7+KoziG2Zz5zwZZxMp5AFucK8+39QyjxUYlekj
 7OLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=boM6Riy6JgccZzvfJbFYDWCW5T+Et2LWIVhV8LUnzjA=;
 b=qhjYpE/7iC7pek1k1jy1Fgvpn4MUW3VvhM0jr3JOru/QdnaxF7jOmYOdGg5vkb7JfE
 MjLtH5SWU1fVoIcEVO/AkLx8Z9nPheW2gO6QiKl8L9XKRxEVVfy9mAs+r0L+QN8LuCzl
 7dfQMXvR2GdWGuXSOVi+olVd4SQJCqS9hCp1p8WT6GhlZCoMXBQhaO6AhqeteVBjUvV/
 S9Tws+ZsWKGXmOfH8vq+YMltbc7aFV7Wato1Rp6bxl5gISdGJMnLAooo3BUSKBH8DVCV
 Re6UtkcD9WktC3uCPex4MU92BAtY4Z0dGcyfGXd7swwmVs8WIdg5DoVp5zNEpcuAFRaM
 sz4A==
X-Gm-Message-State: AOAM532Zt23gjAFfQrqUxJhxgsnxe0LBk6awzE0xEn13YJYZ6+u74VjV
 ogVQBl/arJEnpecjfop32HBRxkwHkXojtA==
X-Google-Smtp-Source: ABdhPJz8eDXV4cSS/Ub+HV3BtLS6uX1zl/W2ff9nN2dcVqMipotNiSioVmP6wE1BzYpjCK8CzScCyA==
X-Received: by 2002:a05:620a:983:: with SMTP id
 x3mr2363571qkx.119.1619739722981; 
 Thu, 29 Apr 2021 16:42:02 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-stsvon1503w-grc-23-174-92-28-28.dsl.bell.ca. [174.92.28.28])
 by smtp.googlemail.com with ESMTPSA id i2sm1093229qtg.0.2021.04.29.16.42.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Apr 2021 16:42:02 -0700 (PDT)
From: Shashi Mallela <shashi.mallela@linaro.org>
To: peter.maydell@linaro.org,
	leif@nuviainc.com,
	rad@semihalf.com
Subject: [PATCH v3 1/8] hw/intc: GICv3 ITS initial framework
Date: Thu, 29 Apr 2021 19:41:54 -0400
Message-Id: <20210429234201.125565-2-shashi.mallela@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210429234201.125565-1-shashi.mallela@linaro.org>
References: <20210429234201.125565-1-shashi.mallela@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72e;
 envelope-from=shashi.mallela@linaro.org; helo=mail-qk1-x72e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Added register definitions relevant to ITS,implemented overall
ITS device framework with stubs for ITS control and translater
regions read/write,extended ITS common to handle mmio init between
existing kvm device and newer qemu device.

Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
---
 hw/intc/arm_gicv3_its.c                | 239 +++++++++++++++++++++++++
 hw/intc/arm_gicv3_its_common.c         |  11 +-
 hw/intc/arm_gicv3_its_kvm.c            |   2 +-
 hw/intc/gicv3_internal.h               |  88 +++++++--
 hw/intc/meson.build                    |   1 +
 include/hw/intc/arm_gicv3_its_common.h |  10 +-
 6 files changed, 331 insertions(+), 20 deletions(-)
 create mode 100644 hw/intc/arm_gicv3_its.c

diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
new file mode 100644
index 0000000000..7b11330e01
--- /dev/null
+++ b/hw/intc/arm_gicv3_its.c
@@ -0,0 +1,239 @@
+/*
+ * ITS emulation for a GICv3-based system
+ *
+ * Copyright Linaro.org 2021
+ *
+ * Authors:
+ *  Shashi Mallela <shashi.mallela@linaro.org>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or (at your
+ * option) any later version.  See the COPYING file in the top-level directory.
+ *
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/log.h"
+#include "hw/qdev-properties.h"
+#include "hw/intc/arm_gicv3_its_common.h"
+#include "gicv3_internal.h"
+#include "qom/object.h"
+
+typedef struct GICv3ITSClass GICv3ITSClass;
+/* This is reusing the GICv3ITSState typedef from ARM_GICV3_ITS_COMMON */
+DECLARE_OBJ_CHECKERS(GICv3ITSState, GICv3ITSClass,
+                     ARM_GICV3_ITS, TYPE_ARM_GICV3_ITS)
+
+struct GICv3ITSClass {
+    GICv3ITSCommonClass parent_class;
+    void (*parent_reset)(DeviceState *dev);
+};
+
+static MemTxResult gicv3_its_translation_write(void *opaque, hwaddr offset,
+                               uint64_t data, unsigned size, MemTxAttrs attrs)
+{
+    MemTxResult result = MEMTX_OK;
+
+    return result;
+}
+
+static MemTxResult its_writel(GICv3ITSState *s, hwaddr offset,
+                               uint64_t value, MemTxAttrs attrs)
+{
+    MemTxResult result = MEMTX_OK;
+
+    return result;
+}
+
+static MemTxResult its_readl(GICv3ITSState *s, hwaddr offset,
+                               uint64_t *data, MemTxAttrs attrs)
+{
+    MemTxResult result = MEMTX_OK;
+
+    return result;
+}
+
+static MemTxResult its_writell(GICv3ITSState *s, hwaddr offset,
+                               uint64_t value, MemTxAttrs attrs)
+{
+    MemTxResult result = MEMTX_OK;
+
+    return result;
+}
+
+static MemTxResult its_readll(GICv3ITSState *s, hwaddr offset,
+                               uint64_t *data, MemTxAttrs attrs)
+{
+    MemTxResult result = MEMTX_OK;
+
+    return result;
+}
+
+static MemTxResult gicv3_its_read(void *opaque, hwaddr offset, uint64_t *data,
+                              unsigned size, MemTxAttrs attrs)
+{
+    GICv3ITSState *s = (GICv3ITSState *)opaque;
+    MemTxResult result;
+
+    switch (size) {
+    case 4:
+        result = its_readl(s, offset, data, attrs);
+        break;
+    case 8:
+        result = its_readll(s, offset, data, attrs);
+        break;
+    default:
+        result = MEMTX_ERROR;
+        break;
+    }
+
+    if (result == MEMTX_ERROR) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: invalid guest read at offset " TARGET_FMT_plx
+                      "size %u\n", __func__, offset, size);
+        /*
+         * The spec requires that reserved registers are RAZ/WI;
+         * so use MEMTX_ERROR returns from leaf functions as a way to
+         * trigger the guest-error logging but don't return it to
+         * the caller, or we'll cause a spurious guest data abort.
+         */
+        result = MEMTX_OK;
+        *data = 0;
+    }
+    return result;
+}
+
+static MemTxResult gicv3_its_write(void *opaque, hwaddr offset, uint64_t data,
+                               unsigned size, MemTxAttrs attrs)
+{
+    GICv3ITSState *s = (GICv3ITSState *)opaque;
+    MemTxResult result;
+
+    switch (size) {
+    case 4:
+        result = its_writel(s, offset, data, attrs);
+        break;
+    case 8:
+        result = its_writell(s, offset, data, attrs);
+        break;
+    default:
+        result = MEMTX_ERROR;
+        break;
+    }
+
+    if (result == MEMTX_ERROR) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: invalid guest write at offset " TARGET_FMT_plx
+                      "size %u\n", __func__, offset, size);
+        /*
+         * The spec requires that reserved registers are RAZ/WI;
+         * so use MEMTX_ERROR returns from leaf functions as a way to
+         * trigger the guest-error logging but don't return it to
+         * the caller, or we'll cause a spurious guest data abort.
+         */
+        result = MEMTX_OK;
+    }
+    return result;
+}
+
+static const MemoryRegionOps gicv3_its_control_ops = {
+    .read_with_attrs = gicv3_its_read,
+    .write_with_attrs = gicv3_its_write,
+    .valid.min_access_size = 4,
+    .valid.max_access_size = 8,
+    .impl.min_access_size = 4,
+    .impl.max_access_size = 8,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+};
+
+static const MemoryRegionOps gicv3_its_translation_ops = {
+    .write_with_attrs = gicv3_its_translation_write,
+    .valid.min_access_size = 2,
+    .valid.max_access_size = 4,
+    .impl.min_access_size = 2,
+    .impl.max_access_size = 4,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+};
+
+static void gicv3_arm_its_realize(DeviceState *dev, Error **errp)
+{
+    GICv3ITSState *s = ARM_GICV3_ITS_COMMON(dev);
+
+    gicv3_its_init_mmio(s, &gicv3_its_control_ops, &gicv3_its_translation_ops);
+
+    if (s->gicv3->cpu->gicr_typer & GICR_TYPER_PLPIS) {
+        /* set the ITS default features supported */
+        s->typer = FIELD_DP64(s->typer, GITS_TYPER, PHYSICAL,
+                                       GITS_TYPE_PHYSICAL);
+        s->typer = FIELD_DP64(s->typer, GITS_TYPER, ITT_ENTRY_SIZE,
+                                       ITS_ITT_ENTRY_SIZE - 1);
+        s->typer = FIELD_DP64(s->typer, GITS_TYPER, IDBITS, ITS_IDBITS);
+        s->typer = FIELD_DP64(s->typer, GITS_TYPER, DEVBITS, ITS_DEVBITS);
+        s->typer = FIELD_DP64(s->typer, GITS_TYPER, CIL, 1);
+        s->typer = FIELD_DP64(s->typer, GITS_TYPER, CIDBITS, ITS_CIDBITS);
+    }
+}
+
+static void gicv3_its_reset(DeviceState *dev)
+{
+    GICv3ITSState *s = ARM_GICV3_ITS_COMMON(dev);
+    GICv3ITSClass *c = ARM_GICV3_ITS_GET_CLASS(s);
+
+    if (s->gicv3->cpu->gicr_typer & GICR_TYPER_PLPIS) {
+        c->parent_reset(dev);
+
+        /* Quiescent bit reset to 1 */
+        s->ctlr = FIELD_DP32(s->ctlr, GITS_CTLR, QUIESCENT, 1);
+
+        /*
+         * setting GITS_BASER0.Type = 0b001 (Device)
+         *         GITS_BASER1.Type = 0b100 (Collection Table)
+         *         GITS_BASER<n>.Type,where n = 3 to 7 are 0b00 (Unimplemented)
+         *         GITS_BASER<0,1>.Page_Size = 64KB
+         * and default translation table entry size to 16 bytes
+         */
+        s->baser[0] = FIELD_DP64(s->baser[0], GITS_BASER, TYPE,
+                                              GITS_ITT_TYPE_DEVICE);
+        s->baser[0] = FIELD_DP64(s->baser[0], GITS_BASER, PAGESIZE,
+                                              GITS_BASER_PAGESIZE_64K);
+        s->baser[0] = FIELD_DP64(s->baser[0], GITS_BASER, ENTRYSIZE,
+                                              GITS_DTE_SIZE - 1);
+
+        s->baser[1] = FIELD_DP64(s->baser[1], GITS_BASER, TYPE,
+                                              GITS_ITT_TYPE_COLLECTION);
+        s->baser[1] = FIELD_DP64(s->baser[1], GITS_BASER, PAGESIZE,
+                                              GITS_BASER_PAGESIZE_64K);
+        s->baser[1] = FIELD_DP64(s->baser[1], GITS_BASER, ENTRYSIZE,
+                                              GITS_CTE_SIZE - 1);
+    }
+}
+
+static Property gicv3_its_props[] = {
+    DEFINE_PROP_LINK("parent-gicv3", GICv3ITSState, gicv3, "arm-gicv3",
+                     GICv3State *),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void gicv3_its_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    GICv3ITSClass *ic = ARM_GICV3_ITS_CLASS(klass);
+
+    dc->realize = gicv3_arm_its_realize;
+    device_class_set_props(dc, gicv3_its_props);
+    device_class_set_parent_reset(dc, gicv3_its_reset, &ic->parent_reset);
+}
+
+static const TypeInfo gicv3_its_info = {
+    .name = TYPE_ARM_GICV3_ITS,
+    .parent = TYPE_ARM_GICV3_ITS_COMMON,
+    .instance_size = sizeof(GICv3ITSState),
+    .class_init = gicv3_its_class_init,
+    .class_size = sizeof(GICv3ITSClass),
+};
+
+static void gicv3_its_register_types(void)
+{
+    type_register_static(&gicv3_its_info);
+}
+
+type_init(gicv3_its_register_types)
diff --git a/hw/intc/arm_gicv3_its_common.c b/hw/intc/arm_gicv3_its_common.c
index 66c4c6a188..b4dddb16b8 100644
--- a/hw/intc/arm_gicv3_its_common.c
+++ b/hw/intc/arm_gicv3_its_common.c
@@ -50,12 +50,13 @@ static int gicv3_its_post_load(void *opaque, int version_id)
 
 static const VMStateDescription vmstate_its = {
     .name = "arm_gicv3_its",
+    .version_id = 1,
+    .minimum_version_id = 1,
     .pre_save = gicv3_its_pre_save,
     .post_load = gicv3_its_post_load,
     .priority = MIG_PRI_GICV3_ITS,
     .fields = (VMStateField[]) {
         VMSTATE_UINT32(ctlr, GICv3ITSState),
-        VMSTATE_UINT32(iidr, GICv3ITSState),
         VMSTATE_UINT64(cbaser, GICv3ITSState),
         VMSTATE_UINT64(cwriter, GICv3ITSState),
         VMSTATE_UINT64(creadr, GICv3ITSState),
@@ -99,15 +100,16 @@ static const MemoryRegionOps gicv3_its_trans_ops = {
     .endianness = DEVICE_NATIVE_ENDIAN,
 };
 
-void gicv3_its_init_mmio(GICv3ITSState *s, const MemoryRegionOps *ops)
+void gicv3_its_init_mmio(GICv3ITSState *s, const MemoryRegionOps *ops,
+                           const MemoryRegionOps *tops)
 {
     SysBusDevice *sbd = SYS_BUS_DEVICE(s);
 
     memory_region_init_io(&s->iomem_its_cntrl, OBJECT(s), ops, s,
                           "control", ITS_CONTROL_SIZE);
     memory_region_init_io(&s->iomem_its_translation, OBJECT(s),
-                          &gicv3_its_trans_ops, s,
-                          "translation", ITS_TRANS_SIZE);
+                         tops ? tops : &gicv3_its_trans_ops, s,
+                         "translation", ITS_TRANS_SIZE);
 
     /* Our two regions are always adjacent, therefore we now combine them
      * into a single one in order to make our users' life easier.
@@ -129,7 +131,6 @@ static void gicv3_its_common_reset(DeviceState *dev)
     s->cbaser = 0;
     s->cwriter = 0;
     s->creadr = 0;
-    s->iidr = 0;
     memset(&s->baser, 0, sizeof(s->baser));
 }
 
diff --git a/hw/intc/arm_gicv3_its_kvm.c b/hw/intc/arm_gicv3_its_kvm.c
index b554d2ede0..0b4cbed28b 100644
--- a/hw/intc/arm_gicv3_its_kvm.c
+++ b/hw/intc/arm_gicv3_its_kvm.c
@@ -106,7 +106,7 @@ static void kvm_arm_its_realize(DeviceState *dev, Error **errp)
     kvm_arm_register_device(&s->iomem_its_cntrl, -1, KVM_DEV_ARM_VGIC_GRP_ADDR,
                             KVM_VGIC_ITS_ADDR_TYPE, s->dev_fd, 0);
 
-    gicv3_its_init_mmio(s, NULL);
+    gicv3_its_init_mmio(s, NULL, NULL);
 
     if (!kvm_device_check_attr(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_ITS_REGS,
         GITS_CTLR)) {
diff --git a/hw/intc/gicv3_internal.h b/hw/intc/gicv3_internal.h
index 05303a55c8..e0b06930a7 100644
--- a/hw/intc/gicv3_internal.h
+++ b/hw/intc/gicv3_internal.h
@@ -24,6 +24,7 @@
 #ifndef QEMU_ARM_GICV3_INTERNAL_H
 #define QEMU_ARM_GICV3_INTERNAL_H
 
+#include "hw/registerfields.h"
 #include "hw/intc/arm_gicv3_common.h"
 
 /* Distributor registers, as offsets from the distributor base address */
@@ -67,6 +68,9 @@
 #define GICD_CTLR_E1NWF             (1U << 7)
 #define GICD_CTLR_RWP               (1U << 31)
 
+/* 16 bits EventId */
+#define GICD_TYPER_IDBITS            0xf
+
 /*
  * Redistributor frame offsets from RD_base
  */
@@ -122,18 +126,6 @@
 #define GICR_WAKER_ProcessorSleep    (1U << 1)
 #define GICR_WAKER_ChildrenAsleep    (1U << 2)
 
-#define GICR_PROPBASER_OUTER_CACHEABILITY_MASK (7ULL << 56)
-#define GICR_PROPBASER_ADDR_MASK               (0xfffffffffULL << 12)
-#define GICR_PROPBASER_SHAREABILITY_MASK       (3U << 10)
-#define GICR_PROPBASER_CACHEABILITY_MASK       (7U << 7)
-#define GICR_PROPBASER_IDBITS_MASK             (0x1f)
-
-#define GICR_PENDBASER_PTZ                     (1ULL << 62)
-#define GICR_PENDBASER_OUTER_CACHEABILITY_MASK (7ULL << 56)
-#define GICR_PENDBASER_ADDR_MASK               (0xffffffffULL << 16)
-#define GICR_PENDBASER_SHAREABILITY_MASK       (3U << 10)
-#define GICR_PENDBASER_CACHEABILITY_MASK       (7U << 7)
-
 #define ICC_CTLR_EL1_CBPR           (1U << 0)
 #define ICC_CTLR_EL1_EOIMODE        (1U << 1)
 #define ICC_CTLR_EL1_PMHE           (1U << 6)
@@ -239,6 +231,78 @@
 #define ICH_VTR_EL2_PREBITS_SHIFT 26
 #define ICH_VTR_EL2_PRIBITS_SHIFT 29
 
+/* ITS Registers */
+
+FIELD(GITS_BASER, SIZE, 0, 8)
+FIELD(GITS_BASER, PAGESIZE, 8, 2)
+FIELD(GITS_BASER, SHAREABILITY, 10, 2)
+FIELD(GITS_BASER, PHYADDR, 12, 36)
+FIELD(GITS_BASER, PHYADDRL_64K, 16, 32)
+FIELD(GITS_BASER, PHYADDRH_64K, 48, 4)
+FIELD(GITS_BASER, ENTRYSIZE, 48, 5)
+FIELD(GITS_BASER, OUTERCACHE, 53, 3)
+FIELD(GITS_BASER, TYPE, 56, 3)
+FIELD(GITS_BASER, INNERCACHE, 59, 3)
+FIELD(GITS_BASER, INDIRECT, 62, 1)
+FIELD(GITS_BASER, VALID, 63, 1)
+
+FIELD(GITS_CTLR, QUIESCENT, 31, 1)
+
+FIELD(GITS_TYPER, PHYSICAL, 0, 1)
+FIELD(GITS_TYPER, ITT_ENTRY_SIZE, 4, 4)
+FIELD(GITS_TYPER, IDBITS, 8, 5)
+FIELD(GITS_TYPER, DEVBITS, 13, 5)
+FIELD(GITS_TYPER, SEIS, 18, 1)
+FIELD(GITS_TYPER, PTA, 19, 1)
+FIELD(GITS_TYPER, CIDBITS, 32, 4)
+FIELD(GITS_TYPER, CIL, 36, 1)
+
+#define GITS_BASER_PAGESIZE_4K                0
+#define GITS_BASER_PAGESIZE_16K               1
+#define GITS_BASER_PAGESIZE_64K               2
+
+#define GITS_ITT_TYPE_DEVICE                  1ULL
+#define GITS_ITT_TYPE_COLLECTION              4ULL
+
+/**
+ * Default features advertised by this version of ITS
+ */
+/* Physical LPIs supported */
+#define GITS_TYPE_PHYSICAL           (1U << 0)
+
+/*
+ * 12 bytes Interrupt translation Table Entry size
+ * ITE Lower 8 Bytes
+ * Valid = 1 bit,InterruptType = 1 bit,
+ * Size of LPI number space[considering max 24 bits],
+ * Size of LPI number space[considering max 24 bits],
+ * ITE Higher 4 Bytes
+ * ICID = 16 bits,
+ * vPEID = 16 bits
+ */
+#define ITS_ITT_ENTRY_SIZE            0xC
+
+/* 16 bits EventId */
+#define ITS_IDBITS                   GICD_TYPER_IDBITS
+
+/* 16 bits DeviceId */
+#define ITS_DEVBITS                   0xF
+
+/* 16 bits CollectionId */
+#define ITS_CIDBITS                  0xF
+
+/*
+ * 8 bytes Device Table Entry size
+ * Valid = 1 bit,ITTAddr = 44 bits,Size = 5 bits
+ */
+#define GITS_DTE_SIZE                 (0x8ULL)
+
+/*
+ * 8 bytes Collection Table Entry size
+ * Valid = 1 bit,RDBase = 36 bits(considering max RDBASE)
+ */
+#define GITS_CTE_SIZE                 (0x8ULL)
+
 /* Special interrupt IDs */
 #define INTID_SECURE 1020
 #define INTID_NONSECURE 1021
diff --git a/hw/intc/meson.build b/hw/intc/meson.build
index 1c299039f6..53472239f0 100644
--- a/hw/intc/meson.build
+++ b/hw/intc/meson.build
@@ -8,6 +8,7 @@ softmmu_ss.add(when: 'CONFIG_ARM_GIC', if_true: files(
   'arm_gicv3_dist.c',
   'arm_gicv3_its_common.c',
   'arm_gicv3_redist.c',
+  'arm_gicv3_its.c',
 ))
 softmmu_ss.add(when: 'CONFIG_ETRAXFS', if_true: files('etraxfs_pic.c'))
 softmmu_ss.add(when: 'CONFIG_HEATHROW_PIC', if_true: files('heathrow_pic.c'))
diff --git a/include/hw/intc/arm_gicv3_its_common.h b/include/hw/intc/arm_gicv3_its_common.h
index 5a0952b404..03fc3963f3 100644
--- a/include/hw/intc/arm_gicv3_its_common.h
+++ b/include/hw/intc/arm_gicv3_its_common.h
@@ -25,17 +25,22 @@
 #include "hw/intc/arm_gicv3_common.h"
 #include "qom/object.h"
 
+#define TYPE_ARM_GICV3_ITS "arm-gicv3-its"
+
 #define ITS_CONTROL_SIZE 0x10000
 #define ITS_TRANS_SIZE   0x10000
 #define ITS_SIZE         (ITS_CONTROL_SIZE + ITS_TRANS_SIZE)
 
 #define GITS_CTLR        0x0
 #define GITS_IIDR        0x4
+#define GITS_TYPER       0x8
 #define GITS_CBASER      0x80
 #define GITS_CWRITER     0x88
 #define GITS_CREADR      0x90
 #define GITS_BASER       0x100
 
+#define GITS_TRANSLATER  0x0040
+
 struct GICv3ITSState {
     SysBusDevice parent_obj;
 
@@ -51,7 +56,7 @@ struct GICv3ITSState {
 
     /* Registers */
     uint32_t ctlr;
-    uint32_t iidr;
+    uint64_t typer;
     uint64_t cbaser;
     uint64_t cwriter;
     uint64_t creadr;
@@ -62,7 +67,8 @@ struct GICv3ITSState {
 
 typedef struct GICv3ITSState GICv3ITSState;
 
-void gicv3_its_init_mmio(GICv3ITSState *s, const MemoryRegionOps *ops);
+void gicv3_its_init_mmio(GICv3ITSState *s, const MemoryRegionOps *ops,
+                   const MemoryRegionOps *tops);
 
 #define TYPE_ARM_GICV3_ITS_COMMON "arm-gicv3-its-common"
 typedef struct GICv3ITSCommonClass GICv3ITSCommonClass;
-- 
2.27.0


