Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5200566E799
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 21:18:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHsOO-0002xK-Nu; Tue, 17 Jan 2023 15:17:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pHsO9-0002uX-A0
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 15:16:57 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pHsO6-0006S4-VK
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 15:16:57 -0500
Received: by mail-ej1-x62e.google.com with SMTP id qx13so19709698ejb.13
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 12:16:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UMCy71y0Z4Vz5M1MpnhAy1/JUyaemBevfRPJi/p9hAI=;
 b=vpRVWRXF+uJG6PDprzK/7ZwGU7jjXX1E7DfWS/5HS6xA5e4oHtp4dLxx826Wn5iW0u
 F9hHIyYLdzFkxNOLEFX4GQkusfRfLNxjNAMCOPX+tJ1uYX/yuFASGiKKl4xpsUaOjWt7
 LS/g2OYapHioBlHrr7/rsOOBOncD9Ur9m6yVDYBhvTOsZtsB+2sq5gOrv8Ti9IKcd0v0
 PzheRzfj01AuSKw/ZJ49C2OEI6RyxpfwOFJMYw/IcphhAZQ1yNaAK2deR7ChoYUJGB+6
 sk2wgzrtWvmkjs8G4Sm/wteVdc/GNU5Jcc3Pj3ZQ5paDvWMahIu891/sfwhKy8BLJYUQ
 AaKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UMCy71y0Z4Vz5M1MpnhAy1/JUyaemBevfRPJi/p9hAI=;
 b=4hpmLLo5DZaiePsoQGR0GwssurkUb7Stg6eSSV2C0+yQam54dAffxI3D5Ewar77rLH
 Pq8v2DWFP80xlqXywcc7moI/XRmQjxIAMEF1cBTL7Kf7jnVmmp/ccLwY3XEGu2O1UTCJ
 A0Q2jBaaCwpDU04X4MoxBSUxDR7ynZnciUAPint8AefCVhYWquOJJdfgT01pszJsu9eM
 +Qge9rHFmxqTaSr7lginndBgICyN/xo9XdUjnbhNvxUO7Fg+IFIwQl5zyBTiSKh4ape+
 PYQlEZTUl4YYsJTeCl8cP7+10QiT2CUenRS8ky37mdsxcDu//NHzU1l9z10SWV+XFh/m
 7oEw==
X-Gm-Message-State: AFqh2kpYWaw+9dKPgTxl6FE8CnyjWZFmQRszFZvrY/Lb2SHyxBNxrGw2
 Zb8wffLkbwlSgjhaC0IyQsTjTDN7djfG7k8v
X-Google-Smtp-Source: AMrXdXvaHYIC603jzhMYfanYoZP2f4BJSqkkwfOKPMMvkDIgni/e0Zvhyt+4BIGpA4Rn4f4uayxFFQ==
X-Received: by 2002:a17:907:c70f:b0:871:d04e:1df with SMTP id
 ty15-20020a170907c70f00b00871d04e01dfmr4444523ejc.29.1673986613117; 
 Tue, 17 Jan 2023 12:16:53 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 v22-20020aa7d816000000b0049dd7eec977sm4509567edq.41.2023.01.17.12.16.52
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 17 Jan 2023 12:16:52 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 2/2] hw/ppc/pegasos2: Extract via_vt8231_create() helper
Date: Tue, 17 Jan 2023 21:16:40 +0100
Message-Id: <20230117201640.88365-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230117201640.88365-1-philmd@linaro.org>
References: <20230117201640.88365-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Simplify a bit pegasos2_init() by extracting the VIA southbridge
creation code into a new via_vt8231_create() helper.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/ppc/pegasos2.c | 33 +++++++++++++++++++++------------
 1 file changed, 21 insertions(+), 12 deletions(-)

diff --git a/hw/ppc/pegasos2.c b/hw/ppc/pegasos2.c
index ac69aee099..445cb5ef31 100644
--- a/hw/ppc/pegasos2.c
+++ b/hw/ppc/pegasos2.c
@@ -96,6 +96,25 @@ static void pegasos2_cpu_reset(void *opaque)
     }
 }
 
+static PCIDevice *via_vt8231_create(MachineState *machine, PCIBus *pci_bus)
+{
+    Pegasos2MachineState *pm = PEGASOS2_MACHINE(machine);
+    PCIDevice *dev, *via;
+
+    via = pci_create_simple_multifunction(pci_bus, PCI_DEVFN(12, 0),
+                                          true, TYPE_VT8231_ISA);
+    object_property_add_alias(OBJECT(machine), "rtc-time",
+                              object_resolve_path_component(OBJECT(via), "rtc"),
+                              "date");
+    qdev_connect_gpio_out(DEVICE(via), 0,
+                          qdev_get_gpio_in_named(pm->mv, "gpp", 31));
+
+    dev = PCI_DEVICE(object_resolve_path_component(OBJECT(via), "ide"));
+    pci_ide_create_devs(dev);
+
+    return via;
+}
+
 static I2CBus *via_i2c_bus(PCIDevice *via)
 {
     PCIDevice *dev;
@@ -110,7 +129,7 @@ static void pegasos2_init(MachineState *machine)
     CPUPPCState *env;
     MemoryRegion *rom = g_new(MemoryRegion, 1);
     PCIBus *pci_bus;
-    PCIDevice *dev, *via;
+    PCIDevice *via;
     const char *fwname = machine->firmware ?: PROM_FILENAME;
     char *filename;
     int sz;
@@ -166,17 +185,7 @@ static void pegasos2_init(MachineState *machine)
     pci_bus = mv64361_get_pci_bus(pm->mv, 1);
 
     /* VIA VT8231 South Bridge (multifunction PCI device) */
-    via = pci_create_simple_multifunction(pci_bus, PCI_DEVFN(12, 0), true,
-                                          TYPE_VT8231_ISA);
-    object_property_add_alias(OBJECT(machine), "rtc-time",
-                              object_resolve_path_component(OBJECT(via),
-                                                            "rtc"),
-                              "date");
-    qdev_connect_gpio_out(DEVICE(via), 0,
-                          qdev_get_gpio_in_named(pm->mv, "gpp", 31));
-
-    dev = PCI_DEVICE(object_resolve_path_component(OBJECT(via), "ide"));
-    pci_ide_create_devs(dev);
+    via = via_vt8231_create(machine, pci_bus);
 
     spd_data = spd_data_generate(DDR, machine->ram_size);
     smbus_eeprom_init_one(via_i2c_bus(via), 0x57, spd_data);
-- 
2.38.1


