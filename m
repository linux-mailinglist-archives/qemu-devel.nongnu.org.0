Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D58E609931
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 06:37:19 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1omgtD-00038t-UH
	for lists+qemu-devel@lfdr.de; Sun, 23 Oct 2022 15:44:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1omG4i-00074q-4N; Sat, 22 Oct 2022 11:06:13 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1omG4g-00024q-DY; Sat, 22 Oct 2022 11:06:11 -0400
Received: by mail-ed1-x52f.google.com with SMTP id w8so13811160edc.1;
 Sat, 22 Oct 2022 08:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cKZqib3fhm1kepMM6SwFFivJWeCKSjR8Aa5Vv4oIg6E=;
 b=R+8/rKBU7onKIoUJALsHXr7Ajv0uRGLYyXcL41twYvbvkKFB62s9DvdNB6arJlqDb7
 i6FmJn5S1R1vq6YOd9VBKp5nE2693eeFvjppZ1fyvlKMdKukZcBx3LH8gOD8NREP7qY2
 fb276KxhF/MCBmv+Cv+yf9eYk2ikgFdEMUbxmubHk83At7hYcLmM0cfgjiuUBFJryxpC
 80/E/Sf/LQ84Cr61aRFz63nhOK1+7DoVQPMQdaRJMtZ0/cq6s0aRuPvX1cEyf9JUOR4g
 MKabEVUHxhumH6Fx8r+3kTa9D64bmN1AsgGsEYF7DoJ5RcgXaiaLuDfl4xsQ0k/N1pyw
 gvNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cKZqib3fhm1kepMM6SwFFivJWeCKSjR8Aa5Vv4oIg6E=;
 b=bHz2ytapiyCuvhj0rGUvKA0b2VRITeibAxh1sBDNmFJec3jUQi+dTaMLf424UCdkUf
 ++bAV0H8a1TJ0e5sAFPjegwWg4nmaGV3V/8pYWehfzSGSy1nWRX+XpzUDcFELq1iIgqy
 HrJkKUDCrIKlmjtFS20nGNHpPmlYej3GXKz4boXw4s+glcEz160JItRgb7yhzYDqpBru
 9JZJ02OZgWg67zlufc+3QGJdtA1uMkmOzI38IEBfysRD04bqs1oZ3GP+0r/ETZvkQ8Y6
 InRuKF0MKIaEXmcS0ejEbE/UWRdkDYXp9QZs6mcvYdrZI7/DadDmJ1iZa35ADCKuxAWc
 AmgQ==
X-Gm-Message-State: ACrzQf180OgQakKdgSRmxtWB447ZBMOCzZ8JFpQtU9I5norYFdFAuQ4n
 DebzZ9Qe5FTJfrHnDiR82wsJ6vBfHHbUbw==
X-Google-Smtp-Source: AMsMyM73l5JfljiaC/NoU+nOEOn+Ym82rHyXMEE6T+lrVf1d5uh7Ft+T8/sEpYqqECxOK1yHGr1ZLQ==
X-Received: by 2002:a17:907:9495:b0:78e:1bee:5919 with SMTP id
 dm21-20020a170907949500b0078e1bee5919mr19914510ejc.701.1666451168466; 
 Sat, 22 Oct 2022 08:06:08 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-077-191-171-138.77.191.pool.telefonica.de. [77.191.171.138])
 by smtp.gmail.com with ESMTPSA id
 4-20020a170906310400b00780ab5a9116sm13021558ejx.211.2022.10.22.08.06.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Oct 2022 08:06:07 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Igor Mammedov <imammedo@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, John Snow <jsnow@redhat.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Ani Sinha <ani@anisinha.ca>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-block@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Bernhard Beschow <shentey@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: [PATCH v2 08/43] hw/ide/piix: Introduce TYPE_ macros for PIIX IDE
 controllers
Date: Sat, 22 Oct 2022 17:04:33 +0200
Message-Id: <20221022150508.26830-9-shentey@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221022150508.26830-1-shentey@gmail.com>
References: <20221022150508.26830-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Suggested-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/i386/pc_piix.c     | 3 ++-
 hw/ide/piix.c         | 5 +++--
 hw/isa/piix4.c        | 3 ++-
 include/hw/ide/piix.h | 7 +++++++
 4 files changed, 14 insertions(+), 4 deletions(-)
 create mode 100644 include/hw/ide/piix.h

diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 5caef9bfc9..e26509a935 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -40,6 +40,7 @@
 #include "hw/usb.h"
 #include "net/net.h"
 #include "hw/ide/pci.h"
+#include "hw/ide/piix.h"
 #include "hw/irq.h"
 #include "sysemu/kvm.h"
 #include "hw/kvm/clock.h"
@@ -260,7 +261,7 @@ static void pc_init1(MachineState *machine,
     if (pcmc->pci_enabled) {
         PCIDevice *dev;
 
-        dev = pci_create_simple(pci_bus, piix3_devfn + 1, "piix3-ide");
+        dev = pci_create_simple(pci_bus, piix3_devfn + 1, TYPE_PIIX3_IDE);
         pci_ide_create_devs(dev);
         idebus[0] = qdev_get_child_bus(&dev->qdev, "ide.0");
         idebus[1] = qdev_get_child_bus(&dev->qdev, "ide.1");
diff --git a/hw/ide/piix.c b/hw/ide/piix.c
index de1f4f0efb..267dbf37db 100644
--- a/hw/ide/piix.c
+++ b/hw/ide/piix.c
@@ -36,6 +36,7 @@
 #include "sysemu/blockdev.h"
 #include "sysemu/dma.h"
 
+#include "hw/ide/piix.h"
 #include "hw/ide/pci.h"
 #include "trace.h"
 
@@ -202,7 +203,7 @@ static void piix3_ide_class_init(ObjectClass *klass, void *data)
 }
 
 static const TypeInfo piix3_ide_info = {
-    .name          = "piix3-ide",
+    .name          = TYPE_PIIX3_IDE,
     .parent        = TYPE_PCI_IDE,
     .class_init    = piix3_ide_class_init,
 };
@@ -224,7 +225,7 @@ static void piix4_ide_class_init(ObjectClass *klass, void *data)
 }
 
 static const TypeInfo piix4_ide_info = {
-    .name          = "piix4-ide",
+    .name          = TYPE_PIIX4_IDE,
     .parent        = TYPE_PCI_IDE,
     .class_init    = piix4_ide_class_init,
 };
diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
index c88d3bf3bf..e05e65d3bc 100644
--- a/hw/isa/piix4.c
+++ b/hw/isa/piix4.c
@@ -28,6 +28,7 @@
 #include "hw/irq.h"
 #include "hw/southbridge/piix.h"
 #include "hw/pci/pci.h"
+#include "hw/ide/piix.h"
 #include "hw/isa/isa.h"
 #include "hw/intc/i8259.h"
 #include "hw/dma/i8257.h"
@@ -277,7 +278,7 @@ static void piix4_init(Object *obj)
     PIIX4State *s = PIIX4_PCI_DEVICE(obj);
 
     object_initialize_child(obj, "rtc", &s->rtc, TYPE_MC146818_RTC);
-    object_initialize_child(obj, "ide", &s->ide, "piix4-ide");
+    object_initialize_child(obj, "ide", &s->ide, TYPE_PIIX4_IDE);
     object_initialize_child(obj, "uhci", &s->uhci, "piix4-usb-uhci");
 
     object_initialize_child(obj, "pm", &s->pm, TYPE_PIIX4_PM);
diff --git a/include/hw/ide/piix.h b/include/hw/ide/piix.h
new file mode 100644
index 0000000000..ef3ef3d62d
--- /dev/null
+++ b/include/hw/ide/piix.h
@@ -0,0 +1,7 @@
+#ifndef HW_IDE_PIIX_H
+#define HW_IDE_PIIX_H
+
+#define TYPE_PIIX3_IDE "piix3-ide"
+#define TYPE_PIIX4_IDE "piix4-ide"
+
+#endif /* HW_IDE_PIIX_H */
-- 
2.38.1


