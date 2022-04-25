Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6FB850DBCC
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 10:57:38 +0200 (CEST)
Received: from localhost ([::1]:60150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1niuXJ-00048Y-Uo
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 04:57:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mkletzan@redhat.com>)
 id 1niu0B-0006aF-Db
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 04:23:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mkletzan@redhat.com>)
 id 1niu04-0002h9-Jr
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 04:23:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650874995;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oyMfkcUILkmpK1r/qqI5Brm2uf6KpBJ8gcX2dxLTNQQ=;
 b=XpKMl5VjfeBMX7Idi7sw8JpiEdekYiue7fHf1nfBrlgsELeEM6SdFsHOlBAfRoVWlAUb2k
 Sz/ktDaIqN3UH06dgr+woUYULSa01bU3tpS5uQFjuGoZlb30PF4UjMa7+SEMt4szkH4vI6
 IWNcueDA11BDj52FeadD2ilKepVE8T0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-613-WnaiqzQPO-KTKV8yZNXCsg-1; Mon, 25 Apr 2022 04:22:07 -0400
X-MC-Unique: WnaiqzQPO-KTKV8yZNXCsg-1
Received: by mail-wm1-f72.google.com with SMTP id
 g13-20020a1c4e0d000000b0038eba16aa46so6862127wmh.7
 for <qemu-devel@nongnu.org>; Mon, 25 Apr 2022 01:22:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oyMfkcUILkmpK1r/qqI5Brm2uf6KpBJ8gcX2dxLTNQQ=;
 b=SMS6iBFtWoIAzjMCy4bE8HPu+hxWHCQL7tYfVCraUUFaSoOGm/HoTIRtxE/E+OXQzW
 19ZrT3LpEMdeHAbBU+gy4u7rCE4/WvY7Y/eCaX/Oct5N5FZnDy1iTzFoQDpK/aW6Krh6
 MRdTGeNVC7Gv94tEZpUr0iKFSdlyvzVB44fYuRcPtKoOivouJvrz1GRaKMCwrN+N1SMT
 PgRY1pzDw6T8gvNgL7ftTqBeg22lx8x9o9F05GzhhDeXDa8/PZlitzQWkOpbXRzcXUeH
 H7F35gZrlwgresDBo4dMe71stMuFrglEZVRoZQT3XSuEJUS8LB6d5SevAOiL1C4A0d9M
 7ILA==
X-Gm-Message-State: AOAM5329biz3Hersa2xKEDpTVN5IEKq+IJsjqWfwLi7qOmhBxfymSHuo
 EiF1PZRQjGb5/6ZNWkAESnSIojA1h9d3fewGv/+Sd5F/lt65RMO15SiZF25ShQMiFSMoLMFV1p+
 yeP5NZPk2CuAV2dY=
X-Received: by 2002:a05:600c:1f0f:b0:38e:c9c8:9983 with SMTP id
 bd15-20020a05600c1f0f00b0038ec9c89983mr15260376wmb.105.1650874925592; 
 Mon, 25 Apr 2022 01:22:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxfD48BjcAECR06YOf9cPKRyTCroqPF2jgrk5q5uvbVqvWjFeT6iIsEtGTyaM6j9J+f1w4xow==
X-Received: by 2002:a05:600c:1f0f:b0:38e:c9c8:9983 with SMTP id
 bd15-20020a05600c1f0f00b0038ec9c89983mr15260357wmb.105.1650874925311; 
 Mon, 25 Apr 2022 01:22:05 -0700 (PDT)
Received: from wheatley.localdomain (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 f14-20020a0560001a8e00b0020aaf034e59sm10200944wry.90.2022.04.25.01.22.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Apr 2022 01:22:04 -0700 (PDT)
Received: from wheatley.redhat.com (wheatley.k8r.cz [127.0.0.1])
 by wheatley.localdomain (Postfix) with ESMTP id 5B24167B1B60;
 Mon, 25 Apr 2022 10:22:02 +0200 (CEST)
From: Martin Kletzander <mkletzan@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 11/18] hw/arm: Support machine-default audiodev with fallback
Date: Mon, 25 Apr 2022 10:21:54 +0200
Message-Id: <da4269019511c1835050399996e851a87434145e.1650874791.git.mkletzan@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1650874791.git.mkletzan@redhat.com>
References: <cover.1650874791.git.mkletzan@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mkletzan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, libvir-list@redhat.com,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Yanan Wang <wangyanan55@huawei.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, Alexander Bulekov <alxndr@bu.edu>,
 Bandan Das <bsd@redhat.com>, qemu-arm@nongnu.org,
 Jan Kiszka <jan.kiszka@web.de>, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, Thomas Huth <huth@tuxfamily.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Martin Kletzander <mkletzan@redhat.com>
---
 hw/arm/integratorcp.c |  8 +++++++-
 hw/arm/musicpal.c     |  8 +++++++-
 hw/arm/omap2.c        |  8 ++++++++
 hw/arm/realview.c     |  3 +++
 hw/arm/spitz.c        | 10 +++++++---
 hw/arm/versatilepb.c  |  3 +++
 hw/arm/vexpress.c     |  3 +++
 hw/arm/xlnx-zcu102.c  |  4 ++++
 hw/arm/z2.c           | 12 +++++++++++-
 9 files changed, 53 insertions(+), 6 deletions(-)

diff --git a/hw/arm/integratorcp.c b/hw/arm/integratorcp.c
index b109ece3ae02..0a6d4186dad6 100644
--- a/hw/arm/integratorcp.c
+++ b/hw/arm/integratorcp.c
@@ -27,6 +27,7 @@
 #include "hw/irq.h"
 #include "hw/sd/sd.h"
 #include "qom/object.h"
+#include "audio/audio.h"
 
 #define TYPE_INTEGRATOR_CM "integrator_core"
 OBJECT_DECLARE_SIMPLE_TYPE(IntegratorCMState, INTEGRATOR_CM)
@@ -660,7 +661,12 @@ static void integratorcp_init(MachineState *machine)
                                &error_fatal);
     }
 
-    sysbus_create_varargs("pl041", 0x1d000000, pic[25], NULL);
+    dev = qdev_new("pl041");
+    qdev_prop_set_string(dev, "audiodev",
+                         audio_maybe_init_dummy("integrator.defaudio"));
+    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
+    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, 0x1d000000);
+    sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, pic[25]);
 
     if (nd_table[0].used)
         smc91c111_init(&nd_table[0], 0xc8000000, pic[27]);
diff --git a/hw/arm/musicpal.c b/hw/arm/musicpal.c
index 7c840fb4283e..5d53ed3a8709 100644
--- a/hw/arm/musicpal.c
+++ b/hw/arm/musicpal.c
@@ -35,6 +35,7 @@
 #include "qemu/cutils.h"
 #include "qom/object.h"
 #include "hw/net/mv88w8618_eth.h"
+#include "audio/audio.h"
 
 #define MP_MISC_BASE            0x80002000
 #define MP_MISC_SIZE            0x00001000
@@ -1324,7 +1325,12 @@ static void musicpal_init(MachineState *machine)
         qdev_connect_gpio_out(key_dev, i, qdev_get_gpio_in(dev, i + 15));
     }
 
-    wm8750_dev = i2c_slave_create_simple(i2c, TYPE_WM8750, MP_WM_ADDR);
+    wm8750_dev = i2c_slave_new(TYPE_WM8750, MP_WM_ADDR);
+
+    qdev_prop_set_string(DEVICE(wm8750_dev), "audiodev",
+                         audio_maybe_init_dummy("musicpal.defaudio"));
+    i2c_slave_realize_and_unref(wm8750_dev, i2c, &error_abort);
+
     dev = qdev_new(TYPE_MV88W8618_AUDIO);
     s = SYS_BUS_DEVICE(dev);
     object_property_set_link(OBJECT(dev), "wm8750", OBJECT(wm8750_dev),
diff --git a/hw/arm/omap2.c b/hw/arm/omap2.c
index 02b1aa8c974b..4ae524a1a1a6 100644
--- a/hw/arm/omap2.c
+++ b/hw/arm/omap2.c
@@ -604,12 +604,20 @@ static struct omap_eac_s *omap_eac_init(struct omap_target_agent_s *ta,
                 qemu_irq irq, qemu_irq *drq, omap_clk fclk, omap_clk iclk)
 {
     struct omap_eac_s *s = g_new0(struct omap_eac_s, 1);
+    const char *audiodev_id = audio_maybe_init_dummy("eac.defaudio");
 
     s->irq = irq;
     s->codec.rxdrq = *drq ++;
     s->codec.txdrq = *drq;
     omap_eac_reset(s);
 
+    s->codec.card.name = g_strdup(audiodev_id);
+    s->codec.card.state = audio_state_by_name(s->codec.card.name);
+    if (!s->codec.card.state) {
+        error_setg(&error_fatal, "Cannot find audiodev with id '%s'",
+                   s->codec.card.name);
+    }
+
     AUD_register_card("OMAP EAC", &s->codec.card);
 
     memory_region_init_io(&s->iomem, NULL, &omap_eac_ops, s, "omap.eac",
diff --git a/hw/arm/realview.c b/hw/arm/realview.c
index d2dc8a895258..4fcdd821789a 100644
--- a/hw/arm/realview.c
+++ b/hw/arm/realview.c
@@ -29,6 +29,7 @@
 #include "hw/irq.h"
 #include "hw/i2c/arm_sbcon_i2c.h"
 #include "hw/sd/sd.h"
+#include "audio/audio.h"
 
 #define SMP_BOOT_ADDR 0xe0000000
 #define SMP_BOOTREG_ADDR 0x10000030
@@ -207,6 +208,8 @@ static void realview_init(MachineState *machine,
 
     pl041 = qdev_new("pl041");
     qdev_prop_set_uint32(pl041, "nc_fifo_depth", 512);
+    qdev_prop_set_string(pl041, "audiodev",
+                         audio_maybe_init_dummy("realview.defaudio"));
     sysbus_realize_and_unref(SYS_BUS_DEVICE(pl041), &error_fatal);
     sysbus_mmio_map(SYS_BUS_DEVICE(pl041), 0, 0x10004000);
     sysbus_connect_irq(SYS_BUS_DEVICE(pl041), 0, pic[19]);
diff --git a/hw/arm/spitz.c b/hw/arm/spitz.c
index 5aab0b856574..94fff2f460ca 100644
--- a/hw/arm/spitz.c
+++ b/hw/arm/spitz.c
@@ -35,6 +35,7 @@
 #include "exec/address-spaces.h"
 #include "cpu.h"
 #include "qom/object.h"
+#include "audio/audio.h"
 
 enum spitz_model_e { spitz, akita, borzoi, terrier };
 
@@ -779,10 +780,13 @@ static void spitz_i2c_setup(PXA2xxState *cpu)
     /* Attach the CPU on one end of our I2C bus.  */
     I2CBus *bus = pxa2xx_i2c_bus(cpu->i2c[0]);
 
-    DeviceState *wm;
-
     /* Attach a WM8750 to the bus */
-    wm = DEVICE(i2c_slave_create_simple(bus, TYPE_WM8750, 0));
+    I2CSlave *i2c_dev = i2c_slave_new(TYPE_WM8750, 0);
+    DeviceState *wm = DEVICE(i2c_dev);
+
+    qdev_prop_set_string(wm, "audiodev",
+                         audio_maybe_init_dummy("spitz.defaudio"));
+    i2c_slave_realize_and_unref(i2c_dev, bus, &error_abort);
 
     spitz_wm8750_addr(wm, 0, 0);
     qdev_connect_gpio_out(cpu->gpio, SPITZ_GPIO_WM,
diff --git a/hw/arm/versatilepb.c b/hw/arm/versatilepb.c
index ecc1f6cf74ff..e068f592b134 100644
--- a/hw/arm/versatilepb.c
+++ b/hw/arm/versatilepb.c
@@ -26,6 +26,7 @@
 #include "hw/char/pl011.h"
 #include "hw/sd/sd.h"
 #include "qom/object.h"
+#include "audio/audio.h"
 
 #define VERSATILE_FLASH_ADDR 0x34000000
 #define VERSATILE_FLASH_SIZE (64 * 1024 * 1024)
@@ -343,6 +344,8 @@ static void versatile_init(MachineState *machine, int board_id)
     /* Add PL041 AACI Interface to the LM4549 codec */
     pl041 = qdev_new("pl041");
     qdev_prop_set_uint32(pl041, "nc_fifo_depth", 512);
+    qdev_prop_set_string(pl041, "audiodev",
+                         audio_maybe_init_dummy("versatilepb.defaudio"));
     sysbus_realize_and_unref(SYS_BUS_DEVICE(pl041), &error_fatal);
     sysbus_mmio_map(SYS_BUS_DEVICE(pl041), 0, 0x10004000);
     sysbus_connect_irq(SYS_BUS_DEVICE(pl041), 0, sic[24]);
diff --git a/hw/arm/vexpress.c b/hw/arm/vexpress.c
index e1d1983ae657..f312a4d5315e 100644
--- a/hw/arm/vexpress.c
+++ b/hw/arm/vexpress.c
@@ -44,6 +44,7 @@
 #include "hw/i2c/arm_sbcon_i2c.h"
 #include "hw/sd/sd.h"
 #include "qom/object.h"
+#include "audio/audio.h"
 
 #define VEXPRESS_BOARD_ID 0x8e0
 #define VEXPRESS_FLASH_SIZE (64 * 1024 * 1024)
@@ -614,6 +615,8 @@ static void vexpress_common_init(MachineState *machine)
 
     pl041 = qdev_new("pl041");
     qdev_prop_set_uint32(pl041, "nc_fifo_depth", 512);
+    qdev_prop_set_string(pl041, "audiodev",
+                         audio_maybe_init_dummy("vexpress.defaudio"));
     sysbus_realize_and_unref(SYS_BUS_DEVICE(pl041), &error_fatal);
     sysbus_mmio_map(SYS_BUS_DEVICE(pl041), 0, map[VE_PL041]);
     sysbus_connect_irq(SYS_BUS_DEVICE(pl041), 0, pic[11]);
diff --git a/hw/arm/xlnx-zcu102.c b/hw/arm/xlnx-zcu102.c
index 4c84bb932aa0..e4c32e158b61 100644
--- a/hw/arm/xlnx-zcu102.c
+++ b/hw/arm/xlnx-zcu102.c
@@ -24,6 +24,7 @@
 #include "sysemu/device_tree.h"
 #include "qom/object.h"
 #include "net/can_emu.h"
+#include "audio/audio.h"
 
 struct XlnxZCU102 {
     MachineState parent_obj;
@@ -143,6 +144,9 @@ static void xlnx_zcu102_init(MachineState *machine)
 
     object_initialize_child(OBJECT(machine), "soc", &s->soc, TYPE_XLNX_ZYNQMP);
 
+    qdev_prop_set_string(DEVICE(&s->soc.dp), "audiodev",
+                         audio_maybe_init_dummy("zcu102.defaudio"));
+
     object_property_set_link(OBJECT(&s->soc), "ddr-ram", OBJECT(machine->ram),
                              &error_abort);
     object_property_set_bool(OBJECT(&s->soc), "secure", s->secure,
diff --git a/hw/arm/z2.c b/hw/arm/z2.c
index 9c1e876207b3..8d9141998870 100644
--- a/hw/arm/z2.c
+++ b/hw/arm/z2.c
@@ -26,6 +26,7 @@
 #include "exec/address-spaces.h"
 #include "cpu.h"
 #include "qom/object.h"
+#include "qapi/error.h"
 
 #ifdef DEBUG_Z2
 #define DPRINTF(fmt, ...) \
@@ -306,6 +307,7 @@ static void z2_init(MachineState *machine)
     void *z2_lcd;
     I2CBus *bus;
     DeviceState *wm;
+    I2CSlave *i2c_dev;
 
     /* Setup CPU & memory */
     mpu = pxa270_init(address_space_mem, z2_binfo.ram_size, machine->cpu_type);
@@ -330,8 +332,16 @@ static void z2_init(MachineState *machine)
     type_register_static(&aer915_info);
     z2_lcd = ssi_create_peripheral(mpu->ssp[1], TYPE_ZIPIT_LCD);
     bus = pxa2xx_i2c_bus(mpu->i2c[0]);
+
     i2c_slave_create_simple(bus, TYPE_AER915, 0x55);
-    wm = DEVICE(i2c_slave_create_simple(bus, TYPE_WM8750, 0x1b));
+
+    i2c_dev = i2c_slave_new(TYPE_WM8750, 0x1b);
+    wm = DEVICE(i2c_dev);
+
+    qdev_prop_set_string(wm, "audiodev",
+                         audio_maybe_init_dummy("z2.defaudio"));
+    i2c_slave_realize_and_unref(i2c_dev, bus, &error_abort);
+
     mpu->i2s->opaque = wm;
     mpu->i2s->codec_out = wm8750_dac_dat;
     mpu->i2s->codec_in = wm8750_adc_dat;
-- 
2.35.1


