Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A90FA5A8716
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Aug 2022 21:56:21 +0200 (CEST)
Received: from localhost ([::1]:52368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTToy-0002UA-NS
	for lists+qemu-devel@lfdr.de; Wed, 31 Aug 2022 15:56:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oTSpz-0006N6-3g; Wed, 31 Aug 2022 14:53:19 -0400
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36]:35795)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oTSpx-0008HI-DD; Wed, 31 Aug 2022 14:53:18 -0400
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-1225219ee46so1591733fac.2; 
 Wed, 31 Aug 2022 11:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=ti/+KzbgW1dhqVq6AEsu+WpOv9NfZGH8P/tb5Cf9L20=;
 b=Z/krWxEcs7B/NDU6izTlraZrLlngpwCxhFGrGu8ldYZV8D7uIgYHkprKU3rFwBcweS
 zDPOX01B+KQibL/85me706SRYlC571pc+eact3urYGmmFPBGsvQqji+jh/LezOZi4Txx
 ekPMENT0zwmkYSDx0we7YRQQJOVGhWKMwQHMv1Ls7dpVINemWzhDwdJ1SsPfpqxFxTDA
 BebrYVHQ0XNCss3KhxGiCbgm54onyQkBKYj8o5/x9VsAedW9qRSg4l+Ma6CpmV6SFca2
 grmVYsKbPj7ClFA6vT2gYmEP5RoYJ4MUr1YXKiIVqsQqCqhS5onsIMkvCl3f7tuHCtqT
 QZXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=ti/+KzbgW1dhqVq6AEsu+WpOv9NfZGH8P/tb5Cf9L20=;
 b=6nve1oEQn/php9uHc9SPnxWWPdkfHqEAwmaEx66FpnwbRgaXXrqSVIer+vJGvjQH8D
 AGIlHHb+T95Dzej0sYigP5dmOKc5RXUZaZOCt5fgpNRa6eJmDW7xR6RCClOpB5jir7wv
 2zH5Hfcw/A0m0x4J/MH6R5npv1dxW79y31IceP5NKVNaf3cWomLMTdqUXK5zjlhZACYw
 U9u5faRpxTQDn8R3StGepl6FVwLU3tzJUNU6tI5aiksbFcGFZLrlraop8YdZ2Bsfkeg4
 agk80d/oCgL5PCaV+UNtP+IHlJvlpVeLxcTbBUIgcxR1Vci4s13Y5VJ/4emmKKIGlhri
 TC+g==
X-Gm-Message-State: ACgBeo2ZXpkiQtLcc/YsS5HPHUVG1d4HsRTRySw7nj45DjBvPela4SSB
 kK1BffIqSA4cFyvF/sDN+yiGaxy9SLY=
X-Google-Smtp-Source: AA6agR7tAxY+FTdd90Hr86pfAw6PgffMVLpXQWS/P6sMe8k6X1aZoV9FWRTQwa6j4x2JlSyngb4TFw==
X-Received: by 2002:a05:6870:c18f:b0:11c:abda:ba81 with SMTP id
 h15-20020a056870c18f00b0011cabdaba81mr2266042oad.229.1661971995220; 
 Wed, 31 Aug 2022 11:53:15 -0700 (PDT)
Received: from balboa.COMFAST ([177.189.45.98])
 by smtp.gmail.com with ESMTPSA id
 p4-20020a9d4544000000b0061cbd18bd18sm9599927oti.45.2022.08.31.11.53.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Aug 2022 11:53:14 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 55/60] ppc/ppc405: QOM'ify FPGA
Date: Wed, 31 Aug 2022 15:50:29 -0300
Message-Id: <20220831185034.23240-56-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220831185034.23240-1-danielhb413@gmail.com>
References: <20220831185034.23240-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::36;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x36.google.com
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

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Message-Id: <ed6ff1705dadb46b456e424aa0f0420f1d18d92c.1660746880.git.balaton@eik.bme.hu>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/ppc405_boards.c | 56 +++++++++++++++++++++++++++++-------------
 1 file changed, 39 insertions(+), 17 deletions(-)

diff --git a/hw/ppc/ppc405_boards.c b/hw/ppc/ppc405_boards.c
index 3677793adc..7af0d7feef 100644
--- a/hw/ppc/ppc405_boards.c
+++ b/hw/ppc/ppc405_boards.c
@@ -71,18 +71,23 @@ struct Ppc405MachineState {
  * - NVRAM (0xF0000000)
  * - FPGA  (0xF0300000)
  */
-typedef struct ref405ep_fpga_t ref405ep_fpga_t;
-struct ref405ep_fpga_t {
+
+#define TYPE_REF405EP_FPGA "ref405ep-fpga"
+OBJECT_DECLARE_SIMPLE_TYPE(Ref405epFpgaState, REF405EP_FPGA);
+struct Ref405epFpgaState {
+    SysBusDevice parent_obj;
+
+    MemoryRegion iomem;
+
     uint8_t reg0;
     uint8_t reg1;
 };
 
 static uint64_t ref405ep_fpga_readb(void *opaque, hwaddr addr, unsigned size)
 {
-    ref405ep_fpga_t *fpga;
+    Ref405epFpgaState *fpga = opaque;
     uint32_t ret;
 
-    fpga = opaque;
     switch (addr) {
     case 0x0:
         ret = fpga->reg0;
@@ -101,9 +106,8 @@ static uint64_t ref405ep_fpga_readb(void *opaque, hwaddr addr, unsigned size)
 static void ref405ep_fpga_writeb(void *opaque, hwaddr addr, uint64_t value,
                                  unsigned size)
 {
-    ref405ep_fpga_t *fpga;
+    Ref405epFpgaState *fpga = opaque;
 
-    fpga = opaque;
     switch (addr) {
     case 0x0:
         /* Read only */
@@ -126,27 +130,40 @@ static const MemoryRegionOps ref405ep_fpga_ops = {
     .endianness = DEVICE_BIG_ENDIAN,
 };
 
-static void ref405ep_fpga_reset (void *opaque)
+static void ref405ep_fpga_reset(DeviceState *dev)
 {
-    ref405ep_fpga_t *fpga;
+    Ref405epFpgaState *fpga = REF405EP_FPGA(dev);
 
-    fpga = opaque;
     fpga->reg0 = 0x00;
     fpga->reg1 = 0x0F;
 }
 
-static void ref405ep_fpga_init(MemoryRegion *sysmem, uint32_t base)
+static void ref405ep_fpga_realize(DeviceState *dev, Error **errp)
 {
-    ref405ep_fpga_t *fpga;
-    MemoryRegion *fpga_memory = g_new(MemoryRegion, 1);
+    Ref405epFpgaState *s = REF405EP_FPGA(dev);
 
-    fpga = g_new0(ref405ep_fpga_t, 1);
-    memory_region_init_io(fpga_memory, NULL, &ref405ep_fpga_ops, fpga,
+    memory_region_init_io(&s->iomem, OBJECT(s), &ref405ep_fpga_ops, s,
                           "fpga", 0x00000100);
-    memory_region_add_subregion(sysmem, base, fpga_memory);
-    qemu_register_reset(&ref405ep_fpga_reset, fpga);
+    sysbus_init_mmio(SYS_BUS_DEVICE(s), &s->iomem);
+}
+
+static void ref405ep_fpga_class_init(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+
+    dc->realize = ref405ep_fpga_realize;
+    dc->reset = ref405ep_fpga_reset;
+    /* Reason: only works as part of a ppc405 board */
+    dc->user_creatable = false;
 }
 
+static const TypeInfo ref405ep_fpga_type = {
+    .name = TYPE_REF405EP_FPGA,
+    .parent = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(Ref405epFpgaState),
+    .class_init = ref405ep_fpga_class_init,
+};
+
 /*
  * CPU reset handler when booting directly from a loaded kernel
  */
@@ -331,7 +348,11 @@ static void ref405ep_init(MachineState *machine)
     memory_region_add_subregion(get_system_memory(), PPC405EP_SRAM_BASE, sram);
 
     /* Register FPGA */
-    ref405ep_fpga_init(get_system_memory(), PPC405EP_FPGA_BASE);
+    dev = qdev_new(TYPE_REF405EP_FPGA);
+    object_property_add_child(OBJECT(machine), "fpga", OBJECT(dev));
+    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
+    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, PPC405EP_FPGA_BASE);
+
     /* Register NVRAM */
     dev = qdev_new("sysbus-m48t08");
     qdev_prop_set_int32(dev, "base-year", 1968);
@@ -376,6 +397,7 @@ static void ppc405_machine_init(void)
 {
     type_register_static(&ppc405_machine_type);
     type_register_static(&ref405ep_type);
+    type_register_static(&ref405ep_fpga_type);
 }
 
 type_init(ppc405_machine_init)
-- 
2.37.2


