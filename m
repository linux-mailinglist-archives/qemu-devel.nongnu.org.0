Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4215153D1F3
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jun 2022 20:57:12 +0200 (CEST)
Received: from localhost ([::1]:57814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nxCTv-0007DH-AI
	for lists+qemu-devel@lfdr.de; Fri, 03 Jun 2022 14:57:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nxCOB-0007DF-0W
 for qemu-devel@nongnu.org; Fri, 03 Jun 2022 14:51:16 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:37773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nxCO9-0004BC-Dj
 for qemu-devel@nongnu.org; Fri, 03 Jun 2022 14:51:14 -0400
Received: by mail-ej1-x62f.google.com with SMTP id gl15so3736507ejb.4
 for <qemu-devel@nongnu.org>; Fri, 03 Jun 2022 11:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=z2E0qTaPT0rwn/y0lNnZ/aNt1ZAGrawia4pom9sqpdw=;
 b=WNAaVTapejdu7NDn2BAGoV9512worsjW+Oa5ASgUHmOEh2IGXHvnQWkSSJ/Zu+PMt8
 TuwVIHOvSkXYCU/nXjXFqzW8SGPcHPnFuOnQbbNQkkxrtOsJeXdLZsqIrSKNNNIlnUmc
 MVkwkBIFoXy5B6AMsxSy0pLd9ZmxFYcGqSGMq7CTUm9fCJ5r2qxOjHEHLrW6+etTPsSL
 NCzJ/5gYMWwmcZvE3Fc7uxJ5lDPN56QugGb/aJCuIcUE9ZFKkFJNf1JlA2AwzqzVmTL3
 q0sOEsBWgZkqkLkSgrqsbrbp0eKs6v4+xWCPozkFrbB5yzlh8Ox1WqK6SxfwkVAc1nPM
 U27w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=z2E0qTaPT0rwn/y0lNnZ/aNt1ZAGrawia4pom9sqpdw=;
 b=sX9SicD88KuDGYnXffgfIF+HpEAYdZxt3oIwEcI22ch/jXH1nYKzcsennRFxLOJ5U/
 lKic6fW641JoOZQNsOWfSfwXj3vo9Km+BjfwSL2Kh6VY3qZqfosKZBW8Zj3vDHbTRZJJ
 /HdAoz8FQmkGMZ8gfUG3qZraH2hjMRnWshfJ6hmXQPPEDDhypRdCQncbYvZgU2lnnlJ0
 ZHRgFaVQmz0R25AlCQ5d5adU6dGPs2kIkFP9ausSCgKn+MgaSUMGTfWnqiAXmmQz5Bwe
 scAvYao9ds3T6VVvDxIWIRhHSDWij/mhMxrhTI/HFoI/Yv/RsQe195Y80eTX51q+Tepv
 Cdyw==
X-Gm-Message-State: AOAM533JAtpCgB+qgxJkOyst+sdqiunIEb3P3A1OBYtvzqKIyMHiANZD
 URt1yUDAyY+tfBbmBWr0QcvTFST4RyXDBg==
X-Google-Smtp-Source: ABdhPJyri6RdwNn92N0sCtiTa1ATygvi+4UANLSAGGzVRQIDocxQEe8dfBYpxHXRe9V46gqWDx+LOg==
X-Received: by 2002:a17:907:7642:b0:706:fd3a:61f0 with SMTP id
 kj2-20020a170907764200b00706fd3a61f0mr9785725ejc.503.1654282271729; 
 Fri, 03 Jun 2022 11:51:11 -0700 (PDT)
Received: from osoxes.fritz.box (pd9ed79c4.dip0.t-ipconnect.de.
 [217.237.121.196]) by smtp.gmail.com with ESMTPSA id
 f25-20020a170906139900b006fe8c831632sm3066160ejc.73.2022.06.03.11.51.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jun 2022 11:51:11 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Bernhard Beschow <shentey@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: [PATCH v4 08/11] hw/isa/piix3: Move pci_map_irq_fn near pci_set_irq_fn
Date: Fri,  3 Jun 2022 20:50:42 +0200
Message-Id: <20220603185045.143789-9-shentey@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220603185045.143789-1-shentey@gmail.com>
References: <20220603185045.143789-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62f.google.com
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

The pci_map_irq_fn was implemented below type_init() which made it
inaccessible to QOM functions. So move it up.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/isa/piix3.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/hw/isa/piix3.c b/hw/isa/piix3.c
index d96ce2b788..c7a9014c3f 100644
--- a/hw/isa/piix3.c
+++ b/hw/isa/piix3.c
@@ -78,6 +78,17 @@ static void piix3_set_irq(void *opaque, int pirq, int level)
     piix3_set_irq_level(piix3, pirq, level);
 }
 
+/*
+ * Return the global irq number corresponding to a given device irq
+ * pin. We could also use the bus number to have a more precise mapping.
+ */
+static int pci_slot_get_pirq(PCIDevice *pci_dev, int pci_intx)
+{
+    int slot_addend;
+    slot_addend = PCI_SLOT(pci_dev->devfn) - 1;
+    return (pci_intx + slot_addend) & 3;
+}
+
 static PCIINTxRoute piix3_route_intx_pin_to_irq(void *opaque, int pin)
 {
     PIIX3State *piix3 = opaque;
@@ -350,17 +361,6 @@ static void piix3_register_types(void)
 
 type_init(piix3_register_types)
 
-/*
- * Return the global irq number corresponding to a given device irq
- * pin. We could also use the bus number to have a more precise mapping.
- */
-static int pci_slot_get_pirq(PCIDevice *pci_dev, int pci_intx)
-{
-    int slot_addend;
-    slot_addend = PCI_SLOT(pci_dev->devfn) - 1;
-    return (pci_intx + slot_addend) & 3;
-}
-
 PIIX3State *piix3_create(PCIBus *pci_bus, ISABus **isa_bus)
 {
     PIIX3State *piix3;
-- 
2.36.1


