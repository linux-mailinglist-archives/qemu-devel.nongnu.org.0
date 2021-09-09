Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97766405FE4
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 01:12:06 +0200 (CEST)
Received: from localhost ([::1]:54558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOTDB-00019u-LT
	for lists+qemu-devel@lfdr.de; Thu, 09 Sep 2021 19:12:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3q5M6YQgKCswECzs6BAzy66y3w.u648w4C-vwDw3565y5C.69y@flex--wuhaotsh.bounces.google.com>)
 id 1mOT8k-0004tm-DR
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 19:07:31 -0400
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a]:33593)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3q5M6YQgKCswECzs6BAzy66y3w.u648w4C-vwDw3565y5C.69y@flex--wuhaotsh.bounces.google.com>)
 id 1mOT8f-0003gF-BL
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 19:07:29 -0400
Received: by mail-pf1-x44a.google.com with SMTP id
 z2-20020a626502000000b003fe1e4314d2so93011pfb.0
 for <qemu-devel@nongnu.org>; Thu, 09 Sep 2021 16:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=fdZVER/yB7lc4+MOlrDXtvenCttmS1hQP/NljnOWPFs=;
 b=LyZA3Syp3mptx046Or5MNtvibVSy7C3dqQcsLpldRa/nmZmqEpRHgRwFYAEFlg6XGB
 rN+W2OwHHCL6G1l+K+D/PLKkJriqL1bi3g6lT3mE3yuNX9EUDSUdyf3mwEzLtAl6gqwc
 gp22KSjDLY0wUtQ6slmWSKxltPZxMVkCwluR6byadaijVlurmhtfrPb12LQjLaHWK/k/
 sGVR7dVkR6jVYNYgAVn5EifoPDAkLPjt2tTN9O8jE3HExdi/QmfceuwemUYV+jHoNBqc
 e5QPByxpQdEoka0sfU9wERVigZo1i4XOuZFYYmkBXqb8M3xI3Yf6r7bwo3mdHBkIoquH
 mkNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=fdZVER/yB7lc4+MOlrDXtvenCttmS1hQP/NljnOWPFs=;
 b=iX87e1xpBoBKu7px4cSwd2OoYRBVmojKiVCDvhyQCngVR0PnOQec4By5J7TFRwvGUO
 spX5ajyvuqYN+MD49XBl0kSLmMgV1RU8juX7/PyxZgEv9ncJdDWr2b07LXbL/Q79gs0w
 uje8gPLMLZdhFCA1zCidckc1D4h0W42ncRFbhioeJhKMwiZkK0St1ECXj9Ykv2SQ2vb0
 /3ps6bygLKRN/MxxYzXrZaqJCaJ8esCNX/MId9bTXuEVvjfETmP7pKOtz20v1QfO8SZ4
 rI/V5du37sl/YtwFY2qyb+A5g3gDBsdvGHrHjVpjeVlKV1Nrt/0wY0R7lIEaeYX/AHnu
 lZbg==
X-Gm-Message-State: AOAM532zLvrjpsvp9QxiM4OX+sGL+IIxK5Z96bvrA7FKcqkwglcoomeB
 7WpidN/oJgMDZs6EPXtqpMNYcr+xMSOSVw==
X-Google-Smtp-Source: ABdhPJxm0L66VELH295ebUZAElsdwgitdE0PZknZFiB0n4w17akfwMjNqwHhjf6/mEK09CaZM8RbDIaNWcgkCg==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a17:90a:d507:: with SMTP id
 t7mr6239707pju.174.1631228843290; Thu, 09 Sep 2021 16:07:23 -0700 (PDT)
Date: Thu,  9 Sep 2021 16:06:20 -0700
In-Reply-To: <20210909230620.511815-1-wuhaotsh@google.com>
Message-Id: <20210909230620.511815-9-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20210909230620.511815-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.33.0.309.g3052b89438-goog
Subject: [PATCH 8/8] hw/ipmi: Add a KCS Module for NPCM7XX
From: Hao Wu <wuhaotsh@google.com>
To: minyard@acm.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, wuhaotsh@google.com, 
 venture@google.com, Avi.Fishman@nuvoton.com, kfting@nuvoton.com, 
 hskinnemoen@google.com, titusr@google.com, peter.maydell@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::44a;
 envelope-from=3q5M6YQgKCswECzs6BAzy66y3w.u648w4C-vwDw3565y5C.69y@flex--wuhaotsh.bounces.google.com;
 helo=mail-pf1-x44a.google.com
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

Add a KCS module for NPCM7xx SoC. This module implements the IPMI
responder interface and is responsible to communicate with an external
host via the KCS channels in an NPCM7xx SoC.

Note that we cannot directly use ipmi_kcs.c since the communication
direction is the opposite. For example, in READ_STATE, ipmi_kcs.c (core
side emulation) reads a message from BMC while npcm7xx_kcs.c
(BMC-side emulation) sends a message to the core.

Signed-off-by: Hao Wu <wuhaotsh@google.com>
Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
---
 docs/system/arm/nuvoton.rst   |   1 -
 hw/arm/npcm7xx.c              |  10 +-
 hw/ipmi/meson.build           |   1 +
 hw/ipmi/npcm7xx_kcs.c         | 588 ++++++++++++++++++++++++++++++++++
 hw/ipmi/trace-events          |   8 +
 hw/ipmi/trace.h               |   1 +
 include/hw/arm/npcm7xx.h      |   2 +
 include/hw/ipmi/npcm7xx_kcs.h | 103 ++++++
 meson.build                   |   1 +
 9 files changed, 713 insertions(+), 2 deletions(-)
 create mode 100644 hw/ipmi/npcm7xx_kcs.c
 create mode 100644 hw/ipmi/trace-events
 create mode 100644 hw/ipmi/trace.h
 create mode 100644 include/hw/ipmi/npcm7xx_kcs.h

diff --git a/docs/system/arm/nuvoton.rst b/docs/system/arm/nuvoton.rst
index 69f57c2886..0358323e76 100644
--- a/docs/system/arm/nuvoton.rst
+++ b/docs/system/arm/nuvoton.rst
@@ -54,7 +54,6 @@ Missing devices
  * LPC/eSPI host-to-BMC interface, including
 
    * Keyboard and mouse controller interface (KBCI)
-   * Keyboard Controller Style (KCS) channels
    * BIOS POST code FIFO
    * System Wake-up Control (SWC)
    * Shared memory (SHM)
diff --git a/hw/arm/npcm7xx.c b/hw/arm/npcm7xx.c
index 2ab0080e0b..319c5ba70e 100644
--- a/hw/arm/npcm7xx.c
+++ b/hw/arm/npcm7xx.c
@@ -45,6 +45,7 @@
 #define NPCM7XX_CLK_BA          (0xf0801000)
 #define NPCM7XX_MC_BA           (0xf0824000)
 #define NPCM7XX_RNG_BA          (0xf000b000)
+#define NPCM7XX_KCS_BA          (0xf0007000)
 
 /* USB Host modules */
 #define NPCM7XX_EHCI_BA         (0xf0806000)
@@ -81,6 +82,7 @@ enum NPCM7xxInterrupt {
     NPCM7XX_UART1_IRQ,
     NPCM7XX_UART2_IRQ,
     NPCM7XX_UART3_IRQ,
+    NPCM7XX_KCS_HIB_IRQ         = 9,
     NPCM7XX_EMC1RX_IRQ          = 15,
     NPCM7XX_EMC1TX_IRQ,
     NPCM7XX_TIMER0_IRQ          = 32,   /* Timer Module 0 */
@@ -423,6 +425,7 @@ static void npcm7xx_init(Object *obj)
                                 TYPE_NPCM7XX_SMBUS);
     }
 
+    object_initialize_child(obj, "kcs", &s->kcs, TYPE_NPCM7XX_KCS);
     object_initialize_child(obj, "ehci", &s->ehci, TYPE_NPCM7XX_EHCI);
     object_initialize_child(obj, "ohci", &s->ohci, TYPE_SYSBUS_OHCI);
 
@@ -598,6 +601,12 @@ static void npcm7xx_realize(DeviceState *dev, Error **errp)
                            npcm7xx_irq(s, NPCM7XX_SMBUS0_IRQ + i));
     }
 
+    /* KCS modules*/
+    sysbus_realize(SYS_BUS_DEVICE(&s->kcs), &error_abort);
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->kcs), 0, NPCM7XX_KCS_BA);
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->kcs), 0,
+                       npcm7xx_irq(s, NPCM7XX_KCS_HIB_IRQ));
+
     /* USB Host */
     object_property_set_bool(OBJECT(&s->ehci), "companion-enable", true,
                              &error_abort);
@@ -710,7 +719,6 @@ static void npcm7xx_realize(DeviceState *dev, Error **errp)
     create_unimplemented_device("npcm7xx.shm",          0xc0001000,   4 * KiB);
     create_unimplemented_device("npcm7xx.vdmx",         0xe0800000,   4 * KiB);
     create_unimplemented_device("npcm7xx.pcierc",       0xe1000000,  64 * KiB);
-    create_unimplemented_device("npcm7xx.kcs",          0xf0007000,   4 * KiB);
     create_unimplemented_device("npcm7xx.gfxi",         0xf000e000,   4 * KiB);
     create_unimplemented_device("npcm7xx.espi",         0xf009f000,   4 * KiB);
     create_unimplemented_device("npcm7xx.peci",         0xf0100000,   4 * KiB);
diff --git a/hw/ipmi/meson.build b/hw/ipmi/meson.build
index b1dd4710dc..3d8b030ba5 100644
--- a/hw/ipmi/meson.build
+++ b/hw/ipmi/meson.build
@@ -8,5 +8,6 @@ ipmi_ss.add(when: 'CONFIG_ISA_IPMI_BT', if_true: files('isa_ipmi_bt.c'))
 ipmi_ss.add(when: 'CONFIG_PCI_IPMI_BT', if_true: files('pci_ipmi_bt.c'))
 ipmi_ss.add(when: 'CONFIG_IPMI_SSIF', if_true: files('smbus_ipmi.c'))
 ipmi_ss.add(when: 'CONFIG_IPMI_HOST', if_true: files('ipmi_host_extern.c'))
+ipmi_ss.add(when: 'CONFIG_NPCM7XX', if_true: files('npcm7xx_kcs.c'))
 
 softmmu_ss.add_all(when: 'CONFIG_IPMI', if_true: ipmi_ss)
diff --git a/hw/ipmi/npcm7xx_kcs.c b/hw/ipmi/npcm7xx_kcs.c
new file mode 100644
index 0000000000..197ddcd6e0
--- /dev/null
+++ b/hw/ipmi/npcm7xx_kcs.c
@@ -0,0 +1,588 @@
+/*
+ * Nuvoton NPCM7xx KCS Module
+ *
+ * Copyright 2021 Google LLC
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
+#include "hw/ipmi/npcm7xx_kcs.h"
+#include "migration/vmstate.h"
+#include "qapi/error.h"
+#include "qemu/bitops.h"
+#include "qemu/log.h"
+#include "qemu/units.h"
+#include "trace.h"
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
+    trace_npcm7xx_kcs_host_read_byte(DEVICE(c)->canonical_path, v);
+    return v;
+}
+
+static void npcm7xx_kcs_host_write_byte(NPCM7xxKCSChannel *c, uint8_t value,
+        bool is_cmd)
+{
+    trace_npcm7xx_kcs_host_write_byte(DEVICE(c)->canonical_path, value);
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
+    IPMICoreClass *hk;
+
+    trace_npcm7xx_kcs_handle_event(DEVICE(c)->canonical_path,
+                                   KCS_ST_STATE(c->status));
+    switch (KCS_ST_STATE(c->status)) {
+    case IDLE_STATE:
+        if (c->status & KCS_ST_OBF) {
+            /* Read a dummy byte. */
+            npcm7xx_kcs_host_read_byte(c);
+            if (c->outlen > 0) {
+                /* Send to ipmi host when msg ends. */
+                if (c->host) {
+                    hk = IPMI_CORE_GET_CLASS(c->host);
+                    hk->handle_command(c->host, c->outmsg, c->outlen,
+                            MAX_IPMI_MSG_SIZE, c->last_msg_id);
+                }
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
+
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
+
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
+
+    case ERROR_STATE:
+        if (c->status & KCS_ST_OBF) {
+            /* Read in error byte from BMC */
+            npcm7xx_kcs_host_read_byte(c);
+        }
+        /* Force abort */
+        c->outlen = 0;
+        c->inlen = 0;
+        c->inpos = 0;
+        c->status = 0;
+        break;
+
+    default:
+        g_assert_not_reached();
+    }
+}
+
+/* Received a request from the host and send it to BMC core. */
+static void npcm7xx_kcs_handle_req(IPMIInterface *ii, uint8_t msg_id,
+                                unsigned char *req, unsigned req_len)
+{
+    IPMIInterfaceClass *iic = IPMI_INTERFACE_GET_CLASS(ii);
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
+    uint8_t value = 0;
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
+    trace_npcm7xx_kcs_read(DEVICE(s)->canonical_path, channel, reg, value);
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
+    trace_npcm7xx_kcs_write(DEVICE(s)->canonical_path, channel, reg, (uint8_t)v);
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
+static void npcm7xx_kcs_channel_realize(DeviceState *dev, Error **errp)
+{
+    IPMIInterface *ii = IPMI_INTERFACE(dev);
+    NPCM7xxKCSChannel *c = NPCM7XX_KCS_CHANNEL(ii);
+
+    if (c->host) {
+        c->host->intf = ii;
+    }
+}
+
+static void *npcm7xx_kcs_get_backend_data(IPMIInterface *ii)
+{
+    NPCM7xxKCSChannel *c = NPCM7XX_KCS_CHANNEL(ii);
+
+    return c;
+}
+
+static void npcm7xx_kcs_set_ipmi_handler(IPMIInterface *ii, IPMICore *h)
+{
+    NPCM7xxKCSChannel *c = NPCM7XX_KCS_CHANNEL(ii);
+
+    c->host = h;
+}
+
+static void npcm7xx_kcs_set_atn(struct IPMIInterface *s, int val, int irq)
+{
+}
+
+static void npcm7xx_kcs_channel_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    IPMIInterfaceClass *iic = IPMI_INTERFACE_CLASS(klass);
+
+    QEMU_BUILD_BUG_ON(NPCM7XX_KCS_REGS_END != NPCM7XX_KCS_CHANNEL_NR_REGS);
+
+    dc->desc = "NPCM7xx KCS Channel";
+    dc->vmsd = &vmstate_npcm7xx_kcs_channel;
+    dc->realize = npcm7xx_kcs_channel_realize;
+
+    iic->get_backend_data = npcm7xx_kcs_get_backend_data;
+    iic->handle_msg = npcm7xx_kcs_handle_req;
+    iic->set_ipmi_handler = npcm7xx_kcs_set_ipmi_handler;
+    iic->set_atn = npcm7xx_kcs_set_atn;
+}
+
+static const TypeInfo npcm7xx_kcs_channel_info = {
+    .name               = TYPE_NPCM7XX_KCS_CHANNEL,
+    .parent             = TYPE_DEVICE,
+    .instance_size      = sizeof(NPCM7xxKCSChannel),
+    .class_init         = npcm7xx_kcs_channel_class_init,
+    .interfaces         = (InterfaceInfo[]) {
+        { TYPE_IPMI_INTERFACE },
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
diff --git a/hw/ipmi/trace-events b/hw/ipmi/trace-events
new file mode 100644
index 0000000000..66d40bccbc
--- /dev/null
+++ b/hw/ipmi/trace-events
@@ -0,0 +1,8 @@
+# See docs/devel/tracing.txt for syntax documentation.
+
+# npcm7xx_kcs.c
+npcm7xx_kcs_read(const char *id, int channel, int reg, uint8_t value) " %s channel: %" PRIi32 ", reg: %" PRIi32 ", value 0x%02" PRIx8
+npcm7xx_kcs_write(const char *id, int channel, int reg, uint8_t value) " %s channel: %" PRIi32 ", reg: %" PRIi32 ", value 0x%02" PRIx8
+npcm7xx_kcs_handle_event(const char *id, uint8_t status) " %s: %" PRIu8
+npcm7xx_kcs_host_read_byte(const char *id, uint8_t value) " %s: value 0x%02" PRIx8
+npcm7xx_kcs_host_write_byte(const char *id, uint8_t value) " %s: value 0x%02" PRIx8
diff --git a/hw/ipmi/trace.h b/hw/ipmi/trace.h
new file mode 100644
index 0000000000..60a72fb4be
--- /dev/null
+++ b/hw/ipmi/trace.h
@@ -0,0 +1 @@
+#include "trace/trace-hw_ipmi.h"
diff --git a/include/hw/arm/npcm7xx.h b/include/hw/arm/npcm7xx.h
index 61ecc57ab9..ea22fba06a 100644
--- a/include/hw/arm/npcm7xx.h
+++ b/include/hw/arm/npcm7xx.h
@@ -22,6 +22,7 @@
 #include "hw/cpu/a9mpcore.h"
 #include "hw/gpio/npcm7xx_gpio.h"
 #include "hw/i2c/npcm7xx_smbus.h"
+#include "hw/ipmi/npcm7xx_kcs.h"
 #include "hw/mem/npcm7xx_mc.h"
 #include "hw/misc/npcm7xx_clk.h"
 #include "hw/misc/npcm7xx_gcr.h"
@@ -99,6 +100,7 @@ typedef struct NPCM7xxState {
     NPCM7xxRNGState     rng;
     NPCM7xxGPIOState    gpio[8];
     NPCM7xxSMBusState   smbus[16];
+    NPCM7xxKCSState     kcs;
     EHCISysBusState     ehci;
     OHCISysBusState     ohci;
     NPCM7xxFIUState     fiu[2];
diff --git a/include/hw/ipmi/npcm7xx_kcs.h b/include/hw/ipmi/npcm7xx_kcs.h
new file mode 100644
index 0000000000..5954772ef1
--- /dev/null
+++ b/include/hw/ipmi/npcm7xx_kcs.h
@@ -0,0 +1,103 @@
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
+    IPMICore                *host;
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
diff --git a/meson.build b/meson.build
index 7e58e6279b..6856f7aa5d 100644
--- a/meson.build
+++ b/meson.build
@@ -2128,6 +2128,7 @@ if have_system
     'hw/ide',
     'hw/input',
     'hw/intc',
+    'hw/ipmi',
     'hw/isa',
     'hw/mem',
     'hw/mips',
-- 
2.33.0.309.g3052b89438-goog


