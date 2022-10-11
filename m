Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 562E85FB13F
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 13:12:49 +0200 (CEST)
Received: from localhost ([::1]:42258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiDBo-0003zw-Bv
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 07:12:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oiCU9-0001wX-PT
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 06:27:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57414)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oiCU7-0004TI-CK
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 06:27:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665484058;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DCoSJb8oPvBjKKVe1L+9Wvu1MPX3YmO7JejJi5VhZpI=;
 b=YxFlOvV0PMylXgzai+GrjQOpZ7Nn2d+awsvuu7r3sOeIdTNxj3AFvSmNqe9t1qUDDoseFq
 Dvs5c3KrlGuZMUjc8Ya5Sog87EbppouS7pOOfwqI7nHAkYcW2xj/To+qI/o4lSdm7i2JmE
 JlDT7o0fHK3VReAZfgybk/06DNHVs/s=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-100-P1eY3olTOiuFPkyxA0ZdKA-1; Tue, 11 Oct 2022 06:27:37 -0400
X-MC-Unique: P1eY3olTOiuFPkyxA0ZdKA-1
Received: by mail-ed1-f70.google.com with SMTP id
 y14-20020a056402440e00b0044301c7ccd9so10811417eda.19
 for <qemu-devel@nongnu.org>; Tue, 11 Oct 2022 03:27:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DCoSJb8oPvBjKKVe1L+9Wvu1MPX3YmO7JejJi5VhZpI=;
 b=gSQI56IWiEPQvV5CY+FhJKQEazEZrAyKhRbbf8fCy71hORFype05Nf32CsYXAbxjRd
 g1UV1YVlK7MzOFDI5gpu6OJzBHRmoqs5vSd33m2bOc9upgmn95jdschFWWKfIMtORYp8
 ByuhWN7ia3R62YJhJFq6QMPdwCXwYJq8OiqpcOI+acX9pif3UMaS2/tY51mM+c5CXBBh
 IhDTNDRYPdk/uMvsG12PcYb8h88pJgKl8qwgPtcFF/GsbEeWMicKgcY62Bl+gQ8wW3d7
 2tMpM4vKjHreScTkK/pdw1nRTOmiXnVOy7TTSv43EcUpqAxkhuT98LMGt48a304wl/Wo
 CgvQ==
X-Gm-Message-State: ACrzQf3QnYbiCGV5tYBNSqo4PJ2m92IGgwnQzGjFc+k66e/kwX0W+54Y
 MTUepyiMLqbKtpguOQdA7TzXgDeFwBulue+O24VX331pM3478NxFWN2oh6Lr2Zqi3jRTmi3ae6D
 zGo9QaP7yeMuYXsynxqOyXNSQoj8MdIHUd5l3dR8u1Xwq4LkZjnbhTzYly3qz8+xIeas=
X-Received: by 2002:a17:907:7b94:b0:731:1b11:c241 with SMTP id
 ne20-20020a1709077b9400b007311b11c241mr18980876ejc.676.1665484055918; 
 Tue, 11 Oct 2022 03:27:35 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4Cwn5JguBkq9B0iuvK6vberor2ZiZdVRFBVNBeIFVdQpPvDDGl5mqg6hDx7R38ceuSUv9JQQ==
X-Received: by 2002:a17:907:7b94:b0:731:1b11:c241 with SMTP id
 ne20-20020a1709077b9400b007311b11c241mr18980855ejc.676.1665484055585; 
 Tue, 11 Oct 2022 03:27:35 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:aad8:f393:e009:e014])
 by smtp.gmail.com with ESMTPSA id
 sb25-20020a1709076d9900b0077077b59085sm6743571ejc.184.2022.10.11.03.27.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Oct 2022 03:27:35 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 11/37] target/i386: Create gen_update_eip_next
Date: Tue, 11 Oct 2022 12:26:34 +0200
Message-Id: <20221011102700.319178-12-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221011102700.319178-1-pbonzini@redhat.com>
References: <20221011102700.319178-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Sync EIP before exiting a translation block.
Replace all gen_jmp_im that use s->pc.

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20221001140935.465607-7-richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/tcg/translate.c | 45 ++++++++++++++++++++-----------------
 1 file changed, 25 insertions(+), 20 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 85253e1e17..4c1548da8e 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -521,6 +521,11 @@ static void gen_update_eip_cur(DisasContext *s)
     gen_jmp_im(s, s->base.pc_next - s->cs_base);
 }
 
+static void gen_update_eip_next(DisasContext *s)
+{
+    gen_jmp_im(s, s->pc - s->cs_base);
+}
+
 /* Compute SEG:REG into A0.  SEG is selected from the override segment
    (OVR_SEG) and the default segment (DEF_SEG).  OVR_SEG may be -1 to
    indicate no override.  */
@@ -5719,7 +5724,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
         gen_pop_update(s, ot);
         /* Note that reg == R_SS in gen_movl_seg_T0 always sets is_jmp.  */
         if (s->base.is_jmp) {
-            gen_jmp_im(s, s->pc - s->cs_base);
+            gen_update_eip_next(s);
             if (reg == R_SS) {
                 s->flags &= ~HF_TF_MASK;
                 gen_eob_inhibit_irq(s, true);
@@ -5734,7 +5739,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
         gen_movl_seg_T0(s, (b >> 3) & 7);
         gen_pop_update(s, ot);
         if (s->base.is_jmp) {
-            gen_jmp_im(s, s->pc - s->cs_base);
+            gen_update_eip_next(s);
             gen_eob(s);
         }
         break;
@@ -5785,7 +5790,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
         gen_movl_seg_T0(s, reg);
         /* Note that reg == R_SS in gen_movl_seg_T0 always sets is_jmp.  */
         if (s->base.is_jmp) {
-            gen_jmp_im(s, s->pc - s->cs_base);
+            gen_update_eip_next(s);
             if (reg == R_SS) {
                 s->flags &= ~HF_TF_MASK;
                 gen_eob_inhibit_irq(s, true);
@@ -5983,7 +5988,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
         /* then put the data */
         gen_op_mov_reg_v(s, ot, reg, s->T1);
         if (s->base.is_jmp) {
-            gen_jmp_im(s, s->pc - s->cs_base);
+            gen_update_eip_next(s);
             gen_eob(s);
         }
         break;
@@ -7039,7 +7044,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             gen_pop_update(s, ot);
             set_cc_op(s, CC_OP_EFLAGS);
             /* abort translation because TF/AC flag may change */
-            gen_jmp_im(s, s->pc - s->cs_base);
+            gen_update_eip_next(s);
             gen_eob(s);
         }
         break;
@@ -7375,7 +7380,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
         if (check_iopl(s)) {
             gen_helper_sti(cpu_env);
             /* interruptions are enabled only the first insn after sti */
-            gen_jmp_im(s, s->pc - s->cs_base);
+            gen_update_eip_next(s);
             gen_eob_inhibit_irq(s, true);
         }
         break;
@@ -7451,7 +7456,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             }
 
             gen_set_label(l3);
-            gen_jmp_im(s, next_eip);
+            gen_update_eip_next(s);
             tcg_gen_br(l2);
 
             gen_set_label(l1);
@@ -7469,7 +7474,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
                 gen_helper_rdmsr(cpu_env);
             } else {
                 gen_helper_wrmsr(cpu_env);
-                gen_jmp_im(s, s->pc - s->cs_base);
+                gen_update_eip_next(s);
                 gen_eob(s);
             }
         }
@@ -7669,7 +7674,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
                 goto illegal_op;
             }
             gen_helper_clac(cpu_env);
-            gen_jmp_im(s, s->pc - s->cs_base);
+            gen_update_eip_next(s);
             gen_eob(s);
             break;
 
@@ -7679,7 +7684,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
                 goto illegal_op;
             }
             gen_helper_stac(cpu_env);
-            gen_jmp_im(s, s->pc - s->cs_base);
+            gen_update_eip_next(s);
             gen_eob(s);
             break;
 
@@ -7724,7 +7729,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             tcg_gen_trunc_tl_i32(s->tmp2_i32, cpu_regs[R_ECX]);
             gen_helper_xsetbv(cpu_env, s->tmp2_i32, s->tmp1_i64);
             /* End TB because translation flags may change.  */
-            gen_jmp_im(s, s->pc - s->cs_base);
+            gen_update_eip_next(s);
             gen_eob(s);
             break;
 
@@ -7786,7 +7791,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             }
             gen_update_cc_op(s);
             gen_helper_stgi(cpu_env);
-            gen_jmp_im(s, s->pc - s->cs_base);
+            gen_update_eip_next(s);
             gen_eob(s);
             break;
 
@@ -7825,7 +7830,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
                 tcg_gen_ext32u_tl(s->A0, cpu_regs[R_EAX]);
             }
             gen_helper_flush_page(cpu_env, s->A0);
-            gen_jmp_im(s, s->pc - s->cs_base);
+            gen_update_eip_next(s);
             gen_eob(s);
             break;
 
@@ -7909,7 +7914,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             tcg_gen_andi_tl(s->T1, s->T1, ~0xe);
             tcg_gen_or_tl(s->T0, s->T0, s->T1);
             gen_helper_write_crN(cpu_env, tcg_constant_i32(0), s->T0);
-            gen_jmp_im(s, s->pc - s->cs_base);
+            gen_update_eip_next(s);
             gen_eob(s);
             break;
 
@@ -7920,7 +7925,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             gen_svm_check_intercept(s, SVM_EXIT_INVLPG);
             gen_lea_modrm(env, s, modrm);
             gen_helper_flush_page(cpu_env, s->A0);
-            gen_jmp_im(s, s->pc - s->cs_base);
+            gen_update_eip_next(s);
             gen_eob(s);
             break;
 
@@ -8320,7 +8325,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             gen_svm_check_intercept(s, SVM_EXIT_WRITE_CR0 + reg);
             gen_op_mov_v_reg(s, ot, s->T0, rm);
             gen_helper_write_crN(cpu_env, tcg_constant_i32(reg), s->T0);
-            gen_jmp_im(s, s->pc - s->cs_base);
+            gen_update_eip_next(s);
             gen_eob(s);
         } else {
             gen_svm_check_intercept(s, SVM_EXIT_READ_CR0 + reg);
@@ -8355,7 +8360,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
                 gen_op_mov_v_reg(s, ot, s->T0, rm);
                 tcg_gen_movi_i32(s->tmp2_i32, reg);
                 gen_helper_set_dr(cpu_env, s->tmp2_i32, s->T0);
-                gen_jmp_im(s, s->pc - s->cs_base);
+                gen_update_eip_next(s);
                 gen_eob(s);
             } else {
                 gen_svm_check_intercept(s, SVM_EXIT_READ_DR0 + reg);
@@ -8370,7 +8375,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             gen_svm_check_intercept(s, SVM_EXIT_WRITE_CR0);
             gen_helper_clts(cpu_env);
             /* abort block because static cpu state changed */
-            gen_jmp_im(s, s->pc - s->cs_base);
+            gen_update_eip_next(s);
             gen_eob(s);
         }
         break;
@@ -8468,7 +8473,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             /* XRSTOR is how MPX is enabled, which changes how
                we translate.  Thus we need to end the TB.  */
             gen_update_cc_op(s);
-            gen_jmp_im(s, s->pc - s->cs_base);
+            gen_update_eip_next(s);
             gen_eob(s);
             break;
 
@@ -8602,7 +8607,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
         g_assert_not_reached();
 #else
         gen_update_cc_op(s);
-        gen_jmp_im(s, s->pc - s->cs_base);
+        gen_update_eip_next(s);
         gen_helper_rsm(cpu_env);
 #endif /* CONFIG_USER_ONLY */
         gen_eob(s);
-- 
2.37.3


