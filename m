Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C88AC42615F
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Oct 2021 02:34:30 +0200 (CEST)
Received: from localhost ([::1]:53700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYdqH-0001LC-Qq
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 20:34:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3S5BfYQgKCvoywjcqvujiqqing.eqosgow-fgxgnpqpipw.qti@flex--wuhaotsh.bounces.google.com>)
 id 1mYdiw-00014F-JU
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 20:26:54 -0400
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a]:49674)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3S5BfYQgKCvoywjcqvujiqqing.eqosgow-fgxgnpqpipw.qti@flex--wuhaotsh.bounces.google.com>)
 id 1mYdiv-0004JU-0g
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 20:26:54 -0400
Received: by mail-pl1-x64a.google.com with SMTP id
 y13-20020a1709029b8d00b0013dc7c668e2so3996733plp.16
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 17:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=rEeP2b49EvWZof6Fv/RhovI0fLSmlZy99n+P5p6YrW0=;
 b=qhyAbzK7XmpR5p+7c77HWe8kcAQmVNkugLXKw8eb1uGBlcurJSH6EN5u3X4Z9S+Fnc
 K0tDgugShv0Zb1ZVr4HVw3f6F1M5fbXYw3ZtwFlfdRAp/wZDDRcJvzbWd2gCaPCFMrkn
 h0Uy+L1TQ1CVr5lMb2DkkUZl2O6d+Jm5yFPWFK3tlUXF+jscmVDBfo3UK1neFSDFvIuQ
 mqAf7/UVaFxcTtiYYnaaALPl3Rv0pP8gItvWlTJnG+0bkSlBh0abW7wgYVWqfz1FpIVi
 zrQwZHHob4bXnecUP2IraRZF4jn3fr8U3trNtV5g+2mGJbaJFB/PzrKt3oAcONZ7avEj
 5+sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=rEeP2b49EvWZof6Fv/RhovI0fLSmlZy99n+P5p6YrW0=;
 b=LkaO1odWK2Q2yxc3DUDFSMceZnpa5jSjUKlFjgLJpPd9RDMSMfXvWoiJjla8uBmj79
 s7pA7p5nl5mYZ13Z/ONXX/2+REbWRaPF/tUKEaCsZDs/t54poQ94yLFI+cKrqoplKcP8
 79ZiuyW/GQpbsVyGBeU+T3tmJs8kpE+mZZ5Ayta4o3BaBKkLxA58OTH2S6Y6gSfV/FmH
 ymBzDaMrAcF7f9gvGFXFQgaiU9YVaKPkpff3TaAByyfaNKZZ96FQzw66Z7GLTsHntpEt
 dy24l7XIe1zhcEH4kXeBy90Ve803p4hMngV0mJ0nus99ggerShT4lFgcBhNjXn90QDZz
 ug3A==
X-Gm-Message-State: AOAM531TSvRQQI1J1wGjL6tgswgTOWwa0lsxRLECm/uaTRpDoHcVQJE7
 8Xzki1LvCC1fV0zIZsRYjtwDCqWXa1a8bA==
X-Google-Smtp-Source: ABdhPJylMSQsJgVV+PMePWESzkD+XCE41oZRmN1CZpn3s6z4js/Z91tHIgd7dXMlQjKDB75xh7p9iSD9zbsxXg==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a17:902:ea0a:b0:13e:8b24:b94 with SMTP id
 s10-20020a170902ea0a00b0013e8b240b94mr6714454plg.45.1633652811113; Thu, 07
 Oct 2021 17:26:51 -0700 (PDT)
Date: Thu,  7 Oct 2021 17:26:26 -0700
In-Reply-To: <20211008002628.1958285-1-wuhaotsh@google.com>
Message-Id: <20211008002628.1958285-4-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20211008002628.1958285-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.33.0.882.g93a45727a2-goog
Subject: [PATCH v2 3/5] hw/arm: Attach MMC to quanta-gbs-bmc
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, wuhaotsh@google.com, 
 venture@google.com, Avi.Fishman@nuvoton.com, kfting@nuvoton.com, 
 hskinnemoen@google.com, f4bug@amsat.org, bin.meng@windriver.com, 
 qemu-block@nongnu.org, maoshengtan2011@gmail.com, 
 Shengtan Mao <stmao@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::64a;
 envelope-from=3S5BfYQgKCvoywjcqvujiqqing.eqosgow-fgxgnpqpipw.qti@flex--wuhaotsh.bounces.google.com;
 helo=mail-pl1-x64a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Shengtan Mao <stmao@google.com>

Signed-off-by: Shengtan Mao <stmao@google.com>
Reviewed-by: Hao Wu <wuhaotsh@google.com>
Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
Signed-off-by: Hao Wu <wuhaotsh@google.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/npcm7xx_boards.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/hw/arm/npcm7xx_boards.c b/hw/arm/npcm7xx_boards.c
index a656169f61..dec7d16ae5 100644
--- a/hw/arm/npcm7xx_boards.c
+++ b/hw/arm/npcm7xx_boards.c
@@ -27,6 +27,9 @@
 #include "qemu-common.h"
 #include "qemu/datadir.h"
 #include "qemu/units.h"
+#include "sysemu/blockdev.h"
+#include "sysemu/sysemu.h"
+#include "sysemu/block-backend.h"
 
 #define NPCM750_EVB_POWER_ON_STRAPS 0x00001ff7
 #define QUANTA_GSJ_POWER_ON_STRAPS 0x00001fff
@@ -81,6 +84,22 @@ static void npcm7xx_connect_dram(NPCM7xxState *soc, MemoryRegion *dram)
                              &error_abort);
 }
 
+static void sdhci_attach_drive(SDHCIState *sdhci)
+{
+        DriveInfo *di = drive_get_next(IF_SD);
+        BlockBackend *blk = di ? blk_by_legacy_dinfo(di) : NULL;
+
+        BusState *bus = qdev_get_child_bus(DEVICE(sdhci), "sd-bus");
+        if (bus == NULL) {
+            error_report("No SD bus found in SOC object");
+            exit(1);
+        }
+
+        DeviceState *carddev = qdev_new(TYPE_SD_CARD);
+        qdev_prop_set_drive_err(carddev, "drive", blk, &error_fatal);
+        qdev_realize_and_unref(carddev, bus, &error_fatal);
+}
+
 static NPCM7xxState *npcm7xx_create_soc(MachineState *machine,
                                         uint32_t hw_straps)
 {
@@ -355,6 +374,7 @@ static void quanta_gbs_init(MachineState *machine)
                           drive_get(IF_MTD, 0, 0));
 
     quanta_gbs_i2c_init(soc);
+    sdhci_attach_drive(&soc->mmc.sdhci);
     npcm7xx_load_kernel(machine, soc);
 }
 
-- 
2.33.0.882.g93a45727a2-goog


