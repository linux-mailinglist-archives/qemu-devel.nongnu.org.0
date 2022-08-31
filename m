Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41B0E5A7AE4
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Aug 2022 12:05:31 +0200 (CEST)
Received: from localhost ([::1]:54464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTKb7-0004dg-8c
	for lists+qemu-devel@lfdr.de; Wed, 31 Aug 2022 06:05:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oTKXu-0006hq-Re; Wed, 31 Aug 2022 06:02:08 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:34527)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oTKXp-0002tN-Ci; Wed, 31 Aug 2022 06:02:06 -0400
Received: by mail-ej1-x62b.google.com with SMTP id y3so27339135ejc.1;
 Wed, 31 Aug 2022 03:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=obQp6NQzWI+X1Co65VCGEoT2U7NzfSKh1zFM6ypADqQ=;
 b=NgQ5wc0SKsYCxCtVxdel2NUzm918gJM40NyoRd/KCFGjTAQRrazmk9RvC90DNnCPCG
 tb4MRROk+yb+NHrSwE1/He3S1PEG29ayAeg9JWiFS+2hChOENAMibc7fEtz72qdf8wQw
 jkiioim/FTw6Of9MnRag2kI26zIGkinmXQrW4jc9UiAypxzacrzRYXHroO5gads00jJW
 k8mrKVI4PTusS86cGSS4Z32a8WLEGHuu+iEbOn0XHtIfVQuZOXUJ6Tf4l3xVR730O6jb
 D0xyNg4L2HA1hjy59x2n47D9SHd2zuJUnfpUXxJxvHt6eIs9iM0PWDNOoBkgLGnFr5yx
 n+ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=obQp6NQzWI+X1Co65VCGEoT2U7NzfSKh1zFM6ypADqQ=;
 b=WUbpOHRbPb/44f5ZPeVsPOQOL9Ihl0snSu+Npf4nDip9O8jP4ol+nPn1HoBJxj0fVU
 LOecW7naCHQeEnFOesW/tsUG0NiHVgli5pbKzYaOQxpIZ7Jnmc/YAacP6dr6BqCTBzlx
 QvhCNo1lXA9a3dZ58a5kp7zPJ8zjpTRB3d3ESMv7wraA2/Wp78wlMKc1vuGg69hCUwC+
 I4H+l8qWeER3OTsgG+X4nHFTrV38Mr7AQFxO7CIbUqJ5h4ZcVnv4rpGAhYrXDP2QdPgQ
 0upPWvZhsHIIWawk46NFSR24HV32f8FxmO1EjqqxERzEyjbOQgdi13LNN7hyOMlofFtI
 2loA==
X-Gm-Message-State: ACgBeo1DdYMcqHKwuQg1+IrDZg5oKz5q0AU9RUAhJVrxyIBSGohS++Je
 yeXusyyCCz6FLPiXpMgQzL8ARQENv6s=
X-Google-Smtp-Source: AA6agR564hlNxDKWQ1ABz93bapnMeo2ZJpJLZ9GWPLOWZrM+Nyja96RHby5NHOfqtfjYWz1A1ObfiA==
X-Received: by 2002:a17:906:fe46:b0:73d:939a:ec99 with SMTP id
 wz6-20020a170906fe4600b0073d939aec99mr20004715ejb.169.1661940120095; 
 Wed, 31 Aug 2022 03:02:00 -0700 (PDT)
Received: from osoxes.fritz.box (pd95ed71f.dip0.t-ipconnect.de.
 [217.94.215.31]) by smtp.gmail.com with ESMTPSA id
 6-20020a170906310600b0073c10031dc9sm6449583ejx.80.2022.08.31.03.01.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Aug 2022 03:01:59 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 BALATON Zoltan <balaton@eik.bme.hu>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v3 10/10] hw/isa/vt82c686: Create rtc-time alias in boards
 instead
Date: Wed, 31 Aug 2022 11:59:14 +0200
Message-Id: <20220831095914.2041-11-shentey@gmail.com>
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

According to good QOM practice, an object should only deal with objects
of its own sub tree. Having devices create an alias on the machine
object doesn't respect this good practice. To resolve this, create the
alias in the machine's code.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/isa/vt82c686.c   | 2 --
 hw/mips/fuloong2e.c | 4 ++++
 hw/ppc/pegasos2.c   | 4 ++++
 3 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
index 0ddb04b433..d5200af0ff 100644
--- a/hw/isa/vt82c686.c
+++ b/hw/isa/vt82c686.c
@@ -632,8 +632,6 @@ static void via_isa_realize(PCIDevice *d, Error **errp)
     if (!qdev_realize(DEVICE(&s->rtc), BUS(isa_bus), errp)) {
         return;
     }
-    object_property_add_alias(qdev_get_machine(), "rtc-time", OBJECT(&s->rtc),
-                              "date");
     isa_connect_gpio_out(ISA_DEVICE(&s->rtc), 0, s->rtc.isairq);
 
     for (i = 0; i < PCI_CONFIG_HEADER_SIZE; i++) {
diff --git a/hw/mips/fuloong2e.c b/hw/mips/fuloong2e.c
index 2d8723ab74..0f4cfe1188 100644
--- a/hw/mips/fuloong2e.c
+++ b/hw/mips/fuloong2e.c
@@ -203,6 +203,10 @@ static void vt82c686b_southbridge_init(PCIBus *pci_bus, int slot, qemu_irq intc,
 
     via = pci_create_simple_multifunction(pci_bus, PCI_DEVFN(slot, 0), true,
                                           TYPE_VT82C686B_ISA);
+    object_property_add_alias(qdev_get_machine(), "rtc-time",
+                              object_resolve_path_component(OBJECT(via),
+                                                            "rtc"),
+                              "date");
     qdev_connect_gpio_out(DEVICE(via), 0, intc);
 
     dev = PCI_DEVICE(object_resolve_path_component(OBJECT(via), "ide"));
diff --git a/hw/ppc/pegasos2.c b/hw/ppc/pegasos2.c
index 09fdb7557f..f50e1d8b3f 100644
--- a/hw/ppc/pegasos2.c
+++ b/hw/ppc/pegasos2.c
@@ -161,6 +161,10 @@ static void pegasos2_init(MachineState *machine)
     /* VIA VT8231 South Bridge (multifunction PCI device) */
     via = pci_create_simple_multifunction(pci_bus, PCI_DEVFN(12, 0), true,
                                           TYPE_VT8231_ISA);
+    object_property_add_alias(qdev_get_machine(), "rtc-time",
+                              object_resolve_path_component(OBJECT(via),
+                                                            "rtc"),
+                              "date");
     qdev_connect_gpio_out(DEVICE(via), 0,
                           qdev_get_gpio_in_named(pm->mv, "gpp", 31));
 
-- 
2.37.3


