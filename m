Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7D803155F7
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 19:33:31 +0100 (CET)
Received: from localhost ([::1]:41784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9XpK-0008GI-Rd
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 13:33:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l9Xk0-0002sY-Ed
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 13:28:00 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:38690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l9Xjy-0007nb-QH
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 13:28:00 -0500
Received: by mail-wm1-x32a.google.com with SMTP id y134so4455548wmd.3
 for <qemu-devel@nongnu.org>; Tue, 09 Feb 2021 10:27:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zNliwCPKaSP1eGW/lpkDIX8h4kiIJ0I84O8E5iALOHU=;
 b=egZKsiFmjWI9Gf7ZlfrFZRPtI4ko0Gjo7AUplfJhqP+bw31B9oDPRcZjnjbiKvaKnb
 nPHrZmHxu+BQUB6WZJ0zBVZEcTgV2zd/yO3B91cVyhinF0OyJtgBB+luwP5JcXO+tQD0
 GLircg+1e0o1w/GgBMUEZu9rUFsvs1gZh+a0slzCv2u/w2ooftISorZPdlYYzmkN1bUo
 ysCqD9qwIP52UtPci/OzCKgztSPkIk1D6khT//GGmESvB2wZLP+fxpS7gFbDF21A2IUR
 +gz+gXgiOBq0kh261isPKKcnkeMRJI9Ia7Bdbn6ktReKfu3oF9pgGV20sGPm3EfG1eSo
 zwkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zNliwCPKaSP1eGW/lpkDIX8h4kiIJ0I84O8E5iALOHU=;
 b=Z2H4YHm01KkakoBoI7qoykBjbYfAG5oof/fBU3yrkR+Acm4yR6J+r5psZxoNCfIYrW
 GUZmlCeFSbPYZByvFJChz7IdTucbQjHVx+QI3egVp4JfNb+Jrqe7eFA6zCUe08Kv0jox
 qfVTXEkSsddARHcUTaofqcwCiHNIqeCUt+bKHEbb0GQmh7k9xOv06e3FDIgPj75kUQuq
 uJ2ffO9dry8phTucffJqiaGOWZKzvRU5oVt/elHyGcm5wQ1QbmQRdI6X+Zx0+m8IWam2
 3TfbHmkomzF8n3D0rUPecmVo9/YHmMOZGC55yCJnlz7EeAiP2f77nnyyHM0nfiMTCUFu
 b8Ow==
X-Gm-Message-State: AOAM531PPvZnBQthY+aFYzVHYBIqGG3JhhZTMv6TcWXDBKeG5NLVWpgU
 qghSUuG4Pji28MXniHT2kNis4Q==
X-Google-Smtp-Source: ABdhPJxEGDeWtCdJbYxF6KnWPjcRhBKDN8EzZgB9dwVVlSS5owtXPP4S2TiR2kL7KSDvnuyUB9Il8w==
X-Received: by 2002:a7b:c842:: with SMTP id c2mr4762511wml.100.1612895277381; 
 Tue, 09 Feb 2021 10:27:57 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id v1sm5663986wmj.31.2021.02.09.10.27.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Feb 2021 10:27:50 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id BCEDB1FF8C;
 Tue,  9 Feb 2021 18:27:49 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 02/12] accel/tcg: Create io_recompile_replay_branch hook
Date: Tue,  9 Feb 2021 18:27:38 +0000
Message-Id: <20210209182749.31323-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210209182749.31323-1-alex.bennee@linaro.org>
References: <20210209182749.31323-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
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
 aaron@os.amperecomputing.com, cota@braap.org,
 Paolo Bonzini <pbonzini@redhat.com>, kuhn.chenqun@huawei.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Create a hook in which to split out the mips and
sh4 ifdefs from cpu_io_recompile.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210208233906.479571-3-richard.henderson@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
[AJB: s/stoped/stopped/]
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
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


