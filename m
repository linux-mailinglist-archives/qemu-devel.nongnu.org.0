Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F875A9F6D
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 20:52:19 +0200 (CEST)
Received: from localhost ([::1]:47690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTpIW-0004f0-Rv
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 14:52:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oTosV-0008Eg-28
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 14:25:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29063)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oTosO-00006l-Cy
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 14:25:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662056715;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TRSBxJ+kyWBpg1Sk50ijsEg3buEI+st4ClMnlq4x2FI=;
 b=YI4CxrRMrzk4Pc9JUYF6ZZ7yvaAOx23MOi67+n7H+BfhBXrfeHmEccn/gdB5yWtdWeYqsx
 U1nwQ1gzFEf5E/ZGHrv65HrcPhnG0y9NCBrBqHZu9Ui6fkMgQM7nRH4p0lXA2i7ONe71CV
 OvGwchlYERWNsbL1RG8XQjk51XTfnFA=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-483-GtguWJsfNxKu1S0wy10spw-1; Thu, 01 Sep 2022 14:25:14 -0400
X-MC-Unique: GtguWJsfNxKu1S0wy10spw-1
Received: by mail-ej1-f69.google.com with SMTP id
 hp14-20020a1709073e0e00b00741a2093c4aso5616504ejc.20
 for <qemu-devel@nongnu.org>; Thu, 01 Sep 2022 11:25:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=TRSBxJ+kyWBpg1Sk50ijsEg3buEI+st4ClMnlq4x2FI=;
 b=UAp1Wt2Ten6aGfCqtqYhNR78W/1VVG/CpC7oBcsFcKDNkRbr7n2XqIjl2hf1ZuLi+n
 E2OwT/Z1IkeJN5vIE9CqEmORhoopftWMjY/dyRcSZ2B3eFX73a0C+QwAxhX83+reQtM5
 OKduCuVQ0SCnB0+zAdNEewLpID0Jrf2YimY5HTKLOHGPacjZWW+K/zH5YYYGnA07PxTr
 YTABoNCsW/akAzfH226BySN8GI3AFbApT9AwtzARu4ecFCxSrYQiRXw8PEeTDX47DJtx
 f2Ao5ypPxv2VhLevNA5i2+ilebCGYuKnLEzm/ODWxn1G51Do72IjnrsfSOATK343tYai
 hYWA==
X-Gm-Message-State: ACgBeo2aNcCpKuJgxrnf+QSBRtJCE6V/QhYkfapqeicDioZMKhGFUtxu
 i4Jb525ZX5Cm+hhWcrh6EUvD2/RAmoi2ajnAHyMNNdr6DDXU0kvb+6Knfp8Kjc0KAnQ3LIgG0vj
 AdRdfj+Q7ns/If6wsvxkjy3iWY33Ab2NEIrfolTFHwNBqXDL0vAFL7M43+hhsFtJrBhQ=
X-Received: by 2002:a05:6402:510c:b0:43e:305c:a4d1 with SMTP id
 m12-20020a056402510c00b0043e305ca4d1mr28633226edd.35.1662056712899; 
 Thu, 01 Sep 2022 11:25:12 -0700 (PDT)
X-Google-Smtp-Source: AA6agR73qo/gMjSAkfkEfTyWPmOCOylajJUrcOTgOiqWYhC0l/tMzjgFcXGXFUeCKoD+5Z2o37lxKA==
X-Received: by 2002:a05:6402:510c:b0:43e:305c:a4d1 with SMTP id
 m12-20020a056402510c00b0043e305ca4d1mr28633210edd.35.1662056712614; 
 Thu, 01 Sep 2022 11:25:12 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 u6-20020a170906c40600b0073dd1ac2fc8sm8784119ejz.195.2022.09.01.11.25.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Sep 2022 11:25:12 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paul Brook <paul@nowt.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 21/39] target/i386: Move 3DNOW decoder
Date: Thu,  1 Sep 2022 20:24:11 +0200
Message-Id: <20220901182429.93533-22-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220901182429.93533-1-pbonzini@redhat.com>
References: <20220901182429.93533-1-pbonzini@redhat.com>
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
2.37.2



