Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B7D0547433
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Jun 2022 13:24:00 +0200 (CEST)
Received: from localhost ([::1]:52850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzzDi-000546-SK
	for lists+qemu-devel@lfdr.de; Sat, 11 Jun 2022 07:23:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nzyU7-00071M-RZ
 for qemu-devel@nongnu.org; Sat, 11 Jun 2022 06:36:57 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:56206)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nzyU3-0006nr-1H
 for qemu-devel@nongnu.org; Sat, 11 Jun 2022 06:36:48 -0400
Received: by mail-wm1-x32c.google.com with SMTP id a10so622428wmj.5
 for <qemu-devel@nongnu.org>; Sat, 11 Jun 2022 03:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fAiFZXHCxyENLEE19lCloGRGCJjLEAvlArgNlYu5mHA=;
 b=Cy0bRX+8kGpocbyp1HXoLFcrLUfwDx2QyMXVRTCmyuyNYaJm4hXd2ebYNm3iJpCbeN
 kt6lHbo9G1LlIPygMRJM3c40eYkI0sr06Q7K+1UjCNeEcXE4KsKXHXPlYj53h7IhpYRR
 oHgGYKGkBZw6rz5cvTCDPvP+aWfzqEjwnmI0uk6maBxzsm2lP+SPKJCg0cqg3XzGex66
 UoCKznWAJwJRzC/5kavtpgF0oqN9+8AJI3+qG2pdfNyuanQY39KH44CG4J2FUWPopL8q
 M3KnXSCESJ+77EPvyLHChB1yolnNMDDkWC33153fDJO+t6Wca1YGAYYpu8O3H2KpqcVW
 mJzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fAiFZXHCxyENLEE19lCloGRGCJjLEAvlArgNlYu5mHA=;
 b=KshLIJmDfKeC8krMc7otYH6fcW1zWXezqPvzQVcFNnhgwgq94PPFhTCyPMX184ogju
 kmUJV/Y9ceNJmW7uPTahJ7v/2Imyzvh7fB6FuLN1W/7bcPcG3duuTvEPcY0qJY3/PBew
 5vRRQL+BOeJ2PJqTtlht6w9ibrktbliNqbeJsIi2g0/aLSMFHskTPulIsFf8kyjLYGWD
 Afi0pU6G6K4x7TCEi93qEu+QRpKcGBS2QSjbWvpVUWu0mEutaJQSMNJGvNNWMLPSrbHd
 sljKV4nFrh6Au0ZDMh8a3Jbn9/lJvGG+MQfZl0jI4GFcoUnCfO+BdcZc/OC8APBjbbNu
 RrYg==
X-Gm-Message-State: AOAM530M2XPb2Pb18ydCuzB4d1Pw6Q5DsQLNtP0sumjLWsDt+vkG0bUH
 nfJJ4qF45Q8ab68rxMBY/XjMLFZ5rkI=
X-Google-Smtp-Source: ABdhPJw4H58fKTU6gzkHaRm+/7173jDf0yF6wJ/yp5slcsJPgVizmrXkmYgr3fS7RlDZu9TfhpV8Pw==
X-Received: by 2002:a05:600c:4e0c:b0:39c:519f:9f35 with SMTP id
 b12-20020a05600c4e0c00b0039c519f9f35mr4110436wmq.153.1654943805352; 
 Sat, 11 Jun 2022 03:36:45 -0700 (PDT)
Received: from localhost.localdomain (124.net-94.228.4.isbl.embou.net.
 [94.228.4.124]) by smtp.gmail.com with ESMTPSA id
 m16-20020a05600c3b1000b0039c673952bfsm6202512wms.6.2022.06.11.03.36.44
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 11 Jun 2022 03:36:44 -0700 (PDT)
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
Subject: [PULL 41/49] hw: Reuse TYPE_I8042 define
Date: Sat, 11 Jun 2022 12:33:04 +0200
Message-Id: <20220611103312.67773-42-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220611103312.67773-1-philippe.mathieu.daude@gmail.com>
References: <20220611103312.67773-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
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

TYPE_I8042 is exported, so reuse it for consistency.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Acked-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-Id: <20220520180109.8224-2-shentey@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/i386/pc.c       | 4 ++--
 hw/sparc64/sun4u.c | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 1b6067ff22..af9e5edb04 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -1097,7 +1097,7 @@ static void pc_superio_init(ISABus *isa_bus, bool create_fdctrl,
         return;
     }
 
-    i8042 = isa_create_simple(isa_bus, "i8042");
+    i8042 = isa_create_simple(isa_bus, TYPE_I8042);
     if (!no_vmport) {
         isa_create_simple(isa_bus, TYPE_VMPORT);
         vmmouse = isa_try_new("vmmouse");
@@ -1105,7 +1105,7 @@ static void pc_superio_init(ISABus *isa_bus, bool create_fdctrl,
         vmmouse = NULL;
     }
     if (vmmouse) {
-        object_property_set_link(OBJECT(vmmouse), "i8042", OBJECT(i8042),
+        object_property_set_link(OBJECT(vmmouse), TYPE_I8042, OBJECT(i8042),
                                  &error_abort);
         isa_realize_and_unref(vmmouse, isa_bus, &error_fatal);
     }
diff --git a/hw/sparc64/sun4u.c b/hw/sparc64/sun4u.c
index d1bc77d27e..0e27715ac4 100644
--- a/hw/sparc64/sun4u.c
+++ b/hw/sparc64/sun4u.c
@@ -334,7 +334,7 @@ static void ebus_realize(PCIDevice *pci_dev, Error **errp)
     parallel_hds_isa_init(s->isa_bus, MAX_PARALLEL_PORTS);
 
     /* Keyboard */
-    isa_create_simple(s->isa_bus, "i8042");
+    isa_create_simple(s->isa_bus, TYPE_I8042);
 
     /* Floppy */
     for (i = 0; i < MAX_FD; i++) {
-- 
2.36.1


