Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DFC2530638
	for <lists+qemu-devel@lfdr.de>; Sun, 22 May 2022 23:32:32 +0200 (CEST)
Received: from localhost ([::1]:45390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nstBf-00033X-5D
	for lists+qemu-devel@lfdr.de; Sun, 22 May 2022 17:32:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nst4k-00032p-KL; Sun, 22 May 2022 17:25:23 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:37771)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nst4U-0005Ra-LX; Sun, 22 May 2022 17:25:21 -0400
Received: by mail-ed1-x536.google.com with SMTP id g12so16889770edq.4;
 Sun, 22 May 2022 14:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ms/fgc7qSf1SFBWjA0tWYJPoXLw6U95ylXqfipQmeY4=;
 b=T4znpBRKiDnUq8FR0LzlZ16kpKNZSm9c++IzHjt3McyDLFrvn2553oo+5VL3qCp0lg
 0+Sxjrxr+iois76tEUa7cdzJWN+mKFL2KjmtmBhwXZXcpubvgE+gojD5kFMgfZpy0Ldh
 c0YHvuWFbGNVnmwGCi98KekqwQbv9yYOLqONpUHX8Elurrr5CMyiV3qArEOnln+hZHL1
 a234Gef++ZV4EiDI0Jxhasqznv2X41WCCb7fFTsyW+axT64a181VAL855L4VT41XjWGs
 1NEa3LK5k0TfzDJ+tt5w+JUliPfdNRsFTqtXTUBL7kJVBVDRQ+CSTYUWApZF3DvuLkLJ
 7//g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ms/fgc7qSf1SFBWjA0tWYJPoXLw6U95ylXqfipQmeY4=;
 b=NR3nYtupeg3iiaFR9sGuiUjwvVLHmLJaKkqoEZ6GPHd6/Bk/zIgx4Jt9YQPN4fCq4v
 bBX6WBP2Z5VITZHB721FPpb3Od2vmkYHp8/NVXQORpW5FXfDzFcN+oXKuajKCBJpcFrN
 844ikM8MmU4kFMr0QCwfSPKN9NtTgiMrWufHnVSlHjNHsYg6KIcFgFriNssqXkPOOQeC
 4dh3SASrJAcwrHIT0vG/gajj51yRKWSWdBcvjKH81RIQzJSWernnJS8aqkE1QjDKAexH
 DxaUQK6g3lNalA1h0L3H6G/WCjANMoWGfSLUqZs78wsysAiJIL1tWB4GNRHRP5idqbX4
 gLRw==
X-Gm-Message-State: AOAM533mvRzGrhSRASTWxC36aj8s14A01kbh4dn+NU9sxqf13Pkc2uig
 krLL0FVhzvFkWUX38162VYoth10aYGY=
X-Google-Smtp-Source: ABdhPJx6hdf47umXt/Yh2IP5FJ/rH5QjJ3czJ0/+S1htx4Dl8xzFnBCtr9b4xNoYjTEDSZJdySzIzg==
X-Received: by 2002:a05:6402:2949:b0:425:a52a:28c5 with SMTP id
 ed9-20020a056402294900b00425a52a28c5mr20543569edb.389.1653254705423; 
 Sun, 22 May 2022 14:25:05 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-078-054-075-232.78.54.pool.telefonica.de. [78.54.75.232])
 by smtp.gmail.com with ESMTPSA id
 w4-20020a170907270400b006f3ef214e22sm5418768ejk.136.2022.05.22.14.25.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 May 2022 14:25:05 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Bernhard Beschow <shentey@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Subject: [PATCH v2 6/6] hw/isa/piix{3, 4}: Inline and remove create() functions
Date: Sun, 22 May 2022 23:24:31 +0200
Message-Id: <20220522212431.14598-7-shentey@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220522212431.14598-1-shentey@gmail.com>
References: <20220522212431.14598-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

During the previous changesets the create() functions became trivial
wrappers around more generic functions. Modernize the code.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/i386/pc_piix.c             |  6 +++++-
 hw/isa/piix3.c                | 13 -------------
 hw/isa/piix4.c                | 13 -------------
 hw/mips/malta.c               |  5 ++++-
 include/hw/southbridge/piix.h |  4 ----
 5 files changed, 9 insertions(+), 32 deletions(-)

diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 4d4b83a27d..989e101ed6 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -196,6 +196,9 @@ static void pc_init1(MachineState *machine,
 
     if (pcmc->pci_enabled) {
         PIIX3State *piix3;
+        PCIDevice *pci_dev;
+        const char *type = xen_enabled() ? TYPE_PIIX3_XEN_DEVICE
+                                         : TYPE_PIIX3_DEVICE;
 
         pci_bus = i440fx_init(host_type,
                               pci_type,
@@ -206,7 +209,8 @@ static void pc_init1(MachineState *machine,
                               pci_memory, ram_memory);
         pcms->bus = pci_bus;
 
-        piix3 = piix3_create(pci_bus);
+        pci_dev = pci_create_simple_multifunction(pci_bus, -1, true, type);
+        piix3 = PIIX3_PCI_DEVICE(pci_dev);
         piix3->pic = x86ms->gsi;
         piix3_devfn = piix3->dev.devfn;
         isa_bus = ISA_BUS(qdev_get_child_bus(DEVICE(piix3), "isa.0"));
diff --git a/hw/isa/piix3.c b/hw/isa/piix3.c
index c6ff7795f4..01c376b39a 100644
--- a/hw/isa/piix3.c
+++ b/hw/isa/piix3.c
@@ -399,16 +399,3 @@ static void piix3_register_types(void)
 }
 
 type_init(piix3_register_types)
-
-PIIX3State *piix3_create(PCIBus *pci_bus)
-{
-    PIIX3State *piix3;
-    PCIDevice *pci_dev;
-    const char *type = xen_enabled() ? TYPE_PIIX3_XEN_DEVICE
-                                     : TYPE_PIIX3_DEVICE;
-
-    pci_dev = pci_create_simple_multifunction(pci_bus, -1, true, type);
-    piix3 = PIIX3_PCI_DEVICE(pci_dev);
-
-    return piix3;
-}
diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
index 1645f63450..aabbda3e91 100644
--- a/hw/isa/piix4.c
+++ b/hw/isa/piix4.c
@@ -306,16 +306,3 @@ static void piix4_register_types(void)
 }
 
 type_init(piix4_register_types)
-
-DeviceState *piix4_create(PCIBus *pci_bus)
-{
-    PCIDevice *pci;
-    DeviceState *dev;
-    int devfn = PCI_DEVFN(10, 0);
-
-    pci = pci_create_simple_multifunction(pci_bus, devfn,  true,
-                                          TYPE_PIIX4_PCI_DEVICE);
-    dev = DEVICE(pci);
-
-    return dev;
-}
diff --git a/hw/mips/malta.c b/hw/mips/malta.c
index b0fc84ccbb..7afc4bac9a 100644
--- a/hw/mips/malta.c
+++ b/hw/mips/malta.c
@@ -1238,6 +1238,7 @@ void mips_malta_init(MachineState *machine)
     int be;
     MaltaState *s;
     DeviceState *dev;
+    PCIDevice *piix4;
 
     s = MIPS_MALTA(qdev_new(TYPE_MIPS_MALTA));
     sysbus_realize_and_unref(SYS_BUS_DEVICE(s), &error_fatal);
@@ -1399,7 +1400,9 @@ void mips_malta_init(MachineState *machine)
     empty_slot_init("GT64120", 0, 0x20000000);
 
     /* Southbridge */
-    dev = piix4_create(pci_bus);
+    piix4 = pci_create_simple_multifunction(pci_bus, PCI_DEVFN(10, 0), true,
+                                            TYPE_PIIX4_PCI_DEVICE);
+    dev = DEVICE(piix4);
     isa_bus = ISA_BUS(qdev_get_child_bus(dev, "isa.0"));
     smbus = I2C_BUS(qdev_get_child_bus(dev, "smbus"));
 
diff --git a/include/hw/southbridge/piix.h b/include/hw/southbridge/piix.h
index 2c21359efa..2d55dbdef7 100644
--- a/include/hw/southbridge/piix.h
+++ b/include/hw/southbridge/piix.h
@@ -74,8 +74,4 @@ DECLARE_INSTANCE_CHECKER(PIIX3State, PIIX3_PCI_DEVICE,
 #define TYPE_PIIX3_XEN_DEVICE "PIIX3-xen"
 #define TYPE_PIIX4_PCI_DEVICE "piix4-isa"
 
-PIIX3State *piix3_create(PCIBus *pci_bus);
-
-DeviceState *piix4_create(PCIBus *pci_bus);
-
 #endif
-- 
2.36.1


