Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FCCC5FB15C
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 13:20:23 +0200 (CEST)
Received: from localhost ([::1]:52172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiDJ8-0003KV-HE
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 07:20:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oiCUe-0002WM-FK
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 06:28:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oiCUb-0004b5-PO
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 06:28:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665484089;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8EkHY0WoWXhFfht/JJLtepwJCD/svE3cJ5Ov63qiC58=;
 b=Y8sVAGaGpFCLL2gaGk/Gzp0kRBQnADVbmFyJcU408BkCN2Qwtt6gxJcxGz4P66v74kguWR
 bslmOsE4JQmiVUE4pw+U/8a6GX47Cn1h9Gt1djC8oS4h584X/Z9JTpqlcuPvb09+6IFIBz
 +BmdTXzGBAWsmHtVu+SUA+L+HrWKgL0=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-29-FNCXTdXePOq-sTtUnbmwSA-1; Tue, 11 Oct 2022 06:28:08 -0400
X-MC-Unique: FNCXTdXePOq-sTtUnbmwSA-1
Received: by mail-ed1-f70.google.com with SMTP id
 x4-20020a05640226c400b0045c09fc1bd4so4278120edd.7
 for <qemu-devel@nongnu.org>; Tue, 11 Oct 2022 03:28:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8EkHY0WoWXhFfht/JJLtepwJCD/svE3cJ5Ov63qiC58=;
 b=42Uw4IWbbtOz/q90F8mydWQSqetkVIItjD6a+OghZKQCygaSVtJpIENCJ/6y3nNjwF
 M5JBMqwqsZk/KYiBQHuushcCVQtQH8HKQH0bCf7ttndRJYUZZUvXqCGTmjG2O1MAKBV2
 oRnE5+84HMiv3YlUVxKdDkwrtEqMGJM36UgLQa/CSEZI3bG0Q/VtQR6souW0eAuz6Sbh
 pwoCUpi54f/hSJ2g00TZN5mMPgP8X59yOn0QVfbgq59T6wWcgC10GwKeN8QUrCHZ+Jbt
 LvlhskmJ+JPCR4WFz5iK74zSF6Muy/RfGxRUguzJs7K8g0Trhg8vJ3GX1mWDA0cru7h0
 hqvg==
X-Gm-Message-State: ACrzQf0D3Rlty2kDtNny53hsi8/9fHVG1U9y3rfTg2eXmBbYjtqIIVMC
 tnUUjpoxNByhHVA58TusT1heqdSJ3tXnMgKWp31zv0BRSlTz61NnYufmBq3z3Y691/J4+fytS38
 hGcWHUqh97lHpkc3RVyORe+7DOKHrEQwmkcegshMahLvZj9aidWRG+sPprZENPs+wlqs=
X-Received: by 2002:aa7:cc8a:0:b0:45b:f851:2943 with SMTP id
 p10-20020aa7cc8a000000b0045bf8512943mr12101519edt.103.1665484086379; 
 Tue, 11 Oct 2022 03:28:06 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6MEcdJvo8EoG1wYw4ePIUcEfTb3Gk/d/EIc1DSIFv0zzOGAuTItkisJfuSsl7YjLvS0ssgYA==
X-Received: by 2002:aa7:cc8a:0:b0:45b:f851:2943 with SMTP id
 p10-20020aa7cc8a000000b0045bf8512943mr12101499edt.103.1665484086136; 
 Tue, 11 Oct 2022 03:28:06 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:aad8:f393:e009:e014])
 by smtp.gmail.com with ESMTPSA id
 jw13-20020a17090776ad00b00731803d4d04sm6718907ejc.82.2022.10.11.03.28.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Oct 2022 03:28:05 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 22/37] target/i386: Create gen_jmp_rel
Date: Tue, 11 Oct 2022 12:26:45 +0200
Message-Id: <20221011102700.319178-23-pbonzini@redhat.com>
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

Create a common helper for pc-relative branches.  The jmp jb insn
was missing a mask for CODE32.  In all cases the CODE64 check was
incorrectly placed, allowing PREFIX_DATA to truncate %rip to 16 bits.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20221001140935.465607-18-richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/tcg/translate.c | 58 ++++++++++++++++++-------------------
 1 file changed, 29 insertions(+), 29 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 11aaba8a65..ba1bd7c707 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -226,6 +226,7 @@ static void gen_eob(DisasContext *s);
 static void gen_jr(DisasContext *s);
 static void gen_jmp(DisasContext *s, target_ulong eip);
 static void gen_jmp_tb(DisasContext *s, target_ulong eip, int tb_num);
+static void gen_jmp_rel(DisasContext *s, MemOp ot, int diff, int tb_num);
 static void gen_op(DisasContext *s1, int op, MemOp ot, int d);
 static void gen_exception_gpf(DisasContext *s);
 
@@ -2792,6 +2793,21 @@ static void gen_jmp_tb(DisasContext *s, target_ulong eip, int tb_num)
     }
 }
 
+static void gen_jmp_rel(DisasContext *s, MemOp ot, int diff, int tb_num)
+{
+    target_ulong dest = s->pc - s->cs_base + diff;
+
+    /* In 64-bit mode, operand size is fixed at 64 bits. */
+    if (!CODE64(s)) {
+        if (ot == MO_16) {
+            dest &= 0xffff;
+        } else {
+            dest &= 0xffffffff;
+        }
+    }
+    gen_jmp_tb(s, dest, tb_num);
+}
+
 static void gen_jmp(DisasContext *s, target_ulong eip)
 {
     gen_jmp_tb(s, eip, 0);
@@ -6862,20 +6878,12 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
         break;
     case 0xe8: /* call im */
         {
-            if (dflag != MO_16) {
-                tval = (int32_t)insn_get(env, s, MO_32);
-            } else {
-                tval = (int16_t)insn_get(env, s, MO_16);
-            }
-            tval += s->pc - s->cs_base;
-            if (dflag == MO_16) {
-                tval &= 0xffff;
-            } else if (!CODE64(s)) {
-                tval &= 0xffffffff;
-            }
+            int diff = (dflag != MO_16
+                        ? (int32_t)insn_get(env, s, MO_32)
+                        : (int16_t)insn_get(env, s, MO_16));
             gen_push_v(s, eip_next_tl(s));
             gen_bnd_jmp(s);
-            gen_jmp(s, tval);
+            gen_jmp_rel(s, dflag, diff, 0);
         }
         break;
     case 0x9a: /* lcall im */
@@ -6893,19 +6901,13 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
         }
         goto do_lcall;
     case 0xe9: /* jmp im */
-        if (dflag != MO_16) {
-            tval = (int32_t)insn_get(env, s, MO_32);
-        } else {
-            tval = (int16_t)insn_get(env, s, MO_16);
+        {
+            int diff = (dflag != MO_16
+                        ? (int32_t)insn_get(env, s, MO_32)
+                        : (int16_t)insn_get(env, s, MO_16));
+            gen_bnd_jmp(s);
+            gen_jmp_rel(s, dflag, diff, 0);
         }
-        tval += s->pc - s->cs_base;
-        if (dflag == MO_16) {
-            tval &= 0xffff;
-        } else if (!CODE64(s)) {
-            tval &= 0xffffffff;
-        }
-        gen_bnd_jmp(s);
-        gen_jmp(s, tval);
         break;
     case 0xea: /* ljmp im */
         {
@@ -6922,12 +6924,10 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
         }
         goto do_ljmp;
     case 0xeb: /* jmp Jb */
-        tval = (int8_t)insn_get(env, s, MO_8);
-        tval += s->pc - s->cs_base;
-        if (dflag == MO_16) {
-            tval &= 0xffff;
+        {
+            int diff = (int8_t)insn_get(env, s, MO_8);
+            gen_jmp_rel(s, dflag, diff, 0);
         }
-        gen_jmp(s, tval);
         break;
     case 0x70 ... 0x7f: /* jcc Jb */
         tval = (int8_t)insn_get(env, s, MO_8);
-- 
2.37.3


