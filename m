Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6872732F268
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 19:24:09 +0100 (CET)
Received: from localhost ([::1]:42390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIF7Q-00013l-D6
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 13:24:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lIE3y-0007Pm-Fj
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 12:16:32 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:37109)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lIE3M-0007jo-Fc
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 12:16:30 -0500
Received: by mail-wr1-x42d.google.com with SMTP id v15so2901711wrx.4
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 09:15:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=9Yz25JS+8HWqTKkBeIi8VVd+CMag74YlIwZkGIugKkI=;
 b=c4abUZUWHb6RmxYxk8BLz2ZAKhCKhh5tbpRG3ZYM7C5V5rjBo6BJTRUuRuNhIts2sO
 l237HmqFmtvhubwhFyPATYudsEPwy2VjeDlHPchJZShbtR4R0wa4oloo/queH2C1Bk/9
 MZjZjMq1HlWK4jMyaPGDPggzqnSaC5tAOLvjk/BqRUYKobWWUTEf2F5KF9+48xr5MR0g
 xJuvzCLngrnVNfd0Mu4STg1lemyDcitExaDB8tSR4LwQ0WjZ7HKt7LGdI1+sng96t9Tn
 JeDAj6ZmWLZvybg8/MJQpa1jGP/Y3uLYM6O6YCmaoFv41uLJvPN41HsrvplqttKaQyA0
 9MSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9Yz25JS+8HWqTKkBeIi8VVd+CMag74YlIwZkGIugKkI=;
 b=aO7iWXlYs04HfAqBHf9e2KVDhAlzpzlQs/5RB/4tQtx/sso1R5JoRu4cmInkbN+yn+
 NJRRiha44K6ytLXkt3Ooll0It4fTsDVA9Re2CcyI+qDvC8l8q4qb11/8fxtG0kYYyPJc
 n82z9CywDb1KnUrRhqQF6f1Ye4d4ZYB/GfVis2SRpVwMjJam+pbvqA1Sb8qvP4AYCZsr
 V+DlqmpXe+mDUC5VaSwKEVJyEJWJ6NqTw5EWEGzuJEFSIAFSTArvkicriGdNrrQ8to/1
 sak10PHP6ca0VQ8rbK8LOf5yP1KP5k2IHaynTupVzp/lcvOf8Zx/FklVzJv61WiueZKA
 /rUA==
X-Gm-Message-State: AOAM531GIiP2ukdHqoZzgJEatVhF+DOBxliu1vic2Tr7RA9d7RqXRXdd
 iG3gH9TlwK/0YcnTUOeaG0risIJaD6T+Ow==
X-Google-Smtp-Source: ABdhPJwStDrJ5o8sNN6Rm9PlND9/GTTSB+rBsd6xq2SxDuNvQgxMOcrunA7Kfrf6sGKD3DPwOZTh2w==
X-Received: by 2002:adf:8104:: with SMTP id 4mr10456426wrm.265.1614964549010; 
 Fri, 05 Mar 2021 09:15:49 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m132sm5942357wmf.45.2021.03.05.09.15.48
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Mar 2021 09:15:48 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 46/49] hw/arm/mps2-tz: Stub out USB controller for mps3-an524
Date: Fri,  5 Mar 2021 17:15:12 +0000
Message-Id: <20210305171515.1038-47-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210305171515.1038-1-peter.maydell@linaro.org>
References: <20210305171515.1038-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

The AN524 has a USB controller (an ISP1763); we don't have a model of
it but we should provide a stub "unimplemented-device" for it.  This
is slightly complicated because the USB controller shares a PPC port
with the ethernet controller.

Implement a make_* function which provides creates a container
MemoryRegion with both the ethernet controller and an
unimplemented-device stub for the USB controller.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210215115138.20465-22-peter.maydell@linaro.org
---
 hw/arm/mps2-tz.c | 48 +++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 47 insertions(+), 1 deletion(-)

diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
index baeb684d9d0..c1bb52995ff 100644
--- a/hw/arm/mps2-tz.c
+++ b/hw/arm/mps2-tz.c
@@ -120,6 +120,8 @@ struct MPS2TZMachineState {
 
     ARMSSE iotkit;
     MemoryRegion ram[MPS2TZ_RAM_MAX];
+    MemoryRegion eth_usb_container;
+
     MPS2SCC scc;
     MPS2FPGAIO fpgaio;
     TZPPC ppc[5];
@@ -131,6 +133,7 @@ struct MPS2TZMachineState {
     UnimplementedDeviceState gfx;
     UnimplementedDeviceState cldc;
     UnimplementedDeviceState rtc;
+    UnimplementedDeviceState usb;
     PL080State dma[4];
     TZMSC msc[4];
     CMSDKAPBUART uart[6];
@@ -432,6 +435,49 @@ static MemoryRegion *make_eth_dev(MPS2TZMachineState *mms, void *opaque,
     return sysbus_mmio_get_region(s, 0);
 }
 
+static MemoryRegion *make_eth_usb(MPS2TZMachineState *mms, void *opaque,
+                                  const char *name, hwaddr size,
+                                  const int *irqs)
+{
+    /*
+     * The AN524 makes the ethernet and USB share a PPC port.
+     * irqs[] is the ethernet IRQ.
+     */
+    SysBusDevice *s;
+    NICInfo *nd = &nd_table[0];
+
+    memory_region_init(&mms->eth_usb_container, OBJECT(mms),
+                       "mps2-tz-eth-usb-container", 0x200000);
+
+    /*
+     * In hardware this is a LAN9220; the LAN9118 is software compatible
+     * except that it doesn't support the checksum-offload feature.
+     */
+    qemu_check_nic_model(nd, "lan9118");
+    mms->lan9118 = qdev_new(TYPE_LAN9118);
+    qdev_set_nic_properties(mms->lan9118, nd);
+
+    s = SYS_BUS_DEVICE(mms->lan9118);
+    sysbus_realize_and_unref(s, &error_fatal);
+    sysbus_connect_irq(s, 0, get_sse_irq_in(mms, irqs[0]));
+
+    memory_region_add_subregion(&mms->eth_usb_container,
+                                0, sysbus_mmio_get_region(s, 0));
+
+    /* The USB OTG controller is an ISP1763; we don't have a model of it. */
+    object_initialize_child(OBJECT(mms), "usb-otg",
+                            &mms->usb, TYPE_UNIMPLEMENTED_DEVICE);
+    qdev_prop_set_string(DEVICE(&mms->usb), "name", "usb-otg");
+    qdev_prop_set_uint64(DEVICE(&mms->usb), "size", 0x100000);
+    s = SYS_BUS_DEVICE(&mms->usb);
+    sysbus_realize(s, &error_fatal);
+
+    memory_region_add_subregion(&mms->eth_usb_container,
+                                0x100000, sysbus_mmio_get_region(s, 0));
+
+    return &mms->eth_usb_container;
+}
+
 static MemoryRegion *make_mpc(MPS2TZMachineState *mms, void *opaque,
                               const char *name, hwaddr size,
                               const int *irqs)
@@ -809,7 +855,7 @@ static void mps2tz_common_init(MachineState *machine)
                 { "gpio1", make_unimp_dev, &mms->gpio[1], 0x41101000, 0x1000 },
                 { "gpio2", make_unimp_dev, &mms->gpio[2], 0x41102000, 0x1000 },
                 { "gpio3", make_unimp_dev, &mms->gpio[3], 0x41103000, 0x1000 },
-                { "eth", make_eth_dev, NULL, 0x41400000, 0x100000, { 48 } },
+                { "eth-usb", make_eth_usb, NULL, 0x41400000, 0x200000, { 48 } },
             },
         },
     };
-- 
2.20.1


