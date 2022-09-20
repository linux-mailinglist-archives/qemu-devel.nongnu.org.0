Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0A0F5BEF57
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 23:46:49 +0200 (CEST)
Received: from localhost ([::1]:50284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oal4q-00006R-J0
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 17:46:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oah0N-0006T3-8W
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 13:25:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21529)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oah0L-0002Eh-JK
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 13:25:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663694752;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0cKuu8KwWrHFcXenB2KvhX7Mcmnc9QSZITTwlBYZzfU=;
 b=XeQahWVQaDg2N2H41I7zgl4cIxKAu91fdn+JQsPZXOfL32LvD0J6y1p5HGatiYYfjF3r+p
 el1LC9mjT+D8Cr5CtMSDue0xUn4SGrW5r4qD0KLSuCvlJo1OmJbqdMQ5ToGKdxPoesHxtQ
 Xb1xxlRg+eDlD4Pe1TfX0iti5GQGt/0=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-259-owTTpphMMIimfvPE4uVSDQ-1; Tue, 20 Sep 2022 13:25:51 -0400
X-MC-Unique: owTTpphMMIimfvPE4uVSDQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 y14-20020a056402440e00b0044301c7ccd9so2348253eda.19
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 10:25:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=0cKuu8KwWrHFcXenB2KvhX7Mcmnc9QSZITTwlBYZzfU=;
 b=LXV0wmCGHUaGRNXe5uEQ99qF6XmsVWig/Kweb+HL6/ZowekNGjFmfV238K/IbX31oX
 +22q5nZydoN5imNz5De/Gs7+f/+wpqkVHaMZRCl1ineM9baKan3BX5czneR03oOTGCHQ
 pvnbqX/CINIA5EX+XXrUsHI7nwQwJ8/HrrjcWChDAJRq8eRYDRpX4Rb5uXBeM3gxApwL
 p/1xaak26f/UtQ6r76uOmvfc/jbV8kUO8+x9GQTh2hOLcrzrwFX1xvPSbVw7Vj4EGx9w
 aqybbQRDf/73ivO+5z21ThELxSo0mLgROIxcd7og5q8NJCE60pWOYHY8jVNKb+Kwvc3U
 m8hg==
X-Gm-Message-State: ACrzQf2RuBruFQ3T7rVj/c9g4CXVSMq4oE2nkVdD/oYuCKDsT8Zb5rm7
 9/Y1eGPfpR0walrYew2KLuX7civoZNkPNZVI6JEwy6OSl4nv8qHjz8RX8mOtW/ec/EJhtEWsPI/
 9IN2CZslh1QuucbH6I321nqMSSakaick7CgpnPhJWyeS8zmk+9TwyeDh6Fxm9iLBz0Bw=
X-Received: by 2002:a17:906:eece:b0:76f:5c6:2340 with SMTP id
 wu14-20020a170906eece00b0076f05c62340mr17899141ejb.383.1663694750091; 
 Tue, 20 Sep 2022 10:25:50 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7xZWadhcssiqJvzy1EZ2flxO52iXnlRKc0BNvkNhJJG9QRCiTIUr2s/lQwxqcDeAA92Gnprg==
X-Received: by 2002:a17:906:eece:b0:76f:5c6:2340 with SMTP id
 wu14-20020a170906eece00b0076f05c62340mr17899117ejb.383.1663694749815; 
 Tue, 20 Sep 2022 10:25:49 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 ay21-20020a056402203500b0044e9601e53fsm236088edb.19.2022.09.20.10.25.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 10:25:49 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	paul@nowt.org
Subject: [PATCH v2 27/37] target/i386: Use tcg gvec ops for pmovmskb
Date: Tue, 20 Sep 2022 19:24:57 +0200
Message-Id: <20220920172507.95568-28-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220920172507.95568-1-pbonzini@redhat.com>
References: <20220920172507.95568-1-pbonzini@redhat.com>
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

From: Richard Henderson <richard.henderson@linaro.org>

As pmovmskb is used by strlen et al, this is the third
highest overhead sse operation at %0.8.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
[Reorganize to generate code for any vector size. - Paolo]
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/tcg/emit.c.inc | 90 +++++++++++++++++++++++++++++++++++---
 1 file changed, 85 insertions(+), 5 deletions(-)

diff --git a/target/i386/tcg/emit.c.inc b/target/i386/tcg/emit.c.inc
index c5e90111a9..5345e791b7 100644
--- a/target/i386/tcg/emit.c.inc
+++ b/target/i386/tcg/emit.c.inc
@@ -1192,14 +1192,94 @@ static void gen_PINSR(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
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
+    if (vece == MO_64) {
+        tcg_gen_shli_vec(vece, t, d, 28);
+        tcg_gen_or_vec(vece, d, d, t);
+    }
+}
+
+#ifdef TARGET_I386
+#define TCG_TARGET_HAS_extract2_tl TCG_TARGET_HAS_extract2_i32
+#else
+#define TCG_TARGET_HAS_extract2_tl TCG_TARGET_HAS_extract2_i64
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
2.37.2


