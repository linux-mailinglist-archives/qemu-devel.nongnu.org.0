Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCB8657064E
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jul 2022 16:54:35 +0200 (CEST)
Received: from localhost ([::1]:60936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oAuny-0006nb-RC
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 10:54:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oAtvu-00073A-Fb
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 09:58:42 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:36550)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oAtvi-0002pO-7w
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 09:58:42 -0400
Received: by mail-wr1-x430.google.com with SMTP id o4so7144055wrh.3
 for <qemu-devel@nongnu.org>; Mon, 11 Jul 2022 06:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=1sgBY9euZYqyeJsGgf1ImXhvmAEBL7DAD0J4RuefL6Q=;
 b=yerFkebCJy1LDgj6reeEwol7btxEPfDzn/7dneGKekBXwIokkrRBBPFvvcltv1GLD2
 wMNExQ1C26TiAl4Jttb+vpvqBPUUsHmKQ5jyabmf3vO3hojHw+gpdJ/t1Tb4bbzuYOX+
 m/EsJFiHWsRb4CaJ0M3CqY/cBjxIUa6IFKVny4vWXeKxN/Z140K/QQ7nRZ0w9qw9v50u
 z0Hthn/hi9ToPu5u74wNbBwAgaSENZaV/iNCxIUgtDAi/Xs/gWy8IkpwSxwMFL72wBZ+
 /nvXdqkpmvsloJgYeksulMXg7f5DaaYymEOfBF8ytbopA3NsIrMcVoKacAQCMygO1p6S
 P8vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1sgBY9euZYqyeJsGgf1ImXhvmAEBL7DAD0J4RuefL6Q=;
 b=dp7iYDPVhxBUq2QiMbKla3BTXwUrtrAuZsxPnBeEu7A6WWnWorl0xx5KBro06IWWmD
 P/Q9EvoSi/sQrdv274N39Fa3oNFUQblrJCiEORSXhQ0LsxfRaW2ya9uEjuRZh9LawLIW
 ZDj5yTQCu1KQ+6pSRJPE3ApHXra+qKLfpzUVYXCjWoL34xazeVYieh5XckygX3RQn/IM
 hssT53O0Er2IY3LVfaUCyvloATSA6VbpB2uMrwkcAm0oEhXYRIpZnlqq8yZ5/qiLfCbe
 t4TwCQKGbSZ1T2iKBQ7a4NFwTjELJJz8grojwqdCEphbzaoR9L3WEYXa/1V2Dr1nSe+f
 1NjQ==
X-Gm-Message-State: AJIora9Ua6V7yxm0XlvsFR2ddUUNwjpzwQZjY1tUdjVrs8omLDU7aFpW
 LcFYMKV8CKUqEpkner8Cxbt8ODskk+TsbA==
X-Google-Smtp-Source: AGRyM1vyLnCV9FD9Wy9u2+YqkZFAAlyzoq1bTKGSDfu0Rjh4oKxmVDzAut1AaSfBW3rwNKcVaKV5Hg==
X-Received: by 2002:a5d:4aca:0:b0:21d:6793:1c11 with SMTP id
 y10-20020a5d4aca000000b0021d67931c11mr16517688wrs.202.1657547909393; 
 Mon, 11 Jul 2022 06:58:29 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 q123-20020a1c4381000000b00397402ae674sm7595596wma.11.2022.07.11.06.58.28
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jul 2022 06:58:29 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 44/45] target/arm: Enable SME for user-only
Date: Mon, 11 Jul 2022 14:57:49 +0100
Message-Id: <20220711135750.765803-45-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220711135750.765803-1-peter.maydell@linaro.org>
References: <20220711135750.765803-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
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

Enable SME, TPIDR2_EL0, and FA64 if supported by the cpu.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220708151540.18136-45-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 9b544438432..5de7e097e9b 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -210,6 +210,17 @@ static void arm_cpu_reset(DeviceState *dev)
                                              CPACR_EL1, ZEN, 3);
             env->vfp.zcr_el[1] = cpu->sve_default_vq - 1;
         }
+        /* and for SME instructions, with default vector length, and TPIDR2 */
+        if (cpu_isar_feature(aa64_sme, cpu)) {
+            env->cp15.sctlr_el[1] |= SCTLR_EnTP2;
+            env->cp15.cpacr_el1 = FIELD_DP64(env->cp15.cpacr_el1,
+                                             CPACR_EL1, SMEN, 3);
+            env->vfp.smcr_el[1] = cpu->sme_default_vq - 1;
+            if (cpu_isar_feature(aa64_sme_fa64, cpu)) {
+                env->vfp.smcr_el[1] = FIELD_DP64(env->vfp.smcr_el[1],
+                                                 SMCR, FA64, 1);
+            }
+        }
         /*
          * Enable 48-bit address space (TODO: take reserved_va into account).
          * Enable TBI0 but not TBI1.
-- 
2.25.1


