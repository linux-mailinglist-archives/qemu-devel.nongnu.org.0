Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D156C4D45AB
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 12:30:40 +0100 (CET)
Received: from localhost ([::1]:33472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSH0B-0007yT-UX
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 06:30:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nSGxE-0004zZ-Cr
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 06:27:36 -0500
Received: from [2607:f8b0:4864:20::433] (port=35329
 helo=mail-pf1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nSGxC-0007vK-AE
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 06:27:36 -0500
Received: by mail-pf1-x433.google.com with SMTP id a5so4867012pfv.2
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 03:27:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JwvNUZim2yApAOIks/gNVf1oLVx5CVGA+91qmxfeNYY=;
 b=Ny/2s4jhqYmWx7BbT/XrJ3Nk6R4IBdravzVIYmVegrzcB1U6Bc9KKid3D5RCidAput
 UQUnoAHW+RxUN5087+3trXlIqgFgRQunH/hkw/1bto58uwNdK7pr86Aj6QYj/+9RfJDf
 U5x+mXvoS9Ruppx9ehGjtYAMOaEcBy3y+w9vi/dBNUdmL8nGzBDzM623027YJ6BqI330
 omHcv35ay0fuXd9Cx5Rxo2TQd25oV1vE8q+DQjvzW9EGl4VGQsiQpyNaPUyDmlDehfk7
 tFl7KxsnfUQAPQRkSzLDRvkQ7PSS0Nv4LaYNglGppcaUk52NsYXA+dshhZJC0LtT/XhC
 mTQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JwvNUZim2yApAOIks/gNVf1oLVx5CVGA+91qmxfeNYY=;
 b=KXPg/YmMgQUvxhjRoSO7QSgKBjSaRB+ydb6Uuoa/0XSssZWtWkxnLEMxgcbKmospIR
 H3qz3ZTbDjlhER+LQWXdUckUO2yHEbAZi1UlmSypWFvf+1dArj50V3y/a2WCH3f/SshC
 a9xnbQ4noSvUiMJNvAtTb8kdmk7wBrRxE3KX4gtJ4jKuJOastBExjJSc/AEZSB8+8BuS
 zd2ezfBS6Xs0M3Qz0bcIau1NswkYqp7pKJOvnbKVEfEmWTWocW2gzD4EUsF0TKwvSmSV
 OEWVfwoHaEDl5h/k/v1Bz1jhwCK+pCqfyKGsxFYiumcuyRubaIrKESilfbPDLgIeovwq
 is1g==
X-Gm-Message-State: AOAM533M8j4Ma4tiYjpS45KNhJr+njFKDHdX40R2hHV3FlnJAp8nxGCB
 ZiICUr6vNrM3ZTSap8eWRiB1jqKELzzyKg==
X-Google-Smtp-Source: ABdhPJz0FJwKglVJ8eUw+l1fGg0+NFWUC6oMjdfjnwH+rwj8zwkO0nnf7Q/TjbWpWwKIU5rO7RoqCQ==
X-Received: by 2002:a62:7c58:0:b0:4f6:ebf1:e78d with SMTP id
 x85-20020a627c58000000b004f6ebf1e78dmr4625994pfc.18.1646911652862; 
 Thu, 10 Mar 2022 03:27:32 -0800 (PST)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 js15-20020a17090b148f00b001bfc8614b93sm3114977pjb.1.2022.03.10.03.27.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 03:27:32 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 05/48] target/nios2: Split out helper for eret instruction
Date: Thu, 10 Mar 2022 03:26:42 -0800
Message-Id: <20220310112725.570053-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220310112725.570053-1-richard.henderson@linaro.org>
References: <20220310112725.570053-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::433
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: marex@denx.de, peter.maydell@linaro.org, amir.gonnen@neuroblade.ai
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Amir Gonnen <amir.gonnen@neuroblade.ai>

The implementation of eret will become much more complex
with the introduction of shadow registers.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Amir Gonnen <amir.gonnen@neuroblade.ai>
Message-Id: <20220303153906.2024748-3-amir.gonnen@neuroblade.ai>
[rth: Split out of a larger patch for shadow register sets.
      Directly exit to the cpu loop from the helper.]
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/helper.h    |  1 +
 target/nios2/op_helper.c |  9 +++++++++
 target/nios2/translate.c | 10 ++++++----
 3 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/target/nios2/helper.h b/target/nios2/helper.h
index a44ecfdf7a..525b6b685b 100644
--- a/target/nios2/helper.h
+++ b/target/nios2/helper.h
@@ -21,6 +21,7 @@
 DEF_HELPER_FLAGS_2(raise_exception, TCG_CALL_NO_WG, noreturn, env, i32)
 
 #if !defined(CONFIG_USER_ONLY)
+DEF_HELPER_3(eret, noreturn, env, i32, i32)
 DEF_HELPER_2(mmu_write_tlbacc, void, env, i32)
 DEF_HELPER_2(mmu_write_tlbmisc, void, env, i32)
 DEF_HELPER_2(mmu_write_pteaddr, void, env, i32)
diff --git a/target/nios2/op_helper.c b/target/nios2/op_helper.c
index caa885f7b4..ee5ad8b23f 100644
--- a/target/nios2/op_helper.c
+++ b/target/nios2/op_helper.c
@@ -30,3 +30,12 @@ void helper_raise_exception(CPUNios2State *env, uint32_t index)
     cs->exception_index = index;
     cpu_loop_exit(cs);
 }
+
+#ifndef CONFIG_USER_ONLY
+void helper_eret(CPUNios2State *env, uint32_t new_status, uint32_t new_pc)
+{
+    env->regs[CR_STATUS] = new_status;
+    env->pc = new_pc;
+    cpu_loop_exit(env_cpu(env));
+}
+#endif /* !CONFIG_USER_ONLY */
diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index 154ffacbea..7c2c430e99 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -391,10 +391,12 @@ static void eret(DisasContext *dc, uint32_t code, uint32_t flags)
         return;
     }
 
-    tcg_gen_mov_tl(cpu_R[CR_STATUS], cpu_R[CR_ESTATUS]);
-    tcg_gen_mov_tl(cpu_pc, cpu_R[R_EA]);
-
-    dc->base.is_jmp = DISAS_JUMP;
+#ifdef CONFIG_USER_ONLY
+    g_assert_not_reached();
+#else
+    gen_helper_eret(cpu_env, cpu_R[CR_ESTATUS], cpu_R[R_EA]);
+    dc->base.is_jmp = DISAS_NORETURN;
+#endif
 }
 
 /* PC <- ra */
-- 
2.25.1


