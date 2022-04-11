Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1A874FC2DE
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Apr 2022 19:02:58 +0200 (CEST)
Received: from localhost ([::1]:53402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ndxRJ-0003gQ-TD
	for lists+qemu-devel@lfdr.de; Mon, 11 Apr 2022 13:02:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3S15UYggKCnImkXQejiXWeeWbU.SecgUck-TUlUbdedWdk.ehW@flex--wuhaotsh.bounces.google.com>)
 id 1ndxNP-00083u-L9
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 12:58:55 -0400
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a]:56255)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3S15UYggKCnImkXQejiXWeeWbU.SecgUck-TUlUbdedWdk.ehW@flex--wuhaotsh.bounces.google.com>)
 id 1ndxNO-0004fO-6E
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 12:58:55 -0400
Received: by mail-pf1-x44a.google.com with SMTP id
 b6-20020a62a106000000b0050564d6fd75so8030259pff.22
 for <qemu-devel@nongnu.org>; Mon, 11 Apr 2022 09:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=qyMPJ6xtni4CPueSJJimY/QkTKyBJ5F14NdMy+cqp+8=;
 b=B39V3slg9wN+lxmY5FrWGrQGZLcqV593IP6SFzGYV5Vs7fk6HD/d1ZJgA6kPYDvSe1
 j9t42kgpoo7NVjoDA2pp9rnvzkS9sXfA7Tw13XUdeiysloBf58Z2BaP/kSpUXu/4u12y
 2vwD/SKQKpd/Bw1dvFYUtnuqPMrrX3GdXtjKDj4g5U1oOnw5p0HMw7oFZa3IrGR+TqN2
 yBm8tJEwmrIYs21r1X/MGWI4haR6edjvjfDwgw8ASdVK+H8CLjtRNFUVs++dKwdB3mdQ
 WhUFAT3Kp6cEpjGJQEgWGSe4nP5qaF+m1Rw8alWrepEnT4wHMPOsNTURjK6P7z74dvlo
 C17w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=qyMPJ6xtni4CPueSJJimY/QkTKyBJ5F14NdMy+cqp+8=;
 b=MtB5dKNa6CYcpvhSBtof0EBBjSGOVLDQ2YUggqLpxtkpkMeSonIJRt5FNoVWnyYuzN
 cz+p98YqqaVVHCAeIV5Y4cHAvDT3iaMDEmVUKBt3cSk6HeExZiSZ0pI3rX7nrOgV+v4F
 RWECdZjIrifw9mgT7kOez3KhAzHy4yicKZ8SZPX2LBYE1HetLj1NirOxuE1yo4wXh5t+
 0e7q/wpYjRCY5ftz/+EPAh9TwAl5d4W5UjreY59ICY3a6dhW1AtWKKrmmyuZJlRYwPjc
 u+ullDSk2vy4Bmx1iLfH8zduNIt0M5iOaQ/Hwyi/3E9HyTef/HJ8DKpYWZoSdpNfALUA
 /9Pw==
X-Gm-Message-State: AOAM5303Pga2Q/gApka5zikDSQ9DJF+r1hDMxXNWxZxlFy8sy4y/af7r
 VwP7PsjGQX0YAhcl1iS9/w4UA+nuxWeQrw==
X-Google-Smtp-Source: ABdhPJxM8aRNZjubf8xCGz+LmcBpH3jZh+0LCNUiEO7fLXyBoZcce9pMkcleo7uncCSq8+smbJor01fCwPl8sA==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a17:902:ea4f:b0:158:5013:1403 with SMTP
 id r15-20020a170902ea4f00b0015850131403mr8850862plg.75.1649696331863; Mon, 11
 Apr 2022 09:58:51 -0700 (PDT)
Date: Mon, 11 Apr 2022 09:58:42 -0700
In-Reply-To: <20220411165842.3912945-1-wuhaotsh@google.com>
Message-Id: <20220411165842.3912945-3-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20220411165842.3912945-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.35.1.1178.g4f1659d476-goog
Subject: [PATCH v2 2/2] hw/arm: Use bit fields for NPCM7XX PWRON STRAPs
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, wuhaotsh@google.com, 
 venture@google.com, Avi.Fishman@nuvoton.com, kfting@nuvoton.com, 
 hskinnemoen@google.com, Uri.Trichter@nuvoton.com, Vishal.Soni@microsoft.com, 
 titusr@google.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::44a;
 envelope-from=3S15UYggKCnImkXQejiXWeeWbU.SecgUck-TUlUbdedWdk.ehW@flex--wuhaotsh.bounces.google.com;
 helo=mail-pf1-x44a.google.com
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
index 0678a56156..6bc6f5d2fe 100644
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
+        NPCM7XX_PWRON_STRAP_CKFRQ(CKFRQ_DEFAULT))
+
+#define NPCM750_EVB_POWER_ON_STRAPS ( \
+        NPCM7XX_POWER_ON_STRAPS_DEFAULT & ~NPCM7XX_PWRON_STRAP_J2EN)
+#define QUANTA_GSJ_POWER_ON_STRAPS NPCM7XX_POWER_ON_STRAPS_DEFAULT
+#define QUANTA_GBS_POWER_ON_STRAPS ( \
+        NPCM7XX_POWER_ON_STRAPS_DEFAULT & ~NPCM7XX_PWRON_STRAP_SFAB)
+#define KUDO_BMC_POWER_ON_STRAPS NPCM7XX_POWER_ON_STRAPS_DEFAULT
+#define MORI_BMC_POWER_ON_STRAPS NPCM7XX_POWER_ON_STRAPS_DEFAULT
 
 static const char npcm7xx_default_bootrom[] = "npcm7xx_bootrom.bin";
 
-- 
2.35.1.1178.g4f1659d476-goog


