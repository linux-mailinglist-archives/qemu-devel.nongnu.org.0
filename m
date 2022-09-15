Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 102625B9ECD
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Sep 2022 17:30:15 +0200 (CEST)
Received: from localhost ([::1]:35322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYqog-0006xM-6F
	for lists+qemu-devel@lfdr.de; Thu, 15 Sep 2022 11:30:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oYqkc-0007yP-3V; Thu, 15 Sep 2022 11:26:03 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:33567)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oYqka-0007JR-8f; Thu, 15 Sep 2022 11:26:01 -0400
Received: by mail-ed1-x529.google.com with SMTP id b35so27513521edf.0;
 Thu, 15 Sep 2022 08:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=trRT+7tjIVpvCqIzSqblXwJ9i2DPO9QCR+JSUJreV7c=;
 b=K4oU4Qc20J+L3cV5fzC1QeEWxRDMEBmtW7FkzNaq3TakM6ZaWiIBUiIJjQ/oEiiw/M
 80WBhz1IYzJyFTJFpwZ64cB12cYPGSztpPGFi2JljSWvyBhcwaJvOfM6sOF2Uy7DMBKS
 P5xw0/d60pxHc+gB8PuQTxfbiLoOsnf7TQwtPt7yW+b18ZpWEjPAZNCzuQq9SKpMyJUB
 IcwNBEYyQvwhy4yr986iohn25tN5cBNLd3Av+KlqFSjWlIOwEOJPqpj3fDSFhHMi9EFq
 ottdEjORVqmKlqTPBe4I4ptdEehVXa9HmL8vN/DnZ1VVVEgEg6d4P7Z+vMiTwrkEGDcl
 923g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=trRT+7tjIVpvCqIzSqblXwJ9i2DPO9QCR+JSUJreV7c=;
 b=g4qtyvHszHkXChlziR6bpX0F57qxVS/NH1bpul7k2yth2RmKXCWyy2ZmU/zT6kfGPG
 0yFYPPQvtKYOAa3CpcYmCzLbmSPiFFpR035qsXzM+j+u/pG6QYIH3a0iSDtKTvxGwsIa
 Dqe6SUpNn//DVAEekQ3oYCDweaZY9JMfSwvgfGGYEP3aP24z5UAHHvFheL6MaV3BHjrR
 On2jFWHxbVknjoTV8ZGIdr09pdCCbUq1cB2SiBGkzWfrIXPR2yHza3ma8vIYan+unWDF
 eZUqs4naQ/B3JLmtsXzAR/S1K0fLw+wj8g+SQxw4cdT065bgIukKwsyla5CXDi+rm9bx
 Vo2g==
X-Gm-Message-State: ACrzQf14DJPUqThmM1Y6HRAS1nfhbeoQ7l4xXmkaL4yTGnHu1OtSBRVd
 Svvw9N9b+6eS1UVj5zmz2QHofygxQss=
X-Google-Smtp-Source: AMsMyM48W8lDQ1zLNF2SmkdnMWlaBFk9dk89XjI0n5NR4TBrxZHGeAvV+BNaNcHzQLGIXUtUPz01jw==
X-Received: by 2002:a05:6402:1d54:b0:44e:a683:d041 with SMTP id
 dz20-20020a0564021d5400b0044ea683d041mr315912edb.411.1663255557976; 
 Thu, 15 Sep 2022 08:25:57 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-077-191-182-143.77.191.pool.telefonica.de. [77.191.182.143])
 by smtp.gmail.com with ESMTPSA id
 2-20020a170906210200b00730979f568fsm9297138ejt.150.2022.09.15.08.25.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Sep 2022 08:25:57 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-block@nongnu.org, Bin Meng <bin.meng@windriver.com>,
 qemu-ppc@nongnu.org, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 06/11] hw/block/pflash_cfi01: Error out if device length isn't
 a power of two
Date: Thu, 15 Sep 2022 17:25:15 +0200
Message-Id: <20220915152520.21948-7-shentey@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220915152520.21948-1-shentey@gmail.com>
References: <20220915152520.21948-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x529.google.com
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
---
 hw/block/pflash_cfi01.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/hw/block/pflash_cfi01.c b/hw/block/pflash_cfi01.c
index 0cbc2fb4cb..8c9b3f518a 100644
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
+    if (ctpop64(device_len) != 1) {
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
-- 
2.37.3


