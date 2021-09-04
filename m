Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9343400D9D
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Sep 2021 02:00:57 +0200 (CEST)
Received: from localhost ([::1]:33294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMfai-0006a3-MM
	for lists+qemu-devel@lfdr.de; Sat, 04 Sep 2021 20:00:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mMfWp-0007be-2R
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 19:56:55 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:45742)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mMfWn-00080p-9y
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 19:56:54 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 j17-20020a05600c1c1100b002e754875260so2116592wms.4
 for <qemu-devel@nongnu.org>; Sat, 04 Sep 2021 16:56:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rO0D2OFkHiHdtobaxK4sUMpGxbIKEwY3AB/t5R4+r5g=;
 b=SZqhicDPnz72V/kqSkLbym42y7rDf6RKaugmlKvPH3OMF7MlF3tmXI5mauBIWU1YVB
 1/GOh5TOxc/Me7wjELL9ZHDhXUnbYBQiyAxLxNo2Nf+mQNRvz6NyLSKbw13ROw6Jw4u3
 +hCFDw4WXj+5Tj3oj/RuixZ2qLA5vSuWt7b78x91mAmnh6La3Nf0QC02tiIRpKW92JHp
 TJz+ChXAsAYAjZZ7QM4Kzjt4Mmev0nIG4Q1Zlnft4WmxKSbGu0bYycBpMksqe1M8KFJL
 2fIhb0FzE6Dr29/ypwWbIoqqqgS4Ckz9x/xuEFzjiG7q0dQd8kClMKTT6lCILhkn7DEj
 faww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=rO0D2OFkHiHdtobaxK4sUMpGxbIKEwY3AB/t5R4+r5g=;
 b=kYtq3ZjULknF7iuVJB8yvQBv2FiG5BcN2NRUtwkav9z91ahXVbdYz084AZ4tW9L3Rw
 9FPwpsFiUK62Dn2JlkbkRAhO5L8Zqr5zIx6Y2ZXeaC2NdbeL7SCR6OI2qzyRqOHd3QhN
 RHpAu1e2iPlHqyhZFKgWilPesz44ZeWerKC4+As5INbn/vGlyyhoChbzBxIoXt3K4Cav
 AMK6S3Gtt4vLuDCN+vfebLjCH/e9Cxja8pvIAifxE5IsYdT0hC9VUoiRxl5vO5Ufva+8
 qv+H43GssemlOwgpEco0AknUGKm9d1p/0GIKgjrERThOR9AdAazophEDSA1TCaKgKTE3
 ObpQ==
X-Gm-Message-State: AOAM531LAs3YVxkjTm9QHij33neKr9rMkbQU5rfpB+IMhGXPAMqwCnRl
 yx7RThvJVucxlGRuOo+hwqthZmFqfuc=
X-Google-Smtp-Source: ABdhPJxYe5B8DZmeQjNPFDIDOP6tXaPwbTpmhmE1M62XIe3LsWF136A6IHJqvEqq97NqsOWQen73JA==
X-Received: by 2002:a1c:318b:: with SMTP id x133mr4951188wmx.191.1630799810346; 
 Sat, 04 Sep 2021 16:56:50 -0700 (PDT)
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id f17sm3959699wrt.63.2021.09.04.16.56.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Sep 2021 16:56:49 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 13/24] target/microblaze: Restrict cpu_exec_interrupt()
 handler to sysemu
Date: Sun,  5 Sep 2021 01:55:31 +0200
Message-Id: <20210904235542.1092641-14-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210904235542.1092641-1-f4bug@amsat.org>
References: <20210904235542.1092641-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32b.google.com
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
 target/microblaze/cpu.h    |  2 ++
 target/microblaze/cpu.c    |  2 +-
 target/microblaze/helper.c | 13 ++-----------
 3 files changed, 5 insertions(+), 12 deletions(-)

diff --git a/target/microblaze/cpu.h b/target/microblaze/cpu.h
index e4bba8a7551..40401c33b72 100644
--- a/target/microblaze/cpu.h
+++ b/target/microblaze/cpu.h
@@ -355,8 +355,10 @@ struct MicroBlazeCPU {
 };
 
 
+#ifndef CONFIG_USER_ONLY
 void mb_cpu_do_interrupt(CPUState *cs);
 bool mb_cpu_exec_interrupt(CPUState *cs, int int_req);
+#endif /* !CONFIG_USER_ONLY */
 void mb_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr,
                                 MMUAccessType access_type,
                                 int mmu_idx, uintptr_t retaddr);
diff --git a/target/microblaze/cpu.c b/target/microblaze/cpu.c
index 72d8f2a0daa..15db277925f 100644
--- a/target/microblaze/cpu.c
+++ b/target/microblaze/cpu.c
@@ -365,10 +365,10 @@ static const struct SysemuCPUOps mb_sysemu_ops = {
 static const struct TCGCPUOps mb_tcg_ops = {
     .initialize = mb_tcg_init,
     .synchronize_from_tb = mb_cpu_synchronize_from_tb,
-    .cpu_exec_interrupt = mb_cpu_exec_interrupt,
     .tlb_fill = mb_cpu_tlb_fill,
 
 #ifndef CONFIG_USER_ONLY
+    .cpu_exec_interrupt = mb_cpu_exec_interrupt,
     .do_interrupt = mb_cpu_do_interrupt,
     .do_transaction_failed = mb_cpu_transaction_failed,
     .do_unaligned_access = mb_cpu_do_unaligned_access,
diff --git a/target/microblaze/helper.c b/target/microblaze/helper.c
index 20dbd673136..dd2aecd1d58 100644
--- a/target/microblaze/helper.c
+++ b/target/microblaze/helper.c
@@ -26,16 +26,6 @@
 
 #if defined(CONFIG_USER_ONLY)
 
-void mb_cpu_do_interrupt(CPUState *cs)
-{
-    MicroBlazeCPU *cpu = MICROBLAZE_CPU(cs);
-    CPUMBState *env = &cpu->env;
-
-    cs->exception_index = -1;
-    env->res_addr = RES_ADDR_NONE;
-    env->regs[14] = env->pc;
-}
-
 bool mb_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                      MMUAccessType access_type, int mmu_idx,
                      bool probe, uintptr_t retaddr)
@@ -271,7 +261,6 @@ hwaddr mb_cpu_get_phys_page_attrs_debug(CPUState *cs, vaddr addr,
 
     return paddr;
 }
-#endif
 
 bool mb_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
 {
@@ -289,6 +278,8 @@ bool mb_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
     return false;
 }
 
+#endif /* !CONFIG_USER_ONLY */
+
 void mb_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
                                 MMUAccessType access_type,
                                 int mmu_idx, uintptr_t retaddr)
-- 
2.31.1


