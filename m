Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E2883C35EC
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Jul 2021 19:52:00 +0200 (CEST)
Received: from localhost ([::1]:45258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2H8x-0000Jm-AJ
	for lists+qemu-devel@lfdr.de; Sat, 10 Jul 2021 13:51:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m2H7F-0005yv-6j
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 13:50:14 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:33670)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m2H79-00011p-GP
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 13:50:08 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 g8-20020a1c9d080000b02901f13dd1672aso7933065wme.0
 for <qemu-devel@nongnu.org>; Sat, 10 Jul 2021 10:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OnSonEZdAMgv0aONQbUfGaAXbR6YWaPB0S2D+r1jukM=;
 b=bZVzkoFdIKPsmi4LXDL9nm+DY/R6KRKO4Pe4y7t811z5Lapd22HSyksWVPjTCX0zE9
 kNTG1f0kIFxTiyo60KWy1KxC18TUCdhuPPiLgrpLpag3H8dCwTvZQzuhjwexmZA3WeEZ
 uoImFZjIIrX0xTMQynfNNOLqvqnSqshaJgoOTxBNnT7NjqyLdtksacTq0LYTGqCFuYHi
 0Ks25apQrt8Ex8eWkAU73kY8u1v1+X702fv2zMHZFqdp5PtRuCX43UOlwp/sg3BLXnzY
 3Xbmxdey23SRcmNaaK8W44kgWF0K3gkQRLurMTWk26kjvFQRccwQ0PRA6fM1kw37UMG3
 KSxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=OnSonEZdAMgv0aONQbUfGaAXbR6YWaPB0S2D+r1jukM=;
 b=tf72TctNSdJvDEMZo98ViocdbYXJEYbWlRxgiBYR9fYb0ANd9N5JjeGEzAaBo7CTrE
 bCy6CvbbdCz8hL3T8KGL7kY5RVg5G+En8+Ve4a9uId2y9KD6HS7gN9NFkWmWxGuBT/aG
 KKZDI3co4aeQ8xBPKcUnLehxkeg6tVrnJ5n5XYPEAJ+lCpHhCs2NadEkhRna/YWqOb3u
 h4k8bbU7z9Ywrjlkzr3K9aIuZpW482c/k1wfcU+CNLtUwuQK0mp2OS4ONaGXKhASTaeU
 wTWwnnSzm2uuQkfsUNd7CNSqV77xzD+0bkeNAEMBvdYcA5Fkt1vO7fd/c0JRRD47M+VE
 oCkA==
X-Gm-Message-State: AOAM532vJS+8Li6Qq8bW+CPDh2ynDvFX0W2pQN/JT/x6rQVfklTMO8DL
 ZwV39pxSnFR0nFYZ6ZZA5nTzcoM/FhQILg==
X-Google-Smtp-Source: ABdhPJwsCWKkD+rtfvgcVIfDUEfXmvZUujjJzkRAMgG/86WZ0Uxxs4oYdLhcNQaf3AUUu0/PpDI1Ew==
X-Received: by 2002:a1c:e91a:: with SMTP id q26mr5455816wmc.170.1625939405974; 
 Sat, 10 Jul 2021 10:50:05 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id g15sm7866921wmh.16.2021.07.10.10.50.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Jul 2021 10:50:05 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 2/8] dp8393x: Replace 0x40 magic value by SONIC_REG16_COUNT
 definition
Date: Sat, 10 Jul 2021 19:49:48 +0200
Message-Id: <20210710174954.2577195-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210710174954.2577195-1-f4bug@amsat.org>
References: <20210710174954.2577195-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x330.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Laurent Vivier <laurent@vivier.eu>, Finn Thain <fthain@linux-m68k.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/net/dp8393x.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/hw/net/dp8393x.c b/hw/net/dp8393x.c
index 9118364aa33..d1e147a82a6 100644
--- a/hw/net/dp8393x.c
+++ b/hw/net/dp8393x.c
@@ -85,6 +85,7 @@ static const char *reg_names[] = {
 #define SONIC_MPT    0x2e
 #define SONIC_MDT    0x2f
 #define SONIC_DCR2   0x3f
+#define SONIC_REG_COUNT  0x40
 
 #define SONIC_CR_HTX     0x0001
 #define SONIC_CR_TXP     0x0002
@@ -158,7 +159,7 @@ struct dp8393xState {
 
     /* Registers */
     uint8_t cam[16][6];
-    uint16_t regs[0x40];
+    uint16_t regs[SONIC_REG_COUNT];
 
     /* Temporaries */
     uint8_t tx_buffer[0x10000];
@@ -972,7 +973,7 @@ static void dp8393x_realize(DeviceState *dev, Error **errp)
 
     address_space_init(&s->as, s->dma_mr, "dp8393x");
     memory_region_init_io(&s->mmio, OBJECT(dev), &dp8393x_ops, s,
-                          "dp8393x-regs", 0x40 << s->it_shift);
+                          "dp8393x-regs", SONIC_REG_COUNT << s->it_shift);
 
     s->nic = qemu_new_nic(&net_dp83932_info, &s->conf,
                           object_get_typename(OBJECT(dev)), dev->id, s);
@@ -987,7 +988,7 @@ static const VMStateDescription vmstate_dp8393x = {
     .minimum_version_id = 0,
     .fields = (VMStateField []) {
         VMSTATE_BUFFER_UNSAFE(cam, dp8393xState, 0, 16 * 6),
-        VMSTATE_UINT16_ARRAY(regs, dp8393xState, 0x40),
+        VMSTATE_UINT16_ARRAY(regs, dp8393xState, SONIC_REG_COUNT),
         VMSTATE_END_OF_LIST()
     }
 };
-- 
2.31.1


