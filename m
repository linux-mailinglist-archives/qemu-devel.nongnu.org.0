Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1E864617DC
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Nov 2021 15:20:14 +0100 (CET)
Received: from localhost ([::1]:32842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrhVt-0007hL-Lf
	for lists+qemu-devel@lfdr.de; Mon, 29 Nov 2021 09:20:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mrhLk-0001Fz-3a
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 09:09:44 -0500
Received: from [2a00:1450:4864:20::32d] (port=37612
 helo=mail-wm1-x32d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mrhLd-0006Tx-3C
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 09:09:43 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 k37-20020a05600c1ca500b00330cb84834fso16939732wms.2
 for <qemu-devel@nongnu.org>; Mon, 29 Nov 2021 06:09:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1TZ8swcyv0OX5mGYSW/yBjqG9DvFKB22CAAKdZIQEUc=;
 b=XzTav9bFvkmOT9bE9OZXiGyVLDbkGEJGdCpu9RVRwVcuUqoaxF+zCQoeemiXnPLNrx
 2P9gTsTEuxj3wnMkmjp9oNT7rBx4xt5ta/Hf4+9zB3XjmM2vUckTSwI+R7aHdN8EmgSG
 eseAL95sZbsciQkKAJRZRaircLMNK/2u7TwK37aBdV/EoejgIcGxmRIzNwMJMR34YsrU
 bQZZlNfffMMshRsMglo2/HiKbhxabRmPvqcZ5p3+ubMlV0J+yiR/uP5/6UjfWnaAUyRA
 hOmfmBYsAAOwLzAO2d0ilSKYO11KALHO3WqLlXIbmyvSfFm+Vk/S9zj3ASp7GE2jdCQj
 Pdcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1TZ8swcyv0OX5mGYSW/yBjqG9DvFKB22CAAKdZIQEUc=;
 b=gILoIgYTbnVRJghHGNMD2ShbnPgTUMMaOytBt5urXLxC1lgZqMeZD2x3TL22JB8wmR
 lQmMAqUL4WOYn9KdLD3OkBQzEiivHtva73Q34ng817tWdzT2HNtDOCAKKC0ARPlN08Ju
 pi/Hrq0NuXNR7kQ5kt3OXp660EpDl01ZlWZaqA5VoW9gMYbc8ec5uTrZF4kEKljf4k/G
 S156GyOSOacwgCJJDFk/PvoNc0aYhOsaqS94LFSDlN0YkUWhJje85s1zWyR4VGwXrHLb
 STTUBS0ke4NBq4E7zbN+wudKcLSEt6oxlQI3NFBOqwdQ0IWReuGEtZyq+o0mfujItSqe
 LMkA==
X-Gm-Message-State: AOAM5321OUfyYZwN+ozoRNt8UAYovEPCYs9UOAmqwHbNVVI1KKEBsVVK
 SIZLo5A0JRn7l4gwrL2sSkgqGQ==
X-Google-Smtp-Source: ABdhPJxx5Hvw9vCKu/PqzgZaxHQw7FyQSEcBiW3/yvNy9Pr7Vm5aZyWV60xyvaA3LGa7lXM5cW8ZtQ==
X-Received: by 2002:a05:600c:24d:: with SMTP id
 13mr36711515wmj.156.1638194975097; 
 Mon, 29 Nov 2021 06:09:35 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id e18sm14076042wrs.48.2021.11.29.06.09.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Nov 2021 06:09:34 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 07FB91FF98;
 Mon, 29 Nov 2021 14:09:33 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v3 1/8] accel/tcg: introduce CF_NOIRQ
Date: Mon, 29 Nov 2021 14:09:25 +0000
Message-Id: <20211129140932.4115115-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211129140932.4115115-1-alex.bennee@linaro.org>
References: <20211129140932.4115115-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: fam@euphon.net, berrange@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>, f4bug@amsat.org,
 stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Here we introduce a new compiler flag to disable the checking of exit
request (icount_decr.u32). This is useful when we want to ensure the
next block cannot be preempted by an asynchronous event.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

---
v2
  - split from larger patch
  - reword the check in cpu_handle_interrupt and scope to CF_NOIRQ only
---
 include/exec/exec-all.h   |  1 +
 include/exec/gen-icount.h | 21 +++++++++++++++++----
 2 files changed, 18 insertions(+), 4 deletions(-)

diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index 6bb2a0f7ec..35d8e93976 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -503,6 +503,7 @@ struct TranslationBlock {
 #define CF_USE_ICOUNT    0x00020000
 #define CF_INVALID       0x00040000 /* TB is stale. Set with @jmp_lock held */
 #define CF_PARALLEL      0x00080000 /* Generate code for a parallel context */
+#define CF_NOIRQ         0x00100000 /* Generate an uninterruptible TB */
 #define CF_CLUSTER_MASK  0xff000000 /* Top 8 bits are cluster ID */
 #define CF_CLUSTER_SHIFT 24
 
diff --git a/include/exec/gen-icount.h b/include/exec/gen-icount.h
index 610cba58fe..c57204ddad 100644
--- a/include/exec/gen-icount.h
+++ b/include/exec/gen-icount.h
@@ -21,7 +21,6 @@ static inline void gen_tb_start(const TranslationBlock *tb)
 {
     TCGv_i32 count;
 
-    tcg_ctx->exitreq_label = gen_new_label();
     if (tb_cflags(tb) & CF_USE_ICOUNT) {
         count = tcg_temp_local_new_i32();
     } else {
@@ -42,7 +41,19 @@ static inline void gen_tb_start(const TranslationBlock *tb)
         icount_start_insn = tcg_last_op();
     }
 
-    tcg_gen_brcondi_i32(TCG_COND_LT, count, 0, tcg_ctx->exitreq_label);
+    /*
+     * Emit the check against icount_decr.u32 to see if we should exit
+     * unless we suppress the check with CF_NOIRQ. If we are using
+     * icount and have suppressed interruption the higher level code
+     * should have ensured we don't run more instructions than the
+     * budget.
+     */
+    if (tb_cflags(tb) & CF_NOIRQ) {
+        tcg_ctx->exitreq_label = NULL;
+    } else {
+        tcg_ctx->exitreq_label = gen_new_label();
+        tcg_gen_brcondi_i32(TCG_COND_LT, count, 0, tcg_ctx->exitreq_label);
+    }
 
     if (tb_cflags(tb) & CF_USE_ICOUNT) {
         tcg_gen_st16_i32(count, cpu_env,
@@ -74,8 +85,10 @@ static inline void gen_tb_end(const TranslationBlock *tb, int num_insns)
                            tcgv_i32_arg(tcg_constant_i32(num_insns)));
     }
 
-    gen_set_label(tcg_ctx->exitreq_label);
-    tcg_gen_exit_tb(tb, TB_EXIT_REQUESTED);
+    if (tcg_ctx->exitreq_label) {
+        gen_set_label(tcg_ctx->exitreq_label);
+        tcg_gen_exit_tb(tb, TB_EXIT_REQUESTED);
+    }
 }
 
 #endif
-- 
2.30.2


