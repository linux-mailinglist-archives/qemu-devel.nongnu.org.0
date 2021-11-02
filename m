Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E30A4438D5
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 23:56:05 +0100 (CET)
Received: from localhost ([::1]:49794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mi2hH-0002kp-0q
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 18:56:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3gsCBYQgKCh0PNA3HMLA9HH9E7.5HFJ7FN-67O7EGHG9GN.HK9@flex--wuhaotsh.bounces.google.com>)
 id 1mi2bC-0000oD-75
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 18:49:46 -0400
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a]:36398)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3gsCBYQgKCh0PNA3HMLA9HH9E7.5HFJ7FN-67O7EGHG9GN.HK9@flex--wuhaotsh.bounces.google.com>)
 id 1mi2b8-0001GT-53
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 18:49:45 -0400
Received: by mail-pf1-x44a.google.com with SMTP id
 c207-20020a621cd8000000b0048060050cfeso306997pfc.3
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 15:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=0IMzBe6hGicqZoM4it2xwyLQvbZD1D8UDosriF+DAlY=;
 b=RGt85yXzN0iPCy71vUzI+dnKKkvbJiTnIuJV244xqzd2jqwkVJDTOtgZIeVl/0QK3s
 z20Mb1wbJBKUOkfBO4a32uIPwU7m0Mj6lQotwFHb+TnpBxDwqz19H7D4tYLSA0Q3rui6
 g6cziXlJ9kttDFJYaFmYxoQu7sRskuBAgJsM095YB1YmO9I0YrCI1JzzBTCFFBJAObPd
 JBBsx9epPs+8dxaO3hrFkPNB2F7B7Nml2T3y9DGKNR+mM0Yh0aeqJCGGDkbyJ7mqRumP
 LsWVyb30YvhldXXNaQH14nVCF8CVWcvn733NKMZMXf46ID3lMKCHJxYAB+cKxpOT1mM/
 SKQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=0IMzBe6hGicqZoM4it2xwyLQvbZD1D8UDosriF+DAlY=;
 b=3CnJzZXWmnNtht/bXIo2BdbnixKANc8NhkL2s0Wov+VrEyggjQFS1jWAzyGlabl94H
 +EPnP8VKaaMOr/R3cnYLFud2OBj7rcz0N9WI3YPnAXNSTS/Z1OgmW4qKsdlii3pcLDSh
 ecn8xfDVs/m1AyfebNs5t/Augxi8ulM0raALYwFapm+YPz7r5f6F24oRHJWP8mmrVJXU
 TTxhWznntC0wNLQVWTnyTiXt5mcaUXz74RyhquEs39sTL0wWY7Fza/IgkCbwgQHBjoUB
 kenyCsmVIl659RdFhY5R52Krf/DFCkUBjBVGFggdbzVkWAmS+xjjMBAeaANfBzOYd4Ob
 Zdqg==
X-Gm-Message-State: AOAM530Y+6j63qHBmeptNJos6OzNO6D+Yf1VN7oWYHvxhAsVcKgaDSyl
 3egkDQoYH8YcY4/6ktaO8iHXLEaAZyugXg==
X-Google-Smtp-Source: ABdhPJz+4D+QH+FKp0G8rSEx2s9sMcfWqPkaDWto7gymkImly6IJDnhr70xIr8BXMhyVvOHa1byzNK3Xw1GSVg==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a17:903:1207:b0:13d:b9b1:ead7 with SMTP
 id l7-20020a170903120700b0013db9b1ead7mr34479842plh.63.1635893378852; Tue, 02
 Nov 2021 15:49:38 -0700 (PDT)
Date: Tue,  2 Nov 2021 15:49:22 -0700
In-Reply-To: <20211102224924.1244946-1-wuhaotsh@google.com>
Message-Id: <20211102224924.1244946-4-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20211102224924.1244946-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.33.1.1089.g2158813163f-goog
Subject: [PATCH v3 3/5] hw/arm: Attach MMC to quanta-gbs-bmc
From: Hao Wu <wuhaotsh@google.com>
To: richard.henderson@linaro.org
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 wuhaotsh@google.com, venture@google.com, Avi.Fishman@nuvoton.com, 
 kfting@nuvoton.com, hskinnemoen@google.com, f4bug@amsat.org, 
 bin.meng@windriver.com, qemu-block@nongnu.org, maoshengtan2011@gmail.com, 
 Shengtan Mao <stmao@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::44a;
 envelope-from=3gsCBYQgKCh0PNA3HMLA9HH9E7.5HFJ7FN-67O7EGHG9GN.HK9@flex--wuhaotsh.bounces.google.com;
 helo=mail-pf1-x44a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
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
2.33.1.1089.g2158813163f-goog


