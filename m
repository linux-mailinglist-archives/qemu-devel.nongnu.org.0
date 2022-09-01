Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 689DE5A9F6E
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 20:52:31 +0200 (CEST)
Received: from localhost ([::1]:45344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTpIk-0004rU-Hf
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 14:52:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oTosY-0008K0-AC
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 14:25:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37193)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oTosP-000071-Pl
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 14:25:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662056717;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UpTn0THymeaY2WAojsZwoXAnzxdT3LBsjSwRXp+oaJA=;
 b=Gu0weQwwnw+SsApJ0f7fnYf8DfAdLHQVcJjxuGNMzrnXgG8U/evWeFdWpOJEFae+TOC1mS
 L3E121dH/mBZ8L958Mtq47gEXvBAUCwDdYYzZLSndH3DDhB2sfCl/9t05y9yuHC1AcB6xV
 4uf3yjuCrsVvk/BLzB7XIw4Hl8IGKEY=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-588-_AlEeDtBPXG8lpTPHQa9xA-1; Thu, 01 Sep 2022 14:25:15 -0400
X-MC-Unique: _AlEeDtBPXG8lpTPHQa9xA-1
Received: by mail-ej1-f69.google.com with SMTP id
 hp14-20020a1709073e0e00b00741a2093c4aso5616539ejc.20
 for <qemu-devel@nongnu.org>; Thu, 01 Sep 2022 11:25:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=UpTn0THymeaY2WAojsZwoXAnzxdT3LBsjSwRXp+oaJA=;
 b=vZmSQYzQxWqIzJCkw1nomA63bOEPzTCUqP6H4jY0bht8fTc6hJaoFzEjDOd1uond03
 5YpawlWSQd69vnM8m3AjBWwwWLnaNVHxuxj8jb79lCfXTrZxEfI43+Z4j81nft4F1i+6
 B8zGeTQjwKD1zkQVT2dGvBmpG9R7syKTpf81Al4KSofi5Q+ZQ7kSL97QV53f+C9xwEeX
 KPJ4Z1W7LxsLqmmBLQ7HUA8V58fIQ4eawP1y7RsYIQTKGWFRjZXnf0shy7+hDt84olDG
 ciK6vQuGflzAAt5dYRlRK64l7rInC04o7q/qbVJ83bWJKyybR/fjgLo4tq//xVWDrVtW
 jkLQ==
X-Gm-Message-State: ACgBeo23i/ImdRqa/l3GuYG+E3jOlGx3cjWhboCL72ixxrCBkbPRFjwz
 NsaBhg7VzeCl8kX8ScU9Y3u9QvY0wBSOGi8ZJRETn8Sj9QlgETQkSmJ5OSCLGjN0nns7wljLVcd
 EjN86UmmsCZNaVVdJVU+78x08+0xjs4yyAO5VREeB8uJvPQItr3r6xjw0xETtebEdQ4A=
X-Received: by 2002:a17:907:9495:b0:734:e049:3d15 with SMTP id
 dm21-20020a170907949500b00734e0493d15mr25569921ejc.187.1662056714452; 
 Thu, 01 Sep 2022 11:25:14 -0700 (PDT)
X-Google-Smtp-Source: AA6agR49MUza3gDxH3q+KQb0UwBLPpZxYM5u/FKk4sjeOWqF8kFxMBDje5dHNxTgPd6GUZ6qHtYmWA==
X-Received: by 2002:a17:907:9495:b0:734:e049:3d15 with SMTP id
 dm21-20020a170907949500b00734e0493d15mr25569898ejc.187.1662056714039; 
 Thu, 01 Sep 2022 11:25:14 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 t23-20020aa7db17000000b00445b3cab975sm1747535eds.56.2022.09.01.11.25.13
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Sep 2022 11:25:13 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 22/39] target/i386: check SSE table flags instead of hardcoding
 opcodes
Date: Thu,  1 Sep 2022 20:24:12 +0200
Message-Id: <20220901182429.93533-23-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220901182429.93533-1-pbonzini@redhat.com>
References: <20220901182429.93533-1-pbonzini@redhat.com>
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
2.37.2



