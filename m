Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD6E654742F
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Jun 2022 13:20:34 +0200 (CEST)
Received: from localhost ([::1]:44418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzzAP-0007k7-QO
	for lists+qemu-devel@lfdr.de; Sat, 11 Jun 2022 07:20:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nzyTj-0006D1-RH
 for qemu-devel@nongnu.org; Sat, 11 Jun 2022 06:36:28 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:41690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nzyTh-0006ly-B0
 for qemu-devel@nongnu.org; Sat, 11 Jun 2022 06:36:27 -0400
Received: by mail-wr1-x430.google.com with SMTP id k19so1476861wrd.8
 for <qemu-devel@nongnu.org>; Sat, 11 Jun 2022 03:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=A68VoJ55WOUXt22OCWQHRJUnoqCMFbKcKuWRHTsAr+4=;
 b=gNPQjGwUGf29gU4LjkG124l0L3L61MQr0F6Aa7oFolUT6JpF5PEyK7DmN5K+K6xdV6
 H7Pd7tKV9m/EOCfOCA/UfYABkfFoQpQC3YN/HForhjZJ4H6h6PIvaD6U/sUD4ZWuhZSK
 W/of1DZbgB62ONNBQo1cjlo+YBJ+v99+8T8nm5yOymOeyf0CWSk2cijN73cOIRH/oCBp
 PC48mPjsTppeBqNU2xpKJSKdAWHM32EgB89KvohZYHNG+hcg9ovP8hWINfmExSr6Fl8u
 85vH0yzf0P1VeVCul0Qb67o6XlcYJE92Q96kbwwwWw4SejcPwL3rDWvCLbigmcvxlSio
 Zq/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=A68VoJ55WOUXt22OCWQHRJUnoqCMFbKcKuWRHTsAr+4=;
 b=waqGEmbst5UUi360DXW0lJ7G8tuJdyJR01AX3X1qjNzXHnIvqs6hrmGkIVE9TYZhGK
 HrA3ArPFDn27Rpp3lzRIodC/x2hfYc5Lq4VTukpoaoHhYVCLKJ6vn9TDwPnbC14r/uOf
 mkuS/8XoAt19DXTpDJ2wx3VXJgh9JseUwJCJjOjg7ll1LLCyiUaPiz1RP21XwpVrQp88
 e92mo0786C2LErLhg29uJ3+EmZ8ueeeaXNmA55PQ9fq7eb0+z1KHkQO9/liPaOlA79dR
 MJarH9y0wSX5pWaCTm5xjJx3ixg16wiU0VK9Pi15hUdKFXaZTxQw3uB2doYm8JAZQQU/
 4SnA==
X-Gm-Message-State: AOAM531KuZYkco5okeTye0cc1w4oeNxsSOx0gAaX8OlvoOdFPmpTPkOY
 pXbXyCT6drM/pcqe30mqLfWUQhu2rks=
X-Google-Smtp-Source: ABdhPJw7K2rxL/KQtW5/q6UszimgZCWRcXPDTL2XPDfZA9KKArvBhv0LXVR/fD8DPxu4GLdJf8cDbA==
X-Received: by 2002:a5d:6daf:0:b0:218:4f53:5810 with SMTP id
 u15-20020a5d6daf000000b002184f535810mr23502878wrs.43.1654943779747; 
 Sat, 11 Jun 2022 03:36:19 -0700 (PDT)
Received: from localhost.localdomain (124.net-94.228.4.isbl.embou.net.
 [94.228.4.124]) by smtp.gmail.com with ESMTPSA id
 r20-20020a05600c35d400b0039c1396b495sm2035035wmq.9.2022.06.11.03.36.18
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 11 Jun 2022 03:36:19 -0700 (PDT)
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
Subject: [PULL 36/49] hw/isa/piix3: Factor out ISABus retrieval from
 piix3_create()
Date: Sat, 11 Jun 2022 12:32:59 +0200
Message-Id: <20220611103312.67773-37-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220611103312.67773-1-philippe.mathieu.daude@gmail.com>
References: <20220611103312.67773-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
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

Modernizes the code.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-Id: <20220603185045.143789-11-shentey@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/i386/pc_piix.c             | 3 ++-
 hw/isa/piix3.c                | 3 +--
 include/hw/southbridge/piix.h | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 7d5546600b..70c337c44b 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -207,9 +207,10 @@ static void pc_init1(MachineState *machine,
                               pci_memory, ram_memory);
         pcms->bus = pci_bus;
 
-        piix3 = piix3_create(pci_bus, &isa_bus);
+        piix3 = piix3_create(pci_bus);
         piix3->pic = x86ms->gsi;
         piix3_devfn = piix3->dev.devfn;
+        isa_bus = ISA_BUS(qdev_get_child_bus(DEVICE(piix3), "isa.0"));
     } else {
         pci_bus = NULL;
         i440fx_state = NULL;
diff --git a/hw/isa/piix3.c b/hw/isa/piix3.c
index 89064eb837..d57a7fe6d6 100644
--- a/hw/isa/piix3.c
+++ b/hw/isa/piix3.c
@@ -417,7 +417,7 @@ static void piix3_register_types(void)
 
 type_init(piix3_register_types)
 
-PIIX3State *piix3_create(PCIBus *pci_bus, ISABus **isa_bus)
+PIIX3State *piix3_create(PCIBus *pci_bus)
 {
     PIIX3State *piix3;
     PCIDevice *pci_dev;
@@ -426,7 +426,6 @@ PIIX3State *piix3_create(PCIBus *pci_bus, ISABus **isa_bus)
 
     pci_dev = pci_create_simple_multifunction(pci_bus, -1, true, type);
     piix3 = PIIX3_PCI_DEVICE(pci_dev);
-    *isa_bus = ISA_BUS(qdev_get_child_bus(DEVICE(piix3), "isa.0"));
 
     return piix3;
 }
diff --git a/include/hw/southbridge/piix.h b/include/hw/southbridge/piix.h
index 9a2dd93c2d..f805fb8683 100644
--- a/include/hw/southbridge/piix.h
+++ b/include/hw/southbridge/piix.h
@@ -68,6 +68,6 @@ DECLARE_INSTANCE_CHECKER(PIIX3State, PIIX3_PCI_DEVICE,
 #define TYPE_PIIX3_XEN_DEVICE "PIIX3-xen"
 #define TYPE_PIIX4_PCI_DEVICE "piix4-isa"
 
-PIIX3State *piix3_create(PCIBus *pci_bus, ISABus **isa_bus);
+PIIX3State *piix3_create(PCIBus *pci_bus);
 
 #endif
-- 
2.36.1


