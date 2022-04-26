Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC9CB5107B1
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 20:53:55 +0200 (CEST)
Received: from localhost ([::1]:37742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njQJu-0007RZ-Sl
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 14:53:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njPpt-0001ny-46
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 14:22:54 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:41745)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njPpr-0005NU-Gi
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 14:22:52 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 z5-20020a17090a468500b001d2bc2743c4so3318731pjf.0
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 11:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FlFue1M2dS8hFiD6a8SYA5F/GKJcQIyumbShiHs2wTE=;
 b=Uomhn9aj6pFMmbiHGAsTQ2srtXyNYpdtoxmJy7ZIRnnJhNfFMAg4FeJoLipMr4gfhL
 zfTbuA7EXQsZeSi1Dqny6ztQivavLOzPIv7Pd/HUXURRNdNxBYAkefBCgLzN4hph7XEG
 BPn/ZjbFgA+v+9xVDlwODtcjlBclPJUp6NWbjSBok0CN1ggieflkLJYFekFhB8ghWJDo
 H75vBzGl1/e+02og8B3BebI/5ZoVG4ekYNjjQBIizgHnTyHWqSZb0lFCJoI9QExoanX0
 qKI3YgUCKtWU6jMkPjeraEyZSk3FazmI8gf45wqmpqy82NfGM1hPna1KooQ4cZCswJWZ
 wtzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FlFue1M2dS8hFiD6a8SYA5F/GKJcQIyumbShiHs2wTE=;
 b=xz0LWmODGz7qsMB8B916dbZ7CgvzFIm2ImazZ8MAngpDAYqIcugDFBGuaj5ocvliGW
 a+plyPgd8VSb0gOLlExgkuobM7QWmbYu7LeXoOlUgOHPgAeHYmFIIDe5K8pV0+tUhaw8
 FnO6fzCzxZ4Uh6SI4y4x0W+gGMru1JjujxbT7cxQ03rIS8HKXlZgomE+p/2yqd1PwWai
 MAkvinTETsCIu7DHyomptdC4lLri9jEqTzQ7e2dIxeF2wurzm7pt7KauDGL+wQJbJQyO
 x1VyX4WpvUQmP2vTjr9jVJqSdQyozPojceTsWHDKtU+9yk0i1jEch2T3voKtBIh1BiK7
 SnCg==
X-Gm-Message-State: AOAM530mbHkDqJnolxqcZbloHzqHRxEehWbxVrdkNNt7YoQHcqNU5JPk
 NUYmZA6ACXl3brgwVsyG4a1idH4mPZG7oA==
X-Google-Smtp-Source: ABdhPJxkmma4NG2px0odKH5TSTyf2uf/GUMtvRSwxPYu+YUO24UnzLfrMiUfnD6nn9zJgTnHipvdLQ==
X-Received: by 2002:a17:90b:350d:b0:1d9:eca0:5be with SMTP id
 ls13-20020a17090b350d00b001d9eca005bemr2337722pjb.175.1650997370294; 
 Tue, 26 Apr 2022 11:22:50 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 k187-20020a636fc4000000b003983a01b896sm13585053pgc.90.2022.04.26.11.22.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 11:22:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 45/68] target/nios2: Split out helpers for gen_i_math_logic
Date: Tue, 26 Apr 2022 11:18:44 -0700
Message-Id: <20220426181907.103691-46-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220426181907.103691-1-richard.henderson@linaro.org>
References: <20220426181907.103691-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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

Do as little work as possible within the macro.
Split out helper functions and pass in arguments instead.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/translate.c | 58 +++++++++++++++++++++++++++-------------
 1 file changed, 39 insertions(+), 19 deletions(-)

diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index 86978ba47a..aa570b6d79 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -83,6 +83,11 @@ static target_ulong imm_signed(const InstrIType *i)
     return i->imm16.s;
 }
 
+static target_ulong imm_shifted(const InstrIType *i)
+{
+    return i->imm16.u << 16;
+}
+
 /* R-Type instruction parsing */
 typedef struct {
     uint8_t op;
@@ -115,6 +120,8 @@ typedef struct {
         .imm26 = extract32((code), 6, 26), \
     }
 
+typedef void GenFn2i(TCGv, TCGv, target_long);
+
 typedef struct DisasContext {
     DisasContextBase  base;
     target_ulong      pc;
@@ -299,29 +306,42 @@ gen_i_cmpxx(gen_cmpxxsi, imm_signed)
 gen_i_cmpxx(gen_cmpxxui, imm_unsigned)
 
 /* Math/logic instructions */
-#define gen_i_math_logic(fname, insn, resimm, op3)                          \
-static void (fname)(DisasContext *dc, uint32_t code, uint32_t flags)        \
-{                                                                           \
-    I_TYPE(instr, (code));                                                  \
-    if (unlikely(instr.b == R_ZERO)) { /* Store to R_ZERO is ignored */     \
-        return;                                                             \
-    } else if (instr.a == R_ZERO) { /* MOVxI optimizations */               \
-        tcg_gen_movi_tl(cpu_R[instr.b], (resimm) ? (op3) : 0);              \
-    } else {                                                                \
-        tcg_gen_##insn##_tl(cpu_R[instr.b], cpu_R[instr.a], (op3));         \
-    }                                                                       \
+static void do_i_math_logic(DisasContext *dc, uint32_t insn,
+                            GenFn2i *fn, ImmFromIType *imm,
+                            bool x_op_0_eq_x)
+{
+    I_TYPE(instr, insn);
+    target_ulong val;
+
+    if (unlikely(instr.b == R_ZERO)) {
+        /* Store to R_ZERO is ignored -- this catches the canonical NOP. */
+        return;
+    }
+
+    val = imm(&instr);
+
+    if (instr.a == R_ZERO) {
+        /* This catches the canonical expansions of movi and movhi. */
+        tcg_gen_movi_tl(cpu_R[instr.b], x_op_0_eq_x ? val : 0);
+    } else {
+        fn(cpu_R[instr.b], cpu_R[instr.a], val);
+    }
 }
 
-gen_i_math_logic(addi,  addi, 1, instr.imm16.s)
-gen_i_math_logic(muli,  muli, 0, instr.imm16.s)
+#define gen_i_math_logic(fname, insn, x_op_0, imm)                          \
+    static void (fname)(DisasContext *dc, uint32_t code, uint32_t flags)    \
+    { do_i_math_logic(dc, code, tcg_gen_##insn##_tl, imm, x_op_0); }
 
-gen_i_math_logic(andi,  andi, 0, instr.imm16.u)
-gen_i_math_logic(ori,   ori,  1, instr.imm16.u)
-gen_i_math_logic(xori,  xori, 1, instr.imm16.u)
+gen_i_math_logic(addi,  addi, 1, imm_signed)
+gen_i_math_logic(muli,  muli, 0, imm_signed)
 
-gen_i_math_logic(andhi, andi, 0, instr.imm16.u << 16)
-gen_i_math_logic(orhi , ori,  1, instr.imm16.u << 16)
-gen_i_math_logic(xorhi, xori, 1, instr.imm16.u << 16)
+gen_i_math_logic(andi,  andi, 0, imm_unsigned)
+gen_i_math_logic(ori,   ori,  1, imm_unsigned)
+gen_i_math_logic(xori,  xori, 1, imm_unsigned)
+
+gen_i_math_logic(andhi, andi, 0, imm_shifted)
+gen_i_math_logic(orhi , ori,  1, imm_shifted)
+gen_i_math_logic(xorhi, xori, 1, imm_shifted)
 
 /* Prototype only, defined below */
 static void handle_r_type_instr(DisasContext *dc, uint32_t code,
-- 
2.34.1


