Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 047AB5AF7C2
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Sep 2022 00:15:47 +0200 (CEST)
Received: from localhost ([::1]:50428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVgrB-0007gj-Tc
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 18:15:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3UcQXYwYKClgJ8JKIH6EE6B4.2ECG4CK-34L4BDED6DK.EH6@flex--titusr.bounces.google.com>)
 id 1oVghz-0005Tq-Ei
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 18:06:16 -0400
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49]:39680)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3UcQXYwYKClgJ8JKIH6EE6B4.2ECG4CK-34L4BDED6DK.EH6@flex--titusr.bounces.google.com>)
 id 1oVghv-0004SC-Fz
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 18:06:15 -0400
Received: by mail-yb1-xb49.google.com with SMTP id
 k13-20020a056902024d00b0066fa7f50b97so9440132ybs.6
 for <qemu-devel@nongnu.org>; Tue, 06 Sep 2022 15:06:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:from:to:cc:subject:date;
 bh=wsQ+6bAIIGItFcvixtYAif9BzIYVViJWOkAoWThlQFM=;
 b=UfAtLtyknUij8o+2h1N8v3lHQ1OF83lxhZqqrDpUkG60As+4JT6+8g5o1/RpCu9gry
 z+xH5+pfIv6EuzAvqCnP92LkTwqFjVrEdRWogNfhOTso5w6kVBEnyNecYMyTm+JfeTY9
 5KNSlt4ydneYwcDTNVI9yo47/GG5pQanHqdVCAvPAxVJ2l/paZjBLZHzCSAOQTU1yN7b
 5Rr0fR19AOnutwmONJHX8eWnxWdSRdWUdXhy6H740eWxQ2HqVhYncYusPFddKwqAPbQ4
 gBhV9esARwjtfrdCY8jPO2vjIq+QT/muVAaTzZ9etti6MwRCn76BkmlkNsejbWYkM1rv
 nyfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
 :date;
 bh=wsQ+6bAIIGItFcvixtYAif9BzIYVViJWOkAoWThlQFM=;
 b=srF/wON/9qCWv5n7y4pa3VX3dN8JHh7d7qKDlUXlfW4/wwoRkVA9/XO8+iCChLCXil
 +fICM5A6uqN/tIo1ZGEyiI8Jqhu0t5E6IesAYDgtfRnsBmIrntti3vLujZXtAESwIHXq
 OL5/hMe0r45m7UKPD5PyxAd7u9QHmpQc+fnmBCbu4ARTk/6CT/GuHeHaILdpFVtI3XFF
 XuPjZYYPkaVwkK8M9cbnGVJN8yhyOGXd0PZQCeVeBLXg8/jpA3iHlcOWs3xwmVIzTaNp
 Tks4M1DCiCTE+BTyKSzfHNNYM8r99HJNZ0iwMAfgAEE5k+4pvKLH5JiEbr7YqBT39wPn
 u9EA==
X-Gm-Message-State: ACgBeo0WQF/Kyzgw4YHdv6NR5cS8jcqYGufhqXMM1YhX4x7aiJCI+FRl
 N80UmmIrKe8NKwEw0MEcE5yWiol+nT9ba+Yb2CqpZgPEhduILJDTm67Vre3nTdNWdAkdQHw0Er7
 DTjXRxmjoMaIaXwtEbQMle2dK4Fec/7xk7YZIfme0hkqa+geomkFTLJwDfgC7
X-Google-Smtp-Source: AA6agR4Km6bho8+mfHzKtqVaC7sBmVQ6jNAuXDKT679Vdp7fMKZYG4IUy2rOSyMCtk4cDNDVgQv2OWzveAE=
X-Received: from titusr.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:22b8])
 (user=titusr job=sendgmr) by 2002:a05:6902:1081:b0:69b:f9d:53f1 with SMTP id
 v1-20020a056902108100b0069b0f9d53f1mr659730ybu.406.1662501969956; Tue, 06 Sep
 2022 15:06:09 -0700 (PDT)
Date: Tue,  6 Sep 2022 22:05:51 +0000
In-Reply-To: <20220906220552.1243998-1-titusr@google.com>
Mime-Version: 1.0
References: <20220906220552.1243998-1-titusr@google.com>
X-Mailer: git-send-email 2.37.2.789.g6183377224-goog
Message-ID: <20220906220552.1243998-3-titusr@google.com>
Subject: [RFC PATCH 2/3] hw/peci: add PECI support for NPCM7xx BMCs
From: Titus Rwantare <titusr@google.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter@pjd.dev, patrick@stwcx.xyz, 
 iwona.winiarska@intel.com, tmaimon77@gmail.com, quic_jaehyoo@quicinc.com, 
 Titus Rwantare <titusr@google.com>, Patrick Venture <venture@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b49;
 envelope-from=3UcQXYwYKClgJ8JKIH6EE6B4.2ECG4CK-34L4BDED6DK.EH6@flex--titusr.bounces.google.com;
 helo=mail-yb1-xb49.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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

This allows BMC firmware for npcm7xx BMCs to talk to a PECI client
in qemu.

Signed-off-by: Titus Rwantare <titusr@google.com>
Reviewed-by: Patrick Venture <venture@google.com>
---
 MAINTAINERS                    |   3 +-
 hw/arm/Kconfig                 |   1 +
 hw/arm/npcm7xx.c               |   9 ++
 hw/peci/meson.build            |   1 +
 hw/peci/npcm7xx_peci.c         | 204 +++++++++++++++++++++++++++++++++
 hw/peci/trace-events           |   5 +
 include/hw/arm/npcm7xx.h       |   2 +
 include/hw/peci/npcm7xx_peci.h |  37 ++++++
 8 files changed, 261 insertions(+), 1 deletion(-)
 create mode 100644 hw/peci/npcm7xx_peci.c
 create mode 100644 include/hw/peci/npcm7xx_peci.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 14ab29679d..f87dfe5bfa 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2959,7 +2959,7 @@ R: Paolo Bonzini <pbonzini@redhat.com>
 R: Bandan Das <bsd@redhat.com>
 R: Stefan Hajnoczi <stefanha@redhat.com>
 R: Thomas Huth <thuth@redhat.com>
-R: Darren Kenny <darren.kenny@oracle.com>=20
+R: Darren Kenny <darren.kenny@oracle.com>
 R: Qiuhao Li <Qiuhao.Li@outlook.com>
 S: Maintained
 F: tests/qtest/fuzz/
@@ -3218,6 +3218,7 @@ S: Maintained
 F: hw/peci/peci-core.c
 F: hw/peci/peci-client.c
 F: include/hw/peci/peci.h
+F: hw/peci/npcm7xx_peci.c
=20
 Firmware schema specifications
 M: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 15fa79afd3..cb38c6c88f 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -408,6 +408,7 @@ config NPCM7XX
     select SSI
     select UNIMP
     select PCA954X
+    select PECI
=20
 config FSL_IMX25
     bool
diff --git a/hw/arm/npcm7xx.c b/hw/arm/npcm7xx.c
index d85cc02765..d408dd7eb4 100644
--- a/hw/arm/npcm7xx.c
+++ b/hw/arm/npcm7xx.c
@@ -45,6 +45,7 @@
 #define NPCM7XX_CLK_BA          (0xf0801000)
 #define NPCM7XX_MC_BA           (0xf0824000)
 #define NPCM7XX_RNG_BA          (0xf000b000)
+#define NPCM7XX_PECI_BA         (0xf0100000)
=20
 /* USB Host modules */
 #define NPCM7XX_EHCI_BA         (0xf0806000)
@@ -83,6 +84,7 @@ enum NPCM7xxInterrupt {
     NPCM7XX_UART1_IRQ,
     NPCM7XX_UART2_IRQ,
     NPCM7XX_UART3_IRQ,
+    NPCM7XX_PECI_IRQ            =3D 6,
     NPCM7XX_EMC1RX_IRQ          =3D 15,
     NPCM7XX_EMC1TX_IRQ,
     NPCM7XX_MMC_IRQ             =3D 26,
@@ -445,6 +447,7 @@ static void npcm7xx_init(Object *obj)
     }
=20
     object_initialize_child(obj, "mmc", &s->mmc, TYPE_NPCM7XX_SDHCI);
+    object_initialize_child(obj, "peci", &s->peci, TYPE_NPCM7XX_PECI);
 }
=20
 static void npcm7xx_realize(DeviceState *dev, Error **errp)
@@ -715,6 +718,12 @@ static void npcm7xx_realize(DeviceState *dev, Error **=
errp)
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->mmc), 0,
             npcm7xx_irq(s, NPCM7XX_MMC_IRQ));
=20
+     /* PECI */
+    sysbus_realize(SYS_BUS_DEVICE(&s->peci), &error_abort);
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->peci), 0, NPCM7XX_PECI_BA);
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->peci), 0,
+                       npcm7xx_irq(s, NPCM7XX_PECI_IRQ));
+
     create_unimplemented_device("npcm7xx.shm",          0xc0001000,   4 * =
KiB);
     create_unimplemented_device("npcm7xx.vdmx",         0xe0800000,   4 * =
KiB);
     create_unimplemented_device("npcm7xx.pcierc",       0xe1000000,  64 * =
KiB);
diff --git a/hw/peci/meson.build b/hw/peci/meson.build
index 01cfa95abe..ee033eb915 100644
--- a/hw/peci/meson.build
+++ b/hw/peci/meson.build
@@ -1 +1,2 @@
 softmmu_ss.add(when: 'CONFIG_PECI', if_true: files('peci-core.c', 'peci-cl=
ient.c'))
+softmmu_ss.add(when: 'CONFIG_NPCM7XX', if_true: files('npcm7xx_peci.c'))
diff --git a/hw/peci/npcm7xx_peci.c b/hw/peci/npcm7xx_peci.c
new file mode 100644
index 0000000000..17a2642898
--- /dev/null
+++ b/hw/peci/npcm7xx_peci.c
@@ -0,0 +1,204 @@
+/*
+ * Nuvoton NPCM7xx PECI Module
+ *
+ * Copyright 2021 Google LLC
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "hw/peci/npcm7xx_peci.h"
+#include "qemu/bitops.h"
+#include "qemu/log.h"
+#include "qemu/units.h"
+#include "trace.h"
+
+#define PECI_CTL_STS            0
+#define     PECI_CTL_STS_DONE_EN      BIT(6)
+#define     PECI_CTL_STS_ABRT_ERR     BIT(4)
+#define     PECI_CTL_STS_CRC_ERR      BIT(3)
+#define     PECI_CTL_STS_DONE         BIT(1)
+#define     PECI_CTL_STS_START_BUSY   BIT(0)
+#define PECI_RD_LENGTH          0x4
+#define PECI_ADDR               0x8
+#define PECI_CMD                0xC
+#define PECI_CTL2               0x10
+#define PECI_WR_LENGTH          0x1C
+#define PECI_PDDR               0x2C
+#define PECI_DAT_INOUT(reg)    (0x100 + (reg) * 4)
+
+static uint64_t npcm7xx_peci_read(void *opaque, hwaddr offset, unsigned si=
ze)
+{
+    NPCM7xxPECIState *ps =3D NPCM7XX_PECI(opaque);
+    uint8_t ret =3D 0;
+
+    if (!ps->bus->num_clients) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: no peci clients added to board=
\n",
+                      __func__);
+        return 0;
+    }
+
+    qemu_irq_lower(ps->irq);
+
+    switch (offset) {
+    case PECI_CTL_STS:
+        ret =3D ps->status;
+        break;
+
+    case PECI_RD_LENGTH:
+        ret =3D ps->pcmd.rd_length;
+        break;
+
+    case PECI_ADDR:
+        ret =3D ps->pcmd.addr;
+        break;
+
+    case PECI_CMD:
+        ret =3D ps->pcmd.cmd;
+        break;
+
+    case PECI_CTL2:
+        ret =3D ps->ctl2;
+        break;
+
+    case PECI_WR_LENGTH:
+        ret =3D ps->pcmd.wr_length;
+        break;
+
+    case PECI_PDDR:
+        qemu_log_mask(LOG_UNIMP, "%s: PECI PDDR is unimplemented.\n", __fu=
nc__);
+        ret =3D ps->pddr;  /* undoc register */
+        break;
+
+    case PECI_DAT_INOUT(0) ... PECI_DAT_INOUT(63):
+        ret =3D ps->pcmd.tx[(offset - PECI_DAT_INOUT(0)) / 4];
+        break;
+
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: unknown register 0x%lx\n",
+                      __func__, offset);
+        ret =3D 0xff;
+        break;
+    }
+    trace_npcm7xx_peci_read(offset, ret);
+    return ret;
+}
+
+static void npcm7xx_peci_write(void *opaque, hwaddr offset, uint64_t input=
,
+                               unsigned size)
+{
+    NPCM7xxPECIState *ps =3D NPCM7XX_PECI(opaque);
+    uint8_t data =3D input & 0xff;
+
+    trace_npcm7xx_peci_write(offset, input);
+
+    /* ignore writes if the bus has not been populated */
+    if (!ps->bus->num_clients) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: no peci clients added to board=
\n",
+                      __func__);
+        return;
+    }
+
+    switch (offset) {
+    case PECI_CTL_STS:
+        ps->status =3D data;
+        /* STS_START busy is set by the bmc when the request is written */
+        if (data & PECI_CTL_STS_START_BUSY) {
+            if (!peci_handle_cmd(ps->bus, &(ps->pcmd))) {
+                ps->status |=3D PECI_CTL_STS_ABRT_ERR;
+            }
+            ps->status |=3D PECI_CTL_STS_DONE;
+            ps->status &=3D ~PECI_CTL_STS_START_BUSY;
+            qemu_irq_raise(ps->irq);
+        }
+        break;
+
+    case PECI_RD_LENGTH:
+        ps->pcmd.rd_length =3D data;
+        break;
+
+    case PECI_ADDR:
+        ps->pcmd.addr =3D data;
+        break;
+
+    case PECI_CMD:
+        ps->pcmd.cmd =3D data;
+        break;
+
+    case PECI_CTL2:
+        ps->ctl2 =3D data;
+        break;
+
+    case PECI_WR_LENGTH:
+        ps->pcmd.wr_length =3D data;
+        break;
+
+    case PECI_PDDR:
+        ps->pddr =3D data;
+        break;
+
+    case PECI_DAT_INOUT(0) ... PECI_DAT_INOUT(63):
+        ps->pcmd.rx[(offset - PECI_DAT_INOUT(0)) / 4] =3D data;
+        break;
+
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: to unknown register 0x%lx : 0x%lx\n",
+                      __func__, offset, input);
+        return;
+    }
+
+}
+
+static void npcm7xx_peci_reset(Object *obj, ResetType type)
+{
+    NPCM7xxPECIState *ps =3D NPCM7XX_PECI(obj);
+
+    ps->status =3D PECI_CTL_STS_DONE_EN;
+}
+
+static const MemoryRegionOps npcm7xx_peci_ops =3D {
+    .read =3D npcm7xx_peci_read,
+    .write =3D npcm7xx_peci_write,
+    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .valid =3D {
+        .min_access_size =3D 1,
+        .min_access_size =3D 1,
+        .unaligned =3D false,
+    },
+};
+
+static void npcm7xx_peci_realize(DeviceState *dev, Error **errp)
+{
+    NPCM7xxPECIState *ps =3D NPCM7XX_PECI(dev);
+    SysBusDevice *sbd =3D &ps->parent;
+
+    memory_region_init_io(&ps->iomem, OBJECT(ps), &npcm7xx_peci_ops, ps,
+                          TYPE_NPCM7XX_PECI, 4 * KiB);
+
+    sysbus_init_mmio(sbd, &ps->iomem);
+    sysbus_init_irq(sbd, &ps->irq);
+
+    ps->bus =3D peci_bus_create(DEVICE(ps));
+}
+
+static void npcm7xx_peci_class_init(ObjectClass *klass, void *data)
+{
+    ResettableClass *rc =3D RESETTABLE_CLASS(klass);
+    DeviceClass *dc =3D DEVICE_CLASS(klass);
+
+    dc->desc =3D "NPCM7xx PECI Module";
+    dc->realize =3D npcm7xx_peci_realize;
+    rc->phases.enter =3D npcm7xx_peci_reset;
+}
+
+static const TypeInfo npcm7xx_peci_types[] =3D {
+    {
+        .name =3D TYPE_NPCM7XX_PECI,
+        .parent =3D TYPE_SYS_BUS_DEVICE,
+        .instance_size =3D sizeof(NPCM7xxPECIState),
+        .class_init =3D npcm7xx_peci_class_init,
+    },
+};
+
+DEFINE_TYPES(npcm7xx_peci_types)
diff --git a/hw/peci/trace-events b/hw/peci/trace-events
index f90c998dd9..a895b21f7b 100644
--- a/hw/peci/trace-events
+++ b/hw/peci/trace-events
@@ -3,3 +3,8 @@
 # peci-core.c
 peci_handle_cmd(const char* s, uint8_t addr) "%s @ 0x%02" PRIx8
 peci_rd_pkg_cfg(const char* s) "%s"
+
+# npcm7xx_peci.c
+npcm7xx_peci_cmd(uint64_t cmd) "cmd: 0x%04" PRIx64
+npcm7xx_peci_read(uint64_t offset, uint64_t value) "offset: 0x%04" PRIx64 =
" value: 0x%08" PRIx64
+npcm7xx_peci_write(uint64_t offset, uint64_t value) "offset: 0x%04" PRIx64=
 " value: 0x%08" PRIx64
diff --git a/include/hw/arm/npcm7xx.h b/include/hw/arm/npcm7xx.h
index ce593235d9..9e7cf8b774 100644
--- a/include/hw/arm/npcm7xx.h
+++ b/include/hw/arm/npcm7xx.h
@@ -30,6 +30,7 @@
 #include "hw/misc/npcm7xx_rng.h"
 #include "hw/net/npcm7xx_emc.h"
 #include "hw/nvram/npcm7xx_otp.h"
+#include "hw/peci/npcm7xx_peci.h"
 #include "hw/timer/npcm7xx_timer.h"
 #include "hw/ssi/npcm7xx_fiu.h"
 #include "hw/usb/hcd-ehci.h"
@@ -105,6 +106,7 @@ typedef struct NPCM7xxState {
     NPCM7xxFIUState     fiu[2];
     NPCM7xxEMCState     emc[2];
     NPCM7xxSDHCIState   mmc;
+    NPCM7xxPECIState    peci;
 } NPCM7xxState;
=20
 #define TYPE_NPCM7XX    "npcm7xx"
diff --git a/include/hw/peci/npcm7xx_peci.h b/include/hw/peci/npcm7xx_peci.=
h
new file mode 100644
index 0000000000..421f445041
--- /dev/null
+++ b/include/hw/peci/npcm7xx_peci.h
@@ -0,0 +1,37 @@
+/*
+ * Nuvoton NPCM7xx PECI Module
+ *
+ * Copyright 2021 Google LLC
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#ifndef NPCM7XX_PECI_H
+#define NPCM7XX_PECI_H
+
+#include "exec/memory.h"
+#include "hw/irq.h"
+#include "hw/peci/peci.h"
+#include "hw/sysbus.h"
+
+typedef struct NPCM7xxPECIState {
+    SysBusDevice parent;
+
+    MemoryRegion iomem;
+
+    PECIBus      *bus;
+    qemu_irq      irq;
+
+    PECICmd       pcmd;
+
+    /* Registers */
+    uint8_t       status;
+    uint8_t       ctl2;
+    uint8_t       pddr;
+} NPCM7xxPECIState;
+
+#define TYPE_NPCM7XX_PECI "npcm7xx-peci"
+#define NPCM7XX_PECI(obj)                                               \
+    OBJECT_CHECK(NPCM7xxPECIState, (obj), TYPE_NPCM7XX_PECI)
+
+#endif /* NPCM7XX_PECI_H */
--=20
2.37.2.789.g6183377224-goog


