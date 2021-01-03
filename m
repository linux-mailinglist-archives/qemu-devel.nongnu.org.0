Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3853A2E8E42
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jan 2021 22:03:36 +0100 (CET)
Received: from localhost ([::1]:39906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwAXH-0007Sy-7J
	for lists+qemu-devel@lfdr.de; Sun, 03 Jan 2021 16:03:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kwAM3-0003g5-Ps
 for qemu-devel@nongnu.org; Sun, 03 Jan 2021 15:51:59 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:44920)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kwALx-00067O-Fd
 for qemu-devel@nongnu.org; Sun, 03 Jan 2021 15:51:57 -0500
Received: by mail-wr1-x429.google.com with SMTP id w5so29441218wrm.11
 for <qemu-devel@nongnu.org>; Sun, 03 Jan 2021 12:51:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vk9FSJH/4u3dFdJmIzeghhHRNBV/JjI+CeCTMbnyQds=;
 b=FvC9Wq/sFBjseNC5QpYpGKEJXZzl4y/HZXwpiEBprR1yzzZkhrLiJG5xMSJN+3HRZK
 Hnu9lKYnR4iaKrY5XS0CnTKk1YPX6lTUu7YYIKqj0N0QqnA7xpxIsjvLos9etE3Cq0XH
 xiNZefj9DpmOMd0csTOln2NthzCOyyGoyAwKAuKoh4N3CNBPQ3lUzukVJyIHi06AdG6a
 zyhFVYnL4C9md3eEKn08sDdh5YMmTm498MqSffqDT4IZT20BcYPF4ZVzWfl/sw6rb98+
 Zep0KVcWqu5O/sIY6SSqnYUaT9m/o5SJhi/anqyqcXbhNWNVCUECktAC3BTPSzfoHe5K
 D1xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=vk9FSJH/4u3dFdJmIzeghhHRNBV/JjI+CeCTMbnyQds=;
 b=eLcBNkQPuQSiZ8swbl2aDt2d79CQBF+kOi1W1U0Ru3aOFT4J+V2+gbvJkh3iLAdZhX
 Kn5zF4xAU8nEKZZHPq9tHxsHayyxd6RLtIrXYsOSCLoOzcLVkN0fTlxGhfYYRy84ZMzT
 lK/vI8yaQwlheOfSUaQnNBKgmDC1gQE4McRu2ngrVOaMvPGRedyqG+G1MiZdQeUx1kmz
 4S6GtnmHhrev6xOSvaICKLPEnbCitTXFVfTlFCV+wb2p037P8+4b75vlT6Ia27H4vv6U
 P+WKiaomZkihTrHcr0ubaVBijT9jrbbB6bqfKXg3bh91r9igqL/6Q9YdwFWaOPPgwYft
 97qQ==
X-Gm-Message-State: AOAM531vYQ2+8N9XUL8aaW5MIBOOatjIgStRAR57LgW0JvgjckpzybBH
 6xcqFzzBm6K6CvEBBo4KJ1l06XsOKjU=
X-Google-Smtp-Source: ABdhPJzvSriJLfYQ22y9K8hhEBCL4LBS4shx6hERf4LyGKqaAQLJDsSDutV8Jzt5KdnewvZuNdwl/Q==
X-Received: by 2002:adf:dc8b:: with SMTP id r11mr78603595wrj.131.1609707111008; 
 Sun, 03 Jan 2021 12:51:51 -0800 (PST)
Received: from localhost.localdomain
 (194.red-83-57-172.dynamicip.rima-tde.net. [83.57.172.194])
 by smtp.gmail.com with ESMTPSA id y2sm29613750wma.6.2021.01.03.12.51.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jan 2021 12:51:50 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 18/35] vt82c686: Rename superio config related parts
Date: Sun,  3 Jan 2021 21:50:04 +0100
Message-Id: <20210103205021.2837760-19-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210103205021.2837760-1-f4bug@amsat.org>
References: <20210103205021.2837760-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Huacai Chen <chenhuacai@kernel.org>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: BALATON Zoltan <balaton@eik.bme.hu>

Use less confusing naming for superio config register handling related
parts that makes it clearer what belongs to this part.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <4d30a2b4b771b2ad651509885daae79d7c4fe7a8.1609584216.git.balaton@eik.bme.hu>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/isa/vt82c686.c | 48 +++++++++++++++++++++++------------------------
 1 file changed, 24 insertions(+), 24 deletions(-)

diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
index 2633cfe7dc7..a6f5a0843d0 100644
--- a/hw/isa/vt82c686.c
+++ b/hw/isa/vt82c686.c
@@ -27,7 +27,7 @@
 #include "trace.h"
 
 typedef struct SuperIOConfig {
-    uint8_t config[0x100];
+    uint8_t regs[0x100];
     uint8_t index;
     uint8_t data;
 } SuperIOConfig;
@@ -35,23 +35,23 @@ typedef struct SuperIOConfig {
 struct VT82C686BISAState {
     PCIDevice dev;
     MemoryRegion superio;
-    SuperIOConfig superio_conf;
+    SuperIOConfig superio_cfg;
 };
 
 OBJECT_DECLARE_SIMPLE_TYPE(VT82C686BISAState, VT82C686B_ISA)
 
-static void superio_ioport_writeb(void *opaque, hwaddr addr, uint64_t data,
-                                  unsigned size)
+static void superio_cfg_write(void *opaque, hwaddr addr, uint64_t data,
+                              unsigned size)
 {
-    SuperIOConfig *superio_conf = opaque;
+    SuperIOConfig *sc = opaque;
 
     if (addr == 0x3f0) { /* config index register */
-        superio_conf->index = data & 0xff;
+        sc->index = data & 0xff;
     } else {
         bool can_write = true;
         /* 0x3f1, config data register */
-        trace_via_superio_write(superio_conf->index, data & 0xff);
-        switch (superio_conf->index) {
+        trace_via_superio_write(sc->index, data & 0xff);
+        switch (sc->index) {
         case 0x00 ... 0xdf:
         case 0xe4:
         case 0xe5:
@@ -69,23 +69,23 @@ static void superio_ioport_writeb(void *opaque, hwaddr addr, uint64_t data,
 
         }
         if (can_write) {
-            superio_conf->config[superio_conf->index] = data & 0xff;
+            sc->regs[sc->index] = data & 0xff;
         }
     }
 }
 
-static uint64_t superio_ioport_readb(void *opaque, hwaddr addr, unsigned size)
+static uint64_t superio_cfg_read(void *opaque, hwaddr addr, unsigned size)
 {
-    SuperIOConfig *superio_conf = opaque;
-    uint8_t val = superio_conf->config[superio_conf->index];
+    SuperIOConfig *sc = opaque;
+    uint8_t val = sc->regs[sc->index];
 
-    trace_via_superio_read(superio_conf->index, val);
+    trace_via_superio_read(sc->index, val);
     return val;
 }
 
-static const MemoryRegionOps superio_ops = {
-    .read = superio_ioport_readb,
-    .write = superio_ioport_writeb,
+static const MemoryRegionOps superio_cfg_ops = {
+    .read = superio_cfg_read,
+    .write = superio_cfg_write,
     .endianness = DEVICE_NATIVE_ENDIAN,
     .impl = {
         .min_access_size = 1,
@@ -112,12 +112,12 @@ static void vt82c686b_isa_reset(DeviceState *dev)
     pci_conf[0x5f] = 0x04;
     pci_conf[0x77] = 0x10; /* GPIO Control 1/2/3/4 */
 
-    s->superio_conf.config[0xe0] = 0x3c;
-    s->superio_conf.config[0xe2] = 0x03;
-    s->superio_conf.config[0xe3] = 0xfc;
-    s->superio_conf.config[0xe6] = 0xde;
-    s->superio_conf.config[0xe7] = 0xfe;
-    s->superio_conf.config[0xe8] = 0xbe;
+    s->superio_cfg.regs[0xe0] = 0x3c; /* Device ID */
+    s->superio_cfg.regs[0xe2] = 0x03; /* Function select */
+    s->superio_cfg.regs[0xe3] = 0xfc; /* Floppy ctrl base addr */
+    s->superio_cfg.regs[0xe6] = 0xde; /* Parallel port base addr */
+    s->superio_cfg.regs[0xe7] = 0xfe; /* Serial port 1 base addr */
+    s->superio_cfg.regs[0xe8] = 0xbe; /* Serial port 2 base addr */
 }
 
 /* write config pci function0 registers. PCI-ISA bridge */
@@ -311,8 +311,8 @@ static void vt82c686b_realize(PCIDevice *d, Error **errp)
         }
     }
 
-    memory_region_init_io(&s->superio, OBJECT(d), &superio_ops,
-                          &s->superio_conf, "superio", 2);
+    memory_region_init_io(&s->superio, OBJECT(d), &superio_cfg_ops,
+                          &s->superio_cfg, "superio", 2);
     memory_region_set_enabled(&s->superio, false);
     /*
      * The floppy also uses 0x3f0 and 0x3f1.
-- 
2.26.2


