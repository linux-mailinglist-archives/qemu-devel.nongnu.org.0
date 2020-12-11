Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31AFA2D6DE7
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 03:02:14 +0100 (CET)
Received: from localhost ([::1]:44750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knXl7-0000Fl-5O
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 21:02:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <31tDSXwgKCsc97un165ut11tyr.p1z3rz7-qr8ry010t07.14t@flex--wuhaotsh.bounces.google.com>)
 id 1knXbh-0001jg-LU
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 20:52:29 -0500
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a]:50515)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <31tDSXwgKCsc97un165ut11tyr.p1z3rz7-qr8ry010t07.14t@flex--wuhaotsh.bounces.google.com>)
 id 1knXbc-0007BU-G0
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 20:52:28 -0500
Received: by mail-pg1-x54a.google.com with SMTP id j30so5406149pgj.17
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 17:52:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=KaejCfR3XIMBW9+kHrvCrE/ARFgjCDfumPKiprTzBVo=;
 b=eMW2C0xAHjbgTBHVItwmvC8LqIpMfvd6hRGLEXhscoQV3M4BkGSLpXlHBu5vtV93mo
 17WtvcNppcia65Yoyh85K0H/0oVzr2Nw35OHDByNCymA8v9KTe0tBQ+r6LgvQPFDnj8A
 rr/TkRIbZdhRrISkDpGfnDIfglBezqldcrLgUSlZgTBgk9DH8/dOI5WcOmmt1U25TYbl
 GMdFkXpbWxaXCHREDfw92fgNU27AhyW/fziua0ij9rsQb6f1bz5jI/sY5pQ2r5Hq9FWP
 z6E8/PNk5MJ2lQEqL37dZnxgtR1pmhIdZrbv0id4krbZX329NlIdIUfCJpOBuUAp02rQ
 HTfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=KaejCfR3XIMBW9+kHrvCrE/ARFgjCDfumPKiprTzBVo=;
 b=WdeEBkV8LaBUzEJFvaHnGpi79s8/Mj3wqeY6gMay+rgaKkxAjFt79ZK+02BXzE1C5e
 JaimYc3heaMZIeI32JfWBFoIpJR7WsFUbTpwY3VWawR0bzkItQSrNzpz5mK5+pSuKHK1
 VuXKaYzXB7o6RaeCh0KKW8iolFDnbvUutngT/L3EJ/VvhMKYss+4b65rLT0tiic7Agt4
 gztLnB0dF/0Z2PLOHPgERtqsD7psJDc5G8X1lCFhFAHy0IOrWhRyA+fA/EtaRYFKOqAI
 /OWxAySQ7ojAqJIcIWhRA5bZUgFYVfsyOEWeWC7TdikbfLKGfWLkXlQIExEjPpNIxbHd
 keFw==
X-Gm-Message-State: AOAM533nfX3SF4l4+S+iVH8cS5vpKUqIISG18vzjp1XBh93TzRPo/lZ0
 Lk7wW5vs7YoKmzFX/xsUsx+LNqlBzYn6VA==
X-Google-Smtp-Source: ABdhPJwQAabsUg7mxm3bsNvB0LKnuMuFLBCZXNUPtuCtO9sUFjKS71hdEGzAmwbF0m3ZsLSlhn2qmLPC3EAbDA==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:10:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a17:902:c215:b029:da:b079:b9a3 with SMTP
 id 21-20020a170902c215b02900dab079b9a3mr8856777pll.67.1607651542761; Thu, 10
 Dec 2020 17:52:22 -0800 (PST)
Date: Thu, 10 Dec 2020 17:51:55 -0800
In-Reply-To: <20201211015156.2053372-1-wuhaotsh@google.com>
Message-Id: <20201211015156.2053372-7-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20201211015156.2053372-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.29.2.684.gfbc64c5ab5-goog
Subject: [PATCH 6/7] hw/ipmi: Add a KCS Module for NPCM7XX
To: peter.maydell@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::54a;
 envelope-from=31tDSXwgKCsc97un165ut11tyr.p1z3rz7-qr8ry010t07.14t@flex--wuhaotsh.bounces.google.com;
 helo=mail-pg1-x54a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
Cc: minyard@acm.org, venture@google.com, qemu-devel@nongnu.org,
 hskinnemoen@google.com, wuhaotsh@google.com, kfting@nuvoton.com,
 qemu-arm@nongnu.org, Avi.Fishman@nuvoton.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: Hao Wu <wuhaotsh@google.com>
From: Hao Wu via <qemu-devel@nongnu.org>

Add a KCS module for NPCM7xx SoC. This module implements the IPMI
responder interface and is responsible to communicate with an external
host via the KCS channels in an NPCM7xx SoC.

Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
Signed-off-by: Hao Wu <wuhaotsh@google.com>
---
 docs/system/arm/nuvoton.rst   |   2 +-
 hw/arm/npcm7xx.c              |  10 +-
 hw/ipmi/meson.build           |   1 +
 hw/ipmi/npcm7xx_kcs.c         | 570 ++++++++++++++++++++++++++++++++++
 include/hw/arm/npcm7xx.h      |   2 +
 include/hw/ipmi/npcm7xx_kcs.h | 105 +++++++
 6 files changed, 688 insertions(+), 2 deletions(-)
 create mode 100644 hw/ipmi/npcm7xx_kcs.c
 create mode 100644 include/hw/ipmi/npcm7xx_kcs.h

diff --git a/docs/system/arm/nuvoton.rst b/docs/system/arm/nuvoton.rst
index a1786342e2..21a02deba5 100644
--- a/docs/system/arm/nuvoton.rst
+++ b/docs/system/arm/nuvoton.rst
@@ -43,6 +43,7 @@ Supported devices
  * GPIO controller
  * Analog to Digital Converter (ADC)
  * Pulse Width Modulation (PWM)
+ * Keyboard Controller Style (KCS) channels
 
 Missing devices
 ---------------
@@ -50,7 +51,6 @@ Missing devices
  * LPC/eSPI host-to-BMC interface, including
 
    * Keyboard and mouse controller interface (KBCI)
-   * Keyboard Controller Style (KCS) channels
    * BIOS POST code FIFO
    * System Wake-up Control (SWC)
    * Shared memory (SHM)
diff --git a/hw/arm/npcm7xx.c b/hw/arm/npcm7xx.c
index 72040d4079..4b7116d496 100644
--- a/hw/arm/npcm7xx.c
+++ b/hw/arm/npcm7xx.c
@@ -46,6 +46,7 @@
 #define NPCM7XX_CLK_BA          (0xf0801000)
 #define NPCM7XX_MC_BA           (0xf0824000)
 #define NPCM7XX_RNG_BA          (0xf000b000)
+#define NPCM7XX_KCS_BA          (0xf0007000)
 
 /* USB Host modules */
 #define NPCM7XX_EHCI_BA         (0xf0806000)
@@ -82,6 +83,7 @@ enum NPCM7xxInterrupt {
     NPCM7XX_UART1_IRQ,
     NPCM7XX_UART2_IRQ,
     NPCM7XX_UART3_IRQ,
+    NPCM7XX_KCS_HIB_IRQ         = 9,
     NPCM7XX_TIMER0_IRQ          = 32,   /* Timer Module 0 */
     NPCM7XX_TIMER1_IRQ,
     NPCM7XX_TIMER2_IRQ,
@@ -353,6 +355,7 @@ static void npcm7xx_init(Object *obj)
         object_initialize_child(obj, "gpio[*]", &s->gpio[i], TYPE_NPCM7XX_GPIO);
     }
 
+    object_initialize_child(obj, "kcs", &s->kcs, TYPE_NPCM7XX_KCS);
     object_initialize_child(obj, "ehci", &s->ehci, TYPE_NPCM7XX_EHCI);
     object_initialize_child(obj, "ohci", &s->ohci, TYPE_SYSBUS_OHCI);
 
@@ -509,6 +512,12 @@ static void npcm7xx_realize(DeviceState *dev, Error **errp)
                            npcm7xx_irq(s, NPCM7XX_GPIO0_IRQ + i));
     }
 
+    /* KCS modules. Cannot fail. */
+    sysbus_realize(SYS_BUS_DEVICE(&s->kcs), &error_abort);
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->kcs), 0, NPCM7XX_KCS_BA);
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->kcs), 0,
+                       npcm7xx_irq(s, NPCM7XX_KCS_HIB_IRQ));
+
     /* USB Host */
     object_property_set_bool(OBJECT(&s->ehci), "companion-enable", true,
                              &error_abort);
@@ -574,7 +583,6 @@ static void npcm7xx_realize(DeviceState *dev, Error **errp)
     create_unimplemented_device("npcm7xx.shm",          0xc0001000,   4 * KiB);
     create_unimplemented_device("npcm7xx.vdmx",         0xe0800000,   4 * KiB);
     create_unimplemented_device("npcm7xx.pcierc",       0xe1000000,  64 * KiB);
-    create_unimplemented_device("npcm7xx.kcs",          0xf0007000,   4 * KiB);
     create_unimplemented_device("npcm7xx.gfxi",         0xf000e000,   4 * KiB);
     create_unimplemented_device("npcm7xx.gpio[0]",      0xf0010000,   4 * KiB);
     create_unimplemented_device("npcm7xx.gpio[1]",      0xf0011000,   4 * KiB);
diff --git a/hw/ipmi/meson.build b/hw/ipmi/meson.build
index 9ec4dcb957..1261489fbd 100644
--- a/hw/ipmi/meson.build
+++ b/hw/ipmi/meson.build
@@ -8,5 +8,6 @@ ipmi_ss.add(when: 'CONFIG_ISA_IPMI_BT', if_true: files('isa_ipmi_bt.c'))
 ipmi_ss.add(when: 'CONFIG_PCI_IPMI_BT', if_true: files('pci_ipmi_bt.c'))
 ipmi_ss.add(when: 'CONFIG_IPMI_SSIF', if_true: files('smbus_ipmi.c'))
 ipmi_ss.add(when: 'CONFIG_IPMI_HOST', if_true: files('ipmi_host.c'))
+ipmi_ss.add(when: 'CONFIG_NPCM7XX', if_true: files('npcm7xx_kcs.c'))
 
 softmmu_ss.add_all(when: 'CONFIG_IPMI', if_true: ipmi_ss)
diff --git a/hw/ipmi/npcm7xx_kcs.c b/hw/ipmi/npcm7xx_kcs.c
new file mode 100644
index 0000000000..f568f0cf20
--- /dev/null
+++ b/hw/ipmi/npcm7xx_kcs.c
@@ -0,0 +1,570 @@
+/*
+ * Nuvoton NPCM7xx KCS Module
+ *
+ * Copyright 2020 Google LLC
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
+#include "hw/ipmi/ipmi_host.h"
+#include "hw/ipmi/npcm7xx_kcs.h"
+#include "migration/vmstate.h"
+#include "qemu/bitops.h"
+#include "qemu/log.h"
+#include "qemu/units.h"
+
+/* Registers in each KCS channel. */
+typedef enum NPCM7xxKCSRegister {
+    NPCM7XX_KCSST,
+    NPCM7XX_KCSDO,
+    NPCM7XX_KCSDI,
+    NPCM7XX_KCSDOC,
+    NPCM7XX_KCSDOM,
+    NPCM7XX_KCSDIC,
+    NPCM7XX_KCSCTL,
+    NPCM7XX_KCSIC,
+    NPCM7XX_KCSIE,
+    NPCM7XX_KCS_REGS_END,
+} NPCM7xxKCSRegister;
+
+static const hwaddr npcm7xx_kcs_channel_base[] = {
+    0x0c, 0x1e, 0x30, 0x42
+};
+
+#define NPCM7XX_KCS_REG_DIFF    2
+
+/* Register field definitions. */
+#define NPCM7XX_CTL_OBEIE       BIT(1)
+#define NPCM7XX_CTL_IBFIE       BIT(0)
+
+/* IPMI 2.0 Table 9.1 status register bits */
+#define KCS_ST_STATE(rv)    extract8(rv, 6, 2)
+#define KCS_ST_CMD          BIT(3)
+#define KCS_ST_SMS_ATN      BIT(2)
+#define KCS_ST_IBF          BIT(1)
+#define KCS_ST_OBF          BIT(0)
+
+/* IPMI 2.0 Table 9.2 state bits */
+enum KCSState {
+    IDLE_STATE,
+    READ_STATE,
+    WRITE_STATE,
+    ERROR_STATE,
+};
+
+/* IPMI 2.0 Table 9.3 control codes */
+#define KCS_CMD_GET_STATUS_ABORT    0x60
+#define KCS_CMD_WRITE_START         0x61
+#define KCS_CMD_WRITE_END           0x62
+#define KCS_CMD_READ                0x68
+
+/* Host Side Operations. */
+
+static uint8_t npcm7xx_kcs_host_read_byte(NPCM7xxKCSChannel *c)
+{
+    uint8_t v;
+
+    v = c->dbbout;
+    c->status &= ~KCS_ST_OBF;
+    if (c->ctl & NPCM7XX_CTL_OBEIE) {
+        qemu_irq_raise(c->owner->irq);
+    }
+
+    return v;
+}
+
+static void npcm7xx_kcs_host_write_byte(NPCM7xxKCSChannel *c, uint8_t value,
+        bool is_cmd)
+{
+    c->dbbin = value;
+    c->status |= KCS_ST_IBF;
+    if (is_cmd) {
+        c->status |= KCS_ST_CMD;
+    } else {
+        c->status &= ~KCS_ST_CMD;
+    }
+    if (c->ctl & NPCM7XX_CTL_IBFIE) {
+        qemu_irq_raise(c->owner->irq);
+    }
+}
+
+static void npcm7xx_kcs_handle_event(NPCM7xxKCSChannel *c)
+{
+    uint8_t v;
+    IPMIHostClass *hk;
+
+    switch (KCS_ST_STATE(c->status)) {
+    case IDLE_STATE:
+        if (c->status & KCS_ST_OBF) {
+            /* Read a dummy byte. */
+            npcm7xx_kcs_host_read_byte(c);
+            if (c->outlen > 0) {
+                /* Send to ipmi host when msg ends. */
+                hk = IPMI_HOST_GET_CLASS(c->host);
+                hk->handle_command(c->host, c->outmsg, c->outlen,
+                        MAX_IPMI_MSG_SIZE, c->last_msg_id);
+                /* The last byte has been read. return to empty state. */
+                c->outlen = 0;
+            }
+        }
+        if (c->inlen > 0) {
+            /* Send to bmc the next request */
+            npcm7xx_kcs_host_write_byte(c, KCS_CMD_WRITE_START, true);
+            c->last_byte_not_ready = true;
+        }
+        break;
+    case READ_STATE:
+        if (c->status & KCS_ST_OBF) {
+            /* Read in a byte from BMC */
+            v = npcm7xx_kcs_host_read_byte(c);
+            if (c->outlen < MAX_IPMI_MSG_SIZE) {
+                c->outmsg[c->outlen++] = v;
+            }
+            npcm7xx_kcs_host_write_byte(c, KCS_CMD_READ, false);
+        }
+        break;
+    case WRITE_STATE:
+        if (c->status & KCS_ST_IBF) {
+            /* The guest hasn't read the byte yet. We'll wait. */
+            break;
+        }
+        /* Clear OBF. */
+        c->status &= ~KCS_ST_OBF;
+        /* If it's the last byte written, we need to first send a command. */
+        if (c->last_byte_not_ready && c->inpos == c->inlen - 1) {
+            npcm7xx_kcs_host_write_byte(c, KCS_CMD_WRITE_END, true);
+            c->last_byte_not_ready = false;
+        } else {
+            npcm7xx_kcs_host_write_byte(c, c->inmsg[c->inpos++], false);
+            if (!c->last_byte_not_ready) {
+                /* The last byte has been sent. */
+                c->inlen = 0;
+                c->inpos = 0;
+            }
+        }
+        break;
+    case ERROR_STATE:
+        if (c->status & KCS_ST_OBF) {
+            /* Read in error byte from BMC */
+            npcm7xx_kcs_host_read_byte(c);
+        }
+        /* Force abort */
+        c->outlen = 0;
+        c->inlen = 0;
+        c->inpos = 0;
+        if (!(c->status & KCS_ST_IBF)) {
+            npcm7xx_kcs_host_write_byte(c, KCS_CMD_GET_STATUS_ABORT, true);
+        }
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+/* Received a request from the host and send it to BMC core. */
+static void npcm7xx_kcs_handle_req(IPMIResponder *ii, uint8_t msg_id,
+                                unsigned char *req, unsigned req_len)
+{
+    IPMIResponderClass *iic = IPMI_RESPONDER_GET_CLASS(ii);
+    NPCM7xxKCSChannel *c = iic->get_backend_data(ii);
+
+    /* Drop the request if the last request is still not handled. */
+    if (c->inlen > 0) {
+        return;
+    }
+    if (req_len == 0) {
+        return;
+    }
+    if (req_len > MAX_IPMI_MSG_SIZE) {
+        /* Truncate the extra bytes that don't fit. */
+        req_len = MAX_IPMI_MSG_SIZE;
+    }
+    memcpy(c->inmsg, req, req_len);
+    c->inpos = 0;
+    c->inlen = req_len;
+
+    c->last_msg_id = msg_id;
+
+    npcm7xx_kcs_handle_event(c);
+}
+
+/* Core Side Operations. */
+/* Return the channel index for addr. If the addr is out of range, return -1. */
+static int npcm7xx_kcs_channel_index(hwaddr addr)
+{
+    int index;
+
+    if (unlikely(addr < npcm7xx_kcs_channel_base[0])) {
+        return -1;
+    }
+    if (unlikely(addr >= npcm7xx_kcs_channel_base[NPCM7XX_KCS_NR_CHANNELS])) {
+        return -1;
+    }
+    if (unlikely(addr % NPCM7XX_KCS_REG_DIFF)) {
+        return -1;
+    }
+
+    for (index = 0; index < NPCM7XX_KCS_NR_CHANNELS; ++index) {
+        if (addr < npcm7xx_kcs_channel_base[index + 1]) {
+            return index;
+        }
+    }
+
+    g_assert_not_reached();
+}
+
+static NPCM7xxKCSRegister npcm7xx_kcs_reg_index(hwaddr addr, int channel)
+{
+    NPCM7xxKCSRegister reg;
+
+    reg = (addr - npcm7xx_kcs_channel_base[channel]) / NPCM7XX_KCS_REG_DIFF;
+    return reg;
+}
+
+static uint8_t npcm7xx_kcs_read_byte(NPCM7xxKCSChannel *c,
+        NPCM7xxKCSRegister reg)
+{
+    uint8_t v = 0;
+
+    v = c->dbbin;
+
+    c->status &= ~KCS_ST_IBF;
+    if (c->ctl & NPCM7XX_CTL_IBFIE) {
+        qemu_irq_lower(c->owner->irq);
+    }
+
+    if (reg == NPCM7XX_KCSDIC) {
+        qemu_log_mask(LOG_UNIMP,
+                "%s: Host nSCIPME interrupt is not implemented.\n",
+                __func__);
+    }
+
+    npcm7xx_kcs_handle_event(c);
+    return v;
+}
+
+static void npcm7xx_kcs_write_byte(NPCM7xxKCSChannel *c,
+        NPCM7xxKCSRegister reg, uint8_t value)
+{
+    c->dbbout = value;
+
+    c->status |= KCS_ST_OBF;
+    if (c->ctl & NPCM7XX_CTL_OBEIE) {
+        qemu_irq_lower(c->owner->irq);
+    }
+
+    if (reg == NPCM7XX_KCSDOC) {
+        qemu_log_mask(LOG_UNIMP,
+                "%s: Host nSCIPME interrupt is not implemented.\n",
+                __func__);
+    } else if (reg == NPCM7XX_KCSDOM) {
+        qemu_log_mask(LOG_UNIMP,
+                "%s: Host nSMI interrupt is not implemented.\n",
+                __func__);
+    }
+
+    npcm7xx_kcs_handle_event(c);
+}
+
+static uint8_t npcm7xx_kcs_read_status(NPCM7xxKCSChannel *c)
+{
+    uint8_t status = c->status;
+
+    return status;
+}
+
+static void npcm7xx_kcs_write_status(NPCM7xxKCSChannel *c, uint8_t value)
+{
+    static const uint8_t mask =
+        KCS_ST_CMD | KCS_ST_IBF | KCS_ST_OBF;
+
+    if (value & mask) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: read-only bits in 0x%02x ignored\n",
+                      __func__, value);
+        value &= ~mask;
+    }
+
+    c->status = (c->status & mask) | value;
+}
+
+static void npcm7xx_kcs_write_ctl(NPCM7xxKCSChannel *c, uint8_t value)
+{
+    if (value & ~(NPCM7XX_CTL_OBEIE | NPCM7XX_CTL_IBFIE)) {
+        qemu_log_mask(LOG_UNIMP, "%s: Host interrupts are not implemented.\n",
+                __func__);
+    }
+
+    c->ctl = value;
+}
+
+static uint64_t npcm7xx_kcs_read(void *opaque, hwaddr addr, unsigned int size)
+{
+    NPCM7xxKCSState *s = opaque;
+    uint64_t value = 0;
+    int channel;
+    NPCM7xxKCSRegister reg;
+
+    channel = npcm7xx_kcs_channel_index(addr);
+    if (channel < 0 || channel >= NPCM7XX_KCS_NR_CHANNELS) {
+        qemu_log_mask(LOG_UNIMP,
+                      "%s: read from addr 0x%04" HWADDR_PRIx
+                      " is invalid or unimplemented.\n",
+                      __func__, addr);
+        return value;
+    }
+
+    reg = npcm7xx_kcs_reg_index(addr, channel);
+    switch (reg) {
+    case NPCM7XX_KCSDI:
+    case NPCM7XX_KCSDIC:
+        value = npcm7xx_kcs_read_byte(&s->channels[channel], reg);
+        break;
+    case NPCM7XX_KCSDO:
+    case NPCM7XX_KCSDOC:
+    case NPCM7XX_KCSDOM:
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: register @ 0x%04" HWADDR_PRIx " is write-only\n",
+                      __func__, addr);
+        break;
+    case NPCM7XX_KCSST:
+        value = npcm7xx_kcs_read_status(&s->channels[channel]);
+        break;
+    case NPCM7XX_KCSCTL:
+        value = s->channels[channel].ctl;
+        break;
+    case NPCM7XX_KCSIC:
+        value = s->channels[channel].ic;
+        break;
+    case NPCM7XX_KCSIE:
+        value = s->channels[channel].ie;
+        break;
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: read from invalid addr 0x%04" HWADDR_PRIx "\n",
+                      __func__, addr);
+    }
+
+    return value;
+}
+
+static void npcm7xx_kcs_write(void *opaque, hwaddr addr, uint64_t v,
+                                    unsigned int size)
+{
+    NPCM7xxKCSState *s = opaque;
+    int channel;
+    NPCM7xxKCSRegister reg;
+
+    channel = npcm7xx_kcs_channel_index(addr);
+    if (channel < 0 || channel >= NPCM7XX_KCS_NR_CHANNELS) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: write to addr 0x%04" HWADDR_PRIx
+                      " is invalid or unimplemented.\n",
+                      __func__, addr);
+        return;
+    }
+
+    reg = npcm7xx_kcs_reg_index(addr, channel);
+    switch (reg) {
+    case NPCM7XX_KCSDI:
+    case NPCM7XX_KCSDIC:
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: register @ 0x%04" HWADDR_PRIx " is read-only\n",
+                      __func__, addr);
+        break;
+    case NPCM7XX_KCSDO:
+    case NPCM7XX_KCSDOC:
+    case NPCM7XX_KCSDOM:
+        npcm7xx_kcs_write_byte(&s->channels[channel], reg, v);
+        break;
+    case NPCM7XX_KCSST:
+        npcm7xx_kcs_write_status(&s->channels[channel], v);
+        break;
+    case NPCM7XX_KCSCTL:
+        npcm7xx_kcs_write_ctl(&s->channels[channel], v);
+        break;
+    case NPCM7XX_KCSIC:
+        qemu_log_mask(LOG_UNIMP, "%s: Host interrupts are not implemented.\n",
+                __func__);
+        break;
+    case NPCM7XX_KCSIE:
+        qemu_log_mask(LOG_UNIMP, "%s: Host interrupts are not implemented.\n",
+                __func__);
+        break;
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: read from invalid addr 0x%04" HWADDR_PRIx "\n",
+                      __func__, addr);
+    }
+}
+
+static const MemoryRegionOps npcm7xx_kcs_ops = {
+    .read = npcm7xx_kcs_read,
+    .write = npcm7xx_kcs_write,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+    .valid = {
+        .min_access_size = 1, /* KCS registers are 8-bits. */
+        .max_access_size = 1, /* KCS registers are 8-bits. */
+        .unaligned = false,
+    },
+};
+
+static const VMStateDescription vmstate_npcm7xx_kcs_channel = {
+    .name = "npcm7xx-kcs-channel",
+    .version_id = 0,
+    .minimum_version_id = 0,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT8(status, NPCM7xxKCSChannel),
+        VMSTATE_UINT8(dbbout, NPCM7xxKCSChannel),
+        VMSTATE_UINT8(dbbin, NPCM7xxKCSChannel),
+        VMSTATE_UINT8(ctl, NPCM7xxKCSChannel),
+        VMSTATE_UINT8(ic, NPCM7xxKCSChannel),
+        VMSTATE_UINT8(ie, NPCM7xxKCSChannel),
+        VMSTATE_END_OF_LIST(),
+    },
+};
+
+static IPMIHost *npcm7xx_kcs_get_host(IPMIResponder *ii)
+{
+    NPCM7xxKCSChannel *c = NPCM7XX_KCS_CHANNEL(ii);
+
+    return c->host;
+}
+
+static void npcm7xx_kcs_set_host(IPMIResponder *ii, IPMIHost *h)
+{
+    NPCM7xxKCSChannel *c = NPCM7XX_KCS_CHANNEL(ii);
+
+    c->host = h;
+}
+
+static void *npcm7xx_kcs_get_backend_data(IPMIResponder *ii)
+{
+    NPCM7xxKCSChannel *c = NPCM7XX_KCS_CHANNEL(ii);
+
+    return c;
+}
+
+static void npcm7xx_kcs_channel_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    IPMIResponderClass *iic = IPMI_RESPONDER_CLASS(klass);
+
+    QEMU_BUILD_BUG_ON(NPCM7XX_KCS_REGS_END != NPCM7XX_KCS_CHANNEL_NR_REGS);
+
+    dc->desc = "NPCM7xx KCS Channel";
+    dc->vmsd = &vmstate_npcm7xx_kcs_channel;
+
+    iic->get_host = npcm7xx_kcs_get_host;
+    iic->set_host = npcm7xx_kcs_set_host;
+    iic->get_backend_data = npcm7xx_kcs_get_backend_data;
+    iic->handle_req = npcm7xx_kcs_handle_req;
+}
+
+static const TypeInfo npcm7xx_kcs_channel_info = {
+    .name               = TYPE_NPCM7XX_KCS_CHANNEL,
+    .parent             = TYPE_DEVICE,
+    .instance_size      = sizeof(NPCM7xxKCSChannel),
+    .class_init         = npcm7xx_kcs_channel_class_init,
+    .interfaces         = (InterfaceInfo[]) {
+        { TYPE_IPMI_RESPONDER },
+        { },
+    },
+};
+
+static void npcm7xx_kcs_enter_reset(Object *obj, ResetType type)
+{
+    NPCM7xxKCSState *s = NPCM7XX_KCS(obj);
+    int i;
+
+    for (i = 0; i < NPCM7XX_KCS_NR_CHANNELS; i++) {
+        NPCM7xxKCSChannel *c = &s->channels[i];
+
+        c->status = 0x00;
+        c->ctl = 0xc0;
+        c->ic = 0x41;
+        c->ie = 0x00;
+    }
+}
+
+static void npcm7xx_kcs_hold_reset(Object *obj)
+{
+    NPCM7xxKCSState *s = NPCM7XX_KCS(obj);
+
+    qemu_irq_lower(s->irq);
+}
+
+static const VMStateDescription vmstate_npcm7xx_kcs = {
+    .name = "npcm7xx-kcs",
+    .version_id = 0,
+    .minimum_version_id = 0,
+    .fields = (VMStateField[]) {
+        VMSTATE_END_OF_LIST(),
+    },
+};
+
+static void npcm7xx_kcs_realize(DeviceState *dev, Error **errp)
+{
+    NPCM7xxKCSState *s = NPCM7XX_KCS(dev);
+    SysBusDevice *sbd = &s->parent;
+    int i;
+
+    memory_region_init_io(&s->iomem, OBJECT(s), &npcm7xx_kcs_ops, s,
+                          TYPE_NPCM7XX_KCS, 4 * KiB);
+    sysbus_init_mmio(sbd, &s->iomem);
+    sysbus_init_irq(sbd, &s->irq);
+
+    for (i = 0; i < NPCM7XX_KCS_NR_CHANNELS; i++) {
+        s->channels[i].owner = s;
+        if (!qdev_realize(DEVICE(&s->channels[i]), NULL, errp)) {
+            return;
+        }
+    }
+}
+
+static void npcm7xx_kcs_init(Object *obj)
+{
+    NPCM7xxKCSState *s = NPCM7XX_KCS(obj);
+    int i;
+
+    for (i = 0; i < NPCM7XX_KCS_NR_CHANNELS; i++) {
+        object_initialize_child(obj, g_strdup_printf("channels[%d]", i),
+                &s->channels[i], TYPE_NPCM7XX_KCS_CHANNEL);
+    }
+}
+
+static void npcm7xx_kcs_class_init(ObjectClass *klass, void *data)
+{
+    ResettableClass *rc = RESETTABLE_CLASS(klass);
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->desc = "NPCM7xx Timer Controller";
+    dc->vmsd = &vmstate_npcm7xx_kcs;
+    dc->realize = npcm7xx_kcs_realize;
+    rc->phases.enter = npcm7xx_kcs_enter_reset;
+    rc->phases.hold = npcm7xx_kcs_hold_reset;
+}
+
+static const TypeInfo npcm7xx_kcs_info = {
+    .name               = TYPE_NPCM7XX_KCS,
+    .parent             = TYPE_SYS_BUS_DEVICE,
+    .instance_size      = sizeof(NPCM7xxKCSState),
+    .class_init         = npcm7xx_kcs_class_init,
+    .instance_init      = npcm7xx_kcs_init,
+};
+
+static void npcm7xx_kcs_register_type(void)
+{
+    type_register_static(&npcm7xx_kcs_channel_info);
+    type_register_static(&npcm7xx_kcs_info);
+}
+type_init(npcm7xx_kcs_register_type);
diff --git a/include/hw/arm/npcm7xx.h b/include/hw/arm/npcm7xx.h
index f6227aa8aa..7d5ea24355 100644
--- a/include/hw/arm/npcm7xx.h
+++ b/include/hw/arm/npcm7xx.h
@@ -20,6 +20,7 @@
 #include "hw/adc/npcm7xx_adc.h"
 #include "hw/cpu/a9mpcore.h"
 #include "hw/gpio/npcm7xx_gpio.h"
+#include "hw/ipmi/npcm7xx_kcs.h"
 #include "hw/mem/npcm7xx_mc.h"
 #include "hw/misc/npcm7xx_clk.h"
 #include "hw/misc/npcm7xx_gcr.h"
@@ -85,6 +86,7 @@ typedef struct NPCM7xxState {
     NPCM7xxMCState      mc;
     NPCM7xxRNGState     rng;
     NPCM7xxGPIOState    gpio[8];
+    NPCM7xxKCSState     kcs;
     EHCISysBusState     ehci;
     OHCISysBusState     ohci;
     NPCM7xxFIUState     fiu[2];
diff --git a/include/hw/ipmi/npcm7xx_kcs.h b/include/hw/ipmi/npcm7xx_kcs.h
new file mode 100644
index 0000000000..bae4d21f5d
--- /dev/null
+++ b/include/hw/ipmi/npcm7xx_kcs.h
@@ -0,0 +1,105 @@
+/*
+ * Nuvoton NPCM7xx KCS Module
+ *
+ * Copyright 2020 Google LLC
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
+#ifndef NPCM7XX_KCS_H
+#define NPCM7XX_KCS_H
+
+#include "exec/memory.h"
+#include "hw/ipmi/ipmi.h"
+#include "hw/ipmi/ipmi_host.h"
+#include "hw/ipmi/ipmi_responder.h"
+#include "hw/irq.h"
+#include "hw/sysbus.h"
+
+#define NPCM7XX_KCS_NR_CHANNELS             3
+/*
+ * Number of registers in each KCS channel. Don't change this without
+ * incrementing the version_id in the vmstate.
+ */
+#define NPCM7XX_KCS_CHANNEL_NR_REGS         9
+
+typedef struct NPCM7xxKCSState NPCM7xxKCSState;
+
+/**
+ * struct NPCM7xxKCSChannel - KCS Channel that can be read or written by the
+ * host.
+ * @parent: Parent device.
+ * @owner: The KCS module that manages this KCS channel.
+ * @status: The status of this KCS module.
+ * @dbbout: The output buffer to the host.
+ * @dbbin: The input buffer from the host.
+ * @ctl: The control register.
+ * @ic: The host interrupt control register. Not implemented.
+ * @ie: The host interrupt enable register. Not implemented.
+ * @inmsg: The input message from the host. To be put in dbbin.
+ * @inpos: The current position of input message.
+ * @inlen: The length of input message.
+ * @outmsg: The input message from the host. To be put in dbbout.
+ * @outpos: The current position of output message.
+ * @outlen: The length of output message.
+ * @last_byte_not_ready: The last byte in inmsg is not ready to be sent.
+ * @last_msg_id: The message id of last incoming request from host.
+ */
+typedef struct NPCM7xxKCSChannel {
+    DeviceState             parent;
+
+    NPCM7xxKCSState         *owner;
+    IPMIHost                *host;
+    /* Core side registers. */
+    uint8_t                 status;
+    uint8_t                 dbbout;
+    uint8_t                 dbbin;
+    uint8_t                 ctl;
+    uint8_t                 ic;
+    uint8_t                 ie;
+
+    /* Host side buffers. */
+    uint8_t                 inmsg[MAX_IPMI_MSG_SIZE];
+    uint32_t                inpos;
+    uint32_t                inlen;
+    uint8_t                 outmsg[MAX_IPMI_MSG_SIZE];
+    uint32_t                outpos;
+    uint32_t                outlen;
+
+    /* Flags. */
+    bool                    last_byte_not_ready;
+    uint8_t                 last_msg_id;
+} NPCM7xxKCSChannel;
+
+/**
+ * struct NPCM7xxKCSState - Keyboard Control Style (KCS) Module device state.
+ * @parent: System bus device.
+ * @iomem: Memory region through which registers are accessed.
+ * @irq: GIC interrupt line to fire on reading or writing the buffer.
+ * @channels: The KCS channels this module manages.
+ */
+struct NPCM7xxKCSState {
+    SysBusDevice            parent;
+
+    MemoryRegion            iomem;
+
+    qemu_irq                irq;
+    NPCM7xxKCSChannel       channels[NPCM7XX_KCS_NR_CHANNELS];
+};
+
+#define TYPE_NPCM7XX_KCS_CHANNEL "npcm7xx-kcs-channel"
+#define NPCM7XX_KCS_CHANNEL(obj)                                      \
+    OBJECT_CHECK(NPCM7xxKCSChannel, (obj), TYPE_NPCM7XX_KCS_CHANNEL)
+
+#define TYPE_NPCM7XX_KCS "npcm7xx-kcs"
+#define NPCM7XX_KCS(obj)                                              \
+    OBJECT_CHECK(NPCM7xxKCSState, (obj), TYPE_NPCM7XX_KCS)
+
+#endif /* NPCM7XX_KCS_H */
-- 
2.29.2.684.gfbc64c5ab5-goog


