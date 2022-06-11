Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2ED4547439
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Jun 2022 13:27:21 +0200 (CEST)
Received: from localhost ([::1]:33228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzzGz-0002n1-01
	for lists+qemu-devel@lfdr.de; Sat, 11 Jun 2022 07:27:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nzyTU-00067X-WA
 for qemu-devel@nongnu.org; Sat, 11 Jun 2022 06:36:13 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:45632)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nzyTT-0006kU-4G
 for qemu-devel@nongnu.org; Sat, 11 Jun 2022 06:36:12 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 x6-20020a1c7c06000000b003972dfca96cso761606wmc.4
 for <qemu-devel@nongnu.org>; Sat, 11 Jun 2022 03:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ul1qFQ9VM3y6jWfQ7BS4BrYGnpboS+5eSvdEyMLG1+Y=;
 b=EvL42hEzVc9XVOPgJI9d8gDcRTdHJKxTWjvx/FpQhWaW7JQN/lL0govaIgptYuVJDI
 odRBBci+0gwohTbeRDiuRPS0gxOJIgj9gM3rU8r7QQdr6koU+R19629xfViU2lhTPIzP
 PHvT8Incpy1QaHC4rjO6O0+2irGqaeIX8lCvUiBxO4/I1DRZT0iPSx+xF+VGRQ+OAgE9
 w71eVW4epYhAmkHX3ccgOAC7PSxsUo7XO+Hodh50accK5upVKGDz1CQfRTXf5PO9t5+b
 TRJJIGd8OBF6IzC3NIESGr8/tOoMxzc7w9zqhKUSmSzRLHEEJVPhPlUR9/fudFhvyYlm
 w7dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ul1qFQ9VM3y6jWfQ7BS4BrYGnpboS+5eSvdEyMLG1+Y=;
 b=wHTXw2r24Z6IhKuxLd+K3VvQJr7zRON5sRoEF2FJsaD12UzlnIalWkihxiPYpyeYUp
 xICPuF5Fu3BPgCr6uCfkzQu5WBcteVruVvx4oW5uHV9RNjV5AHhiwC//gFATec5pCtYq
 HnLEnBYVRiszjoiJnGz5jiUhc4H6pKQqL6EmJGMFGGP6A3Qpnz23jBb1k2ZiYOgcEVSt
 rSckM3qhaS69evKzMRg8tN4jAwIQfJfFOH8y7Y2xpWs6HcUsnA5gyHxnPCTUlxk6RHK8
 M7D32AzVaKEgiIa7gRttUDqFLFrEWqjsiNg/a1pJUIoR/is2CdqDhMdaYWuupUYB927F
 OivQ==
X-Gm-Message-State: AOAM531+FX5cGGXjYeLOo9Xk+bgtF0RQiwfWaJBecUZxDn5GZnrz0dLv
 FFGl4+VXc0hBia8aplrG5h7d+VNnGxA=
X-Google-Smtp-Source: ABdhPJziMZ/u28e8+dHvuuLMBCM1LmcXshD6qA28pUYhTWfQptyAnnfL1oi0JPDePkO5UrScy0Gx5g==
X-Received: by 2002:a7b:c4d4:0:b0:39c:5bb7:2210 with SMTP id
 g20-20020a7bc4d4000000b0039c5bb72210mr4209258wmk.99.1654943769522; 
 Sat, 11 Jun 2022 03:36:09 -0700 (PDT)
Received: from localhost.localdomain (124.net-94.228.4.isbl.embou.net.
 [94.228.4.124]) by smtp.gmail.com with ESMTPSA id
 q16-20020a5d5750000000b0020e63ab5d78sm2163247wrw.26.2022.06.11.03.36.08
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 11 Jun 2022 03:36:09 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Stefan Pejic <stefan.pejic@syrmia.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Bernhard Beschow <shentey@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 34/49] hw/isa/piix3: Move pci_map_irq_fn near pci_set_irq_fn
Date: Sat, 11 Jun 2022 12:32:57 +0200
Message-Id: <20220611103312.67773-35-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220611103312.67773-1-philippe.mathieu.daude@gmail.com>
References: <20220611103312.67773-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
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

From: Bernhard Beschow <shentey@gmail.com>

The pci_map_irq_fn was implemented below type_init() which made it
inaccessible to QOM functions. So move it up.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220603185045.143789-9-shentey@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/isa/piix3.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/hw/isa/piix3.c b/hw/isa/piix3.c
index c92b36c4f2..d50a07b58b 100644
--- a/hw/isa/piix3.c
+++ b/hw/isa/piix3.c
@@ -79,6 +79,17 @@ static void piix3_set_irq(void *opaque, int pirq, int level)
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
@@ -367,17 +378,6 @@ static void piix3_register_types(void)
 
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


