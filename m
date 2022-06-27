Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6749955B92B
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 12:36:38 +0200 (CEST)
Received: from localhost ([::1]:46312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5m6f-0000W5-0A
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 06:36:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o5ltF-0002Fp-D0
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 06:22:45 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:36625)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o5ltD-0004ri-5W
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 06:22:44 -0400
Received: by mail-wr1-x434.google.com with SMTP id o4so8387287wrh.3
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 03:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Exdw1jWh9d45wApshJRlkzNaiGP955/A0t+N8/5I8ww=;
 b=VGEaueDjpQqajNT7NmPZfYOb14uNL6cD5u2rnzxPiHj09CbYGhDd3k3vp+G5DORQ/Q
 iISdou4i4WXsopmL0l9DSOox0Dky+dkTnFR1Xg0YxJUHmg47EXHOvyxQvMK2c8CMG+ZX
 l6TGokpHFjkBlHo75axcTh1n2yagyVTs8oN/ea6UgkbJtLuW9hHip4QvW0J6rxnuJZzQ
 CW2+1SV5oaI5kSe8C118yiOld5LN3eBxp2ciA6RDt8GwoFGoij0XbIScJkVrQ/2+2UVi
 JonEKyVPCEdaiYp4I5yMGxrbyGjWOnfUO/V9RaZ0Ch262cac+HcGq8JdcExLsdw0LCco
 AHXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Exdw1jWh9d45wApshJRlkzNaiGP955/A0t+N8/5I8ww=;
 b=lzX4GCBGC1qk/LkQgRsdIAomuCN9QnVdVJfDPWHu5sOqY+jO6QyUbQM1RGc8JBA3Jg
 rFSbP6yFCpCNKfNjEemJqqu5ty38yqCp0ypke5FwEawvDLq87bfSnIFPqghCuZplnpWA
 9br3CUVG233+bJSODQumD82P+EFqReDFAJRkMOzP8iZJd+XdtUMu281bZ9keSqC1KCyh
 wyKlGuqBBsJae/Q5aaYAIPjTTo16C0F4atezgpK9bX0qHhXcP8/MUGmY4tA+8cMcpRVm
 IaF4JDoANbzOh7FFEopC7tSa7d92S6rmdCnceg7qgT6onWokBqQswvX5JvKCkJD6kC8t
 KiyA==
X-Gm-Message-State: AJIora+kHwx1l6OnmLh6RaaaUKXHy9vunp3hC3R2F/+nj+aJ9wSXIWhH
 BAO44p8vKRZC4lmERnbct7wJXckMGAxX3w==
X-Google-Smtp-Source: AGRyM1srzSUnbZ66fU0G34J/1N7QquxvEzs0Sp8AeRuDKIk9fnxEJ3vBxFzJv0nCNjKOhVPo3TbIxw==
X-Received: by 2002:a05:6000:1689:b0:218:3fb1:fd30 with SMTP id
 y9-20020a056000168900b002183fb1fd30mr11430304wrd.302.1656325360761; 
 Mon, 27 Jun 2022 03:22:40 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 d11-20020a5d6dcb000000b0020e6ce4dabdsm9754335wrz.103.2022.06.27.03.22.40
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 03:22:40 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 03/25] target/arm: Catch invalid kvm state also for hvf
Date: Mon, 27 Jun 2022 11:22:14 +0100
Message-Id: <20220627102236.3097629-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220627102236.3097629-1-peter.maydell@linaro.org>
References: <20220627102236.3097629-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Alexander Graf <agraf@csgraf.de>

Some features such as running in EL3 or running M profile code are
incompatible with virtualization as QEMU implements it today. To prevent
users from picking invalid configurations on other virt solutions like
Hvf, let's run the same checks there too.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1073
Signed-off-by: Alexander Graf <agraf@csgraf.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220620192242.70573-2-agraf@csgraf.de
[PMM: Allow qtest accelerator too; tweak comment]
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 1b5d5357880..d9c4a9f56d2 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -39,6 +39,7 @@
 #include "hw/boards.h"
 #endif
 #include "sysemu/tcg.h"
+#include "sysemu/qtest.h"
 #include "sysemu/hw_accel.h"
 #include "kvm_arm.h"
 #include "disas/capstone.h"
@@ -1490,25 +1491,32 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
         }
     }
 
-    if (kvm_enabled()) {
+    if (!tcg_enabled() && !qtest_enabled()) {
         /*
+         * We assume that no accelerator except TCG (and the "not really an
+         * accelerator" qtest) can handle these features, because Arm hardware
+         * virtualization can't virtualize them.
+         *
          * Catch all the cases which might cause us to create more than one
          * address space for the CPU (otherwise we will assert() later in
          * cpu_address_space_init()).
          */
         if (arm_feature(env, ARM_FEATURE_M)) {
             error_setg(errp,
-                       "Cannot enable KVM when using an M-profile guest CPU");
+                       "Cannot enable %s when using an M-profile guest CPU",
+                       current_accel_name());
             return;
         }
         if (cpu->has_el3) {
             error_setg(errp,
-                       "Cannot enable KVM when guest CPU has EL3 enabled");
+                       "Cannot enable %s when guest CPU has EL3 enabled",
+                       current_accel_name());
             return;
         }
         if (cpu->tag_memory) {
             error_setg(errp,
-                       "Cannot enable KVM when guest CPUs has MTE enabled");
+                       "Cannot enable %s when guest CPUs has MTE enabled",
+                       current_accel_name());
             return;
         }
     }
-- 
2.25.1


