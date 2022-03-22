Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA4D34E442E
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 17:25:45 +0100 (CET)
Received: from localhost ([::1]:32854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWhKK-0005mc-FZ
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 12:25:44 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lw945lw945@yahoo.com>)
 id 1nWhIR-0003gW-PS
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 12:23:47 -0400
Received: from sonic308-55.consmr.mail.gq1.yahoo.com ([98.137.68.31]:45157)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <lw945lw945@yahoo.com>)
 id 1nWhIP-0006JD-T1
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 12:23:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1647966223; bh=jH6nYmBREDZ4VjniIAyvx8hpkGlqMW0y7mAtCcxFlJs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject:Reply-To;
 b=OwwiCATZGXLnNeo5HXyh3nN51AXT0tiNixnRO00SFFN8B81fJFk7TeTmG+i1fbXe7j2h6Z+C4Ej4jCrvUqB4jij3psc6rcOZ5XSqHVDEL4Eewmfq3WkGtHW4ujGD5NXICIMRHjeU2aXV3cosVqjdkm4GdYlAEnu+vmbaMqERMOwRtZSZjxB2TRBoWPv8pQ5EY6L/YXwVXHx/oxfnO4wO2Z12Cr0D/IKxKjggTmq0qUSXNwyX4pi5DOCLxFmVPH0ZU09DSc7txiFIu4b6vdL5MldJVheFt2t/7rG+IfoZ0ThQQg0s1ngUeQOM9nCMlt+N02w1uwOs5G3iQW0hR8AEXQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1647966223; bh=wBdlkN0X2leXUB4ot9hepBuypm3WqtE/FAGeyNYBNjN=;
 h=X-Sonic-MF:From:To:Subject:Date:From:Subject;
 b=s42DvpM992r1H3mdSFZBut5eat86g9T60SDB3DvRRzexm8sj2zcEaTKwQaB+6TSxShu92ywEmh84L7MqEJSPskmLTde0peH/w0ThQQ9yNUzLE16Ieckngz9bn0wVkLMy1dbvBDWSXKvfNcT/bt7V4uncq95S96JSJRmmv5sVJDhwwUjBy6QBHO9zmoQuH+GUx03LtdnU4gm/OxjXEqIntXQDxUZhTy05j7mFgz5jiEmHuY4V35d6a/0mgaRAMzbX1wI39VxeOYMRgGX5s706nsLOah6ViTfjFZ6yHc/rrE80h92PuEgVC+pAop02WWQai+gKepnBqFJYTQBjItHD5g==
X-YMail-OSG: DFMMt3MVM1nn.MFE_J0YmEGwopbglcJb0ZsiunRLPC3LOEmYd2BRHh6hyW.0aNi
 wAQgbLxV4C.RtBYTWBOA6ISH3MiHJ.oWc4vEJc1gY23cH9Oq6IjtETeouDYuNE9gDgICHKK5Gh.g
 TWbE3s7hjzNHu51XVCj9QvsNPnsC.QhE0ANUCBGNpjuogWrAKhHYvklaS9_n1G9XLH99YmbB3.a6
 I4VH958vPUHC6yjUDAbs2gh9WyrxeI_97KqeKTp9bTqE3dN45wqgssjEMzmRJok6ZNC.NXMsn4nO
 vFxIZ4Z79.GIS4_f3upG7w4PC6uxdKCZ5AmJLh2mQCm9FdU6RZn6op6E9rdZn21n1C2jaXAKYtU7
 0Kfr70NaiUUuA.0ZPiZ1_HDX9uNAjUhFty34yZtSYCmGKiK.fzjvwf5Of7Re__BIKQTGlOmNgIIC
 ibC1KT8X0WFmXR17xoitHGFpPpKu0MM7t3k8OP1vVpQ01qxoYaEdLnDIOjez5IJH01NYOvIdWLZ3
 ewAmZOzFJmxCQhHtNglU_j0mUrG6JaZI9Q9phKfPXjnS4OTk79tTjE1QWPJMdcwYdM5sO0Quo9XY
 LAFCow.f847RGcpYoPR01vpdeiKb.DGvEiwD5ARYqnXpppSqJ_KQI.0JoRk2iu5ueBntVkADbUC.
 rWv8ztgZJcPk445Xc.yaTp8JiEVDV0sxehTaowp6YKhyt6e_c8hEbTo5g4vgEPi4XlpMwiw5vW8G
 GPvNO4gTnh2CS979V1pDsidRyfOmFO9D3ONTIt4lwiftgnrMlPX40_0u3L_EdeHMEMJnO4Zh3jdP
 rKJo1c4qzpeRHmlzjBjSCG4XMewq3e6yuE8XNPNgO3QzSfiUHsZ3NAG.iJXAVB2EvmXKuVd9WUiA
 jtBM_vnrSw84ZrYh_f.bLqzp.9bW4fV_CXcm6Whcq.T6kje5irnv18ED5RbsFgIayG4que94OsG8
 7VXpIpMaBUxzf0MDePwYz2ktKU8OdZ74vVfzr8Zrm2u3kReRlk3CAMdLloZg7A7Nrnb7ZmRrWXWz
 Yhuv4asLvNumRUSMgaSllpx1FVod5WL7S0JTwtMHdRIC_3dik4Eki.i1IqQv2mXoKp7yUhOnExid
 ewS_B0gVfbhOdulIGiVrtPWvj9sJ_EUIj140hY2p7OsRM8spDVxW7_kKaDZpwXJNKI.H1R_cmgTy
 BaXJpEEgqXGkv6PONtaebspPYozK1RD_gPEWN9NZjt6fbMayRqhx6YfjjwQLBfYgOGskXiOJJjUn
 94DYgwlGjchlgxz7dhrDsGSGsjfPkEJ4MNQBxKF6wS7b1SKXcXFg4qa4cxZBvLkwAwRZnzI_tkpC
 k1cfJfh6CG202uFNbAr7RYRCX9eKENllCVD7OEgV5SjlD4pauqdO2XGBQ6Gryfr.WKQVgAEJWawq
 IfR1QMA20TPE1vkFm6ikHjqcdnIyXZhmPd2vNPiZuzDPmy_a25XQc0uMtLbbdxICHAf1tn7K_1gB
 uSZpE.P4luF45BR.WWIZkJk5qC81RLP_zQhOdJs1WzSPaFMvJODDyu2GpeETQWE6paOxMMv3XyYR
 6a8hfWXG7mJiJ35QyWfk7eWicpqxpsC1nL64G4Dv62ezSPYY0uunzD0ThrjvYfxt_aCsA9AtLJqo
 fFXxGNOU5MoV9gz8jaWaD816qnaVIunplv8Oqf9ikkBkpLkCZ2DzpqvCtwbAqZ.yC5bG2mhzQFRr
 XW05GiB7efpaoPCbFaX517T28GoXZl40nASQIYNYZ6jyn9zHhqENKaxlYi3xI5GZxIKqGHDqQSE9
 TwK0sXagO53rl3PdbKf7aCejXhFTUtqxXc1I3IFWP9cj_wXCgJZTpf3aFnNL1i5_DzQ3s6EjdNn0
 8JHEGGNoI4pBJhOzUjMSqoV2LCo2NwJFREVi0wOc6s9CDhJaRaCRIy.QS7Doqt9Vv46oMFQaVlLo
 U0g8SVRDOdjjKfDakJWovX8TXKfQWNJLby0F2fOJh99DynuGwX4cb1imQwH3M_CbGHmjwLNtpcHu
 HrXQInRk47fPOWq7ihzrCy2XxDgX85qmlSeNeLi3PaI6pBTydKZC0arGFpTcwLhBFXPmA6HvKAAv
 6KgOsoVg2WCjJTfT19SQGqJeoaniAyxW3ryTMk7NC04y9Rk5kgrUHfvpZywCxsDekClte_VjImp_
 b3WN4pweSS35RcMHmx8dQdmgC.Ep8b1XfTjufUjxVNrDoJVztWNZ42hcpWgK4a7Yp63q.mtUjAr6
 FxoOlDfRLzPAG.5Lw6uP4dTF.7ZcY1tCuV11JSVOIqBV0JCCD51V6et_q28J.Ba8_qegIlgvGXiQ
 df8zEjXBBSSU-
X-Sonic-MF: <lw945lw945@yahoo.com>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic308.consmr.mail.gq1.yahoo.com with HTTP; Tue, 22 Mar 2022 16:23:43 +0000
Received: by kubenode527.mail-prod1.omega.gq1.yahoo.com (VZM Hermes SMTP
 Server) with ESMTPA ID 808f424003ffb5335f380da6f5d24d72; 
 Tue, 22 Mar 2022 16:23:39 +0000 (UTC)
From: Wei Li <lw945lw945@yahoo.com>
To: pbonzini@redhat.com,
	richard.henderson@linaro.org,
	eduardo@habkost.net
Cc: qemu-devel@nongnu.org
Subject: [PATCH v3 1/1] fix cmpxchg and lock cmpxchg instruction
Date: Wed, 23 Mar 2022 00:23:14 +0800
Message-Id: <20220322162314.408170-2-lw945lw945@yahoo.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220322162314.408170-1-lw945lw945@yahoo.com>
References: <20220322162314.408170-1-lw945lw945@yahoo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=98.137.68.31; envelope-from=lw945lw945@yahoo.com;
 helo=sonic308-55.consmr.mail.gq1.yahoo.com
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

Give a better code struture to reduce more code duplication according
to the discuss in patch v2.

Signed-off-by: Wei Li <lw945lw945@yahoo.com>
---
 target/i386/tcg/translate.c | 41 +++++++++++++++++--------------------
 1 file changed, 19 insertions(+), 22 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 2a94d33742..9677f9576b 100644
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
@@ -5348,42 +5348,38 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
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
-                gen_op_mov_reg_v(s, ot, R_EAX, oldv);
+                gen_extu(ot, oldv);
+                gen_extu(ot, cmpv);
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
+                gen_op_mov_reg_v(s, ot, rm, newv);
             }
+            /* Perform the merge into %al or %ax as required by ot. */
+            gen_op_mov_reg_v(s, ot, R_EAX, oldv);
+            /* Undo the entire modification to %rax if comparison equal. */
+            tcg_gen_movcond_tl(TCG_COND_EQ, cpu_regs[R_EAX], oldv, cmpv,
+                                temp, cpu_regs[R_EAX]);
             tcg_gen_mov_tl(cpu_cc_src, oldv);
             tcg_gen_mov_tl(s->cc_srcT, cmpv);
             tcg_gen_sub_tl(cpu_cc_dst, cmpv, oldv);
@@ -5391,6 +5387,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
             tcg_temp_free(oldv);
             tcg_temp_free(newv);
             tcg_temp_free(cmpv);
+            tcg_temp_free(temp);
         }
         break;
     case 0x1c7: /* cmpxchg8b */
-- 
2.30.2


