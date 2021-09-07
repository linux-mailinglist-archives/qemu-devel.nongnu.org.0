Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C60F403183
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 01:28:27 +0200 (CEST)
Received: from localhost ([::1]:57374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNkVu-0002vP-Ha
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 19:28:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3KfU3YQgKCgQ0ylesxwlksskpi.gsquiqy-hiziprsrkry.svk@flex--wuhaotsh.bounces.google.com>)
 id 1mNkUA-0000Nf-0h
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 19:26:38 -0400
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a]:34811)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3KfU3YQgKCgQ0ylesxwlksskpi.gsquiqy-hiziprsrkry.svk@flex--wuhaotsh.bounces.google.com>)
 id 1mNkU8-00043n-IN
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 19:26:37 -0400
Received: by mail-yb1-xb4a.google.com with SMTP id
 v66-20020a25abc8000000b0059ef57c3386so228615ybi.1
 for <qemu-devel@nongnu.org>; Tue, 07 Sep 2021 16:26:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=zsaZyxSC/g90JPwTp+9hoBfFf0HUoTXG7Um9NUxoKAE=;
 b=iy9MB6gaYhfMakYshG14jsJ2nK2RiQi8lsCdJS0dXT617XjL4VKBKz7XYnlDlVF0Z+
 HzT150RIjCCKVODAXJuM6TXS4K9g4HQ8ErmNMhpzsPiZWR8kfgTwvSttTKGjDjjSMslc
 LnkqSB4oRbt4ijx9YVDNF44W0BBP7lg0V2C7VqlHW4WWqI0sK61N1DYK4Q829gVLvvdV
 zMrxY6J74IZTXDFX68dGd3u1ZDvXWQqxggueno6BSZpG/l+fBL32IBYo5yDm+T3989Vj
 VjXDD17s6Uxltuw2pK4ecxcvw4LpmRZJPD0ajQvhAVF2R/DlxawThcpd+v22+itlADqC
 UKsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=zsaZyxSC/g90JPwTp+9hoBfFf0HUoTXG7Um9NUxoKAE=;
 b=ntpvL8ziToCRGO4iVnDvSc/LQGVbnvmL78sM1iUMN/gRE0aCRsxlznjNMCzZ44/Tgt
 XlR/gvF0RdmoDzzwUCGWJ58Rmy7EO8ac96P5mdzAq4GQs0f8+eUWNFwNZHBBhS3lbObx
 /X9zOsml13Q1i7aqXCG9p+5eFf87TCfrRzJ1RCH9pTx72/1RR/2Yo0sML0QwwLY4n2qw
 IGE73Zxpaf/kqrcpRgymd5ysOjd1TnMgAcRfCmaJsSeoL3oEJkiDGVJLRn8V7Z1X9RxP
 W5hiuylTvL/q1/ht7nmWin20NcRoNqe/bAehhspgazX2iAWm0CNSS/WNeTSgNivwHIr8
 77Gg==
X-Gm-Message-State: AOAM530TehuHWLfArb2CNDxYwN7DAkyF5zKRJQq/J+Le786JSPGU9oeg
 O2G95e09oO/WPBLK1Y6zf6BchE1MlwH5sQ==
X-Google-Smtp-Source: ABdhPJyclzLHrPLC7g8LdwIHpedomzjnVT6pPCbrwdRcaKE10R7Yy7NbEx9pMZs5IaisuFRBooeIAtUtb1o3zA==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a5b:408:: with SMTP id
 m8mr1182359ybp.2.1631057193753; Tue, 07 Sep 2021 16:26:33 -0700 (PDT)
Date: Tue,  7 Sep 2021 16:25:54 -0700
In-Reply-To: <20210907232555.3268967-1-wuhaotsh@google.com>
Message-Id: <20210907232555.3268967-4-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20210907232555.3268967-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.33.0.153.gba50c8fa24-goog
Subject: [PATCH 3/4] hw/arm: Attach MMC to quanta-gbs-bmc
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, wuhaotsh@google.com, 
 venture@google.com, Avi.Fishman@nuvoton.com, kfting@nuvoton.com, 
 hskinnemoen@google.com, f4bug@amsat.org, bin.meng@windriver.com, 
 qemu-block@nongnu.org, Shengtan Mao <stmao@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b4a;
 envelope-from=3KfU3YQgKCgQ0ylesxwlksskpi.gsquiqy-hiziprsrkry.svk@flex--wuhaotsh.bounces.google.com;
 helo=mail-yb1-xb4a.google.com
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
---
 hw/arm/npcm7xx_boards.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/hw/arm/npcm7xx_boards.c b/hw/arm/npcm7xx_boards.c
index e5a3243995..7205483280 100644
--- a/hw/arm/npcm7xx_boards.c
+++ b/hw/arm/npcm7xx_boards.c
@@ -27,6 +27,10 @@
 #include "qemu-common.h"
 #include "qemu/datadir.h"
 #include "qemu/units.h"
+#include "sysemu/blockdev.h"
+#include "sysemu/sysemu.h"
+#include "sysemu/block-backend.h"
+
 
 #define NPCM750_EVB_POWER_ON_STRAPS 0x00001ff7
 #define QUANTA_GSJ_POWER_ON_STRAPS 0x00001fff
@@ -80,6 +84,22 @@ static void npcm7xx_connect_dram(NPCM7xxState *soc, MemoryRegion *dram)
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
@@ -354,6 +374,7 @@ static void quanta_gbs_init(MachineState *machine)
                           drive_get(IF_MTD, 0, 0));
 
     quanta_gbs_i2c_init(soc);
+    sdhci_attach_drive(&soc->mmc.sdhci);
     npcm7xx_load_kernel(machine, soc);
 }
 
-- 
2.33.0.153.gba50c8fa24-goog


