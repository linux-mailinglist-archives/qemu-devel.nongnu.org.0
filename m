Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EDEF3A0428
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 21:40:02 +0200 (CEST)
Received: from localhost ([::1]:39380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqhZw-0005Nu-Td
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 15:40:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3x8a_YAcKCmATCLRSPCEMMEJC.AMKOCKS-BCTCJLMLELS.MPE@flex--venture.bounces.google.com>)
 id 1lqhWl-000850-Uy
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 15:36:43 -0400
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a]:51097)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3x8a_YAcKCmATCLRSPCEMMEJC.AMKOCKS-BCTCJLMLELS.MPE@flex--venture.bounces.google.com>)
 id 1lqhWj-0002D5-BG
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 15:36:43 -0400
Received: by mail-yb1-xb4a.google.com with SMTP id
 o12-20020a5b050c0000b02904f4a117bd74so28321138ybp.17
 for <qemu-devel@nongnu.org>; Tue, 08 Jun 2021 12:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=1R4OqYgXALabVeS1jjyB5oy/+6Sj3iQ62rsKQF+LgxI=;
 b=RkXqrjRgekzr5CjQOQBkgmrLWRpqPqTkRdb3fHTNCKCnK7D95oydx+fSVJNA8yAko8
 vBp6mGnI7PBNUxAqIQZ54XINY+weyY7vOrDPI6eHcO6BuRKUle1Wzc3+RDTFoL8Q5dpA
 nZw1iUmCRGFoWtIYX7mIy5qsbeqLi8FI5scl0eOBVNdPP14dK/88tEiFJncr4kJxPNOI
 dRy94eoDFOEG1oTr3xRrXWMHwEfPylbmCBd38BFczFQdyEVTYXxnmtOmJX+yJgx13NCd
 lWfHwTekF1wYYkgMAD1GyXQJZXXiyP/6KUvkDe+DfEDLl5XvYlOeWVTqEnDOPZdtBFzt
 flAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=1R4OqYgXALabVeS1jjyB5oy/+6Sj3iQ62rsKQF+LgxI=;
 b=i6MRJA4l6m3toxHx7rVbIQ9dAAXBC/2LVkpgJJee12ttbL29kQWjVx5M9bVQaPRbqC
 z6km0+zXjDHsBGrn9CGlzIiLHRPlD+SVPwxag/g5OddJVqT6HhsNpqw+8czj8HpWBWPm
 jbTeTg6rDYQ5vwWinSi3iy1SxJobjJOMJdoFLq0JFcR0HmCi3CVIhzQwVkqDup9L++L/
 kp6/T3mkW6ttU0GExIdc15jRN5Y0qs/ZT8T/ZCiPpwmTSmC3uZUEw2c1iDWxY91fiqnL
 2aVrOkIFvMSQJBql8ngx34b34aEHqShlj+COGcdsrRSedgXy4gpS5oaqawLWnZZ8za1X
 m3Xg==
X-Gm-Message-State: AOAM530yBPKZ6HLRRTeCs9shs7t1t5a7PIIZgRELG4Ai/kS8bTpc5HUf
 blyVfG7oG5FDKpi+VmW3NfLwJOzO1bTW
X-Google-Smtp-Source: ABdhPJyCFncshnyenGVbwRM0cbBQndhymGGOPPM/uXcQLPkuUoFGHxkbfNM1dxt2KXGT6D54eazxKQqaz6ml
X-Received: from venture.svl.corp.google.com
 ([2620:15c:2a3:200:f886:41e8:7e16:711b])
 (user=venture job=sendgmr) by 2002:a25:5015:: with SMTP id
 e21mr9691309ybb.166.1623180999359; Tue, 08 Jun 2021 12:36:39 -0700 (PDT)
Date: Tue,  8 Jun 2021 12:36:05 -0700
In-Reply-To: <20210608193605.2611114-1-venture@google.com>
Message-Id: <20210608193605.2611114-3-venture@google.com>
Mime-Version: 1.0
References: <20210608193605.2611114-1-venture@google.com>
X-Mailer: git-send-email 2.32.0.rc1.229.g3e70b5a671-goog
Subject: [PATCH v2 2/2] hw/arm: quanta-gbs-bmc add i2c comments
From: Patrick Venture <venture@google.com>
To: hskinnemoen@google.com, kfting@nuvoton.com, peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Patrick Venture <venture@google.com>, Brandon Kim <brandonkim@google.com>,
 Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b4a;
 envelope-from=3x8a_YAcKCmATCLRSPCEMMEJC.AMKOCKS-BCTCJLMLELS.MPE@flex--venture.bounces.google.com;
 helo=mail-yb1-xb4a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
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

Add a comment and i2c method that describes the board layout.

Tested: firmware booted to userspace.
Signed-off-by: Patrick Venture <venture@google.com>
Reviewed-by: Brandon Kim <brandonkim@google.com>
Reviewed-by: Hao Wu <wuhaotsh@google.com>
---
 hw/arm/npcm7xx_boards.c | 60 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/hw/arm/npcm7xx_boards.c b/hw/arm/npcm7xx_boards.c
index 34a214fe79..d9de375826 100644
--- a/hw/arm/npcm7xx_boards.c
+++ b/hw/arm/npcm7xx_boards.c
@@ -238,6 +238,65 @@ static void quanta_gsj_fan_init(NPCM7xxMachine *machine, NPCM7xxState *soc)
     npcm7xx_connect_pwm_fan(soc, &splitter[2], 0x05, 1);
 }
 
+static void quanta_gbs_i2c_init(NPCM7xxState *soc)
+{
+    /*
+     * i2c-0:
+     *     pca9546@71
+     *
+     * i2c-1:
+     *     pca9535@24
+     *     pca9535@20
+     *     pca9535@21
+     *     pca9535@22
+     *     pca9535@23
+     *     pca9535@25
+     *     pca9535@26
+     *
+     * i2c-2:
+     *     sbtsi@4c
+     *
+     * i2c-5:
+     *     atmel,24c64@50 mb_fru
+     *     pca9546@71
+     *         - channel 0: max31725@54
+     *         - channel 1: max31725@55
+     *         - channel 2: max31725@5d
+     *                      atmel,24c64@51 fan_fru
+     *         - channel 3: atmel,24c64@52 hsbp_fru
+     *
+     * i2c-6:
+     *     pca9545@73
+     *
+     * i2c-7:
+     *     pca9545@72
+     *
+     * i2c-8:
+     *     adi,adm1272@10
+     *
+     * i2c-9:
+     *     pca9546@71
+     *         - channel 0: isil,isl68137@60
+     *         - channel 1: isil,isl68137@61
+     *         - channel 2: isil,isl68137@63
+     *         - channel 3: isil,isl68137@45
+     *
+     * i2c-10:
+     *     pca9545@71
+     *
+     * i2c-11:
+     *     pca9545@76
+     *
+     * i2c-12:
+     *     maxim,max34451@4e
+     *     isil,isl68137@5d
+     *     isil,isl68137@5e
+     *
+     * i2c-14:
+     *     pca9545@70
+     */
+}
+
 static void npcm750_evb_init(MachineState *machine)
 {
     NPCM7xxState *soc;
@@ -282,6 +341,7 @@ static void quanta_gbs_init(MachineState *machine)
     npcm7xx_connect_flash(&soc->fiu[0], 0, "mx66u51235f",
                           drive_get(IF_MTD, 0, 0));
 
+    quanta_gbs_i2c_init(soc);
     npcm7xx_load_kernel(machine, soc);
 }
 
-- 
2.31.1.751.gd2f1c929bd-goog


