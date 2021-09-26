Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98BA7418CE2
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 00:51:24 +0200 (CEST)
Received: from localhost ([::1]:53004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUczT-0003Tq-LG
	for lists+qemu-devel@lfdr.de; Sun, 26 Sep 2021 18:51:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUcdx-0003z2-Jr
 for qemu-devel@nongnu.org; Sun, 26 Sep 2021 18:29:09 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:46778)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUcdw-0006T7-4P
 for qemu-devel@nongnu.org; Sun, 26 Sep 2021 18:29:09 -0400
Received: by mail-wr1-x42b.google.com with SMTP id c21so16811212wrb.13
 for <qemu-devel@nongnu.org>; Sun, 26 Sep 2021 15:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FoSlQqSQ8ZbPbrlQxUB8XNqV2UVRF3KYNvOO8ZgTpHU=;
 b=EqjMAlG/pSk2um+MA0SXVOkYxXLoIyeHiJdsma86EhXCN9QjRdu/5NZPJJ/9CvPupb
 Hf01BS0XA7GGYcn1exYEvVXkMWypwWPHuIH3wvXpG+19qCNnVxTmqMYdBi+iRUBSq+cK
 u8iyGT69TNdtgHfuf+9FGIpbgDwlNrCfXh5ZJTyCCe7ztna6oRVtxbnFipNTrZ7Eiq9/
 GFGn/uRSUfLf/YPMO7J0lLDnMnG+33q7j3uvTOOZPpoI/0bWXrfjE/SZv31XBIDnK890
 P7rg7GwWExjt3sns82QoFzxvtNtbj6jPhtIIczQFApeOKgvJ0QxhUQ3w2Wy6ZGiwsz/0
 t+RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=FoSlQqSQ8ZbPbrlQxUB8XNqV2UVRF3KYNvOO8ZgTpHU=;
 b=VMbOoKgjTZfbWh9mMKOKCca8hsJIYriOj2E0r6g00UhjRveFeDKchRzWfEGeN0hDvD
 2xyausb+CXyYDBo5khI+4/pg753FW5BRKwlE6S7N8Uq+q1DKJOT/Wlp9U5JbrueU2Dgb
 /HBYIBISco3Lh5IbBGKJxVXd/iiVEnLbIiDxJa2Olg4IlFQaXTHh8hvghoGeiZRYDtPa
 3qUnE0bwqnYbNajAm3JBjo+pUkksmmipPgrpNyIiLB6plcRq9+MQm1LtJwRrDL1jGAkr
 omjMsxHHwB9vji6qfvR/rgOeMWkWVuOMjdFQ3JYpsqDaFm32BPaMyfADcpY7HNHpBCrP
 gwLg==
X-Gm-Message-State: AOAM530sqaL5ouR4UG06UJNz8prhzk3MKgij5ayMcqtUuf6DEaU9DF7v
 pTvZp1hRs9VfhvfjeNwVb5AGxyl6RNs=
X-Google-Smtp-Source: ABdhPJwG6s3gEaSATqQ6TGjBELsRhm5cbSBOTIKXKGVGKHFANhlUGzS36no0tn+gIQdeKyJwmE9mWw==
X-Received: by 2002:a1c:a78d:: with SMTP id q135mr13058660wme.36.1632695346743; 
 Sun, 26 Sep 2021 15:29:06 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 d8sm15797040wrv.80.2021.09.26.15.29.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Sep 2021 15:29:06 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 23/40] target/i386: Restrict has_work() handler to sysemu
 and TCG
Date: Mon, 27 Sep 2021 00:26:59 +0200
Message-Id: <20210926222716.1732932-24-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210926222716.1732932-1-f4bug@amsat.org>
References: <20210926222716.1732932-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Restrict has_work() to TCG sysemu.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/i386/cpu.c         | 6 ------
 target/i386/tcg/tcg-cpu.c | 8 +++++++-
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 6b029f1bdf1..36a1c5f3fd2 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -6554,11 +6554,6 @@ int x86_cpu_pending_interrupt(CPUState *cs, int interrupt_request)
     return 0;
 }
 
-static bool x86_cpu_has_work(CPUState *cs)
-{
-    return x86_cpu_pending_interrupt(cs, cs->interrupt_request) != 0;
-}
-
 static void x86_disas_set_info(CPUState *cs, disassemble_info *info)
 {
     X86CPU *cpu = X86_CPU(cs);
@@ -6763,7 +6758,6 @@ static void x86_cpu_common_class_init(ObjectClass *oc, void *data)
 
     cc->class_by_name = x86_cpu_class_by_name;
     cc->parse_features = x86_cpu_parse_featurestr;
-    cc->has_work = x86_cpu_has_work;
     cc->dump_state = x86_cpu_dump_state;
     cc->set_pc = x86_cpu_set_pc;
     cc->gdb_read_register = x86_cpu_gdb_read_register;
diff --git a/target/i386/tcg/tcg-cpu.c b/target/i386/tcg/tcg-cpu.c
index 3ecfae34cb5..aef050d0898 100644
--- a/target/i386/tcg/tcg-cpu.c
+++ b/target/i386/tcg/tcg-cpu.c
@@ -55,6 +55,11 @@ static void x86_cpu_synchronize_from_tb(CPUState *cs,
 }
 
 #ifndef CONFIG_USER_ONLY
+static bool x86_cpu_has_work(CPUState *cs)
+{
+    return x86_cpu_pending_interrupt(cs, cs->interrupt_request) != 0;
+}
+
 static bool x86_debug_check_breakpoint(CPUState *cs)
 {
     X86CPU *cpu = X86_CPU(cs);
@@ -63,7 +68,7 @@ static bool x86_debug_check_breakpoint(CPUState *cs)
     /* RF disables all architectural breakpoints. */
     return !(env->eflags & RF_MASK);
 }
-#endif
+#endif /* CONFIG_USER_ONLY */
 
 #include "hw/core/tcg-cpu-ops.h"
 
@@ -76,6 +81,7 @@ static const struct TCGCPUOps x86_tcg_ops = {
 #ifdef CONFIG_USER_ONLY
     .fake_user_interrupt = x86_cpu_do_interrupt,
 #else
+    .has_work = x86_cpu_has_work,
     .do_interrupt = x86_cpu_do_interrupt,
     .cpu_exec_interrupt = x86_cpu_exec_interrupt,
     .debug_excp_handler = breakpoint_handler,
-- 
2.31.1


