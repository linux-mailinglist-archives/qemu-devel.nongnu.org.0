Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC789317344
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 23:23:37 +0100 (CET)
Received: from localhost ([::1]:45804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9xtY-0000a7-PJ
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 17:23:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l9xqG-0006zU-TA
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 17:20:12 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:55208)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l9xqE-0006pm-JZ
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 17:20:12 -0500
Received: by mail-wm1-x336.google.com with SMTP id w4so3205244wmi.4
 for <qemu-devel@nongnu.org>; Wed, 10 Feb 2021 14:20:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qQYFii8fnhcRgQp6avqKpRK9gTI4aiIkYZihF9RilXM=;
 b=P3IxKJr2hx0mDkoGv0TQGQn+8ktXb14eGW/eVkdaKZfHE2mMJE1Ihn1y7NZ7V8Blxe
 lBPq2vGTCZiaNFGIiXVmSA41VRMz//sQuk3i7hvxkx8glwPhlJ4JpEZYCmpgJ/KPQyHZ
 Tysz939duvpgNG9ePwpUfA5OYrURRfNU+Rus6063EyTk0pfD77Mo75lwTwX6jO01u2uH
 u91LxLpXG+lRmdrjTb0mWG8gdHpQyhO/ouJ0+5GuwIb1Iw4jkjSa4JPX9dAjvrR6Cfu9
 AtJC6n8N6Ko5QyLRc46LMz6v6CzjTHT/3AzQOX8D64oT6742PdA5OrbOaZp0a3zqBgvo
 UohQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qQYFii8fnhcRgQp6avqKpRK9gTI4aiIkYZihF9RilXM=;
 b=p5S7MXeK0SiilGNW3IjxL8IoODCqX1guSeH1jwYOZ2znFH5zFN9pjb4JsXEtERSayD
 5kvxqPXglvXufP4MtCcmlsgomUs5GknG4ZsPwi7aBh7lBdYXekLJYRZCZqnyMjQCuDDi
 LyfaluevXnvZNzGFOS6IuNg8bcAVJx75wdQm4BKIFflUjLUYFZeyY21iPCkogdIKKw6D
 iI9xUfsHKJ8qJ6+4ultGQpZz1r0pBTABcBM55Lh07Gxm/86hQtEo+aOnHsTzOZTaukLc
 Aulpa/Gjey1EM7uV6XY1ALf2bR7iOIvNUIE79H3DdGregPXRAryxTcwHBKlxZhFETdFa
 h52A==
X-Gm-Message-State: AOAM531PVyCfftZRFQnMS8f9QdKzE1Lpkw6eo75hTovlgKFofwvn1FXp
 gXsRixsXPprmxwd7C+/iYnQ/uA==
X-Google-Smtp-Source: ABdhPJxUZzVk+iBlKGYnvr00mEEah/ITcG1+fE3SRJnKOR0LO1Q/Ytdp0eseEjO8rkEebb96+NKf6A==
X-Received: by 2002:a1c:b684:: with SMTP id g126mr1252465wmf.94.1612995608583; 
 Wed, 10 Feb 2021 14:20:08 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id g16sm4494445wmi.30.2021.02.10.14.20.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Feb 2021 14:20:04 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 41B991FF7E;
 Wed, 10 Feb 2021 22:10:55 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 17/21] accel/tcg: cache single instruction TB on pending
 replay exception
Date: Wed, 10 Feb 2021 22:10:49 +0000
Message-Id: <20210210221053.18050-18-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210210221053.18050-1-alex.bennee@linaro.org>
References: <20210210221053.18050-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x336.google.com
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

Again there is no reason to jump through the nocache hoops to execute
a single instruction block. We do have to add an additional wrinkle to
the cpu_handle_interrupt case to ensure we let through a TB where we
have specifically disabled icount for the block.

As the last user of cpu_exec_nocache we can now remove the function.
Further clean-up will follow in subsequent patches.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210209182749.31323-9-alex.bennee@linaro.org>
---
 accel/tcg/cpu-exec.c | 44 ++++----------------------------------------
 1 file changed, 4 insertions(+), 40 deletions(-)

diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 5b6a4fe84b..438fece73b 100644
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


