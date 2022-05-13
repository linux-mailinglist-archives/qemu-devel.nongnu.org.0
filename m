Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CBF35268F3
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 20:04:58 +0200 (CEST)
Received: from localhost ([::1]:58260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npZer-00074S-B7
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 14:04:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1npZVK-0008IX-TQ; Fri, 13 May 2022 13:55:06 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:47038)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1npZVH-0004k4-GB; Fri, 13 May 2022 13:55:05 -0400
Received: by mail-ej1-x62c.google.com with SMTP id j6so17616233ejc.13;
 Fri, 13 May 2022 10:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3rRoC/qc2j2rBiKUOP0rc6x1xIIj9UTtpZ+lI3b2sFg=;
 b=kSNSrD7H+7lEPMVsjjx+5TE3kCSCeB1kwgrqxk9nbszf1G1trrb1eriRW/R/vkmSj9
 sZheEYpyV1aFZK0gdfYAMU9EOg+l9kLYUxECl2RtPdrs9VZ9a+ilaoT8zPkXVuKMwrtT
 byrStTbcXRiLImwMQ44xVxwe7eVTNxDgVkEZ1HYtgEfAtY9PlsqV3oVbtaDxthnI5MIV
 dU88N8yogbN4DkeGhc3kP9Tm6Pjx9eK0Wa+Paw8KcVMvBV5OT6of2bt3gYPC5iNCdW/J
 BTCZ+OKbJg5+X9+/ZsVtswgYjJWo1IRkY/Ql+uWAZNxwE2CKo0lGwe0JsVOgn6hfkKQy
 Pyrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3rRoC/qc2j2rBiKUOP0rc6x1xIIj9UTtpZ+lI3b2sFg=;
 b=rtv1woyNhyVh2Mjqqa9tH3gDj1XzHk/38t+3kqtMHkBoKLKU9DwoTbd6WOIwwjN5rd
 6BEB8Tm0gSNwhNy6iJb6ZsDx6Scm+2nF2gOxQGHyjoPu0OSd5NFI20ty9R5cigwfSXA9
 wzrLCU3ofv6kmiXBKb6DX++F8apKd4xx1sD7tAxxBFydpf/xTICCx5ZPKHu4sMItRi/f
 xs8rOett9+UdR1P9JD7ArDcP8pBZdq/9J391ep0dBYk5nlC3Jh5QhT9bwk9nV+Mkfmgk
 U82fSzOYO/NwYLiZbVlGh6oMn/h79y0ZtvoE3IONCzUb5X36LQgL9t2fcFDNo7EHaIIY
 Ohjw==
X-Gm-Message-State: AOAM532Tpw6/9VGV+ZopYvE/2RwpNcp/D7B3CBeE/lMA153mu7hsYCqS
 PsCdzTc8AlBPfFg2a12QX4hBuHXwGlI=
X-Google-Smtp-Source: ABdhPJwWq0WqXYCpoZFXjdlfpk5TniBqz0jDkCnu5Wswryc5j1rRUJB2g+LqZIt4KTd0d6ez+HU2Lw==
X-Received: by 2002:a17:907:8a24:b0:6f4:82c9:9adc with SMTP id
 sc36-20020a1709078a2400b006f482c99adcmr5396756ejc.223.1652464501498; 
 Fri, 13 May 2022 10:55:01 -0700 (PDT)
Received: from Provence.localdomain
 (dynamic-089-014-181-123.89.14.pool.telefonica.de. [89.14.181.123])
 by smtp.gmail.com with ESMTPSA id
 ci18-20020a170907267200b006f3ef214e3esm953874ejc.164.2022.05.13.10.55.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 May 2022 10:55:01 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Bernhard Beschow <shentey@gmail.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH 5/6] hw/isa/piix4: Factor out SM bus initialization from
 create() function
Date: Fri, 13 May 2022 19:54:44 +0200
Message-Id: <20220513175445.89616-6-shentey@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220513175445.89616-1-shentey@gmail.com>
References: <20220513175445.89616-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62c.google.com
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

Initialize the SM bus just like is done for piix3 which modernizes the
code.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/isa/piix4.c                | 15 +++------------
 hw/mips/malta.c               |  7 ++++++-
 include/hw/southbridge/piix.h |  2 +-
 3 files changed, 10 insertions(+), 14 deletions(-)

diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
index 4968c69da9..852e5c4db1 100644
--- a/hw/isa/piix4.c
+++ b/hw/isa/piix4.c
@@ -301,21 +301,12 @@ static void piix4_register_types(void)
 
 type_init(piix4_register_types)
 
-DeviceState *piix4_create(PCIBus *pci_bus, I2CBus **smbus)
+PCIDevice *piix4_create(PCIBus *pci_bus)
 {
     PCIDevice *pci;
-    DeviceState *dev;
-    int devfn = PCI_DEVFN(10, 0);
 
-    pci = pci_create_simple_multifunction(pci_bus, devfn,  true,
+    pci = pci_create_simple_multifunction(pci_bus, PCI_DEVFN(10, 0), true,
                                           TYPE_PIIX4_PCI_DEVICE);
-    dev = DEVICE(pci);
 
-    if (smbus) {
-        *smbus = piix4_pm_init(pci_bus, devfn + 3, 0x1100,
-                               qdev_get_gpio_in_named(dev, "isa", 9),
-                               NULL, 0, NULL);
-    }
-
-    return dev;
+    return pci;
 }
diff --git a/hw/mips/malta.c b/hw/mips/malta.c
index e446b25ad0..d4bd3549d0 100644
--- a/hw/mips/malta.c
+++ b/hw/mips/malta.c
@@ -1238,6 +1238,7 @@ void mips_malta_init(MachineState *machine)
     int be;
     MaltaState *s;
     DeviceState *dev;
+    PCIDevice *piix4;
 
     s = MIPS_MALTA(qdev_new(TYPE_MIPS_MALTA));
     sysbus_realize_and_unref(SYS_BUS_DEVICE(s), &error_fatal);
@@ -1399,8 +1400,12 @@ void mips_malta_init(MachineState *machine)
     empty_slot_init("GT64120", 0, 0x20000000);
 
     /* Southbridge */
-    dev = piix4_create(pci_bus, &smbus);
+    piix4 = piix4_create(pci_bus);
+    dev = DEVICE(piix4);
     isa_bus = ISA_BUS(qdev_get_child_bus(dev, "isa.0"));
+    smbus = piix4_pm_init(pci_bus, piix4->devfn + 3, 0x1100,
+                          qdev_get_gpio_in_named(dev, "isa", 9),
+                          NULL, 0, NULL);
 
     /* Interrupt controller */
     qdev_connect_gpio_out_named(dev, "intr", 0, i8259_irq);
diff --git a/include/hw/southbridge/piix.h b/include/hw/southbridge/piix.h
index b768109f30..bea3b44551 100644
--- a/include/hw/southbridge/piix.h
+++ b/include/hw/southbridge/piix.h
@@ -74,6 +74,6 @@ DECLARE_INSTANCE_CHECKER(PIIX3State, PIIX3_PCI_DEVICE,
 
 PIIX3State *piix3_create(PCIBus *pci_bus);
 
-DeviceState *piix4_create(PCIBus *pci_bus, I2CBus **smbus);
+PCIDevice *piix4_create(PCIBus *pci_bus);
 
 #endif
-- 
2.36.1


