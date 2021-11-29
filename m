Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7469F46186C
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Nov 2021 15:28:10 +0100 (CET)
Received: from localhost ([::1]:51348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrhdZ-0003eo-IW
	for lists+qemu-devel@lfdr.de; Mon, 29 Nov 2021 09:28:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mrhLk-0001GV-EY
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 09:09:44 -0500
Received: from [2a00:1450:4864:20::330] (port=54026
 helo=mail-wm1-x330.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mrhLg-0006UH-Ut
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 09:09:43 -0500
Received: by mail-wm1-x330.google.com with SMTP id y196so14717240wmc.3
 for <qemu-devel@nongnu.org>; Mon, 29 Nov 2021 06:09:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LlhZwpKu414qJjgz6hLLraIgHgqCtfsJisAg9+N5jK4=;
 b=OLwx4sjA/j7DFPqmSLfmbswiuHGD7oRD2oFnlk84GP0iKlCif3nKCnUpCQ2LJUyEaU
 +btb+Jam5gGNPZTT8FENuNPKlPedGMBe5VYEKAfKcUcPCB6UNIw8zqFx1vYePcfXAlwS
 kMiC4D2h8gV9oYi2FczCsstL7NyY14IbffYIYUymf3LpSWBF96cjkuOTaylXgzl/dqlN
 pZAY2wEycWrUxi77uMbB5a9JpTQ9X2ng6U/NH2ILUsqL+HbKwTPFtpnr+htqB+zBVeNt
 dlE3sjJUmDqz1obuTUqb8/JgtCV07d/bTvVtjh2FGOu+JRIvZshkkNagHZhV7ci98yOE
 q27g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LlhZwpKu414qJjgz6hLLraIgHgqCtfsJisAg9+N5jK4=;
 b=EA9m+6yXC8IePo1wmDAXTZF6+WiqTqD/H3KK7cMXjy7O7bgPVmUcBSY0wzwY5Bdc8V
 MYqo4bK8BwWsmUDctpq7IroF05g7nqYfYvBM99GAbi0Rn+GaW8Uv8un1HkjWhW4pJTFB
 zJPJLDFyDgUwKa0tytOHRAUoTfoPe36a9UMn+tWkr41Y+5Ww7N7m/DqzKSuMNN3vh4H9
 IL7RqfeNl3NYlwPKuPmcJDkzgEx2ULUnfNcLTiGEDhUImVDjaPFo1Mkm7FQsQHWhcXJl
 CnwND2obfR0ZVRjMJIUteOICvQfH00PqUzRhUrHvFNILg0DXEDkAwln9WN+Rzy8vOoXG
 7cwQ==
X-Gm-Message-State: AOAM530sqzqtZVdZFEEsLuWTfKOnYZFJv3jt/BSEAP5XZLqz6xuvlvfB
 QzFNg+5Erq1wlS+cgJ2S6LrUCw==
X-Google-Smtp-Source: ABdhPJyaVxR7rE/TymKJl93phAjnRnkXwy+xvX8t6E/N/ZEq6NEXWXXict4cI4CvmkRFE1ye9C+WfA==
X-Received: by 2002:a1c:4d15:: with SMTP id o21mr36414545wmh.171.1638194977979; 
 Mon, 29 Nov 2021 06:09:37 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id 38sm14401536wrc.1.2021.11.29.06.09.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Nov 2021 06:09:34 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 190571FF99;
 Mon, 29 Nov 2021 14:09:33 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v3 2/8] accel/tcg: suppress IRQ check for special TBs
Date: Mon, 29 Nov 2021 14:09:26 +0000
Message-Id: <20211129140932.4115115-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211129140932.4115115-1-alex.bennee@linaro.org>
References: <20211129140932.4115115-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::330
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
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
Cc: fam@euphon.net, berrange@redhat.com, David Hildenbrand <david@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, f4bug@amsat.org,
 Peter Xu <peterx@redhat.com>, stefanha@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com, Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When we set cpu->cflags_next_tb it is because we want to carefully
control the execution of the next TB. Currently there is a race that
causes the second stage of watchpoint handling to get ignored if an
IRQ is processed before we finish executing the instruction that
triggers the watchpoint. Use the new CF_NOIRQ facility to avoid the
race.

We also suppress IRQs when handling precise self modifying code to
avoid unnecessary bouncing.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
Fixes: https://gitlab.com/qemu-project/qemu/-/issues/245

---
v2
  - split the CF_NOIRQ implementation
  - only apply CF_NOIRQ for watchpoints/SMC handling
  - minor reword of commit
v3
  - add additional two cases of | CF_NOIRQ
---
 accel/tcg/cpu-exec.c      | 9 +++++++++
 accel/tcg/translate-all.c | 4 ++--
 softmmu/physmem.c         | 4 ++--
 3 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 2d14d02f6c..409ec8c38c 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -721,6 +721,15 @@ static inline bool need_replay_interrupt(int interrupt_request)
 static inline bool cpu_handle_interrupt(CPUState *cpu,
                                         TranslationBlock **last_tb)
 {
+    /*
+     * If we have requested custom cflags with CF_NOIRQ we should
+     * skip checking here. Any pending interrupts will get picked up
+     * by the next TB we execute under normal cflags.
+     */
+    if (cpu->cflags_next_tb != -1 && cpu->cflags_next_tb & CF_NOIRQ) {
+        return false;
+    }
+
     /* Clear the interrupt flag now since we're processing
      * cpu->interrupt_request and cpu->exit_request.
      * Ensure zeroing happens before reading cpu->exit_request or
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index bd0bb81d08..bd71db59a9 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -1738,7 +1738,7 @@ tb_invalidate_phys_page_range__locked(struct page_collection *pages,
     if (current_tb_modified) {
         page_collection_unlock(pages);
         /* Force execution of one insn next time.  */
-        cpu->cflags_next_tb = 1 | curr_cflags(cpu);
+        cpu->cflags_next_tb = 1 | CF_NOIRQ | curr_cflags(cpu);
         mmap_unlock();
         cpu_loop_exit_noexc(cpu);
     }
@@ -1906,7 +1906,7 @@ static bool tb_invalidate_phys_page(tb_page_addr_t addr, uintptr_t pc)
 #ifdef TARGET_HAS_PRECISE_SMC
     if (current_tb_modified) {
         /* Force execution of one insn next time.  */
-        cpu->cflags_next_tb = 1 | curr_cflags(cpu);
+        cpu->cflags_next_tb = 1 | CF_NOIRQ | curr_cflags(cpu);
         return true;
     }
 #endif
diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index 314f8b439c..3524c04c2a 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -912,7 +912,7 @@ void cpu_check_watchpoint(CPUState *cpu, vaddr addr, vaddr len,
                  */
                 if (!cpu->can_do_io) {
                     /* Force execution of one insn next time.  */
-                    cpu->cflags_next_tb = 1 | CF_LAST_IO | curr_cflags(cpu);
+                    cpu->cflags_next_tb = 1 | CF_LAST_IO | CF_NOIRQ | curr_cflags(cpu);
                     cpu_loop_exit_restore(cpu, ra);
                 }
                 /*
@@ -946,7 +946,7 @@ void cpu_check_watchpoint(CPUState *cpu, vaddr addr, vaddr len,
                 cpu_loop_exit(cpu);
             } else {
                 /* Force execution of one insn next time.  */
-                cpu->cflags_next_tb = 1 | CF_LAST_IO | curr_cflags(cpu);
+                cpu->cflags_next_tb = 1 | CF_LAST_IO | CF_NOIRQ | curr_cflags(cpu);
                 mmap_unlock();
                 cpu_loop_exit_noexc(cpu);
             }
-- 
2.30.2


