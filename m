Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F628310F38
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 18:57:20 +0100 (CET)
Received: from localhost ([::1]:41638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l85M7-0002W4-BI
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 12:57:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l84Tr-0006zp-BD
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 12:01:15 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:33527)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l84TQ-000468-UR
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 12:01:15 -0500
Received: by mail-wr1-x431.google.com with SMTP id 7so8520617wrz.0
 for <qemu-devel@nongnu.org>; Fri, 05 Feb 2021 09:00:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=gSDR8Mqc+foRqFOzXhqtEOdNoxWnrjbPBnz7VqeXzgo=;
 b=uqJjaZGFuapQ3fys4wH5iO9bLP77I9ssMg4zHAePNfgpji1dX6CPZRUGuh1p9iaG3Z
 UlSFVCfmdqQwksOjAQFZvFHLddaWFXr3N12IYoztFyDblOn7Ai6rZRmQ+E98VR3avi7M
 kbBRRk9N276Ha2dugGVkY2gBE/c3PLusA046wSVAHpYAMDmwTeWqyiKnEAEjyH37Y8IB
 94SIHE8k1XGKo2ZHizJAIuSpCeD0dH7qTSq4spxyswVLMRovAE5tRpPldOT+4L3odBNE
 CUo9+kP9Oa0wKxvP67IdlYkYFf0A2tnHyrh3Ym3eC7asRa9buodTqNjxuH1SpdOCqiy3
 ye6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gSDR8Mqc+foRqFOzXhqtEOdNoxWnrjbPBnz7VqeXzgo=;
 b=XkDRKYKS/OlefqJdxAG1oCk6pimXDOhLP0VN0L9hE/paxp7qSRJNuPCejUnPZGdCdn
 TndvRCiKSRIXSb5oDBk6E5o1XJ1CLhYZo80rvKu6sxmqaxpVwnVceDRzqs591HMIPHOo
 YUw759mnOFwd7U+r3OFcVP+MOlZR05ZP/mhaPwhrlcwCOaISN4/Oh9c50ZuWL4B23xgu
 rEjK8BfzKpV2L+tUU7Dtwe++Uwl2WemdoSzNpLUazrCdliLzqCyUjgagZ+UKuNoG22MG
 da4hYZVWPBztZQ5Db+9Vbn4y4Ni6/7tvjYlyy8hRDqHMOks75T8kCas8PzzDhq2O6P4K
 sTqg==
X-Gm-Message-State: AOAM533fyjeAVgT2ahS2FO39/nhgeme6vZaut/hAgaWaoQFI08aRu+l9
 mHsDdeS0vcgUB9QcjsN04JTS/g==
X-Google-Smtp-Source: ABdhPJwQXtKbCOp6Rt6ML6Ze8vT9lWvmKy/uJszZ5H80LeFv73Tsa8jKgPQZOJUPg1GjLGu3p1CVEw==
X-Received: by 2002:adf:f182:: with SMTP id h2mr5998497wro.355.1612544438794; 
 Fri, 05 Feb 2021 09:00:38 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id l11sm12200010wrt.23.2021.02.05.09.00.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 09:00:38 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 21/24] hw/arm/mps2-tz: Stub out USB controller for mps3-an524
Date: Fri,  5 Feb 2021 17:00:16 +0000
Message-Id: <20210205170019.25319-22-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210205170019.25319-1-peter.maydell@linaro.org>
References: <20210205170019.25319-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
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
---
 hw/arm/mps2-tz.c | 48 +++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 47 insertions(+), 1 deletion(-)

diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
index aa57c4b2596..db1afa4bd22 100644
--- a/hw/arm/mps2-tz.c
+++ b/hw/arm/mps2-tz.c
@@ -119,6 +119,8 @@ struct MPS2TZMachineState {
 
     ARMSSE iotkit;
     MemoryRegion ram[MPS2TZ_RAM_MAX];
+    MemoryRegion eth_usb_container;
+
     MPS2SCC scc;
     MPS2FPGAIO fpgaio;
     TZPPC ppc[5];
@@ -130,6 +132,7 @@ struct MPS2TZMachineState {
     UnimplementedDeviceState gfx;
     UnimplementedDeviceState cldc;
     UnimplementedDeviceState rtc;
+    UnimplementedDeviceState usb;
     PL080State dma[4];
     TZMSC msc[4];
     CMSDKAPBUART uart[6];
@@ -431,6 +434,49 @@ static MemoryRegion *make_eth_dev(MPS2TZMachineState *mms, void *opaque,
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
@@ -808,7 +854,7 @@ static void mps2tz_common_init(MachineState *machine)
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


