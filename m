Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A521E395155
	for <lists+qemu-devel@lfdr.de>; Sun, 30 May 2021 16:41:14 +0200 (CEST)
Received: from localhost ([::1]:52108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lnMcr-0006bU-Ok
	for lists+qemu-devel@lfdr.de; Sun, 30 May 2021 10:41:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ziqiaokong@gmail.com>)
 id 1lnMbS-0005vH-M8
 for qemu-devel@nongnu.org; Sun, 30 May 2021 10:39:47 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:36861)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ziqiaokong@gmail.com>)
 id 1lnMbL-00082K-EE
 for qemu-devel@nongnu.org; Sun, 30 May 2021 10:39:44 -0400
Received: by mail-pg1-x531.google.com with SMTP id 27so6404697pgy.3
 for <qemu-devel@nongnu.org>; Sun, 30 May 2021 07:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=llNQS2DaZCUmIt/daKMLoqPKHmgy55nsTdIo0l4B9PQ=;
 b=a+nh4HdwbKoXEdh22kHfjuwsI7T6PmuAddwuCsG5eqXE67BuJO/1IkNUfTWEwTQ9M6
 GI2rGxxiq2TezUyVf3TvyF6TPhGHnrKtSBOcvX1XsUSuxICXnxU7LyFBfb2minfpbUXo
 Ve4xM4x28pcXaJ458E/9BoPiHCAv3bCCUSKotDQvZNwvFezWbmwkJXzXzb6HktBu5MzX
 VSL3QKLYHbhvKQ3svy0mdOMdbHOAZ63NHOjlRCRCPY0uMvYZeI9WsjuNiIwu0oUPNrFj
 q+I/9Y2fa+UNEHObQOE7+LviDPHzDM9Co8YZYPTdSQ56tNAY+MRZuzmQlD4mDbHKJ+qT
 cJEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=llNQS2DaZCUmIt/daKMLoqPKHmgy55nsTdIo0l4B9PQ=;
 b=O3qWWuomIIAkQPnxQXrmTXokFryrn20+XYBm5fwCiSaedxHLV7BBi/hbpQ1AHf8IMe
 fqRny6Ip/FSUx+LOg1vdG3EZUWaR8V84U4uA/zhsSYWEQNzdNGVJuweeFkTSTaRxdygi
 2rZuP70wOgsaSaeXWXMpe1c/axS5buNzgXVlLVOPPBoa85HlfYpa3VOiZCuu7TdiolDr
 zKDIESApDjTHkZrJtIvU6hCgBKhcL+cc5g+mX9xHR9qYRsr6nsvzFJKoN6AM8eZOA5Nd
 sCTCMrgsS6gfZvVnnBCzpOZHvh/88pZ1C18WyxBJ5G9cSkFpkALMAA4LPwt7pJLz+XZn
 ATJA==
X-Gm-Message-State: AOAM532K7DuCyhZO02idmw7rcIGq6czSypRbGGQ91RJX12+BwjZ02MQF
 /zgJZu+bKW01Wv765DzkIeus8HqzbHk=
X-Google-Smtp-Source: ABdhPJyuYhhkzZwIlyWidhRIxwolRPHiTS+mrS7TyBQxfawJjmbdR629SIWCrc71TGUTR0ZcaSJNQQ==
X-Received: by 2002:aa7:8f3a:0:b029:2e9:c63a:312e with SMTP id
 y26-20020aa78f3a0000b02902e9c63a312emr3232444pfr.73.1622385576946; 
 Sun, 30 May 2021 07:39:36 -0700 (PDT)
Received: from crdev.local ([104.160.18.162])
 by smtp.gmail.com with ESMTPSA id p1sm8471800pfp.137.2021.05.30.07.39.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 May 2021 07:39:36 -0700 (PDT)
From: Ziqiao Kong <ziqiaokong@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 1/2] target/i386: Trivial code motion and code style fix
Date: Sun, 30 May 2021 22:38:30 +0800
Message-Id: <20210530143830.72373-1-ziqiaokong@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=ziqiaokong@gmail.com; helo=mail-pg1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: pbonzini@redhat.com, richard.henderson@linaro.org, ehabkost@redhat.com,
 Ziqiao Kong <ziqiaokong@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

A new pair of braces has to be added to declare variables in the case block.
The code style is also fixed according to the transalte.c itself during the
code motion.

Signed-off-by: Ziqiao Kong <ziqiaokong@gmail.com>
---
Sorry for duplicate emails due to my bad network.
Changes since v5:
- None
Changes since v4:
- Rewrite commit message to specify the reason to add the braces.
---
 target/i386/tcg/translate.c | 957 ++++++++++++++++++------------------
 1 file changed, 484 insertions(+), 473 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 834186bcae..5c1b7b87c5 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -5929,503 +5929,514 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         /************************/
         /* floats */
     case 0xd8 ... 0xdf:
-        if (s->flags & (HF_EM_MASK | HF_TS_MASK)) {
-            /* if CR0.EM or CR0.TS are set, generate an FPU exception */
-            /* XXX: what to do if illegal op ? */
-            gen_exception(s, EXCP07_PREX, pc_start - s->cs_base);
-            break;
-        }
-        modrm = x86_ldub_code(env, s);
-        mod = (modrm >> 6) & 3;
-        rm = modrm & 7;
-        op = ((b & 7) << 3) | ((modrm >> 3) & 7);
-        if (mod != 3) {
-            /* memory op */
-            gen_lea_modrm(env, s, modrm);
-            switch(op) {
-            case 0x00 ... 0x07: /* fxxxs */
-            case 0x10 ... 0x17: /* fixxxl */
-            case 0x20 ... 0x27: /* fxxxl */
-            case 0x30 ... 0x37: /* fixxx */
-                {
-                    int op1;
-                    op1 = op & 7;
-
-                    switch(op >> 4) {
-                    case 0:
-                        tcg_gen_qemu_ld_i32(s->tmp2_i32, s->A0,
-                                            s->mem_index, MO_LEUL);
-                        gen_helper_flds_FT0(cpu_env, s->tmp2_i32);
-                        break;
-                    case 1:
-                        tcg_gen_qemu_ld_i32(s->tmp2_i32, s->A0,
-                                            s->mem_index, MO_LEUL);
-                        gen_helper_fildl_FT0(cpu_env, s->tmp2_i32);
-                        break;
-                    case 2:
-                        tcg_gen_qemu_ld_i64(s->tmp1_i64, s->A0,
-                                            s->mem_index, MO_LEQ);
-                        gen_helper_fldl_FT0(cpu_env, s->tmp1_i64);
-                        break;
-                    case 3:
-                    default:
-                        tcg_gen_qemu_ld_i32(s->tmp2_i32, s->A0,
-                                            s->mem_index, MO_LESW);
-                        gen_helper_fildl_FT0(cpu_env, s->tmp2_i32);
-                        break;
-                    }
-
-                    gen_helper_fp_arith_ST0_FT0(op1);
-                    if (op1 == 3) {
-                        /* fcomp needs pop */
-                        gen_helper_fpop(cpu_env);
-                    }
-                }
+        {
+            if (s->flags & (HF_EM_MASK | HF_TS_MASK)) {
+                /* if CR0.EM or CR0.TS are set, generate an FPU exception */
+                /* XXX: what to do if illegal op ? */
+                gen_exception(s, EXCP07_PREX, pc_start - s->cs_base);
                 break;
-            case 0x08: /* flds */
-            case 0x0a: /* fsts */
-            case 0x0b: /* fstps */
-            case 0x18 ... 0x1b: /* fildl, fisttpl, fistl, fistpl */
-            case 0x28 ... 0x2b: /* fldl, fisttpll, fstl, fstpl */
-            case 0x38 ... 0x3b: /* filds, fisttps, fists, fistps */
-                switch(op & 7) {
-                case 0:
-                    switch(op >> 4) {
-                    case 0:
-                        tcg_gen_qemu_ld_i32(s->tmp2_i32, s->A0,
-                                            s->mem_index, MO_LEUL);
-                        gen_helper_flds_ST0(cpu_env, s->tmp2_i32);
-                        break;
-                    case 1:
-                        tcg_gen_qemu_ld_i32(s->tmp2_i32, s->A0,
-                                            s->mem_index, MO_LEUL);
-                        gen_helper_fildl_ST0(cpu_env, s->tmp2_i32);
-                        break;
-                    case 2:
-                        tcg_gen_qemu_ld_i64(s->tmp1_i64, s->A0,
-                                            s->mem_index, MO_LEQ);
-                        gen_helper_fldl_ST0(cpu_env, s->tmp1_i64);
-                        break;
-                    case 3:
-                    default:
-                        tcg_gen_qemu_ld_i32(s->tmp2_i32, s->A0,
-                                            s->mem_index, MO_LESW);
-                        gen_helper_fildl_ST0(cpu_env, s->tmp2_i32);
-                        break;
-                    }
-                    break;
-                case 1:
-                    /* XXX: the corresponding CPUID bit must be tested ! */
-                    switch(op >> 4) {
-                    case 1:
-                        gen_helper_fisttl_ST0(s->tmp2_i32, cpu_env);
-                        tcg_gen_qemu_st_i32(s->tmp2_i32, s->A0,
-                                            s->mem_index, MO_LEUL);
-                        break;
-                    case 2:
-                        gen_helper_fisttll_ST0(s->tmp1_i64, cpu_env);
-                        tcg_gen_qemu_st_i64(s->tmp1_i64, s->A0,
-                                            s->mem_index, MO_LEQ);
-                        break;
-                    case 3:
-                    default:
-                        gen_helper_fistt_ST0(s->tmp2_i32, cpu_env);
-                        tcg_gen_qemu_st_i32(s->tmp2_i32, s->A0,
-                                            s->mem_index, MO_LEUW);
-                        break;
-                    }
-                    gen_helper_fpop(cpu_env);
-                    break;
-                default:
-                    switch(op >> 4) {
-                    case 0:
-                        gen_helper_fsts_ST0(s->tmp2_i32, cpu_env);
-                        tcg_gen_qemu_st_i32(s->tmp2_i32, s->A0,
-                                            s->mem_index, MO_LEUL);
-                        break;
-                    case 1:
-                        gen_helper_fistl_ST0(s->tmp2_i32, cpu_env);
-                        tcg_gen_qemu_st_i32(s->tmp2_i32, s->A0,
-                                            s->mem_index, MO_LEUL);
-                        break;
-                    case 2:
-                        gen_helper_fstl_ST0(s->tmp1_i64, cpu_env);
-                        tcg_gen_qemu_st_i64(s->tmp1_i64, s->A0,
-                                            s->mem_index, MO_LEQ);
-                        break;
-                    case 3:
-                    default:
-                        gen_helper_fist_ST0(s->tmp2_i32, cpu_env);
-                        tcg_gen_qemu_st_i32(s->tmp2_i32, s->A0,
-                                            s->mem_index, MO_LEUW);
-                        break;
-                    }
-                    if ((op & 7) == 3)
-                        gen_helper_fpop(cpu_env);
-                    break;
-                }
-                break;
-            case 0x0c: /* fldenv mem */
-                gen_helper_fldenv(cpu_env, s->A0, tcg_const_i32(dflag - 1));
-                break;
-            case 0x0d: /* fldcw mem */
-                tcg_gen_qemu_ld_i32(s->tmp2_i32, s->A0,
-                                    s->mem_index, MO_LEUW);
-                gen_helper_fldcw(cpu_env, s->tmp2_i32);
-                break;
-            case 0x0e: /* fnstenv mem */
-                gen_helper_fstenv(cpu_env, s->A0, tcg_const_i32(dflag - 1));
-                break;
-            case 0x0f: /* fnstcw mem */
-                gen_helper_fnstcw(s->tmp2_i32, cpu_env);
-                tcg_gen_qemu_st_i32(s->tmp2_i32, s->A0,
-                                    s->mem_index, MO_LEUW);
-                break;
-            case 0x1d: /* fldt mem */
-                gen_helper_fldt_ST0(cpu_env, s->A0);
-                break;
-            case 0x1f: /* fstpt mem */
-                gen_helper_fstt_ST0(cpu_env, s->A0);
-                gen_helper_fpop(cpu_env);
-                break;
-            case 0x2c: /* frstor mem */
-                gen_helper_frstor(cpu_env, s->A0, tcg_const_i32(dflag - 1));
-                break;
-            case 0x2e: /* fnsave mem */
-                gen_helper_fsave(cpu_env, s->A0, tcg_const_i32(dflag - 1));
-                break;
-            case 0x2f: /* fnstsw mem */
-                gen_helper_fnstsw(s->tmp2_i32, cpu_env);
-                tcg_gen_qemu_st_i32(s->tmp2_i32, s->A0,
-                                    s->mem_index, MO_LEUW);
-                break;
-            case 0x3c: /* fbld */
-                gen_helper_fbld_ST0(cpu_env, s->A0);
-                break;
-            case 0x3e: /* fbstp */
-                gen_helper_fbst_ST0(cpu_env, s->A0);
-                gen_helper_fpop(cpu_env);
-                break;
-            case 0x3d: /* fildll */
-                tcg_gen_qemu_ld_i64(s->tmp1_i64, s->A0, s->mem_index, MO_LEQ);
-                gen_helper_fildll_ST0(cpu_env, s->tmp1_i64);
-                break;
-            case 0x3f: /* fistpll */
-                gen_helper_fistll_ST0(s->tmp1_i64, cpu_env);
-                tcg_gen_qemu_st_i64(s->tmp1_i64, s->A0, s->mem_index, MO_LEQ);
-                gen_helper_fpop(cpu_env);
-                break;
-            default:
-                goto unknown_op;
             }
-        } else {
-            /* register float ops */
-            opreg = rm;
+            modrm = x86_ldub_code(env, s);
+            mod = (modrm >> 6) & 3;
+            rm = modrm & 7;
+            op = ((b & 7) << 3) | ((modrm >> 3) & 7);
+            if (mod != 3) {
+                /* memory op */
+                gen_lea_modrm(env, s, modrm);
+                switch (op) {
+                case 0x00 ... 0x07: /* fxxxs */
+                case 0x10 ... 0x17: /* fixxxl */
+                case 0x20 ... 0x27: /* fxxxl */
+                case 0x30 ... 0x37: /* fixxx */
+                    {
+                        int op1;
+                        op1 = op & 7;
 
-            switch(op) {
-            case 0x08: /* fld sti */
-                gen_helper_fpush(cpu_env);
-                gen_helper_fmov_ST0_STN(cpu_env,
-                                        tcg_const_i32((opreg + 1) & 7));
-                break;
-            case 0x09: /* fxchg sti */
-            case 0x29: /* fxchg4 sti, undocumented op */
-            case 0x39: /* fxchg7 sti, undocumented op */
-                gen_helper_fxchg_ST0_STN(cpu_env, tcg_const_i32(opreg));
-                break;
-            case 0x0a: /* grp d9/2 */
-                switch(rm) {
-                case 0: /* fnop */
-                    /* check exceptions (FreeBSD FPU probe) */
-                    gen_helper_fwait(cpu_env);
-                    break;
-                default:
-                    goto unknown_op;
-                }
-                break;
-            case 0x0c: /* grp d9/4 */
-                switch(rm) {
-                case 0: /* fchs */
-                    gen_helper_fchs_ST0(cpu_env);
-                    break;
-                case 1: /* fabs */
-                    gen_helper_fabs_ST0(cpu_env);
-                    break;
-                case 4: /* ftst */
-                    gen_helper_fldz_FT0(cpu_env);
-                    gen_helper_fcom_ST0_FT0(cpu_env);
-                    break;
-                case 5: /* fxam */
-                    gen_helper_fxam_ST0(cpu_env);
-                    break;
-                default:
-                    goto unknown_op;
-                }
-                break;
-            case 0x0d: /* grp d9/5 */
-                {
-                    switch(rm) {
-                    case 0:
-                        gen_helper_fpush(cpu_env);
-                        gen_helper_fld1_ST0(cpu_env);
-                        break;
-                    case 1:
-                        gen_helper_fpush(cpu_env);
-                        gen_helper_fldl2t_ST0(cpu_env);
-                        break;
-                    case 2:
-                        gen_helper_fpush(cpu_env);
-                        gen_helper_fldl2e_ST0(cpu_env);
-                        break;
-                    case 3:
-                        gen_helper_fpush(cpu_env);
-                        gen_helper_fldpi_ST0(cpu_env);
-                        break;
-                    case 4:
-                        gen_helper_fpush(cpu_env);
-                        gen_helper_fldlg2_ST0(cpu_env);
-                        break;
-                    case 5:
-                        gen_helper_fpush(cpu_env);
-                        gen_helper_fldln2_ST0(cpu_env);
-                        break;
-                    case 6:
-                        gen_helper_fpush(cpu_env);
-                        gen_helper_fldz_ST0(cpu_env);
-                        break;
-                    default:
-                        goto unknown_op;
-                    }
-                }
-                break;
-            case 0x0e: /* grp d9/6 */
-                switch(rm) {
-                case 0: /* f2xm1 */
-                    gen_helper_f2xm1(cpu_env);
-                    break;
-                case 1: /* fyl2x */
-                    gen_helper_fyl2x(cpu_env);
-                    break;
-                case 2: /* fptan */
-                    gen_helper_fptan(cpu_env);
-                    break;
-                case 3: /* fpatan */
-                    gen_helper_fpatan(cpu_env);
-                    break;
-                case 4: /* fxtract */
-                    gen_helper_fxtract(cpu_env);
-                    break;
-                case 5: /* fprem1 */
-                    gen_helper_fprem1(cpu_env);
-                    break;
-                case 6: /* fdecstp */
-                    gen_helper_fdecstp(cpu_env);
-                    break;
-                default:
-                case 7: /* fincstp */
-                    gen_helper_fincstp(cpu_env);
-                    break;
-                }
-                break;
-            case 0x0f: /* grp d9/7 */
-                switch(rm) {
-                case 0: /* fprem */
-                    gen_helper_fprem(cpu_env);
-                    break;
-                case 1: /* fyl2xp1 */
-                    gen_helper_fyl2xp1(cpu_env);
-                    break;
-                case 2: /* fsqrt */
-                    gen_helper_fsqrt(cpu_env);
-                    break;
-                case 3: /* fsincos */
-                    gen_helper_fsincos(cpu_env);
-                    break;
-                case 5: /* fscale */
-                    gen_helper_fscale(cpu_env);
-                    break;
-                case 4: /* frndint */
-                    gen_helper_frndint(cpu_env);
-                    break;
-                case 6: /* fsin */
-                    gen_helper_fsin(cpu_env);
-                    break;
-                default:
-                case 7: /* fcos */
-                    gen_helper_fcos(cpu_env);
-                    break;
-                }
-                break;
-            case 0x00: case 0x01: case 0x04 ... 0x07: /* fxxx st, sti */
-            case 0x20: case 0x21: case 0x24 ... 0x27: /* fxxx sti, st */
-            case 0x30: case 0x31: case 0x34 ... 0x37: /* fxxxp sti, st */
-                {
-                    int op1;
+                        switch (op >> 4) {
+                        case 0:
+                            tcg_gen_qemu_ld_i32(s->tmp2_i32, s->A0,
+                                                s->mem_index, MO_LEUL);
+                            gen_helper_flds_FT0(cpu_env, s->tmp2_i32);
+                            break;
+                        case 1:
+                            tcg_gen_qemu_ld_i32(s->tmp2_i32, s->A0,
+                                                s->mem_index, MO_LEUL);
+                            gen_helper_fildl_FT0(cpu_env, s->tmp2_i32);
+                            break;
+                        case 2:
+                            tcg_gen_qemu_ld_i64(s->tmp1_i64, s->A0,
+                                                s->mem_index, MO_LEQ);
+                            gen_helper_fldl_FT0(cpu_env, s->tmp1_i64);
+                            break;
+                        case 3:
+                        default:
+                            tcg_gen_qemu_ld_i32(s->tmp2_i32, s->A0,
+                                                s->mem_index, MO_LESW);
+                            gen_helper_fildl_FT0(cpu_env, s->tmp2_i32);
+                            break;
+                        }
 
-                    op1 = op & 7;
-                    if (op >= 0x20) {
-                        gen_helper_fp_arith_STN_ST0(op1, opreg);
-                        if (op >= 0x30)
-                            gen_helper_fpop(cpu_env);
-                    } else {
-                        gen_helper_fmov_FT0_STN(cpu_env, tcg_const_i32(opreg));
                         gen_helper_fp_arith_ST0_FT0(op1);
+                        if (op1 == 3) {
+                            /* fcomp needs pop */
+                            gen_helper_fpop(cpu_env);
+                        }
                     }
-                }
-                break;
-            case 0x02: /* fcom */
-            case 0x22: /* fcom2, undocumented op */
-                gen_helper_fmov_FT0_STN(cpu_env, tcg_const_i32(opreg));
-                gen_helper_fcom_ST0_FT0(cpu_env);
-                break;
-            case 0x03: /* fcomp */
-            case 0x23: /* fcomp3, undocumented op */
-            case 0x32: /* fcomp5, undocumented op */
-                gen_helper_fmov_FT0_STN(cpu_env, tcg_const_i32(opreg));
-                gen_helper_fcom_ST0_FT0(cpu_env);
-                gen_helper_fpop(cpu_env);
-                break;
-            case 0x15: /* da/5 */
-                switch(rm) {
-                case 1: /* fucompp */
-                    gen_helper_fmov_FT0_STN(cpu_env, tcg_const_i32(1));
-                    gen_helper_fucom_ST0_FT0(cpu_env);
-                    gen_helper_fpop(cpu_env);
-                    gen_helper_fpop(cpu_env);
                     break;
-                default:
-                    goto unknown_op;
-                }
-                break;
-            case 0x1c:
-                switch(rm) {
-                case 0: /* feni (287 only, just do nop here) */
+                case 0x08: /* flds */
+                case 0x0a: /* fsts */
+                case 0x0b: /* fstps */
+                case 0x18 ... 0x1b: /* fildl, fisttpl, fistl, fistpl */
+                case 0x28 ... 0x2b: /* fldl, fisttpll, fstl, fstpl */
+                case 0x38 ... 0x3b: /* filds, fisttps, fists, fistps */
+                    switch (op & 7) {
+                    case 0:
+                        switch (op >> 4) {
+                        case 0:
+                            tcg_gen_qemu_ld_i32(s->tmp2_i32, s->A0,
+                                                s->mem_index, MO_LEUL);
+                            gen_helper_flds_ST0(cpu_env, s->tmp2_i32);
+                            break;
+                        case 1:
+                            tcg_gen_qemu_ld_i32(s->tmp2_i32, s->A0,
+                                                s->mem_index, MO_LEUL);
+                            gen_helper_fildl_ST0(cpu_env, s->tmp2_i32);
+                            break;
+                        case 2:
+                            tcg_gen_qemu_ld_i64(s->tmp1_i64, s->A0,
+                                                s->mem_index, MO_LEQ);
+                            gen_helper_fldl_ST0(cpu_env, s->tmp1_i64);
+                            break;
+                        case 3:
+                        default:
+                            tcg_gen_qemu_ld_i32(s->tmp2_i32, s->A0,
+                                                s->mem_index, MO_LESW);
+                            gen_helper_fildl_ST0(cpu_env, s->tmp2_i32);
+                            break;
+                        }
+                        break;
+                    case 1:
+                        /* XXX: the corresponding CPUID bit must be tested ! */
+                        switch (op >> 4) {
+                        case 1:
+                            gen_helper_fisttl_ST0(s->tmp2_i32, cpu_env);
+                            tcg_gen_qemu_st_i32(s->tmp2_i32, s->A0,
+                                                s->mem_index, MO_LEUL);
+                            break;
+                        case 2:
+                            gen_helper_fisttll_ST0(s->tmp1_i64, cpu_env);
+                            tcg_gen_qemu_st_i64(s->tmp1_i64, s->A0,
+                                                s->mem_index, MO_LEQ);
+                            break;
+                        case 3:
+                        default:
+                            gen_helper_fistt_ST0(s->tmp2_i32, cpu_env);
+                            tcg_gen_qemu_st_i32(s->tmp2_i32, s->A0,
+                                                s->mem_index, MO_LEUW);
+                            break;
+                        }
+                        gen_helper_fpop(cpu_env);
+                        break;
+                    default:
+                        switch (op >> 4) {
+                        case 0:
+                            gen_helper_fsts_ST0(s->tmp2_i32, cpu_env);
+                            tcg_gen_qemu_st_i32(s->tmp2_i32, s->A0,
+                                                s->mem_index, MO_LEUL);
+                            break;
+                        case 1:
+                            gen_helper_fistl_ST0(s->tmp2_i32, cpu_env);
+                            tcg_gen_qemu_st_i32(s->tmp2_i32, s->A0,
+                                                s->mem_index, MO_LEUL);
+                            break;
+                        case 2:
+                            gen_helper_fstl_ST0(s->tmp1_i64, cpu_env);
+                            tcg_gen_qemu_st_i64(s->tmp1_i64, s->A0,
+                                                s->mem_index, MO_LEQ);
+                            break;
+                        case 3:
+                        default:
+                            gen_helper_fist_ST0(s->tmp2_i32, cpu_env);
+                            tcg_gen_qemu_st_i32(s->tmp2_i32, s->A0,
+                                                s->mem_index, MO_LEUW);
+                            break;
+                        }
+                        if ((op & 7) == 3) {
+                            gen_helper_fpop(cpu_env);
+                        }
+                        break;
+                    }
                     break;
-                case 1: /* fdisi (287 only, just do nop here) */
+                case 0x0c: /* fldenv mem */
+                    gen_helper_fldenv(cpu_env, s->A0,
+                                      tcg_const_i32(dflag - 1));
                     break;
-                case 2: /* fclex */
-                    gen_helper_fclex(cpu_env);
+                case 0x0d: /* fldcw mem */
+                    tcg_gen_qemu_ld_i32(s->tmp2_i32, s->A0,
+                                        s->mem_index, MO_LEUW);
+                    gen_helper_fldcw(cpu_env, s->tmp2_i32);
                     break;
-                case 3: /* fninit */
-                    gen_helper_fninit(cpu_env);
+                case 0x0e: /* fnstenv mem */
+                    gen_helper_fstenv(cpu_env, s->A0,
+                                      tcg_const_i32(dflag - 1));
                     break;
-                case 4: /* fsetpm (287 only, just do nop here) */
+                case 0x0f: /* fnstcw mem */
+                    gen_helper_fnstcw(s->tmp2_i32, cpu_env);
+                    tcg_gen_qemu_st_i32(s->tmp2_i32, s->A0,
+                                        s->mem_index, MO_LEUW);
                     break;
-                default:
-                    goto unknown_op;
-                }
-                break;
-            case 0x1d: /* fucomi */
-                if (!(s->cpuid_features & CPUID_CMOV)) {
-                    goto illegal_op;
-                }
-                gen_update_cc_op(s);
-                gen_helper_fmov_FT0_STN(cpu_env, tcg_const_i32(opreg));
-                gen_helper_fucomi_ST0_FT0(cpu_env);
-                set_cc_op(s, CC_OP_EFLAGS);
-                break;
-            case 0x1e: /* fcomi */
-                if (!(s->cpuid_features & CPUID_CMOV)) {
-                    goto illegal_op;
-                }
-                gen_update_cc_op(s);
-                gen_helper_fmov_FT0_STN(cpu_env, tcg_const_i32(opreg));
-                gen_helper_fcomi_ST0_FT0(cpu_env);
-                set_cc_op(s, CC_OP_EFLAGS);
-                break;
-            case 0x28: /* ffree sti */
-                gen_helper_ffree_STN(cpu_env, tcg_const_i32(opreg));
-                break;
-            case 0x2a: /* fst sti */
-                gen_helper_fmov_STN_ST0(cpu_env, tcg_const_i32(opreg));
-                break;
-            case 0x2b: /* fstp sti */
-            case 0x0b: /* fstp1 sti, undocumented op */
-            case 0x3a: /* fstp8 sti, undocumented op */
-            case 0x3b: /* fstp9 sti, undocumented op */
-                gen_helper_fmov_STN_ST0(cpu_env, tcg_const_i32(opreg));
-                gen_helper_fpop(cpu_env);
-                break;
-            case 0x2c: /* fucom st(i) */
-                gen_helper_fmov_FT0_STN(cpu_env, tcg_const_i32(opreg));
-                gen_helper_fucom_ST0_FT0(cpu_env);
-                break;
-            case 0x2d: /* fucomp st(i) */
-                gen_helper_fmov_FT0_STN(cpu_env, tcg_const_i32(opreg));
-                gen_helper_fucom_ST0_FT0(cpu_env);
-                gen_helper_fpop(cpu_env);
-                break;
-            case 0x33: /* de/3 */
-                switch(rm) {
-                case 1: /* fcompp */
-                    gen_helper_fmov_FT0_STN(cpu_env, tcg_const_i32(1));
-                    gen_helper_fcom_ST0_FT0(cpu_env);
-                    gen_helper_fpop(cpu_env);
+                case 0x1d: /* fldt mem */
+                    gen_helper_fldt_ST0(cpu_env, s->A0);
+                    break;
+                case 0x1f: /* fstpt mem */
+                    gen_helper_fstt_ST0(cpu_env, s->A0);
                     gen_helper_fpop(cpu_env);
                     break;
-                default:
-                    goto unknown_op;
-                }
-                break;
-            case 0x38: /* ffreep sti, undocumented op */
-                gen_helper_ffree_STN(cpu_env, tcg_const_i32(opreg));
-                gen_helper_fpop(cpu_env);
-                break;
-            case 0x3c: /* df/4 */
-                switch(rm) {
-                case 0:
+                case 0x2c: /* frstor mem */
+                    gen_helper_frstor(cpu_env, s->A0,
+                                      tcg_const_i32(dflag - 1));
+                    break;
+                case 0x2e: /* fnsave mem */
+                    gen_helper_fsave(cpu_env, s->A0,
+                                     tcg_const_i32(dflag - 1));
+                    break;
+                case 0x2f: /* fnstsw mem */
                     gen_helper_fnstsw(s->tmp2_i32, cpu_env);
-                    tcg_gen_extu_i32_tl(s->T0, s->tmp2_i32);
-                    gen_op_mov_reg_v(s, MO_16, R_EAX, s->T0);
+                    tcg_gen_qemu_st_i32(s->tmp2_i32, s->A0,
+                                        s->mem_index, MO_LEUW);
+                    break;
+                case 0x3c: /* fbld */
+                    gen_helper_fbld_ST0(cpu_env, s->A0);
+                    break;
+                case 0x3e: /* fbstp */
+                    gen_helper_fbst_ST0(cpu_env, s->A0);
+                    gen_helper_fpop(cpu_env);
+                    break;
+                case 0x3d: /* fildll */
+                    tcg_gen_qemu_ld_i64(s->tmp1_i64, s->A0,
+                                        s->mem_index, MO_LEQ);
+                    gen_helper_fildll_ST0(cpu_env, s->tmp1_i64);
+                    break;
+                case 0x3f: /* fistpll */
+                    gen_helper_fistll_ST0(s->tmp1_i64, cpu_env);
+                    tcg_gen_qemu_st_i64(s->tmp1_i64, s->A0,
+                                        s->mem_index, MO_LEQ);
+                    gen_helper_fpop(cpu_env);
                     break;
                 default:
                     goto unknown_op;
                 }
-                break;
-            case 0x3d: /* fucomip */
-                if (!(s->cpuid_features & CPUID_CMOV)) {
-                    goto illegal_op;
-                }
-                gen_update_cc_op(s);
-                gen_helper_fmov_FT0_STN(cpu_env, tcg_const_i32(opreg));
-                gen_helper_fucomi_ST0_FT0(cpu_env);
-                gen_helper_fpop(cpu_env);
-                set_cc_op(s, CC_OP_EFLAGS);
-                break;
-            case 0x3e: /* fcomip */
-                if (!(s->cpuid_features & CPUID_CMOV)) {
-                    goto illegal_op;
-                }
-                gen_update_cc_op(s);
-                gen_helper_fmov_FT0_STN(cpu_env, tcg_const_i32(opreg));
-                gen_helper_fcomi_ST0_FT0(cpu_env);
-                gen_helper_fpop(cpu_env);
-                set_cc_op(s, CC_OP_EFLAGS);
-                break;
-            case 0x10 ... 0x13: /* fcmovxx */
-            case 0x18 ... 0x1b:
-                {
-                    int op1;
-                    TCGLabel *l1;
-                    static const uint8_t fcmov_cc[8] = {
-                        (JCC_B << 1),
-                        (JCC_Z << 1),
-                        (JCC_BE << 1),
-                        (JCC_P << 1),
-                    };
+            } else {
+                /* register float ops */
+                opreg = rm;
+
+                switch (op) {
+                case 0x08: /* fld sti */
+                    gen_helper_fpush(cpu_env);
+                    gen_helper_fmov_ST0_STN(cpu_env,
+                                            tcg_const_i32((opreg + 1) & 7));
+                    break;
+                case 0x09: /* fxchg sti */
+                case 0x29: /* fxchg4 sti, undocumented op */
+                case 0x39: /* fxchg7 sti, undocumented op */
+                    gen_helper_fxchg_ST0_STN(cpu_env, tcg_const_i32(opreg));
+                    break;
+                case 0x0a: /* grp d9/2 */
+                    switch (rm) {
+                    case 0: /* fnop */
+                        /* check exceptions (FreeBSD FPU probe) */
+                        gen_helper_fwait(cpu_env);
+                        break;
+                    default:
+                        goto unknown_op;
+                    }
+                    break;
+                case 0x0c: /* grp d9/4 */
+                    switch (rm) {
+                    case 0: /* fchs */
+                        gen_helper_fchs_ST0(cpu_env);
+                        break;
+                    case 1: /* fabs */
+                        gen_helper_fabs_ST0(cpu_env);
+                        break;
+                    case 4: /* ftst */
+                        gen_helper_fldz_FT0(cpu_env);
+                        gen_helper_fcom_ST0_FT0(cpu_env);
+                        break;
+                    case 5: /* fxam */
+                        gen_helper_fxam_ST0(cpu_env);
+                        break;
+                    default:
+                        goto unknown_op;
+                    }
+                    break;
+                case 0x0d: /* grp d9/5 */
+                    {
+                        switch (rm) {
+                        case 0:
+                            gen_helper_fpush(cpu_env);
+                            gen_helper_fld1_ST0(cpu_env);
+                            break;
+                        case 1:
+                            gen_helper_fpush(cpu_env);
+                            gen_helper_fldl2t_ST0(cpu_env);
+                            break;
+                        case 2:
+                            gen_helper_fpush(cpu_env);
+                            gen_helper_fldl2e_ST0(cpu_env);
+                            break;
+                        case 3:
+                            gen_helper_fpush(cpu_env);
+                            gen_helper_fldpi_ST0(cpu_env);
+                            break;
+                        case 4:
+                            gen_helper_fpush(cpu_env);
+                            gen_helper_fldlg2_ST0(cpu_env);
+                            break;
+                        case 5:
+                            gen_helper_fpush(cpu_env);
+                            gen_helper_fldln2_ST0(cpu_env);
+                            break;
+                        case 6:
+                            gen_helper_fpush(cpu_env);
+                            gen_helper_fldz_ST0(cpu_env);
+                            break;
+                        default:
+                            goto unknown_op;
+                        }
+                    }
+                    break;
+                case 0x0e: /* grp d9/6 */
+                    switch (rm) {
+                    case 0: /* f2xm1 */
+                        gen_helper_f2xm1(cpu_env);
+                        break;
+                    case 1: /* fyl2x */
+                        gen_helper_fyl2x(cpu_env);
+                        break;
+                    case 2: /* fptan */
+                        gen_helper_fptan(cpu_env);
+                        break;
+                    case 3: /* fpatan */
+                        gen_helper_fpatan(cpu_env);
+                        break;
+                    case 4: /* fxtract */
+                        gen_helper_fxtract(cpu_env);
+                        break;
+                    case 5: /* fprem1 */
+                        gen_helper_fprem1(cpu_env);
+                        break;
+                    case 6: /* fdecstp */
+                        gen_helper_fdecstp(cpu_env);
+                        break;
+                    default:
+                    case 7: /* fincstp */
+                        gen_helper_fincstp(cpu_env);
+                        break;
+                    }
+                    break;
+                case 0x0f: /* grp d9/7 */
+                    switch (rm) {
+                    case 0: /* fprem */
+                        gen_helper_fprem(cpu_env);
+                        break;
+                    case 1: /* fyl2xp1 */
+                        gen_helper_fyl2xp1(cpu_env);
+                        break;
+                    case 2: /* fsqrt */
+                        gen_helper_fsqrt(cpu_env);
+                        break;
+                    case 3: /* fsincos */
+                        gen_helper_fsincos(cpu_env);
+                        break;
+                    case 5: /* fscale */
+                        gen_helper_fscale(cpu_env);
+                        break;
+                    case 4: /* frndint */
+                        gen_helper_frndint(cpu_env);
+                        break;
+                    case 6: /* fsin */
+                        gen_helper_fsin(cpu_env);
+                        break;
+                    default:
+                    case 7: /* fcos */
+                        gen_helper_fcos(cpu_env);
+                        break;
+                    }
+                    break;
+                case 0x00: case 0x01: case 0x04 ... 0x07: /* fxxx st, sti */
+                case 0x20: case 0x21: case 0x24 ... 0x27: /* fxxx sti, st */
+                case 0x30: case 0x31: case 0x34 ... 0x37: /* fxxxp sti, st */
+                    {
+                        int op1;
 
+                        op1 = op & 7;
+                        if (op >= 0x20) {
+                            gen_helper_fp_arith_STN_ST0(op1, opreg);
+                            if (op >= 0x30) {
+                                gen_helper_fpop(cpu_env);
+                            }
+                        } else {
+                            gen_helper_fmov_FT0_STN(cpu_env,
+                                                    tcg_const_i32(opreg));
+                            gen_helper_fp_arith_ST0_FT0(op1);
+                        }
+                    }
+                    break;
+                case 0x02: /* fcom */
+                case 0x22: /* fcom2, undocumented op */
+                    gen_helper_fmov_FT0_STN(cpu_env, tcg_const_i32(opreg));
+                    gen_helper_fcom_ST0_FT0(cpu_env);
+                    break;
+                case 0x03: /* fcomp */
+                case 0x23: /* fcomp3, undocumented op */
+                case 0x32: /* fcomp5, undocumented op */
+                    gen_helper_fmov_FT0_STN(cpu_env, tcg_const_i32(opreg));
+                    gen_helper_fcom_ST0_FT0(cpu_env);
+                    gen_helper_fpop(cpu_env);
+                    break;
+                case 0x15: /* da/5 */
+                    switch (rm) {
+                    case 1: /* fucompp */
+                        gen_helper_fmov_FT0_STN(cpu_env, tcg_const_i32(1));
+                        gen_helper_fucom_ST0_FT0(cpu_env);
+                        gen_helper_fpop(cpu_env);
+                        gen_helper_fpop(cpu_env);
+                        break;
+                    default:
+                        goto unknown_op;
+                    }
+                    break;
+                case 0x1c:
+                    switch (rm) {
+                    case 0: /* feni (287 only, just do nop here) */
+                        break;
+                    case 1: /* fdisi (287 only, just do nop here) */
+                        break;
+                    case 2: /* fclex */
+                        gen_helper_fclex(cpu_env);
+                        break;
+                    case 3: /* fninit */
+                        gen_helper_fninit(cpu_env);
+                        break;
+                    case 4: /* fsetpm (287 only, just do nop here) */
+                        break;
+                    default:
+                        goto unknown_op;
+                    }
+                    break;
+                case 0x1d: /* fucomi */
                     if (!(s->cpuid_features & CPUID_CMOV)) {
                         goto illegal_op;
                     }
-                    op1 = fcmov_cc[op & 3] | (((op >> 3) & 1) ^ 1);
-                    l1 = gen_new_label();
-                    gen_jcc1_noeob(s, op1, l1);
-                    gen_helper_fmov_ST0_STN(cpu_env, tcg_const_i32(opreg));
-                    gen_set_label(l1);
+                    gen_update_cc_op(s);
+                    gen_helper_fmov_FT0_STN(cpu_env, tcg_const_i32(opreg));
+                    gen_helper_fucomi_ST0_FT0(cpu_env);
+                    set_cc_op(s, CC_OP_EFLAGS);
+                    break;
+                case 0x1e: /* fcomi */
+                    if (!(s->cpuid_features & CPUID_CMOV)) {
+                        goto illegal_op;
+                    }
+                    gen_update_cc_op(s);
+                    gen_helper_fmov_FT0_STN(cpu_env, tcg_const_i32(opreg));
+                    gen_helper_fcomi_ST0_FT0(cpu_env);
+                    set_cc_op(s, CC_OP_EFLAGS);
+                    break;
+                case 0x28: /* ffree sti */
+                    gen_helper_ffree_STN(cpu_env, tcg_const_i32(opreg));
+                    break;
+                case 0x2a: /* fst sti */
+                    gen_helper_fmov_STN_ST0(cpu_env, tcg_const_i32(opreg));
+                    break;
+                case 0x2b: /* fstp sti */
+                case 0x0b: /* fstp1 sti, undocumented op */
+                case 0x3a: /* fstp8 sti, undocumented op */
+                case 0x3b: /* fstp9 sti, undocumented op */
+                    gen_helper_fmov_STN_ST0(cpu_env, tcg_const_i32(opreg));
+                    gen_helper_fpop(cpu_env);
+                    break;
+                case 0x2c: /* fucom st(i) */
+                    gen_helper_fmov_FT0_STN(cpu_env, tcg_const_i32(opreg));
+                    gen_helper_fucom_ST0_FT0(cpu_env);
+                    break;
+                case 0x2d: /* fucomp st(i) */
+                    gen_helper_fmov_FT0_STN(cpu_env, tcg_const_i32(opreg));
+                    gen_helper_fucom_ST0_FT0(cpu_env);
+                    gen_helper_fpop(cpu_env);
+                    break;
+                case 0x33: /* de/3 */
+                    switch (rm) {
+                    case 1: /* fcompp */
+                        gen_helper_fmov_FT0_STN(cpu_env, tcg_const_i32(1));
+                        gen_helper_fcom_ST0_FT0(cpu_env);
+                        gen_helper_fpop(cpu_env);
+                        gen_helper_fpop(cpu_env);
+                        break;
+                    default:
+                        goto unknown_op;
+                    }
+                    break;
+                case 0x38: /* ffreep sti, undocumented op */
+                    gen_helper_ffree_STN(cpu_env, tcg_const_i32(opreg));
+                    gen_helper_fpop(cpu_env);
+                    break;
+                case 0x3c: /* df/4 */
+                    switch (rm) {
+                    case 0:
+                        gen_helper_fnstsw(s->tmp2_i32, cpu_env);
+                        tcg_gen_extu_i32_tl(s->T0, s->tmp2_i32);
+                        gen_op_mov_reg_v(s, MO_16, R_EAX, s->T0);
+                        break;
+                    default:
+                        goto unknown_op;
+                    }
+                    break;
+                case 0x3d: /* fucomip */
+                    if (!(s->cpuid_features & CPUID_CMOV)) {
+                        goto illegal_op;
+                    }
+                    gen_update_cc_op(s);
+                    gen_helper_fmov_FT0_STN(cpu_env, tcg_const_i32(opreg));
+                    gen_helper_fucomi_ST0_FT0(cpu_env);
+                    gen_helper_fpop(cpu_env);
+                    set_cc_op(s, CC_OP_EFLAGS);
+                    break;
+                case 0x3e: /* fcomip */
+                    if (!(s->cpuid_features & CPUID_CMOV)) {
+                        goto illegal_op;
+                    }
+                    gen_update_cc_op(s);
+                    gen_helper_fmov_FT0_STN(cpu_env, tcg_const_i32(opreg));
+                    gen_helper_fcomi_ST0_FT0(cpu_env);
+                    gen_helper_fpop(cpu_env);
+                    set_cc_op(s, CC_OP_EFLAGS);
+                    break;
+                case 0x10 ... 0x13: /* fcmovxx */
+                case 0x18 ... 0x1b:
+                    {
+                        int op1;
+                        TCGLabel *l1;
+                        static const uint8_t fcmov_cc[8] = {
+                            (JCC_B << 1),
+                            (JCC_Z << 1),
+                            (JCC_BE << 1),
+                            (JCC_P << 1),
+                        };
+
+                        if (!(s->cpuid_features & CPUID_CMOV)) {
+                            goto illegal_op;
+                        }
+                        op1 = fcmov_cc[op & 3] | (((op >> 3) & 1) ^ 1);
+                        l1 = gen_new_label();
+                        gen_jcc1_noeob(s, op1, l1);
+                        gen_helper_fmov_ST0_STN(cpu_env, tcg_const_i32(opreg));
+                        gen_set_label(l1);
+                    }
+                    break;
+                default:
+                    goto unknown_op;
                 }
-                break;
-            default:
-                goto unknown_op;
             }
         }
         break;
-- 
2.25.1


