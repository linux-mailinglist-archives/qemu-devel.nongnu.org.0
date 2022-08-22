Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E32FF59CBCC
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 00:54:26 +0200 (CEST)
Received: from localhost ([::1]:49732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQGJO-0001Dn-1o
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 18:54:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oQGAD-000466-4C; Mon, 22 Aug 2022 18:44:57 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:43944)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oQGAB-0007zj-Jc; Mon, 22 Aug 2022 18:44:56 -0400
Received: by mail-ej1-x62a.google.com with SMTP id gb36so24050030ejc.10;
 Mon, 22 Aug 2022 15:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=zz3CeQemEBsnadYMwoFXVLzgOCRsBVHg7xyGX7xks9Y=;
 b=gCO+cL5Ra1H6alXR2vNqn8tOCt6EWKi3vZ4oTOlxPeQglnqE0+HnV0s32jDNDxO77h
 hoz0DJHmKXBswmBurHXjyrDxMDuevUkPw88zcTS66HuR8hmyt9Jy4bxb6BWOhHOiHNI4
 iqICao+w9/xl6Se2Rnp4tJ9x60GDfMVAsOusSJ5NV76oQUpIGjRV0Ew3tRb9Mx64AF9C
 MOFUsTkYkqpuZZj45qYowd4cVaijp3hv7B376WgbeYQKv8rIWXoCOnjnZh1+v7pUmXfa
 u9FFHgVTtJBdwZAoiXFKUFA6evFrCk6kRvRJua9YOL8938dTpT5eu1bneqPtIFmQmk1q
 YghQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=zz3CeQemEBsnadYMwoFXVLzgOCRsBVHg7xyGX7xks9Y=;
 b=YnR6oPHfztGHxnHtxG8egGOlMyxqTHWNQtekE0BVvt+ETfOYXmUQkXjWR124N+USEv
 KDJSoWDXYOHzqFMhqv7uemfmIlEpZeRsQM+ZRnTDMao0CcpgfMKJXGibXqLmXxTpLLC1
 vl5dUertPcq6GRMsFuUo8r7gAC2kguVDP8qo9QCcVBxL+rEwzjLy3r/NkB0q1cfyA+rB
 SfzT94YZRJ/4Yv1+prQE6DXupz0yz0qGS+c2kAzoBjo6nLnbcQiGc4weffpLXDYFZsWY
 X0nFK6nGtMUhXX/4+K/raWMI1hiX9RWyckX7SYWT5QTmzpvX2EypQXet1d+s7fLbNAoh
 mDrg==
X-Gm-Message-State: ACgBeo0K8jvuvblAE8NqDgwxPj4mYt05t+sZ8usqJDdxwvCPB4m7xiTQ
 CB+RJIb7JUEjC7TnGp/Of0O5jYjeoPg=
X-Google-Smtp-Source: AA6agR5FKUD4Qs1l9Yav6vJSmTFqYdBTXBERCrmJ/2TK/A8pD7cJw337IcMHh/MJQIeOICqs398mww==
X-Received: by 2002:a17:907:a043:b0:73d:92f5:33ee with SMTP id
 gz3-20020a170907a04300b0073d92f533eemr1660326ejc.432.1661208293107; 
 Mon, 22 Aug 2022 15:44:53 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-077-183-070-107.77.183.pool.telefonica.de. [77.183.70.107])
 by smtp.gmail.com with ESMTPSA id
 o4-20020a170906768400b0073d7b876621sm2455758ejm.205.2022.08.22.15.44.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 15:44:52 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>, BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Huacai Chen <chenhuacai@kernel.org>, qemu-ppc@nongnu.org,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 8/9] hw/isa/vt82c686: QOM'ify RTC creation
Date: Tue, 23 Aug 2022 00:43:54 +0200
Message-Id: <20220822224355.11753-9-shentey@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220822224355.11753-1-shentey@gmail.com>
References: <20220822224355.11753-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62a.google.com
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

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/isa/vt82c686.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
index 47f2fd2669..ee745d5d49 100644
--- a/hw/isa/vt82c686.c
+++ b/hw/isa/vt82c686.c
@@ -546,6 +546,7 @@ struct ViaISAState {
     qemu_irq cpu_intr;
     qemu_irq *isa_irqs;
     ViaSuperIOState via_sio;
+    RTCState rtc;
     PCIIDEState ide;
     UHCIState uhci[2];
     ViaPMState pm;
@@ -567,6 +568,7 @@ static void via_isa_init(Object *obj)
 {
     ViaISAState *s = VIA_ISA(obj);
 
+    object_initialize_child(obj, "rtc", &s->rtc, TYPE_MC146818_RTC);
     object_initialize_child(obj, "ide", &s->ide, "via-ide");
     object_initialize_child(obj, "uhci1", &s->uhci[0], "vt82c686b-usb-uhci");
     object_initialize_child(obj, "uhci2", &s->uhci[1], "vt82c686b-usb-uhci");
@@ -615,7 +617,15 @@ static void via_isa_realize(PCIDevice *d, Error **errp)
     isa_bus_irqs(isa_bus, s->isa_irqs);
     i8254_pit_init(isa_bus, 0x40, 0, NULL);
     i8257_dma_init(isa_bus, 0);
-    mc146818_rtc_init(isa_bus, 2000, NULL);
+
+    /* RTC */
+    qdev_prop_set_int32(DEVICE(&s->rtc), "base_year", 2000);
+    if (!qdev_realize(DEVICE(&s->rtc), BUS(isa_bus), errp)) {
+        return;
+    }
+    object_property_add_alias(qdev_get_machine(), "rtc-time", OBJECT(&s->rtc),
+                              "date");
+    isa_connect_gpio_out(ISA_DEVICE(&s->rtc), 0, s->rtc.isairq);
 
     for (i = 0; i < PCI_CONFIG_HEADER_SIZE; i++) {
         if (i < PCI_COMMAND || i >= PCI_REVISION_ID) {
-- 
2.37.2


