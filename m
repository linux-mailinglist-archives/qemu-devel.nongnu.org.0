Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29EFB4DE96E
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Mar 2022 17:55:32 +0100 (CET)
Received: from localhost ([::1]:42314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVcMV-0005Dm-8C
	for lists+qemu-devel@lfdr.de; Sat, 19 Mar 2022 12:55:31 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lw945lw945@yahoo.com>)
 id 1nVbcA-0001ZV-8a
 for qemu-devel@nongnu.org; Sat, 19 Mar 2022 12:07:38 -0400
Received: from sonic307-55.consmr.mail.gq1.yahoo.com ([98.137.64.31]:45378)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <lw945lw945@yahoo.com>)
 id 1nVbc8-000703-4s
 for qemu-devel@nongnu.org; Sat, 19 Mar 2022 12:07:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1647706054; bh=xjBUtVBBtSbSdAVIiSAKafpTOG8Miv0cFuJhpmdl+Mo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject:Reply-To;
 b=qpCrQC8qu35GF3to6vhrENgcGAEEXHKP3Mpdck46K65enkNaygd6EwbmkWU5L7JrjRt767UTNqnhkUmGjZ6WxC0xtGFsYIQFjZGu4LCdiqQ8JEzZrig8Wp7RgfFV+RW1/aIeaIx7L4haFQcQ4jB29NEtmqwkkWElUY3ELPjSI2/+3YyNDT+656MO+MRHJqXR7JH3JUGqtiX6pA7wuaLfh4bCi8lXvr35X01iSptiy1vhKdROMml0sZTxIQQjcRZ/pBLJsUXb7uqmafS2m2ZIw+zZVi4HSQIItnYBaNrmGDQc+0oZAHNPHc9EX2LUYx04EtKkUQ9FA0g6tQL22dUUTw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1647706054; bh=NmiIT/kfwsl43dxVZ28Pn2ZmzzXJgBh8ofz7ZpRtjny=;
 h=X-Sonic-MF:From:To:Subject:Date:From:Subject;
 b=YMNwUPIRGC5AqBHncK0ecrBpxQTZPfcues/GhlCiGz5H2SP6kR6SwlTkvp5sGIhJw5JOdnC+TYNhn9dEfctnHl/UX8tuDpOHSnRfkyeenm4zvT7xb/rrP/jAmNqdoEpCURQoVHJyPu5JB51lLP1C9ZuUaqnSYRDSwnWILFldN9n1vGBY+8ljFqmn2j6gt4ykm0Z/z70Z3dQJH4cBCILpQtxPEHcIGqQ/aQDZi5nT4xiLeNNg9rDhBtxLZEkzrsRaBf6vHl7bT+zum4/fBPjDv81UxS5HgEiAY6cHfFw+Z4/jNSkS8Kfh8YZzNY9XawBn8P927QxZ2XyKfEko3qK8Pw==
X-YMail-OSG: LH3UwBEVM1kus093jBFH9H3vaJEaglkyTyWs12M8ZXhSpLHvP28TkdRKI6SmHCx
 KnfeFxtozNS7Pk.XMwwvfVDOFmlUakVsl7DiUftrEObXX6FUkNHIHmi2AKGeugyQOhc1KUt59B3a
 UAWOeCBdH55Im0_3XDXcx6UGNf3uz77PqLiYm3Od84lLKCCLeiGwg5h.eVqJLhPW1uAJunIdKj4t
 3smGxFGJldgxvGMAaFGoQddHtFcnV7TG_JZlCHPnlaJhEeOxy8e9.dmGeW_Ft8a_a8hZHKmAbIkR
 OAUUx1LQAlzbKwsa9wBBfnjhTZpr9QOuTThgc8nThXzDmnRT1QJSI5Q2dETIAg.m.8rSqm346rKh
 BvIdA3j85spuA7FQycOOJg4FJgU92GETrrxPKfP3Ul1z3fbEeC249Zdr4pknttsJKPF53b_Smf4t
 UPe8HMx19DngtSJZlXAuc.YPbA7XpwJiLmm0KFyzX4URypfQfDc8lIRmjQCJHzBnCyGjCANb6rX1
 QpJlhv0hNND4sCeistC_m188Hy17CSmKydnEinj3sC5IcT54BBGN0ns4pndIjXHkjmRlxrZZRqqN
 _xRtJObmCeYNQiiqaWzhY7IlkFOPDMeHMXsO0b2_KAHQJYwFixIVQPQ3jCaLIU2e.HLBZWvjV8kW
 b7mKLN8Krq1Ow1Bb88xss4oRQHkdx8OK3m1rhiv0LOO01.sPR6gr2jbpB77BIPccQyOK_AKAkSPq
 xPwnUIW8faLwZPHUhZ6qTCS51e1VZW9roovqXr6d00ZA3ZpYYet2Mf9gO3P1sf0pXJi0tNQZrGOC
 fM8Jw7dREZQ1KKKLINX3dc.AD8KPctctbACJuTC_C3JrVZdtS_HZPbnVfZZ8m7dQo5kRztec73oT
 c0Eo.BlqXs3TWMxriHs5Eq86MnZW7VUeVYXGVd0t.uuLJ83K_cI7LqOy5MVXTc9XeCuc3k74KSuB
 BMnNlb4nDdA8sOOb0NTIBDyOvfPOAkV4eeJ1J9uXLlMI47c7ndL31SXv6glmlfNyCziix79YqAHl
 z3j3D1OgziE5GdteLhsvBv1r9TcCRiYofDwP0pxp2tjYdmcO4LbYX7lrB1Tn_G1l_XUbMAKuLC5G
 2lYQNYaKLIz.Q1usT_Pzhpb2MBP4ipUUUEQDSuy3ARXqiMQZ9bQdiePC_s3olN6unF_quTiv8t40
 t7TNtV8uC4afNaFxTcOGASgVSi8P8FFK_H.jd3InvYvaywdDntefpdh5YdiQNPqt30J_KUoGkNYO
 WHDgt_86EVpOPHtUbmsYayE5EBc6Kg.bgnu6eVYe0c24Bp58JlFGgJ7uww_YVVrUVOYXlxMNRp7K
 hM7O1pKmUBUruvRx3qjY_Q4_N94bRDSQ9Xz29MEM2wIHtiKHfa91XSDSaxvIWGqgFosQUfQEA2gW
 _PLAkTD9sFCm20d6pJft7Fi0Xw5K5xaGGPAMbgiPiyo7BuOszDaL.lYu29IF91VgSLnm7_ROf4TJ
 2KHDudASxu757UmZctcXehW2UaVxjHv02Im4R7XgTTJBSINv2etf8OJ_ETTJ_scpr5148iStSvQ9
 JyRRypj2fq6DvP6xvLqyalps.xL.ZMvVAwZnIU0gM6BdpDaSap7ApGvzUVuTcimV0nBDoy3u.r.c
 lq3Unz8YYxjEOU7ft3.ZjvA0FoawEoxq_hIc9nu.cJlJRmH9x3eNlT.2P.WGOwUMoSH7lakkJp_G
 lwjJ7gZtEXkEP8R_xJujDTbKD6FXklPRVYqLHVJV1guA2ONDXht9C7Jfsfw_PVL1w2C0NMnF2C4p
 a1ItOCTkULilyNpBAtJpAYDWj44a3j8bxvWcrE_iI79jlnkHhsg25qzomtJvZnx2aCH04DmK_rAh
 qIrUx5zp98CMgIraX6tc6s1Q1TK7uC5WafO_8fxB01HEZAqQLBOmf567hckblQ_180TgyCP3Ejb5
 OlZEhuPPb9wB3ZYGAqMJtR4ZwibhIDNgdTl3py6Ri4mWVUMwaG5TSlxFyN4rQnKnARFJtT3a6sYx
 lYd8PmEOZ9VMOKoASAZKgSUWPbvPzjo52H6mKqQOV37QbwVNRxgWsSBl_d3CJf2yLvOt0nlH0zaL
 jqXVCDOEAl0uqyWkhzwu075PUXyc3KDlJ7qrg8YDkEh.V8I4Sl_Ykm01KzOt4EmoMihLkPBpRoWv
 sVaRekIT7sSNPLVRu04rsyihd5ah90SttBRty9TWzZRu15QQ6Jde4GB7Q8F298sNprhuVGCCTlIg
 qcq.FPj.tS7D.wnPqYfU7OXqGyh1x1hQ6L3xtgUMkXdBr1xiKT5Cl07_dRHEXTFEErSE-
X-Sonic-MF: <lw945lw945@yahoo.com>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic307.consmr.mail.gq1.yahoo.com with HTTP; Sat, 19 Mar 2022 16:07:34 +0000
Received: by hermes--canary-production-bf1-665cdb9985-zm65g (VZM Hermes SMTP
 Server) with ESMTPA ID bd8d586da7e6832dcd6ba8030d16f89c; 
 Sat, 19 Mar 2022 16:07:28 +0000 (UTC)
From: Wei Li <lw945lw945@yahoo.com>
To: pbonzini@redhat.com,
	richard.henderson@linaro.org,
	eduardo@habkost.net
Cc: qemu-devel@nongnu.org,
	Wei Li <lw945lw945@yahoo.com>
Subject: [PATCH 1/2] fix cmpxchg instruction
Date: Sun, 20 Mar 2022 00:06:57 +0800
Message-Id: <20220319160658.336882-2-lw945lw945@yahoo.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220319160658.336882-1-lw945lw945@yahoo.com>
References: <20220319160658.336882-1-lw945lw945@yahoo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=98.137.64.31; envelope-from=lw945lw945@yahoo.com;
 helo=sonic307-55.consmr.mail.gq1.yahoo.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sat, 19 Mar 2022 12:53:45 -0400
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

We need a branch to determine when the instruction can touch the
accumulator. But there is a branch provided by movcond. So it is
redundant to use both branch and movcond. Just use one branch to
solve the problem according to intel manual.

Signed-off-by: Wei Li <lw945lw945@yahoo.com>
---
 target/i386/tcg/translate.c | 27 +++++++++++++++++++--------
 1 file changed, 19 insertions(+), 8 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 2a94d33742..05be8d08e6 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -5339,15 +5339,17 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
     case 0x1b0:
     case 0x1b1: /* cmpxchg Ev, Gv */
         {
-            TCGv oldv, newv, cmpv;
+            TCGLabel *label1, *label2;
+            TCGv oldv, newv, cmpv, a0;
 
             ot = mo_b_d(b, dflag);
             modrm = x86_ldub_code(env, s);
             reg = ((modrm >> 3) & 7) | REX_R(s);
             mod = (modrm >> 6) & 3;
-            oldv = tcg_temp_new();
-            newv = tcg_temp_new();
-            cmpv = tcg_temp_new();
+            oldv = tcg_temp_local_new();
+            newv = tcg_temp_local_new();
+            cmpv = tcg_temp_local_new();
+            a0 = tcg_temp_local_new();
             gen_op_mov_v_reg(s, ot, newv, reg);
             tcg_gen_mov_tl(cmpv, cpu_regs[R_EAX]);
 
@@ -5365,24 +5367,32 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
                     gen_op_mov_v_reg(s, ot, oldv, rm);
                 } else {
                     gen_lea_modrm(env, s, modrm);
-                    gen_op_ld_v(s, ot, oldv, s->A0);
+                    tcg_gen_mov_tl(a0, s->A0);
+                    gen_op_ld_v(s, ot, oldv, a0);
                     rm = 0; /* avoid warning */
                 }
+                label1 = gen_new_label();
                 gen_extu(ot, oldv);
                 gen_extu(ot, cmpv);
-                /* store value = (old == cmp ? new : old);  */
-                tcg_gen_movcond_tl(TCG_COND_EQ, newv, oldv, cmpv, newv, oldv);
+                tcg_gen_brcond_tl(TCG_COND_EQ, oldv, cmpv, label1);
+                label2 = gen_new_label();
                 if (mod == 3) {
                     gen_op_mov_reg_v(s, ot, R_EAX, oldv);
+                    tcg_gen_br(label2);
+                    gen_set_label(label1);
                     gen_op_mov_reg_v(s, ot, rm, newv);
                 } else {
                     /* Perform an unconditional store cycle like physical cpu;
                        must be before changing accumulator to ensure
                        idempotency if the store faults and the instruction
                        is restarted */
-                    gen_op_st_v(s, ot, newv, s->A0);
+                    gen_op_st_v(s, ot, oldv, a0);
                     gen_op_mov_reg_v(s, ot, R_EAX, oldv);
+                    tcg_gen_br(label2);
+                    gen_set_label(label1);
+                    gen_op_st_v(s, ot, newv, a0);
                 }
+                gen_set_label(label2);
             }
             tcg_gen_mov_tl(cpu_cc_src, oldv);
             tcg_gen_mov_tl(s->cc_srcT, cmpv);
@@ -5391,6 +5401,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
             tcg_temp_free(oldv);
             tcg_temp_free(newv);
             tcg_temp_free(cmpv);
+            tcg_temp_free(a0);
         }
         break;
     case 0x1c7: /* cmpxchg8b */
-- 
2.30.2


