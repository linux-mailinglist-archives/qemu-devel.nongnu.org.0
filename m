Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D2FF6EB9E4
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Apr 2023 17:10:22 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqEq3-0001sx-Bl; Sat, 22 Apr 2023 11:07:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pqEq0-0001o5-57; Sat, 22 Apr 2023 11:07:44 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pqEpy-00059P-Gn; Sat, 22 Apr 2023 11:07:43 -0400
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-94f32588c13so373844266b.2; 
 Sat, 22 Apr 2023 08:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682176060; x=1684768060;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=muBkECbZkz3PPDQCsG7ydl9JvU+1aeqdPslh1wRssVc=;
 b=Aq0XsN9TtSS0usTAlTJ7nP0eM4bVGNN/vkUQ3ZCCeLWPEnmpPNdpI/F898OQ9hX9+z
 7LNd0R6ePJKSf2+8m0qy0N3+qr1iha1OAjUbvet2j0Q8ofkJq/lrRZkTsxcqemktCEWL
 ZfiSGqvszQzmG7iie4lJ7Ejo6gG9+JQsEqE4fQwbEs2RjeQQt+7npEs45dHVYI2I3TbU
 6zXnI1H33pnCk0kc9DLLieDI3OXwduDcNQRlsy4kZiayIPix2P3YLSiP1mkxsDYUMtBa
 7fYrc7yAGdTN0mYl/MJEaXPz56qkLuUh8Il/8MCT0EY06muC8yrCnCNC6VW0VVVlVu+D
 DOcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682176060; x=1684768060;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=muBkECbZkz3PPDQCsG7ydl9JvU+1aeqdPslh1wRssVc=;
 b=OeXCtKjC87RAlmXOhu9F9cOlwsZxZQpOgidcS0X40uKR6LCA8V6ZyssWpQrFld4a8r
 a2v3pcxGeAQVuct15A90f4uPvt00E+qNd8jXN2vnGUr2KNasqV1WszTkOcvXD6QPfCLo
 cmYvQ5OT2b+uiarCjlWmnCAFuFi5Uy3ZSH9AwN/Vu83BjnHgFFxQU7lwQxzNIGZHnU/1
 5MgwwSXc0or2Iw7BMPtmO9pi4YzpzkbyXZTlMjup0zlVPYZb7FiUc+qvGlQgYiwvCtgY
 7UdHNf+tdu5dH0L2mq66laQcEmqIwZac3OM9/r76K8nxH8j3t4BAXAiEgqHmiOWMKDJV
 aVYw==
X-Gm-Message-State: AAQBX9ejia4M80d554lL9e11Mcczn2bMGi8uBu1MA4NaSeAZp09iXOYU
 WC7QSkzOIF5L3xr4szIB7VC8xrvl9zE=
X-Google-Smtp-Source: AKy350blfDzx1ILyqcWMTq7PQfkUAa8BUu7Mu3klKw2iqDBnIADattD6xvPmbwFPnxuRsXY/TDk5JA==
X-Received: by 2002:a17:906:7d6:b0:957:2d2a:e8a2 with SMTP id
 m22-20020a17090607d600b009572d2ae8a2mr4386577ejc.27.1682176060066; 
 Sat, 22 Apr 2023 08:07:40 -0700 (PDT)
Received: from Provence.localdomain
 (dynamic-077-191-017-015.77.191.pool.telefonica.de. [77.191.17.15])
 by smtp.gmail.com with ESMTPSA id
 e7-20020a170906844700b0094f7b713e40sm3300108ejy.126.2023.04.22.08.07.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Apr 2023 08:07:39 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 BALATON Zoltan <balaton@eik.bme.hu>, John Snow <jsnow@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-ppc@nongnu.org, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 04/13] hw/ide: Extract IDEBus assignment into bmdma_init()
Date: Sat, 22 Apr 2023 17:07:19 +0200
Message-Id: <20230422150728.176512-5-shentey@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230422150728.176512-1-shentey@gmail.com>
References: <20230422150728.176512-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62e.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Every invocation of bmdma_init() is followed by `d->bmdma[i].bus = &d->bus[i]`.
Resolve this redundancy by extracting it into bmdma_init().

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/ide/cmd646.c  | 1 -
 hw/ide/pci.c     | 1 +
 hw/ide/piix.c    | 1 -
 hw/ide/sii3112.c | 1 -
 hw/ide/via.c     | 1 -
 5 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/hw/ide/cmd646.c b/hw/ide/cmd646.c
index a68357c1c5..a094a6e12a 100644
--- a/hw/ide/cmd646.c
+++ b/hw/ide/cmd646.c
@@ -297,7 +297,6 @@ static void pci_cmd646_ide_realize(PCIDevice *dev, Error **errp)
         ide_bus_init_output_irq(&d->bus[i], qdev_get_gpio_in(ds, i));
 
         bmdma_init(&d->bus[i], &d->bmdma[i], d);
-        d->bmdma[i].bus = &d->bus[i];
         ide_bus_register_restart_cb(&d->bus[i]);
     }
 }
diff --git a/hw/ide/pci.c b/hw/ide/pci.c
index 942e216b9b..67e0998ff0 100644
--- a/hw/ide/pci.c
+++ b/hw/ide/pci.c
@@ -519,6 +519,7 @@ void bmdma_init(IDEBus *bus, BMDMAState *bm, PCIIDEState *d)
     bus->dma = &bm->dma;
     bm->irq = bus->irq;
     bus->irq = qemu_allocate_irq(bmdma_irq, bm, 0);
+    bm->bus = bus;
     bm->pci_dev = d;
 }
 
diff --git a/hw/ide/piix.c b/hw/ide/piix.c
index 41d60921e3..a32f7ccece 100644
--- a/hw/ide/piix.c
+++ b/hw/ide/piix.c
@@ -144,7 +144,6 @@ static bool pci_piix_init_bus(PCIIDEState *d, unsigned i, Error **errp)
     ide_bus_init_output_irq(&d->bus[i], isa_get_irq(NULL, port_info[i].isairq));
 
     bmdma_init(&d->bus[i], &d->bmdma[i], d);
-    d->bmdma[i].bus = &d->bus[i];
     ide_bus_register_restart_cb(&d->bus[i]);
 
     return true;
diff --git a/hw/ide/sii3112.c b/hw/ide/sii3112.c
index f9becdff8e..5dd3d03c29 100644
--- a/hw/ide/sii3112.c
+++ b/hw/ide/sii3112.c
@@ -287,7 +287,6 @@ static void sii3112_pci_realize(PCIDevice *dev, Error **errp)
         ide_bus_init_output_irq(&s->bus[i], qdev_get_gpio_in(ds, i));
 
         bmdma_init(&s->bus[i], &s->bmdma[i], s);
-        s->bmdma[i].bus = &s->bus[i];
         ide_bus_register_restart_cb(&s->bus[i]);
     }
 }
diff --git a/hw/ide/via.c b/hw/ide/via.c
index 0caae52276..91253fa4ef 100644
--- a/hw/ide/via.c
+++ b/hw/ide/via.c
@@ -196,7 +196,6 @@ static void via_ide_realize(PCIDevice *dev, Error **errp)
         ide_bus_init_output_irq(&d->bus[i], qdev_get_gpio_in(ds, i));
 
         bmdma_init(&d->bus[i], &d->bmdma[i], d);
-        d->bmdma[i].bus = &d->bus[i];
         ide_bus_register_restart_cb(&d->bus[i]);
     }
 }
-- 
2.40.0


