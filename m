Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDAFB31E81D
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 10:50:16 +0100 (CET)
Received: from localhost ([::1]:33696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCfwt-0008P5-Ue
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 04:50:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lCfu5-0006g5-86
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 04:47:21 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:37238)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lCfu2-0007Cw-2P
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 04:47:20 -0500
Received: by mail-wm1-x332.google.com with SMTP id m1so2379421wml.2
 for <qemu-devel@nongnu.org>; Thu, 18 Feb 2021 01:47:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FZz7tACrz3U3GSG6bPqxjSOF4K+wZRJaKMNCtQxN5KM=;
 b=rnxtAHO+6EeH2Zp0MHVbkW34s/wMVJ2eNeoAKmbMNr2zSr1ZkLPegwJg7zyx+aPjvf
 skY4JkFE/TW7jnQKCvex8iiTwxNDbqePw8VmkwNybLxt3j/dKo56J6JZsekkNWbR9W+A
 1Zi9xBfW9hy1BmqgbFr7ChhIBVH6YqidNOw6CWzlTGGy6laew7agdmxyKwp79oAAt5IH
 rQV0Ssf93OemjL4F4v4YACmeeRKOHCoWAJcu6bns3EOVd4+kf0+INSzJVoIiGagg6RRw
 LZTYyIwrx4fiY0KoA15HqwmwCo6IeXdUqhRoYJdBv8uMKPkLmhpmiOs3tO76xpnoF9y/
 618Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FZz7tACrz3U3GSG6bPqxjSOF4K+wZRJaKMNCtQxN5KM=;
 b=YNlj+z2oKg+T75sszuk3Urm5mwW7Py575qYKfUJaHXpdSOLKAu1UJSaytRlOnfVTm5
 /QxSygT9zBIEN6ZYuVXP/LdmtDRD90u1zS2TVsSY1w2h3iq3cmFzcdqSIzpkix3OPDgF
 wr60GThnEnNIie0VNiS13AnVZ/qMSM6p2XVUskP59mYUywJPmw6nHd49306iavQepOZH
 P1VDMzfrvCm/L/Uwn/sPpzDsyzYxAk1MBkQS8mgof9A/dRhWGI4GQ3XZurMquyX07/wp
 2yTAno/0wl1PR9mnfRWMYWKnP0r1fyijDkx+Srg3fELs+t0AAULMmPRWseRQ1VELBxxC
 OVfA==
X-Gm-Message-State: AOAM533gktTDs4ogYW+VwfMk4ZpynVzssO+IkpmoalXzZ8p4uL+xL/tt
 TmOUrz556OPQsSfDcPt836rSLw==
X-Google-Smtp-Source: ABdhPJwWD+Xna9fikVjs8Q6PnlqwJxB7Q8ABY8xPqQpws6/7Ynwbz1/YszFbdskBo0Sr4qeDd76QCA==
X-Received: by 2002:a7b:c149:: with SMTP id z9mr2742335wmi.164.1613641636334; 
 Thu, 18 Feb 2021 01:47:16 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id g15sm8057078wrx.1.2021.02.18.01.47.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Feb 2021 01:47:16 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 213111FF9B;
 Thu, 18 Feb 2021 09:47:08 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 12/23] target/mips: Create mips_io_recompile_replay_branch
Date: Thu, 18 Feb 2021 09:46:55 +0000
Message-Id: <20210218094706.23038-13-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210218094706.23038-1-alex.bennee@linaro.org>
References: <20210218094706.23038-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x332.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Move the code from accel/tcg/translate-all.c to target/mips/cpu.c.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210208233906.479571-4-richard.henderson@linaro.org>
Message-Id: <20210213130325.14781-13-alex.bennee@linaro.org>

diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 99ca6f36b9..9fea5c0e59 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -2418,7 +2418,7 @@ void tb_check_watchpoint(CPUState *cpu, uintptr_t retaddr)
  */
 void cpu_io_recompile(CPUState *cpu, uintptr_t retaddr)
 {
-#if defined(TARGET_MIPS) || defined(TARGET_SH4)
+#if defined(TARGET_SH4)
     CPUArchState *env = cpu->env_ptr;
 #endif
     TranslationBlock *tb;
@@ -2444,15 +2444,7 @@ void cpu_io_recompile(CPUState *cpu, uintptr_t retaddr)
         cpu_neg(cpu)->icount_decr.u16.low++;
         n = 2;
     }
-#if defined(TARGET_MIPS)
-    if ((env->hflags & MIPS_HFLAG_BMASK) != 0
-        && env->active_tc.PC != tb->pc) {
-        env->active_tc.PC -= (env->hflags & MIPS_HFLAG_B16 ? 2 : 4);
-        cpu_neg(cpu)->icount_decr.u16.low++;
-        env->hflags &= ~MIPS_HFLAG_BMASK;
-        n = 2;
-    }
-#elif defined(TARGET_SH4)
+#if defined(TARGET_SH4)
     if ((env->flags & ((DELAY_SLOT | DELAY_SLOT_CONDITIONAL))) != 0
         && env->pc != tb->pc) {
         env->pc -= 2;
diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index ad163ead62..bf70c77295 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -268,6 +268,23 @@ static void mips_cpu_synchronize_from_tb(CPUState *cs,
     env->hflags &= ~MIPS_HFLAG_BMASK;
     env->hflags |= tb->flags & MIPS_HFLAG_BMASK;
 }
+
+# ifndef CONFIG_USER_ONLY
+static bool mips_io_recompile_replay_branch(CPUState *cs,
+                                            const TranslationBlock *tb)
+{
+    MIPSCPU *cpu = MIPS_CPU(cs);
+    CPUMIPSState *env = &cpu->env;
+
+    if ((env->hflags & MIPS_HFLAG_BMASK) != 0
+        && env->active_tc.PC != tb->pc) {
+        env->active_tc.PC -= (env->hflags & MIPS_HFLAG_B16 ? 2 : 4);
+        env->hflags &= ~MIPS_HFLAG_BMASK;
+        return true;
+    }
+    return false;
+}
+# endif /* !CONFIG_USER_ONLY */
 #endif /* CONFIG_TCG */
 
 static bool mips_cpu_has_work(CPUState *cs)
@@ -679,6 +696,7 @@ static struct TCGCPUOps mips_tcg_ops = {
     .do_interrupt = mips_cpu_do_interrupt,
     .do_transaction_failed = mips_cpu_do_transaction_failed,
     .do_unaligned_access = mips_cpu_do_unaligned_access,
+    .io_recompile_replay_branch = mips_io_recompile_replay_branch,
 #endif /* !CONFIG_USER_ONLY */
 };
 #endif /* CONFIG_TCG */
-- 
2.20.1


