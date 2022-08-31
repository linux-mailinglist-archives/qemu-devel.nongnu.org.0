Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FAF65A86FE
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Aug 2022 21:52:00 +0200 (CEST)
Received: from localhost ([::1]:58104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTTkl-00032m-8j
	for lists+qemu-devel@lfdr.de; Wed, 31 Aug 2022 15:51:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oTSpX-0005dE-7t; Wed, 31 Aug 2022 14:52:51 -0400
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f]:34336)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oTSpT-0008DL-Qz; Wed, 31 Aug 2022 14:52:49 -0400
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-11ee4649dfcso19843570fac.1; 
 Wed, 31 Aug 2022 11:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=na++fitvI94h8kcwbpTZPH4P7FXtu7K3bnMzBtcKcmw=;
 b=qBGStXdNC3/UlnGaSeZcJ8VmXdOVq9q5uAJqj4Vyuih5Mrnog8F+sX1HVsgqOtWEtn
 3hJO1iJ1W3NJ9V4Bgm4WJpoT+pkxRbjWWaVy7CCknB9ttvBmT/DD7hu5R+hoDBHYeQ+E
 w0e4hVo+0nttPJmaD+yVMdWtSWkG5/bw6S04xHP4lJ3EMbBSmDrHkuDJUohwSfUcr808
 1z0QSz1PuVfAxA/tOWYyRyxoQdPJDgh2ufZPY4I2W27ovK6O5Cxvq+2gMo+016r6ujvQ
 /v4al2UOaFqUGaKe4KqqhIiqfsGMjGHl9Pvd+PNLPYDjAILODnuVIlUKB7KFehEYuxEj
 oFJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=na++fitvI94h8kcwbpTZPH4P7FXtu7K3bnMzBtcKcmw=;
 b=6uU7zYNOzN3kc9PO8vNJ8dg++J16v3kDUb58IdUDN72xSQpZ1RTmDvgTPaA4UhVOqL
 gKsiUdsFfv+PcJ8ASNmfsdWEoSy1MtDgLPtZZiWfv97alrJHEAGBCd5+zPFzOTJT23dP
 x2yFdN7yv1ATmCg9+ZuiqfnW1AzopZ8Aif0yUXAPfaerasmyGq/v07qvQepb0AXAAfgd
 q7kYC8yYv1jnvqIb2hDso0tz0oAUffz+1JLrZB6zyemXHQYzZKK3hMwTVXd7k26gw+Ta
 6zCk1PCWVvq+NRkDyuWRXg75kLN9UY4hysmiPkU1vTYxm6nik2xsTZxYQcYO9cZxiCWf
 mHbg==
X-Gm-Message-State: ACgBeo0Uqd3a3soy4xPw3fA6bYYZ09fPXVX4ygDoe9TvWp6/IoR8TqHa
 f5k7OOLFNs6Q2uzT1Dxbrw6JDWc2DVo=
X-Google-Smtp-Source: AA6agR7x4AoY8piJ2zRCroSRiqVyVo0b/6VuT5s4dBZjcV/tYLetxwtpbz7l+IPS2FBhC716H5192Q==
X-Received: by 2002:a05:6871:9c:b0:11d:ca1b:dca9 with SMTP id
 u28-20020a056871009c00b0011dca1bdca9mr2101428oaa.123.1661971966268; 
 Wed, 31 Aug 2022 11:52:46 -0700 (PDT)
Received: from balboa.COMFAST ([177.189.45.98])
 by smtp.gmail.com with ESMTPSA id
 p4-20020a9d4544000000b0061cbd18bd18sm9599927oti.45.2022.08.31.11.52.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Aug 2022 11:52:45 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 44/60] ppc/ppc405: QOM'ify OPBA
Date: Wed, 31 Aug 2022 15:50:18 -0300
Message-Id: <20220831185034.23240-45-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220831185034.23240-1-danielhb413@gmail.com>
References: <20220831185034.23240-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2f;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2f.google.com
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

The OPB arbitrer is currently modeled as a simple SysBus device with a
unique memory region.

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
[balaton: ppc4xx_dcr_register changes]
Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Message-Id: <38476bc43d2332db2f09dbede9eff5234d6ce217.1660746880.git.balaton@eik.bme.hu>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/ppc405.h     | 12 +++++++++++
 hw/ppc/ppc405_uc.c  | 49 +++++++++++++++++++++++++++------------------
 hw/ppc/trace-events |  1 -
 3 files changed, 41 insertions(+), 21 deletions(-)

diff --git a/hw/ppc/ppc405.h b/hw/ppc/ppc405.h
index 82bf8dae93..d63c2acdc7 100644
--- a/hw/ppc/ppc405.h
+++ b/hw/ppc/ppc405.h
@@ -63,6 +63,17 @@ struct ppc4xx_bd_info_t {
     uint32_t bi_iic_fast[2];
 };
 
+/* OPB arbitrer */
+#define TYPE_PPC405_OPBA "ppc405-opba"
+OBJECT_DECLARE_SIMPLE_TYPE(Ppc405OpbaState, PPC405_OPBA);
+struct Ppc405OpbaState {
+    SysBusDevice parent_obj;
+
+    MemoryRegion io;
+    uint8_t cr;
+    uint8_t pr;
+};
+
 /* Peripheral controller */
 #define TYPE_PPC405_EBC "ppc405-ebc"
 OBJECT_DECLARE_SIMPLE_TYPE(Ppc405EbcState, PPC405_EBC);
@@ -208,6 +219,7 @@ struct Ppc405SoCState {
     Ppc405GpioState gpio;
     Ppc405DmaState dma;
     Ppc405EbcState ebc;
+    Ppc405OpbaState opba;
 };
 
 /* PowerPC 405 core */
diff --git a/hw/ppc/ppc405_uc.c b/hw/ppc/ppc405_uc.c
index ff81fb3e20..2c482bc25c 100644
--- a/hw/ppc/ppc405_uc.c
+++ b/hw/ppc/ppc405_uc.c
@@ -310,16 +310,9 @@ static void ppc4xx_pob_init(CPUPPCState *env)
 
 /*****************************************************************************/
 /* OPB arbitrer */
-typedef struct ppc4xx_opba_t ppc4xx_opba_t;
-struct ppc4xx_opba_t {
-    MemoryRegion io;
-    uint8_t cr;
-    uint8_t pr;
-};
-
 static uint64_t opba_readb(void *opaque, hwaddr addr, unsigned size)
 {
-    ppc4xx_opba_t *opba = opaque;
+    Ppc405OpbaState *opba = opaque;
     uint32_t ret;
 
     switch (addr) {
@@ -341,7 +334,7 @@ static uint64_t opba_readb(void *opaque, hwaddr addr, unsigned size)
 static void opba_writeb(void *opaque, hwaddr addr, uint64_t value,
                         unsigned size)
 {
-    ppc4xx_opba_t *opba = opaque;
+    Ppc405OpbaState *opba = opaque;
 
     trace_opba_writeb(addr, value);
 
@@ -366,25 +359,30 @@ static const MemoryRegionOps opba_ops = {
     .endianness = DEVICE_BIG_ENDIAN,
 };
 
-static void ppc4xx_opba_reset (void *opaque)
+static void ppc405_opba_reset(DeviceState *dev)
 {
-    ppc4xx_opba_t *opba;
+    Ppc405OpbaState *opba = PPC405_OPBA(dev);
 
-    opba = opaque;
     opba->cr = 0x00; /* No dynamic priorities - park disabled */
     opba->pr = 0x11;
 }
 
-static void ppc4xx_opba_init(hwaddr base)
+static void ppc405_opba_realize(DeviceState *dev, Error **errp)
 {
-    ppc4xx_opba_t *opba;
+    Ppc405OpbaState *s = PPC405_OPBA(dev);
+
+    memory_region_init_io(&s->io, OBJECT(s), &opba_ops, s, "opba", 2);
+    sysbus_init_mmio(SYS_BUS_DEVICE(s), &s->io);
+}
 
-    trace_opba_init(base);
+static void ppc405_opba_class_init(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
 
-    opba = g_new0(ppc4xx_opba_t, 1);
-    memory_region_init_io(&opba->io, NULL, &opba_ops, opba, "opba", 0x002);
-    memory_region_add_subregion(get_system_memory(), base, &opba->io);
-    qemu_register_reset(ppc4xx_opba_reset, opba);
+    dc->realize = ppc405_opba_realize;
+    dc->reset = ppc405_opba_reset;
+    /* Reason: only works as function of a ppc4xx SoC */
+    dc->user_creatable = false;
 }
 
 /*****************************************************************************/
@@ -1373,6 +1371,8 @@ static void ppc405_soc_instance_init(Object *obj)
     object_initialize_child(obj, "dma", &s->dma, TYPE_PPC405_DMA);
 
     object_initialize_child(obj, "ebc", &s->ebc, TYPE_PPC405_EBC);
+
+    object_initialize_child(obj, "opba", &s->opba, TYPE_PPC405_OPBA);
 }
 
 static void ppc405_reset(void *opaque)
@@ -1410,7 +1410,11 @@ static void ppc405_soc_realize(DeviceState *dev, Error **errp)
     ppc4xx_pob_init(env);
 
     /* OBP arbitrer */
-    ppc4xx_opba_init(0xef600600);
+    sbd = SYS_BUS_DEVICE(&s->opba);
+    if (!sysbus_realize(sbd, errp)) {
+        return;
+    }
+    sysbus_mmio_map(sbd, 0, 0xef600600);
 
     /* Universal interrupt controller */
     s->uic = qdev_new(TYPE_PPC_UIC);
@@ -1523,6 +1527,11 @@ static void ppc405_soc_class_init(ObjectClass *oc, void *data)
 
 static const TypeInfo ppc405_types[] = {
     {
+        .name           = TYPE_PPC405_OPBA,
+        .parent         = TYPE_SYS_BUS_DEVICE,
+        .instance_size  = sizeof(Ppc405OpbaState),
+        .class_init     = ppc405_opba_class_init,
+    }, {
         .name           = TYPE_PPC405_EBC,
         .parent         = TYPE_PPC4xx_DCR_DEVICE,
         .instance_size  = sizeof(Ppc405EbcState),
diff --git a/hw/ppc/trace-events b/hw/ppc/trace-events
index 69a95f9f57..a07d5aca0f 100644
--- a/hw/ppc/trace-events
+++ b/hw/ppc/trace-events
@@ -161,7 +161,6 @@ ppc440_pcix_reg_write(uint64_t addr, uint32_t val, uint32_t size) "addr 0x%" PRI
 # ppc405_boards.c
 opba_readb(uint64_t addr, uint32_t val) "addr 0x%" PRIx64 " = 0x%" PRIx32
 opba_writeb(uint64_t addr, uint64_t val) "addr 0x%" PRIx64 " = 0x%" PRIx64
-opba_init(uint64_t addr) "offet 0x%" PRIx64
 
 ppc405_gpio_read(uint64_t addr, uint32_t size) "addr 0x%" PRIx64 " size %d"
 ppc405_gpio_write(uint64_t addr, uint32_t size, uint64_t val) "addr 0x%" PRIx64 " size %d = 0x%" PRIx64
-- 
2.37.2


