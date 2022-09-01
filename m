Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C35CE5A964B
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 14:05:58 +0200 (CEST)
Received: from localhost ([::1]:47340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTixE-0008Fo-NH
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 08:05:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oTiaO-0005gm-H6; Thu, 01 Sep 2022 07:42:28 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:35405)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oTiaB-0000Dw-QB; Thu, 01 Sep 2022 07:42:16 -0400
Received: by mail-ed1-x52a.google.com with SMTP id y64so10367630ede.2;
 Thu, 01 Sep 2022 04:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=ccpcYMGxqn8WXNFI2X2jCqAbkQ1k7CgYSp60BbZylhE=;
 b=iqbli/39aER7igdJYGEFqVX1qsgLdgnLDw42n246gSecn2zicCRl52uF6JEZ41GlrZ
 GEFHJNStdj/qZd6jrpKahHwh5XQ/P+0X4Osxlc64WWjkrKhC3ct+E6EqJRanXBi5yxfS
 QKfIB2FHDUurebodfmPsQlqdU6yBc8RHC67fu5ufRmE/0OuAvlCg4w5B7HVbf6z36D6P
 BUJa5puRd9QtTcS8g5c8brA2dc0bUFTBUFYdhKbgDAnm0XSmHEuXSIiKiiv/+DohZwFT
 mBB3S2e/BipoFjtGR+XdDXlBc5D39mGHMrvLTNlDO54SUWaoUiOCS+w51w1wVH0Ib7P5
 Muzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=ccpcYMGxqn8WXNFI2X2jCqAbkQ1k7CgYSp60BbZylhE=;
 b=DIm+VOy81c4+350gu8A2ChLw0tAvy9cHLWtrJzl12KC0lukRzTjoegIPIx7ToDbAEz
 Xj/ywOq63xKGTNXJIX2TBLIYOHPgC5ptWlVn7rfJybCKL1aomhjDTKjmVfnEhun0ivIA
 4gt/ZSFQJGy5FepPulB0C8wQNNz1xqX/34UwUj2wzlN5sJ7mTNtQxgfvHUIIol2SSPXq
 bg76Qu2x1Tv2Cx0Vt/U5HZ74Si/s+ey040CabtJgjYdQ9U+TeIYrCIGWWy9Oh2Js8IpN
 XsGLPoz7CnuROAQ1atjszMRPkaoRLpueTUIhoYrr2gZg0hVa9OID+wW0Bmnz97JXYSsa
 bD6Q==
X-Gm-Message-State: ACgBeo2/0c5tQJ9FHMs+6GuMAi/NEtwZ7PsISF24t8LP0aryPtgoZO8Q
 tWI08AZfNKZnyjZsl69KKmsqiyT4zzw=
X-Google-Smtp-Source: AA6agR7Zg6o29Rz6zPcOtZwtBweIx7ldXgBdi/Lg2HPCh0hLmQKaWYrBmXFbuIrcQFrUBsbjwSjxYg==
X-Received: by 2002:a05:6402:27d3:b0:43e:5490:27ca with SMTP id
 c19-20020a05640227d300b0043e549027camr29223507ede.307.1662032519040; 
 Thu, 01 Sep 2022 04:41:59 -0700 (PDT)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 f12-20020a17090660cc00b0073ddb2eff27sm8387455ejk.167.2022.09.01.04.41.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Sep 2022 04:41:58 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, John Snow <jsnow@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 BALATON Zoltan <balaton@eik.bme.hu>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v5 02/13] hw/isa/vt82c686: Resolve unneeded attribute
Date: Thu,  1 Sep 2022 13:41:16 +0200
Message-Id: <20220901114127.53914-3-shentey@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220901114127.53914-1-shentey@gmail.com>
References: <20220901114127.53914-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52a.google.com
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

Now that also the super io device is realized in the common realize method,
the isa_bus attribute can be turned into a temporary.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/isa/vt82c686.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
index 0217c98fe4..9d12e1cae4 100644
--- a/hw/isa/vt82c686.c
+++ b/hw/isa/vt82c686.c
@@ -543,7 +543,6 @@ struct ViaISAState {
     PCIDevice dev;
     qemu_irq cpu_intr;
     qemu_irq *isa_irqs;
-    ISABus *isa_bus;
     ViaSuperIOState via_sio;
 };
 
@@ -585,17 +584,18 @@ static void via_isa_realize(PCIDevice *d, Error **errp)
     ViaISAState *s = VIA_ISA(d);
     DeviceState *dev = DEVICE(d);
     qemu_irq *isa_irq;
+    ISABus *isa_bus;
     int i;
 
     qdev_init_gpio_out(dev, &s->cpu_intr, 1);
     isa_irq = qemu_allocate_irqs(via_isa_request_i8259_irq, s, 1);
-    s->isa_bus = isa_bus_new(dev, get_system_memory(), pci_address_space_io(d),
+    isa_bus = isa_bus_new(dev, get_system_memory(), pci_address_space_io(d),
                           &error_fatal);
-    s->isa_irqs = i8259_init(s->isa_bus, *isa_irq);
-    isa_bus_irqs(s->isa_bus, s->isa_irqs);
-    i8254_pit_init(s->isa_bus, 0x40, 0, NULL);
-    i8257_dma_init(s->isa_bus, 0);
-    mc146818_rtc_init(s->isa_bus, 2000, NULL);
+    s->isa_irqs = i8259_init(isa_bus, *isa_irq);
+    isa_bus_irqs(isa_bus, s->isa_irqs);
+    i8254_pit_init(isa_bus, 0x40, 0, NULL);
+    i8257_dma_init(isa_bus, 0);
+    mc146818_rtc_init(isa_bus, 2000, NULL);
 
     for (i = 0; i < PCI_CONFIG_HEADER_SIZE; i++) {
         if (i < PCI_COMMAND || i >= PCI_REVISION_ID) {
@@ -604,7 +604,7 @@ static void via_isa_realize(PCIDevice *d, Error **errp)
     }
 
     /* Super I/O */
-    if (!qdev_realize(DEVICE(&s->via_sio), BUS(s->isa_bus), errp)) {
+    if (!qdev_realize(DEVICE(&s->via_sio), BUS(isa_bus), errp)) {
         return;
     }
 }
-- 
2.37.3


