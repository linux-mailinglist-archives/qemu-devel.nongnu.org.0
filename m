Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C13AD31B8E1
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 13:18:51 +0100 (CET)
Received: from localhost ([::1]:48392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBcq2-0004U8-G6
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 07:18:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lBcRD-0000Lp-Tg
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 06:53:11 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:34518)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lBcR6-0004Ix-AD
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 06:53:11 -0500
Received: by mail-wr1-x435.google.com with SMTP id n4so5528700wrx.1
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 03:53:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=myzWPQ7aahYwu4rcii5/SdEFuQpyy/NesVoypbH4mDU=;
 b=nsmzH6uGWoA95x3lefjHwaVmPI+8jgU8QWsTKUNUwlz1AiopPaw47WlXfN7/eO9J1o
 iraAOhpiHTGWHxP98tvXklA6HW/d+6gwaIHKo/DqV+ZNXTIN0QpixAv5h4m8VHUwlonS
 1LM92WFbQgmwqJls+6GvEpXbND475c46uOi+94nNLg9hcSR5PXI1bBkKaP/wa2ahgaB1
 Nj3AQvUrWRr9a6BTiRBZ14TE7LGY/LL5b+qFRV5z7xFeFjQesC7KrhlTjs7kMPcv39LL
 qnBcQr2UxPx4ZzJL6893vKBchb6oP2a3GKJMIqSQKkk8srj1kGALCZtvW8z20rY/7xHI
 r6Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=myzWPQ7aahYwu4rcii5/SdEFuQpyy/NesVoypbH4mDU=;
 b=L5ApN1Hi4NRAgsipFllVGAPD+sUbo8U60/G9T+z+gyoy8oNW0cy5TK8r8V1cd93Piv
 ojne0mxwEAv3Ihniso6phk5oNKp+MKEoX/s0RO5g3Aem+kddZCRLdqVZFXW0pcKTN1Pf
 BeGi7sF61zVRAYZeJl7Z1++k+1kjBRoPS1ch4C4WdYU/IFobjflKOtVbr7q2XGRWVnmM
 98dwBHubxILzyp1sdq1sEghylTRIv1jQld3NKq1bSens869df1nLgmUbOXO76RZipdNR
 Y/zE3CirKDVLC6NVqgKIdhTTwJs/pY64MeYUk/8YYgNlj9rRtjXCckFzdN5eGF93Ckjo
 CZwQ==
X-Gm-Message-State: AOAM530MCJhs97QV2GXiPmFDjR3vrS8N+AxxnC0yGVmmwK6meNfBVytO
 3bgukJXEPwvps4Z2Nw6GtNJMqg==
X-Google-Smtp-Source: ABdhPJwIB9BiYia7T6DEBGYqfgH/0DadGG1AZlpp9/+AyAjzdyDheuzUwG3nuMEp4p0j+RoGVv5x4A==
X-Received: by 2002:adf:e708:: with SMTP id c8mr13632529wrm.152.1613389982587; 
 Mon, 15 Feb 2021 03:53:02 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id l83sm25574812wmf.4.2021.02.15.03.53.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Feb 2021 03:53:02 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 21/24] hw/arm/mps2-tz: Stub out USB controller for
 mps3-an524
Date: Mon, 15 Feb 2021 11:51:35 +0000
Message-Id: <20210215115138.20465-22-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210215115138.20465-1-peter.maydell@linaro.org>
References: <20210215115138.20465-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
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
---
 hw/arm/mps2-tz.c | 48 +++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 47 insertions(+), 1 deletion(-)

diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
index 5e12ee2c3d3..183c3920903 100644
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


