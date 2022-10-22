Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9430960971F
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 00:52:10 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1omhnQ-0002xM-Dv
	for lists+qemu-devel@lfdr.de; Sun, 23 Oct 2022 16:42:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1omG60-0007S9-6E; Sat, 22 Oct 2022 11:07:32 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1omG5y-0002Pr-JP; Sat, 22 Oct 2022 11:07:32 -0400
Received: by mail-ed1-x52f.google.com with SMTP id a67so16066245edf.12;
 Sat, 22 Oct 2022 08:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fUGUGivQ0Hw1LB0M40AIJlWoe8nfJMmiN51vk7xeYBA=;
 b=BnZiI3A3As5rhVarEfdNsCIRbHzEWr769KpKIEpm0jFY3IPBsLBQRUkibOqnh7vv1Z
 snHuHb7gMKiB+8lRkRk4OaJO8TNxYxJs+vFphqLkjF1poGSk1JCW0Ce1lXDUjUiZLgGn
 zRwdyyX6+2czVCEeT4TVMA/XbplsW2HIcpo2H+t+KGxPBbISs3VUTXmpeKfzbq+O5bCa
 Akwou6mc0Muu43dFgoUOqvyKAePfZaM0aCro0vGQa/p8mVRCFPastZR+JijeS/h65Xqc
 PtHh8Wv9/y5cCUjVPAyOC8HnFUfdSOEedmeHgBNXvCQy2H6q4C3+BC8FW8B651xWTImI
 21XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fUGUGivQ0Hw1LB0M40AIJlWoe8nfJMmiN51vk7xeYBA=;
 b=g9ae8TKmKa1AmBGlgFJmpNe3sCrbvtUo/cDaw3HEOtr8jYXrHa69TvOjOs57yjas4k
 T1o1VipY/D0hxMxpiTD/Cepbg/RU1jIUmZwnONyP948MsAXUfpvqp4orh5rHvHMCp0ro
 vbgBzqeL7sOOIG2YaoxhagkhQcfztcYvzZ4ZTL7a8hZDXfDdM+O9tO+xXoMqk44pPcyL
 nRaxN+v+Qgo93i+aR8UqCl/cw3n/vQo+XrndTVWKBP1wvl1CMTyom+kMW43a4iM5+Btk
 QRYhgaNVTGENGUVJcfQDarHgnEjnWadwRDmWLdjPdfqqWOLdf3joum+u8kFiZbN8/IBO
 NBRQ==
X-Gm-Message-State: ACrzQf1YQxueWMJB+Fdgttvh76gJjGaJj/VCu/KSaMKAvcYCifbi86qe
 u+0jUDyT4lyfav6QGBKVzLr9SNiOtNz66A==
X-Google-Smtp-Source: AMsMyM4RarnlyMJm/K0cz4EJsMng54LUv5hXAhaKLK9/kjW0tCUL1r4o/3eiP2UJTdk6CUNidqRhqA==
X-Received: by 2002:a17:906:4fcd:b0:78d:4b28:9d57 with SMTP id
 i13-20020a1709064fcd00b0078d4b289d57mr19963275ejw.303.1666451248551; 
 Sat, 22 Oct 2022 08:07:28 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-077-191-171-138.77.191.pool.telefonica.de. [77.191.171.138])
 by smtp.gmail.com with ESMTPSA id
 4-20020a170906310400b00780ab5a9116sm13021558ejx.211.2022.10.22.08.07.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Oct 2022 08:07:27 -0700 (PDT)
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
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v2 40/43] hw/isa/piix: Consolidate IRQ triggering
Date: Sat, 22 Oct 2022 17:05:05 +0200
Message-Id: <20221022150508.26830-41-shentey@gmail.com>
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

Speeds up PIIX4 which resolves an old TODO.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/isa/piix.c | 26 +++-----------------------
 1 file changed, 3 insertions(+), 23 deletions(-)

diff --git a/hw/isa/piix.c b/hw/isa/piix.c
index 446105a7a1..4ced9995f9 100644
--- a/hw/isa/piix.c
+++ b/hw/isa/piix.c
@@ -84,27 +84,6 @@ static void piix_set_irq(void *opaque, int pirq, int level)
     piix_set_irq_level(piix, pirq, level);
 }
 
-static void piix4_set_irq(void *opaque, int irq_num, int level)
-{
-    int i, pic_irq, pic_level;
-    PIIXState *s = opaque;
-    PCIBus *bus = pci_get_bus(&s->dev);
-
-    /* now we change the pic irq level according to the piix irq mappings */
-    /* XXX: optimize */
-    pic_irq = s->dev.config[PIIX_PIRQCA + irq_num];
-    if (pic_irq < ISA_NUM_IRQS) {
-        /* The pic level is the logical OR of all the PCI irqs mapped to it. */
-        pic_level = 0;
-        for (i = 0; i < PIIX_NUM_PIRQS; i++) {
-            if (pic_irq == s->dev.config[PIIX_PIRQCA + i]) {
-                pic_level |= pci_bus_get_irq_level(bus, i);
-            }
-        }
-        qemu_set_irq(s->pic.in_irqs[pic_irq], pic_level);
-    }
-}
-
 /*
  * Return the global irq number corresponding to a given device irq
  * pin. We could also use the bus number to have a more precise mapping.
@@ -276,7 +255,7 @@ static int piix4_post_load(void *opaque, int version_id)
         s->rcr = 0;
     }
 
-    return 0;
+    return piix3_post_load(opaque, version_id);
 }
 
 static int piix3_pre_save(void *opaque)
@@ -586,7 +565,7 @@ static void piix4_realize(PCIDevice *dev, Error **errp)
     /* RTC */
     s->rtc.irq = qdev_get_gpio_in(DEVICE(&s->pic), s->rtc.isairq);
 
-    pci_bus_irqs(pci_bus, piix4_set_irq, piix4_pci_slot_get_pirq, s,
+    pci_bus_irqs(pci_bus, piix_set_irq, piix4_pci_slot_get_pirq, s,
                  PIIX_NUM_PIRQS);
 }
 
@@ -604,6 +583,7 @@ static void piix4_class_init(ObjectClass *klass, void *data)
     DeviceClass *dc = DEVICE_CLASS(klass);
     PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
 
+    k->config_write = piix_write_config;
     k->realize = piix4_realize;
     k->vendor_id = PCI_VENDOR_ID_INTEL;
     k->device_id = PCI_DEVICE_ID_INTEL_82371AB_0;
-- 
2.38.1


