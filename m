Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6492C4F6DE3
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Apr 2022 00:38:53 +0200 (CEST)
Received: from localhost ([::1]:49704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncEIe-0007Eo-8Z
	for lists+qemu-devel@lfdr.de; Wed, 06 Apr 2022 18:38:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3iRVOYggKCgY20nguzynmuumrk.iuswks0-jk1krtutmt0.uxm@flex--wuhaotsh.bounces.google.com>)
 id 1ncEEm-0002t5-Ln
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 18:34:52 -0400
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549]:34592)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3iRVOYggKCgY20nguzynmuumrk.iuswks0-jk1krtutmt0.uxm@flex--wuhaotsh.bounces.google.com>)
 id 1ncEEl-0004Vj-1D
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 18:34:52 -0400
Received: by mail-pg1-x549.google.com with SMTP id
 p4-20020a631e44000000b00399598a48c5so2124554pgm.1
 for <qemu-devel@nongnu.org>; Wed, 06 Apr 2022 15:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=ymjjOdC0992lny1+ec+yUqgw/mq/KDjWDZvAVTBHeg4=;
 b=N9Ki2SmsSPvsTQ8w3Zy1EJYtrilsoYMv0ImeKrnRYRtDcb0ViNgg2eo+YBg1Zd26CL
 dlDktNZAUKmd7YENk0wNBPRYTxVrmMmVHqc64rFNiwlb4r058Rt2zWdmkv27O2GZrsYn
 LVbEwjADfRxye7zUIbg5ugSzlqLqrM8GRf1o26Po6PWrX+KZjSjnW+7MG05uK44E4kZm
 hBAuGL6MJxK7QKE0If2x9jKrQkatDWkVd/uBS8Noo62nFPxFsOTBmZ4KnbehGOgorxO8
 mRp4FEOzDSTdiUTSdBGoadUN/sAa4oDbI+hlP0JyAy3kZzHTlgQGrPWobVme8vyR9jGV
 nalQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=ymjjOdC0992lny1+ec+yUqgw/mq/KDjWDZvAVTBHeg4=;
 b=b0va6ERk4R/SXPV1WnL21zs6TyPVnqXBIFiSh8XL7CN9NAFAYk/U/ydYNI200/EnxE
 QCm9NTNuzC0VaVKKYPnCqRzcwc7xc4mYfmaNkgp7kbF6ps2Eq4mBHp4KN9Xhh0Lziaz8
 wa39rZ9xtAx03BDF7j3aPS8YC0zg5wRZH5m4NKrB/GCVI5j36Ij21kC5iiKqYCpslVEz
 UB5Vxd74Xb4MJzGT1wAPXWP2q4kWFCCPNwoCPU1W3nMAL7yFe2SEGGlwuGjmbfT05tL1
 R6qtkingEsPcH4W1HhqxbZq2GsjQlMwXiOA7Etg3bp9zZ/VKowpuhPAZYNvjqB/Yq1yB
 38OA==
X-Gm-Message-State: AOAM532qdvv3CK/cPeS/Hw+B02+AgoAdJdR3vPCJWHtaB0O00/HEMgTZ
 waw6QJ7hP5UrObgHEX4TsToIPiE54A6cXQ==
X-Google-Smtp-Source: ABdhPJz5LgUHEq0zPT1ZrzPrWgh4d6THvoRVVui6fg3xilsL8HZkJreox+hiZNwY8QgfyEMtagtX6dLbzONrUQ==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a17:90b:352:b0:1c6:77e:a4f7 with SMTP id
 fh18-20020a17090b035200b001c6077ea4f7mr12227919pjb.77.1649284489049; Wed, 06
 Apr 2022 15:34:49 -0700 (PDT)
Date: Wed,  6 Apr 2022 15:34:39 -0700
In-Reply-To: <20220406223440.2901032-1-wuhaotsh@google.com>
Message-Id: <20220406223440.2901032-2-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20220406223440.2901032-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.35.1.1094.g7c7d902a7c-goog
Subject: [PATCH 1/2] hw/misc: Add PWRON STRAP bit fields in GCR module
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, wuhaotsh@google.com, 
 venture@google.com, Avi.Fishman@nuvoton.com, kfting@nuvoton.com, 
 hskinnemoen@google.com, Uri.Trichter@nuvoton.com, Vishal.Soni@microsoft.com, 
 titusr@google.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::549;
 envelope-from=3iRVOYggKCgY20nguzynmuumrk.iuswks0-jk1krtutmt0.uxm@flex--wuhaotsh.bounces.google.com;
 helo=mail-pg1-x549.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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

Similar to the Aspeed code in include/misc/aspeed_scu.h, we define
the PWRON STRAP fields in their corresponding module for NPCM7XX.

Signed-off-by: Hao Wu <wuhaotsh@google.com>
Reviewed-by: Patrick Venture <venture@google.com>
---
 include/hw/misc/npcm7xx_gcr.h | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/include/hw/misc/npcm7xx_gcr.h b/include/hw/misc/npcm7xx_gcr.h
index 13109d9d32..98da5d171f 100644
--- a/include/hw/misc/npcm7xx_gcr.h
+++ b/include/hw/misc/npcm7xx_gcr.h
@@ -19,6 +19,36 @@
 #include "exec/memory.h"
 #include "hw/sysbus.h"
 
+/*
+ * NPCM7XX PWRON STRAP bit fields
+ * 12: SPI0 powered by VSBV3 at 1.8V
+ * 11: System flash attached to BMC
+ * 10: BSP alternative pins.
+ * 9:8: Flash UART command route enabled.
+ * 7: Security enabled.
+ * 6: HI-Z state control.
+ * 5: ECC disabled.
+ * 4: Reserved
+ * 3: JTAG2 enabled.
+ * 2:0: CPU and DRAM clock frequency.
+ */
+#define NPCM7XX_PWRON_STRAP_SPI0F18                 BIT(12)
+#define NPCM7XX_PWRON_STRAP_SFAB                    BIT(11)
+#define NPCM7XX_PWRON_STRAP_BSPA                    BIT(10)
+#define NPCM7XX_PWRON_STRAP_FUP(x)                  ((x) << 8)
+#define     FUP_NORM_UART2      3
+#define     FUP_PROG_UART3      2
+#define     FUP_PROG_UART2      1
+#define     FUP_NORM_UART3      0
+#define NPCM7XX_PWRON_STRAP_SECEN                   BIT(7)
+#define NPCM7XX_PWRON_STRAP_HIZ                     BIT(6)
+#define NPCM7XX_PWRON_STRAP_ECC                     BIT(5)
+#define NPCM7XX_PWRON_STRAP_RESERVE1                BIT(4)
+#define NPCM7XX_PWRON_STRAP_J2EN                    BIT(3)
+#define NPCM7XX_PWRON_STRAP_CKFRQ(x)                ((x) << 8)
+#define     CKFRQ_SKIPINIT      (0x000)
+#define     CKFRQ_DEFAULT       (0x111)
+
 /*
  * Number of registers in our device state structure. Don't change this without
  * incrementing the version_id in the vmstate.
-- 
2.35.1.1094.g7c7d902a7c-goog


