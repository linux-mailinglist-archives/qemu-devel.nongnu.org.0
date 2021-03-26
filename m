Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53393349E06
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 01:35:08 +0100 (CET)
Received: from localhost ([::1]:41124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPaRP-0000Xx-BK
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 20:35:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lPaKh-0002oE-L9; Thu, 25 Mar 2021 20:28:19 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:33401)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lPaKf-0004FA-Ua; Thu, 25 Mar 2021 20:28:11 -0400
Received: by mail-wr1-x42b.google.com with SMTP id o16so4072180wrn.0;
 Thu, 25 Mar 2021 17:28:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nDWnefwEc2MavpEPfUetVUP5VldhKkTrnJaHJ9vDFJg=;
 b=qWF7s3vr6tMbXqm7PL121kfpJIY8tLAD0lQs1XkGxpQSsqetG8+7mYnujU6/vtjlZ3
 xkEA18Dfj7wNUC7PPAYJVjG7JlRl8l+QikwyDBd7nUHWj6yJjCv+NvkFyw64vWdhLVje
 DI7/sRKj4UFmH8Ye7vGZBO+k9oiwNLt6ze1k0Nc/I1v15h+HLy20NHLeTKIwCpkHKfhD
 QMZqo+WPyE9kwZPTaiN4OrLLttIKwEs+7MPKJz3NnYA3mUCvopedhIRNNCo3yI3u7hYs
 BjxDQfMJ5sFTlAJlBxEyRnEQLqNDQwrwbE4o/xl6Otw9YJkx0dTfLpjauJXrAmtqdQmJ
 Ju+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=nDWnefwEc2MavpEPfUetVUP5VldhKkTrnJaHJ9vDFJg=;
 b=hDLVZtS9Ec5so84JkCjPD3TwkfCX/IZRCCyXLOb/6AyCsJ4oeXGP9twO4P58iedMKA
 QCM7R6td1O+k8PzgNYAYdNEvlWwaojcBCEO88RbUfSObW5oMegsvK83NVROOeg4ZLLG0
 8oM177oGAslIfOK1ZHwKon0RWCZCM1Ge3fT5BO+r2qLFkP1KdQ+XFpSQKipq6/LRs9no
 Fm/mE0FSB7RARDs2YR7Mqd98T/L84WGusPSmRbXJbHMKCV3h8ZuquuWmh0MavBKtgS36
 +6qujSBIqKt1A9FYSfrbjxvBrvf7go8aqBRosM2/rGk9iQENRabp+J0Rx2O17T6JPOAs
 i7BA==
X-Gm-Message-State: AOAM533xVxoaXSh/Y2ukT0MmTwaAhCGy7KWw8Xi9ekw1tBRTQEYuURME
 y9GATlIzwYcjj/B4+LeV+brPqOIhKdvT6w==
X-Google-Smtp-Source: ABdhPJxGX774X1QY6/TgwL3qC1ihPzYVBr6n4pJ2MKpCiZAmwvKQNGUbaNZUHgO6BcWW2fw/ALzzAQ==
X-Received: by 2002:adf:8b45:: with SMTP id v5mr11436323wra.398.1616718487086; 
 Thu, 25 Mar 2021 17:28:07 -0700 (PDT)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id y1sm7976686wmq.29.2021.03.25.17.28.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Mar 2021 17:28:06 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-6.1 07/10] hw/block/pflash_cfi02: Simplify
 pflash_cfi02_register() prototype
Date: Fri, 26 Mar 2021 01:27:25 +0100
Message-Id: <20210326002728.1069834-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210326002728.1069834-1-f4bug@amsat.org>
References: <20210326002728.1069834-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
 Magnus Damm <magnus.damm@gmail.com>, Jan Kiszka <jan.kiszka@web.de>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>, Michael Walle <michael@walle.cc>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Antony Pavlov <antonynpavlov@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Greg Kurz <groug@kaod.org>,
 Max Reitz <mreitz@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The previous commit removed the mapping code from TYPE_PFLASH_CFI02.
pflash_cfi02_register() doesn't use the 'nb_mappings' argument
anymore. Simply remove it to simplify.

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
2.26.2


