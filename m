Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A2FA41BA84
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 00:42:20 +0200 (CEST)
Received: from localhost ([::1]:50010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVLnl-0005Kx-Dx
	for lists+qemu-devel@lfdr.de; Tue, 28 Sep 2021 18:42:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <33plTYQYKCnEiXijhgVddVaT.RdbfTbj-STkTacdcVcj.dgV@flex--titusr.bounces.google.com>)
 id 1mVLm9-0003MR-5E
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 18:40:38 -0400
Received: from mail-qk1-x749.google.com ([2607:f8b0:4864:20::749]:49890)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <33plTYQYKCnEiXijhgVddVaT.RdbfTbj-STkTacdcVcj.dgV@flex--titusr.bounces.google.com>)
 id 1mVLm4-00076l-Np
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 18:40:36 -0400
Received: by mail-qk1-x749.google.com with SMTP id
 j6-20020a05620a288600b0045e5d85ca17so1623907qkp.16
 for <qemu-devel@nongnu.org>; Tue, 28 Sep 2021 15:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc:content-transfer-encoding;
 bh=5P5NFsUiM+rzX2vtHV/HS1RPQgFXXORTmEprK4Pa1Vw=;
 b=P1hd/wQxHeyE4FqNhpGoe8ZtOCkz9O3uZSSvfA1M94xajRdoW5FfJREvxr5zSggnVz
 8EDPaiuh+ix0T9xEx+c0xQ0T6RkendU4gAHJEg+m7qhkI8U0CXRVwjFw09/zDagC4P/g
 TT+/Hdw0CRjRSaZX7mZL+i4FBb/VTHTLae2k2AT7m1x9mS/SIMz5uYnox+w9yJoyhu3Q
 zFs8nTEFxzV2mdhaLFsbUESX6pk+Mpny3fSMA9Ct5pyqlbmhwsUsbUD5dnXSPjxaLr4O
 G/KWpiEcqTYW+a8hg0xUh1hLve5zIag4KkuC1xP/1lEFHgPp63C6IiAI57VkPEiM/WUN
 QoPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc:content-transfer-encoding;
 bh=5P5NFsUiM+rzX2vtHV/HS1RPQgFXXORTmEprK4Pa1Vw=;
 b=ZNw/ZCMbRfJC3m6k+TTYe1eflrv4vOwkIR+su9NveXm3zNn7jXWnrsfpkWHVtnkukB
 LyGMutJyyq7vasL9xd6qssXeJhDbqXnBnjJOd1FcdAomaspgPlCiRi5oEKWUjueR8O+N
 vR6ONvfmTeBTNrKiBv7EVwwR3zLc+y/vTy0SZbZIfV/Cdgc411zI4Eb/E0R+Gxx8gUxo
 fYgDRdft4109da+L6s6aEpYonZW68L/qBPv9FSlTS/y3xQNgShSxMOh/fEDB9GmrdZyS
 0LqLfaIA+1XH4s7c2wl3BEl4n0ROyUf5eSQY9GoI4dTHoGQOs21cEq5mpFmfVPfb8P6N
 QCcw==
X-Gm-Message-State: AOAM5336XCUnjw/9GSVxVWGNT6+ZV2EORe5YuGI5FqRhEiBcsg5Z1yoK
 hFWDB9gIc0qtWafWTi4Nv/FkYm3GBFs=
X-Google-Smtp-Source: ABdhPJxWr2KkyeriagSExKpzZuVDQTaynYQQsbnvU5rMdANBcxa5pEX72MRPjQ5Rtehx9h/DfNzxagp0Oqc=
X-Received: from localhost ([2620:15c:2c5:13:bb4a:748d:1e5f:4de8])
 (user=titusr job=sendgmr) by 2002:a05:6214:528:: with SMTP id
 x8mr8130497qvw.30.1632868830754; Tue, 28 Sep 2021 15:40:30 -0700 (PDT)
Date: Tue, 28 Sep 2021 15:39:42 -0700
In-Reply-To: <20210928223942.244860-1-titusr@google.com>
Message-Id: <20210928223942.244860-2-titusr@google.com>
Mime-Version: 1.0
References: <20210928223942.244860-1-titusr@google.com>
X-Mailer: git-send-email 2.33.0.800.g4c38ced690-goog
Subject: [RFC 1/1] hw/ipmi: add an aspeed ipmi iBT device model
From: Titus Rwantare <titusr@google.com>
To: clg@kaod.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, f4bug@amsat.org, 
 andrew@aj.id.au, wuhaotsh@google.com, minyard@acm.org, 
 Titus Rwantare <titusr@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::749;
 envelope-from=33plTYQYKCnEiXijhgVddVaT.RdbfTbj-STkTacdcVcj.dgV@flex--titusr.bounces.google.com;
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

Modifies [PATCH] hw/misc: Add an iBT device model
posted by C=C3=A9dric Le Goater, to use IPMIInterface.

Signed-off-by: Titus Rwantare <titusr@google.com>
---
 hw/ipmi/ipmi_extern.h        |   1 +
 include/hw/arm/aspeed_soc.h  |   2 +
 include/hw/ipmi/aspeed_ibt.h |  77 +++++++++
 hw/arm/aspeed_ast2600.c      |  12 ++
 hw/arm/aspeed_soc.c          |  12 ++
 hw/ipmi/aspeed_ibt.c         | 311 +++++++++++++++++++++++++++++++++++
 hw/ipmi/meson.build          |   1 +
 hw/ipmi/trace-events         |   7 +
 8 files changed, 423 insertions(+)
 create mode 100644 include/hw/ipmi/aspeed_ibt.h
 create mode 100644 hw/ipmi/aspeed_ibt.c

diff --git a/hw/ipmi/ipmi_extern.h b/hw/ipmi/ipmi_extern.h
index e4aa80a0f6..40157ab0b3 100644
--- a/hw/ipmi/ipmi_extern.h
+++ b/hw/ipmi/ipmi_extern.h
@@ -27,6 +27,7 @@
=20
 #include "qemu/osdep.h"
 #include "hw/ipmi/ipmi.h"
+#include "chardev/char-fe.h"
=20
 #define VM_MSG_CHAR        0xA0 /* Marks end of message */
 #define VM_CMD_CHAR        0xA1 /* Marks end of a command */
diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
index 87d76c9259..f650ff83ae 100644
--- a/include/hw/arm/aspeed_soc.h
+++ b/include/hw/arm/aspeed_soc.h
@@ -30,6 +30,7 @@
 #include "hw/usb/hcd-ehci.h"
 #include "qom/object.h"
 #include "hw/misc/aspeed_lpc.h"
+#include "hw/ipmi/aspeed_ibt.h"
=20
 #define ASPEED_SPIS_NUM  2
 #define ASPEED_EHCIS_NUM 2
@@ -65,6 +66,7 @@ struct AspeedSoCState {
     AspeedSDHCIState sdhci;
     AspeedSDHCIState emmc;
     AspeedLPCState lpc;
+    AspeedIBTState ibt;
     uint32_t uart_default;
 };
=20
diff --git a/include/hw/ipmi/aspeed_ibt.h b/include/hw/ipmi/aspeed_ibt.h
new file mode 100644
index 0000000000..d90cc103d4
--- /dev/null
+++ b/include/hw/ipmi/aspeed_ibt.h
@@ -0,0 +1,77 @@
+/*
+ * ASPEED iBT Device
+ *
+ * Copyright (c) 2016-2021 C=C3=A9dric Le Goater, IBM Corporation.
+ * Copyright 2021 Google LLC
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#ifndef ASPEED_IBT_H
+#define ASPEED_IBT_H
+
+#include "hw/ipmi/ipmi.h"
+#include "hw/sysbus.h"
+
+#define TYPE_ASPEED_IBT "aspeed.ibt"
+#define ASPEED_IBT(obj) OBJECT_CHECK(AspeedIBTState, (obj), TYPE_ASPEED_IB=
T)
+
+#define ASPEED_IBT_NR_REGS 7
+
+#define ASPEED_IBT_BUFFER_SIZE 64
+
+#define ASPEED_IBT_IO_REGION_SIZE 0x1C
+
+#define TO_REG(o) (o >> 2)
+
+/* from linux/char/ipmi/bt-bmc. */
+#define BT_CR0      0x0
+#define   BT_CR0_IO_BASE        16
+#define   BT_CR0_IRQ            12
+#define   BT_CR0_EN_CLR_SLV_RDP 0x8
+#define   BT_CR0_EN_CLR_SLV_WRP 0x4
+#define   BT_CR0_ENABLE_IBT     0x1
+#define BT_CR1      0x4
+#define   BT_CR1_IRQ_H2B        0x01
+#define   BT_CR1_IRQ_HBUSY      0x40
+#define BT_CR2      0x8
+#define   BT_CR2_IRQ_H2B        0x01
+#define   BT_CR2_IRQ_HBUSY      0x40
+#define BT_CR3      0xc
+#define BT_CTRL     0x10
+#define   BT_CTRL_B_BUSY        BIT(7) /* BMC is busy */
+#define   BT_CTRL_H_BUSY        BIT(6) /* Host is busy */
+#define   BT_CTRL_OEM0          BIT(5)
+#define   BT_CTRL_SMS_ATN       BIT(4) /* SMS/EVT Attention */
+#define   BT_CTRL_B2H_ATN       BIT(3) /* BMC to Host Attention */
+#define   BT_CTRL_H2B_ATN       BIT(2) /* Host to BMC Attention */
+#define   BT_CTRL_CLR_RD_PTR    BIT(1) /* Clear Read Ptr */
+#define   BT_CTRL_CLR_WR_PTR    BIT(0) /* Clear Write Ptr */
+#define BT_BMC2HOST 0x14
+#define BT_HOST2BMC 0x14
+#define BT_INTMASK  0x18
+#define   BT_INTMASK_BMC_HWRST      BIT(7)
+#define   BT_INTMASK_B2H_IRQ        BIT(1)
+#define   BT_INTMASK_B2H_IRQEN      BIT(0)
+
+typedef struct AspeedIBTState {
+    SysBusDevice parent;
+
+    IPMICore *handler;
+
+    uint8_t msg_id;
+    uint8_t recv_msg[ASPEED_IBT_BUFFER_SIZE];
+    uint8_t recv_msg_len;
+    int recv_msg_index;
+
+    uint8_t send_msg[ASPEED_IBT_BUFFER_SIZE];
+    uint8_t send_msg_len;
+
+    MemoryRegion iomem;
+    qemu_irq irq;
+
+    uint32_t regs[ASPEED_IBT_NR_REGS];
+} AspeedIBTState;
+
+
+#endif /* ASPEED_IBT_H */
diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index 9d70e8e060..f40fa69a53 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -216,6 +216,8 @@ static void aspeed_soc_ast2600_init(Object *obj)
=20
     snprintf(typename, sizeof(typename), "aspeed.hace-%s", socname);
     object_initialize_child(obj, "hace", &s->hace, typename);
+
+    object_initialize_child(obj, "ibt", &s->ibt, TYPE_ASPEED_IBT);
 }
=20
 /*
@@ -507,6 +509,16 @@ static void aspeed_soc_ast2600_realize(DeviceState *de=
v, Error **errp)
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->hace), 0, sc->memmap[ASPEED_DEV_HAC=
E]);
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->hace), 0,
                        aspeed_soc_get_irq(s, ASPEED_DEV_HACE));
+
+    /* iBT */
+    if (!sysbus_realize(SYS_BUS_DEVICE(&s->ibt), errp)) {
+        return;
+    }
+    memory_region_add_subregion(&s->lpc.iomem,
+                   sc->memmap[ASPEED_DEV_IBT] - sc->memmap[ASPEED_DEV_LPC]=
,
+                   &s->ibt.iomem);
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->ibt), 0,
+                       aspeed_soc_get_irq(s, ASPEED_DEV_IBT));
 }
=20
 static void aspeed_soc_ast2600_class_init(ObjectClass *oc, void *data)
diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index ed84502e23..13543d37c5 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -216,6 +216,8 @@ static void aspeed_soc_init(Object *obj)
=20
     snprintf(typename, sizeof(typename), "aspeed.hace-%s", socname);
     object_initialize_child(obj, "hace", &s->hace, typename);
+
+    object_initialize_child(obj, "ibt", &s->ibt, TYPE_ASPEED_IBT);
 }
=20
 static void aspeed_soc_realize(DeviceState *dev, Error **errp)
@@ -426,6 +428,16 @@ static void aspeed_soc_realize(DeviceState *dev, Error=
 **errp)
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->lpc), 1 + aspeed_lpc_kcs_4,
                        qdev_get_gpio_in(DEVICE(&s->lpc), aspeed_lpc_kcs_4)=
);
=20
+    /* iBT */
+    if (!sysbus_realize(SYS_BUS_DEVICE(&s->ibt), errp)) {
+        return;
+    }
+    memory_region_add_subregion(&s->lpc.iomem,
+                   sc->memmap[ASPEED_DEV_IBT] - sc->memmap[ASPEED_DEV_LPC]=
,
+                   &s->ibt.iomem);
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->lpc), 1 + aspeed_lpc_ibt,
+                       qdev_get_gpio_in(DEVICE(&s->lpc), aspeed_lpc_ibt));
+
     /* HACE */
     object_property_set_link(OBJECT(&s->hace), "dram", OBJECT(s->dram_mr),
                              &error_abort);
diff --git a/hw/ipmi/aspeed_ibt.c b/hw/ipmi/aspeed_ibt.c
new file mode 100644
index 0000000000..94503da1b0
--- /dev/null
+++ b/hw/ipmi/aspeed_ibt.c
@@ -0,0 +1,311 @@
+/*
+ * ASPEED iBT Device
+ *
+ * Copyright (c) 2016-2021 C=C3=A9dric Le Goater, IBM Corporation.
+ * Copyright 2021 Google LLC
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "hw/irq.h"
+#include "hw/qdev-properties.h"
+#include "hw/qdev-properties-system.h"
+#include "hw/ipmi/aspeed_ibt.h"
+#include "hw/ipmi/ipmi_extern.h"
+#include "hw/sysbus.h"
+#include "migration/vmstate.h"
+#include "qapi/error.h"
+#include "qemu/bitops.h"
+#include "qemu/error-report.h"
+#include "qemu/log.h"
+#include "sysemu/qtest.h"
+#include "sysemu/sysemu.h"
+#include "trace.h"
+
+static void aspeed_ibt_dump_msg(const char *func, unsigned char *msg,
+                                unsigned int len)
+{
+    if (trace_event_get_state_backends(TRACE_ASPEED_IBT_CHR_DUMP_MSG)) {
+        int size =3D len * 3 + 1;
+        char tmp[size];
+        int i, n =3D 0;
+
+        for (i =3D 0; i < len; i++) {
+            n +=3D snprintf(tmp + n, size - n, "%02x:", msg[i]);
+        }
+        tmp[size - 1] =3D 0;
+
+        trace_aspeed_ibt_chr_dump_msg(func, tmp, len);
+    }
+}
+
+/* convert and send IPMI message from BMC to remote host */
+static void aspeed_ibt_b2h_write(AspeedIBTState *ibt)
+{
+    IPMICoreClass *hk =3D IPMI_CORE_GET_CLASS(ibt->handler);
+
+    aspeed_ibt_dump_msg(__func__, ibt->send_msg, ibt->send_msg_len);
+    /* separate seq from raw contents */
+    ibt->msg_id =3D ibt->send_msg[2];
+    ibt->send_msg[2] =3D ibt->send_msg[1];
+    /* length and seq not included in vm message */
+    hk->handle_command(ibt->handler, ibt->send_msg + 2,
+                        ibt->send_msg_len - 2, MAX_IPMI_MSG_SIZE,
+                        ibt->msg_id);
+}
+
+
+/* BMC firmware writing to memory region */
+static void aspeed_ibt_write(void *opaque, hwaddr offset, uint64_t data,
+                             uint32_t size)
+{
+    AspeedIBTState *ibt =3D ASPEED_IBT(opaque);
+
+    trace_aspeed_ibt_write(offset, data);
+    switch (offset) {
+    case BT_CTRL:
+        /* CLR_WR_PTR: cleared before a message is written */
+        if (data & BT_CTRL_CLR_WR_PTR) {
+            memset(ibt->send_msg, 0, sizeof(ibt->send_msg));
+            ibt->send_msg_len =3D 0;
+            trace_aspeed_ibt_event("CLR_WR_PTR");
+        }
+
+        /* CLR_RD_PTR: cleared before a message is read */
+        else if (data & BT_CTRL_CLR_RD_PTR) {
+            ibt->recv_msg_index =3D -1;
+            trace_aspeed_ibt_event("CLR_RD_PTR");
+        }
+
+        /*
+         * H2B_ATN: raised by host to end message, cleared by BMC
+         * before reading message
+         */
+        else if (data & BT_CTRL_H2B_ATN) {
+            ibt->regs[TO_REG(BT_CTRL)] &=3D ~BT_CTRL_H2B_ATN;
+            trace_aspeed_ibt_event("H2B_ATN");
+        }
+
+        /* B_BUSY: raised and cleared by BMC when message is read */
+        else if (data & BT_CTRL_B_BUSY) {
+            ibt->regs[TO_REG(BT_CTRL)] ^=3D BT_CTRL_B_BUSY;
+            trace_aspeed_ibt_event("B_BUSY");
+        }
+
+        /*
+         * B2H_ATN: raised by BMC and cleared by host
+         *
+         * Also simulate the host busy bit which is set while the host
+         * is reading the message from the BMC
+         */
+        else if (data & BT_CTRL_B2H_ATN) {
+            trace_aspeed_ibt_event("B2H_ATN");
+            ibt->regs[TO_REG(BT_CTRL)] |=3D (BT_CTRL_B2H_ATN | BT_CTRL_H_B=
USY);
+
+            aspeed_ibt_b2h_write(ibt);
+
+            ibt->regs[TO_REG(BT_CTRL)] &=3D ~(BT_CTRL_B2H_ATN | BT_CTRL_H_=
BUSY);
+        }
+
+        /* Anything else is unexpected */
+        else {
+            qemu_log_mask(LOG_GUEST_ERROR, "%s: unexpected CTRL setting\n"=
,
+                          __func__);
+        }
+
+        /* Message was read by BMC. we can reset the receive state */
+        if (!(ibt->regs[TO_REG(BT_CTRL)] & BT_CTRL_B_BUSY)) {
+            trace_aspeed_ibt_event("B_BUSY cleared");
+            ibt->recv_msg_len =3D 0;
+        }
+        break;
+
+    case BT_BMC2HOST:
+        if (ibt->send_msg_len < sizeof(ibt->send_msg)) {
+            trace_aspeed_ibt_event("BMC2HOST");
+            ibt->send_msg[ibt->send_msg_len++] =3D data & 0xff;
+        }
+        break;
+
+    case BT_CR0: /* TODO: iBT config */
+    case BT_CR1: /* interrupt enable */
+    case BT_CR3: /* unused */
+    case BT_INTMASK:
+        ibt->regs[TO_REG(offset)] =3D (uint32_t) data;
+        break;
+
+    case BT_CR2: /* interrupt status. writing 1 clears. */
+        ibt->regs[TO_REG(offset)] ^=3D (uint32_t) data;
+        qemu_irq_lower(ibt->irq);
+        break;
+
+    default:
+        qemu_log_mask(LOG_UNIMP, "%s: not implemented 0x%" HWADDR_PRIx "\n=
",
+                      __func__, offset);
+        break;
+    }
+}
+
+/* BMC firmware reading from memory region */
+static uint64_t aspeed_ibt_read(void *opaque, hwaddr offset, unsigned size=
)
+{
+    AspeedIBTState *ibt =3D ASPEED_IBT(opaque);
+    uint64_t val =3D 0;
+
+    switch (offset) {
+    case BT_HOST2BMC: /* shares offset with B2H */
+        trace_aspeed_ibt_event("HOST2BMC");
+        /*
+         * The IPMI BT interface requires the first byte to be the
+         * length of the message
+         */
+        if (ibt->recv_msg_index =3D=3D -1) {
+            val =3D ibt->recv_msg_len;
+            ibt->recv_msg_index++;
+        } else if (ibt->recv_msg_index < ibt->recv_msg_len) {
+            val =3D ibt->recv_msg[ibt->recv_msg_index++];
+        }
+        break;
+
+    case BT_CR0:
+    case BT_CR1:
+    case BT_CR2:
+    case BT_CR3:
+    case BT_CTRL:
+    case BT_INTMASK:
+        val =3D ibt->regs[TO_REG(offset)];
+        break;
+
+    default:
+        qemu_log_mask(LOG_UNIMP, "%s: not implemented 0x%" HWADDR_PRIx "\n=
",
+                      __func__, offset);
+        return 0;
+    }
+
+    trace_aspeed_ibt_read(offset, val);
+    return val;
+}
+
+/* send a request from a host to the BMC core */
+static void aspeed_ibt_handle_msg(IPMIInterface *ii, uint8_t msg_id,
+                                 unsigned char *req, unsigned int req_len)
+{
+    AspeedIBTState *ibt =3D ASPEED_IBT(ii);
+
+    if (req_len =3D=3D 0) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: zero length request", __func__=
);
+        return;
+    }
+
+    if (req_len > ASPEED_IBT_BUFFER_SIZE - 1) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: request of %d bytes is too lon=
g",
+                      __func__, req_len);
+        req_len =3D ASPEED_IBT_BUFFER_SIZE - 1;
+    }
+
+    /* include length and reuse msg_id as seq in message */
+    ibt->recv_msg[0] =3D req[0];
+    ibt->recv_msg[1] =3D msg_id;
+    memcpy(ibt->recv_msg + 2, req + 1, req_len - 1);
+    ibt->recv_msg_len =3D req_len + 1;
+
+
+    ibt->regs[TO_REG(BT_CTRL)] |=3D BT_CTRL_H2B_ATN;
+    aspeed_ibt_dump_msg(__func__, ibt->recv_msg, ibt->recv_msg_len);
+
+}
+
+static void *aspeed_ibt_backend_data(IPMIInterface *ii)
+{
+    return ii;
+}
+
+static void aspeed_ibt_set_ipmi_handler(IPMIInterface *ii, IPMICore *h)
+{
+    AspeedIBTState *ibt =3D ASPEED_IBT(ii);
+    ibt->handler =3D h;
+}
+
+static const MemoryRegionOps aspeed_ibt_ops =3D {
+    .read =3D aspeed_ibt_read,
+    .write =3D aspeed_ibt_write,
+    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .valid =3D {
+        .min_access_size =3D 1,
+        .max_access_size =3D 4,
+    },
+};
+
+static void aspeed_ibt_enter_reset(Object *obj, ResetType type)
+{
+    AspeedIBTState *ibt =3D ASPEED_IBT(obj);
+
+    memset(ibt->regs, 0, sizeof(ibt->regs));
+
+    memset(ibt->recv_msg, 0, sizeof(ibt->recv_msg));
+    ibt->recv_msg_len =3D 0;
+    ibt->recv_msg_index =3D -1;
+
+    memset(ibt->send_msg, 0, sizeof(ibt->send_msg));
+    ibt->send_msg_len =3D 0;
+}
+
+
+static void aspeed_ibt_realize(DeviceState *dev, Error **errp)
+{
+    AspeedIBTState *ibt =3D ASPEED_IBT(dev);
+    SysBusDevice *sbd =3D SYS_BUS_DEVICE(dev);
+    IPMIInterface *ii =3D IPMI_INTERFACE(dev);
+
+    sysbus_init_irq(sbd, &ibt->irq);
+    memory_region_init_io(&ibt->iomem, OBJECT(ibt), &aspeed_ibt_ops, ibt,
+                          TYPE_ASPEED_IBT, ASPEED_IBT_IO_REGION_SIZE);
+    sysbus_init_mmio(sbd, &ibt->iomem);
+
+
+    if (ibt->handler) {
+        ibt->handler->intf =3D ii;
+    }
+}
+
+static const VMStateDescription vmstate_aspeed_ibt =3D {
+    .name =3D TYPE_ASPEED_IBT,
+    .version_id =3D 1,
+    .minimum_version_id =3D 1,
+    .fields =3D (VMStateField[]) {
+        VMSTATE_UINT32_ARRAY(regs, AspeedIBTState, ASPEED_IBT_NR_REGS),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static void aspeed_ibt_class_init(ObjectClass *klass, void *data)
+{
+    ResettableClass *rc =3D RESETTABLE_CLASS(klass);
+    DeviceClass *dc =3D DEVICE_CLASS(klass);
+    IPMIInterfaceClass *iic =3D IPMI_INTERFACE_CLASS(klass);
+
+    dc->desc =3D "ASPEED IPMI BT Host Controller";
+    dc->vmsd =3D &vmstate_aspeed_ibt;
+    dc->realize =3D aspeed_ibt_realize;
+    rc->phases.enter =3D aspeed_ibt_enter_reset;
+
+    iic->handle_msg =3D aspeed_ibt_handle_msg;
+    iic->get_backend_data =3D aspeed_ibt_backend_data;
+    iic->set_ipmi_handler =3D aspeed_ibt_set_ipmi_handler;
+}
+
+static const TypeInfo aspeed_ibt_info[] =3D {
+    {
+        .name =3D TYPE_ASPEED_IBT,
+        .parent =3D TYPE_SYS_BUS_DEVICE,
+        .instance_size =3D sizeof(AspeedIBTState),
+        .class_init =3D aspeed_ibt_class_init,
+        .interfaces =3D (InterfaceInfo[]) {
+            { TYPE_IPMI_INTERFACE },
+            { },
+        },
+    },
+};
+
+DEFINE_TYPES(aspeed_ibt_info);
diff --git a/hw/ipmi/meson.build b/hw/ipmi/meson.build
index 3d8b030ba5..7e7bced38e 100644
--- a/hw/ipmi/meson.build
+++ b/hw/ipmi/meson.build
@@ -9,5 +9,6 @@ ipmi_ss.add(when: 'CONFIG_PCI_IPMI_BT', if_true: files('pci=
_ipmi_bt.c'))
 ipmi_ss.add(when: 'CONFIG_IPMI_SSIF', if_true: files('smbus_ipmi.c'))
 ipmi_ss.add(when: 'CONFIG_IPMI_HOST', if_true: files('ipmi_host_extern.c')=
)
 ipmi_ss.add(when: 'CONFIG_NPCM7XX', if_true: files('npcm7xx_kcs.c'))
+ipmi_ss.add(when: 'CONFIG_IPMI_HOST', if_true: files('aspeed_ibt.c'))
=20
 softmmu_ss.add_all(when: 'CONFIG_IPMI', if_true: ipmi_ss)
diff --git a/hw/ipmi/trace-events b/hw/ipmi/trace-events
index 66d40bccbc..efbedfdd62 100644
--- a/hw/ipmi/trace-events
+++ b/hw/ipmi/trace-events
@@ -6,3 +6,10 @@ npcm7xx_kcs_write(const char *id, int channel, int reg, ui=
nt8_t value) " %s chan
 npcm7xx_kcs_handle_event(const char *id, uint8_t status) " %s: %" PRIu8
 npcm7xx_kcs_host_read_byte(const char *id, uint8_t value) " %s: value 0x%0=
2" PRIx8
 npcm7xx_kcs_host_write_byte(const char *id, uint8_t value) " %s: value 0x%=
02" PRIx8
+
+# aspeed_ibt.c
+aspeed_ibt_chr_dump_msg(const char *func, const char *buf, uint32_t len) "=
%s: %s #%d bytes"
+aspeed_ibt_chr_event(bool connected) "connected:%d"
+aspeed_ibt_read(uint64_t offset, uint64_t value) "offset:0x%" PRIx64 " val=
ue:0x%" PRIx64
+aspeed_ibt_write(uint64_t offset, uint64_t value) "offset:0x%" PRIx64 " va=
lue:0x%" PRIx64
+aspeed_ibt_event(const char* event) "%s"
--=20
2.33.0.800.g4c38ced690-goog


