Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E751D5A9F75
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 20:57:23 +0200 (CEST)
Received: from localhost ([::1]:60968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTpNT-0001Z8-2b
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 14:57:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oTosZ-0008Kr-6Q
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 14:25:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49736)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oTosQ-000077-Ig
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 14:25:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662056718;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JIDRVZLO2uBKKjEnIcGPwoXMi4XHIzBm4KljvLuJioo=;
 b=crtitxrKZln2J6WAYxKpOANHF1uvH48F0+WZsdQ/MsblNKUCU69xyDvyYx4ulys5wP39Oi
 RAOyZ6NsEeJc48LRr7sZ+dOW7V7jXyKf8nGF7iPuWKtwnfCjvw++Rs5eBsvc0T57itdwpj
 aRwvwlAS8vr2XzIV7TNolaoWGNBqfvs=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-490-KWhQ1PuCPOCuNc4Yrvr4oQ-1; Thu, 01 Sep 2022 14:25:17 -0400
X-MC-Unique: KWhQ1PuCPOCuNc4Yrvr4oQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 f14-20020a0564021e8e00b00448da245f25so5641687edf.18
 for <qemu-devel@nongnu.org>; Thu, 01 Sep 2022 11:25:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=JIDRVZLO2uBKKjEnIcGPwoXMi4XHIzBm4KljvLuJioo=;
 b=SUmDAJgCzFsfZUC4heNWwRpgCgmQsQ9gZ4vJk/i2v3ltEo/F/gyunbovL4q2yqE0N1
 4Y2SaIgV+dgL99wZ5UK2rUwqRQsQwgLIZ9t0DFDruknGtYF2vb2MvrnDY7T9Yk9aaliW
 I61NRsZWR5P0NkgEWdQsIF8dgr9/7umVbEiAj7oERibgGccNQvUlva6vSMo7yilSdx02
 Ti64LuZ+jrfOxLaWerdvVDZXea8UTepcdcIumvbGrDvwpCoi9/F9YN3536ZBxsm3MzcZ
 94N7olH6vaxBde9FZuBNlOqZt0v8+H8jgyrq/KFm2wEpag1A4zWW/SSZflH9P2hlYBYP
 aANg==
X-Gm-Message-State: ACgBeo0QJ7ADIl0gE4cCMTIF87W8Hszo+GkUXzhcLLcqIpJXVFNmq+BN
 tAd3Od1pYzn0CfkS3qLNMsMXYYUu8ZzU186AV/6Vk4vA88y/DvoRTibOy1ICRk+AKk9fzx3V1Gc
 EZ61BXGIP4QBug+S6wPxEkP9atTfFr+sSupQuZzIJ48DlRWMKLSdKIZkecH+jG5+XWP8=
X-Received: by 2002:a05:6402:2d6:b0:447:ae9d:d0f1 with SMTP id
 b22-20020a05640202d600b00447ae9dd0f1mr29908977edx.256.1662056715699; 
 Thu, 01 Sep 2022 11:25:15 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6qZJ1cLB78PEt3XX9AEeFRqVGMv0fsH/wcapE3jrmaYnz5rCyr8fSq3khb/B+2Gb0UnbNVxg==
X-Received: by 2002:a05:6402:2d6:b0:447:ae9d:d0f1 with SMTP id
 b22-20020a05640202d600b00447ae9dd0f1mr29908961edx.256.1662056715403; 
 Thu, 01 Sep 2022 11:25:15 -0700 (PDT)
Received: from goa-sendmail ([93.56.160.208]) by smtp.gmail.com with ESMTPSA id
 v2-20020a50a442000000b00447bd64d4f6sm1795985edb.73.2022.09.01.11.25.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Sep 2022 11:25:14 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 23/39] target/i386: isolate MMX code more
Date: Thu,  1 Sep 2022 20:24:13 +0200
Message-Id: <20220901182429.93533-24-pbonzini@redhat.com>
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
2.37.2



