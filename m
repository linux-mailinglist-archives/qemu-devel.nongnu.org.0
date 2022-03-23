Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F9E4E4A8E
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 02:37:55 +0100 (CET)
Received: from localhost ([::1]:34288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWpwg-0000cM-Jh
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 21:37:54 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lw945lw945@yahoo.com>)
 id 1nWptw-0006rE-3t
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 21:35:04 -0400
Received: from sonic310-22.consmr.mail.gq1.yahoo.com ([98.137.69.148]:39653)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <lw945lw945@yahoo.com>)
 id 1nWptt-0004gI-UN
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 21:35:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1647999299; bh=iuL+pYXFR/1Q2xa1m4m7zgR/lviDACFut2XIVUxIRJg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject:Reply-To;
 b=SebuD5sc8WC0lpFRBpRPw/cIf4gU9jv5z0jahAoTPmW625ec6ThsmEjwNYqCFgkRACNnCg3u5CjzOx25aVbsQOZceKYAaFrT3GrZOxuvzl3QSOALx0KIWnrXP/1Bra8rLURBRqMReg9wa+9dQA0CEmDouUGU/M6BCAtcj8DYrowNE4h5qAam1nqpqnUpwCWZ+cesADnLaHOKyuU4nnm028WsHdPPX+lyHV8qO72touZvMVQkL2W1fChtdc5fVUXEsJc/MTvEgnjN0J0N+1MXtIUfJbUuHHeJINboMDbLsHXeO2cVA8afGVY7rZ8oh2iVdaq0ABDuod0XK7FannemnQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1647999299; bh=+F/lyyFBQyswuzzTSU/myeLLpy7Dp7RLiRDSf4HSsji=;
 h=X-Sonic-MF:From:To:Subject:Date:From:Subject;
 b=b83i4W09kGDknVlDS+8ZIHh8QFkf9H/OOeHDImz2Vr9QnUCYC4c8eo3eNJNPR2nVVHSJCS2RDDGvcS6LUKsLnHtttfQ4RN80marmCe2nuMj4rRwz8SSknriEzFYZewo8jr/xPvrBOQJP1vwgHx6wNQjAXXeuwNOWibM+N3ubgByPgsab45El1O42ddjfgh+OB75yIqGsRBEJbuMx7DVNo9pRc69TFOEON8LhsY+JZjYwe4+sS6SWbcFmvS8aBup2r5URjpQzHVB4EIChOTAK/EXPnKJzMYOwRxf9glsYaZwc+nzepnzd7f0j0bn7LKarQQwV9VSI9fcBI6l7fhoJ8g==
X-YMail-OSG: Sdz3LBQVM1kTVL.brjgKulfr4tK9fnjf8YI534pGiUDlTxXwLUk4pM4RKkPV84V
 NNcwqN07vso6KXZtvz7NjuTG5Z8C6Gkvkh5SxpfrUa0TrMKy88DQgOmOW6A3RHAnTKqfDdZrF.jA
 8aVWAoSjsB2CxmcI6T6tk3l4Kp7tPg4xnTL26QrqugKG8G5sbx46DOUzFIa9aaAafbwRuH_92eL9
 0_YpT5nUq1scvalYvNLucRGWx_KZXPoJBSacz_m6eSyG0ZjtCun81Sr0sOtTopG90pzmcoctWYAR
 .DFhi7jfEDLX6djlzNk0RGB7NSIscIgKLpNwZmPDIlPgYmEgfmtobOvMQGtoRuW8ONCUsn7li6Ze
 wxuZ9bAxiQUo6rKuj_TQTkolvChHg.rAhP5HjeeoGh_luE6cfS5P6mcuhZJPdIh2HMfDHL1RowBM
 JgH5qC74XCRj2vTv8EiTzt7Mo1pGkQcBN5q2.GHAV.GZQxDYJ7QVwaQZlfLKoNbuxw6f35aL0_Y6
 l7Cdc2.ubGWbfEmTBGTbvNn05rTzF7T5tip3E1bYx34UXydQSxM.8U_OnCMzHjrPY2BxPpInFl2t
 EQ5lENQFYO4iIbm.1BDGvCVPNf31eV5C5utyku_fiue.pbSGJcPtxa6FdT5Exmc9xuYxvfNTHbSg
 ZUMK8_3hOWwOlwHDXUDH8Z94rFVIQEc5LQZMfZXsMmHIFkxgGRlHIp_QQDC.p7X5imIyNE82ttti
 IOa994_lTsVs_yMgZzomDFaF_tj9LaD3f4gX01xz5wIL9JYGjV0XJ5E6tFXUXAahaFMgU7RLrhnt
 WU1I0A2YqvoCa7uTtY.W9nyvoZDC.4W98zTz9MpdAliqkuk8nGvzIhz6TCZsfStz7XNETJizcdBb
 E_dmZ.Afp2jWj1c12PDCYsPjloWK8Q7knLd6QzXgAY702JBMQNKjP5TjuIS4QKPvUWq3kfv_Jz8n
 OgVLYOv35RO0fyFK2U0Ov7m2ugtTQAJESd1RRaer4Mbd87vqI6K5k0OZ1_VAfi6vaOSMXB_kXNbe
 0lrCBEjxO5n1MglqpIOGzQ2UbWmylcqhnNoBhFRuAS2l9oyy2pvF_JAamlMRs_FkVUiOmZ4y2GpQ
 67haYhR5nA08hzDBJYXqRn7e9HIH1shZNKhcbE2Qom0r.KVNbqzZ_fSJNzB_EC4WW01TKc8nHtCx
 7X__aNwxINX.6Oh9.blo5q3yu1z3cdVtxlYm_ybnRBqxIZlD_OPr1Z2UXXUk1MD8YfZP8vot_Kr3
 PTzjFsDUJbKH07pS6Q.Bp.uLzov2CYEl6Zk3b221trwqbsxUCgE38olKNKCjjqLNELAexiBZMSgY
 2HVRDvO3MJV14RNV4jchkngPEQjOCqY5WajV__Y_A.reaMu5l7u16h98zKEoNc_FfCDDKPabEM6D
 nrkL4ahHGO1b7DsFbsqeXiZ1lLPi35BeGhKiscBdiM8IUJqJUjhN1KRr6JKxi3S5FQLZongW64wT
 8ahfHnBZTYhhiPQXttO.2Uk5iorPe_WWA0YQugxXwCvp9u_eVqsz8Wl_fxx5CPjUUxzHizaZEojD
 CIZqnJilMCLp99eBrxdoaG2KdfYbsd9Swfwa6Tb9Nfw.6ozaZMLN3dpJmATUg_mXrARQRdYUmeBy
 PPYau9r21UyK3s09z.H7MdbjRRxEa7pbzwuX9oKw4S_wtV9VMGQJF1VG7KT_.0Dr5CU_n6sp1TBf
 mZwVfmAHASMuPaxfzscQEDAlsAraxA3NR8UsayOLdvpSpOVTrJaSwDTGxQQ4v2JLVzKloeJhnw4a
 bfPW8GRdiqtjvAvqsY0p8vHm7I6JrbT9S6cBop6.HCtJUwfmbmVG5QYSY9srG29CKRhEy2E4ZXaM
 yDsZeJGL4WpejQTmxakkaqdTYuNGY9vJoTAedSpxyvWnv_flU9xLiwd7UnPmC.ItICuRc18SXuTW
 2np.6lZsEENcW6tLXBSY1v5iDooMdjuv9JfjCUUlBY_auXWIEJpECnY7Y4PbI94zceNg1Jo2QgAX
 mNvVtZdT5gjF06An1I0xscRWs9AthkGxXTs1hSFi2ZESyopVnJrTOTog6eq.7FMkiTa3gx0vSkxg
 j7Z3IPKPV5vVJtxNM9twpUn.nkHF05GiEfx.VIm_zaL0xWoo8GCYpu4bodXKFDgin1ni7fQ4FZ4b
 3t89dhz5Q79wc10cD2LRsSsiT_vMb21wp1gJUYnShvxA22l84y74VDtkoPRJnhZv6OwC6TtxhsAB
 FyvXvWPdlWyNVzJwW5CPvbUsDsgqak0XmIuBRdXbXbuGXprottilNHnyU4HdRxWsrfHmj.h5MZYF
 2LgyIcQGMkCeG
X-Sonic-MF: <lw945lw945@yahoo.com>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic310.consmr.mail.gq1.yahoo.com with HTTP; Wed, 23 Mar 2022 01:34:59 +0000
Received: by kubenode520.mail-prod1.omega.ne1.yahoo.com (VZM Hermes SMTP
 Server) with ESMTPA ID ac04c3ae462fd6146ce4d7cc19a3e7ae; 
 Wed, 23 Mar 2022 01:34:55 +0000 (UTC)
From: Wei Li <lw945lw945@yahoo.com>
To: pbonzini@redhat.com,
	richard.henderson@linaro.org,
	eduardo@habkost.net
Cc: qemu-devel@nongnu.org
Subject: [PATCH v4 1/1] fix cmpxchg and lock cmpxchg instruction
Date: Wed, 23 Mar 2022 09:34:17 +0800
Message-Id: <20220323013417.409858-2-lw945lw945@yahoo.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220323013417.409858-1-lw945lw945@yahoo.com>
References: <20220323013417.409858-1-lw945lw945@yahoo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=98.137.69.148; envelope-from=lw945lw945@yahoo.com;
 helo=sonic310-22.consmr.mail.gq1.yahoo.com
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

This patch fixes a bug reported on issues #508.
The problem is cmpxchg and lock cmpxchg would touch accumulator when
the comparison is equal.

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


