Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8C49536E2D
	for <lists+qemu-devel@lfdr.de>; Sat, 28 May 2022 21:25:10 +0200 (CEST)
Received: from localhost ([::1]:33272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nv23h-0006tp-RM
	for lists+qemu-devel@lfdr.de; Sat, 28 May 2022 15:25:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nv20B-0003e7-A9; Sat, 28 May 2022 15:21:31 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:40694)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nv209-00023P-Jy; Sat, 28 May 2022 15:21:31 -0400
Received: by mail-wr1-x42d.google.com with SMTP id k16so5547278wrg.7;
 Sat, 28 May 2022 12:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2aBF/ovXl3oGfZdhrdV5KeoJOByvRjZ9akRUCR9XPe0=;
 b=JPK64lrkwOoBO1hC9ikrEkKcGXxX70P9H2JwRC/hyXjJKY8WH/4okt/vZRp6vZOsPm
 J3sJjRy2TMoYyD8aWxEGbonJtlRhylOWu4e5mo6l8Ay64YyjRHeTNACAmfaOIvvo3jMK
 NoZozqOOBwKPQ4mhVnzj8El/MyWEfMYo7y5E4hIcRZI5yQPlGQH9/WTaqvsu89VM+sYR
 e8/DtXKJdmmQK6XqbDXEW/5ymgBxE57tD9WRc0nZJmj0rbOXmEaQDsaU8OnWKf2lcBBo
 g3/Zp8vem+78UJUKkA64oI6vevYe1Oyk3zcCYH6OGs2XCktH9Kni8ZZnsuKvyLX+wxE4
 8Kng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2aBF/ovXl3oGfZdhrdV5KeoJOByvRjZ9akRUCR9XPe0=;
 b=zbfrj+1vVW77iZVSblQ3c/SUvvlSz3HkYNiw9v1ajHNtNMdfiu5Eo79f3ZW6UBRC0V
 2O+rHYUPLAXV+yXzTC5Oy/NxOIG8rIncO0aVLpmCKgmsrZ9KxeqFiqyATFmfhFGV874x
 Waq1Eww9sIxIxG3fX4Qlu4/FfJOtMHXcyuDCiFcEwbtvGadrhSYlYcMOy1DtHdXADD+T
 pMwYfPCvPjvcDl+HNHK4AvUGlzRUCVqJ+VyWWjQy+ULKlKR6zbkVnwCyv8fC/o6aZ6PH
 RkXCBR+gCkX5NMSCyFJo1FG0ZySJCOmRVekmeng9xMHMxbBj+5J7gCTte6g5FtANenhb
 YofA==
X-Gm-Message-State: AOAM5312I0APIX77OnGWw18k8k90D3tq1y8Z46PtyOZx6g3mOFO2AmaR
 O+AeWkcCzPjFcDQntLwzd1ENV7vktBxiRJOuyiI=
X-Google-Smtp-Source: ABdhPJwDdyzO3l2DIrHNcasnQdfKjRsEr3Bg64aDkZMJY7yDQg1hFeS85UDWFvnTfYKpOYnWUyLrBA==
X-Received: by 2002:a5d:47a1:0:b0:20f:ec3f:6ca with SMTP id
 1-20020a5d47a1000000b0020fec3f06camr21088928wrb.497.1653765687621; 
 Sat, 28 May 2022 12:21:27 -0700 (PDT)
Received: from osoxes.fritz.box (pd9ed79c4.dip0.t-ipconnect.de.
 [217.237.121.196]) by smtp.gmail.com with ESMTPSA id
 a21-20020a05600c069500b003942a244ed7sm5341022wmn.28.2022.05.28.12.21.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 May 2022 12:21:25 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Bernhard Beschow <shentey@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>
Subject: [PATCH v3 7/7] hw/isa/piix{3, 4}: Inline and remove create() functions
Date: Sat, 28 May 2022 21:20:56 +0200
Message-Id: <20220528192057.30910-8-shentey@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220528192057.30910-1-shentey@gmail.com>
References: <20220528192057.30910-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=shentey@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

During the previous changesets the create() functions became trivial
wrappers around more generic functions. Modernize the code.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/i386/pc_piix.c             |  6 +++++-
 hw/isa/piix3.c                | 13 -------------
 hw/isa/piix4.c                | 13 -------------
 hw/mips/malta.c               |  5 ++++-
 include/hw/southbridge/piix.h |  4 ----
 5 files changed, 9 insertions(+), 32 deletions(-)

diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 9d2076a7ca..107efa1ca6 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -197,6 +197,9 @@ static void pc_init1(MachineState *machine,
 
     if (pcmc->pci_enabled) {
         PIIX3State *piix3;
+        PCIDevice *pci_dev;
+        const char *type = xen_enabled() ? TYPE_PIIX3_XEN_DEVICE
+                                         : TYPE_PIIX3_DEVICE;
 
         pci_bus = i440fx_init(host_type,
                               pci_type,
@@ -207,7 +210,8 @@ static void pc_init1(MachineState *machine,
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
index 217989227d..677bc2f658 100644
--- a/hw/isa/piix4.c
+++ b/hw/isa/piix4.c
@@ -324,16 +324,3 @@ static void piix4_register_types(void)
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
index e1f5d6d5c8..2693778b23 100644
--- a/include/hw/southbridge/piix.h
+++ b/include/hw/southbridge/piix.h
@@ -68,8 +68,4 @@ DECLARE_INSTANCE_CHECKER(PIIX3State, PIIX3_PCI_DEVICE,
 #define TYPE_PIIX3_XEN_DEVICE "PIIX3-xen"
 #define TYPE_PIIX4_PCI_DEVICE "piix4-isa"
 
-PIIX3State *piix3_create(PCIBus *pci_bus);
-
-DeviceState *piix4_create(PCIBus *pci_bus);
-
 #endif
-- 
2.36.1


