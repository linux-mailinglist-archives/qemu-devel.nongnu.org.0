Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1327B31AB87
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Feb 2021 14:11:47 +0100 (CET)
Received: from localhost ([::1]:35070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAuiA-0007FA-4G
	for lists+qemu-devel@lfdr.de; Sat, 13 Feb 2021 08:11:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lAuaW-000207-Qa
 for qemu-devel@nongnu.org; Sat, 13 Feb 2021 08:03:52 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:45717)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lAuaT-000687-Hk
 for qemu-devel@nongnu.org; Sat, 13 Feb 2021 08:03:52 -0500
Received: by mail-wr1-x436.google.com with SMTP id v7so2860472wrr.12
 for <qemu-devel@nongnu.org>; Sat, 13 Feb 2021 05:03:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pWcuZuMxdsYh1KTB7iCfN22VzPfe+gGVWvKO2b+9KtE=;
 b=o5FgCGR853v0vwtJ/48ndFRzbNK+pOjA+EC8u+Vzufne1fYb5N6Fqxf8D9BtCX3avb
 vAIY/LgkOeJS845R+dg7iou8filCWf8/LdJR4ZkvQoBB7FsQhPeqTT3mfA2m1hV/TBGb
 FcAhG3sXh9ObzxPqnWFr1zo4xq85rwI2k243B8rnd+oLpX8nBb+z0JaxkVI0buZ/Crz2
 d6r2fSv5BMepcV8bzzWSlegGBu23Ab0QFxIJtS40ToXmw10yDlMy9gss1XRVrZZRgzd0
 fwa/GUsmZGblNNya3mF5wUMnh0yrvjgbSHvVp8D3/cEokTJI0+WIRHjaLBeWCUEJsrU/
 1Xlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pWcuZuMxdsYh1KTB7iCfN22VzPfe+gGVWvKO2b+9KtE=;
 b=XbJP1NhkhKhq8SanTMgYaOKm81sPC6Cv8kJaLNX2jXk2pwPvn6ttK2ROt8ZA2kXuCd
 R6ASAJkoNzW98tTU9hszsh8Hi2qtLYpdSkKHGZYR8n8qTEYQP3hDDDYHTox35S0OZivJ
 jXDIJdFM5fMY2V7g9L5M4kwdKcYYAI+RuYdSzoO4ihYqzk4f1qQ9NuumF2i4SHO02Qal
 cA86B6cDcvGmDGe3Gq5qQOR6QYadG/RA/AY6F/ExciWrId2NNH6bNb6hv7+HJ6u7I2+L
 7AGKYnZO6P5UGFcRb64iHVn2eOsnas424ipupIiDMyorK1pyLxt5AjD74L44G+rH/k1+
 D0gQ==
X-Gm-Message-State: AOAM531rVd3hawA0zcvQLaqeS4laTNVr537asYGedN/X9JXvyxsBfd+c
 9C41hV/TCAcTnFF07jcKbpByB8D1Qzw0PWXz
X-Google-Smtp-Source: ABdhPJxb6efapwuqbS5Oao9aqCteUtWvyf2eo6h1/j1Iu2odx3M+/JNEm+Ona+QJGK7dtA2A4MKoPA==
X-Received: by 2002:adf:a298:: with SMTP id s24mr8743701wra.367.1613221419069; 
 Sat, 13 Feb 2021 05:03:39 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id b138sm17167983wmb.35.2021.02.13.05.03.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Feb 2021 05:03:34 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 904A71FF9A;
 Sat, 13 Feb 2021 13:03:26 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v3 11/23] accel/tcg: Create io_recompile_replay_branch hook
Date: Sat, 13 Feb 2021 13:03:13 +0000
Message-Id: <20210213130325.14781-12-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210213130325.14781-1-alex.bennee@linaro.org>
References: <20210213130325.14781-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 robhenry@microsoft.com, mahmoudabdalghany@outlook.com,
 aaron@os.amperecomputing.com, cota@braap.org,
 Paolo Bonzini <pbonzini@redhat.com>, kuhn.chenqun@huawei.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Create a hook in which to split out the mips and
sh4 ifdefs from cpu_io_recompile.

[AJB: s/stoped/stopped/]

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210208233906.479571-3-richard.henderson@linaro.org>
Message-Id: <20210209182749.31323-3-alex.bennee@linaro.org>
Message-Id: <20210210221053.18050-12-alex.bennee@linaro.org>
---
 include/hw/core/tcg-cpu-ops.h | 10 ++++++++++
 accel/tcg/translate-all.c     | 17 +++++++++++++----
 2 files changed, 23 insertions(+), 4 deletions(-)

diff --git a/include/hw/core/tcg-cpu-ops.h b/include/hw/core/tcg-cpu-ops.h
index ac3bb051f2..72d791438c 100644
--- a/include/hw/core/tcg-cpu-ops.h
+++ b/include/hw/core/tcg-cpu-ops.h
@@ -88,6 +88,16 @@ struct TCGCPUOps {
      */
     bool (*debug_check_watchpoint)(CPUState *cpu, CPUWatchpoint *wp);
 
+    /**
+     * @io_recompile_replay_branch: Callback for cpu_io_recompile.
+     *
+     * The cpu has been stopped, and cpu_restore_state_from_tb has been
+     * called.  If the faulting instruction is in a delay slot, and the
+     * target architecture requires re-execution of the branch, then
+     * adjust the cpu state as required and return true.
+     */
+    bool (*io_recompile_replay_branch)(CPUState *cpu,
+                                       const TranslationBlock *tb);
 #endif /* CONFIG_SOFTMMU */
 #endif /* NEED_CPU_H */
 
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 81d4c83f22..6eb37883bd 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -60,6 +60,7 @@
 #include "sysemu/cpu-timers.h"
 #include "sysemu/tcg.h"
 #include "qapi/error.h"
+#include "hw/core/tcg-cpu-ops.h"
 #include "internal.h"
 
 /* #define DEBUG_TB_INVALIDATE */
@@ -2420,6 +2421,7 @@ void cpu_io_recompile(CPUState *cpu, uintptr_t retaddr)
     CPUArchState *env = cpu->env_ptr;
 #endif
     TranslationBlock *tb;
+    CPUClass *cc;
     uint32_t n;
 
     tb = tcg_tb_lookup(retaddr);
@@ -2429,11 +2431,18 @@ void cpu_io_recompile(CPUState *cpu, uintptr_t retaddr)
     }
     cpu_restore_state_from_tb(cpu, tb, retaddr, true);
 
-    /* On MIPS and SH, delay slot instructions can only be restarted if
-       they were already the first instruction in the TB.  If this is not
-       the first instruction in a TB then re-execute the preceding
-       branch.  */
+    /*
+     * Some guests must re-execute the branch when re-executing a delay
+     * slot instruction.  When this is the case, adjust icount and N
+     * to account for the re-execution of the branch.
+     */
     n = 1;
+    cc = CPU_GET_CLASS(cpu);
+    if (cc->tcg_ops->io_recompile_replay_branch &&
+        cc->tcg_ops->io_recompile_replay_branch(cpu, tb)) {
+        cpu_neg(cpu)->icount_decr.u16.low++;
+        n = 2;
+    }
 #if defined(TARGET_MIPS)
     if ((env->hflags & MIPS_HFLAG_BMASK) != 0
         && env->active_tc.PC != tb->pc) {
-- 
2.20.1


