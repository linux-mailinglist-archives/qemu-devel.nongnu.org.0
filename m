Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2AF35B51ED
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Sep 2022 01:31:47 +0200 (CEST)
Received: from localhost ([::1]:40670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXWQU-0006zd-Mt
	for lists+qemu-devel@lfdr.de; Sun, 11 Sep 2022 19:31:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oXW0i-0000e3-Gz
 for qemu-devel@nongnu.org; Sun, 11 Sep 2022 19:05:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36635)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oXW0g-0007CO-Fs
 for qemu-devel@nongnu.org; Sun, 11 Sep 2022 19:05:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662937505;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=helfURINZcnrcnmWQ0ZAJ5xU5St994WUFyONXZJwxwQ=;
 b=gdvkjMgQJL6Vv4k4BVpdU47JzE5iyJhdDPrhJAzkTDfWZqYUEKISrCuYvAG/AnEBsEyKTw
 KSd2hURAgLwDKNbR1Ijy13Kg693GMmXoYnMWoKkWDiN8AXzqRjDyLdpKYBQFNSZtKqIAaE
 8a4Hxry1ANLXfBGh8yeAL6yZcJm+E0Y=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-586-ufb8xmawMkafCxd5FFagTg-1; Sun, 11 Sep 2022 19:05:04 -0400
X-MC-Unique: ufb8xmawMkafCxd5FFagTg-1
Received: by mail-ed1-f70.google.com with SMTP id
 p4-20020a056402500400b00447e8b6f62bso5005922eda.17
 for <qemu-devel@nongnu.org>; Sun, 11 Sep 2022 16:05:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=helfURINZcnrcnmWQ0ZAJ5xU5St994WUFyONXZJwxwQ=;
 b=pFlBA1uArY0lv7DPZsyZmWpZ71EGXl/gyLnyZYQuAZ1QfpCEugarxbuCuNiwvgCgwJ
 N3IDrfWJ/xBUOQX61RQ9RRKxeFzM7pPNzrF6zPDFqgHZlqL5OnKfR6D89bFY9BJA19qV
 G5Z1zlzZxwORPnd8pvxlQAkJyFbx8L+a+vg7Gft0QUqU1Qq56qTHdlmMTfEQ1GPk0j3t
 VdMrM0NCPuD2AlXqJJBpkYkst8eYLfBWWAo8P3e89PA78ZbEPGh3uzjR6fr4xICRkPMK
 eoXSbjZwWBNrP1uciZC/xxKAZBw1AwJP+aEbLz2evFPyuA9NgSc3OnzUqePbzgo8fQhJ
 h0ew==
X-Gm-Message-State: ACgBeo17EqQVUXTtKAxhjTxn6szfMpxlJn7gXU4q+53AYGMQUWc406kC
 Wfi9R7IK6fkAHzfNsXRhx6UfqRAypcGQqGqdSjQDZpIwFUNQlyvjUbn9QeUAcG+rJ+1cBjcI5X4
 DymIHAWfCZigqUUiLcIzRHMwyf06D8GbQC6mcB2VNN/vu8rlWSLtQlE15bBMdsce+izE=
X-Received: by 2002:a17:907:2bcf:b0:772:4b8e:6b29 with SMTP id
 gv15-20020a1709072bcf00b007724b8e6b29mr14124678ejc.412.1662937503019; 
 Sun, 11 Sep 2022 16:05:03 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5EKchO/52fX11BA7//6YOLX4E4DrIFJmvZr1S6Gv3h296XXCFYNddFn2Cs23ULiqfMZYrvdQ==
X-Received: by 2002:a17:907:2bcf:b0:772:4b8e:6b29 with SMTP id
 gv15-20020a1709072bcf00b007724b8e6b29mr14124661ejc.412.1662937502544; 
 Sun, 11 Sep 2022 16:05:02 -0700 (PDT)
Received: from goa-sendmail (93-44-39-154.ip95.fastwebnet.it. [93.44.39.154])
 by smtp.gmail.com with ESMTPSA id
 2-20020a170906210200b00715a02874acsm3536999ejt.35.2022.09.11.16.05.01
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Sep 2022 16:05:02 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 13/37] target/i386: remove scalar VEX instructions from old
 decoder
Date: Mon, 12 Sep 2022 01:03:53 +0200
Message-Id: <20220911230418.340941-14-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220911230418.340941-1-pbonzini@redhat.com>
References: <20220911230418.340941-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is all dead code, since the VEX prefix goes straight to the new decoder.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/tcg/translate.c | 243 ------------------------------------
 1 file changed, 243 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 7eed575f2e..240811bd49 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -4119,151 +4119,6 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                                        s->mem_index, ot | MO_BE);
                 }
                 break;
-
-            case 0x0f2: /* andn Gy, By, Ey */
-                if (!(s->cpuid_7_0_ebx_features & CPUID_7_0_EBX_BMI1)
-                    || !(s->prefix & PREFIX_VEX)
-                    || s->vex_l != 0) {
-                    goto illegal_op;
-                }
-                ot = mo_64_32(s->dflag);
-                gen_ldst_modrm(env, s, modrm, ot, OR_TMP0, 0);
-                tcg_gen_andc_tl(s->T0, s->T0, cpu_regs[s->vex_v]);
-                gen_op_mov_reg_v(s, ot, reg, s->T0);
-                gen_op_update1_cc(s);
-                set_cc_op(s, CC_OP_LOGICB + ot);
-                break;
-
-            case 0x0f7: /* bextr Gy, Ey, By */
-                if (!(s->cpuid_7_0_ebx_features & CPUID_7_0_EBX_BMI1)
-                    || !(s->prefix & PREFIX_VEX)
-                    || s->vex_l != 0) {
-                    goto illegal_op;
-                }
-                ot = mo_64_32(s->dflag);
-                {
-                    TCGv bound, zero;
-
-                    gen_ldst_modrm(env, s, modrm, ot, OR_TMP0, 0);
-                    /* Extract START, and shift the operand.
-                       Shifts larger than operand size get zeros.  */
-                    tcg_gen_ext8u_tl(s->A0, cpu_regs[s->vex_v]);
-                    tcg_gen_shr_tl(s->T0, s->T0, s->A0);
-
-                    bound = tcg_const_tl(ot == MO_64 ? 63 : 31);
-                    zero = tcg_const_tl(0);
-                    tcg_gen_movcond_tl(TCG_COND_LEU, s->T0, s->A0, bound,
-                                       s->T0, zero);
-                    tcg_temp_free(zero);
-
-                    /* Extract the LEN into a mask.  Lengths larger than
-                       operand size get all ones.  */
-                    tcg_gen_extract_tl(s->A0, cpu_regs[s->vex_v], 8, 8);
-                    tcg_gen_movcond_tl(TCG_COND_LEU, s->A0, s->A0, bound,
-                                       s->A0, bound);
-                    tcg_temp_free(bound);
-                    tcg_gen_movi_tl(s->T1, 1);
-                    tcg_gen_shl_tl(s->T1, s->T1, s->A0);
-                    tcg_gen_subi_tl(s->T1, s->T1, 1);
-                    tcg_gen_and_tl(s->T0, s->T0, s->T1);
-
-                    gen_op_mov_reg_v(s, ot, reg, s->T0);
-                    gen_op_update1_cc(s);
-                    set_cc_op(s, CC_OP_LOGICB + ot);
-                }
-                break;
-
-            case 0x0f5: /* bzhi Gy, Ey, By */
-                if (!(s->cpuid_7_0_ebx_features & CPUID_7_0_EBX_BMI2)
-                    || !(s->prefix & PREFIX_VEX)
-                    || s->vex_l != 0) {
-                    goto illegal_op;
-                }
-                ot = mo_64_32(s->dflag);
-                gen_ldst_modrm(env, s, modrm, ot, OR_TMP0, 0);
-                tcg_gen_ext8u_tl(s->T1, cpu_regs[s->vex_v]);
-                {
-                    TCGv bound = tcg_const_tl(ot == MO_64 ? 63 : 31);
-                    /* Note that since we're using BMILG (in order to get O
-                       cleared) we need to store the inverse into C.  */
-                    tcg_gen_setcond_tl(TCG_COND_LT, cpu_cc_src,
-                                       s->T1, bound);
-                    tcg_gen_movcond_tl(TCG_COND_GT, s->T1, s->T1,
-                                       bound, bound, s->T1);
-                    tcg_temp_free(bound);
-                }
-                tcg_gen_movi_tl(s->A0, -1);
-                tcg_gen_shl_tl(s->A0, s->A0, s->T1);
-                tcg_gen_andc_tl(s->T0, s->T0, s->A0);
-                gen_op_mov_reg_v(s, ot, reg, s->T0);
-                gen_op_update1_cc(s);
-                set_cc_op(s, CC_OP_BMILGB + ot);
-                break;
-
-            case 0x3f6: /* mulx By, Gy, rdx, Ey */
-                if (!(s->cpuid_7_0_ebx_features & CPUID_7_0_EBX_BMI2)
-                    || !(s->prefix & PREFIX_VEX)
-                    || s->vex_l != 0) {
-                    goto illegal_op;
-                }
-                ot = mo_64_32(s->dflag);
-                gen_ldst_modrm(env, s, modrm, ot, OR_TMP0, 0);
-                switch (ot) {
-                default:
-                    tcg_gen_trunc_tl_i32(s->tmp2_i32, s->T0);
-                    tcg_gen_trunc_tl_i32(s->tmp3_i32, cpu_regs[R_EDX]);
-                    tcg_gen_mulu2_i32(s->tmp2_i32, s->tmp3_i32,
-                                      s->tmp2_i32, s->tmp3_i32);
-                    tcg_gen_extu_i32_tl(cpu_regs[s->vex_v], s->tmp2_i32);
-                    tcg_gen_extu_i32_tl(cpu_regs[reg], s->tmp3_i32);
-                    break;
-#ifdef TARGET_X86_64
-                case MO_64:
-                    tcg_gen_mulu2_i64(s->T0, s->T1,
-                                      s->T0, cpu_regs[R_EDX]);
-                    tcg_gen_mov_i64(cpu_regs[s->vex_v], s->T0);
-                    tcg_gen_mov_i64(cpu_regs[reg], s->T1);
-                    break;
-#endif
-                }
-                break;
-
-            case 0x3f5: /* pdep Gy, By, Ey */
-                if (!(s->cpuid_7_0_ebx_features & CPUID_7_0_EBX_BMI2)
-                    || !(s->prefix & PREFIX_VEX)
-                    || s->vex_l != 0) {
-                    goto illegal_op;
-                }
-                ot = mo_64_32(s->dflag);
-                gen_ldst_modrm(env, s, modrm, ot, OR_TMP0, 0);
-                /* Note that by zero-extending the source operand, we
-                   automatically handle zero-extending the result.  */
-                if (ot == MO_64) {
-                    tcg_gen_mov_tl(s->T1, cpu_regs[s->vex_v]);
-                } else {
-                    tcg_gen_ext32u_tl(s->T1, cpu_regs[s->vex_v]);
-                }
-                gen_helper_pdep(cpu_regs[reg], s->T1, s->T0);
-                break;
-
-            case 0x2f5: /* pext Gy, By, Ey */
-                if (!(s->cpuid_7_0_ebx_features & CPUID_7_0_EBX_BMI2)
-                    || !(s->prefix & PREFIX_VEX)
-                    || s->vex_l != 0) {
-                    goto illegal_op;
-                }
-                ot = mo_64_32(s->dflag);
-                gen_ldst_modrm(env, s, modrm, ot, OR_TMP0, 0);
-                /* Note that by zero-extending the source operand, we
-                   automatically handle zero-extending the result.  */
-                if (ot == MO_64) {
-                    tcg_gen_mov_tl(s->T1, cpu_regs[s->vex_v]);
-                } else {
-                    tcg_gen_ext32u_tl(s->T1, cpu_regs[s->vex_v]);
-                }
-                gen_helper_pext(cpu_regs[reg], s->T1, s->T0);
-                break;
-
             case 0x1f6: /* adcx Gy, Ey */
             case 0x2f6: /* adox Gy, Ey */
                 CHECK_NO_VEX(s);
@@ -4343,73 +4198,6 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                 }
                 break;
 
-            case 0x1f7: /* shlx Gy, Ey, By */
-            case 0x2f7: /* sarx Gy, Ey, By */
-            case 0x3f7: /* shrx Gy, Ey, By */
-                if (!(s->cpuid_7_0_ebx_features & CPUID_7_0_EBX_BMI2)
-                    || !(s->prefix & PREFIX_VEX)
-                    || s->vex_l != 0) {
-                    goto illegal_op;
-                }
-                ot = mo_64_32(s->dflag);
-                gen_ldst_modrm(env, s, modrm, ot, OR_TMP0, 0);
-                if (ot == MO_64) {
-                    tcg_gen_andi_tl(s->T1, cpu_regs[s->vex_v], 63);
-                } else {
-                    tcg_gen_andi_tl(s->T1, cpu_regs[s->vex_v], 31);
-                }
-                if (b == 0x1f7) {
-                    tcg_gen_shl_tl(s->T0, s->T0, s->T1);
-                } else if (b == 0x2f7) {
-                    if (ot != MO_64) {
-                        tcg_gen_ext32s_tl(s->T0, s->T0);
-                    }
-                    tcg_gen_sar_tl(s->T0, s->T0, s->T1);
-                } else {
-                    if (ot != MO_64) {
-                        tcg_gen_ext32u_tl(s->T0, s->T0);
-                    }
-                    tcg_gen_shr_tl(s->T0, s->T0, s->T1);
-                }
-                gen_op_mov_reg_v(s, ot, reg, s->T0);
-                break;
-
-            case 0x0f3:
-            case 0x1f3:
-            case 0x2f3:
-            case 0x3f3: /* Group 17 */
-                if (!(s->cpuid_7_0_ebx_features & CPUID_7_0_EBX_BMI1)
-                    || !(s->prefix & PREFIX_VEX)
-                    || s->vex_l != 0) {
-                    goto illegal_op;
-                }
-                ot = mo_64_32(s->dflag);
-                gen_ldst_modrm(env, s, modrm, ot, OR_TMP0, 0);
-
-                tcg_gen_mov_tl(cpu_cc_src, s->T0);
-                switch (reg & 7) {
-                case 1: /* blsr By,Ey */
-                    tcg_gen_subi_tl(s->T1, s->T0, 1);
-                    tcg_gen_and_tl(s->T0, s->T0, s->T1);
-                    break;
-                case 2: /* blsmsk By,Ey */
-                    tcg_gen_subi_tl(s->T1, s->T0, 1);
-                    tcg_gen_xor_tl(s->T0, s->T0, s->T1);
-                    break;
-                case 3: /* blsi By, Ey */
-                    tcg_gen_neg_tl(s->T1, s->T0);
-                    tcg_gen_and_tl(s->T0, s->T0, s->T1);
-                    break;
-                default:
-                    goto unknown_op;
-                }
-                tcg_gen_mov_tl(cpu_cc_dst, s->T0);
-                gen_op_mov_reg_v(s, ot, s->vex_v, s->T0);
-                set_cc_op(s, CC_OP_BMILGB + ot);
-                break;
-
-            default:
-                goto unknown_op;
             }
             break;
 
@@ -4625,37 +4413,6 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
             }
             break;
 
-        case 0x33a:
-            /* Various integer extensions at 0f 3a f[0-f].  */
-            b = modrm | (b1 << 8);
-            modrm = x86_ldub_code(env, s);
-            reg = ((modrm >> 3) & 7) | REX_R(s);
-
-            switch (b) {
-            case 0x3f0: /* rorx Gy,Ey, Ib */
-                if (!(s->cpuid_7_0_ebx_features & CPUID_7_0_EBX_BMI2)
-                    || !(s->prefix & PREFIX_VEX)
-                    || s->vex_l != 0) {
-                    goto illegal_op;
-                }
-                ot = mo_64_32(s->dflag);
-                gen_ldst_modrm(env, s, modrm, ot, OR_TMP0, 0);
-                b = x86_ldub_code(env, s);
-                if (ot == MO_64) {
-                    tcg_gen_rotri_tl(s->T0, s->T0, b & 63);
-                } else {
-                    tcg_gen_trunc_tl_i32(s->tmp2_i32, s->T0);
-                    tcg_gen_rotri_i32(s->tmp2_i32, s->tmp2_i32, b & 31);
-                    tcg_gen_extu_i32_tl(s->T0, s->tmp2_i32);
-                }
-                gen_op_mov_reg_v(s, ot, reg, s->T0);
-                break;
-
-            default:
-                goto unknown_op;
-            }
-            break;
-
         default:
         unknown_op:
             gen_unknown_opcode(env, s);
-- 
2.37.2



