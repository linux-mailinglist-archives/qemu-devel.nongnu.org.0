Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A498F515DF2
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Apr 2022 16:01:13 +0200 (CEST)
Received: from localhost ([::1]:35358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkneq-0001eE-P9
	for lists+qemu-devel@lfdr.de; Sat, 30 Apr 2022 10:01:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nknDs-0003Pp-CK
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 09:33:20 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:46983)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nknDq-0006uM-6R
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 09:33:19 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 cq17-20020a17090af99100b001dc0386cd8fso4078387pjb.5
 for <qemu-devel@nongnu.org>; Sat, 30 Apr 2022 06:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UdtjLtols2yqTud00vK3rG7dIDZOc8n/MVdagQPOyIc=;
 b=R5/ljiZ0GIpQjZne/EEGJXQiblXl+KuEzFDWZLp3eECeJ2WmOGnxSgtHUyH5cBK7W7
 Dgv7NRcmE7fDdvOrY4WMQ6BXN+sbH5+47IbmEE8zmV74ReNipUPvChwfMmFJUvy8zZPp
 NfK9xuSI5SpEYZ3H4GZ6OtmyxvFM7AL3kx8HTuzktoH4hSSAKdv+WDjXHWkLc5rs40TC
 4aw3yr7Bva2c8OBR57pkZ3KXryqB344eJb8L7KaIVVeYX7SgaeGawBPzknLxCiuqCYyd
 FLX4T7I91DFQKDDsyQRJnS9opDvTDM/LpMewjHEqH1SzSEX14crJo8bG1k8fYCqLrDKo
 bjKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UdtjLtols2yqTud00vK3rG7dIDZOc8n/MVdagQPOyIc=;
 b=M11/pf3Q6ol63CM2eX0KX/mBi9zHHPIEY10aLEwxfWqORCpRUHzqLVEbJyxe8Agcjt
 MSJAAMNCUWDTDnG+mPumvplrklOW7gW7K/LBGk/dzGmvovQONSOMekDicE0fHbgjZDMJ
 DqjE6Xch+zRt3z0D/6Gv9ZX23NnVHFk64hCYEOKTYl3jzzH56HaKHm/pfRPaUUN8ULfQ
 fNWhRVfo9gACSKJdw8yFymSGAZWW987gCZaoKiKQW+e6suuRAWmsNdE8Xrv9acU0zZVE
 8xzSuaVMY5bkW/UcaPE0CTeKIH84prZy7fxRhRZUgsQyPByP8Dyj9GBTG7NBLPJCW/Yx
 mdcw==
X-Gm-Message-State: AOAM531wjpN/DYB/3Bu0ZVspJ0TbzYTVM9hV7qwTukAiJ3hXfvKwAo5A
 kGh31+a8nCEZLUezKW8PES92lbGJy8hsxQ==
X-Google-Smtp-Source: ABdhPJy4wsdeQLLgfmGJLJfhaHOFA2qpcmAltnWG+7b6vjdMcYt/wk+axysETEgzJSe9WD6LvO3E5Q==
X-Received: by 2002:a17:903:24f:b0:15c:e3b8:a640 with SMTP id
 j15-20020a170903024f00b0015ce3b8a640mr3656771plh.5.1651325596803; 
 Sat, 30 Apr 2022 06:33:16 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 c136-20020a63358e000000b003c14af5063bsm8517840pga.83.2022.04.30.06.33.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Apr 2022 06:33:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 43/43] target/nios2: Do semihosting call as a normal helper
Date: Sat, 30 Apr 2022 06:29:32 -0700
Message-Id: <20220430132932.324018-44-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220430132932.324018-1-richard.henderson@linaro.org>
References: <20220430132932.324018-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: crwulff@gmail.com, alex.bennee@linaro.org, f4bug@amsat.org,
 laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There's no need to raise an exception; just call
the helper function directly.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/cpu.h        | 3 ---
 target/nios2/helper.h     | 1 +
 target/nios2/helper.c     | 7 -------
 target/nios2/nios2-semi.c | 3 ++-
 target/nios2/translate.c  | 2 +-
 5 files changed, 4 insertions(+), 12 deletions(-)

diff --git a/target/nios2/cpu.h b/target/nios2/cpu.h
index f85581ee56..75a111a25e 100644
--- a/target/nios2/cpu.h
+++ b/target/nios2/cpu.h
@@ -164,7 +164,6 @@ FIELD(CR_TLBMISC, EE, 24, 1)
 
 /* Exceptions */
 #define EXCP_BREAK    0x1000
-#define EXCP_SEMIHOST 0x1001
 #define EXCP_RESET    0
 #define EXCP_PRESET   1
 #define EXCP_IRQ      2
@@ -269,8 +268,6 @@ G_NORETURN void nios2_cpu_do_unaligned_access(CPUState *cpu, vaddr addr,
 G_NORETURN void nios2_cpu_loop_exit_advance(CPUNios2State *env,
                                             uintptr_t retaddr);
 
-void do_nios2_semihosting(CPUNios2State *env);
-
 #define CPU_RESOLVING_TYPE TYPE_NIOS2_CPU
 
 #define cpu_gen_code cpu_nios2_gen_code
diff --git a/target/nios2/helper.h b/target/nios2/helper.h
index 1648d76ade..51ec2b35a0 100644
--- a/target/nios2/helper.h
+++ b/target/nios2/helper.h
@@ -29,4 +29,5 @@ DEF_HELPER_3(wrprs, void, env, i32, i32)
 DEF_HELPER_2(mmu_write_tlbacc, void, env, i32)
 DEF_HELPER_2(mmu_write_tlbmisc, void, env, i32)
 DEF_HELPER_2(mmu_write_pteaddr, void, env, i32)
+DEF_HELPER_1(semihosting, void, env)
 #endif
diff --git a/target/nios2/helper.c b/target/nios2/helper.c
index bb3b09e5a7..491cbd486f 100644
--- a/target/nios2/helper.c
+++ b/target/nios2/helper.c
@@ -173,9 +173,6 @@ void nios2_cpu_do_interrupt(CPUState *cs)
         case EXCP_BREAK:
             name = "BREAK insn";
             break;
-        case EXCP_SEMIHOST:
-            name = "SEMIHOST insn";
-            break;
         }
         if (name) {
             qemu_log("%s at pc=0x%08x\n", name, env->pc);
@@ -250,10 +247,6 @@ void nios2_cpu_do_interrupt(CPUState *cs)
         do_exception(cpu, cpu->exception_addr, 0, true);
         break;
 
-    case EXCP_SEMIHOST:
-        do_nios2_semihosting(env);
-        break;
-
     default:
         cpu_abort(cs, "unhandled exception type=%d\n", cs->exception_index);
     }
diff --git a/target/nios2/nios2-semi.c b/target/nios2/nios2-semi.c
index 3dad72d1f6..9648030d37 100644
--- a/target/nios2/nios2-semi.c
+++ b/target/nios2/nios2-semi.c
@@ -32,6 +32,7 @@
 #include "semihosting/softmmu-uaccess.h"
 #endif
 #include "qemu/log.h"
+#include "exec/helper-proto.h"
 
 #define HOSTED_EXIT  0
 #define HOSTED_INIT_SIM 1
@@ -91,7 +92,7 @@ static void nios2_semi_u64_cb(CPUState *cs, uint64_t ret, int err)
     }                                                   \
 } while (0)
 
-void do_nios2_semihosting(CPUNios2State *env)
+void HELPER(semihosting)(CPUNios2State *env)
 {
     CPUState *cs = env_cpu(env);
     int nr;
diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index 3a037a68cc..f245fd7d0a 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -819,7 +819,7 @@ static void gen_break(DisasContext *dc, uint32_t code, uint32_t flags)
     /* The semihosting instruction is "break 1".  */
     R_TYPE(instr, code);
     if (semihosting_enabled() && instr.imm5 == 1) {
-        t_gen_helper_raise_exception(dc, EXCP_SEMIHOST);
+        gen_helper_semihosting(cpu_env);
         return;
     }
 #endif
-- 
2.34.1


