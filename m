Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E61B4F6DDD
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Apr 2022 00:37:22 +0200 (CEST)
Received: from localhost ([::1]:46724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncEHB-0005DH-4Y
	for lists+qemu-devel@lfdr.de; Wed, 06 Apr 2022 18:37:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3ihVOYggKCgc31ohv0zonvvnsl.jvtxlt1-kl2lsuvunu1.vyn@flex--wuhaotsh.bounces.google.com>)
 id 1ncEEn-0002uo-Vg
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 18:34:54 -0400
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549]:39719)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3ihVOYggKCgc31ohv0zonvvnsl.jvtxlt1-kl2lsuvunu1.vyn@flex--wuhaotsh.bounces.google.com>)
 id 1ncEEm-0004Vs-Bp
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 18:34:53 -0400
Received: by mail-pg1-x549.google.com with SMTP id
 o8-20020a635a08000000b0039a14a39466so2112676pgb.6
 for <qemu-devel@nongnu.org>; Wed, 06 Apr 2022 15:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=9EB3ZPVRmttzJqZqt9T8+ZjaBj0Vj3OaCobtZzkS7JY=;
 b=laACAI3TvU9JM0p4FrjG7/ZzLtUPln87zQ7ddXl5r6llL3idL4nD9UCzYNhbxz8ou+
 hLd8QhUM7COpNMbsS/lUhpoZuzaWa7Cxfvo8rAMJSy310wGMXviXua8qCQwNdRvMyXhN
 ZspvdU9si5qljqpptXk0aCgHWy/JK5Eis0xgPa53nOYqQSIEiQ13/IGm74hqTTAX5Lwy
 4d8FLX1Iv7MnFYNbTMyFH+JPlyC4bgj3ypleOyt64xzLV+WGArfqkIQ/wfv3NWhc3LS3
 /sBUgzpqkCRfpTbxIBO7vOg07N1NItrOu+P6KYbtOyW6iLZP+am59c2E7D3RS6LqwoEt
 oEpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=9EB3ZPVRmttzJqZqt9T8+ZjaBj0Vj3OaCobtZzkS7JY=;
 b=ALCWJhsLhdRXfVz1VxJ8LK16Iu10rQdr29if+ZwS0qZYdjkeG2pgDALEQNDOYJAbWP
 jcl9Tk/2GmQTWR/MRtYqReo2xgU8ABVLaf2ExzkM1vnBSxP0bcIM0HSWdY0THKbWHyxM
 5UJeHdqTKPUpw1dS8+bsm2KqTiHv/C2D3b0KnGtYy9+Tw/2/d38vH2UzKh32BwLmOB+1
 ZlOJJfssawiOqpvivabcwcx66psH1dBlWCIB0+tUuhJNLrw4M3GW0/bkqbwzz577VTjm
 LpWMagdisAUqGQnOor2cFhmY51BHdzaVe/rc1jD1bNXZJnieDdww/i/wdeLI1qwTv6rO
 Ap+w==
X-Gm-Message-State: AOAM531oMkwChGTP99X0YLHEcLiu0xWX44YjOW+qklrzfZXWWWb4fcDN
 gHgYcmn9KA7T03HIcwffbpZjVQnKPqUK5A==
X-Google-Smtp-Source: ABdhPJygv6xA0HUQ5+7EhVqZTvygFTb0g/bNYAmQ0mDcMNOcT5soNUeeKv7hITcn8NVdJG0yNFsQl1zJ7ysDpQ==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a05:6a00:21c2:b0:4fe:81f:46c7 with SMTP
 id t2-20020a056a0021c200b004fe081f46c7mr10977574pfj.5.1649284490631; Wed, 06
 Apr 2022 15:34:50 -0700 (PDT)
Date: Wed,  6 Apr 2022 15:34:40 -0700
In-Reply-To: <20220406223440.2901032-1-wuhaotsh@google.com>
Message-Id: <20220406223440.2901032-3-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20220406223440.2901032-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.35.1.1094.g7c7d902a7c-goog
Subject: [PATCH 2/2] hw/arm: Use bit fields for NPCM7XX PWRON STRAPs
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, wuhaotsh@google.com, 
 venture@google.com, Avi.Fishman@nuvoton.com, kfting@nuvoton.com, 
 hskinnemoen@google.com, Uri.Trichter@nuvoton.com, Vishal.Soni@microsoft.com, 
 titusr@google.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::549;
 envelope-from=3ihVOYggKCgc31ohv0zonvvnsl.jvtxlt1-kl2lsuvunu1.vyn@flex--wuhaotsh.bounces.google.com;
 helo=mail-pg1-x549.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01, UPPERCASE_50_75=0.008,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=no autolearn_force=no
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

This patch uses the defined fields to describe PWRON STRAPs for
better readability.

Signed-off-by: Hao Wu <wuhaotsh@google.com>
Reviewed-by: Patrick Venture <venture@google.com>
---
 hw/arm/npcm7xx_boards.c | 24 +++++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/hw/arm/npcm7xx_boards.c b/hw/arm/npcm7xx_boards.c
index 0678a56156..62d4092657 100644
--- a/hw/arm/npcm7xx_boards.c
+++ b/hw/arm/npcm7xx_boards.c
@@ -30,11 +30,25 @@
 #include "sysemu/sysemu.h"
 #include "sysemu/block-backend.h"
 
-#define NPCM750_EVB_POWER_ON_STRAPS 0x00001ff7
-#define QUANTA_GSJ_POWER_ON_STRAPS 0x00001fff
-#define QUANTA_GBS_POWER_ON_STRAPS 0x000017ff
-#define KUDO_BMC_POWER_ON_STRAPS 0x00001fff
-#define MORI_BMC_POWER_ON_STRAPS 0x00001fff
+#define NPCM7XX_POWER_ON_STRAPS_DEFAULT (           \
+        NPCM7XX_PWRON_STRAP_SPI0F18 |               \
+        NPCM7XX_PWRON_STRAP_SFAB |                  \
+        NPCM7XX_PWRON_STRAP_BSPA |                  \
+        NPCM7XX_PWRON_STRAP_FUP(FUP_NORM_UART2) |   \
+        NPCM7XX_PWRON_STRAP_SECEN |                 \
+        NPCM7XX_PWRON_STRAP_HIZ |                   \
+        NPCM7XX_PWRON_STRAP_ECC |                   \
+        NPCM7XX_PWRON_STRAP_RESERVE1 |              \
+        NPCM7XX_PWRON_STRAP_J2EN |                  \
+        NPCM7XX_PWRON_STRAP_CKFRQ(CKFRQ_DEFAULT))   \
+
+#define NPCM750_EVB_POWER_ON_STRAPS ( \
+        NPCM7XX_POWER_ON_STRAPS_DEFAULT & ~NPCM7XX_PWRON_STRAP_RESERVE1)
+#define QUANTA_GSJ_POWER_ON_STRAPS NPCM7XX_POWER_ON_STRAPS_DEFAULT
+#define QUANTA_GBS_POWER_ON_STRAPS ( \
+        NPCM7XX_POWER_ON_STRAPS_DEFAULT & ~NPCM7XX_PWRON_STRAP_SFAB)
+#define KUDO_BMC_POWER_ON_STRAPS NPCM7XX_POWER_ON_STRAPS_DEFAULT
+#define MORI_BMC_POWER_ON_STRAPS NPCM7XX_POWER_ON_STRAPS_DEFAULT
 
 static const char npcm7xx_default_bootrom[] = "npcm7xx_bootrom.bin";
 
-- 
2.35.1.1094.g7c7d902a7c-goog


