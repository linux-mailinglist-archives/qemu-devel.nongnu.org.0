Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA75D5BD455
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Sep 2022 20:04:56 +0200 (CEST)
Received: from localhost ([::1]:41864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaL8Y-0004nL-Ma
	for lists+qemu-devel@lfdr.de; Mon, 19 Sep 2022 14:04:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oaKgB-0003Kw-Qn
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 13:35:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20564)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oaKg0-0003By-UL
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 13:35:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663608924;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k4C0VUgdBwQ6L57zBQtY/ZfQFEkt7lIRQ5EO43Tbgjc=;
 b=CBKkWbox2AI7wF2HInnFbQSoPc4yaFzqrTAeSKOni+/6PPIfyrHBeLt0+3TsIFo4VvQPJU
 mL7E2OqYOk6Xpo++0zzvkDm0TZrpYr2etqpSl5U+xopLHbWOfk4P3l9rMw2DPOzgngcMJd
 oEYQ8c0ggPUicmEUiKzPYVHPgvB+r7k=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-526-9t5nxkJ_OIK32G7pDR4jhA-1; Mon, 19 Sep 2022 13:35:23 -0400
X-MC-Unique: 9t5nxkJ_OIK32G7pDR4jhA-1
Received: by mail-wm1-f71.google.com with SMTP id
 c128-20020a1c3586000000b003b324bb08c5so4945389wma.9
 for <qemu-devel@nongnu.org>; Mon, 19 Sep 2022 10:35:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=k4C0VUgdBwQ6L57zBQtY/ZfQFEkt7lIRQ5EO43Tbgjc=;
 b=d4lHUzWbFy9mpvPxOvf4VseIP4iTbqxDtIK3Ny7Y/L8ZBI2JTdoPNA7MdnD3y+OBg0
 WyAwcsHDUKcKZChauzKFjtM7Cd1Php8i13IiR4LGMql4/YwE0BXWDtk/zm6grbcSgDFO
 IljFPia0PCYlMjKq3lM9MOoRZns9WaVrKzsAbtYjOrHM3AhkSmFA6y7PrXzIs9S4eXZq
 KLwc2vfKP1qh/D6U+Km7DqCcdeOCnW7USLSpruSmVbjyGyld2YDIRXHZ8wHfJWX1ycad
 MXKH9xUEMVQ5kXb/txf+u7NJZ+VXqPMqqC2r/RBLL3DX0iBUKdZMoaK1E6YfP67A0gV5
 pxOw==
X-Gm-Message-State: ACrzQf1ylpd7cWKKowg8Hrqbr/C88WA0vpvThjsiLDPVmjsKX9llV7Kt
 DuezDPT1jKLilepsNaaC1GT+ZH3WRofO8r8mjE0j3NxkuWsfOb+gQbGlcP1zAOuNmJHAOhW7Aka
 4sdYBcIWInxzqZBLgZ5ycmEvFPC2iPClKKePb6+E1nan5RZc9LlVRqcApqX/s1U6avp4=
X-Received: by 2002:a05:600c:2050:b0:3b4:a51a:a1f5 with SMTP id
 p16-20020a05600c205000b003b4a51aa1f5mr12526224wmg.177.1663608920431; 
 Mon, 19 Sep 2022 10:35:20 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4InAA0/H2U9hf30K9I0RjPWSUtlDR5J+YZCnPOTXTbUBJBYCNnBPcmBnASmydt13buST85BQ==
X-Received: by 2002:a05:600c:2050:b0:3b4:a51a:a1f5 with SMTP id
 p16-20020a05600c205000b003b4a51aa1f5mr12526211wmg.177.1663608920174; 
 Mon, 19 Sep 2022 10:35:20 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 m9-20020a056000008900b00228cbac7a25sm14137814wrx.64.2022.09.19.10.35.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Sep 2022 10:35:19 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 19/21] target/i386: introduce insn_get_addr
Date: Mon, 19 Sep 2022 19:34:47 +0200
Message-Id: <20220919173449.5864-20-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220919173449.5864-1-pbonzini@redhat.com>
References: <20220919173449.5864-1-pbonzini@redhat.com>
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
index eaa56b0f48..44af8c107f 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -2289,6 +2289,31 @@ static void gen_ldst_modrm(CPUX86State *env, DisasContext *s, int modrm,
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
@@ -5851,16 +5876,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
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


