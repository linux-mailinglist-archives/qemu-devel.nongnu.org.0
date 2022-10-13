Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D31A5FE519
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Oct 2022 00:13:50 +0200 (CEST)
Received: from localhost ([::1]:44004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oj6Sb-0000kr-7M
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 18:13:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oj63s-0002qz-Q4
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 17:48:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41896)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oj63n-0005JY-SS
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 17:48:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665697690;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k229EqfcdmSEeYRUd9pze+gwJ+qeSPgXw5lbUelqaYo=;
 b=V7ZT7qlPw4aUcVlW3obltqCjgJgqPiCobjkquxwAulkrHunLuQDji9qiMA0N3/2Z2BzF8B
 KjGL2vsUcpLxqbD/vtRkuRz8CbOvrLsbr4+YcAnrkRsYKmkNdxJGJqGOCkeXt7p8dTWEsI
 8XUwYkbb9N0ksiEwsfoFKIO3C1m0hsg=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-93-6znWEnTbNZCvASxsKwL9Uw-1; Thu, 13 Oct 2022 17:48:09 -0400
X-MC-Unique: 6znWEnTbNZCvASxsKwL9Uw-1
Received: by mail-ed1-f70.google.com with SMTP id
 f18-20020a056402355200b0045c13ee57d9so2365506edd.20
 for <qemu-devel@nongnu.org>; Thu, 13 Oct 2022 14:48:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=k229EqfcdmSEeYRUd9pze+gwJ+qeSPgXw5lbUelqaYo=;
 b=uxEsDnalezqj7npArnu7287/TZHBivyk6qX0jSnvnCqc1CzcOGpNKXgnTcEmnBHnTx
 XXrzKeTHtvsLJan4u/sEiNBBxB0E2CLjX8wyAi+APL/vMw5le5gfk8W00D6YQZ4kbC/r
 9KRHMnWYEeyDSdccISVW+sFOUnZFGnhAPFBY4w28NJp/IywgQaXGzId+JoTLhGce2ZLj
 6gQgCUZlCQwIzpOt00pJgu2mrXvixEJgNWvUVLGi6yhEWzBrHgCA6EDgXpokem6L7f7z
 ObYYoAgT7NnJo8V5mfiVT6teGM+D+qJI9fTeZ6Y3cYiLPkRUs/QLhPQfnq5v3iUnPSnL
 V9Dg==
X-Gm-Message-State: ACrzQf1krzXuTsBW3SGSFTRKcD2qUXBmZekh2IWANs0OCfFCPpUNtpBm
 3Vc2f07gSoBLEyxDfbXaXnQoHsNpTVaFpRhuMr1omisx+CWvQl7/vkYAhj5VsYVKJAOeaoHNUfC
 /bTbwW6SbqxeAsK3ajbtMzsKCunDh2raFLbfXpWfP+ToIZCOJBJG3W21XvT54COczEGU=
X-Received: by 2002:a17:907:70a:b0:741:78ab:dce5 with SMTP id
 xb10-20020a170907070a00b0074178abdce5mr1309233ejb.527.1665697687305; 
 Thu, 13 Oct 2022 14:48:07 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5WzwGh/5gfp+0n9EdbmqFGAksRMLK7PIw5DEsuoOaQaarvi68SEL7EUodEi0gp/WuBdz/m4Q==
X-Received: by 2002:a17:907:70a:b0:741:78ab:dce5 with SMTP id
 xb10-20020a170907070a00b0074178abdce5mr1309222ejb.527.1665697687015; 
 Thu, 13 Oct 2022 14:48:07 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 g16-20020a170906539000b0073d5948855asm496457ejo.1.2022.10.13.14.48.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Oct 2022 14:48:06 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: paul@nowt.org,
	richard.henderson@linaro.org
Subject: [PATCH 25/35] target/i386: Use tcg gvec ops for pmovmskb
Date: Thu, 13 Oct 2022 23:46:41 +0200
Message-Id: <20221013214651.672114-26-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221013214651.672114-1-pbonzini@redhat.com>
References: <20221013214651.672114-1-pbonzini@redhat.com>
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

As pmovmskb is used by strlen et al, this is the third
highest overhead sse operation at %0.8.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
[Reorganize to generate code for any vector size. - Paolo]
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/tcg/emit.c.inc | 88 +++++++++++++++++++++++++++++++++++---
 1 file changed, 83 insertions(+), 5 deletions(-)

diff --git a/target/i386/tcg/emit.c.inc b/target/i386/tcg/emit.c.inc
index 062c92e45a..ad93094ca8 100644
--- a/target/i386/tcg/emit.c.inc
+++ b/target/i386/tcg/emit.c.inc
@@ -1191,14 +1191,92 @@ static void gen_PINSR(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
     gen_pinsr(s, env, decode, decode->op[2].ot);
 }
 
+static void gen_pmovmskb_i64(TCGv_i64 d, TCGv_i64 s)
+{
+    TCGv_i64 t = tcg_temp_new_i64();
+
+    tcg_gen_andi_i64(d, s, 0x8080808080808080ull);
+
+    /*
+     * After each shift+or pair:
+     * 0:  a.......b.......c.......d.......e.......f.......g.......h.......
+     * 7:  ab......bc......cd......de......ef......fg......gh......h.......
+     * 14: abcd....bcde....cdef....defg....efgh....fgh.....gh......h.......
+     * 28: abcdefghbcdefgh.cdefgh..defgh...efgh....fgh.....gh......h.......
+     * The result is left in the high bits of the word.
+     */
+    tcg_gen_shli_i64(t, d, 7);
+    tcg_gen_or_i64(d, d, t);
+    tcg_gen_shli_i64(t, d, 14);
+    tcg_gen_or_i64(d, d, t);
+    tcg_gen_shli_i64(t, d, 28);
+    tcg_gen_or_i64(d, d, t);
+}
+
+static void gen_pmovmskb_vec(unsigned vece, TCGv_vec d, TCGv_vec s)
+{
+    TCGv_vec t = tcg_temp_new_vec_matching(d);
+    TCGv_vec m = tcg_constant_vec_matching(d, MO_8, 0x80);
+
+    /* See above */
+    tcg_gen_and_vec(vece, d, s, m);
+    tcg_gen_shli_vec(vece, t, d, 7);
+    tcg_gen_or_vec(vece, d, d, t);
+    tcg_gen_shli_vec(vece, t, d, 14);
+    tcg_gen_or_vec(vece, d, d, t);
+    tcg_gen_shli_vec(vece, t, d, 28);
+    tcg_gen_or_vec(vece, d, d, t);
+}
+
+#ifdef TARGET_X86_64
+#define TCG_TARGET_HAS_extract2_tl TCG_TARGET_HAS_extract2_i64
+#else
+#define TCG_TARGET_HAS_extract2_tl TCG_TARGET_HAS_extract2_i32
+#endif
+
 static void gen_PMOVMSKB(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
 {
-    if (s->prefix & PREFIX_DATA) {
-        gen_helper_pmovmskb_xmm(s->tmp2_i32, cpu_env, OP_PTR2);
-    } else {
-        gen_helper_pmovmskb_mmx(s->tmp2_i32, cpu_env, OP_PTR2);
+    static const TCGOpcode vecop_list[] = { INDEX_op_shli_vec, 0 };
+    static const GVecGen2 g = {
+        .fni8 = gen_pmovmskb_i64,
+        .fniv = gen_pmovmskb_vec,
+        .opt_opc = vecop_list,
+        .vece = MO_64,
+        .prefer_i64 = TCG_TARGET_REG_BITS == 64
+    };
+    MemOp ot = decode->op[2].ot;
+    int vec_len = vector_len(s, decode);
+    TCGv t = tcg_temp_new();
+
+    tcg_gen_gvec_2(offsetof(CPUX86State, xmm_t0) + xmm_offset(ot), decode->op[2].offset,
+                   vec_len, vec_len, &g);
+    tcg_gen_ld8u_tl(s->T0, cpu_env, offsetof(CPUX86State, xmm_t0.ZMM_B(vec_len - 1)));
+    while (vec_len > 8) {
+        vec_len -= 8;
+        if (TCG_TARGET_HAS_extract2_tl) {
+            /*
+             * Load the next byte of the result into the high byte of T.
+             * TCG does a similar expansion of deposit to shl+extract2; by
+             * loading the whole word, the shift left is avoided.
+             */
+#ifdef TARGET_X86_64
+            tcg_gen_ld_tl(t, cpu_env, offsetof(CPUX86State, xmm_t0.ZMM_Q((vec_len - 1) / 8)));
+#else
+            tcg_gen_ld_tl(t, cpu_env, offsetof(CPUX86State, xmm_t0.ZMM_L((vec_len - 1) / 4)));
+#endif
+
+            tcg_gen_extract2_tl(s->T0, t, s->T0, TARGET_LONG_BITS - 8);
+        } else {
+            /*
+             * The _previous_ value is deposited into bits 8 and higher of t.  Because
+             * those bits are known to be zero after ld8u, this becomes a shift+or
+             * if deposit is not available.
+             */
+            tcg_gen_ld8u_tl(t, cpu_env, offsetof(CPUX86State, xmm_t0.ZMM_B(vec_len - 1)));
+            tcg_gen_deposit_tl(s->T0, t, s->T0, 8, TARGET_LONG_BITS - 8);
+        }
     }
-    tcg_gen_extu_i32_tl(s->T0, s->tmp2_i32);
+    tcg_temp_free(t);
 }
 
 static void gen_PSHUFW(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
-- 
2.37.3


