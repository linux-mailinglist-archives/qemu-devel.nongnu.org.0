Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA6AB5FB0DA
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 12:59:22 +0200 (CEST)
Received: from localhost ([::1]:54598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiCyn-0003im-Pr
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 06:59:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oiCUT-0002Cs-Fl
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 06:28:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31092)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oiCUQ-0004Y0-4z
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 06:28:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665484077;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=22TAl+o1Pln9HwWBNDRYRw1yfkBwlpL9jm+XULzxcxc=;
 b=T6AosCC37CBSid5GF903e3O0B7WtzDvpnRSeU8EK0/s8BM9ER9UuWyq3L0Y9oT8E6vbpWp
 CWEEl8syJKaN0iPnG8bnPZOmw7FY5FsFoq41C5LsCMAIjhuwnSFpx+pYBRvSeVyIMQfpON
 1b/ozU4HJZlguYqL40Li+Du2euYkbYI=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-542-MeoIkkyqPZez9B1h76t3EQ-1; Tue, 11 Oct 2022 06:27:56 -0400
X-MC-Unique: MeoIkkyqPZez9B1h76t3EQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 s17-20020a056402521100b0045bfaaab697so4638571edd.1
 for <qemu-devel@nongnu.org>; Tue, 11 Oct 2022 03:27:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=22TAl+o1Pln9HwWBNDRYRw1yfkBwlpL9jm+XULzxcxc=;
 b=STbhfG0hlmntQBBx2RZG2m2RbEniNo/wYWSdRqcVo48VvJU7WL3pRvs7qD3nXssxJQ
 OXlH/TVD6JxnQAvYtvqauKgTamhTk9eimxpcnEBHax02JjpOmuZJ5jt2e+45lxn2m9Y1
 LdRKZfp0PaTChEWaqClRpwXEDw3hagGkuDhsSvFbrWfhxU4eyXgysPgLTnA9UqSVMI9i
 LcIT40fOUwh/wdAI79hbTguzL5ZJ+5ZCkCq6Tp+0/zdbaSCDGlcXhdy9FecjIqKoR3Zz
 J2wbn77TaRW7nD8f3AUqDugkG1oJLTdz1VjCGYMPDQCH9yx4Rb6nBSwZFMbtWl10bMpe
 ziTw==
X-Gm-Message-State: ACrzQf3kgrFKk46snh2iAH4AOMzBBSr1vi071nnBDo1O/ck3oVxuqnC7
 8QV0/jWMmPXVIP75c21dppfN5kP1j4F928YeDWBtOEIexBctR+ab2i2pQSWZZ7ekFBFxpoGH+F3
 1Hxns/iEe8i86LWsNoCQDbaxRj5EQ4P0hJ+D2tucRKI1bfrDD3GNwlFolpeJL4DL8X10=
X-Received: by 2002:a17:907:25c5:b0:783:f5df:900e with SMTP id
 ae5-20020a17090725c500b00783f5df900emr17685609ejc.491.1665484074621; 
 Tue, 11 Oct 2022 03:27:54 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4JDCe3DTg8aGQdCAM7Fdj65n7b1pv3QMo+ttQ0MGYwNm77/qGXoPPOnlk3qH6xi30hO3zoMQ==
X-Received: by 2002:a17:907:25c5:b0:783:f5df:900e with SMTP id
 ae5-20020a17090725c500b00783f5df900emr17685590ejc.491.1665484074362; 
 Tue, 11 Oct 2022 03:27:54 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:aad8:f393:e009:e014])
 by smtp.gmail.com with ESMTPSA id
 mb20-20020a170906eb1400b0078d85972524sm6170255ejb.157.2022.10.11.03.27.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Oct 2022 03:27:53 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 18/37] target/i386: Introduce DISAS_JUMP
Date: Tue, 11 Oct 2022 12:26:41 +0200
Message-Id: <20221011102700.319178-19-pbonzini@redhat.com>
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

Drop the unused dest argument to gen_jr().
Remove most of the calls to gen_jr, and use DISAS_JUMP.
Remove some unused loads of eip for lcall and ljmp.

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20221001140935.465607-14-richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/tcg/translate.c | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index c8ef9f0356..7db6f617a1 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -135,6 +135,7 @@ typedef struct DisasContext {
 #define DISAS_EOB_ONLY         DISAS_TARGET_0
 #define DISAS_EOB_NEXT         DISAS_TARGET_1
 #define DISAS_EOB_INHIBIT_IRQ  DISAS_TARGET_2
+#define DISAS_JUMP             DISAS_TARGET_3
 
 /* The environment in which user-only runs is constrained. */
 #ifdef CONFIG_USER_ONLY
@@ -222,7 +223,7 @@ STUB_HELPER(wrmsr, TCGv_env env)
 #endif
 
 static void gen_eob(DisasContext *s);
-static void gen_jr(DisasContext *s, TCGv dest);
+static void gen_jr(DisasContext *s);
 static void gen_jmp(DisasContext *s, target_ulong eip);
 static void gen_jmp_tb(DisasContext *s, target_ulong eip, int tb_num);
 static void gen_op(DisasContext *s1, int op, MemOp ot, int d);
@@ -2385,7 +2386,7 @@ static void gen_goto_tb(DisasContext *s, int tb_num, target_ulong eip)
     } else {
         /* jump to another page */
         gen_jmp_im(s, eip);
-        gen_jr(s, s->tmp0);
+        gen_jr(s);
     }
 }
 
@@ -2754,7 +2755,7 @@ static void gen_eob(DisasContext *s)
 }
 
 /* Jump to register */
-static void gen_jr(DisasContext *s, TCGv dest)
+static void gen_jr(DisasContext *s)
 {
     do_gen_eob_worker(s, false, false, true);
 }
@@ -5328,7 +5329,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             gen_push_v(s, s->T1);
             gen_op_jmp_v(s->T0);
             gen_bnd_jmp(s);
-            gen_jr(s, s->T0);
+            s->base.is_jmp = DISAS_JUMP;
             break;
         case 3: /* lcall Ev */
             if (mod == 3) {
@@ -5349,8 +5350,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
                                       tcg_const_i32(dflag - 1),
                                       tcg_const_i32(s->pc - s->cs_base));
             }
-            tcg_gen_ld_tl(s->tmp4, cpu_env, offsetof(CPUX86State, eip));
-            gen_jr(s, s->tmp4);
+            s->base.is_jmp = DISAS_JUMP;
             break;
         case 4: /* jmp Ev */
             if (dflag == MO_16) {
@@ -5358,7 +5358,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             }
             gen_op_jmp_v(s->T0);
             gen_bnd_jmp(s);
-            gen_jr(s, s->T0);
+            s->base.is_jmp = DISAS_JUMP;
             break;
         case 5: /* ljmp Ev */
             if (mod == 3) {
@@ -5376,8 +5376,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
                 gen_op_movl_seg_T0_vm(s, R_CS);
                 gen_op_jmp_v(s->T1);
             }
-            tcg_gen_ld_tl(s->tmp4, cpu_env, offsetof(CPUX86State, eip));
-            gen_jr(s, s->tmp4);
+            s->base.is_jmp = DISAS_JUMP;
             break;
         case 6: /* push Ev */
             gen_push_v(s, s->T0);
@@ -6808,7 +6807,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
         /* Note that gen_pop_T0 uses a zero-extending load.  */
         gen_op_jmp_v(s->T0);
         gen_bnd_jmp(s);
-        gen_jr(s, s->T0);
+        s->base.is_jmp = DISAS_JUMP;
         break;
     case 0xc3: /* ret */
         ot = gen_pop_T0(s);
@@ -6816,7 +6815,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
         /* Note that gen_pop_T0 uses a zero-extending load.  */
         gen_op_jmp_v(s->T0);
         gen_bnd_jmp(s);
-        gen_jr(s, s->T0);
+        s->base.is_jmp = DISAS_JUMP;
         break;
     case 0xca: /* lret im */
         val = x86_ldsw_code(env, s);
@@ -8846,6 +8845,9 @@ static void i386_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
         gen_update_eip_cur(dc);
         gen_eob_inhibit_irq(dc, true);
         break;
+    case DISAS_JUMP:
+        gen_jr(dc);
+        break;
     default:
         g_assert_not_reached();
     }
-- 
2.37.3


