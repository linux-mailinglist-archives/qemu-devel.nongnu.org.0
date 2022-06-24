Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F273F55A30B
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 22:54:33 +0200 (CEST)
Received: from localhost ([::1]:33848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4qK0-0005gR-LT
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 16:54:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ph.makarov@gmail.com>)
 id 1o4pLy-00080z-4Y
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 15:52:30 -0400
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129]:46711)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ph.makarov@gmail.com>)
 id 1o4pLu-00074M-Km
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 15:52:29 -0400
Received: by mail-lf1-x129.google.com with SMTP id z13so6159455lfj.13
 for <qemu-devel@nongnu.org>; Fri, 24 Jun 2022 12:52:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=g+dqGzpj7oBllNJufIfPTfg3ls+RbSiZ4jR9mwtQaj0=;
 b=g5VZapMKKUYIq3pJY11t1ZW4RPm4D/l45MB0Z40L1gQmmOtRQPCak+SrihiONM3PrL
 qghoyuVb/y8/hkGpCVE/nh0z/UrG9e1w4OB3v5jhNtzCCaIM4TkRvjsDDrgY88vwz58c
 MzruHEqq+S6AG2b1OvVpONVSQuSG9j4LSecw+7ITGahzNmgKPvrgtEZGSN8/1feZYxrx
 2Q22gZ0Aqx2BS/CAX2HTcdmx0kIaeug6Fr3uDS6D12cVtA3mEp+Vw7G2RQMf9NP9QFO1
 tJkhbxyK93kEQdqDM3NUJGZxgS7mgvQE2taDNbuR9Ma1bDnE2NR/FQvYI5aLt+eH61IT
 CkBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=g+dqGzpj7oBllNJufIfPTfg3ls+RbSiZ4jR9mwtQaj0=;
 b=M+f6qxyBujCXTtN5e5XFuJmwMJGQjGa8Cb0T1CDM9kowRUsFiSbc9TzxlU1c54/88j
 5rahs1TDr2ovmVEprZZyjHyaJoA40uucxb7qBmVhPE/spPSte5Fqt9JIciFIL4OOa5XW
 3vR284K9SmS/rX6QWmdPR9XUXH9VQhnEFHJJFcDtz/nv3Gjacyq6M7QkBw87sk/MKmAz
 50ocydHWDFQ6Ced8tGwmED7viqzfLHSOW741g85W3+zA2ME9Y2IA+DWwdAauSMaBWJ9v
 ONCgtPBxrVt3J57Cagltl6SE6Z1dNlmimrT0PWx2bErImQouRSwWZDAsYkgVO8GDRWA/
 G4Lw==
X-Gm-Message-State: AJIora8hLVwGeZ30VtHigwuCg7nfDWeyTBq4bAdrRH4VRGRejooS3Hfo
 9yw84dn/kzoDESQ70DgWkgEAQ0A8hhsPtfrN
X-Google-Smtp-Source: AGRyM1v190Ck41gE972VxG/j0cWGnMSiPkt9NtTrUEm6b9e2HmPbn8RNHn9DxmhvcFAG/5XCx5VIww==
X-Received: by 2002:a05:6512:b1a:b0:47f:b574:9539 with SMTP id
 w26-20020a0565120b1a00b0047fb5749539mr310028lfu.143.1656100343249; 
 Fri, 24 Jun 2022 12:52:23 -0700 (PDT)
Received: from localhost.localdomain
 (broadband-178-140-155-119.ip.moscow.rt.ru. [178.140.155.119])
 by smtp.gmail.com with ESMTPSA id
 m16-20020ac24250000000b00478fe690207sm489385lfl.286.2022.06.24.12.52.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jun 2022 12:52:22 -0700 (PDT)
From: Andrey Makarov <ph.makarov@gmail.com>
X-Google-Original-From: Andrey Makarov <andrey.makarov@auriga.com>
To: qemu-devel@nongnu.org
Cc: Andrey Makarov <andrey.makarov@auriga.com>
Subject: [PATCH] Align Raspberry Pi DMA interrupts with Linux DTS
Date: Fri, 24 Jun 2022 22:52:06 +0300
Message-Id: <20220624195206.671993-1-andrey.makarov@auriga.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::129;
 envelope-from=ph.makarov@gmail.com; helo=mail-lf1-x129.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 24 Jun 2022 16:52:50 -0400
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

All Raspberry Pi models 1-3 (based on bcm2835) have
Linux device tree (arch/arm/boot/dts/bcm2835-common.dtsi +25):

    /* dma channel 11-14 share one irq */

which mismatched the Qemu model.
In this patch channels 0--10 and 11--14 are handled separately.

Signed-off-by: Andrey Makarov <andrey.makarov@auriga.com>
---
 hw/arm/bcm2835_peripherals.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/hw/arm/bcm2835_peripherals.c b/hw/arm/bcm2835_peripherals.c
index 48538c9360..3d808b0e31 100644
--- a/hw/arm/bcm2835_peripherals.c
+++ b/hw/arm/bcm2835_peripherals.c
@@ -322,13 +322,21 @@ static void bcm2835_peripherals_realize(DeviceState *dev, Error **errp)
     memory_region_add_subregion(&s->peri_mr, DMA15_OFFSET,
                 sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->dma), 1));
 
-    for (n = 0; n <= 12; n++) {
+    for (n = 0; n <= 10; n++) {
         sysbus_connect_irq(SYS_BUS_DEVICE(&s->dma), n,
                            qdev_get_gpio_in_named(DEVICE(&s->ic),
                                                   BCM2835_IC_GPU_IRQ,
                                                   INTERRUPT_DMA0 + n));
     }
 
+    /* According to DTS, dma channels 11-14 share one irq */
+    for (n = 11; n <= 14; n++) {
+        sysbus_connect_irq(SYS_BUS_DEVICE(&s->dma), n,
+                           qdev_get_gpio_in_named(DEVICE(&s->ic),
+                                                  BCM2835_IC_GPU_IRQ,
+                                                  INTERRUPT_DMA0 + 11));
+    }
+
     /* THERMAL */
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->thermal), errp)) {
         return;
-- 
2.30.2


