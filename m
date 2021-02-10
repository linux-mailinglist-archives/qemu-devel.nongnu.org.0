Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B38531736C
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 23:35:08 +0100 (CET)
Received: from localhost ([::1]:38856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9y4h-00023T-3Y
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 17:35:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l9xhp-0006MK-8o
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 17:11:30 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:55736)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l9xhd-0003Ka-Dr
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 17:11:28 -0500
Received: by mail-wm1-x330.google.com with SMTP id o15so1414629wmq.5
 for <qemu-devel@nongnu.org>; Wed, 10 Feb 2021 14:11:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=V8hRFPoVc8c8eXrlr06JCpkJWOT8xslFBNNz5Wo6GrU=;
 b=NP7/0bpwusTxvB0ZhU+x0q1nVL4wyjUhWnuD++OoZz/gHQyzI6yHJnv0F6IgHS1D5M
 mEPcBkWsV30X8fIWbpKWB59bea7gPPt7KaezQapMch5rBqnBH6Ogj/x33L5EvUBIdaNU
 NHzU48FjGCVkHkNJ0UiPO1Nzoje/OxViKYBGSh4QatSGTuDyvOU/VrGVY6IWNWfvQKre
 U29u4RQD/YxUyAV3PGg5axBgyHlCS/8QYTuEogpWYAlbHcExyhm5Xski+PHASZwLTgxc
 z2u+ErGXNaOKgvj9q9XnDWTg4e+RZleFlnCd0GRVHfWr0LWMM0YoRnwD/+OBuD1s5mZ2
 LBoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=V8hRFPoVc8c8eXrlr06JCpkJWOT8xslFBNNz5Wo6GrU=;
 b=XZp0xb5enmNMeNzrT1uR1c2qnAMYEgZBmed/x9HsQNefMY8y8598ER8nM4upRmk/Fk
 AvwkFqDfa5r+HVZ9mN/np/KYSLrCOsn01DmOX5pw3DgTO+uUsKeiVJ7rzjSwmpW2/dkK
 9yCy2QB+aDgDCJfEZvrGlCJg9qktCqtJ2QyRigUkZlMt7VAwGN0pzjYgQiYHLHo2AGEe
 wNiZVVRSwgo3dGEhxkEqRHnb7kTFaF6CN828QVFsvzA1O+gFHnCk4ubHzxaHMqenl5Bx
 xIHxRTjjL7YBcoXN1Dm+rNBIfMn9k3JEqKuWNUQPjt1U/iN7nqV695IVEJPMafhyA5zP
 LLtg==
X-Gm-Message-State: AOAM533iU2kN1QVcFFSdWZtXvSqnkX6Ia0WzUaVnzLtaZfSY/lMlOl/Z
 w23gv3ZKxoAcyO9yadPEKegZbg==
X-Google-Smtp-Source: ABdhPJx27FFNMbbiYzgKSgLztIOIU2v6/P2xGIK8RkZE/87vFUeTob59+N/RyMgtKgCv01Sos6nemg==
X-Received: by 2002:a05:600c:4105:: with SMTP id
 j5mr1237592wmi.0.1612995076109; 
 Wed, 10 Feb 2021 14:11:16 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id u142sm5099604wmu.3.2021.02.10.14.11.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Feb 2021 14:11:13 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A2E8A1FF9A;
 Wed, 10 Feb 2021 22:10:54 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v2 11/21] accel/tcg: Create io_recompile_replay_branch hook
Date: Wed, 10 Feb 2021 22:10:43 +0000
Message-Id: <20210210221053.18050-12-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210210221053.18050-1-alex.bennee@linaro.org>
References: <20210210221053.18050-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>, robhenry@microsoft.com,
 mahmoudabdalghany@outlook.com, aaron@os.amperecomputing.com, cota@braap.org,
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
Message-Id: <20210208233906.479571-3-richard.henderson@linaro.org>
Message-Id: <20210209182749.31323-3-alex.bennee@linaro.org>
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


