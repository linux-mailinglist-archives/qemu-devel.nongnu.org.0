Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9698B3C3564
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Jul 2021 17:59:11 +0200 (CEST)
Received: from localhost ([::1]:44866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2FNm-0000Dq-MI
	for lists+qemu-devel@lfdr.de; Sat, 10 Jul 2021 11:59:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m2Exj-0006ME-49
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 11:32:15 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:43933)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m2Exf-0002Uj-FL
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 11:32:14 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 x21-20020a17090aa395b029016e25313bfcso7798878pjp.2
 for <qemu-devel@nongnu.org>; Sat, 10 Jul 2021 08:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=i7Yv44S3soVKhBIR2nVe5GqBZQT4ofBHKeU6kY+QU8k=;
 b=V0dlMkBDUppj2vYrDVMIW1RhDpAgvvk4A5reOzDZwhxgm3mPK9nw99kGeeuNkJTd/q
 Xv39QeJ/Ih+fFBr5tP9WgIsTSp2ujPjUnSjHskwqebuCMMw1FyNARx7lJ7vsj0J/t2vm
 ZHF80rOdojmT9HxTi2l+CLgwd0xteSc/7GcHxLgAhDxa9ME4Y0Lk47nNnpksCY/z/75O
 tYq76F4ZpiM0mY76FPwgQ7FteH0TAobAnuB1BLL0Id9//8U2VMqgPu9A+Qb7Vtg9CJso
 3+90vqmLNenIaGYGOqnc6vVivPlxID+2xrBa/bKJ+yRduBaezArY3YiqJvfqAu1kqlfe
 Iivw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=i7Yv44S3soVKhBIR2nVe5GqBZQT4ofBHKeU6kY+QU8k=;
 b=Fjeueui8zYL8ZYydcxFocEZ4/CJ9dUKVXTzpuFxbfVOGw/WoiM58EIRsLcAJRYv7VI
 bOJ1db4q8+h5vqPdG0qjgWzSYrN8vDjcpgogWal6jEkjQzvFNbTc06Kf9GK+4h/X0suj
 pP0vnEZs3NVlq10fe+Qb2hHqO3gISabuigmjBYOWcW1ew408T7qBVoRCGE3CvHPt7R/u
 gxvd9MFmfMO3DKDaEBF3FsqKRhjbBRjMCeHPRJlzh2zHng/oREeK47PUVJCgOKIwj9YV
 o+4KLVKjs68JEGcSSXCkmAX7hr7lNjvZeRcs1NB3xUKTALJUO0NwpOfJXVLKsQdCaatb
 61lg==
X-Gm-Message-State: AOAM532rKDEZaSwsIlWuzstfsnQ2WWDWISkAsV4aPnAbEhG19gC4Xs3D
 t8dYdm+njmx1GBHckRmtW1Hpz0nQGziNxg==
X-Google-Smtp-Source: ABdhPJwTNwA4nnN/Xr4auPxOktkRWnHAC/T0HWYxwkDqtNIPQ+4qTJkJJinhKg6IWyzXOJBIi7u7tw==
X-Received: by 2002:a17:902:9a04:b029:129:7769:2b01 with SMTP id
 v4-20020a1709029a04b029012977692b01mr31621654plp.76.1625931130118; 
 Sat, 10 Jul 2021 08:32:10 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id u23sm11975374pgk.38.2021.07.10.08.32.09
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Jul 2021 08:32:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 38/41] accel/tcg: Split out log_cpu_exec
Date: Sat, 10 Jul 2021 08:31:40 -0700
Message-Id: <20210710153143.1320521-39-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210710153143.1320521-1-richard.henderson@linaro.org>
References: <20210710153143.1320521-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Split out CPU_LOG_EXEC and CPU_LOG_TB_CPU logging from
cpu_tb_exec to a new function.  Perform only one pc
range check after a combined mask check.

Use the new function in lookup_tb_ptr.  This enables
CPU_LOG_TB_CPU between indirectly chained tbs.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/cpu-exec.c | 61 ++++++++++++++++++++++++--------------------
 1 file changed, 34 insertions(+), 27 deletions(-)

diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 0d92698030..67ed25beb9 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -175,6 +175,36 @@ static inline TranslationBlock *tb_lookup(CPUState *cpu, target_ulong pc,
     return tb;
 }
 
+static inline void log_cpu_exec(target_ulong pc, CPUState *cpu,
+                                const TranslationBlock *tb)
+{
+    if (unlikely(qemu_loglevel_mask(CPU_LOG_TB_CPU | CPU_LOG_EXEC))
+        && qemu_log_in_addr_range(pc)) {
+
+        qemu_log_mask(CPU_LOG_EXEC,
+                      "Trace %d: %p [" TARGET_FMT_lx
+                      "/" TARGET_FMT_lx "/%#x] %s\n",
+                      cpu->cpu_index, tb->tc.ptr, tb->cs_base, pc, tb->flags,
+                      lookup_symbol(pc));
+
+#if defined(DEBUG_DISAS)
+        if (qemu_loglevel_mask(CPU_LOG_TB_CPU)) {
+            FILE *logfile = qemu_log_lock();
+            int flags = 0;
+
+            if (qemu_loglevel_mask(CPU_LOG_TB_FPU)) {
+                flags |= CPU_DUMP_FPU;
+            }
+#if defined(TARGET_I386)
+            flags |= CPU_DUMP_CCOP;
+#endif
+            log_cpu_state(cpu, flags);
+            qemu_log_unlock(logfile);
+        }
+#endif /* DEBUG_DISAS */
+    }
+}
+
 /**
  * helper_lookup_tb_ptr: quick check for next tb
  * @env: current cpu state
@@ -196,11 +226,9 @@ const void *HELPER(lookup_tb_ptr)(CPUArchState *env)
     if (tb == NULL) {
         return tcg_code_gen_epilogue;
     }
-    qemu_log_mask_and_addr(CPU_LOG_EXEC, pc,
-                           "Chain %d: %p ["
-                           TARGET_FMT_lx "/" TARGET_FMT_lx "/%#x] %s\n",
-                           cpu->cpu_index, tb->tc.ptr, cs_base, pc, flags,
-                           lookup_symbol(pc));
+
+    log_cpu_exec(pc, cpu, tb);
+
     return tb->tc.ptr;
 }
 
@@ -222,28 +250,7 @@ cpu_tb_exec(CPUState *cpu, TranslationBlock *itb, int *tb_exit)
     TranslationBlock *last_tb;
     const void *tb_ptr = itb->tc.ptr;
 
-    qemu_log_mask_and_addr(CPU_LOG_EXEC, itb->pc,
-                           "Trace %d: %p ["
-                           TARGET_FMT_lx "/" TARGET_FMT_lx "/%#x] %s\n",
-                           cpu->cpu_index, itb->tc.ptr,
-                           itb->cs_base, itb->pc, itb->flags,
-                           lookup_symbol(itb->pc));
-
-#if defined(DEBUG_DISAS)
-    if (qemu_loglevel_mask(CPU_LOG_TB_CPU)
-        && qemu_log_in_addr_range(itb->pc)) {
-        FILE *logfile = qemu_log_lock();
-        int flags = 0;
-        if (qemu_loglevel_mask(CPU_LOG_TB_FPU)) {
-            flags |= CPU_DUMP_FPU;
-        }
-#if defined(TARGET_I386)
-        flags |= CPU_DUMP_CCOP;
-#endif
-        log_cpu_state(cpu, flags);
-        qemu_log_unlock(logfile);
-    }
-#endif /* DEBUG_DISAS */
+    log_cpu_exec(itb->pc, cpu, itb);
 
     qemu_thread_jit_execute();
     ret = tcg_qemu_tb_exec(env, tb_ptr);
-- 
2.25.1


