Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C446231ABB4
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Feb 2021 14:26:52 +0100 (CET)
Received: from localhost ([::1]:35278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAuwl-0002qb-Rs
	for lists+qemu-devel@lfdr.de; Sat, 13 Feb 2021 08:26:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lAuiX-0000Nh-W7
 for qemu-devel@nongnu.org; Sat, 13 Feb 2021 08:12:12 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:34879)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lAuiT-0000pM-Sq
 for qemu-devel@nongnu.org; Sat, 13 Feb 2021 08:12:08 -0500
Received: by mail-wm1-x335.google.com with SMTP id n10so2560126wmq.0
 for <qemu-devel@nongnu.org>; Sat, 13 Feb 2021 05:12:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OTSWxsxkLRzd22MvB0YMX4VEjXQCySfV2gGQNLvJ8Uw=;
 b=unCpHCWs6Fu5hJLI/wqKTB6jQ5Yjxv0CzBXKReK67zlDigZyga2tIQ6ZGCtfz8XL4D
 5dweZsLxr3uw+u455oKGcdx4+xbMXctcUtuSKl0dOTGWhR1oxPCB6YXSOsuOMg+akavu
 x8Ck/Z/pqkAJTx3qLUO/ZQaOVglFiZ7zs18XcunoVIUt4ovG8M4V7CoaqAxQ8OxnEgXD
 zlboDg9mr5e6vXDEm4820eIKUFlJwcxSs66H6X9ezp1WXO2EPhyQqCUHpf71LtFIwlKu
 rLcpFEFOOuNG9GGtyVOybgAM0siwcAEUvJb5P0mqNoGzvahHlBN8kIOm/hbvGpIlOpfB
 juuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OTSWxsxkLRzd22MvB0YMX4VEjXQCySfV2gGQNLvJ8Uw=;
 b=Gy0K2LUiS5Umw1hMKJfjZDZpJiJhedz+OO7FPyrI8yAqaAiEDgnDQTv3tzd2DQmuhk
 iTn4EZ6Tv7On+FXjzyhdA0Rt8JidAT6OcovPkjX4bMkOLb6P5S3hiMPCJvgvYOS7RgKz
 EBcWRuUOVmiVJmeOhmZuQ/P1PcWbOKklY1OievTieU3/dWcSeE6Pw34GM8vkk4tadg1w
 uFZn7GF114WYYTySW6/alMpjfUNhp4cn2iPn37iFk11tjOyzL/szbrARDAMyNgnZQQZR
 5Y80YWORguvf+C2kPz4so9Z6Iwp0DFdFQzaSassr4ySQKQtmYPhNIeCRuBVu0ghzL1rb
 XrrQ==
X-Gm-Message-State: AOAM530gS5hywGF9y4U33DiXP1GeTDvaLEf/3oNrZS0pu8H8PfoF1jmH
 IEHSDYR951h+Vu5fgmqGtZxeAg==
X-Google-Smtp-Source: ABdhPJwm1r4Sa+pCJ3IuAUS7sR0v381rAyysJ+Caz9B9IZf0g3Qwmar5QBFjxTuY2sONN30axdubXQ==
X-Received: by 2002:a7b:c442:: with SMTP id l2mr6634274wmi.69.1613221924313;
 Sat, 13 Feb 2021 05:12:04 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id j7sm17629163wrp.72.2021.02.13.05.12.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Feb 2021 05:12:03 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 253491FFA5;
 Sat, 13 Feb 2021 13:03:27 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 17/23] accel/tcg: cache single instruction TB on pending
 replay exception
Date: Sat, 13 Feb 2021 13:03:19 +0000
Message-Id: <20210213130325.14781-18-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210213130325.14781-1-alex.bennee@linaro.org>
References: <20210213130325.14781-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x335.google.com
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
Message-Id: <20210210221053.18050-18-alex.bennee@linaro.org>
---
 accel/tcg/cpu-exec.c | 44 ++++----------------------------------------
 1 file changed, 4 insertions(+), 40 deletions(-)

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


