Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFCD75A7B1D
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Aug 2022 12:13:29 +0200 (CEST)
Received: from localhost ([::1]:55140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTKiq-0000bX-1k
	for lists+qemu-devel@lfdr.de; Wed, 31 Aug 2022 06:13:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oTKXq-0006bo-6i; Wed, 31 Aug 2022 06:02:02 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:39502)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oTKXo-0002sd-Io; Wed, 31 Aug 2022 06:02:01 -0400
Received: by mail-ej1-x62b.google.com with SMTP id fy31so26896117ejc.6;
 Wed, 31 Aug 2022 03:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=/YXn4jIU5u4dg8pOxM6EJxfOr+emaZF3x+0soWdkuj0=;
 b=cnWVEZxSzj+CPSdi0QvF4yLlgHK5nzchG1uyd0mvSCORGEWUVebXI/sD4VH4NXN75a
 W5NnZ5V4KBBWqVEcxSSeavXd+9gKgy78mp4VeovJoS1VNmJEiboK3PvGHLwFfbExjmCo
 BTRKtpZRF5cmX7rgzsHMp+y/oUQ/k4HuhG+bzYB7NaYWoSWgL+qjYdNX0i0P7S8OEhpY
 ue8/xyTqCWhi2RHcElQz82MlTnJfGCrm6UYcTZ1ToTwWO2IYuIYt+O2DslPuqVCVHQhC
 qzJrd57NffJcUCbTRgiH9cqIddDMveo5JpsxgGiPFIOb8dfsXTK24CxNpG6cXv92Rrof
 e81g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=/YXn4jIU5u4dg8pOxM6EJxfOr+emaZF3x+0soWdkuj0=;
 b=V0+yCkw7qVKJ9ZS+8l3vjbxXe+Gk2JyS0f9y+vysv1LwSm0MWHlJl3rBveDIBkCj6V
 lcfvgMYN+ZoOee8RgC0tNVLBYRIbvxsU7WHlQimighmUIjNhUi/SNjVD9Uj7XWoSqZ2h
 HZuq8/QFKPVVBlrqcqlLTZURf9BszIBQ0DHTOE9j+iPFjuTE+0VLROEzjbjZwPU4C3Lb
 N7g0nhOBXrGmKPdF+OmKeLOVHqtDZOy1/aQaHTqjvel90RCu+lziC+codL3wdllLbJOR
 cw6x90VEgnIIZvnyPYMjiM4TkOTMaQZTldG4sbWYQiBSs1rLZgjX+zMMOubp/Cd0RpFs
 whqw==
X-Gm-Message-State: ACgBeo3saNXfJqkrfTiTTtScqpsUafVfcFRP8HSlf60mBupNm+VYyP5b
 lAyZFYBc+gnYJrq2qp9R3I/jF63NoSo=
X-Google-Smtp-Source: AA6agR7L2eoEe1OJuAmQOz/FM2m4mfJABZceyw+G3nDvOzArO+d32QwWG/f2yvsmxpdqxsI0QvdwMQ==
X-Received: by 2002:a17:907:75e8:b0:730:ccd3:2683 with SMTP id
 jz8-20020a17090775e800b00730ccd32683mr19820299ejc.329.1661940119346; 
 Wed, 31 Aug 2022 03:01:59 -0700 (PDT)
Received: from osoxes.fritz.box (pd95ed71f.dip0.t-ipconnect.de.
 [217.94.215.31]) by smtp.gmail.com with ESMTPSA id
 6-20020a170906310600b0073c10031dc9sm6449583ejx.80.2022.08.31.03.01.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Aug 2022 03:01:58 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 BALATON Zoltan <balaton@eik.bme.hu>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v3 09/10] hw/isa/vt82c686: Embed RTCState in host device
Date: Wed, 31 Aug 2022 11:59:13 +0200
Message-Id: <20220831095914.2041-10-shentey@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220831095914.2041-1-shentey@gmail.com>
References: <20220831095914.2041-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62b.google.com
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

Embed the rtc in the host device, analoguous to the other child devices
and analoguous to PIIX4.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/isa/vt82c686.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
index 691a467b2c..0ddb04b433 100644
--- a/hw/isa/vt82c686.c
+++ b/hw/isa/vt82c686.c
@@ -550,6 +550,7 @@ struct ViaISAState {
     qemu_irq cpu_intr;
     qemu_irq *isa_irqs;
     ViaSuperIOState via_sio;
+    RTCState rtc;
     PCIIDEState ide;
     UHCIState uhci[2];
     ViaPMState pm;
@@ -571,6 +572,7 @@ static void via_isa_init(Object *obj)
 {
     ViaISAState *s = VIA_ISA(obj);
 
+    object_initialize_child(obj, "rtc", &s->rtc, TYPE_MC146818_RTC);
     object_initialize_child(obj, "ide", &s->ide, "via-ide");
     object_initialize_child(obj, "uhci1", &s->uhci[0], "vt82c686b-usb-uhci");
     object_initialize_child(obj, "uhci2", &s->uhci[1], "vt82c686b-usb-uhci");
@@ -624,7 +626,15 @@ static void via_isa_realize(PCIDevice *d, Error **errp)
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
2.37.3


