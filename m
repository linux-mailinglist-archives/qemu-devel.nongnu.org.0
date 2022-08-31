Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFB185A86EC
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Aug 2022 21:44:28 +0200 (CEST)
Received: from localhost ([::1]:36470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTTdT-0002iu-Ka
	for lists+qemu-devel@lfdr.de; Wed, 31 Aug 2022 15:44:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oTSpD-0004pn-Ao; Wed, 31 Aug 2022 14:52:31 -0400
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33]:38867)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oTSpB-00086u-EJ; Wed, 31 Aug 2022 14:52:31 -0400
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-11edd61a9edso20214900fac.5; 
 Wed, 31 Aug 2022 11:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=y9GmHJMGr4vNff5eUE2IntYUAKQRt2mVN82WWQOKlAw=;
 b=Dvcfr1JC8zuoiXfCmmH41nUoreUTYSH8yiXBXJoALsuZg+IKh0YtQlQjrBX0KgYoJJ
 z8o9V8Sj/C3ZTnFMkD+pqWBIp3sOEa9k+r0Ozrl5xgA8HvQ/YGoE0Kbr1UPA+LpIHyrc
 /O8Kbyd1Fnp5sHykDXXV33aYkfcwyanyVbS5DIPz0Fx/CLNZnzanH4jXwQDKPEATTAFI
 j6U9yHicLpVsJo0wWuG6szHLuwYyi2UxXzQqlJWcw/I+WITZVeZgYVM1HJekcby7tsSq
 yD7h2BWxi/fWZlPsMv2l/glGTRo58RvJAUYBcwvDL7+r9b4l7zR0SAdJxl5UQ5eV3B3p
 3+Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=y9GmHJMGr4vNff5eUE2IntYUAKQRt2mVN82WWQOKlAw=;
 b=Li8eyRvHpeOYcNvWewTV41ouKeWRqJs5a5pPQY6C5V9MoGCaI9nSH4JcdRttY7czbC
 P0hnCTGTuVkvxkw16aZ3i0S/UZPEt7vsqa6mDcC+7GMqNcEbgCtp46iAJ0ctTHFCcTwI
 nvWkkXD2lsQgXjKSbLM1+3iOxwM9Wj0WYBL52jZagW5YnAwNkEc6IVnPQkEyScl5h+/u
 asUjwi9Qds3MqMkojlaUu0ag1LPr1L5ECXFn0OZaKb65vFm8k/t1emg5oUeDmc+G2qf/
 tEBMpfcwSWda+Gd4qT5l0aOnq7euuQKiQv7nAYSzxCC/40TY9bfkzzeyQD+Siy8xoJxx
 H9gg==
X-Gm-Message-State: ACgBeo3porvslgscGx96KBKKJX9Ky6dgcSlle7Dy7ctTKyBCmfGfQfcQ
 Ur5li6BEjiAeXHeHscpRB4cqBkCIQRk=
X-Google-Smtp-Source: AA6agR53K/1pWS7GpO5LRt6P8sbMt6uQ3Uo3s6Bxa8hHXcgEYfAa6IXsgAmqL1Z0G6OaUrZvU1Y2ug==
X-Received: by 2002:a05:6871:154:b0:11e:33b7:ddf7 with SMTP id
 z20-20020a056871015400b0011e33b7ddf7mr2095400oab.116.1661971948193; 
 Wed, 31 Aug 2022 11:52:28 -0700 (PDT)
Received: from balboa.COMFAST ([177.189.45.98])
 by smtp.gmail.com with ESMTPSA id
 p4-20020a9d4544000000b0061cbd18bd18sm9599927oti.45.2022.08.31.11.52.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Aug 2022 11:52:27 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 37/60] ppc/ppc4xx: Introduce a DCR device model
Date: Wed, 31 Aug 2022 15:50:11 -0300
Message-Id: <20220831185034.23240-38-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220831185034.23240-1-danielhb413@gmail.com>
References: <20220831185034.23240-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::33;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x33.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Cédric Le Goater <clg@kaod.org>

The Device Control Registers (DCR) of on-SoC devices are accessed by
software through the use of the mtdcr and mfdcr instructions. These
are converted in transactions on a side band bus, the DCR bus, which
connects the on-SoC devices to the CPU.

Ideally, we should model these accesses with a DCR namespace and DCR
memory regions but today the DCR handlers are installed in a DCR table
under the CPU. Instead, introduce a little device model wrapper to hold
a CPU link and handle registration of DCR handlers.

The DCR device inherits from SysBus because most of these devices also
have MMIO regions and/or IRQs. Being a SysBusDevice makes things easier
to install the device model in the overall SoC.

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
[balaton: Explicit opaque parameter for dcr callbacks]
Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Message-Id: <9b21bdf55e0a728f093bad299e030d98f302ded0.1660746880.git.balaton@eik.bme.hu>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/ppc4xx_devs.c    | 41 +++++++++++++++++++++++++++++++++++++++++
 include/hw/ppc/ppc4xx.h | 17 +++++++++++++++++
 2 files changed, 58 insertions(+)

diff --git a/hw/ppc/ppc4xx_devs.c b/hw/ppc/ppc4xx_devs.c
index 069b511951..f4d7ae9567 100644
--- a/hw/ppc/ppc4xx_devs.c
+++ b/hw/ppc/ppc4xx_devs.c
@@ -664,3 +664,44 @@ void ppc4xx_mal_init(CPUPPCState *env, uint8_t txcnum, uint8_t rxcnum,
                          mal, &dcr_read_mal, &dcr_write_mal);
     }
 }
+
+/* PPC4xx_DCR_DEVICE */
+
+void ppc4xx_dcr_register(Ppc4xxDcrDeviceState *dev, int dcrn, void *opaque,
+                         dcr_read_cb dcr_read, dcr_write_cb dcr_write)
+{
+    assert(dev->cpu);
+    ppc_dcr_register(&dev->cpu->env, dcrn, opaque, dcr_read, dcr_write);
+}
+
+bool ppc4xx_dcr_realize(Ppc4xxDcrDeviceState *dev, PowerPCCPU *cpu,
+                        Error **errp)
+{
+    object_property_set_link(OBJECT(dev), "cpu", OBJECT(cpu), &error_abort);
+    return sysbus_realize(SYS_BUS_DEVICE(dev), errp);
+}
+
+static Property ppc4xx_dcr_properties[] = {
+    DEFINE_PROP_LINK("cpu", Ppc4xxDcrDeviceState, cpu, TYPE_POWERPC_CPU,
+                     PowerPCCPU *),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void ppc4xx_dcr_class_init(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+
+    device_class_set_props(dc, ppc4xx_dcr_properties);
+}
+
+static const TypeInfo ppc4xx_types[] = {
+    {
+        .name           = TYPE_PPC4xx_DCR_DEVICE,
+        .parent         = TYPE_SYS_BUS_DEVICE,
+        .instance_size  = sizeof(Ppc4xxDcrDeviceState),
+        .class_init     = ppc4xx_dcr_class_init,
+        .abstract       = true,
+    }
+};
+
+DEFINE_TYPES(ppc4xx_types)
diff --git a/include/hw/ppc/ppc4xx.h b/include/hw/ppc/ppc4xx.h
index 591e2421a3..a537a5567b 100644
--- a/include/hw/ppc/ppc4xx.h
+++ b/include/hw/ppc/ppc4xx.h
@@ -27,6 +27,7 @@
 
 #include "hw/ppc/ppc.h"
 #include "exec/memory.h"
+#include "hw/sysbus.h"
 
 void ppc4xx_sdram_banks(MemoryRegion *ram, int nr_banks,
                         MemoryRegion ram_memories[],
@@ -44,4 +45,20 @@ void ppc4xx_mal_init(CPUPPCState *env, uint8_t txcnum, uint8_t rxcnum,
 
 #define TYPE_PPC4xx_PCI_HOST_BRIDGE "ppc4xx-pcihost"
 
+/*
+ * Generic DCR device
+ */
+#define TYPE_PPC4xx_DCR_DEVICE "ppc4xx-dcr-device"
+OBJECT_DECLARE_SIMPLE_TYPE(Ppc4xxDcrDeviceState, PPC4xx_DCR_DEVICE);
+struct Ppc4xxDcrDeviceState {
+    SysBusDevice parent_obj;
+
+    PowerPCCPU *cpu;
+};
+
+void ppc4xx_dcr_register(Ppc4xxDcrDeviceState *dev, int dcrn, void *opaque,
+                         dcr_read_cb dcr_read, dcr_write_cb dcr_write);
+bool ppc4xx_dcr_realize(Ppc4xxDcrDeviceState *dev, PowerPCCPU *cpu,
+                        Error **errp);
+
 #endif /* PPC4XX_H */
-- 
2.37.2


