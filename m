Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30493612D58
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Oct 2022 23:30:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opGod-0001VF-JX; Sun, 30 Oct 2022 18:30:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opGob-0001Pd-7n
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 18:30:01 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opGoZ-0007Vo-FG
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 18:30:00 -0400
Received: by mail-wr1-x42c.google.com with SMTP id z14so13647649wrn.7
 for <qemu-devel@nongnu.org>; Sun, 30 Oct 2022 15:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cItMSceJxc77hkLk4ARWSjrWRtmm6EWXY7ZRexGwKP4=;
 b=cVh0FLo0LXrAzJp0WFoDiqgpVeKvDfl339iHbG/lxhj3arNM7iz7dikc9KosFhw+I0
 WNT12ZcKUhyTTNul3CV3/ooaNBwYH3Ip6sQGpXVyGGc65YRzV9oSkSKNu6KdSBfBDSaX
 IVsxi55QWwZ21hJ0Jsj8jKbRsm7CkfjMiq5HAYbhESL+OsTUAt2rL5qlqbsgE3piZDel
 0vaf3P0vNVcgKIDrzIy1H4MpWvLRUxE9e/FsKNuzmptu0vaPNbFHcED7n8EkD7V/DaIN
 wBErEsmre7/2K6VuazQKmuWiSvYqcirV+BdR8tAUsH5zOaCw318ATwmKLAnISQatz/ew
 chJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cItMSceJxc77hkLk4ARWSjrWRtmm6EWXY7ZRexGwKP4=;
 b=xe+0mvlcBZRFXTPfodTUcZ3pDI8BdB8LYNRn0KpyKCM/ZqCFCulvxiDpYQYUcahnYT
 2hXqensQtO5lLzaWkYfWTruXBMAqSx9hxHkyEP8GurqDtz+4Zi45y0J7iEQQN6jhdgWC
 01R34/oDXFUznFFK7ldWS4pepu+I/tHirF4mWqdD3vDCDpZvVLUQVwyn51cTFCwHUvSQ
 9vebOtdAAnN4D2eiRW69lCuaWKg+G/4Nk173lFlgbjGHrS/cFKE/m1q2gIdbqK2oRR1v
 KwdEtHdWQGP0NKb08KtNozgQ/Zu3Hhx10ZRKCOy0L1fxzAh4IxQCjbZjHxE/+3ITlW/g
 CYlw==
X-Gm-Message-State: ACrzQf32dpBikyuGN0S1Vk9oIPFaFUk/4FqctuU+RB/pBRU0pZzCJ1MX
 Glvr4tL2pZiD4HBGzMZBaSjkLV/GSNSXlA==
X-Google-Smtp-Source: AMsMyM7SJQc41kF6rnstTcRgeDRiBvxSv7/9hFrTtYXJkDGC/6nX9BTpLR2bBrXzGF/BTm10eb4E2A==
X-Received: by 2002:a05:6000:24a:b0:236:bc3a:48b2 with SMTP id
 m10-20020a056000024a00b00236bc3a48b2mr3719816wrz.495.1667168997771; 
 Sun, 30 Oct 2022 15:29:57 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 k36-20020a05600c1ca400b003b47b80cec3sm5352058wms.42.2022.10.30.15.29.56
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 30 Oct 2022 15:29:57 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Stefan Pejic <stefan.pejic@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Paul Burton <paulburton@kernel.org>,
 Bernhard Beschow <shentey@gmail.com>, BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 11/55] hw/mips/fuloong2e: Inline vt82c686b_southbridge_init()
 and remove it
Date: Sun, 30 Oct 2022 23:27:57 +0100
Message-Id: <20221030222841.42377-12-philmd@linaro.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221030222841.42377-1-philmd@linaro.org>
References: <20221030222841.42377-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Bernhard Beschow <shentey@gmail.com>

The previous patches moved most of this function into the via-isa device
model such that it has become fairly trivial. So inline it for
simplicity.

Suggested-by: BALATON Zoltan <balaton@eik.bme.hu>
Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220901114127.53914-12-shentey@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/mips/fuloong2e.c | 28 ++++++++++------------------
 1 file changed, 10 insertions(+), 18 deletions(-)

diff --git a/hw/mips/fuloong2e.c b/hw/mips/fuloong2e.c
index 2d8723ab74..3c46215616 100644
--- a/hw/mips/fuloong2e.c
+++ b/hw/mips/fuloong2e.c
@@ -196,22 +196,6 @@ static void main_cpu_reset(void *opaque)
     }
 }
 
-static void vt82c686b_southbridge_init(PCIBus *pci_bus, int slot, qemu_irq intc,
-                                       I2CBus **i2c_bus)
-{
-    PCIDevice *dev, *via;
-
-    via = pci_create_simple_multifunction(pci_bus, PCI_DEVFN(slot, 0), true,
-                                          TYPE_VT82C686B_ISA);
-    qdev_connect_gpio_out(DEVICE(via), 0, intc);
-
-    dev = PCI_DEVICE(object_resolve_path_component(OBJECT(via), "ide"));
-    pci_ide_create_devs(dev);
-
-    dev = PCI_DEVICE(object_resolve_path_component(OBJECT(via), "pm"));
-    *i2c_bus = I2C_BUS(qdev_get_child_bus(DEVICE(dev), "i2c"));
-}
-
 /* Network support */
 static void network_init(PCIBus *pci_bus)
 {
@@ -308,8 +292,16 @@ static void mips_fuloong2e_init(MachineState *machine)
     pci_bus = bonito_init((qemu_irq *)&(env->irq[2]));
 
     /* South bridge -> IP5 */
-    vt82c686b_southbridge_init(pci_bus, FULOONG2E_VIA_SLOT, env->irq[5],
-                               &smbus);
+    pci_dev = pci_create_simple_multifunction(pci_bus,
+                                              PCI_DEVFN(FULOONG2E_VIA_SLOT, 0),
+                                              true, TYPE_VT82C686B_ISA);
+    qdev_connect_gpio_out(DEVICE(pci_dev), 0, env->irq[5]);
+
+    dev = DEVICE(object_resolve_path_component(OBJECT(pci_dev), "ide"));
+    pci_ide_create_devs(PCI_DEVICE(dev));
+
+    dev = DEVICE(object_resolve_path_component(OBJECT(pci_dev), "pm"));
+    smbus = I2C_BUS(qdev_get_child_bus(dev, "i2c"));
 
     /* GPU */
     if (vga_interface_type != VGA_NONE) {
-- 
2.37.3


