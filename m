Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE2BB3A85AE
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 17:56:18 +0200 (CEST)
Received: from localhost ([::1]:43672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltBQH-0001R7-Qx
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 11:56:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltBF3-0005ug-4K
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 11:44:41 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:55864)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltBEc-0000wQ-6h
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 11:44:40 -0400
Received: by mail-wm1-x334.google.com with SMTP id c84so1675411wme.5
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 08:44:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=F40gxiYinenW+cm6aOgZ/x5eq1Jz1axR8fmmjJ+gQyk=;
 b=L8Wwf3cWrYhKP2AOguzxjcP7vHVtUzFtdjVvCmaQHIQDKkyfpjQZulox4Hlv2RMyfK
 Jxi5oP9YdXuXxEiUNBsKiuNNWYmgrNpxEp0DeGRT2ZHsgTZ/5HkGH9srgyWC6n3Uj3Jp
 emseU5B1senj8jZR3bOdowlMtkU9EMx/yXhJkbFKk/K/4SBngiv3PheLRVjQSF9N6x6f
 JvtuSoIweKcP5/k2N20p0tHXSjWjlIB9SBFoVYwqf1op+6BnVOOjYzL8iDeSzYzKuHxl
 +kBVTHHTOBxhrHl8X8J0UlGwa7LrYVoHWdIWtDLaaLpkDsTf1Uysybimm+iXrNsyRf2G
 gUjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=F40gxiYinenW+cm6aOgZ/x5eq1Jz1axR8fmmjJ+gQyk=;
 b=lMJnl+vktRV1CDBoG4XY9TLcKLBGYql/bJwFF1ztrF3sj2ju5q/wxn+BFpgaxzgPt6
 g/mJ2XI8FZ2dTLjs/WAjEybWPGuULU67ixpFdywHjXdY7g/0vsr8cNjd78ZOnIFtden7
 O892mV0I/50ZW+EWkahXRV86LhuHo+QHKD0FLmDpqzf2CNyMdKeBAS5LmF4ysxmoA5Mo
 1Jfb/aDhDa+soX8wP+IR4wlD2cLsA9Df0k6sVqg4csO+TfPZd1kRfdHLIH0r/EtHBpCA
 rJWErFiDsClZzA4IFSMRaspYuhWw3MtYu57Y1B7fgtAWWgJY9Z43H6foHrL0ZCPKX13I
 vYGA==
X-Gm-Message-State: AOAM533S4QzMVfur34o1WJxejznVe5Aq+Is+mZu0eI19DzZ3IdFoZcOM
 7Ls8qt5cb2xDOaRFVgiKwW4hajN4mWpSsA==
X-Google-Smtp-Source: ABdhPJyJnf6c8scSpRDpA49Ie6pck46YCx1Nwlp7+PKOk1axpUr1Yr46a2cb99sTLix36Q8VpaoHeA==
X-Received: by 2002:a1c:1dd3:: with SMTP id d202mr23362508wmd.78.1623771852862; 
 Tue, 15 Jun 2021 08:44:12 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id d15sm18985662wri.58.2021.06.15.08.44.12
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 08:44:12 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 06/28] hw/arm: add quanta-gbs-bmc machine
Date: Tue, 15 Jun 2021 16:43:43 +0100
Message-Id: <20210615154405.21399-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210615154405.21399-1-peter.maydell@linaro.org>
References: <20210615154405.21399-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

From: Patrick Venture <venture@google.com>

Adds initial quanta-gbs-bmc machine support.

Tested: Boots to userspace.
Signed-off-by: Patrick Venture <venture@google.com>
Reviewed-by: Brandon Kim <brandonkim@google.com>
Reviewed-by: Hao Wu <wuhaotsh@google.com>
Message-id: 20210608193605.2611114-2-venture@google.com
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/npcm7xx_boards.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/hw/arm/npcm7xx_boards.c b/hw/arm/npcm7xx_boards.c
index 698be46d303..29026f0847b 100644
--- a/hw/arm/npcm7xx_boards.c
+++ b/hw/arm/npcm7xx_boards.c
@@ -29,6 +29,7 @@
 
 #define NPCM750_EVB_POWER_ON_STRAPS 0x00001ff7
 #define QUANTA_GSJ_POWER_ON_STRAPS 0x00001fff
+#define QUANTA_GBS_POWER_ON_STRAPS 0x000017ff
 
 static const char npcm7xx_default_bootrom[] = "npcm7xx_bootrom.bin";
 
@@ -268,6 +269,22 @@ static void quanta_gsj_init(MachineState *machine)
     npcm7xx_load_kernel(machine, soc);
 }
 
+static void quanta_gbs_init(MachineState *machine)
+{
+    NPCM7xxState *soc;
+
+    soc = npcm7xx_create_soc(machine, QUANTA_GBS_POWER_ON_STRAPS);
+    npcm7xx_connect_dram(soc, machine->ram);
+    qdev_realize(DEVICE(soc), NULL, &error_fatal);
+
+    npcm7xx_load_bootrom(machine, soc);
+
+    npcm7xx_connect_flash(&soc->fiu[0], 0, "mx66u51235f",
+                          drive_get(IF_MTD, 0, 0));
+
+    npcm7xx_load_kernel(machine, soc);
+}
+
 static void npcm7xx_set_soc_type(NPCM7xxMachineClass *nmc, const char *type)
 {
     NPCM7xxClass *sc = NPCM7XX_CLASS(object_class_by_name(type));
@@ -316,6 +333,18 @@ static void gsj_machine_class_init(ObjectClass *oc, void *data)
     mc->default_ram_size = 512 * MiB;
 };
 
+static void gbs_bmc_machine_class_init(ObjectClass *oc, void *data)
+{
+    NPCM7xxMachineClass *nmc = NPCM7XX_MACHINE_CLASS(oc);
+    MachineClass *mc = MACHINE_CLASS(oc);
+
+    npcm7xx_set_soc_type(nmc, TYPE_NPCM730);
+
+    mc->desc = "Quanta GBS (Cortex-A9)";
+    mc->init = quanta_gbs_init;
+    mc->default_ram_size = 1 * GiB;
+}
+
 static const TypeInfo npcm7xx_machine_types[] = {
     {
         .name           = TYPE_NPCM7XX_MACHINE,
@@ -332,6 +361,10 @@ static const TypeInfo npcm7xx_machine_types[] = {
         .name           = MACHINE_TYPE_NAME("quanta-gsj"),
         .parent         = TYPE_NPCM7XX_MACHINE,
         .class_init     = gsj_machine_class_init,
+    }, {
+        .name           = MACHINE_TYPE_NAME("quanta-gbs-bmc"),
+        .parent         = TYPE_NPCM7XX_MACHINE,
+        .class_init     = gbs_bmc_machine_class_init,
     },
 };
 
-- 
2.20.1


