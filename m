Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73318370E08
	for <lists+qemu-devel@lfdr.de>; Sun,  2 May 2021 18:45:04 +0200 (CEST)
Received: from localhost ([::1]:60770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldFDL-0001S6-Fy
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 12:45:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldEmF-00061G-8f
 for qemu-devel@nongnu.org; Sun, 02 May 2021 12:17:04 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:39783)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldEmD-0007c7-Kg
 for qemu-devel@nongnu.org; Sun, 02 May 2021 12:17:02 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 i21-20020a05600c3555b029012eae2af5d4so4412077wmq.4
 for <qemu-devel@nongnu.org>; Sun, 02 May 2021 09:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=99Oig4N3wkTuBjvWFCoLaUR2inByyDBBLID8cJTmWr0=;
 b=KM+vYxHpdY3V+kBbCdX891uOCkYBAvaTz+3+Sv/Vq37Z/gYuZHgR39BERWGhW+urYK
 QnaUXpaT4dnLXPcVoGeEIB3G6cBidj4V/zfdMz8grBOzRFmI9DElYCTeke1wbnGRPASt
 xTRlv0D5S+ei/F09dK49eeGooIjJxxvnRXHReuon4eXFRiRuKOXVTzLO5f49X+UivMgX
 FXLytGaPuWc8bnSqHh5FZLAn1mgZc2D0y4boW5KnMeYNjWiA0jxE2pXZa3CQE/ak8Asx
 LYgqdx+5j7OQ3WlSKcLVO576G9z6WdmOThkaxYC55G8zt9mlQDTOoN6o0akNz8oW73/w
 /Urw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=99Oig4N3wkTuBjvWFCoLaUR2inByyDBBLID8cJTmWr0=;
 b=YEal5MIcqikJBN0Ngwtd6keWt59jH0RpjE5eq+qw8MCM/asF+dEgQL42N18acEBOqL
 uf6tqWYnOw6d12lDdHHYhfAOtgt33c53CvleXpy0fMN//3j1dCIVfkFjMJ1vSmuIbJuP
 A0Rb4ytq0CdAOg5dVA3FY6RbDo1SliSt+dTCokO5eZyn597A66BN6EfcoovA9PliBoT+
 ctKt7NA5yF2uzHtgKUOpoTj4h2WyHzdYDnPXfbRi/kMPSNl/j9UXOEDN1wQ/KdOQUSxh
 /fFb8U3Z+fn7EkBCMO67y6RpW/QDzJ7TnfbNGPthzjxO6YPK4uS53hA+lhQrdcXR6Kzx
 PAtA==
X-Gm-Message-State: AOAM533vbSrsgeaAWdU1Yv2jJgv0Iq3zR2PIyEulCeuxd3Eer48D4QXi
 Uxw/HXs6jQcZjJQihF8eMLNW5GecEaeEGtTO
X-Google-Smtp-Source: ABdhPJwMgDTAz8R9rGUss6ESPy/fXchZSH5oZgX2UhwKx2d5cRIDSYUDkxtod6jSzGFE6uU7qaz9Ow==
X-Received: by 2002:a05:600c:4fd0:: with SMTP id
 o16mr4533101wmq.137.1619972220025; 
 Sun, 02 May 2021 09:17:00 -0700 (PDT)
Received: from localhost.localdomain
 (anancy-651-1-208-144.w109-217.abo.wanadoo.fr. [109.217.237.144])
 by smtp.gmail.com with ESMTPSA id c15sm9583182wrr.3.2021.05.02.09.16.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 May 2021 09:16:59 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 15/36] target/mips: Merge do_translate_address into
 cpu_mips_translate_address
Date: Sun,  2 May 2021 18:15:17 +0200
Message-Id: <20210502161538.534038-16-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210502161538.534038-1-f4bug@amsat.org>
References: <20210502161538.534038-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently cpu_mips_translate_address() calls raise_mmu_exception(),
and do_translate_address() calls cpu_loop_exit_restore().

This API split is dangerous, we could call cpu_mips_translate_address
without returning to the main loop.

As there is only one caller, it is trivial (and safer) to merge
do_translate_address() back to cpu_mips_translate_address().

Reported-by: Richard Henderson <richard.henderson@linaro.org>
Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210428170410.479308-10-f4bug@amsat.org>
---
 target/mips/internal.h   |  2 +-
 target/mips/op_helper.c  | 20 ++------------------
 target/mips/tlb_helper.c | 11 ++++++-----
 3 files changed, 9 insertions(+), 24 deletions(-)

diff --git a/target/mips/internal.h b/target/mips/internal.h
index 04f4b3d6614..e93e057bece 100644
--- a/target/mips/internal.h
+++ b/target/mips/internal.h
@@ -148,7 +148,7 @@ void mips_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
                                     int mmu_idx, MemTxAttrs attrs,
                                     MemTxResult response, uintptr_t retaddr);
 hwaddr cpu_mips_translate_address(CPUMIPSState *env, target_ulong address,
-                                  MMUAccessType access_type);
+                                  MMUAccessType access_type, uintptr_t retaddr);
 #endif
 
 #define cpu_signal_handler cpu_mips_signal_handler
diff --git a/target/mips/op_helper.c b/target/mips/op_helper.c
index 222a0d7c7b3..61e68cc8bed 100644
--- a/target/mips/op_helper.c
+++ b/target/mips/op_helper.c
@@ -287,23 +287,6 @@ target_ulong helper_rotx(target_ulong rs, uint32_t shift, uint32_t shiftx,
 
 #ifndef CONFIG_USER_ONLY
 
-static inline hwaddr do_translate_address(CPUMIPSState *env,
-                                          target_ulong address,
-                                          MMUAccessType access_type,
-                                          uintptr_t retaddr)
-{
-    hwaddr paddr;
-    CPUState *cs = env_cpu(env);
-
-    paddr = cpu_mips_translate_address(env, address, access_type);
-
-    if (paddr == -1LL) {
-        cpu_loop_exit_restore(cs, retaddr);
-    } else {
-        return paddr;
-    }
-}
-
 #define HELPER_LD_ATOMIC(name, insn, almask, do_cast)                         \
 target_ulong helper_##name(CPUMIPSState *env, target_ulong arg, int mem_idx)  \
 {                                                                             \
@@ -313,7 +296,8 @@ target_ulong helper_##name(CPUMIPSState *env, target_ulong arg, int mem_idx)  \
         }                                                                     \
         do_raise_exception(env, EXCP_AdEL, GETPC());                          \
     }                                                                         \
-    env->CP0_LLAddr = do_translate_address(env, arg, MMU_DATA_LOAD, GETPC()); \
+    env->CP0_LLAddr = cpu_mips_translate_address(env, arg, MMU_DATA_LOAD,     \
+                                                 GETPC());                    \
     env->lladdr = arg;                                                        \
     env->llval = do_cast cpu_##insn##_mmuidx_ra(env, arg, mem_idx, GETPC());  \
     return env->llval;                                                        \
diff --git a/target/mips/tlb_helper.c b/target/mips/tlb_helper.c
index 8d3ea497803..1ffdc1f8304 100644
--- a/target/mips/tlb_helper.c
+++ b/target/mips/tlb_helper.c
@@ -904,21 +904,22 @@ bool mips_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
 
 #ifndef CONFIG_USER_ONLY
 hwaddr cpu_mips_translate_address(CPUMIPSState *env, target_ulong address,
-                                  MMUAccessType access_type)
+                                  MMUAccessType access_type, uintptr_t retaddr)
 {
     hwaddr physical;
     int prot;
     int ret = 0;
+    CPUState *cs = env_cpu(env);
 
     /* data access */
     ret = get_physical_address(env, &physical, &prot, address, access_type,
                                cpu_mmu_index(env, false));
-    if (ret != TLBRET_MATCH) {
-        raise_mmu_exception(env, address, access_type, ret);
-        return -1LL;
-    } else {
+    if (ret == TLBRET_MATCH) {
         return physical;
     }
+
+    raise_mmu_exception(env, address, access_type, ret);
+    cpu_loop_exit_restore(cs, retaddr);
 }
 
 static void set_hflags_for_handler(CPUMIPSState *env)
-- 
2.26.3


