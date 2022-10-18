Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 078266034D3
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 23:20:50 +0200 (CEST)
Received: from localhost ([::1]:35458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oku11-0001yA-KF
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 17:20:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oktjg-00023M-GE; Tue, 18 Oct 2022 17:02:53 -0400
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a]:42964)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oktje-0003xi-F8; Tue, 18 Oct 2022 17:02:52 -0400
Received: by mail-lf1-x12a.google.com with SMTP id o12so16306048lfq.9;
 Tue, 18 Oct 2022 14:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7YchITTcnUYZ4WJgcEjOn1WReqvfHLeSxHYKWWHpblk=;
 b=mIu78TgwdsUFSOJMzz5E19m6py/vXIuYPpmg4uJeX926ilIWOFVKKl590pM0l9vOeI
 3Yj9sBSjgEsYiriNqqHMdaW35pI9Shsjn9+Fh/uXBl2kFdwWZHCf8Y7qfROkwgyym66l
 HreV64FM2dmUGL7SUQXz7Sh+ZfWj2CwFiEijn72LC3TacCvD8EXZameHcwww2eSn707N
 4hjn5gwL7MnRKW+Tr1NP+RPCU77jD6s16uAScKXrZ13/BtC6RgPwTJ0A8/QTvfyuwgr2
 e7lvnxMWWjSHz6Aaxt5QpNs+6tmhnePDZl7RI2bGs0WCKEiIsh1Ql2uDsTYtYlupNZAC
 JI0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7YchITTcnUYZ4WJgcEjOn1WReqvfHLeSxHYKWWHpblk=;
 b=ZQEGFG9QDy66pkc/WgMGuCz/xWVgXAcG9oFXyE4Mt1RE+IbqWT3uOgaYuW0eRAVnCE
 PsUzhx/6ylel4siZ+MHaTnJu9h5EDL27IuwUrZQaho/a509xZqzOqdR+DmsSddv48x2h
 o/eJIOxUsL91J01R6RVq8YO2cir1B536aUHE7/Sl5NpUkI0aDLhcekROdarREcUEx+o3
 CVOI0tVBgUTZKTlfcf5JGg1wgd8siTAkZN5SBxTAkbwW6UHsePrDDk0GovM7orAaVvs+
 h+/8rhRmRcbhbZj+w9efQIUVtBCLusPiYtMg//W+mZUT9ckzlu/Scgeptdr3NwMtV5em
 Vv0A==
X-Gm-Message-State: ACrzQf0plq4FO5kGHciMyX8Eudiynk7HTa3XMLZmeWxXWwqk6ERrjR2H
 1vDbJfjGFZHmfwEFZ+yAXVCzbuWjYQo=
X-Google-Smtp-Source: AMsMyM6k6JBoSELlxdupOJatE2uD3jhDMBvVith35MD5CpsREWZxYWMK2BaZWcVQYC+l25hLd6ecRw==
X-Received: by 2002:a17:907:7f1c:b0:78d:ddc7:dfb1 with SMTP id
 qf28-20020a1709077f1c00b0078dddc7dfb1mr4092561ejc.189.1666126956939; 
 Tue, 18 Oct 2022 14:02:36 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-078-054-012-048.78.54.pool.telefonica.de. [78.54.12.48])
 by smtp.gmail.com with ESMTPSA id
 fe7-20020a056402390700b004587c2b5048sm9407951edb.52.2022.10.18.14.02.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Oct 2022 14:02:36 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-ppc@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Antony Pavlov <antonynpavlov@gmail.com>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 Alistair Francis <alistair@alistair23.me>,
 Bin Meng <bin.meng@windriver.com>, Kevin Wolf <kwolf@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Jan Kiszka <jan.kiszka@web.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Hanna Reitz <hreitz@redhat.com>, qemu-arm@nongnu.org,
 Magnus Damm <magnus.damm@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-block@nongnu.org,
 Bernhard Beschow <shentey@gmail.com>, Bin Meng <bmeng.cn@gmail.com>
Subject: [PATCH v4 2/7] hw/block/pflash_cfi0{1,
 2}: Error out if device length isn't a power of two
Date: Tue, 18 Oct 2022 23:01:41 +0200
Message-Id: <20221018210146.193159-3-shentey@gmail.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221018210146.193159-1-shentey@gmail.com>
References: <20221018210146.193159-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12a;
 envelope-from=shentey@gmail.com; helo=mail-lf1-x12a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

According to the JEDEC standard the device length is communicated to an
OS as an exponent (power of two).

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/block/pflash_cfi01.c | 8 ++++++--
 hw/block/pflash_cfi02.c | 5 +++++
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/hw/block/pflash_cfi01.c b/hw/block/pflash_cfi01.c
index 0cbc2fb4cb..9c235bf66e 100644
--- a/hw/block/pflash_cfi01.c
+++ b/hw/block/pflash_cfi01.c
@@ -690,7 +690,7 @@ static const MemoryRegionOps pflash_cfi01_ops = {
     .endianness = DEVICE_NATIVE_ENDIAN,
 };
 
-static void pflash_cfi01_fill_cfi_table(PFlashCFI01 *pfl)
+static void pflash_cfi01_fill_cfi_table(PFlashCFI01 *pfl, Error **errp)
 {
     uint64_t blocks_per_device, sector_len_per_device, device_len;
     int num_devices;
@@ -708,6 +708,10 @@ static void pflash_cfi01_fill_cfi_table(PFlashCFI01 *pfl)
         sector_len_per_device = pfl->sector_len / num_devices;
     }
     device_len = sector_len_per_device * blocks_per_device;
+    if (!is_power_of_2(device_len)) {
+        error_setg(errp, "Device size must be a power of two.");
+        return;
+    }
 
     /* Hardcoded CFI table */
     /* Standard "QRY" string */
@@ -865,7 +869,7 @@ static void pflash_cfi01_realize(DeviceState *dev, Error **errp)
      */
     pfl->cmd = 0x00;
     pfl->status = 0x80; /* WSM ready */
-    pflash_cfi01_fill_cfi_table(pfl);
+    pflash_cfi01_fill_cfi_table(pfl, errp);
 }
 
 static void pflash_cfi01_system_reset(DeviceState *dev)
diff --git a/hw/block/pflash_cfi02.c b/hw/block/pflash_cfi02.c
index 2a99b286b0..ff2fe154c1 100644
--- a/hw/block/pflash_cfi02.c
+++ b/hw/block/pflash_cfi02.c
@@ -880,6 +880,11 @@ static void pflash_cfi02_realize(DeviceState *dev, Error **errp)
         return;
     }
 
+    if (!is_power_of_2(pfl->chip_len)) {
+        error_setg(errp, "Device size must be a power of two.");
+        return;
+    }
+
     memory_region_init_rom_device(&pfl->orig_mem, OBJECT(pfl),
                                   &pflash_cfi02_ops, pfl, pfl->name,
                                   pfl->chip_len, errp);
-- 
2.38.0


