Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3C6A5BF001
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 00:22:49 +0200 (CEST)
Received: from localhost ([::1]:55508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaldg-0003ai-M3
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 18:22:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oagzp-0006Jc-51
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 13:25:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49692)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oagzn-000233-CO
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 13:25:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663694718;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y75+M5IOAZvf3uuFV/0juokikMOyYtt8TC4O+3/T2Y4=;
 b=Y8HpQCi386hsC3waXqFhynQtrjI9nHZ+5PW1YeT9FNQrl3unMVQXnwQvGB866W4Kky8Ou5
 poL09ZSzNvgCutGnZ34PtnF5P59xPuJPav8Crnuyf4FhfCnQQF0jnOCn90xCLTKTsyaVgz
 U5lAIbMD8MlOjQDawalXlVcQLSRApS4=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-504-A_K99hgMPjSIxEV-v1HKww-1; Tue, 20 Sep 2022 13:25:17 -0400
X-MC-Unique: A_K99hgMPjSIxEV-v1HKww-1
Received: by mail-ej1-f69.google.com with SMTP id
 ne4-20020a1709077b8400b0078114a1a6d8so1772043ejc.9
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 10:25:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=y75+M5IOAZvf3uuFV/0juokikMOyYtt8TC4O+3/T2Y4=;
 b=FCMSXRAS6zGGYGX+7f9Pi5QZolpIY45KSVKYE8NN2RjHPHQHqucOSfMxKCadFKKjjd
 2M7drRcqHNP3S/ZcDZcJ/25JQYTOlqmbdBc15d4UcCZt62Bh434R6cybr9XLjFSacPXj
 U08n6O44Y6YYTsDdEYTFsStrVGtKW+qZaS3LkkTRlTfxrXRi0zCiXozZ4cQ5JjUPcqdT
 iDM4V3ijArqcrbJ5z+Hlygvot0s7uIwN5bHJfYLXOnJnLCEdYCYB1fE8IGR569HAD3Mf
 ckC2FFmq8v5Q7jKiO/LBFn+sGtxI00USVICRqC8tlKvkpNouRHzOwd3Lhy7OvZ3bLEKD
 ZnGA==
X-Gm-Message-State: ACrzQf0JkoZtFf0tv7y0fqCOAXLDARnw/OaalW3Nibe3mIUYxjZhH3Mk
 6MV1ZbQI4b1cNGX2clFxL8Ascgw+L+v3qZLZPJzLdrD9kdrjZuDRhz9Rmjo6aS4ZKzc1sbHNmPq
 NaRWEoY8LNlHpzkR/d1Fg+3U5iQ7OvHW6vOCw9+cMVLBj8dXJfGkNXT41bZPqMdw1oVQ=
X-Received: by 2002:a17:907:1c90:b0:77f:b1ae:9f44 with SMTP id
 nb16-20020a1709071c9000b0077fb1ae9f44mr17441179ejc.304.1663694716073; 
 Tue, 20 Sep 2022 10:25:16 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5noaO8xznaYkresX4qtUFY98Etw9auKCtvFLC1l+omJHBnYyLSGnV5j9HHWAXLxJrAj3ZfBw==
X-Received: by 2002:a17:907:1c90:b0:77f:b1ae:9f44 with SMTP id
 nb16-20020a1709071c9000b0077fb1ae9f44mr17441160ejc.304.1663694715733; 
 Tue, 20 Sep 2022 10:25:15 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 ky10-20020a170907778a00b0077826b92d99sm216090ejc.12.2022.09.20.10.25.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 10:25:15 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	paul@nowt.org
Subject: [PATCH v2 04/37] target/i386: introduce insn_get_addr
Date: Tue, 20 Sep 2022 19:24:34 +0200
Message-Id: <20220920172507.95568-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220920172507.95568-1-pbonzini@redhat.com>
References: <20220920172507.95568-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

The "O" operand type in the Intel SDM needs to load an 8- to 64-bit
unsigned value, while insn_get is limited to 32 bits.  Extract the code
out of disas_insn and into a separate function.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/tcg/translate.c | 36 ++++++++++++++++++++++++++----------
 1 file changed, 26 insertions(+), 10 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 0f45a9f5ad..9d0e128a6a 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -2308,6 +2308,31 @@ static void gen_ldst_modrm(CPUX86State *env, DisasContext *s, int modrm,
     }
 }
 
+static target_ulong insn_get_addr(CPUX86State *env, DisasContext *s, MemOp ot)
+{
+    target_ulong ret;
+
+    switch (ot) {
+    case MO_8:
+        ret = x86_ldub_code(env, s);
+        break;
+    case MO_16:
+        ret = x86_lduw_code(env, s);
+        break;
+    case MO_32:
+        ret = x86_ldl_code(env, s);
+        break;
+#ifdef TARGET_X86_64
+    case MO_64:
+        ret = x86_ldq_code(env, s);
+        break;
+#endif
+    default:
+        g_assert_not_reached();
+    }
+    return ret;
+}
+
 static inline uint32_t insn_get(CPUX86State *env, DisasContext *s, MemOp ot)
 {
     uint32_t ret;
@@ -5882,16 +5907,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
             target_ulong offset_addr;
 
             ot = mo_b_d(b, dflag);
-            switch (s->aflag) {
-#ifdef TARGET_X86_64
-            case MO_64:
-                offset_addr = x86_ldq_code(env, s);
-                break;
-#endif
-            default:
-                offset_addr = insn_get(env, s, s->aflag);
-                break;
-            }
+            offset_addr = insn_get_addr(env, s, s->aflag);
             tcg_gen_movi_tl(s->A0, offset_addr);
             gen_add_A0_ds_seg(s);
             if ((b & 2) == 0) {
-- 
2.37.2


