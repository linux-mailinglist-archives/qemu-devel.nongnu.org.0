Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 190C55FB12E
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 13:11:43 +0200 (CEST)
Received: from localhost ([::1]:39760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiDAh-0002vY-St
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 07:11:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oiCUX-0002Ia-8F
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 06:28:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45041)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oiCUV-0004Zc-7T
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 06:28:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665484082;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RWkzp2G1GGRfPr9zZ4LH8Nm9HU3hhMu4BerVJTaCKpw=;
 b=abHayjbpmh3Ixx2Rb2wYDeMm0MnKmyqFe32xzu92b4K8seMd9UXPSYlG/s9aCJjGcS2crD
 3DRjjDQDr5fntW95EBVuKxWb8x96aijXFLYSubpuYQpalTY83cxoRu4MA9Hco4L+bRU5ot
 CsHrWheu43rSiGWmU8hfYWKY5I8oKbg=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-562-dTkMAC0OMH6L1ZnR6RnjAQ-1; Tue, 11 Oct 2022 06:28:01 -0400
X-MC-Unique: dTkMAC0OMH6L1ZnR6RnjAQ-1
Received: by mail-ej1-f71.google.com with SMTP id
 gb42-20020a170907962a00b0078d194624a9so5721436ejc.11
 for <qemu-devel@nongnu.org>; Tue, 11 Oct 2022 03:28:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RWkzp2G1GGRfPr9zZ4LH8Nm9HU3hhMu4BerVJTaCKpw=;
 b=XDroIYMJYNSd5LyiJ2jTaWcnmiJhxaEiJh7ER6GBj+YxMoyj3ZTXW+ig8VpeLBsMzF
 +6zdVg4R3996Q+k6O9MHqTMo2GtZxA4My4mMgVQ/InOEKYWkkxF8+jqyzngMD5woHBW+
 bsVhKr2Id0vICw7YY8g+LkU8oY4WpiOOpu2jH54UFujZfvnbMPY8jJnlZe6r0ay6qu8K
 SMaotortctFD31Vp/446bbD4E7sPLWkMj+1zHnN5FhnoVRE2aYesoqeZHe/Y9sEnbjKW
 bTdUvQS0hQJN+VJOiszlQxpFk10Zi5p7cWtUjnPSt2ngzR87ww79UtbXB8sXF0IK+EsQ
 ZobQ==
X-Gm-Message-State: ACrzQf1f0URNFnN0yDAz5Py07V+8Euo+n2g0mQhK2eAPhkzWDTo8dTS/
 Pc7Q7H8Kx0dXmLoU2H8qX5VOj2a+EWUMpJJxITRPvGMUY/QZ+F0hWZl5/G+u2gP0Jxnhu3u/F/7
 oIhBhC5cJ5rk0mMbA620CPR40KuzARIEFbVleFLAwlS+1mye56ZPRbc1qGnSpZgfgEyE=
X-Received: by 2002:a17:906:ee88:b0:78d:1a9a:b2db with SMTP id
 wt8-20020a170906ee8800b0078d1a9ab2dbmr18213832ejb.225.1665484080188; 
 Tue, 11 Oct 2022 03:28:00 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5Xo1vFMuSD/H2i7q+ZvCCFfHbMEKW4PZNcYMLG5wRGY9xKmw8tsMXGzsc0UViHf0zso66F2w==
X-Received: by 2002:a17:906:ee88:b0:78d:1a9a:b2db with SMTP id
 wt8-20020a170906ee8800b0078d1a9ab2dbmr18213818ejb.225.1665484079880; 
 Tue, 11 Oct 2022 03:27:59 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:aad8:f393:e009:e014])
 by smtp.gmail.com with ESMTPSA id
 hv13-20020a17090760cd00b00782539a02absm6826615ejc.194.2022.10.11.03.27.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Oct 2022 03:27:59 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 20/37] target/i386: Create eip_next_*
Date: Tue, 11 Oct 2022 12:26:43 +0200
Message-Id: <20221011102700.319178-21-pbonzini@redhat.com>
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

Create helpers for loading the address of the next insn.
Use tcg_constant_* in adjacent code where convenient.

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20221001140935.465607-16-richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/tcg/translate.c | 55 +++++++++++++++++++++++--------------
 1 file changed, 34 insertions(+), 21 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 1aa5b37ea6..be29ea7a03 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -541,6 +541,27 @@ static TCGv_i32 cur_insn_len_i32(DisasContext *s)
     return tcg_constant_i32(cur_insn_len(s));
 }
 
+static TCGv_i32 eip_next_i32(DisasContext *s)
+{
+    /*
+     * This function has two users: lcall_real (always 16-bit mode), and
+     * iret_protected (16, 32, or 64-bit mode).  IRET only uses the value
+     * when EFLAGS.NT is set, which is illegal in 64-bit mode, which is
+     * why passing a 32-bit value isn't broken.  To avoid using this where
+     * we shouldn't, return -1 in 64-bit mode so that execution goes into
+     * the weeds quickly.
+     */
+    if (CODE64(s)) {
+        return tcg_constant_i32(-1);
+    }
+    return tcg_constant_i32(s->pc - s->cs_base);
+}
+
+static TCGv eip_next_tl(DisasContext *s)
+{
+    return tcg_constant_tl(s->pc - s->cs_base);
+}
+
 /* Compute SEG:REG into A0.  SEG is selected from the override segment
    (OVR_SEG) and the default segment (DEF_SEG).  OVR_SEG may be -1 to
    indicate no override.  */
@@ -1213,12 +1234,9 @@ static void gen_bpt_io(DisasContext *s, TCGv_i32 t_port, int ot)
         /* user-mode cpu should not be in IOBPT mode */
         g_assert_not_reached();
 #else
-        TCGv_i32 t_size = tcg_const_i32(1 << ot);
-        TCGv t_next = tcg_const_tl(s->pc - s->cs_base);
-
+        TCGv_i32 t_size = tcg_constant_i32(1 << ot);
+        TCGv t_next = eip_next_tl(s);
         gen_helper_bpt_io(cpu_env, t_port, t_size, t_next);
-        tcg_temp_free_i32(t_size);
-        tcg_temp_free(t_next);
 #endif /* CONFIG_USER_ONLY */
     }
 }
@@ -5324,9 +5342,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             if (dflag == MO_16) {
                 tcg_gen_ext16u_tl(s->T0, s->T0);
             }
-            next_eip = s->pc - s->cs_base;
-            tcg_gen_movi_tl(s->T1, next_eip);
-            gen_push_v(s, s->T1);
+            gen_push_v(s, eip_next_tl(s));
             gen_op_jmp_v(s->T0);
             gen_bnd_jmp(s);
             s->base.is_jmp = DISAS_JUMP;
@@ -5342,14 +5358,14 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             if (PE(s) && !VM86(s)) {
                 tcg_gen_trunc_tl_i32(s->tmp2_i32, s->T0);
                 gen_helper_lcall_protected(cpu_env, s->tmp2_i32, s->T1,
-                                           tcg_const_i32(dflag - 1),
-                                           tcg_const_tl(s->pc - s->cs_base));
+                                           tcg_constant_i32(dflag - 1),
+                                           eip_next_tl(s));
             } else {
                 tcg_gen_trunc_tl_i32(s->tmp2_i32, s->T0);
                 tcg_gen_trunc_tl_i32(s->tmp3_i32, s->T1);
                 gen_helper_lcall_real(cpu_env, s->tmp2_i32, s->tmp3_i32,
-                                      tcg_const_i32(dflag - 1),
-                                      tcg_const_i32(s->pc - s->cs_base));
+                                      tcg_constant_i32(dflag - 1),
+                                      eip_next_i32(s));
             }
             s->base.is_jmp = DISAS_JUMP;
             break;
@@ -5372,7 +5388,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             if (PE(s) && !VM86(s)) {
                 tcg_gen_trunc_tl_i32(s->tmp2_i32, s->T0);
                 gen_helper_ljmp_protected(cpu_env, s->tmp2_i32, s->T1,
-                                          tcg_const_tl(s->pc - s->cs_base));
+                                          eip_next_tl(s));
             } else {
                 gen_op_movl_seg_T0_vm(s, R_CS);
                 gen_op_jmp_v(s->T1);
@@ -6854,8 +6870,8 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             }
             gen_helper_iret_real(cpu_env, tcg_const_i32(dflag - 1));
         } else {
-            gen_helper_iret_protected(cpu_env, tcg_const_i32(dflag - 1),
-                                      tcg_const_i32(s->pc - s->cs_base));
+            gen_helper_iret_protected(cpu_env, tcg_constant_i32(dflag - 1),
+                                      eip_next_i32(s));
         }
         set_cc_op(s, CC_OP_EFLAGS);
         s->base.is_jmp = DISAS_EOB_ONLY;
@@ -6867,15 +6883,13 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             } else {
                 tval = (int16_t)insn_get(env, s, MO_16);
             }
-            next_eip = s->pc - s->cs_base;
-            tval += next_eip;
+            tval += s->pc - s->cs_base;
             if (dflag == MO_16) {
                 tval &= 0xffff;
             } else if (!CODE64(s)) {
                 tval &= 0xffffffff;
             }
-            tcg_gen_movi_tl(s->T0, next_eip);
-            gen_push_v(s, s->T0);
+            gen_push_v(s, eip_next_tl(s));
             gen_bnd_jmp(s);
             gen_jmp(s, tval);
         }
@@ -7409,8 +7423,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             TCGLabel *l1, *l2, *l3;
 
             tval = (int8_t)insn_get(env, s, MO_8);
-            next_eip = s->pc - s->cs_base;
-            tval += next_eip;
+            tval += s->pc - s->cs_base;
             if (dflag == MO_16) {
                 tval &= 0xffff;
             }
-- 
2.37.3


