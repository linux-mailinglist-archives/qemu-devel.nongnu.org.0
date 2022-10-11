Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 817C15FB0DB
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 13:00:00 +0200 (CEST)
Received: from localhost ([::1]:42644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiCzP-0004s4-Ha
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 06:59:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oiCU0-0001px-Ch
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 06:27:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30009)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oiCTy-0004QJ-Qz
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 06:27:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665484050;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version: content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cY1YtgpZbWRPCspprxt46+AxuqK8Gnzm3W5hRXACGYE=;
 b=ON+9uZUG8PyIPsawST+6iHkX5NVBGW0YuEsgj1GgAeeB6SI+sJ+INrV9mwF8xUQ3jz/2ry
 eBLBVluSlVvv7bLAtor54/7h96HqHxFQj5aKdmkCRhZ4rd4lsxzo5cJHsEz9ttSk5KbB7F
 bUVmrjAVGhmVQDUkzSMQ7imwLQGtoGs=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-29-IWMJGjiLP0qQVrAeQQGVGw-1; Tue, 11 Oct 2022 06:27:29 -0400
X-MC-Unique: IWMJGjiLP0qQVrAeQQGVGw-1
Received: by mail-ed1-f71.google.com with SMTP id
 m10-20020a056402430a00b0045968bb0874so10819218edc.10
 for <qemu-devel@nongnu.org>; Tue, 11 Oct 2022 03:27:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cY1YtgpZbWRPCspprxt46+AxuqK8Gnzm3W5hRXACGYE=;
 b=II08n1CK601JRTps2OMfvNHuRSYoCnMoVIxO1ERfADh4wnEiQNpwQp6/0D7hmFIaUq
 nvGBdkxA0bkQATg48k/8qMsOIgitbQG79jRiwO9wCQqtUFQcwTrIT5t7AuVIZjmgVS2d
 2NUajoueM7OEDoALQ8RtoDcAPnoQEa9QUvmf1BBSO0nhIroUCMZRmGlhXXmBggeCYE3y
 h64ZeElmRqJJRr5Y0Jw40JHZyYrKATiyGAK5fFpfQQX2/C3vz2697bL1MBe12yIDM8lh
 YjIDbJVkq7oQzW8OktA3d7E5JqaPjd6iRto/noKduMoJF72ElPXV6CsPVGqOS0xhEaEc
 ujuw==
X-Gm-Message-State: ACrzQf3H78oH+vNTX/ykR2UavbjFpM34jN2h1t0DCBxXwdW7vVipd9It
 aZQQqAdJyy7MuVb4Y0NLhDQiBwkQl5X/hJ06jLA7+fyPbMTz5b4wa5wF5AbtbutsIRGmcQSNDyt
 3MIlMCKiDHnUo7vMAZ7xEgE9E9VF0JUhUu8OUPTFfL6KxNm+hPNbmDV8W540+AV7mkrs=
X-Received: by 2002:a17:906:974f:b0:780:4a3c:d179 with SMTP id
 o15-20020a170906974f00b007804a3cd179mr18956094ejy.289.1665484047405; 
 Tue, 11 Oct 2022 03:27:27 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM40VBVLzMiApU7CgoBskD2Hu0J1PdNCVqT7vXZTk4eNGlA4pT55q9cI5dNA4hir/+qjnhI3YQ==
X-Received: by 2002:a17:906:974f:b0:780:4a3c:d179 with SMTP id
 o15-20020a170906974f00b007804a3cd179mr18956073ejy.289.1665484047079; 
 Tue, 11 Oct 2022 03:27:27 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:aad8:f393:e009:e014])
 by smtp.gmail.com with ESMTPSA id
 d1-20020a170906304100b00788c622fa2csm6769589ejd.135.2022.10.11.03.27.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Oct 2022 03:27:26 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 08/37] target/i386: Remove cur_eip argument to gen_exception
Date: Tue, 11 Oct 2022 12:26:31 +0200
Message-Id: <20221011102700.319178-9-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221011102700.319178-1-pbonzini@redhat.com>
References: <20221011102700.319178-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PP_MIME_FAKE_ASCII_TEXT=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

All callers pass s->base.pc_next - s->cs_base, which we can just
as well compute within the function.  Note the special case of
EXCP_VSYSCALL in which s->cs_base wasn't subtracted, but cs_base
is always zero in 64-bit mode, when vsyscall is used.

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20221001140935.465607-4-richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/tcg/translate.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 3f3e79c096..617832fcb0 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -1332,10 +1332,10 @@ static void gen_helper_fp_arith_STN_ST0(int op, int opreg)
     }
 }
 
-static void gen_exception(DisasContext *s, int trapno, target_ulong cur_eip)
+static void gen_exception(DisasContext *s, int trapno)
 {
     gen_update_cc_op(s);
-    gen_jmp_im(s, cur_eip);
+    gen_jmp_im(s, s->base.pc_next - s->cs_base);
     gen_helper_raise_exception(cpu_env, tcg_const_i32(trapno));
     s->base.is_jmp = DISAS_NORETURN;
 }
@@ -1344,13 +1344,13 @@ static void gen_exception(DisasContext *s, int trapno, target_ulong cur_eip)
    the instruction is known, but it isn't allowed in the current cpu mode.  */
 static void gen_illegal_opcode(DisasContext *s)
 {
-    gen_exception(s, EXCP06_ILLOP, s->base.pc_next - s->cs_base);
+    gen_exception(s, EXCP06_ILLOP);
 }
 
 /* Generate #GP for the current instruction. */
 static void gen_exception_gpf(DisasContext *s)
 {
-    gen_exception(s, EXCP0D_GPF, s->base.pc_next - s->cs_base);
+    gen_exception(s, EXCP0D_GPF);
 }
 
 /* Check for cpl == 0; if not, raise #GP and return false. */
@@ -3267,7 +3267,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b)
     }
     /* simple MMX/SSE operation */
     if (s->flags & HF_TS_MASK) {
-        gen_exception(s, EXCP07_PREX, s->base.pc_next - s->cs_base);
+        gen_exception(s, EXCP07_PREX);
         return;
     }
     if (s->flags & HF_EM_MASK) {
@@ -6077,7 +6077,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             if (s->flags & (HF_EM_MASK | HF_TS_MASK)) {
                 /* if CR0.EM or CR0.TS are set, generate an FPU exception */
                 /* XXX: what to do if illegal op ? */
-                gen_exception(s, EXCP07_PREX, s->base.pc_next - s->cs_base);
+                gen_exception(s, EXCP07_PREX);
                 break;
             }
             modrm = x86_ldub_code(env, s);
@@ -7302,7 +7302,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             goto illegal_op;
         val = x86_ldub_code(env, s);
         if (val == 0) {
-            gen_exception(s, EXCP00_DIVZ, s->base.pc_next - s->cs_base);
+            gen_exception(s, EXCP00_DIVZ);
         } else {
             gen_helper_aam(cpu_env, tcg_const_i32(val));
             set_cc_op(s, CC_OP_LOGICB);
@@ -7336,7 +7336,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
     case 0x9b: /* fwait */
         if ((s->flags & (HF_MP_MASK | HF_TS_MASK)) ==
             (HF_MP_MASK | HF_TS_MASK)) {
-            gen_exception(s, EXCP07_PREX, s->base.pc_next - s->cs_base);
+            gen_exception(s, EXCP07_PREX);
         } else {
             gen_helper_fwait(cpu_env);
         }
@@ -8393,7 +8393,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
                 goto illegal_op;
             }
             if ((s->flags & HF_EM_MASK) || (s->flags & HF_TS_MASK)) {
-                gen_exception(s, EXCP07_PREX, s->base.pc_next - s->cs_base);
+                gen_exception(s, EXCP07_PREX);
                 break;
             }
             gen_lea_modrm(env, s, modrm);
@@ -8406,7 +8406,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
                 goto illegal_op;
             }
             if ((s->flags & HF_EM_MASK) || (s->flags & HF_TS_MASK)) {
-                gen_exception(s, EXCP07_PREX, s->base.pc_next - s->cs_base);
+                gen_exception(s, EXCP07_PREX);
                 break;
             }
             gen_lea_modrm(env, s, modrm);
@@ -8418,7 +8418,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
                 goto illegal_op;
             }
             if (s->flags & HF_TS_MASK) {
-                gen_exception(s, EXCP07_PREX, s->base.pc_next - s->cs_base);
+                gen_exception(s, EXCP07_PREX);
                 break;
             }
             gen_lea_modrm(env, s, modrm);
@@ -8431,7 +8431,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
                 goto illegal_op;
             }
             if (s->flags & HF_TS_MASK) {
-                gen_exception(s, EXCP07_PREX, s->base.pc_next - s->cs_base);
+                gen_exception(s, EXCP07_PREX);
                 break;
             }
             gen_helper_update_mxcsr(cpu_env);
@@ -8822,7 +8822,7 @@ static void i386_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
      * Detect entry into the vsyscall page and invoke the syscall.
      */
     if ((dc->base.pc_next & TARGET_PAGE_MASK) == TARGET_VSYSCALL_PAGE) {
-        gen_exception(dc, EXCP_VSYSCALL, dc->base.pc_next);
+        gen_exception(dc, EXCP_VSYSCALL);
         dc->base.pc_next = dc->pc + 1;
         return;
     }
-- 
2.37.3


