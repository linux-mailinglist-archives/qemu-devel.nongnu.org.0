Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F0375A86FD
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Aug 2022 21:51:51 +0200 (CEST)
Received: from localhost ([::1]:45168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTTkX-0002Rm-0j
	for lists+qemu-devel@lfdr.de; Wed, 31 Aug 2022 15:51:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oTSpK-00055j-GZ; Wed, 31 Aug 2022 14:52:38 -0400
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329]:41863)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oTSpI-0008BQ-DI; Wed, 31 Aug 2022 14:52:38 -0400
Received: by mail-ot1-x329.google.com with SMTP id
 t8-20020a9d5908000000b0063b41908168so2821919oth.8; 
 Wed, 31 Aug 2022 11:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=ed7q4KB5Q/+ctsyZQoufwnXVYIRD6YSNDf/nJH51sR8=;
 b=W7tzLd0uyevcB2lPpgIsFqkLzDrORrsM2P1hC+xjAgRAVPdFDco9CMWsYA73RI1RkI
 gO/X3ieDvO826vuZH+G9AlanY4PT24JoyyQrExSXcwfnw81xEGtguv09i45u/WH5fz50
 sVYnXHGzA0oGXYItUZZOkiRqzHlkihJdZj2MTfg6x/5mXe2kvDALUOI3NQK/o1vHRoZJ
 MTaV3WQ0mQTcvvVvI64pjqV7I7znGNERtym9anlnpRZqlrUw6KLdmrX+FH8YDduxdO5n
 db+Q0b08mEvUN/cR+zExq5eEbaqYmc7C9fLYdY/P0kipbuI7hPKCDFenpTqityvAkx35
 RQ+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=ed7q4KB5Q/+ctsyZQoufwnXVYIRD6YSNDf/nJH51sR8=;
 b=ZACeXuYZD8GIZxpgmJQrXE9HujKTLToNHVzQVa7jZxGN8u2YacnMfVgav39LkSUach
 jTXcyXuLP4z+GLsIY8VzliWM+tHMjpE6DC7Tj9vhyIxvJe3WO5vXndrwLFCMAfM7Q7oI
 lduiN/VLAo026f/a11ZV+PL6aJPWDiEYSKHUljYXPKVUSQiJlvdZ2pdg5XR4djWompvi
 DJtxtHA9n6TOyYwhp6LjWs3LmX4SVIUvKPmSmI3V+onC6XeSq3KgJIQHKFe0nzZrp00+
 BnzE5jRBwoWsXCM0efJ04fHxFrsWAyDApmH4vv2HoQ+1gLYhXJswvbgdtopLp1ng8DiH
 uULQ==
X-Gm-Message-State: ACgBeo26KwX0NE5swdeEvDlo8Nab4fFMF4EH+JIfX1nni5KSYjDpWbyl
 9+7NMyaxqsvPK7deMkhfCoYCntkunM4=
X-Google-Smtp-Source: AA6agR6VVhFT4G025BXrlFYO/Z5RnwhTbxA73eI6t8ahhIN6hynUpIeBwmfnEfl3505u6M0mQuf8RQ==
X-Received: by 2002:a05:6830:2646:b0:638:b172:92d5 with SMTP id
 f6-20020a056830264600b00638b17292d5mr10532709otu.75.1661971954064; 
 Wed, 31 Aug 2022 11:52:34 -0700 (PDT)
Received: from balboa.COMFAST ([177.189.45.98])
 by smtp.gmail.com with ESMTPSA id
 p4-20020a9d4544000000b0061cbd18bd18sm9599927oti.45.2022.08.31.11.52.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Aug 2022 11:52:33 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 39/60] ppc/ppc405: QOM'ify GPT
Date: Wed, 31 Aug 2022 15:50:13 -0300
Message-Id: <20220831185034.23240-40-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220831185034.23240-1-danielhb413@gmail.com>
References: <20220831185034.23240-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::329;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x329.google.com
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

The GPT controller is currently modeled as a SysBus device with a
unique memory region, a couple of IRQs and a timer.

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
[balaton: ppc4xx_dcr_register changes, add finalize method]
Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Message-Id: <8950ab26e78173f94ba65bc61bcfd0631de1fe61.1660746880.git.balaton@eik.bme.hu>
[danielhb: check if timer != NULL in ppc405_gpt_finalize()]
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/ppc405.h     |  22 ++++++++++
 hw/ppc/ppc405_uc.c  | 102 ++++++++++++++++++++++++--------------------
 hw/ppc/trace-events |   1 -
 3 files changed, 78 insertions(+), 47 deletions(-)

diff --git a/hw/ppc/ppc405.h b/hw/ppc/ppc405.h
index 2ba829988d..bcf55e4f6b 100644
--- a/hw/ppc/ppc405.h
+++ b/hw/ppc/ppc405.h
@@ -63,6 +63,27 @@ struct ppc4xx_bd_info_t {
     uint32_t bi_iic_fast[2];
 };
 
+/* General purpose timers */
+#define TYPE_PPC405_GPT "ppc405-gpt"
+OBJECT_DECLARE_SIMPLE_TYPE(Ppc405GptState, PPC405_GPT);
+struct Ppc405GptState {
+    SysBusDevice parent_obj;
+
+    MemoryRegion iomem;
+
+    int64_t tb_offset;
+    uint32_t tb_freq;
+    QEMUTimer *timer;
+    qemu_irq irqs[5];
+    uint32_t oe;
+    uint32_t ol;
+    uint32_t im;
+    uint32_t is;
+    uint32_t ie;
+    uint32_t comp[5];
+    uint32_t mask[5];
+};
+
 #define TYPE_PPC405_CPC "ppc405-cpc"
 OBJECT_DECLARE_SIMPLE_TYPE(Ppc405CpcState, PPC405_CPC);
 
@@ -114,6 +135,7 @@ struct Ppc405SoCState {
     PowerPCCPU cpu;
     DeviceState *uic;
     Ppc405CpcState cpc;
+    Ppc405GptState gpt;
 };
 
 /* PowerPC 405 core */
diff --git a/hw/ppc/ppc405_uc.c b/hw/ppc/ppc405_uc.c
index ec83c292a5..1994801abe 100644
--- a/hw/ppc/ppc405_uc.c
+++ b/hw/ppc/ppc405_uc.c
@@ -926,34 +926,18 @@ static void ppc405_ocm_init(CPUPPCState *env)
 
 /*****************************************************************************/
 /* General purpose timers */
-typedef struct ppc4xx_gpt_t ppc4xx_gpt_t;
-struct ppc4xx_gpt_t {
-    MemoryRegion iomem;
-    int64_t tb_offset;
-    uint32_t tb_freq;
-    QEMUTimer *timer;
-    qemu_irq irqs[5];
-    uint32_t oe;
-    uint32_t ol;
-    uint32_t im;
-    uint32_t is;
-    uint32_t ie;
-    uint32_t comp[5];
-    uint32_t mask[5];
-};
-
-static int ppc4xx_gpt_compare (ppc4xx_gpt_t *gpt, int n)
+static int ppc4xx_gpt_compare(Ppc405GptState *gpt, int n)
 {
     /* XXX: TODO */
     return 0;
 }
 
-static void ppc4xx_gpt_set_output (ppc4xx_gpt_t *gpt, int n, int level)
+static void ppc4xx_gpt_set_output(Ppc405GptState *gpt, int n, int level)
 {
     /* XXX: TODO */
 }
 
-static void ppc4xx_gpt_set_outputs (ppc4xx_gpt_t *gpt)
+static void ppc4xx_gpt_set_outputs(Ppc405GptState *gpt)
 {
     uint32_t mask;
     int i;
@@ -974,7 +958,7 @@ static void ppc4xx_gpt_set_outputs (ppc4xx_gpt_t *gpt)
     }
 }
 
-static void ppc4xx_gpt_set_irqs (ppc4xx_gpt_t *gpt)
+static void ppc4xx_gpt_set_irqs(Ppc405GptState *gpt)
 {
     uint32_t mask;
     int i;
@@ -989,14 +973,14 @@ static void ppc4xx_gpt_set_irqs (ppc4xx_gpt_t *gpt)
     }
 }
 
-static void ppc4xx_gpt_compute_timer (ppc4xx_gpt_t *gpt)
+static void ppc4xx_gpt_compute_timer(Ppc405GptState *gpt)
 {
     /* XXX: TODO */
 }
 
 static uint64_t ppc4xx_gpt_read(void *opaque, hwaddr addr, unsigned size)
 {
-    ppc4xx_gpt_t *gpt = opaque;
+    Ppc405GptState *gpt = opaque;
     uint32_t ret;
     int idx;
 
@@ -1050,7 +1034,7 @@ static uint64_t ppc4xx_gpt_read(void *opaque, hwaddr addr, unsigned size)
 static void ppc4xx_gpt_write(void *opaque, hwaddr addr, uint64_t value,
                              unsigned size)
 {
-    ppc4xx_gpt_t *gpt = opaque;
+    Ppc405GptState *gpt = opaque;
     int idx;
 
     trace_ppc4xx_gpt_write(addr, size, value);
@@ -1114,22 +1098,20 @@ static const MemoryRegionOps gpt_ops = {
     .endianness = DEVICE_NATIVE_ENDIAN,
 };
 
-static void ppc4xx_gpt_cb (void *opaque)
+static void ppc4xx_gpt_cb(void *opaque)
 {
-    ppc4xx_gpt_t *gpt;
+    Ppc405GptState *gpt = opaque;
 
-    gpt = opaque;
     ppc4xx_gpt_set_irqs(gpt);
     ppc4xx_gpt_set_outputs(gpt);
     ppc4xx_gpt_compute_timer(gpt);
 }
 
-static void ppc4xx_gpt_reset (void *opaque)
+static void ppc405_gpt_reset(DeviceState *dev)
 {
-    ppc4xx_gpt_t *gpt;
+    Ppc405GptState *gpt = PPC405_GPT(dev);
     int i;
 
-    gpt = opaque;
     timer_del(gpt->timer);
     gpt->oe = 0x00000000;
     gpt->ol = 0x00000000;
@@ -1142,21 +1124,37 @@ static void ppc4xx_gpt_reset (void *opaque)
     }
 }
 
-static void ppc4xx_gpt_init(hwaddr base, qemu_irq irqs[5])
+static void ppc405_gpt_realize(DeviceState *dev, Error **errp)
 {
-    ppc4xx_gpt_t *gpt;
+    Ppc405GptState *s = PPC405_GPT(dev);
+    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
     int i;
 
-    trace_ppc4xx_gpt_init(base);
+    s->timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, &ppc4xx_gpt_cb, s);
+    memory_region_init_io(&s->iomem, OBJECT(s), &gpt_ops, s, "gpt", 0xd4);
+    sysbus_init_mmio(sbd, &s->iomem);
 
-    gpt = g_new0(ppc4xx_gpt_t, 1);
-    for (i = 0; i < 5; i++) {
-        gpt->irqs[i] = irqs[i];
+    for (i = 0; i < ARRAY_SIZE(s->irqs); i++) {
+        sysbus_init_irq(sbd, &s->irqs[i]);
+    }
+}
+
+static void ppc405_gpt_finalize(Object *obj)
+{
+    /* timer will be NULL if the GPT wasn't realized */
+    if (PPC405_GPT(obj)->timer) {
+        timer_del(PPC405_GPT(obj)->timer);
     }
-    gpt->timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, &ppc4xx_gpt_cb, gpt);
-    memory_region_init_io(&gpt->iomem, NULL, &gpt_ops, gpt, "gpt", 0x0d4);
-    memory_region_add_subregion(get_system_memory(), base, &gpt->iomem);
-    qemu_register_reset(ppc4xx_gpt_reset, gpt);
+}
+
+static void ppc405_gpt_class_init(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+
+    dc->realize = ppc405_gpt_realize;
+    dc->reset = ppc405_gpt_reset;
+    /* Reason: only works as function of a ppc4xx SoC */
+    dc->user_creatable = false;
 }
 
 /*****************************************************************************/
@@ -1420,6 +1418,8 @@ static void ppc405_soc_instance_init(Object *obj)
 
     object_initialize_child(obj, "cpc", &s->cpc, TYPE_PPC405_CPC);
     object_property_add_alias(obj, "sys-clk", OBJECT(&s->cpc), "sys-clk");
+
+    object_initialize_child(obj, "gpt", &s->gpt, TYPE_PPC405_GPT);
 }
 
 static void ppc405_reset(void *opaque)
@@ -1430,8 +1430,10 @@ static void ppc405_reset(void *opaque)
 static void ppc405_soc_realize(DeviceState *dev, Error **errp)
 {
     Ppc405SoCState *s = PPC405_SOC(dev);
-    qemu_irq dma_irqs[4], gpt_irqs[5], mal_irqs[4];
+    qemu_irq dma_irqs[4], mal_irqs[4];
     CPUPPCState *env;
+    SysBusDevice *sbd;
+    int i;
 
     /* init CPUs */
     if (!qdev_realize(DEVICE(&s->cpu), NULL, errp)) {
@@ -1517,12 +1519,14 @@ static void ppc405_soc_realize(DeviceState *dev, Error **errp)
     ppc405_ocm_init(env);
 
     /* GPT */
-    gpt_irqs[0] = qdev_get_gpio_in(s->uic, 19);
-    gpt_irqs[1] = qdev_get_gpio_in(s->uic, 20);
-    gpt_irqs[2] = qdev_get_gpio_in(s->uic, 21);
-    gpt_irqs[3] = qdev_get_gpio_in(s->uic, 22);
-    gpt_irqs[4] = qdev_get_gpio_in(s->uic, 23);
-    ppc4xx_gpt_init(0xef600000, gpt_irqs);
+    sbd = SYS_BUS_DEVICE(&s->gpt);
+    if (!sysbus_realize(sbd, errp)) {
+        return;
+    }
+    sysbus_mmio_map(sbd, 0, 0xef600000);
+    for (i = 0; i < ARRAY_SIZE(s->gpt.irqs); i++) {
+        sysbus_connect_irq(sbd, i, qdev_get_gpio_in(s->uic, 19 + i));
+    }
 
     /* MAL */
     mal_irqs[0] = qdev_get_gpio_in(s->uic, 11);
@@ -1555,6 +1559,12 @@ static void ppc405_soc_class_init(ObjectClass *oc, void *data)
 
 static const TypeInfo ppc405_types[] = {
     {
+        .name           = TYPE_PPC405_GPT,
+        .parent         = TYPE_SYS_BUS_DEVICE,
+        .instance_size  = sizeof(Ppc405GptState),
+        .instance_finalize = ppc405_gpt_finalize,
+        .class_init     = ppc405_gpt_class_init,
+    }, {
         .name           = TYPE_PPC405_CPC,
         .parent         = TYPE_PPC4xx_DCR_DEVICE,
         .instance_size  = sizeof(Ppc405CpcState),
diff --git a/hw/ppc/trace-events b/hw/ppc/trace-events
index f6990439d1..8d35521bf7 100644
--- a/hw/ppc/trace-events
+++ b/hw/ppc/trace-events
@@ -173,7 +173,6 @@ ocm_unmap(const char* prefix, uint32_t isarc) "OCM unmap %s 0x%08" PRIx32
 
 ppc4xx_gpt_read(uint64_t addr, uint32_t size) "addr 0x%" PRIx64 " size %d"
 ppc4xx_gpt_write(uint64_t addr, uint32_t size, uint64_t val) "addr 0x%" PRIx64 " size %d = 0x%" PRIx64
-ppc4xx_gpt_init(uint64_t addr) "offet 0x%" PRIx64
 
 ppc405ep_clocks_compute(const char *param, uint32_t param2, uint32_t val) "%s 0x%1" PRIx32 " %d"
 ppc405ep_clocks_setup(const char *trace) "%s"
-- 
2.37.2


