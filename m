Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C50095FB150
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 13:17:47 +0200 (CEST)
Received: from localhost ([::1]:42968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiDGc-0000uV-Qv
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 07:17:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oiCUb-0002RX-6g
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 06:28:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26357)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oiCUZ-0004aX-CC
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 06:28:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665484086;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ut8xDXgT2bBwGBL1E2m2HrBIy0yyf5iOFTclUOS+d3Q=;
 b=YazBzE0j0wJmJjIwBg+0wEiu0Dazv7eOalpYkJx0Xx4YP+Uw5QBuL6q2+49fDwgpif32fl
 hwwqMLZFsT4wNIBKdOIJNvWWD1qx5IneWg8SjpFMujymxHXCsxFiznDBTdk2oeNjw3VdmA
 6UAifOY4/60XE2Tgn9oZK4T+vt+0QIY=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-665--zHYnZ3cM-CIYxhohwp01Q-1; Tue, 11 Oct 2022 06:28:05 -0400
X-MC-Unique: -zHYnZ3cM-CIYxhohwp01Q-1
Received: by mail-ed1-f72.google.com with SMTP id
 y6-20020a056402358600b0045932521633so10939658edc.17
 for <qemu-devel@nongnu.org>; Tue, 11 Oct 2022 03:28:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ut8xDXgT2bBwGBL1E2m2HrBIy0yyf5iOFTclUOS+d3Q=;
 b=ZG2Jke8FN3WstVYyUkEb/ro08wrSGxT1d2kLpo3823p7PJAEOmfwNj+W+N8kjW/bcU
 wXZG8p5EyDE59b0HOuaHQI3JtGx+4V0QzwDdKI9CdkSOjULdUvuOvUqD+nGBPge3oC7a
 0PeCX+vzgdSVjpL+AX5KVqC/4ovNd58aiQxzcozq3cuc/INPk5D3ulvJMRN/awxmeUIm
 nhOS8Vz8yl6tE1Pl6YTzTGJUMAZLqIDqsP2ctWKhAnE5mjxiqt6vKclGNep5ARLVaU4T
 3OTxNtj53L813UrH2QlBgd7EAZci/WnV1Tye8z73YDrP4/iL773V2694+6oxS2350ter
 PCkg==
X-Gm-Message-State: ACrzQf3rYNUBGI93ASvq14vicKqT+Gf73xg9rffV/+Ycj2P71RVRk85h
 LKRKj4mGgSwA4moGQh+by7X9VzpuMJf91TzX6cOp0cemlyrpFPnljnvxmm3qRv1Ta62RyYBxMuG
 G3czQRWmKeMwhg7VcZgDu+hESq6nL8vIfJzBilsSfuFV4L/Mmhc9mtXPupOhXOZI2rzQ=
X-Received: by 2002:a17:906:ee88:b0:78d:1a9a:b2db with SMTP id
 wt8-20020a170906ee8800b0078d1a9ab2dbmr18213988ejb.225.1665484083441; 
 Tue, 11 Oct 2022 03:28:03 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7mwXFJ14t5yZbVetIKQC3M8Hdf+CL6i84Kh0IVHRJCLhNEaPbxqPrFZyBgDlH3QimkOV+lCw==
X-Received: by 2002:a17:906:ee88:b0:78d:1a9a:b2db with SMTP id
 wt8-20020a170906ee8800b0078d1a9ab2dbmr18213966ejb.225.1665484083066; 
 Tue, 11 Oct 2022 03:28:03 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:aad8:f393:e009:e014])
 by smtp.gmail.com with ESMTPSA id
 zh15-20020a170906880f00b0078d8c1eee44sm5666008ejb.158.2022.10.11.03.28.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Oct 2022 03:28:02 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 21/37] target/i386: Use DISAS_TOO_MANY to exit after
 gen_io_start
Date: Tue, 11 Oct 2022 12:26:44 +0200
Message-Id: <20221011102700.319178-22-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221011102700.319178-1-pbonzini@redhat.com>
References: <20221011102700.319178-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
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

We can set is_jmp early, using only one if, and let that
be overwritten by gen_rep*'s calls to gen_jmp_tb.

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20221001140935.465607-17-richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/tcg/translate.c | 42 +++++++++----------------------------
 1 file changed, 10 insertions(+), 32 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index be29ea7a03..11aaba8a65 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -5660,14 +5660,12 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             }
             if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
                 gen_io_start();
+                s->base.is_jmp = DISAS_TOO_MANY;
             }
             gen_helper_rdrand(s->T0, cpu_env);
             rm = (modrm & 7) | REX_B(s);
             gen_op_mov_reg_v(s, dflag, rm, s->T0);
             set_cc_op(s, CC_OP_EFLAGS);
-            if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
-                gen_jmp(s, s->pc - s->cs_base);
-            }
             break;
 
         default:
@@ -6704,15 +6702,12 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
         }
         if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
             gen_io_start();
+            s->base.is_jmp = DISAS_TOO_MANY;
         }
         if (prefixes & (PREFIX_REPZ | PREFIX_REPNZ)) {
             gen_repz_ins(s, ot);
-            /* jump generated by gen_repz_ins */
         } else {
             gen_ins(s, ot);
-            if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
-                gen_jmp(s, s->pc - s->cs_base);
-            }
         }
         break;
     case 0x6e: /* outsS */
@@ -6725,15 +6720,12 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
         }
         if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
             gen_io_start();
+            s->base.is_jmp = DISAS_TOO_MANY;
         }
         if (prefixes & (PREFIX_REPZ | PREFIX_REPNZ)) {
             gen_repz_outs(s, ot);
-            /* jump generated by gen_repz_outs */
         } else {
             gen_outs(s, ot);
-            if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
-                gen_jmp(s, s->pc - s->cs_base);
-            }
         }
         break;
 
@@ -6750,13 +6742,11 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
         }
         if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
             gen_io_start();
+            s->base.is_jmp = DISAS_TOO_MANY;
         }
         gen_helper_in_func(ot, s->T1, s->tmp2_i32);
         gen_op_mov_reg_v(s, ot, R_EAX, s->T1);
         gen_bpt_io(s, s->tmp2_i32, ot);
-        if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
-            gen_jmp(s, s->pc - s->cs_base);
-        }
         break;
     case 0xe6:
     case 0xe7:
@@ -6768,14 +6758,12 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
         }
         if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
             gen_io_start();
+            s->base.is_jmp = DISAS_TOO_MANY;
         }
         gen_op_mov_v_reg(s, ot, s->T1, R_EAX);
         tcg_gen_trunc_tl_i32(s->tmp3_i32, s->T1);
         gen_helper_out_func(ot, s->tmp2_i32, s->tmp3_i32);
         gen_bpt_io(s, s->tmp2_i32, ot);
-        if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
-            gen_jmp(s, s->pc - s->cs_base);
-        }
         break;
     case 0xec:
     case 0xed:
@@ -6787,13 +6775,11 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
         }
         if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
             gen_io_start();
+            s->base.is_jmp = DISAS_TOO_MANY;
         }
         gen_helper_in_func(ot, s->T1, s->tmp2_i32);
         gen_op_mov_reg_v(s, ot, R_EAX, s->T1);
         gen_bpt_io(s, s->tmp2_i32, ot);
-        if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
-            gen_jmp(s, s->pc - s->cs_base);
-        }
         break;
     case 0xee:
     case 0xef:
@@ -6805,14 +6791,12 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
         }
         if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
             gen_io_start();
+            s->base.is_jmp = DISAS_TOO_MANY;
         }
         gen_op_mov_v_reg(s, ot, s->T1, R_EAX);
         tcg_gen_trunc_tl_i32(s->tmp3_i32, s->T1);
         gen_helper_out_func(ot, s->tmp2_i32, s->tmp3_i32);
         gen_bpt_io(s, s->tmp2_i32, ot);
-        if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
-            gen_jmp(s, s->pc - s->cs_base);
-        }
         break;
 
         /************************/
@@ -7478,11 +7462,9 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
         gen_update_eip_cur(s);
         if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
             gen_io_start();
+            s->base.is_jmp = DISAS_TOO_MANY;
         }
         gen_helper_rdtsc(cpu_env);
-        if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
-            gen_jmp(s, s->pc - s->cs_base);
-        }
         break;
     case 0x133: /* rdpmc */
         gen_update_cc_op(s);
@@ -7939,11 +7921,9 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             gen_update_eip_cur(s);
             if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
                 gen_io_start();
+                s->base.is_jmp = DISAS_TOO_MANY;
             }
             gen_helper_rdtscp(cpu_env);
-            if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
-                gen_jmp(s, s->pc - s->cs_base);
-            }
             break;
 
         default:
@@ -8307,6 +8287,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
 
         if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
             gen_io_start();
+            s->base.is_jmp = DISAS_TOO_MANY;
         }
         if (b & 2) {
             gen_svm_check_intercept(s, SVM_EXIT_WRITE_CR0 + reg);
@@ -8317,9 +8298,6 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             gen_svm_check_intercept(s, SVM_EXIT_READ_CR0 + reg);
             gen_helper_read_crN(s->T0, cpu_env, tcg_constant_i32(reg));
             gen_op_mov_reg_v(s, ot, rm, s->T0);
-            if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
-                gen_jmp(s, s->pc - s->cs_base);
-            }
         }
         break;
 
-- 
2.37.3


