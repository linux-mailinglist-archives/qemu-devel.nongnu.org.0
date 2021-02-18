Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA56031E863
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 11:09:33 +0100 (CET)
Received: from localhost ([::1]:34080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCgFY-0007OL-UK
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 05:09:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lCfzY-0004ZR-5g
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 04:53:00 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:33981)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lCfzV-00010u-Sj
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 04:52:59 -0500
Received: by mail-wm1-x32a.google.com with SMTP id o10so2467088wmc.1
 for <qemu-devel@nongnu.org>; Thu, 18 Feb 2021 01:52:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=J6t14fMjlWmSY/RcG379H0HP4pomUYB2uffBkdEK/6Q=;
 b=izphmsXo7OXrSTLSBHORTYyLDWuYsC6pTIsYQ3hvT079fUIzJFwo5Zks5JT+/6KQRo
 l2wNdqUzgrdP2Kto9GBtcG3Tt45GhkvEyJdNk+30o+vCDh7kWQNFI6juaGPfLmODE6zD
 6V+e0wKSF/Bx71ZdK9IQnx2ggR8B1Kz05WG/spKASXOR1eM8PXKNSfkrrDMxZ0lSDbfT
 jai5rUKcvCgxxKz2nW7Qwc7gdipuZX7qloDlwwNOHXP8LmER4IFSV9vOqzePPeh9a6x3
 g1UDO+x/MEp9qujyRYdfww8XUyIM/zHXJFM6oAcK6owjlAIPo03asN7vKZLzHvaLnaje
 UjiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=J6t14fMjlWmSY/RcG379H0HP4pomUYB2uffBkdEK/6Q=;
 b=dBkrWb/h2AgMAvlAfv7fcZrFWJ/mvhngW0JxInnIghiyCsnuMCMQAVGD0VON9NcVjp
 wq45KuB6G5orercBPOjbuLpZ2cBbesGBp45Tx7mw7NTNqU0ulLvg3LLwDNIstG3ITXii
 rHvm4YgOHhAmiQCCY4tqV4YYEFt3c9wBE39tXTlHDxRD9vJmx9SdXZI3eIxZjm0WmAvV
 0FTOTkpJfKVTzsEIH0ZTVp1rzQZY5MASKRPV7HV7VGcMRhExSVeTmQOpQAZdY7rMOHHS
 xDs8B0JO2dOW46fTQGRnLAJkkIbS3K6XTwPJkzkoJphpZjrZww63ThWrT6t78mvHFzQo
 uvaQ==
X-Gm-Message-State: AOAM530XHZDrzq7Rmvx/skZhybqzaSa6o+BL8RuHjRXCcqJHD4LRvG15
 NRWJEfkkC8bh2QbMtvgE+sD0+w==
X-Google-Smtp-Source: ABdhPJz4SKZ8bAm9TMMWZvE3e82M14oLK43ITlRkkNXsgh3R/ODzFl47DUK3YMyaGUxo7ZtOzDaZhA==
X-Received: by 2002:a1c:98ce:: with SMTP id a197mr2735622wme.120.1613641972715; 
 Thu, 18 Feb 2021 01:52:52 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id y4sm1837680wrs.66.2021.02.18.01.52.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Feb 2021 01:52:46 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 952D41FFA5;
 Thu, 18 Feb 2021 09:47:08 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 17/23] accel/tcg: cache single instruction TB on pending replay
 exception
Date: Thu, 18 Feb 2021 09:47:00 +0000
Message-Id: <20210218094706.23038-18-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210218094706.23038-1-alex.bennee@linaro.org>
References: <20210218094706.23038-1-alex.bennee@linaro.org>
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Again there is no reason to jump through the nocache hoops to execute
a single instruction block. We do have to add an additional wrinkle to
the cpu_handle_interrupt case to ensure we let through a TB where we
have specifically disabled icount for the block.

As the last user of cpu_exec_nocache we can now remove the function.
Further clean-up will follow in subsequent patches.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210213130325.14781-18-alex.bennee@linaro.org>

diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index d24c1bdb74..16e4fe3ccd 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -224,40 +224,6 @@ cpu_tb_exec(CPUState *cpu, TranslationBlock *itb, int *tb_exit)
     return last_tb;
 }
 
-#ifndef CONFIG_USER_ONLY
-/* Execute the code without caching the generated code. An interpreter
-   could be used if available. */
-static void cpu_exec_nocache(CPUState *cpu, int max_cycles,
-                             TranslationBlock *orig_tb, bool ignore_icount)
-{
-    TranslationBlock *tb;
-    uint32_t cflags = curr_cflags() | CF_NOCACHE;
-    int tb_exit;
-
-    if (ignore_icount) {
-        cflags &= ~CF_USE_ICOUNT;
-    }
-
-    /* Should never happen.
-       We only end up here when an existing TB is too long.  */
-    cflags |= MIN(max_cycles, CF_COUNT_MASK);
-
-    mmap_lock();
-    tb = tb_gen_code(cpu, orig_tb->pc, orig_tb->cs_base,
-                     orig_tb->flags, cflags);
-    tb->orig_tb = orig_tb;
-    mmap_unlock();
-
-    /* execute the generated code */
-    trace_exec_tb_nocache(tb, tb->pc);
-    cpu_tb_exec(cpu, tb, &tb_exit);
-
-    mmap_lock();
-    tb_phys_invalidate(tb, -1);
-    mmap_unlock();
-    tcg_tb_remove(tb);
-}
-#endif
 
 static void cpu_exec_enter(CPUState *cpu)
 {
@@ -524,15 +490,12 @@ static inline bool cpu_handle_exception(CPUState *cpu, int *ret)
 #ifndef CONFIG_USER_ONLY
         if (replay_has_exception()
             && cpu_neg(cpu)->icount_decr.u16.low + cpu->icount_extra == 0) {
-            /* try to cause an exception pending in the log */
-            cpu_exec_nocache(cpu, 1, tb_find(cpu, NULL, 0, curr_cflags()), true);
+            /* Execute just one insn to trigger exception pending in the log */
+            cpu->cflags_next_tb = (curr_cflags() & ~CF_USE_ICOUNT) | 1;
         }
 #endif
-        if (cpu->exception_index < 0) {
-            return false;
-        }
+        return false;
     }
-
     if (cpu->exception_index >= EXCP_INTERRUPT) {
         /* exit request from the cpu execution loop */
         *ret = cpu->exception_index;
@@ -688,6 +651,7 @@ static inline bool cpu_handle_interrupt(CPUState *cpu,
     /* Finally, check if we need to exit to the main loop.  */
     if (unlikely(qatomic_read(&cpu->exit_request))
         || (icount_enabled()
+            && (cpu->cflags_next_tb == -1 || cpu->cflags_next_tb & CF_USE_ICOUNT)
             && cpu_neg(cpu)->icount_decr.u16.low + cpu->icount_extra == 0)) {
         qatomic_set(&cpu->exit_request, 0);
         if (cpu->exception_index == -1) {
-- 
2.20.1


