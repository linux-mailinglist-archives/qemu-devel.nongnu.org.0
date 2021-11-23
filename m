Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6440E45ADB5
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Nov 2021 21:59:38 +0100 (CET)
Received: from localhost ([::1]:36080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpct7-0004aV-GZ
	for lists+qemu-devel@lfdr.de; Tue, 23 Nov 2021 15:59:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mpcrD-0001zY-61
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 15:57:39 -0500
Received: from [2a00:1450:4864:20::431] (port=43859
 helo=mail-wr1-x431.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mpcrA-0006Mb-DX
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 15:57:38 -0500
Received: by mail-wr1-x431.google.com with SMTP id v11so164270wrw.10
 for <qemu-devel@nongnu.org>; Tue, 23 Nov 2021 12:57:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kYpaKzAArYGilOIi+XPhEtI4zXEl1Bkmm+GbL7na2Ng=;
 b=ZqUV0jPW3EWGWO8rhnFWveZO57PcmH6O8pHaxEqI1S+GqX1Ijj8CpvJ9PYXKpk2WmM
 Xiog2joRtpBofXixQNPIe6F94ebYT++STKs1ca3e2Gya9Unr2ddUqgFHDSMNppuzCbay
 gt6HhEMIFU14yuzqDUSeYWHSwQAUkqPB2qOheaTRblJsvMlmcZfNj9EkqjtS4ap7u6lC
 b9nDtjymIVVXsJAPhsWnsjPZMAdNvAvBql/h2wdxoj6VZspaZz1ruO9H7kVayUAOFmXh
 HSkYJmYbcHno3JAHUHUeB7g6yba+nR9tGVZ/V+xiDfIcmAL/iz0T6Arx1coiJBO+l9o7
 adJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kYpaKzAArYGilOIi+XPhEtI4zXEl1Bkmm+GbL7na2Ng=;
 b=RIcH3KW/TsPgVxxNgmwWZ8Zq3NN2M0AObUgEdmAKrk+l5YlSVrjrLAOkleazqiKsw9
 b/Js/g9j6q9PCdp1my76rYtWbrsHeKz1TlGV76qGOh2V6HGaTnrEvaB0aOCGcUOUjwQO
 52/v5QVjKRwfJBkc8JjEWjQiQnv3TMK9VuRJAL5ABxtNu82gHRKuYuNy4u67ywF1EQfd
 bFGBMuyFwgF0G11NGZohH9zgT+9n9i18mCaKfTraecZsI461M5txVT2RT5xPUbqasoPZ
 dFsc/KZnQJRPIsWacxMzC+caOHuLbeeylJtLAb84kJTPu0aCukYTWengJ4KoLIfSNtpH
 9p/w==
X-Gm-Message-State: AOAM53252/ABAvIAY81ksZtUz1uGmyT2G2Q24Li5wMQO9DQ5lySJJqFx
 CLWE2fgm53ufsgpQyep95+Wo+w==
X-Google-Smtp-Source: ABdhPJzG3S/NnbJY7iB8iAnGobaThzi8f39Aovs51/cFB2dL04aR4ancdKudnWIKAcWbujLbB/F11A==
X-Received: by 2002:adf:8008:: with SMTP id 8mr10895564wrk.188.1637701055078; 
 Tue, 23 Nov 2021 12:57:35 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id m14sm17750665wrp.28.2021.11.23.12.57.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Nov 2021 12:57:30 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4E73F1FF99;
 Tue, 23 Nov 2021 20:57:29 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 2/7] accel/tcg: suppress IRQ check for special TBs
Date: Tue, 23 Nov 2021 20:57:24 +0000
Message-Id: <20211123205729.2205806-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211123205729.2205806-1-alex.bennee@linaro.org>
References: <20211123205729.2205806-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::431
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
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
 Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Generally when we set cpu->cflags_next_tb it is because we want to
carefully control the execution of the next TB. Currently there is a
race that causes cflags_next_tb to get ignored if an IRQ is processed
before we execute any actual instructions.

To avoid this we introduce a new compiler flag: CF_NOIRQ to suppress
this check in the generated code so we know we will definitely execute
the next block.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
Fixes: https://gitlab.com/qemu-project/qemu/-/issues/245
---
 include/exec/exec-all.h   |  1 +
 include/exec/gen-icount.h | 21 +++++++++++++++++----
 accel/tcg/cpu-exec.c      | 14 ++++++++++++++
 3 files changed, 32 insertions(+), 4 deletions(-)

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
diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 9cb892e326..9e3ed42ceb 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -721,6 +721,15 @@ static inline bool need_replay_interrupt(int interrupt_request)
 static inline bool cpu_handle_interrupt(CPUState *cpu,
                                         TranslationBlock **last_tb)
 {
+    /*
+     * If we have special cflags lets not get distracted with IRQs. We
+     * shall exit the loop as soon as the next TB completes what it
+     * needs to do.
+     */
+    if (cpu->cflags_next_tb != -1) {
+        return false;
+    }
+
     /* Clear the interrupt flag now since we're processing
      * cpu->interrupt_request and cpu->exit_request.
      * Ensure zeroing happens before reading cpu->exit_request or
@@ -954,11 +963,16 @@ int cpu_exec(CPUState *cpu)
              * after-access watchpoints.  Since this request should never
              * have CF_INVALID set, -1 is a convenient invalid value that
              * does not require tcg headers for cpu_common_reset.
+             *
+             * As we don't want this special TB being interrupted by
+             * some sort of asynchronous event we apply CF_NOIRQ to
+             * disable the usual event checking.
              */
             cflags = cpu->cflags_next_tb;
             if (cflags == -1) {
                 cflags = curr_cflags(cpu);
             } else {
+                cflags |= CF_NOIRQ;
                 cpu->cflags_next_tb = -1;
             }
 
-- 
2.30.2


