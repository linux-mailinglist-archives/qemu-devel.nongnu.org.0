Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C61C8510855
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 21:05:49 +0200 (CEST)
Received: from localhost ([::1]:37214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njQVQ-00017F-IK
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 15:05:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njPpu-0001o0-NV
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 14:22:54 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:46052)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njPps-0005O8-SU
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 14:22:54 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 n33-20020a17090a5aa400b001d28f5ee3f9so3274867pji.4
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 11:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yxKaaQdEBaOQz5dOpNmfl+nzRcffEVAUl93wsbbxQeM=;
 b=w+GgHKi9a/LBRlAxB3zJsXrL8wsoq5yuTEBXzrxauKrU9Dbzw5+bkN7mf55Q63jCiy
 N4vs6HsAd5f9obYGBebr+H5zWlgyGEIobq9CUhv83OUO2Di1Ad5DwOwosJxpzt9nKFnB
 y1jfJ917l4yOUfrbq3hDQX+GkdhfwPnmUGGWXzo+TJfGDvzWR1lE+1Razpw2RCTdDsLG
 gZf096ylxkD/Ck9a1sLI/EBOeWLcDkrdHOmx5K72dItgBe2rvDX94Z2pitdRMAiYdT5s
 +cUhFuopP/k4Q4YXJ2zWAhzSG3qXDZ7baE/jDPh9X231fgnI6TlTea3JizQGgp4tU5iV
 zukg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yxKaaQdEBaOQz5dOpNmfl+nzRcffEVAUl93wsbbxQeM=;
 b=5pErSELDqzhw3RiQcdDhNaVjmal1Xln/R3fQ4BKb8PFfPg1RsUr5y3z18RQjYACgWw
 hCUepiLkAOWbHK6ADyjxhmfrS8oHlZzNiRwLvdUQYYxNUZppUFvPCxyA8z/kbtnP2De4
 NJ8PrFXFYf+whyq8EC9J6gEd2qEnmzmcoQv4BZnu9ltDCn0eOt+54aaGBWrJDIHnMrpJ
 KbvAkCZo0RXWS0J9We7aZ7RkJa8UIbl+5pCv++cT2HSGW/FiE9Y99OOgA2BGxyZZ1p0f
 71At8KsNiACcwoSlBniLd86tgrkoNM0FL5ZKI7QPViUClWCtB+yzmMCu1PjJv2QuKUpP
 ltkw==
X-Gm-Message-State: AOAM5315msL889aergLy0u7O1XZjuaGZNSl0gL67nh6QYdQhNWxvH3Kt
 M1CNqOvvJHT1SB/4yUfNGoZzYhBUewd8kQ==
X-Google-Smtp-Source: ABdhPJwndwtZv+OiBiaGyWdo7vNWhG1EwMqTx/x1YlnqUc/MXIcmHNPqzpu4xIQdc/3vLh4tqqoL8w==
X-Received: by 2002:a17:903:241:b0:15c:ee52:cbf2 with SMTP id
 j1-20020a170903024100b0015cee52cbf2mr16817256plh.10.1650997371201; 
 Tue, 26 Apr 2022 11:22:51 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 k187-20020a636fc4000000b003983a01b896sm13585053pgc.90.2022.04.26.11.22.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 11:22:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 46/68] target/nios2: Split out helpers for gen_r_math_logic
Date: Tue, 26 Apr 2022 11:18:45 -0700
Message-Id: <20220426181907.103691-47-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220426181907.103691-1-richard.henderson@linaro.org>
References: <20220426181907.103691-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Split the macro in two, one for reg/imm and one for reg/reg.
Do as little work as possible within the macros; split out
helper functions and pass in arguments instead.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/translate.c | 54 ++++++++++++++++++++++++++--------------
 1 file changed, 36 insertions(+), 18 deletions(-)

diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index aa570b6d79..4f52606516 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -121,6 +121,7 @@ typedef struct {
     }
 
 typedef void GenFn2i(TCGv, TCGv, target_long);
+typedef void GenFn3(TCGv, TCGv, TCGv);
 
 typedef struct DisasContext {
     DisasContextBase  base;
@@ -628,28 +629,45 @@ static void gen_cmpxx(DisasContext *dc, uint32_t code, uint32_t flags)
 }
 
 /* Math/logic instructions */
-#define gen_r_math_logic(fname, insn, op3)                                 \
-static void (fname)(DisasContext *dc, uint32_t code, uint32_t flags)       \
-{                                                                          \
-    R_TYPE(instr, (code));                                                 \
-    if (likely(instr.c != R_ZERO)) {                                       \
-        tcg_gen_##insn(cpu_R[instr.c], load_gpr((dc), instr.a), (op3));    \
-    }                                                                      \
+static void do_ri_math_logic(DisasContext *dc, uint32_t insn, GenFn2i *fn)
+{
+    R_TYPE(instr, insn);
+
+    if (likely(instr.c != R_ZERO)) {
+        fn(cpu_R[instr.c], load_gpr(dc, instr.a), instr.imm5);
+    }
 }
 
-gen_r_math_logic(add,  add_tl,   load_gpr(dc, instr.b))
-gen_r_math_logic(sub,  sub_tl,   load_gpr(dc, instr.b))
-gen_r_math_logic(mul,  mul_tl,   load_gpr(dc, instr.b))
+static void do_rr_math_logic(DisasContext *dc, uint32_t insn, GenFn3 *fn)
+{
+    R_TYPE(instr, insn);
 
-gen_r_math_logic(and,  and_tl,   load_gpr(dc, instr.b))
-gen_r_math_logic(or,   or_tl,    load_gpr(dc, instr.b))
-gen_r_math_logic(xor,  xor_tl,   load_gpr(dc, instr.b))
-gen_r_math_logic(nor,  nor_tl,   load_gpr(dc, instr.b))
+    if (likely(instr.c != R_ZERO)) {
+        fn(cpu_R[instr.c], load_gpr(dc, instr.a), load_gpr(dc, instr.b));
+    }
+}
 
-gen_r_math_logic(srai, sari_tl,  instr.imm5)
-gen_r_math_logic(srli, shri_tl,  instr.imm5)
-gen_r_math_logic(slli, shli_tl,  instr.imm5)
-gen_r_math_logic(roli, rotli_tl, instr.imm5)
+#define gen_ri_math_logic(fname, insn)                                      \
+    static void (fname)(DisasContext *dc, uint32_t code, uint32_t flags)    \
+    { do_ri_math_logic(dc, code, tcg_gen_##insn##_tl); }
+
+#define gen_rr_math_logic(fname, insn)                                      \
+    static void (fname)(DisasContext *dc, uint32_t code, uint32_t flags)    \
+    { do_rr_math_logic(dc, code, tcg_gen_##insn##_tl); }
+
+gen_rr_math_logic(add,  add)
+gen_rr_math_logic(sub,  sub)
+gen_rr_math_logic(mul,  mul)
+
+gen_rr_math_logic(and,  and)
+gen_rr_math_logic(or,   or)
+gen_rr_math_logic(xor,  xor)
+gen_rr_math_logic(nor,  nor)
+
+gen_ri_math_logic(srai, sari)
+gen_ri_math_logic(srli, shri)
+gen_ri_math_logic(slli, shli)
+gen_ri_math_logic(roli, rotli)
 
 #define gen_r_mul(fname, insn)                                         \
 static void (fname)(DisasContext *dc, uint32_t code, uint32_t flags)   \
-- 
2.34.1


