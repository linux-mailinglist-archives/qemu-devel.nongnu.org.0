Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB1A43880AC
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 21:44:29 +0200 (CEST)
Received: from localhost ([::1]:36080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj5dk-0001Fc-TK
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 15:44:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3cxikYAcKCkAxgpvwtgiqqing.eqosgow-fgxgnpqpipw.qti@flex--venture.bounces.google.com>)
 id 1lj5b5-000686-Bo
 for qemu-devel@nongnu.org; Tue, 18 May 2021 15:41:43 -0400
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a]:40625)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3cxikYAcKCkAxgpvwtgiqqing.eqosgow-fgxgnpqpipw.qti@flex--venture.bounces.google.com>)
 id 1lj5b2-0003gV-JH
 for qemu-devel@nongnu.org; Tue, 18 May 2021 15:41:43 -0400
Received: by mail-yb1-xb4a.google.com with SMTP id
 e138-20020a25e7900000b029050df4b648fcso8757602ybh.7
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 12:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=wi/OXFrMKlEqPmSMbr0B+gTzFcvO+RgxBM3B9kQVjzE=;
 b=MpUTsiWhj4u66naM4O2ond0IfWxdBRiMiA18CuWb6PAKKIk8h/V69KY8FSoRojOE+g
 bYRUYN0GH5FU4/2NZ2xqV2sLhMQZq3PsAimqlhAnuKT2WHfxZ4YnmxjbvrwNN+cTHfME
 fglF43lXf7bw4WLG1RpOIUgMxo8Gh+5DxxTffvvcRSqOIK1BEBVI4Bie4ANOdI6BWuVO
 AbgsuXpAIDHh0HFGz3HWeSoDc6mbbAPs5k8er5LTNQh9949BzXa6RgkcAU4kFDWbsCZ3
 XAmvwvmJq65z3FyJzmdWrpy33my2qEyW6urpFBK7cVAqZvcEmBMdWiSTGFUaVRChxpAh
 NOlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=wi/OXFrMKlEqPmSMbr0B+gTzFcvO+RgxBM3B9kQVjzE=;
 b=ETruTIpE2/ycesc5GMq6HzzZphFs9SzMFJfoE/4m0cila9xMMlmtulZE+z9qEHrRZD
 4dDYC27FvUmeNH+fQvW8TYaGXwmj417wIBsmXrpVYDIgK/KrZ7h0JgsUa6GvdShkAN1Z
 r+OLPFVRFF4HecPW8C5sIsSn0iZ2/77aZ8dYdKsmc5A4NAcIwg6e6sCs/e8b0HeVk2dp
 1ezuXYSgEDGDCUcZ3y1hmObtq/AiV2NKy+a3EfNyYrGBy3gnUZ3TOsARh3ZcJX41lTRv
 Ay5GAEt7dz8jlU7iw2EaSaeeDViRWFFbiHgMNKQFexGNGZ3Cb9OdKSFFGB/QSXnY3BaL
 eA/A==
X-Gm-Message-State: AOAM530wTzPeagJcWbmn8gjHQnC9nZ6SWmtVtPQQhFXcAz3HiYN6wJ2D
 4QAX/NuAT3lQN4FoCiU3kUoMe8hshBDB
X-Google-Smtp-Source: ABdhPJzocDg2AXqxKjVQeDkN6cK5bHrbnAM80nKPCIOr6PUcJg+lcacTsI/eeKyDvUmLQk3VOaiWh7DO3sCF
X-Received: from venture.svl.corp.google.com
 ([2620:15c:2a3:200:5902:8a04:d917:4e93])
 (user=venture job=sendgmr) by 2002:a25:218b:: with SMTP id
 h133mr9813508ybh.160.1621366899094; Tue, 18 May 2021 12:41:39 -0700 (PDT)
Date: Tue, 18 May 2021 12:41:17 -0700
In-Reply-To: <20210518194118.755410-1-venture@google.com>
Message-Id: <20210518194118.755410-4-venture@google.com>
Mime-Version: 1.0
References: <20210518194118.755410-1-venture@google.com>
X-Mailer: git-send-email 2.31.1.751.gd2f1c929bd-goog
Subject: [PATCH 3/4] hw/arm: quanta-q71l add pca954x muxes
From: Patrick Venture <venture@google.com>
To: hskinnemoen@google.com, kfting@nuvoton.com, clg@kaod.org, 
 peter.maydell@linaro.org, andrew@aj.id.au, joel@jms.id.au
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Patrick Venture <venture@google.com>, Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b4a;
 envelope-from=3cxikYAcKCkAxgpvwtgiqqing.eqosgow-fgxgnpqpipw.qti@flex--venture.bounces.google.com;
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

Adds the pca954x muxes expected.

Tested: Booted quanta-q71l image to userspace.
Signed-off-by: Patrick Venture <venture@google.com>
Reviewed-by: Hao Wu <wuhaotsh@google.com>
---
 hw/arm/Kconfig  |  1 +
 hw/arm/aspeed.c | 11 ++++++++---
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 9d1c2a6f7b..4a033e81ef 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -413,6 +413,7 @@ config ASPEED_SOC
     select PCA9552
     select SERIAL
     select SMBUS_EEPROM
+    select PCA954X
     select SSI
     select SSI_M25P80
     select TMP105
diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 3fe6c55744..35a28b0e8b 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -14,6 +14,7 @@
 #include "hw/arm/boot.h"
 #include "hw/arm/aspeed.h"
 #include "hw/arm/aspeed_soc.h"
+#include "hw/i2c/i2c_mux_pca954x.h"
 #include "hw/i2c/smbus_eeprom.h"
 #include "hw/misc/pca9552.h"
 #include "hw/misc/tmp105.h"
@@ -461,14 +462,18 @@ static void quanta_q71l_bmc_i2c_init(AspeedMachineState *bmc)
     /* TODO: i2c-1: Add Frontpanel FRU eeprom@57 24c64 */
     /* TODO: Add Memory Riser i2c mux and eeproms. */
 
-    /* TODO: i2c-2: pca9546@74 */
-    /* TODO: i2c-2: pca9548@77 */
+    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 2), "pca9546", 0x74);
+    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 2), "pca9548", 0x77);
+
     /* TODO: i2c-3: Add BIOS FRU eeprom@56 24c64 */
-    /* TODO: i2c-7: Add pca9546@70 */
+
+    /* i2c-7 */
+    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 7), "pca9546", 0x70);
     /*        - i2c@0: pmbus@59 */
     /*        - i2c@1: pmbus@58 */
     /*        - i2c@2: pmbus@58 */
     /*        - i2c@3: pmbus@59 */
+
     /* TODO: i2c-7: Add PDB FRU eeprom@52 */
     /* TODO: i2c-8: Add BMC FRU eeprom@50 */
 }
-- 
2.31.1.751.gd2f1c929bd-goog


