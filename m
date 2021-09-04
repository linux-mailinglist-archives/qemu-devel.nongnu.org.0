Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A60D9400D9C
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Sep 2021 02:00:22 +0200 (CEST)
Received: from localhost ([::1]:59400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMfa9-0005Ar-Lk
	for lists+qemu-devel@lfdr.de; Sat, 04 Sep 2021 20:00:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mMfWJ-0005sm-9F
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 19:56:23 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:53839)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mMfWH-0007hA-Lk
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 19:56:23 -0400
Received: by mail-wm1-x32f.google.com with SMTP id i3so1883626wmq.3
 for <qemu-devel@nongnu.org>; Sat, 04 Sep 2021 16:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=V7zq9ygHOST6Surc7M7Rd7Muo9vEZYb0xO5KQYL2Z9g=;
 b=cx+KWWrR1gMduIOYOCqjGXVsJBRI1xAX8iV/agvrkFu8BlkRtUVHEW6vEXjeckuyk8
 C1cK1+DBrsgGyfsM6bZdfPM03F39eODD3STHJE59206ieP16Flbd6xViEwaX/ppajBLk
 6FizfavxNLgf0tIdEgCVvvGX/zxIGoDm7Sy16H3DSuVvnyo/p0maSxp6cEj7OXk7YD4f
 1YYCSjLmq6Bb7BtfVpjRzxNr6U0MXReCMRRxLtYN1dWsskMB4FvFcGnwtxQqrpdpmMuS
 bXmM/ZG4jngHacEbIbjKJpS7Qv7cQxTq7hpVa1bH3CZccOwV6Tobu66hWR7xRnCqzYDo
 cRTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=V7zq9ygHOST6Surc7M7Rd7Muo9vEZYb0xO5KQYL2Z9g=;
 b=duAnRqjNB9ILbi4KG0QCd2J0mOZblcxiQixIDszFVc6hfHgTqZt7I6RKnwWHGHkI+K
 mfdwUfpVSY/Adj9nscMvupIqyK0zrjzhzl3CqzWVjcAqGd7yf8dzy150Cxpw7ajWqZFO
 iWpZvmF2NJEt+JgCZ8PloizrFFrD+nWFAf20Tz+WUIVhzfzA1kQx4C1StZd2iVgGSKqS
 QcX0+5TVrXnyVOPeRvkjoSOUScbmJiHPRNIoZ94tYvxx2X7S5JnvTbVXiGxLyvFpZ+FQ
 5iQkxB4V/8C1GeBI6ZlQnoX53L1kA0eS5v5g9TXQKwFUAIbqA7i/1rwxftFiJVvd+N5u
 6PQA==
X-Gm-Message-State: AOAM533XUbiELMD/v6PBhN6qGU7/MhM+gUd5hLPOxJ2s0b095NFDcA8u
 askW0+8hHJdVZTlxUXCwq6c6WDP0pmY=
X-Google-Smtp-Source: ABdhPJyv6/c3RPgV+LYikwkNPi3V7w25e+oFEfwCiTf1cqOvshNZrfu6x9rdzl/1p25fYwr2yEBS6w==
X-Received: by 2002:a1c:f008:: with SMTP id a8mr4851799wmb.83.1630799780132;
 Sat, 04 Sep 2021 16:56:20 -0700 (PDT)
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id p11sm3132354wma.16.2021.09.04.16.56.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Sep 2021 16:56:19 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 07/24] target/arm: Restrict cpu_exec_interrupt() handler to
 sysemu
Date: Sun,  5 Sep 2021 01:55:25 +0200
Message-Id: <20210904235542.1092641-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210904235542.1092641-1-f4bug@amsat.org>
References: <20210904235542.1092641-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
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
 Laurent Vivier <laurent@vivier.eu>, Warner Losh <imp@bsdimp.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Restrict cpu_exec_interrupt() and its callees to sysemu.

Reviewed-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/arm/cpu.h     | 3 +--
 target/arm/cpu.c     | 7 +++++--
 target/arm/cpu_tcg.c | 6 +++---
 3 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 6a987f65e41..cfd755cff99 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1040,11 +1040,10 @@ uint64_t arm_cpu_mp_affinity(int idx, uint8_t clustersz);
 
 #ifndef CONFIG_USER_ONLY
 extern const VMStateDescription vmstate_arm_cpu;
-#endif
 
 void arm_cpu_do_interrupt(CPUState *cpu);
 void arm_v7m_cpu_do_interrupt(CPUState *cpu);
-bool arm_cpu_exec_interrupt(CPUState *cpu, int int_req);
+#endif /* !CONFIG_USER_ONLY */
 
 hwaddr arm_cpu_get_phys_page_attrs_debug(CPUState *cpu, vaddr addr,
                                          MemTxAttrs *attrs);
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index d631c4683c4..ba0741b20e4 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -440,6 +440,8 @@ static void arm_cpu_reset(DeviceState *dev)
     arm_rebuild_hflags(env);
 }
 
+#ifndef CONFIG_USER_ONLY
+
 static inline bool arm_excp_unmasked(CPUState *cs, unsigned int excp_idx,
                                      unsigned int target_el,
                                      unsigned int cur_el, bool secure,
@@ -556,7 +558,7 @@ static inline bool arm_excp_unmasked(CPUState *cs, unsigned int excp_idx,
     return unmasked || pstate_unmasked;
 }
 
-bool arm_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
+static bool arm_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
 {
     CPUClass *cc = CPU_GET_CLASS(cs);
     CPUARMState *env = cs->env_ptr;
@@ -608,6 +610,7 @@ bool arm_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
     cc->tcg_ops->do_interrupt(cs);
     return true;
 }
+#endif /* !CONFIG_USER_ONLY */
 
 void arm_cpu_update_virq(ARMCPU *cpu)
 {
@@ -2010,11 +2013,11 @@ static const struct SysemuCPUOps arm_sysemu_ops = {
 static const struct TCGCPUOps arm_tcg_ops = {
     .initialize = arm_translate_init,
     .synchronize_from_tb = arm_cpu_synchronize_from_tb,
-    .cpu_exec_interrupt = arm_cpu_exec_interrupt,
     .tlb_fill = arm_cpu_tlb_fill,
     .debug_excp_handler = arm_debug_excp_handler,
 
 #if !defined(CONFIG_USER_ONLY)
+    .cpu_exec_interrupt = arm_cpu_exec_interrupt,
     .do_interrupt = arm_cpu_do_interrupt,
     .do_transaction_failed = arm_cpu_do_transaction_failed,
     .do_unaligned_access = arm_cpu_do_unaligned_access,
diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index 33cc75af57d..0d5adccf1a7 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -22,7 +22,7 @@
 /* CPU models. These are not needed for the AArch64 linux-user build. */
 #if !defined(CONFIG_USER_ONLY) || !defined(TARGET_AARCH64)
 
-#ifdef CONFIG_TCG
+#if !defined(CONFIG_USER_ONLY) && defined(CONFIG_TCG)
 static bool arm_v7m_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
 {
     CPUClass *cc = CPU_GET_CLASS(cs);
@@ -46,7 +46,7 @@ static bool arm_v7m_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
     }
     return ret;
 }
-#endif /* CONFIG_TCG */
+#endif /* !CONFIG_USER_ONLY && CONFIG_TCG */
 
 static void arm926_initfn(Object *obj)
 {
@@ -898,11 +898,11 @@ static void pxa270c5_initfn(Object *obj)
 static const struct TCGCPUOps arm_v7m_tcg_ops = {
     .initialize = arm_translate_init,
     .synchronize_from_tb = arm_cpu_synchronize_from_tb,
-    .cpu_exec_interrupt = arm_v7m_cpu_exec_interrupt,
     .tlb_fill = arm_cpu_tlb_fill,
     .debug_excp_handler = arm_debug_excp_handler,
 
 #if !defined(CONFIG_USER_ONLY)
+    .cpu_exec_interrupt = arm_v7m_cpu_exec_interrupt,
     .do_interrupt = arm_v7m_cpu_do_interrupt,
     .do_transaction_failed = arm_cpu_do_transaction_failed,
     .do_unaligned_access = arm_cpu_do_unaligned_access,
-- 
2.31.1


