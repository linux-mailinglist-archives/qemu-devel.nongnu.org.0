Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AD695A327A
	for <lists+qemu-devel@lfdr.de>; Sat, 27 Aug 2022 01:18:16 +0200 (CEST)
Received: from localhost ([::1]:49674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRiad-0004AV-6J
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 19:18:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oRiV2-0006o9-JV
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 19:12:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27525)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oRiV0-0007pr-TI
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 19:12:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661555546;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8OG3BES3jn6rqjpInSfI0r3StqLKtgpUh4DBPp2S9+U=;
 b=Yr3DpZpNozefHelgBzFJH+VrO+ezXaqjPH0gT60QzU71/zG5hXesTsEm7etlSLO7lVkfqR
 ukgcQuI+qeoPmd/mBKosuCuJqWyrZr3QwJl0wUifpzHEUQsWV1cqOoPTHe+lWmQTvOwkJB
 FBj657JvR3N+y3M4ZSYNy8bo3CkJRyI=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-139-5h-bHcDYOmW4HpQHL7QLSQ-1; Fri, 26 Aug 2022 19:12:23 -0400
X-MC-Unique: 5h-bHcDYOmW4HpQHL7QLSQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 b12-20020a056402278c00b00447f2029741so1760831ede.23
 for <qemu-devel@nongnu.org>; Fri, 26 Aug 2022 16:12:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=8OG3BES3jn6rqjpInSfI0r3StqLKtgpUh4DBPp2S9+U=;
 b=4GN008mvgKLBzXtwgOJpNiqkkFpilbYa86cZR0b5FfjAmDYdl+hLzfydr+EjJk1xDh
 BipypY6h1ipLY2xH+XlPruTJvR7eN414VayzBbjDDfNBMZof7DP1rlyKqRKh4RHl1nhv
 ltkli5uRkCiixWVLtsrlRI6rthRaNgU8lq74AsyV3xg2rTreNfnRyK2okdKtO/NHiZ8M
 45jD8R87vnVHspERtnVOZVclSxYLFmN9TCcWPqAtlfG7CRvBlhIWDJa6HwmBtCXcCwqs
 0Ol34lrZiBZ5aE9yXIzJPaOQhitwv2Btmokbf6AXv4WPibZBFbT3VIBVRlv60mFRqdYb
 oRbA==
X-Gm-Message-State: ACgBeo0sYLOMppRBib56pdj5ZsTY4Ju/iUDHCIUi0ciCWhlBr0lk78ub
 jDTlHoX9nbSpVE8CIMCl9bKl1hGzX+ouBYfkaF8zpM5D0FzHSobNALStHsW8AENClaLCu4Au9UY
 6EmiBLR2/Dt+NtbI3Kn9nSyfdhs073JT+0uIZTOir84gBqk2j6AOXqhNjXcMX3BjHXeQ=
X-Received: by 2002:a05:6402:14e:b0:443:f58:17e9 with SMTP id
 s14-20020a056402014e00b004430f5817e9mr8607505edu.106.1661555542166; 
 Fri, 26 Aug 2022 16:12:22 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7J2uOVJsI+6g6liW3BOOXYX+aYXbDjwT78P5ipec8IDMUZiJO6LS3Mwrd7N6E+MgPPiirMPA==
X-Received: by 2002:a05:6402:14e:b0:443:f58:17e9 with SMTP id
 s14-20020a056402014e00b004430f5817e9mr8607492edu.106.1661555541874; 
 Fri, 26 Aug 2022 16:12:21 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 t35-20020a056402242300b00448176872f7sm400676eda.81.2022.08.26.16.12.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 16:12:21 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	paul@nowt.org
Subject: [PATCH 08/23] i386: isolate MMX code more
Date: Sat, 27 Aug 2022 01:11:49 +0200
Message-Id: <20220826231204.201395-9-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220826231204.201395-1-pbonzini@redhat.com>
References: <20220826231204.201395-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
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

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/tcg/translate.c | 52 +++++++++++++++++++++++--------------
 1 file changed, 33 insertions(+), 19 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 849c40b685..f174b1d986 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -3888,6 +3888,12 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                         gen_ldo_env_A0(s, op2_offset);
                     }
                 }
+                tcg_gen_addi_ptr(s->ptr0, cpu_env, op1_offset);
+                tcg_gen_addi_ptr(s->ptr1, cpu_env, op2_offset);
+                if (!op6->op[b1]) {
+                    goto illegal_op;
+                }
+                op6->op[b1](cpu_env, s->ptr0, s->ptr1);
             } else {
                 if ((op6->flags & SSE_OPF_MMX) == 0) {
                     goto unknown_op;
@@ -3900,14 +3906,10 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                     gen_lea_modrm(env, s, modrm);
                     gen_ldq_env_A0(s, op2_offset);
                 }
+                tcg_gen_addi_ptr(s->ptr0, cpu_env, op1_offset);
+                tcg_gen_addi_ptr(s->ptr1, cpu_env, op2_offset);
+                op6->op[0](cpu_env, s->ptr0, s->ptr1);
             }
-            if (!op6->op[b1]) {
-                goto illegal_op;
-            }
-
-            tcg_gen_addi_ptr(s->ptr0, cpu_env, op1_offset);
-            tcg_gen_addi_ptr(s->ptr1, cpu_env, op2_offset);
-            op6->op[b1](cpu_env, s->ptr0, s->ptr1);
 
             if (op6->flags & SSE_OPF_CMP) {
                 set_cc_op(s, CC_OP_EFLAGS);
@@ -4427,16 +4429,8 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                 return;
             }
 
-            if (b1) {
-                op1_offset = ZMM_OFFSET(reg);
-                if (mod == 3) {
-                    op2_offset = ZMM_OFFSET(rm | REX_B(s));
-                } else {
-                    op2_offset = offsetof(CPUX86State,xmm_t0);
-                    gen_lea_modrm(env, s, modrm);
-                    gen_ldo_env_A0(s, op2_offset);
-                }
-            } else {
+            if (b1 == 0) {
+                /* MMX */
                 if ((op7->flags & SSE_OPF_MMX) == 0) {
                     goto illegal_op;
                 }
@@ -4448,9 +4442,29 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                     gen_lea_modrm(env, s, modrm);
                     gen_ldq_env_A0(s, op2_offset);
                 }
-            }
-            val = x86_ldub_code(env, s);
+                val = x86_ldub_code(env, s);
+                tcg_gen_addi_ptr(s->ptr0, cpu_env, op1_offset);
+                tcg_gen_addi_ptr(s->ptr1, cpu_env, op2_offset);
 
+                /* We only actually have one MMX instuction (palignr) */
+                assert(b == 0x0f);
+
+                op7->op[0](cpu_env, s->ptr0, s->ptr1,
+                           tcg_const_i32(val));
+                break;
+            }
+
+            /* SSE */
+            op1_offset = ZMM_OFFSET(reg);
+            if (mod == 3) {
+                op2_offset = ZMM_OFFSET(rm | REX_B(s));
+            } else {
+                op2_offset = offsetof(CPUX86State, xmm_t0);
+                gen_lea_modrm(env, s, modrm);
+                gen_ldo_env_A0(s, op2_offset);
+            }
+
+            val = x86_ldub_code(env, s);
             if ((b & 0xfc) == 0x60) { /* pcmpXstrX */
                 set_cc_op(s, CC_OP_EFLAGS);
 
-- 
2.37.1



