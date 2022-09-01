Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAF595A9210
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 10:26:55 +0200 (CEST)
Received: from localhost ([::1]:58992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTfXJ-0003aH-KN
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 04:26:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oTewh-00011r-Lb
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 03:49:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oTewf-00036I-6K
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 03:49:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662018540;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a5u+pTezVEAVGRqU1R5Cw6KDqL7HfzBbIXOPN2TtMv8=;
 b=W8QxUBgkKBfi1mKb4QX3fhAmgHSP+lqmngKn08IxSuePWMWJWd9xFXjygN307odj1+LBfN
 yJLybnyE0N2XuVLitQXtiyX7zMQQHhIII9IZI69v5oDZY+ZwOnWT8zzPUaclwgkLSZ1V5k
 2yYAFmoEZHLfx5cHGyIqS/cusq8mYIU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-646-u_4CwCiqNsu43IymELZNKg-1; Thu, 01 Sep 2022 03:48:59 -0400
X-MC-Unique: u_4CwCiqNsu43IymELZNKg-1
Received: by mail-wm1-f70.google.com with SMTP id
 f7-20020a1c6a07000000b003a60ede816cso528145wmc.0
 for <qemu-devel@nongnu.org>; Thu, 01 Sep 2022 00:48:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=a5u+pTezVEAVGRqU1R5Cw6KDqL7HfzBbIXOPN2TtMv8=;
 b=MROFrGfZLwecDbYnLUiSu79k1KtI23lF7E7oSc2uuSjltWedo6ZpxIE7ntWj+lI8+c
 L50T1xYJDNNWdHSRQmbh7NlHFdRR7Bugs7fXDWqQ6vrKufHLJaaMsW/W/KKXF8BzQ6ZX
 K9PZ9hCOIVu9u93w0mKe3tU1x80YmsWrc2NvdB5q5a1m6b0X/W1lK381dTx3md/4dNZO
 hoZzc/zR3VZHQUJKIPBUvy9g/wQYBc2PzzWCDSHtDcEKzugp3nA8kwoo6Iw3xLGvPzf1
 5pATYD3Mw6wwhkiSH9RnMIoMr8s10kBVuUgvuNwN8XkxbbRZjUZDyT8lkZdmKLsN5x6T
 dzwQ==
X-Gm-Message-State: ACgBeo0/XCHLbUfRXIQ77InmoC326EKIrbS6d/ND7CCaceFXXvnSjRPx
 B9jlE5PVMZTqMSHtGtoxxIEZVFdJ6eBjzsslSRCxfITzLdn9uNqAhpHYmpkItUzUtmEjLg5YoWA
 zbYpf/pRzZD0Al3UtMdewSH9N4MDEtaafBZs6HTkAAJb9i3j+xTClpsdkjJZfbkspmTs=
X-Received: by 2002:a5d:5581:0:b0:20f:fc51:7754 with SMTP id
 i1-20020a5d5581000000b0020ffc517754mr14351457wrv.413.1662018538093; 
 Thu, 01 Sep 2022 00:48:58 -0700 (PDT)
X-Google-Smtp-Source: AA6agR63ClZZCrdL4TZJAV2G4EMocPyEhbnYfiTLOwpV93DTQwLB9fhf/J0ul1Xgeych+ol7ViydXg==
X-Received: by 2002:a5d:5581:0:b0:20f:fc51:7754 with SMTP id
 i1-20020a5d5581000000b0020ffc517754mr14351443wrv.413.1662018537756; 
 Thu, 01 Sep 2022 00:48:57 -0700 (PDT)
Received: from goa-sendmail ([93.56.160.208]) by smtp.gmail.com with ESMTPSA id
 r10-20020a05600c284a00b003a531c7aa66sm4525658wmb.1.2022.09.01.00.48.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Sep 2022 00:48:57 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: paul@nowt.org,
	richard.henderson@linaro.org
Subject: [PATCH v3 06/23] i386: Move 3DNOW decoder
Date: Thu,  1 Sep 2022 09:48:25 +0200
Message-Id: <20220901074842.57424-7-pbonzini@redhat.com>
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



