Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81C23363F31
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 11:53:32 +0200 (CEST)
Received: from localhost ([::1]:55402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYQax-0003FX-JS
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 05:53:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYQRv-0002eH-Eo; Mon, 19 Apr 2021 05:44:11 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:45648)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYQRt-0003F3-8n; Mon, 19 Apr 2021 05:44:11 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 n4-20020a05600c4f84b029013151278decso6480793wmq.4; 
 Mon, 19 Apr 2021 02:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NIYm1L8/p/Xz5vVKMeT4Sh/uIFcZTxSNDGLqYrwlXUg=;
 b=PuY9QoFJIZK1ZC96tYMufQ2zuXkXFma++NjrGdqRQU0ssg0qrTtZtRdII/Z0MxAhV+
 pmocHCOGAjDEpyUOGk8OGaUyTgD2xyItu9LMpwB7Tmgx2VyHqKGCZSeQbgrVQE7NS0Ru
 /h/KEBkmbEPA3AJWf2LA7w2tKk1olFgqoft9jQCDnC5cdydI3s2lwIlI68Kb/UTyhN2K
 23YT3RQDM6OVhB5vV3o/4L8m8kYZwLJt+1RuBg/CK50OwqaFtUSSARKSXyiizVaxlpus
 n/RbZlYbNZhb/CG993AhqSh9HlypR8LUuw9zuy2JcFBqZYFllq9SSV9AwUeFbqUF1jcO
 6cBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=NIYm1L8/p/Xz5vVKMeT4Sh/uIFcZTxSNDGLqYrwlXUg=;
 b=okiKDjeBeaUsx8gaXVHh6KTJx54+07C/7W4itJXl+bmZwzu1/rmCM1G4liZ5BU+ZoS
 GYUJcJ4i/mgHpMCIexlOaszqJ1vIFCsou12fPcPPjjikxkpR8cfbN6pPhcrgPqnPCvc6
 UO8y5FIy54erZZWX9osmXlvcAA1iyZsqfoouo5WkvWTfu89yA5tVyF0ZEdwLzdw9nAtE
 NuKAjYznPQ/Ju4ZQ/3h1TxgOtnF2ORh0PI61sdUzux5VqY0YtK3GM/1+8WSHb94ua0Tr
 VrxbeNjnrqLBw9apbk5VojTyr2dzX0Sa0qIwOpi08/G2iLS1gzp3KTKuMqWeoChUApY3
 q92Q==
X-Gm-Message-State: AOAM530UdDlxacp/IvCeOVL5Q+SwJXACa1FNhasK2XdnfFE6FKK3k/Y/
 SSdzCX2FFL868zpt2RPV6j1mQzJWSKkC0w==
X-Google-Smtp-Source: ABdhPJzkbKnx1+4DOjtJrm+VHLizSPB+Pup+AuqBBVjmHHgp+ILXt/jNIqUwBPjYjlmrypwDYxmWxQ==
X-Received: by 2002:a1c:1b46:: with SMTP id b67mr20992483wmb.122.1618825446452; 
 Mon, 19 Apr 2021 02:44:06 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id f6sm19373065wmf.28.2021.04.19.02.44.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Apr 2021 02:44:05 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 7/7] hw/block/pflash_cfi02: Simplify
 pflash_cfi02_register() prototype
Date: Mon, 19 Apr 2021 11:43:29 +0200
Message-Id: <20210419094329.1402767-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210419094329.1402767-1-f4bug@amsat.org>
References: <20210419094329.1402767-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Stephen Checkoway <stephen.checkoway@oberlin.edu>, qemu-block@nongnu.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 "open list:405" <qemu-ppc@nongnu.org>, Magnus Damm <magnus.damm@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Max Reitz <mreitz@redhat.com>, David Edmondson <david.edmondson@oracle.com>,
 Michael Walle <michael@walle.cc>, qemu-arm@nongnu.org,
 Jan Kiszka <jan.kiszka@web.de>, Antony Pavlov <antonynpavlov@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Greg Kurz <groug@kaod.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The previous commit removed the mapping code from TYPE_PFLASH_CFI02.
pflash_cfi02_register() doesn't use the 'nb_mappings' argument
anymore. Simply remove it to simplify.

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/block/flash.h | 1 -
 hw/arm/digic_boards.c    | 1 -
 hw/arm/musicpal.c        | 1 -
 hw/arm/xilinx_zynq.c     | 2 +-
 hw/block/pflash_cfi02.c  | 3 +--
 hw/lm32/lm32_boards.c    | 4 ++--
 hw/ppc/ppc405_boards.c   | 6 +++---
 hw/sh4/r2d.c             | 2 +-
 8 files changed, 8 insertions(+), 12 deletions(-)

diff --git a/include/hw/block/flash.h b/include/hw/block/flash.h
index 7dde0adcee7..0e5dd818a9d 100644
--- a/include/hw/block/flash.h
+++ b/include/hw/block/flash.h
@@ -36,7 +36,6 @@ PFlashCFI02 *pflash_cfi02_register(hwaddr base,
                                    hwaddr size,
                                    BlockBackend *blk,
                                    uint32_t sector_len,
-                                   int nb_mappings,
                                    int width,
                                    uint16_t id0, uint16_t id1,
                                    uint16_t id2, uint16_t id3,
diff --git a/hw/arm/digic_boards.c b/hw/arm/digic_boards.c
index 293402b1240..eb694c70d4c 100644
--- a/hw/arm/digic_boards.c
+++ b/hw/arm/digic_boards.c
@@ -128,7 +128,6 @@ static void digic4_add_k8p3215uqb_rom(DigicState *s, hwaddr addr,
                          FLASH_K8P3215UQB_SIZE / FLASH_K8P3215UQB_SECTOR_SIZE);
     qdev_prop_set_uint32(dev, "sector-length", FLASH_K8P3215UQB_SECTOR_SIZE);
     qdev_prop_set_uint8(dev, "width", 4); /* 32-bit */
-    qdev_prop_set_uint8(dev, "mappings", 0);
     qdev_prop_set_uint8(dev, "big-endian", 0);
     qdev_prop_set_uint16(dev, "id0", 0x00ec);
     qdev_prop_set_uint16(dev, "id1", 0x007e);
diff --git a/hw/arm/musicpal.c b/hw/arm/musicpal.c
index 7d1f2f3fb3f..e882e11df36 100644
--- a/hw/arm/musicpal.c
+++ b/hw/arm/musicpal.c
@@ -1657,7 +1657,6 @@ static void musicpal_init(MachineState *machine)
         qdev_prop_set_uint32(dev, "num-blocks", flash_size / sector_size);
         qdev_prop_set_uint32(dev, "sector-length", sector_size);
         qdev_prop_set_uint8(dev, "width", 2); /* 16-bit */
-        qdev_prop_set_uint8(dev, "mappings", 0);
         qdev_prop_set_uint8(dev, "big-endian", 0);
         qdev_prop_set_uint16(dev, "id0", 0x00bf);
         qdev_prop_set_uint16(dev, "id1", 0x236d);
diff --git a/hw/arm/xilinx_zynq.c b/hw/arm/xilinx_zynq.c
index 8db6cfd47f5..d12b00e7648 100644
--- a/hw/arm/xilinx_zynq.c
+++ b/hw/arm/xilinx_zynq.c
@@ -220,7 +220,7 @@ static void zynq_init(MachineState *machine)
     pflash_cfi02_register(0xe2000000, "zynq.pflash", FLASH_SIZE,
                           dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
                           FLASH_SECTOR_SIZE, 1,
-                          1, 0x0066, 0x0022, 0x0000, 0x0000, 0x0555, 0x2aa,
+                          0x0066, 0x0022, 0x0000, 0x0000, 0x0555, 0x2aa,
                           0);
 
     /* Create the main clock source, and feed slcr with it */
diff --git a/hw/block/pflash_cfi02.c b/hw/block/pflash_cfi02.c
index 6f4b3e3c3fe..2b412402fac 100644
--- a/hw/block/pflash_cfi02.c
+++ b/hw/block/pflash_cfi02.c
@@ -968,7 +968,7 @@ PFlashCFI02 *pflash_cfi02_register(hwaddr base,
                                    hwaddr size,
                                    BlockBackend *blk,
                                    uint32_t sector_len,
-                                   int nb_mappings, int width,
+                                   int width,
                                    uint16_t id0, uint16_t id1,
                                    uint16_t id2, uint16_t id3,
                                    uint16_t unlock_addr0,
@@ -977,7 +977,6 @@ PFlashCFI02 *pflash_cfi02_register(hwaddr base,
 {
     DeviceState *dev = qdev_new(TYPE_PFLASH_CFI02);
 
-    assert(nb_mappings <= 1);
     if (blk) {
         qdev_prop_set_drive(dev, "drive", blk);
     }
diff --git a/hw/lm32/lm32_boards.c b/hw/lm32/lm32_boards.c
index b5d97dd53ed..96877ba7cfb 100644
--- a/hw/lm32/lm32_boards.c
+++ b/hw/lm32/lm32_boards.c
@@ -121,7 +121,7 @@ static void lm32_evr_init(MachineState *machine)
     pflash_cfi02_register(flash_base, "lm32_evr.flash", flash_size,
                           dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
                           flash_sector_size,
-                          1, 2, 0x01, 0x7e, 0x43, 0x00, 0x555, 0x2aa, 1);
+                          2, 0x01, 0x7e, 0x43, 0x00, 0x555, 0x2aa, 1);
 
     /* create irq lines */
     env->pic_state = lm32_pic_init(qemu_allocate_irq(cpu_irq_handler, cpu, 0));
@@ -218,7 +218,7 @@ static void lm32_uclinux_init(MachineState *machine)
     pflash_cfi02_register(flash_base, "lm32_uclinux.flash", flash_size,
                           dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
                           flash_sector_size,
-                          1, 2, 0x01, 0x7e, 0x43, 0x00, 0x555, 0x2aa, 1);
+                          2, 0x01, 0x7e, 0x43, 0x00, 0x555, 0x2aa, 1);
 
     /* create irq lines */
     env->pic_state = lm32_pic_init(qemu_allocate_irq(cpu_irq_handler, env, 0));
diff --git a/hw/ppc/ppc405_boards.c b/hw/ppc/ppc405_boards.c
index 8f77887fb18..2503e033497 100644
--- a/hw/ppc/ppc405_boards.c
+++ b/hw/ppc/ppc405_boards.c
@@ -198,7 +198,7 @@ static void ref405ep_init(MachineState *machine)
         pflash_cfi02_register((uint32_t)(-bios_size),
                               "ef405ep.bios", bios_size,
                               blk_by_legacy_dinfo(dinfo),
-                              64 * KiB, 1,
+                              64 * KiB,
                               2, 0x0001, 0x22DA, 0x0000, 0x0000, 0x555, 0x2AA,
                               1);
     } else
@@ -469,7 +469,7 @@ static void taihu_405ep_init(MachineState *machine)
         pflash_cfi02_register(0xFFE00000,
                               "taihu_405ep.bios", bios_size,
                               blk_by_legacy_dinfo(dinfo),
-                              64 * KiB, 1,
+                              64 * KiB,
                               4, 0x0001, 0x22DA, 0x0000, 0x0000, 0x555, 0x2AA,
                               1);
         fl_idx++;
@@ -502,7 +502,7 @@ static void taihu_405ep_init(MachineState *machine)
         bios_size = 32 * MiB;
         pflash_cfi02_register(0xfc000000, "taihu_405ep.flash", bios_size,
                               blk_by_legacy_dinfo(dinfo),
-                              64 * KiB, 1,
+                              64 * KiB,
                               4, 0x0001, 0x22DA, 0x0000, 0x0000, 0x555, 0x2AA,
                               1);
         fl_idx++;
diff --git a/hw/sh4/r2d.c b/hw/sh4/r2d.c
index 443820901d4..b7288dcba80 100644
--- a/hw/sh4/r2d.c
+++ b/hw/sh4/r2d.c
@@ -301,7 +301,7 @@ static void r2d_init(MachineState *machine)
     dinfo = drive_get(IF_PFLASH, 0, 0);
     pflash_cfi02_register(0x0, "r2d.flash", FLASH_SIZE,
                           dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
-                          64 * KiB, 1, 2, 0x0001, 0x227e, 0x2220, 0x2200,
+                          64 * KiB, 2, 0x0001, 0x227e, 0x2220, 0x2200,
                           0x555, 0x2aa, 0);
 
     /* NIC: rtl8139 on-board, and 2 slots. */
-- 
2.26.3


