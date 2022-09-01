Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E252A5A91F7
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 10:21:03 +0200 (CEST)
Received: from localhost ([::1]:54358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTfRe-0006nt-QD
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 04:21:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oTewk-00014X-7z
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 03:49:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28265)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oTewi-00036s-MU
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 03:49:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662018544;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WR9GJ5jTK5V3HkY/K2hWkBqs/3JL99qPzXMMzbn8l7o=;
 b=R1Kd3GW1BpcU9cQ3RH/p/gVBLaohogg/Gg6Z4XkknulO6F6WQ6oBakw9nZW9yjRnoOqhuz
 1Vr8Y0SAfffvbmi7gthD2eczGGQIh1limkbI6Dy9+Ta63QEagUPXsX4cpauAL3DLeQhooS
 wmiXfudJ6kKeU/LRLZmrD6dJd2jMzpM=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-201-0RtOvNDnPkKZlhFEIDkUAg-1; Thu, 01 Sep 2022 03:49:02 -0400
X-MC-Unique: 0RtOvNDnPkKZlhFEIDkUAg-1
Received: by mail-wr1-f71.google.com with SMTP id
 m21-20020adfa3d5000000b00226d1478469so2641790wrb.21
 for <qemu-devel@nongnu.org>; Thu, 01 Sep 2022 00:49:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=WR9GJ5jTK5V3HkY/K2hWkBqs/3JL99qPzXMMzbn8l7o=;
 b=6liepeyJY1esmD6WkVx7cKyrj3sxcU7uj5Z1A43B9Uo6yLq8/CbQwLhCoougtXkyT2
 tYvCMNHGpPbkP6sHDaBmN7LjZ2lHuZjq7STXB4d7v4mA3OARl3moMS+pCo2ubS33K6t9
 2/MYzN3uIu7dI/vr3tROV/cxUVj+r0DXJvzolJKlA6aB6KDpl4CCBc/e8IGIVm7eOi7s
 /8BkL4JdYpVUzV7kw4cKw4suPNQCJRiOxe4eBzWSk8b5t/7hCgRjShGrctEZNEz9Dt45
 iam+aQTNj9WvJou3ohtkzQpYpr1ctugbQrFbnhoLuS7qefs7oxD7i0/QlNViVv0PPeiz
 EAHg==
X-Gm-Message-State: ACgBeo2mvWpIhborRrQo10nb+KEvm2d0f/mc4AsNle/bN0U9JQKojw6W
 vuW1MxtF6LTPppnEvG3arwIoXt2tC6oOaAseRRS1lu/QG65lpq6Ze+N2OIKkjs0B2QtQRJeNJmk
 z/BB8T2P1x2OSjvw8xnF7bmsRu/KY9qNn3+fwsrGMfTrbyB455T+VPtOtK2RZhXqtI0A=
X-Received: by 2002:a5d:598c:0:b0:226:e676:c64c with SMTP id
 n12-20020a5d598c000000b00226e676c64cmr5871975wri.580.1662018541259; 
 Thu, 01 Sep 2022 00:49:01 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7fJNQqCDTO9tabyaQwOvSHK0uUsDwLoEpWJoF2koHDfKBDmsNtGq66fnoT/Qj063Nu2nKOCg==
X-Received: by 2002:a5d:598c:0:b0:226:e676:c64c with SMTP id
 n12-20020a5d598c000000b00226e676c64cmr5871959wri.580.1662018540897; 
 Thu, 01 Sep 2022 00:49:00 -0700 (PDT)
Received: from goa-sendmail ([93.56.160.208]) by smtp.gmail.com with ESMTPSA id
 11-20020a05600c268b00b003a60bc8ae8fsm4336523wmt.21.2022.09.01.00.49.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Sep 2022 00:49:00 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: paul@nowt.org,
	richard.henderson@linaro.org
Subject: [PATCH v3 08/23] i386: isolate MMX code more
Date: Thu,  1 Sep 2022 09:48:27 +0200
Message-Id: <20220901074842.57424-9-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220901074842.57424-1-pbonzini@redhat.com>
References: <20220901074842.57424-1-pbonzini@redhat.com>
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

Extracted from a patch by Paul Brook <paul@nowt.org>.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/tcg/translate.c | 52 +++++++++++++++++++++++--------------
 1 file changed, 33 insertions(+), 19 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 849c40b685..097c895ef1 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -3888,6 +3888,12 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                         gen_ldo_env_A0(s, op2_offset);
                     }
                 }
+                if (!op6->op[b1]) {
+                    goto illegal_op;
+                }
+                tcg_gen_addi_ptr(s->ptr0, cpu_env, op1_offset);
+                tcg_gen_addi_ptr(s->ptr1, cpu_env, op2_offset);
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



