Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A1B54E37E6
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 05:21:42 +0100 (CET)
Received: from localhost ([::1]:54774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWW1d-00062W-LB
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 00:21:41 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lw945lw945@yahoo.com>)
 id 1nWW0R-0004fH-BQ
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 00:20:27 -0400
Received: from sonic306-21.consmr.mail.gq1.yahoo.com ([98.137.68.84]:45535)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <lw945lw945@yahoo.com>)
 id 1nWW0P-0002vg-I7
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 00:20:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1647922823; bh=GH4yRp4/tEfn9PX0lUuw5MQLPnUaBzR94zakALJYQ7U=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject:Reply-To;
 b=WXU4lCDaFVlbT4qIWvlrzKy3qzr4qe6qiUubIlbw87SJh07uLjdbu0AppslQ+FzMwKdIjsA0T+LTiDBnOs358l48nR4WzabcoEzNysjOvReUNweXg5Ywk22ZFZSSlV5gBUTTN5baiEmbF5Vw+zRpn0J9/sy4xWf+pZmT/x0+l9Veg69H4oMD7Yrjyl4A7tuB5v0Q/JoSArAUG6KjtPyTBqZHJNLjjzEHWOUP7RXghs2GRNoii/XYztqYFzkTr69NkqwkvSyYCxJP+HIB1YaQ+XPAaXA39gXMt+d5/UXTccfhxep9Kjwxdyasqrp0xBaEk2XpEW+oOimUAdneTMft8A==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1647922823; bh=5GGVHzhw9EPw68TN1mS5f6afliK8bGpRRcDFwTNDcqS=;
 h=X-Sonic-MF:From:To:Subject:Date:From:Subject;
 b=HMpL1qWBL36yrH5YbLe6tZ0uNZJPzS9uftw8sISRYBnGDIS+uLQXeQNzsRFiyu36F/kwzlj4shroYcu5Njh9TArZofmTrp0+2Wb+Ypage9TPmI2pJJq4VRIANctJD0V6eWveN7P/zQjMnjbh1O4inzHn3s43lzcNHUvkS7Hv1q5WfyDyccaZLp+M5YVOD/C1LutTgk12wLu0AJMRP5viJKxoebguvu6m/xK1W5C6NlmOhz71QpkRJrIF7m+YqPTnlBiL18n4ph7xOj1SErR+IjsyMMEoCex84lgnlD5Jc777JNLb34Gr6M7OY+r7uL9yTBkZIXofmP6XRyHxZPCW4Q==
X-YMail-OSG: hbOSstYVM1ndMgZR5jgRMzR23OWr8ZNw7JvHYuUfpX32j_6ac9JSKmr.bOvPdHJ
 k_YrYusWDyubxsu8BrpVQd2hnKraB.fZp87_.DEj0Da1sPnQO21Cqh3AauJ4VqCRf2aAzvvKOWDi
 K5sngNG4msgKxPxPOwy7tHqIB0c0rrGVJRed0klk0La.fIksQMcQY05_QEAryQATCEslQ7ZegLHh
 E1cf7GCAhPGtugs9KHKWq65RP.fQR4WvPbLfTu88483htYPXj7OC1Xe9yegBYnEwaMMxsQYhGjYw
 i8I9h0rCCy7Kx1czO35Rt2RNWe7Ec4.aw8uKNl5oMOeQtwOCFxaKf_psaBLz205ngfIZTiQG7hIq
 nRvyWhIvbwL32nXrCCwXEu9tEjt0qQjxQ.jYrdjH2wsL8SLsp6jWnq_vR1bs0PYbatl8VoQLPKam
 p5mso0LiwOiMfrrbDryo4yJMSLWKc5yZ42hblPJn9NLPOvRzndytPctU8L.EF5yzNzSMg7YC8Xt.
 mzDGylAKYulDkPxUkpvOXnf99ijt16v1hHIZZ5Kxufn2_JBDWTHWrhuqL45wKEYkpnjN_r_V4Muh
 oetsmj_EGjgTZE4aelGcPNB9t4UWvwdWM2z53_AoE90y24fItWXSWw0mTJy.AcAa8F75hl0W_H8g
 OdXNzX3z8YVTkNrSenGAmVpp59ewQpehkzQjHoNMIxD6mvekDgcr1LJnJk7_ecjZo3BzKkSUENBT
 6aF2XwA4Z3ho0OyDhUKV0H3O4ms.8jdmSrcQUeL96Nhy2h77lnZ20_PqH5H9ok4RK75qQkD9kodF
 TTuVK1195GhkH3PsbFBfMdINpFxo67fm2icm_9eBPVgeBDrxI9M4Te52fUKlsc_4FsFfoUGS7iO4
 zz2j1_laDlSTUFnLCJjGu3EI64ydTuupzu35PnsYSSyweRqM1k2zdNALoZfKRsexqZmd3juTtxDl
 PD3tao.awole8onZYI.JhE9olD8ANM_mC5Lx9w5JE47MUNkPU_qvfOFQyD3UIvS6PYTLB4SkPt86
 gclnglbJD.cLDZouEs84Ie28whWK01wQ1CVlUGW7fP7N7gbWwIG7mNohvlYXish8s4aLbM65gkE_
 NZoQ4a.IFPmzo2s_NHItaIegjZ3uEG9wZ2.8NrDsnI_dv0zZiiGR6FONkw.v4Bonz7xWeLA.l58z
 XNpJ.bYP723pmyk4T8XwAyz7BK0akMGwUNkbXgzf4mBxyekGN6Pic0pfw1LlhsLWy5SdoAyRac_Q
 s5tyDmfM2ofNmzoIhMSIkaVq0SCPvAshvWiCvWuHeZhbiPOkc7wb3xgcmRbHKSxOkR9QnmppHwKR
 VC_pSy9hFKigXyl_hAFJX8C3BiFbYd0tWitPAvAUSi5MzChKheg0K2pOdIN_i3NhRPpGDzqhbdKc
 W2VCJpbi4Fjbgqb8DfGnrWX8Nk3PCn6VL1F25m1KUajL7k_IsVuL9qCC7RM2F6o0aWi80gVNw24n
 P1Elp1h5.4wDygLB8SfLLfujzbwCZ.LrhzshY88SQxyPOdb_SsIr6XctGg1UXLfbmEMS21lvFMwl
 jmmEpsVRnmEL6x9WEbXpxOlr8r6rx3wxJ9DfV7bRqUp3ENctmy0yB5WDL6CR51VOHQLUVAao7mm5
 W3RY8UdKXs81NVw7Kp8px72aWkpMSSP5hkN8ukmXuQQQFRAhZ4d_oeq.OF9spNASbf1MR8wntdzh
 7Q8p.Y7UXNEdKHtMyz1bVgXIbNr.7I4EkrwICIFLWydVzZAi50oFJa1W7d3K5Ll.9.xzHpD.FTaT
 WkFZ8eMzxvmZQsb9AX1S4hXo2p9.6sFtRshFZRnzH5emeuLzdozxhbk54SaoGxc_BydSAaen2eEz
 nHXH4Wyq5.aKNGKEJHH8TfhaTfiN_wYey0BxqVtvDzV_UtbvEw6GeksZx58clyxBERiuoKjxJQS2
 AlyHTHPBacGbLvkCaUyTwMVcr0QFNEkX7.yuAXw.luojDr_xLO10nDRwTUkl04Os1WgRlkCbhxTx
 y63nZVxUyfO79gxQzv9nuv3Sy_5RKInu3gIusnuzKDDWL1LW7tfD9cDaeWfqzmhuny_7QhiosVZT
 EXgYIKO_Xy_nNnQAqwSt_8kyqPETLIkibhxkjmlHUeZulMeqQ7NWj2scFnE.kcdLfyUR3UH2IsdS
 2EBjCLpDOGtTfzHNyh5L9VaHUECT.Q4SjyGrLVxo0LX1mZXBQO9x1e4mpfEUwf3_kl9Z_NCjk0EU
 Hp7GvrHUD49TMbFmWQZ.2vQjdO74FxS47xgDptD1kmejFsQFDGp6ltAQS2KSoZlp3huZAho1mlhE
 tmI2HgJi4Nw--
X-Sonic-MF: <lw945lw945@yahoo.com>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic306.consmr.mail.gq1.yahoo.com with HTTP; Tue, 22 Mar 2022 04:20:23 +0000
Received: by kubenode532.mail-prod1.omega.gq1.yahoo.com (VZM Hermes SMTP
 Server) with ESMTPA ID cd57a348f3b3e19681ab39e769f07847; 
 Tue, 22 Mar 2022 04:20:21 +0000 (UTC)
From: Wei Li <lw945lw945@yahoo.com>
To: pbonzini@redhat.com,
	richard.henderson@linaro.org,
	eduardo@habkost.net
Cc: qemu-devel@nongnu.org
Subject: [PATCH v2 1/1] fix cmpxchg and lock cmpxchg instruction
Date: Tue, 22 Mar 2022 12:20:08 +0800
Message-Id: <20220322042008.399857-2-lw945lw945@yahoo.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220322042008.399857-1-lw945lw945@yahoo.com>
References: <20220322042008.399857-1-lw945lw945@yahoo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=98.137.68.84; envelope-from=lw945lw945@yahoo.com;
 helo=sonic306-21.consmr.mail.gq1.yahoo.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

One question is that we can reduce more code duplication if we use

---------
if(foo){
    ....
    tcg_gen_atomic_cmpxchg_tl(oldv, s->A0, cmpv, newv,
                              s->mem_index, ot | MO_LE);
    gen_extu(ot, oldv);
    gen_extu(ot, cmpv); 
}else{
    ....
    tcg_gen_movcond_tl(TCG_COND_EQ, newv, old, cmpv, newv, oldv);
    gen_op_mov_reg_v(s, ot, rm, newv);
}
gen_op_mov_reg_v(s, ot, R_EAX, oldv);
tcg_gen_movcond_tl(TCG_COND_EQ, cpu_regs[R_EAX], oldv, cmpv,
                    temp, cpu_regs[R_EAX]);
--------

The problem is gen_op_mov_reg_v(s, ot, rm, newv) will happen before
gen_op_mov_reg_v(s, ot, R_EAX, oldv). According to SDM, write to R_EAX
should happen before write to rm. I am not sure about its side effects.

All in all, if there is no side effect, we can use the code above to
reduce more code duplication. Or we use the code below to ensure
correctness.

Signed-off-by: Wei Li <lw945lw945@yahoo.com>
---
 target/i386/tcg/translate.c | 44 +++++++++++++++++++------------------
 1 file changed, 23 insertions(+), 21 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 2a94d33742..6633d8ece6 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -5339,7 +5339,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
     case 0x1b0:
     case 0x1b1: /* cmpxchg Ev, Gv */
         {
-            TCGv oldv, newv, cmpv;
+            TCGv oldv, newv, cmpv, temp;
 
             ot = mo_b_d(b, dflag);
             modrm = x86_ldub_code(env, s);
@@ -5348,41 +5348,42 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
             oldv = tcg_temp_new();
             newv = tcg_temp_new();
             cmpv = tcg_temp_new();
+            temp = tcg_temp_new();
             gen_op_mov_v_reg(s, ot, newv, reg);
             tcg_gen_mov_tl(cmpv, cpu_regs[R_EAX]);
+            tcg_gen_mov_tl(temp, cpu_regs[R_EAX]);
 
-            if (s->prefix & PREFIX_LOCK) {
+            if ((s->prefix & PREFIX_LOCK) ||
+                (mod != 3)) {
+                /* Use the tcg_gen_atomic_cmpxchg_tl path whenever mod != 3.
+                   While an unlocked cmpxchg need not be atomic, it is not
+                   required to be non-atomic either. */
                 if (mod == 3) {
                     goto illegal_op;
                 }
                 gen_lea_modrm(env, s, modrm);
                 tcg_gen_atomic_cmpxchg_tl(oldv, s->A0, cmpv, newv,
                                           s->mem_index, ot | MO_LE);
+                gen_extu(ot, oldv);
+                gen_extu(ot, cmpv);
+                /* Perform the merge into %al or %ax as required by ot. */
                 gen_op_mov_reg_v(s, ot, R_EAX, oldv);
+                /* Undo the entire modification to %rax if comparison equal. */
+                tcg_gen_movcond_tl(TCG_COND_EQ, cpu_regs[R_EAX], oldv, cmpv,
+                                    temp, cpu_regs[R_EAX]);
             } else {
-                if (mod == 3) {
-                    rm = (modrm & 7) | REX_B(s);
-                    gen_op_mov_v_reg(s, ot, oldv, rm);
-                } else {
-                    gen_lea_modrm(env, s, modrm);
-                    gen_op_ld_v(s, ot, oldv, s->A0);
-                    rm = 0; /* avoid warning */
-                }
+                rm = (modrm & 7) | REX_B(s);
+                gen_op_mov_v_reg(s, ot, oldv, rm);
                 gen_extu(ot, oldv);
                 gen_extu(ot, cmpv);
                 /* store value = (old == cmp ? new : old);  */
                 tcg_gen_movcond_tl(TCG_COND_EQ, newv, oldv, cmpv, newv, oldv);
-                if (mod == 3) {
-                    gen_op_mov_reg_v(s, ot, R_EAX, oldv);
-                    gen_op_mov_reg_v(s, ot, rm, newv);
-                } else {
-                    /* Perform an unconditional store cycle like physical cpu;
-                       must be before changing accumulator to ensure
-                       idempotency if the store faults and the instruction
-                       is restarted */
-                    gen_op_st_v(s, ot, newv, s->A0);
-                    gen_op_mov_reg_v(s, ot, R_EAX, oldv);
-                }
+                /* Perform the merge into %al or %ax as required by ot. */
+                gen_op_mov_reg_v(s, ot, R_EAX, oldv);
+                /* Undo the entire modification to %rax if comparison equal. */
+                tcg_gen_movcond_tl(TCG_COND_EQ, cpu_regs[R_EAX], oldv, cmpv,
+                                    temp, cpu_regs[R_EAX]);
+                gen_op_mov_reg_v(s, ot, rm, newv);
             }
             tcg_gen_mov_tl(cpu_cc_src, oldv);
             tcg_gen_mov_tl(s->cc_srcT, cmpv);
@@ -5391,6 +5392,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
             tcg_temp_free(oldv);
             tcg_temp_free(newv);
             tcg_temp_free(cmpv);
+            tcg_temp_free(temp);
         }
         break;
     case 0x1c7: /* cmpxchg8b */
-- 
2.30.2


