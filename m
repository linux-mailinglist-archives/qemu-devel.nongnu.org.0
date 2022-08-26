Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC105A3291
	for <lists+qemu-devel@lfdr.de>; Sat, 27 Aug 2022 01:24:36 +0200 (CEST)
Received: from localhost ([::1]:52636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRigl-0006Jc-VR
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 19:24:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oRiUx-0006b5-DN
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 19:12:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60890)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oRiUv-0007pJ-QG
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 19:12:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661555541;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a5u+pTezVEAVGRqU1R5Cw6KDqL7HfzBbIXOPN2TtMv8=;
 b=bR5OvdvZARslVPMScYKqWEgqXAqi9xtKk0YjKwXvbjFB+KLd3xOptc6mdCsg8PUBgA/g2J
 DdB9B+ebiRz+/6eyAeDTXNZ5k1XDeWvQELboXGBMOmWDoMLAtkJ50EvuHfruDM5KxIukqT
 Qp+Hp4cOt8PpqVXrdjiHFNjL2wPSHnQ=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-657-QSxi59ajNcKm0f77Fg08uw-1; Fri, 26 Aug 2022 19:12:20 -0400
X-MC-Unique: QSxi59ajNcKm0f77Fg08uw-1
Received: by mail-ed1-f72.google.com with SMTP id
 b13-20020a056402350d00b0043dfc84c533so1842273edd.5
 for <qemu-devel@nongnu.org>; Fri, 26 Aug 2022 16:12:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=a5u+pTezVEAVGRqU1R5Cw6KDqL7HfzBbIXOPN2TtMv8=;
 b=zXi2vPIOO40Y749FPWr8YxRXfom7T9KnT3JCc8Xq0xW9Q/9hJJnTHxf4yQ6VTLdI/Y
 h1aLdVhGkK0cJChiziV4VzIGNc2sKDLN6228VNWBevk5OG8Fjyp8Tvuz15KSvuaQRAl0
 GSVGS6ejfUOZJJD14xgfO4cDuqHLNjmzfvouX0s3R5WBvfeYdoxbPPVG5dWWDfj61RF7
 JaETDVZkNfxzcF7ApM4Fgj3A8kmUwqT9x7U0+oTnxAsSLsqxoM2HTjezILVb+i7HZvM8
 +iVU6l1asoJVTpMZh3Cmf31ZmQ7Thy4+bHZ+Y2z0TvKL8t1ifzdxrWidgUcWlq6TZjvI
 tDhw==
X-Gm-Message-State: ACgBeo30dBjZGJFublLc1Ccs7/VgHQTsyOE1PvTIaUWpshD3DYvGReRH
 023JCPLD3fbmeU5CR2gsMIpT/1gf48gPFxremOJCtep41LXCutjJkv1EiAicmDPlVkGh6ASyPzS
 TfImCYe7r8qiGeARBfMr1ULDH7clebJQAdZdsu18L80LKONfzAOCg9e8B4BSRojDXplU=
X-Received: by 2002:a05:6402:909:b0:435:a8b:5232 with SMTP id
 g9-20020a056402090900b004350a8b5232mr8257427edz.240.1661555538679; 
 Fri, 26 Aug 2022 16:12:18 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4kw6hfrbXrInaD/z3PxAOlhY+qtGfHxUoChBz3lHq1sW1Ssbn4L9U8aa2KiQ9duQL4yA2NHg==
X-Received: by 2002:a05:6402:909:b0:435:a8b:5232 with SMTP id
 g9-20020a056402090900b004350a8b5232mr8257415edz.240.1661555538352; 
 Fri, 26 Aug 2022 16:12:18 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 n2-20020a170906088200b0073d678f50bfsm1369988eje.164.2022.08.26.16.12.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 16:12:17 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	paul@nowt.org
Subject: [PATCH 06/23] i386: Move 3DNOW decoder
Date: Sat, 27 Aug 2022 01:11:47 +0200
Message-Id: <20220826231204.201395-7-pbonzini@redhat.com>
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

From: Paul Brook <paul@nowt.org>

Handle 3DNOW instructions early to avoid complicating the MMX/SSE logic.

Signed-off-by: Paul Brook <paul@nowt.org>
Message-Id: <20220424220204.2493824-25-paul@nowt.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/tcg/translate.c | 30 +++++++++++++++++-------------
 1 file changed, 17 insertions(+), 13 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index b7321b7588..c76f6dba11 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -3216,6 +3216,11 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
             is_xmm = 1;
         }
     }
+    if (sse_op_flags & SSE_OPF_3DNOW) {
+        if (!(s->cpuid_ext2_features & CPUID_EXT2_3DNOW)) {
+            goto illegal_op;
+        }
+    }
     /* simple MMX/SSE operation */
     if (s->flags & HF_TS_MASK) {
         gen_exception(s, EXCP07_PREX, pc_start - s->cs_base);
@@ -4567,21 +4572,20 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                 rm = (modrm & 7);
                 op2_offset = offsetof(CPUX86State,fpregs[rm].mmx);
             }
+            if (sse_op_flags & SSE_OPF_3DNOW) {
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



