Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15FC9426158
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Oct 2021 02:32:18 +0200 (CEST)
Received: from localhost ([::1]:50078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYdo8-0007I2-Qp
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 20:32:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3SJBfYQgKCvcvtgZnsrgfnnfkd.bnlpdlt-cdudkmnmfmt.nqf@flex--wuhaotsh.bounces.google.com>)
 id 1mYdiw-00012x-2Y
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 20:26:54 -0400
Received: from mail-qk1-x749.google.com ([2607:f8b0:4864:20::749]:49868)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3SJBfYQgKCvcvtgZnsrgfnnfkd.bnlpdlt-cdudkmnmfmt.nqf@flex--wuhaotsh.bounces.google.com>)
 id 1mYdis-00042q-Ms
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 20:26:53 -0400
Received: by mail-qk1-x749.google.com with SMTP id
 j6-20020a05620a288600b0045e5d85ca17so6602083qkp.16
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 17:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=0if8jy4KQpP/wlERe6vs/phTTJ9wLaNyOwN1rQSRwWo=;
 b=mRL4oILbpA5S5tdDZH3JbkKORwhJyG5vFqFHPsrxqQa72m5yHq1/4ZhJwGbTjldnkH
 zqmuSA6pJVJcCgoVCVdApNVJUEnauWcAUv1qiNFP63Fzos4cDy+l+vwvguGOMyuMY6GL
 BOO0dsO6w+tHPLonqYjEDmn9GBFW/T5K43UInPs8XOubfVza8cH49xZBvQagtBk6YeiO
 +A2+uNJtCIQv6rOUbm9jLPxCTm8z7mdducVVByC18FhUQcNoC5OPa3IHB1TECZfLV/mZ
 IJRHiraY6IPiISO9a1LM0GL3hAwxE2u+UU6N2XWRWWbceyuHGALbw4D+rKrVkksHdXM9
 Rcfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=0if8jy4KQpP/wlERe6vs/phTTJ9wLaNyOwN1rQSRwWo=;
 b=QDsPqpFyme+cSqI01Jz0TEDEVrrNHJhPdfRWY6XUI2nk3seDaEPWFhO1sNa/yMNvv8
 qsjSkV3Jx3PTBw5H7HtY3xV1JeUW4qe4JyX/uAQsvR8NDFrIbUclTlPGukYGVRmphPXU
 7CrOrjBgxuDxjvVxDrABrB4itxhi4zjEz7xaGb2rDjYKGGFkos4C4yl496cc2K4ctmny
 DKFsnmpzh4fn+hKBCQExuvxr/Q4kzF6F+c7BgW7rqVTc1AsnAO6upU+7niscvCeKyGju
 xP6mOsqqwGF1wLCSMGUq4TAgs2z7ZEdr6dwMP6x0OoMLFTP1lgPA89Tp6OAfWpXpbxQ6
 37lg==
X-Gm-Message-State: AOAM531P0+SZ2l2dL+Ohd4xXOP5rfA1tyavfZ24eWjggLcge6tUGJoJc
 jyPweKCuPdf+HMgebY+kfjUlKA7a+zhFYA==
X-Google-Smtp-Source: ABdhPJwPf3tpUd2Rs8iqSJ0EotAP84xl2WLMp6xAgubemOpqobUcfOKdX9W+wC9CWAp/kZ6GIQa9qOqJhecrwg==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:ac8:57d4:: with SMTP id
 w20mr8420673qta.261.1633652808081; Thu, 07 Oct 2021 17:26:48 -0700 (PDT)
Date: Thu,  7 Oct 2021 17:26:24 -0700
In-Reply-To: <20211008002628.1958285-1-wuhaotsh@google.com>
Message-Id: <20211008002628.1958285-2-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20211008002628.1958285-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.33.0.882.g93a45727a2-goog
Subject: [PATCH v2 1/5] hw/sd: add nuvoton MMC
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, wuhaotsh@google.com, 
 venture@google.com, Avi.Fishman@nuvoton.com, kfting@nuvoton.com, 
 hskinnemoen@google.com, f4bug@amsat.org, bin.meng@windriver.com, 
 qemu-block@nongnu.org, maoshengtan2011@gmail.com, 
 Shengtan Mao <stmao@google.com>, Chris Rauer <crauer@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::749;
 envelope-from=3SJBfYQgKCvcvtgZnsrgfnnfkd.bnlpdlt-cdudkmnmfmt.nqf@flex--wuhaotsh.bounces.google.com;
 helo=mail-qk1-x749.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Shengtan Mao <stmao@google.com>

Signed-off-by: Shengtan Mao <stmao@google.com>
Reviewed-by: Hao Wu <wuhaotsh@google.com>
Reviewed-by: Chris Rauer <crauer@google.com>
Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
Signed-off-by:  Hao Wu <wuhaotsh@google.com>
---
 hw/sd/meson.build             |   1 +
 hw/sd/npcm7xx_sdhci.c         | 182 ++++++++++++++++++++++++++++++++++
 include/hw/sd/npcm7xx_sdhci.h |  65 ++++++++++++
 3 files changed, 248 insertions(+)
 create mode 100644 hw/sd/npcm7xx_sdhci.c
 create mode 100644 include/hw/sd/npcm7xx_sdhci.h

diff --git a/hw/sd/meson.build b/hw/sd/meson.build
index f1ce357a3b..807ca07b7c 100644
--- a/hw/sd/meson.build
+++ b/hw/sd/meson.build
@@ -9,4 +9,5 @@ softmmu_ss.add(when: 'CONFIG_PXA2XX', if_true: files('pxa2xx_mmci.c'))
 softmmu_ss.add(when: 'CONFIG_RASPI', if_true: files('bcm2835_sdhost.c'))
 softmmu_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files('aspeed_sdhci.c'))
 softmmu_ss.add(when: 'CONFIG_ALLWINNER_H3', if_true: files('allwinner-sdhost.c'))
+softmmu_ss.add(when: 'CONFIG_NPCM7XX', if_true: files('npcm7xx_sdhci.c'))
 softmmu_ss.add(when: 'CONFIG_CADENCE_SDHCI', if_true: files('cadence_sdhci.c'))
diff --git a/hw/sd/npcm7xx_sdhci.c b/hw/sd/npcm7xx_sdhci.c
new file mode 100644
index 0000000000..1148afe060
--- /dev/null
+++ b/hw/sd/npcm7xx_sdhci.c
@@ -0,0 +1,182 @@
+/*
+ * NPCM7xx SD-3.0 / eMMC-4.51 Host Controller
+ *
+ * Copyright (c) 2021 Google LLC
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU General Public License as published by the
+ * Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
+ * for more details.
+ */
+
+#include "qemu/osdep.h"
+
+#include "hw/sd/npcm7xx_sdhci.h"
+#include "migration/vmstate.h"
+#include "sdhci-internal.h"
+#include "qemu/log.h"
+
+static uint64_t npcm7xx_sdhci_read(void *opaque, hwaddr addr, unsigned int size)
+{
+    NPCM7xxSDHCIState *s = opaque;
+    uint64_t val = 0;
+
+    switch (addr) {
+    case NPCM7XX_PRSTVALS_0:
+    case NPCM7XX_PRSTVALS_1:
+    case NPCM7XX_PRSTVALS_2:
+    case NPCM7XX_PRSTVALS_3:
+    case NPCM7XX_PRSTVALS_4:
+    case NPCM7XX_PRSTVALS_5:
+        val = s->regs.prstvals[(addr - NPCM7XX_PRSTVALS_0) / 2];
+        break;
+    case NPCM7XX_BOOTTOCTRL:
+        val = s->regs.boottoctrl;
+        break;
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR, "SDHCI read of nonexist reg: 0x%02"
+                      HWADDR_PRIx, addr);
+        break;
+    }
+
+    return val;
+}
+
+static void npcm7xx_sdhci_write(void *opaque, hwaddr addr, uint64_t val,
+                                unsigned int size)
+{
+    NPCM7xxSDHCIState *s = opaque;
+
+    switch (addr) {
+    case NPCM7XX_BOOTTOCTRL:
+        s->regs.boottoctrl = val;
+        break;
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR, "SDHCI write of nonexist reg: 0x%02"
+                      HWADDR_PRIx, addr);
+        break;
+    }
+}
+
+static bool npcm7xx_sdhci_check_mem_op(void *opaque, hwaddr addr,
+                                       unsigned size, bool is_write,
+                                       MemTxAttrs attrs)
+{
+    switch (addr) {
+    case NPCM7XX_PRSTVALS_0:
+    case NPCM7XX_PRSTVALS_1:
+    case NPCM7XX_PRSTVALS_2:
+    case NPCM7XX_PRSTVALS_3:
+    case NPCM7XX_PRSTVALS_4:
+    case NPCM7XX_PRSTVALS_5:
+        /* RO Word */
+        return !is_write && size == 2;
+    case NPCM7XX_BOOTTOCTRL:
+        /* R/W Dword */
+        return size == 4;
+    default:
+        return false;
+    }
+}
+
+static const MemoryRegionOps npcm7xx_sdhci_ops = {
+    .read = npcm7xx_sdhci_read,
+    .write = npcm7xx_sdhci_write,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+    .valid = {
+        .min_access_size = 1,
+        .max_access_size = 4,
+        .unaligned = false,
+        .accepts = npcm7xx_sdhci_check_mem_op,
+    },
+};
+
+static void npcm7xx_sdhci_realize(DeviceState *dev, Error **errp)
+{
+    NPCM7xxSDHCIState *s = NPCM7XX_SDHCI(dev);
+    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
+    SysBusDevice *sbd_sdhci = SYS_BUS_DEVICE(&s->sdhci);
+
+    memory_region_init(&s->container, OBJECT(s),
+                       "npcm7xx.sdhci-container", 0x1000);
+    sysbus_init_mmio(sbd, &s->container);
+
+    memory_region_init_io(&s->iomem, OBJECT(s), &npcm7xx_sdhci_ops, s,
+                          TYPE_NPCM7XX_SDHCI, NPCM7XX_SDHCI_REGSIZE);
+    memory_region_add_subregion_overlap(&s->container, NPCM7XX_PRSTVALS,
+                                        &s->iomem, 1);
+
+    sysbus_realize(sbd_sdhci, errp);
+    memory_region_add_subregion(&s->container, 0,
+                                sysbus_mmio_get_region(sbd_sdhci, 0));
+
+    /* propagate irq and "sd-bus" from generic-sdhci */
+    sysbus_pass_irq(sbd, sbd_sdhci);
+    s->bus = qdev_get_child_bus(DEVICE(sbd_sdhci), "sd-bus");
+
+    /* Set the read only preset values. */
+    memset(s->regs.prstvals, 0, sizeof(s->regs.prstvals));
+    s->regs.prstvals[0] = NPCM7XX_PRSTVALS_0_RESET;
+    s->regs.prstvals[1] = NPCM7XX_PRSTVALS_1_RESET;
+    s->regs.prstvals[3] = NPCM7XX_PRSTVALS_3_RESET;
+}
+
+static void npcm7xx_sdhci_reset(DeviceState *dev)
+{
+    NPCM7xxSDHCIState *s = NPCM7XX_SDHCI(dev);
+    device_cold_reset(DEVICE(&s->sdhci));
+    s->regs.boottoctrl = 0;
+
+    s->sdhci.prnsts = NPCM7XX_PRSNTS_RESET;
+    s->sdhci.blkgap = NPCM7XX_BLKGAP_RESET;
+    s->sdhci.capareg = NPCM7XX_CAPAB_RESET;
+    s->sdhci.maxcurr = NPCM7XX_MAXCURR_RESET;
+    s->sdhci.version = NPCM7XX_HCVER_RESET;
+}
+
+static const VMStateDescription vmstate_npcm7xx_sdhci = {
+    .name = TYPE_NPCM7XX_SDHCI,
+    .version_id = 0,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT32(regs.boottoctrl, NPCM7xxSDHCIState),
+        VMSTATE_END_OF_LIST(),
+    },
+};
+
+static void npcm7xx_sdhci_class_init(ObjectClass *classp, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(classp);
+
+    dc->desc = "NPCM7xx SD/eMMC Host Controller";
+    dc->realize = npcm7xx_sdhci_realize;
+    dc->reset = npcm7xx_sdhci_reset;
+    dc->vmsd = &vmstate_npcm7xx_sdhci;
+}
+
+static void npcm7xx_sdhci_instance_init(Object *obj)
+{
+    NPCM7xxSDHCIState *s = NPCM7XX_SDHCI(obj);
+
+    object_initialize_child(OBJECT(s), "generic-sdhci", &s->sdhci,
+                            TYPE_SYSBUS_SDHCI);
+}
+
+static TypeInfo npcm7xx_sdhci_info = {
+    .name = TYPE_NPCM7XX_SDHCI,
+    .parent = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(NPCM7xxSDHCIState),
+    .instance_init = npcm7xx_sdhci_instance_init,
+    .class_init = npcm7xx_sdhci_class_init,
+};
+
+static void npcm7xx_sdhci_register_types(void)
+{
+    type_register_static(&npcm7xx_sdhci_info);
+}
+
+type_init(npcm7xx_sdhci_register_types)
diff --git a/include/hw/sd/npcm7xx_sdhci.h b/include/hw/sd/npcm7xx_sdhci.h
new file mode 100644
index 0000000000..d728f0a40d
--- /dev/null
+++ b/include/hw/sd/npcm7xx_sdhci.h
@@ -0,0 +1,65 @@
+/*
+ * NPCM7xx SD-3.0 / eMMC-4.51 Host Controller
+ *
+ * Copyright (c) 2021 Google LLC
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU General Public License as published by the
+ * Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
+ * for more details.
+ */
+
+#ifndef NPCM7XX_SDHCI_H
+#define NPCM7XX_SDHCI_H
+
+#include "hw/sd/sdhci.h"
+#include "qom/object.h"
+
+#define TYPE_NPCM7XX_SDHCI "npcm7xx.sdhci"
+#define NPCM7XX_PRSTVALS_SIZE 6
+#define NPCM7XX_PRSTVALS 0x60
+#define NPCM7XX_PRSTVALS_0 0x0
+#define NPCM7XX_PRSTVALS_1 0x2
+#define NPCM7XX_PRSTVALS_2 0x4
+#define NPCM7XX_PRSTVALS_3 0x6
+#define NPCM7XX_PRSTVALS_4 0x8
+#define NPCM7XX_PRSTVALS_5 0xA
+#define NPCM7XX_BOOTTOCTRL 0x10
+#define NPCM7XX_SDHCI_REGSIZE 0x20
+
+#define NPCM7XX_PRSNTS_RESET 0x04A00000
+#define NPCM7XX_BLKGAP_RESET 0x80
+#define NPCM7XX_CAPAB_RESET 0x0100200161EE0399
+#define NPCM7XX_MAXCURR_RESET 0x0000000000000005
+#define NPCM7XX_HCVER_RESET 0x1002
+
+#define NPCM7XX_PRSTVALS_0_RESET 0x0040
+#define NPCM7XX_PRSTVALS_1_RESET 0x0001
+#define NPCM7XX_PRSTVALS_3_RESET 0x0001
+
+OBJECT_DECLARE_SIMPLE_TYPE(NPCM7xxSDHCIState, NPCM7XX_SDHCI)
+
+typedef struct NPCM7xxRegs {
+    /* Preset Values Register Field, read-only */
+    uint16_t prstvals[NPCM7XX_PRSTVALS_SIZE];
+    /* Boot Timeout Control Register, read-write */
+    uint32_t boottoctrl;
+} NPCM7xxRegisters;
+
+typedef struct NPCM7xxSDHCIState {
+    SysBusDevice parent;
+
+    MemoryRegion container;
+    MemoryRegion iomem;
+    BusState *bus;
+    NPCM7xxRegisters regs;
+
+    SDHCIState sdhci;
+} NPCM7xxSDHCIState;
+
+#endif /* NPCM7XX_SDHCI_H */
-- 
2.33.0.882.g93a45727a2-goog


