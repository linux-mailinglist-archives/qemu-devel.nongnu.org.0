Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7EA45A328C
	for <lists+qemu-devel@lfdr.de>; Sat, 27 Aug 2022 01:22:04 +0200 (CEST)
Received: from localhost ([::1]:40718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRieF-00015l-1B
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 19:21:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oRiUz-0006f4-0z
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 19:12:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28038)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oRiUx-0007pY-AZ
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 19:12:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661555542;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Qsqk+/tZj/l1X2BcmANA8UNdh29v3IMZ8Unky4JedO0=;
 b=Jc725GI5qbocbCnQ+qrj8rYw4iqdh4vHhjzHC6WBuj1HLj+Tlqo1YS0yOCvhDZAQ7pn1oM
 A3lX3dIAZINvOnSwrIqu1ZnnHFl8W+uXRRzkaKbxP2P1mwbVXyWXRQehtstIcdnxA23vob
 bn5t5wdDXdqkI8tEbKDusuVYeSlkrSI=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-10-62NMWyXuNZK801mT_3hYvQ-1; Fri, 26 Aug 2022 19:12:21 -0400
X-MC-Unique: 62NMWyXuNZK801mT_3hYvQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 m16-20020a056402431000b0044662a0ba2cso1842659edc.13
 for <qemu-devel@nongnu.org>; Fri, 26 Aug 2022 16:12:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=Qsqk+/tZj/l1X2BcmANA8UNdh29v3IMZ8Unky4JedO0=;
 b=P3/k6MnW+8ICpurREO9VzjPaF+HRHd/lNAJqOX/SmAmT9/KH+0dGWkFAIVZ4XTTruA
 yTCEoioyM9Cwb+oZi4H9senJKIHIDeMTju2pPaLfVMsFiD6nBYd2gw6ib4A38EzyWe7X
 875adBxoXI6sbU62Pz6ci0sR9eZ2+3e5nbEFQI3kv4s3nFTA3ph2afbotL6QFHnaF1yV
 V8ljei6x3U+yvbleaKcSn1EaJqlsxszHPtdh5S1IYHead2J9D8as0ieNYquOClXFMqdq
 /+XrpVr8jASXdJDT3kg/ghpwy0v1B/z3ubiUuuXwLT+qcL10hCYCSsbd+T+mOwNCwPaO
 llzQ==
X-Gm-Message-State: ACgBeo26Yp7BNd4Ap84lIkfRgbQ+g8YXmg1unzyG84mDMl4ZP4k+m7+4
 jsZ+FIkXYG7NE1POxc/B10Py7yldYK5FGgrQBSdRuAmruYVkhYzPyw84SLyQAxs4ua1CDoZk1rQ
 PtVbc2dqds6KG9kIlx5/Fk/vxjMBUMODoheIlaNqW2k2ouiMd7Sg1iAOMtT9qDeGnBak=
X-Received: by 2002:a50:ff13:0:b0:43e:76d3:63e1 with SMTP id
 a19-20020a50ff13000000b0043e76d363e1mr8192819edu.271.1661555540104; 
 Fri, 26 Aug 2022 16:12:20 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7JicnQll/WeBlEuVzZRXUyhhWOTEF3I4LlHwGNl+E7UZ4eI4E9VewBa6GYL9l9te5TUHuURw==
X-Received: by 2002:a50:ff13:0:b0:43e:76d3:63e1 with SMTP id
 a19-20020a50ff13000000b0043e76d363e1mr8192806edu.271.1661555539780; 
 Fri, 26 Aug 2022 16:12:19 -0700 (PDT)
Received: from goa-sendmail ([93.56.160.208]) by smtp.gmail.com with ESMTPSA id
 gg3-20020a170906e28300b0073dc3acfe26sm1407119ejb.65.2022.08.26.16.12.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 16:12:19 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	paul@nowt.org
Subject: [PATCH 07/23] i386: check SSE table flags instead of hardcoding
 opcodes
Date: Sat, 27 Aug 2022 01:11:48 +0200
Message-Id: <20220826231204.201395-8-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220826231204.201395-1-pbonzini@redhat.com>
References: <20220826231204.201395-1-pbonzini@redhat.com>
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
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Put more flags to work to avoid hardcoding lists of opcodes.  The op7 case
for SSE_OPF_CMP is included for homogeneity and because AVX needs it, but
it is never used by SSE or MMX.

Extracted from a patch by Paul Brook <paul@nowt.org>.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/tcg/translate.c | 75 +++++++++++++++----------------------
 1 file changed, 31 insertions(+), 44 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index c76f6dba11..849c40b685 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -3909,7 +3909,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
             tcg_gen_addi_ptr(s->ptr1, cpu_env, op2_offset);
             op6->op[b1](cpu_env, s->ptr0, s->ptr1);
 
-            if (b == 0x17) {
+            if (op6->flags & SSE_OPF_CMP) {
                 set_cc_op(s, CC_OP_EFLAGS);
             }
             break;
@@ -4463,6 +4463,9 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
             tcg_gen_addi_ptr(s->ptr0, cpu_env, op1_offset);
             tcg_gen_addi_ptr(s->ptr1, cpu_env, op2_offset);
             op7->op[b1](cpu_env, s->ptr0, s->ptr1, tcg_const_i32(val));
+            if (op7->flags & SSE_OPF_CMP) {
+                set_cc_op(s, CC_OP_EFLAGS);
+            }
             break;
 
         case 0x33a:
@@ -4518,28 +4521,24 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                 int sz = 4;
 
                 gen_lea_modrm(env, s, modrm);
-                op2_offset = offsetof(CPUX86State,xmm_t0);
+                op2_offset = offsetof(CPUX86State, xmm_t0);
 
-                switch (b) {
-                case 0x50 ... 0x5a:
-                case 0x5c ... 0x5f:
-                case 0xc2:
-                    /* Most sse scalar operations.  */
-                    if (b1 == 2) {
-                        sz = 2;
-                    } else if (b1 == 3) {
-                        sz = 3;
-                    }
-                    break;
-
-                case 0x2e:  /* ucomis[sd] */
-                case 0x2f:  /* comis[sd] */
-                    if (b1 == 0) {
-                        sz = 2;
+                if (sse_op_flags & SSE_OPF_SCALAR) {
+                    if (sse_op_flags & SSE_OPF_CMP) {
+                        /* ucomis[sd], comis[sd] */
+                        if (b1 == 0) {
+                            sz = 2;
+                        } else {
+                            sz = 3;
+                        }
                     } else {
-                        sz = 3;
+                        /* Most sse scalar operations.  */
+                        if (b1 == 2) {
+                            sz = 2;
+                        } else if (b1 == 3) {
+                            sz = 3;
+                        }
                     }
-                    break;
                 }
 
                 switch (sz) {
@@ -4585,26 +4584,14 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                 return;
             }
         }
-        switch(b) {
-        case 0x70: /* pshufx insn */
-        case 0xc6: /* pshufx insn */
+        tcg_gen_addi_ptr(s->ptr0, cpu_env, op1_offset);
+        tcg_gen_addi_ptr(s->ptr1, cpu_env, op2_offset);
+        if (sse_op_flags & SSE_OPF_SHUF) {
             val = x86_ldub_code(env, s);
-            tcg_gen_addi_ptr(s->ptr0, cpu_env, op1_offset);
-            tcg_gen_addi_ptr(s->ptr1, cpu_env, op2_offset);
             /* XXX: introduce a new table? */
             sse_fn_ppi = (SSEFunc_0_ppi)sse_fn_epp;
             sse_fn_ppi(s->ptr0, s->ptr1, tcg_const_i32(val));
-            break;
-        case 0xc2:
-            /* compare insns, bits 7:3 (7:5 for AVX) are ignored */
-            val = x86_ldub_code(env, s) & 7;
-            sse_fn_epp = sse_op_table4[val][b1];
-
-            tcg_gen_addi_ptr(s->ptr0, cpu_env, op1_offset);
-            tcg_gen_addi_ptr(s->ptr1, cpu_env, op2_offset);
-            sse_fn_epp(cpu_env, s->ptr0, s->ptr1);
-            break;
-        case 0xf7:
+        } else if (b == 0xf7) {
             /* maskmov : we must prepare A0 */
             if (mod != 3) {
                 goto illegal_op;
@@ -4613,19 +4600,19 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
             gen_extu(s->aflag, s->A0);
             gen_add_A0_ds_seg(s);
 
-            tcg_gen_addi_ptr(s->ptr0, cpu_env, op1_offset);
-            tcg_gen_addi_ptr(s->ptr1, cpu_env, op2_offset);
             /* XXX: introduce a new table? */
             sse_fn_eppt = (SSEFunc_0_eppt)sse_fn_epp;
             sse_fn_eppt(cpu_env, s->ptr0, s->ptr1, s->A0);
-            break;
-        default:
-            tcg_gen_addi_ptr(s->ptr0, cpu_env, op1_offset);
-            tcg_gen_addi_ptr(s->ptr1, cpu_env, op2_offset);
+        } else if (b == 0xc2) {
+            /* compare insns, bits 7:3 (7:5 for AVX) are ignored */
+            val = x86_ldub_code(env, s) & 7;
+            sse_fn_epp = sse_op_table4[val][b1];
+            sse_fn_epp(cpu_env, s->ptr0, s->ptr1);
+        } else {
             sse_fn_epp(cpu_env, s->ptr0, s->ptr1);
-            break;
         }
-        if (b == 0x2e || b == 0x2f) {
+
+        if (sse_op_flags & SSE_OPF_CMP) {
             set_cc_op(s, CC_OP_EFLAGS);
         }
     }
-- 
2.37.1



