Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E3255A1C36
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 00:23:42 +0200 (CEST)
Received: from localhost ([::1]:49760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRLGG-0002L7-5U
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 18:23:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oRL7J-0007VL-AK
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 18:14:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43220)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oRL7H-0002iY-LS
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 18:14:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661465663;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SjRmVtD48zaI4ofzZel1Dh+zA4qcu+w0B637Dv0CBVg=;
 b=R4+0Dg9eapyQl9fRS6qtzXK6nLhsFMZgOePxslWapmGlx2AnDsxEWUg+nY8fzg4zr74lsA
 yDFBSZ+2nFgAhqBTb82HRXh6WT4gxFzKskJqSp2GBAUqfu+jroUgIDg/wodj6laAQT0yMR
 nE1nOtmpvTcOgyAlVnuNW9kWKEOT9cY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-639-iw6WXNsUOi-O9DsuBefL9w-1; Thu, 25 Aug 2022 18:14:21 -0400
X-MC-Unique: iw6WXNsUOi-O9DsuBefL9w-1
Received: by mail-wm1-f72.google.com with SMTP id
 h82-20020a1c2155000000b003a64d0510d9so6506033wmh.8
 for <qemu-devel@nongnu.org>; Thu, 25 Aug 2022 15:14:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=SjRmVtD48zaI4ofzZel1Dh+zA4qcu+w0B637Dv0CBVg=;
 b=zah6KlZYZkzCzWiA8EHyB9fz7Yzsv2q63FCNvJqTWcW/pYs9Eqep1zwBAlr54NMeDB
 APz4DHkP0J/mVyRyaYxs+y7/yETF4/kalnIvzxB9OIx8mDD8PY3mwyLrz4IM+RFxJzKS
 TU6puo02+5w6YmrXXn+dB/SNPW/ePii4w53jfMqZP98hPipW7MYMazAKJVll+CWbMdCd
 8gFnV8+D7v36EaczEx17Z1wotX/lUhayjOksI0BHEVKkjXApxrV8i9+GuWhz1BS/PGWy
 j+lkx9MeXlv1/oGLV0ZqX5n4EQ2lGaKJoIXvlXs0rRq4Fuph3uyyCv7wT+5MLtJPeWgM
 1FPg==
X-Gm-Message-State: ACgBeo2A42Z/e0oA2tGBQiq14erCZ2EtiDjirR4+TzZ4ENldFW/WwQfa
 zKZHmI2cVohTEUf23eQzaawQluSqrQwo/6mDZL9j21kZNiCrkfSVlasXj1Sr9Qu0mOm8g8n6zon
 fnKUykMf3rCj/YniDvC4BESPeFP1KbuySRNFtY8mPsJ1oykhp1UMQHU+q/tLjJKUWv6E=
X-Received: by 2002:a05:6000:904:b0:21a:3dca:4297 with SMTP id
 bz4-20020a056000090400b0021a3dca4297mr3322437wrb.487.1661465660039; 
 Thu, 25 Aug 2022 15:14:20 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5zBcVAvMLzwvbzuvJ/ykOT/Hb6MNi9k8oMa8H8XmbWWypX7p9r0l0UQuvQJxYAKipWPFyDqQ==
X-Received: by 2002:a05:6000:904:b0:21a:3dca:4297 with SMTP id
 bz4-20020a056000090400b0021a3dca4297mr3322423wrb.487.1661465659710; 
 Thu, 25 Aug 2022 15:14:19 -0700 (PDT)
Received: from goa-sendmail ([93.56.160.208]) by smtp.gmail.com with ESMTPSA id
 z12-20020adff74c000000b002252f57865asm343544wrp.15.2022.08.25.15.14.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Aug 2022 15:14:19 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: paul@nowt.org,
	richard.henderson@linaro.org
Subject: [PATCH 04/18] i386: Move 3DNOW decoder
Date: Fri, 26 Aug 2022 00:13:57 +0200
Message-Id: <20220825221411.35122-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220825221411.35122-1-pbonzini@redhat.com>
References: <20220825221411.35122-1-pbonzini@redhat.com>
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

From: Paul Brook <paul@nowt.org>

Handle 3DNOW instructions early to avoid complicating the AVX logic.

Signed-off-by: Paul Brook <paul@nowt.org>
Message-Id: <20220424220204.2493824-25-paul@nowt.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/tcg/translate.c | 30 +++++++++++++++++-------------
 1 file changed, 17 insertions(+), 13 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 66ba690b7d..a51a5daff9 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -3223,6 +3223,11 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
             is_xmm = 1;
         }
     }
+    if (sse_op.flags & SSE_OPF_3DNOW) {
+        if (!(s->cpuid_ext2_features & CPUID_EXT2_3DNOW)) {
+            goto illegal_op;
+        }
+    }
     /* simple MMX/SSE operation */
     if (s->flags & HF_TS_MASK) {
         gen_exception(s, EXCP07_PREX, pc_start - s->cs_base);
@@ -4600,21 +4605,20 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                 rm = (modrm & 7);
                 op2_offset = offsetof(CPUX86State,fpregs[rm].mmx);
             }
+            if (sse_op.flags & SSE_OPF_3DNOW) {
+                /* 3DNow! data insns */
+                val = x86_ldub_code(env, s);
+                SSEFunc_0_epp op_3dnow = sse_op_table5[val];
+                if (!op_3dnow) {
+                    goto unknown_op;
+                }
+                tcg_gen_addi_ptr(s->ptr0, cpu_env, op1_offset);
+                tcg_gen_addi_ptr(s->ptr1, cpu_env, op2_offset);
+                op_3dnow(cpu_env, s->ptr0, s->ptr1);
+                return;
+            }
         }
         switch(b) {
-        case 0x0f: /* 3DNow! data insns */
-            val = x86_ldub_code(env, s);
-            sse_fn_epp = sse_op_table5[val];
-            if (!sse_fn_epp) {
-                goto unknown_op;
-            }
-            if (!(s->cpuid_ext2_features & CPUID_EXT2_3DNOW)) {
-                goto illegal_op;
-            }
-            tcg_gen_addi_ptr(s->ptr0, cpu_env, op1_offset);
-            tcg_gen_addi_ptr(s->ptr1, cpu_env, op2_offset);
-            sse_fn_epp(cpu_env, s->ptr0, s->ptr1);
-            break;
         case 0x70: /* pshufx insn */
         case 0xc6: /* pshufx insn */
             val = x86_ldub_code(env, s);
-- 
2.37.1



