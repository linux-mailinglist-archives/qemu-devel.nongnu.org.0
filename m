Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B80A3A0523
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 22:28:22 +0200 (CEST)
Received: from localhost ([::1]:59218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqiKj-0006Vw-AU
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 16:28:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3P9K_YAcKCu4lUdjkhUWeeWbU.SecgUck-TUlUbdedWdk.ehW@flex--venture.bounces.google.com>)
 id 1lqiI7-0000J0-RW
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 16:25:39 -0400
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49]:57157)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3P9K_YAcKCu4lUdjkhUWeeWbU.SecgUck-TUlUbdedWdk.ehW@flex--venture.bounces.google.com>)
 id 1lqiI4-0001OA-WB
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 16:25:39 -0400
Received: by mail-yb1-xb49.google.com with SMTP id
 m205-20020a25d4d60000b029052a8de1fe41so28333531ybf.23
 for <qemu-devel@nongnu.org>; Tue, 08 Jun 2021 13:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=FxAe0EZ6wpi9A2ORE+AfuOAXtfCwqR3DwiGh/urmkpk=;
 b=ATeo1MPXz4RN6CEL1CaBboXG/D0weUZ4MqO3+5ql72HHn2HSCiQLsy6LRi2lAHEN8I
 JeB4He2IR/3uaOwcNqEWUA1hhx6jyqbSyFlwBEbocwBFFaC0GLslyKeN9WKdgK3iYvaF
 CRNFJhdI3sZ2SVaZyHsqYhgog6OOaFpJhjnuxl3v1bVUWewiKcXC80JRGP5edvNq1ONq
 Cfef5Ix4SN8Wyl3rdz0Be2zxfSClVeSHLSthvAE4U2nFa5ER/8twaZDOdZ/MRsrvHZND
 KDFhxxdiBnn1fYxWTt1ClOW2HSt1Zk597s7HZXIr9CxrVRsq+5/RNZPtkDuOd/FM8sHw
 aqIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=FxAe0EZ6wpi9A2ORE+AfuOAXtfCwqR3DwiGh/urmkpk=;
 b=CXzNEDgbbD41P5CLS9w2QDt60n4EME0NUyDV+RGC66NZj8iJom1tJAzlo8yTgUS/6g
 R4JgseUW1GOfBL46yOaUxZ4Wt4VKeGZaBmqV0AK2gFDxM485schvysiu22FNF1GFzkvT
 zrDjBOlSsyHz/EdyzDODTm9N5s+O+6OknR0/zAX7mlcENxmiiAFdyCQ91UFhHz2nnizG
 pXcq2HxZQKyTVFK8hB2Z+Qib6/rpkR/5e4kO8oAxW+P0uH4uRi0UV0TDmX1E9xZHB5SC
 gSbB4/qNjOIQfL8XxbZzqSlc7mgteqKfJt8PFD2O0RBKYDX02+Qh/L37dxN51KKkQODv
 Ueug==
X-Gm-Message-State: AOAM533hgJJq4xOknnFBEZYt0PvMWOt2t959wt7iXddZQs0CqI1a4m0a
 bJShHiayIVFZSkEyh0qHFjM+DKO5WsHQ
X-Google-Smtp-Source: ABdhPJx/k4rUl+qzsO71MWYH02uizvrfzr25LbV+G87z5h8fieBv/RbrTlEvlehUY5wG5i1ppsLKblWx+V3Z
X-Received: from venture.svl.corp.google.com
 ([2620:15c:2a3:200:f886:41e8:7e16:711b])
 (user=venture job=sendgmr) by 2002:a25:9bc3:: with SMTP id
 w3mr32517916ybo.9.1623183935674; Tue, 08 Jun 2021 13:25:35 -0700 (PDT)
Date: Tue,  8 Jun 2021 13:25:21 -0700
In-Reply-To: <20210608202522.2677850-1-venture@google.com>
Message-Id: <20210608202522.2677850-3-venture@google.com>
Mime-Version: 1.0
References: <20210608202522.2677850-1-venture@google.com>
X-Mailer: git-send-email 2.32.0.rc1.229.g3e70b5a671-goog
Subject: [PATCH v2 2/3] hw/arm: gsj add pca9548
From: Patrick Venture <venture@google.com>
To: hskinnemoen@google.com, kfting@nuvoton.com, clg@kaod.org, 
 peter.maydell@linaro.org, andrew@aj.id.au, joel@jms.id.au
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Patrick Venture <venture@google.com>, Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b49;
 envelope-from=3P9K_YAcKCu4lUdjkhUWeeWbU.SecgUck-TUlUbdedWdk.ehW@flex--venture.bounces.google.com;
 helo=mail-yb1-xb49.google.com
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

Tested: Quanta-gsj firmware booted.

i2c /dev entries driver
I2C init bus 1 freq 100000
I2C init bus 2 freq 100000
I2C init bus 3 freq 100000
I2C init bus 4 freq 100000
I2C init bus 8 freq 100000
I2C init bus 9 freq 100000
at24 9-0055: 8192 byte 24c64 EEPROM, writable, 1 bytes/write
I2C init bus 10 freq 100000
at24 10-0055: 8192 byte 24c64 EEPROM, writable, 1 bytes/write
I2C init bus 12 freq 100000
I2C init bus 15 freq 100000
i2c i2c-15: Added multiplexed i2c bus 16
i2c i2c-15: Added multiplexed i2c bus 17
i2c i2c-15: Added multiplexed i2c bus 18
i2c i2c-15: Added multiplexed i2c bus 19
i2c i2c-15: Added multiplexed i2c bus 20
i2c i2c-15: Added multiplexed i2c bus 21
i2c i2c-15: Added multiplexed i2c bus 22
i2c i2c-15: Added multiplexed i2c bus 23
pca954x 15-0075: registered 8 multiplexed busses for I2C switch pca9548

Signed-off-by: Patrick Venture <venture@google.com>
Reviewed-by: Hao Wu <wuhaotsh@google.com>
Reviewed-by: Joel Stanley <joel@jms.id.au>
---
 hw/arm/Kconfig          | 1 +
 hw/arm/npcm7xx_boards.c | 6 ++----
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index b887f6a5b1..9d1c2a6f7b 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -377,6 +377,7 @@ config NPCM7XX
     select SERIAL
     select SSI
     select UNIMP
+    select PCA954X
 
 config FSL_IMX25
     bool
diff --git a/hw/arm/npcm7xx_boards.c b/hw/arm/npcm7xx_boards.c
index 9b7a7cd201..f0a96564e2 100644
--- a/hw/arm/npcm7xx_boards.c
+++ b/hw/arm/npcm7xx_boards.c
@@ -18,6 +18,7 @@
 
 #include "hw/arm/npcm7xx.h"
 #include "hw/core/cpu.h"
+#include "hw/i2c/i2c_mux_pca954x.h"
 #include "hw/i2c/smbus_eeprom.h"
 #include "hw/loader.h"
 #include "hw/qdev-core.h"
@@ -231,10 +232,7 @@ static void quanta_gsj_i2c_init(NPCM7xxState *soc)
      * - ucd90160@6b
      */
 
-    /*
-     * i2c-15:
-     * - pca9548@75
-     */
+    i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 15), "pca9548", 0x75);
 }
 
 static void quanta_gsj_fan_init(NPCM7xxMachine *machine, NPCM7xxState *soc)
-- 
2.32.0.rc1.229.g3e70b5a671-goog


