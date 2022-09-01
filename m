Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7617C5A921D
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 10:31:57 +0200 (CEST)
Received: from localhost ([::1]:48108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTfcC-0000z6-Fs
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 04:31:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oTewi-00011y-JT
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 03:49:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37693)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oTewh-00036d-25
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 03:49:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662018542;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Qsqk+/tZj/l1X2BcmANA8UNdh29v3IMZ8Unky4JedO0=;
 b=UMLHr3MLFQvQD5bXA48xDpHQapK6f4Rty4tW2wB/n0myLsevmxvjG3yV4+YYi47J1OiATy
 SpC0cNT69l11RiPQ3k8AvtSsWtzgKuG2rfyiRrJEU8GklwXrM2216WsZeGwvBEKA2gQdCa
 yoaTOYvnAonXmRfxd5GPupFE8+4OO3k=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-616-TCHZhegvNFyJVzRNDd3cTg-1; Thu, 01 Sep 2022 03:49:01 -0400
X-MC-Unique: TCHZhegvNFyJVzRNDd3cTg-1
Received: by mail-wm1-f71.google.com with SMTP id
 q16-20020a1cf310000000b003a626026ed1so518468wmq.4
 for <qemu-devel@nongnu.org>; Thu, 01 Sep 2022 00:49:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=Qsqk+/tZj/l1X2BcmANA8UNdh29v3IMZ8Unky4JedO0=;
 b=CWMwFEW5f1rthbxBq7sRfmgjarQ5oFctPTDRGShu8rgOqKF/iK87abC1XYkvQBA8bv
 /5apcdOj/z1uXZhwoI3foxa3BssiOCpsoD16fxXtjCCz522ZT7pkopeZrEx5s+2cFNoX
 IzEm3XvM79f0zhmsb0SObBLWDtFnnNE3UWT2xvJFqXYOGVRbRbiz9JdGXzlO3MAhAgdm
 O7aNegN7zA4EnGWy2IfhemUeVm9/Vi7ZvYqH03zBLDR1vfFjHjmTwRTUin0zkBgTxV9r
 Ckp3ezPAgcVaa+TZXVsjiSnYwaq/ubaKZajNVaIor+gRQecAj3iIOjlBqBMRDvkYXCBJ
 8ILw==
X-Gm-Message-State: ACgBeo3V7eGYjXlgCs8ZWtMfViI5RH06mT//CFU8e+TKCuHTK+D9rzUk
 CNjEu55BwNhq4ff739liaAavqv+cfND9J2bKKSedvfxrAYjhqF4UkDGQ1+xendsMyvuWVnXt6rE
 Tg9jJGH61v6w8bad8XcsXvPUk4LCkmdCSuJHxstAK7+rbwGzF2s18VXxf1AvCn7klpQQ=
X-Received: by 2002:adf:fb8f:0:b0:225:2def:221e with SMTP id
 a15-20020adffb8f000000b002252def221emr13794316wrr.130.1662018539738; 
 Thu, 01 Sep 2022 00:48:59 -0700 (PDT)
X-Google-Smtp-Source: AA6agR72nbSfkRtNGPyKCOLAzt49KEVkx9PC8a+FqvWiMFFp1xEVIUeQTN1sevBUBOkMU77JiDumFQ==
X-Received: by 2002:adf:fb8f:0:b0:225:2def:221e with SMTP id
 a15-20020adffb8f000000b002252def221emr13794302wrr.130.1662018539433; 
 Thu, 01 Sep 2022 00:48:59 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id
 t12-20020a05600c198c00b003a2e92edeccsm4679026wmq.46.2022.09.01.00.48.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Sep 2022 00:48:58 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: paul@nowt.org,
	richard.henderson@linaro.org
Subject: [PATCH v3 07/23] i386: check SSE table flags instead of hardcoding
 opcodes
Date: Thu,  1 Sep 2022 09:48:26 +0200
Message-Id: <20220901074842.57424-8-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220901074842.57424-1-pbonzini@redhat.com>
References: <20220901074842.57424-1-pbonzini@redhat.com>
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



