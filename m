Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 549113A0524
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 22:28:25 +0200 (CEST)
Received: from localhost ([::1]:59406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqiKm-0006df-DY
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 16:28:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3Q9K_YAcKCvIpYhnolYaiiafY.WigkYgo-XYpYfhihaho.ila@flex--venture.bounces.google.com>)
 id 1lqiIA-0000Sv-Gp
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 16:25:42 -0400
Received: from mail-qk1-x74a.google.com ([2607:f8b0:4864:20::74a]:35424)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3Q9K_YAcKCvIpYhnolYaiiafY.WigkYgo-XYpYfhihaho.ila@flex--venture.bounces.google.com>)
 id 1lqiI8-0001PW-Lc
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 16:25:42 -0400
Received: by mail-qk1-x74a.google.com with SMTP id
 y5-20020a37af050000b02903a9c3f8b89fso15681735qke.2
 for <qemu-devel@nongnu.org>; Tue, 08 Jun 2021 13:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=jNdnDMKzuwyZjBH28VZozL/ia5Go6l0KkjDets+IuzM=;
 b=vUHXqlgWdyCgLOqD0OEeEpheJmreByYt1nes9Cr56jziTt+iAcE3pITLsr0Nh5HftJ
 A4g4QFnT53rtBj21SDKg+7G9mi9X3Z7OVSmEbBe16AUdY1/oIKgC//KPaStftq5Oed9s
 mRFO2jcaNwy7Y6gJ8AD/qlQBz8xrtnDuyG4r7T1L+Wib0QD8bB8i14D/kddxXlRPxCBp
 /6T5x9UZHoGGWObQZt7oWLc9mydodKV/4f8XkwdCtFuj1q1qhnV+h/r+xrO9UQBdVEIo
 JB5IOjfb5goBOrn+3p9xCReFfSuyvmo3T3gKgnYqWs9njojErKIqirtqLQsrVeCyyidx
 3NTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=jNdnDMKzuwyZjBH28VZozL/ia5Go6l0KkjDets+IuzM=;
 b=eIfoJxpevzjt34uOn/troIU5MPm9uR3A9qdumktzW22yPpjrXtIq9pQZcw7qFk4Paa
 6vWYORpgevp/msLtZRoOzfMN9bhOoAy6vW+7X06QaWcUFhowcaLflSfsJAqxoHlbX7ky
 +E18wa2JTxaUMBRzOGeGZRd5SfwLpu4Oxfyuep/YqmTi1NyE4idKi6jujumzkfd/oT7U
 wAF5OxrcoZ0QvfmPteotQhtWK8XVgCUaLqoayUHs+csbTtEbuDWHEn5PjRO8ByBDOtmX
 EQSMgmSmnHkTiaOjHRkNHMi+r+iiQjUqmOO03t6uTHhGUMiZVCj6GSofshy+1oK3uhvY
 3EQg==
X-Gm-Message-State: AOAM531vorA5/CR71vVM1/JUWYsc2VpQfagyAPS7hgViQlP3U57RgZyN
 p5Fo0KPVR0FxBziNgzqMNoqdxsZ7u/VE
X-Google-Smtp-Source: ABdhPJyNYds6SdqQ/9H0DwihFJoC7DyDgMlc0Y/874UcrxxLFHiqRRRKEpzrVVtcooDYkUKuKNYdxjuFlbQV
X-Received: from venture.svl.corp.google.com
 ([2620:15c:2a3:200:f886:41e8:7e16:711b])
 (user=venture job=sendgmr) by 2002:ad4:5aeb:: with SMTP id
 c11mr2177687qvh.34.1623183939269; Tue, 08 Jun 2021 13:25:39 -0700 (PDT)
Date: Tue,  8 Jun 2021 13:25:22 -0700
In-Reply-To: <20210608202522.2677850-1-venture@google.com>
Message-Id: <20210608202522.2677850-4-venture@google.com>
Mime-Version: 1.0
References: <20210608202522.2677850-1-venture@google.com>
X-Mailer: git-send-email 2.32.0.rc1.229.g3e70b5a671-goog
Subject: [PATCH v2 3/3] hw/arm: quanta-q71l add pca954x muxes
From: Patrick Venture <venture@google.com>
To: hskinnemoen@google.com, kfting@nuvoton.com, clg@kaod.org, 
 peter.maydell@linaro.org, andrew@aj.id.au, joel@jms.id.au
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Patrick Venture <venture@google.com>, Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::74a;
 envelope-from=3Q9K_YAcKCvIpYhnolYaiiafY.WigkYgo-XYpYfhihaho.ila@flex--venture.bounces.google.com;
 helo=mail-qk1-x74a.google.com
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

Adds the pca954x muxes expected.

Tested: Booted quanta-q71l image to userspace.
Signed-off-by: Patrick Venture <venture@google.com>
Reviewed-by: Hao Wu <wuhaotsh@google.com>
Reviewed-by: Joel Stanley <joel@jms.id.au>
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
2.32.0.rc1.229.g3e70b5a671-goog


