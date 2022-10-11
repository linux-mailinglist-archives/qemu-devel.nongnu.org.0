Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 688145FB0D1
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 12:54:06 +0200 (CEST)
Received: from localhost ([::1]:43968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiCth-0006KJ-FG
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 06:54:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oiCUI-00029W-Uu
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 06:27:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20564)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oiCUG-0004UY-9Y
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 06:27:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665484066;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YQrgVh5+WZj8NBxv9tJEB4/Q2aTJD2W6dvNkeWRMf7E=;
 b=ZVVA0DjNs6d23dszXFtCzv9AMBwLELjXIGRpqvgCuSshFry1KfpM5pdSf/dVijW82cnPpL
 tyzh1T6R9fB1ou9ZMF/R9OtLtqqy9U+nPMs/+M0yPVgmI5CynMM30k7E2n1rtcTYgLuzOO
 Wm5PpKZpzWzk2BBGNZ766FhiyE5ZiGs=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-584-S4QAd99XP96S_4IiNUbVXA-1; Tue, 11 Oct 2022 06:27:45 -0400
X-MC-Unique: S4QAd99XP96S_4IiNUbVXA-1
Received: by mail-ed1-f70.google.com with SMTP id
 b19-20020a056402351300b0045c129ed62cso4014321edd.6
 for <qemu-devel@nongnu.org>; Tue, 11 Oct 2022 03:27:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YQrgVh5+WZj8NBxv9tJEB4/Q2aTJD2W6dvNkeWRMf7E=;
 b=dT8avyp1CIJgW/tXuMYkH3IE5VRtTQ/0wElFaLtor7kshrYazWwFRTBTv6HQql64aM
 Q0CZJsyY5IJJSgXxgT5/3ybs9j9eCadawa/zrslzypI3K2yctXNsqfcM8zA6qnP+0i+v
 Qu5SApvwUa7iaEJfs3uQJ6cedj73t97b7J/WjjfQo9XUrxeXDAkKm9nqcq4PaaBtSxTk
 1ki6Muh3Whsz7bTFgJuqgRONp3h/Rlh/5mJCGjYjNtR0oCF6FDlB9mX+quB1wbYpAY5+
 TJc+lSfqM7Jb0WYBs5i60mguxN6krgdFTbkdWlTnW4LarG8hamX1EXVat6TBIkn2AaRV
 7ETw==
X-Gm-Message-State: ACrzQf2kwlMo0ONJ9WtznXjU/E4AJEiWLSFx+0UTgLVDlePERVrR/Fgq
 CBj01NYLLKel/b2cImylySQCUnR+m2N7nGjX3X1vM7RIQfLZ9Xs4t7qUPTEUbmiIkMJPEWPTm+I
 p9NBIqjT27WlKvauyMJ1KMKGaMSUGIcAPDJeP5YZ79nha8ryQMNpjGlbGtjBZ6cmamCU=
X-Received: by 2002:a17:907:3d8f:b0:78d:b46e:eadd with SMTP id
 he15-20020a1709073d8f00b0078db46eeaddmr8615552ejc.277.1665484063659; 
 Tue, 11 Oct 2022 03:27:43 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7sagaDcLQ1Hcyl+1sLgULHKwD1xIuehtEg/9o7RA+DCXhhAvD2MqM6v3/7X65jRODhkuMmaw==
X-Received: by 2002:a17:907:3d8f:b0:78d:b46e:eadd with SMTP id
 he15-20020a1709073d8f00b0078db46eeaddmr8615529ejc.277.1665484063354; 
 Tue, 11 Oct 2022 03:27:43 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:aad8:f393:e009:e014])
 by smtp.gmail.com with ESMTPSA id
 g3-20020a170906594300b007815c3e95f6sm6838080ejr.146.2022.10.11.03.27.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Oct 2022 03:27:42 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 14/37] target/i386: Use DISAS_EOB_NEXT
Date: Tue, 11 Oct 2022 12:26:37 +0200
Message-Id: <20221011102700.319178-15-pbonzini@redhat.com>
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

Replace sequences of gen_update_cc_op, gen_update_eip_next,
and gen_eob with the new is_jmp enumerator.

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20221001140935.465607-10-richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/tcg/translate.c | 40 ++++++++++++-------------------------
 1 file changed, 13 insertions(+), 27 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 8c0ef0f212..717c978381 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -7022,8 +7022,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             gen_pop_update(s, ot);
             set_cc_op(s, CC_OP_EFLAGS);
             /* abort translation because TF/AC flag may change */
-            gen_update_eip_next(s);
-            gen_eob(s);
+            s->base.is_jmp = DISAS_EOB_NEXT;
         }
         break;
     case 0x9e: /* sahf */
@@ -7452,8 +7451,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
                 gen_helper_rdmsr(cpu_env);
             } else {
                 gen_helper_wrmsr(cpu_env);
-                gen_update_eip_next(s);
-                gen_eob(s);
+                s->base.is_jmp = DISAS_EOB_NEXT;
             }
         }
         break;
@@ -7652,8 +7650,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
                 goto illegal_op;
             }
             gen_helper_clac(cpu_env);
-            gen_update_eip_next(s);
-            gen_eob(s);
+            s->base.is_jmp = DISAS_EOB_NEXT;
             break;
 
         case 0xcb: /* stac */
@@ -7662,8 +7659,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
                 goto illegal_op;
             }
             gen_helper_stac(cpu_env);
-            gen_update_eip_next(s);
-            gen_eob(s);
+            s->base.is_jmp = DISAS_EOB_NEXT;
             break;
 
         CASE_MODRM_MEM_OP(1): /* sidt */
@@ -7707,8 +7703,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             tcg_gen_trunc_tl_i32(s->tmp2_i32, cpu_regs[R_ECX]);
             gen_helper_xsetbv(cpu_env, s->tmp2_i32, s->tmp1_i64);
             /* End TB because translation flags may change.  */
-            gen_update_eip_next(s);
-            gen_eob(s);
+            s->base.is_jmp = DISAS_EOB_NEXT;
             break;
 
         case 0xd8: /* VMRUN */
@@ -7769,8 +7764,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             }
             gen_update_cc_op(s);
             gen_helper_stgi(cpu_env);
-            gen_update_eip_next(s);
-            gen_eob(s);
+            s->base.is_jmp = DISAS_EOB_NEXT;
             break;
 
         case 0xdd: /* CLGI */
@@ -7808,8 +7802,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
                 tcg_gen_ext32u_tl(s->A0, cpu_regs[R_EAX]);
             }
             gen_helper_flush_page(cpu_env, s->A0);
-            gen_update_eip_next(s);
-            gen_eob(s);
+            s->base.is_jmp = DISAS_EOB_NEXT;
             break;
 
         CASE_MODRM_MEM_OP(2): /* lgdt */
@@ -7892,8 +7885,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             tcg_gen_andi_tl(s->T1, s->T1, ~0xe);
             tcg_gen_or_tl(s->T0, s->T0, s->T1);
             gen_helper_write_crN(cpu_env, tcg_constant_i32(0), s->T0);
-            gen_update_eip_next(s);
-            gen_eob(s);
+            s->base.is_jmp = DISAS_EOB_NEXT;
             break;
 
         CASE_MODRM_MEM_OP(7): /* invlpg */
@@ -7903,8 +7895,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             gen_svm_check_intercept(s, SVM_EXIT_INVLPG);
             gen_lea_modrm(env, s, modrm);
             gen_helper_flush_page(cpu_env, s->A0);
-            gen_update_eip_next(s);
-            gen_eob(s);
+            s->base.is_jmp = DISAS_EOB_NEXT;
             break;
 
         case 0xf8: /* swapgs */
@@ -8303,8 +8294,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             gen_svm_check_intercept(s, SVM_EXIT_WRITE_CR0 + reg);
             gen_op_mov_v_reg(s, ot, s->T0, rm);
             gen_helper_write_crN(cpu_env, tcg_constant_i32(reg), s->T0);
-            gen_update_eip_next(s);
-            gen_eob(s);
+            s->base.is_jmp = DISAS_EOB_NEXT;
         } else {
             gen_svm_check_intercept(s, SVM_EXIT_READ_CR0 + reg);
             gen_helper_read_crN(s->T0, cpu_env, tcg_constant_i32(reg));
@@ -8338,8 +8328,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
                 gen_op_mov_v_reg(s, ot, s->T0, rm);
                 tcg_gen_movi_i32(s->tmp2_i32, reg);
                 gen_helper_set_dr(cpu_env, s->tmp2_i32, s->T0);
-                gen_update_eip_next(s);
-                gen_eob(s);
+                s->base.is_jmp = DISAS_EOB_NEXT;
             } else {
                 gen_svm_check_intercept(s, SVM_EXIT_READ_DR0 + reg);
                 tcg_gen_movi_i32(s->tmp2_i32, reg);
@@ -8353,8 +8342,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             gen_svm_check_intercept(s, SVM_EXIT_WRITE_CR0);
             gen_helper_clts(cpu_env);
             /* abort block because static cpu state changed */
-            gen_update_eip_next(s);
-            gen_eob(s);
+            s->base.is_jmp = DISAS_EOB_NEXT;
         }
         break;
     /* MMX/3DNow!/SSE/SSE2/SSE3/SSSE3/SSE4 support */
@@ -8450,9 +8438,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             gen_helper_xrstor(cpu_env, s->A0, s->tmp1_i64);
             /* XRSTOR is how MPX is enabled, which changes how
                we translate.  Thus we need to end the TB.  */
-            gen_update_cc_op(s);
-            gen_update_eip_next(s);
-            gen_eob(s);
+            s->base.is_jmp = DISAS_EOB_NEXT;
             break;
 
         CASE_MODRM_MEM_OP(6): /* xsaveopt / clwb */
-- 
2.37.3


