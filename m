Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A52E354484A
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 12:08:07 +0200 (CEST)
Received: from localhost ([::1]:53844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzF5C-0002It-Bt
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 06:08:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzE7Z-0001e8-IM
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 05:06:29 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:55140)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzE7Y-000687-4S
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 05:06:29 -0400
Received: by mail-wm1-x329.google.com with SMTP id n185so12106857wmn.4
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 02:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=1m/UJxXLmktUI528IS17AqpDYaE8Ds5euhmbpvoO2wI=;
 b=xQFAqMwdkDeVs1JZLigxCqno2jD16chXRNKDQigIDXF6X461NKYq5Z3DGy25jEnNKt
 y0t4LtaR0+VtOLKAMfdT0QPfDou1vzp4opggtlMi0Pe0o4BUTmdlR5eYd1ojm4m+6zs+
 DCGbilr2gd6Izkawl4sMdM29qU4XNsk8QMcsOXoAPc4NG3ZzYeSsE/T5Rxs/5dOUMe1k
 Pz9OYnZPwfeyQuTf+f7QWLZ013YcQBjqrkxrcAh+ORTh+vefQhY36CRwu0n43oQZyn9+
 H1QgW4NYqjKeX4i5Hcez4LKTqpMn8pvVeDU8ZwvWEv3ib+0O50H3Ouq0KnUwcTzGExeu
 UqvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1m/UJxXLmktUI528IS17AqpDYaE8Ds5euhmbpvoO2wI=;
 b=Skq3+rg9Y4KK9UTG/7hyFzZZYlEvBW/J/fFw5bYVa+HTy0ZvOLzIzXBcB0EWs/jDaE
 qvJcFY9IEoBwmy82AlYNeFswRzDW/FNCAAEhk+t8cVYFUSlAlLENf8jlbKl4ZCZ5PWDg
 1hRIo6DusI/PKE9ClOZS51tM2T7iwZi11Xhg4jg7ukSKkvXI874+eQfjAslnfWVS71+e
 cQQw+t/f6kfanjl4Gj+FJZ77dtFujJR46KHvVmjYsvxZ1bwnO/kaBDL7g+Iif8UgqfK1
 W+vG9sDFEwzGjJM1g+VlvXqjQ7+7W5J5CjNOL6kKMP6ZiXv8wfuZ2PwRYCNmo3aNLw+V
 zZOA==
X-Gm-Message-State: AOAM532K/scpHb2RTS7fX/fRstYlP93XfRD5l3+PjxW/kOjszAOzf/3e
 lRHRDNZ46GodP2hkdHP2zi/VRfnTv9QtXA==
X-Google-Smtp-Source: ABdhPJxKuqJxjTlfIOsU6xbI3MoroA9ijYHpM5iXuRU4UscpNb8fi81fD/PkDkEI1s3WHW3JLRpAYw==
X-Received: by 2002:a1c:19c4:0:b0:397:88a6:6 with SMTP id
 187-20020a1c19c4000000b0039788a60006mr2265383wmz.138.1654765586789; 
 Thu, 09 Jun 2022 02:06:26 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 c13-20020adffb0d000000b002183cf9cd69sm11349796wrr.15.2022.06.09.02.06.26
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 02:06:26 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 44/55] target/arm: Do not use aarch64_sve_zcr_get_valid_len in
 reset
Date: Thu,  9 Jun 2022 10:05:26 +0100
Message-Id: <20220609090537.1971756-45-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220609090537.1971756-1-peter.maydell@linaro.org>
References: <20220609090537.1971756-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
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

From: Richard Henderson <richard.henderson@linaro.org>

We don't need to constrain the value set in zcr_el[1],
because it will be done by sve_zcr_len_for_el.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220607203306.657998-10-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index d2bd74c2ed4..06219441674 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -208,8 +208,7 @@ static void arm_cpu_reset(DeviceState *dev)
                                          CPACR_EL1, ZEN, 3);
         /* with reasonable vector length */
         if (cpu_isar_feature(aa64_sve, cpu)) {
-            env->vfp.zcr_el[1] =
-                aarch64_sve_zcr_get_valid_len(cpu, cpu->sve_default_vq - 1);
+            env->vfp.zcr_el[1] = cpu->sve_default_vq - 1;
         }
         /*
          * Enable 48-bit address space (TODO: take reserved_va into account).
-- 
2.25.1


