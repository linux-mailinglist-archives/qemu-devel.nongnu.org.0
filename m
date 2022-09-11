Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFB435B51EE
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Sep 2022 01:33:04 +0200 (CEST)
Received: from localhost ([::1]:38420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXWRj-0008HU-Tg
	for lists+qemu-devel@lfdr.de; Sun, 11 Sep 2022 19:33:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oXW1L-0001Mr-St
 for qemu-devel@nongnu.org; Sun, 11 Sep 2022 19:05:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23209)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oXW1K-0007MV-8B
 for qemu-devel@nongnu.org; Sun, 11 Sep 2022 19:05:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662937545;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JAtiCaR9lQvQR+6tBzPSfnat0AkPUvcguUA8ZEf6XIg=;
 b=MXQ53lwfuNV1gu15kFkZYWPsI5H7zv0F7preebuyhwPwuRsm75yG51tqQxowTT3qLqTwMW
 IKjQMe6ZqK5WZMo+AS6aV65AL84LT19qajrtePpxLuXSGlmPP4WaUKtkrkn9TTLJ6UZaXA
 569YJ7qCh6Ri30j1GSNpfFrq5AfKliE=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-651-Ltg7aSRCPQ67asHFUrVLDw-1; Sun, 11 Sep 2022 19:05:44 -0400
X-MC-Unique: Ltg7aSRCPQ67asHFUrVLDw-1
Received: by mail-ej1-f69.google.com with SMTP id
 go7-20020a1709070d8700b007793ffa7c44so2316428ejc.1
 for <qemu-devel@nongnu.org>; Sun, 11 Sep 2022 16:05:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=JAtiCaR9lQvQR+6tBzPSfnat0AkPUvcguUA8ZEf6XIg=;
 b=BSfYZmOeYwXUgbCLAcZyPOmbas5rX6qreO3HtjFyh86Gy7WrtoACo7NkARgTZorFfd
 zK+dX9ieFPoqlrGiIsSE88jfRUUrAwPmNbi3/3d+3VE10dgXaBYDi6kNZWng5wVA+6Mj
 mCf9onXGWqnNejegz00TJyQNV2xpp9re2U/7u3M/41zKSDWq2CUFnyeaHhhUZYoGDsrZ
 Wf32pj2umI3M9Wg21vtXsatU19stlznAVyBAUqN3C41qAU1XI2h/6i4doDm96uHScbJW
 /fBmSQgBPd5sq2nBDo2NzNEccsCbv6HMb75rcAenIIw7dvZmQX3NmclFVjKL+x6iPkTR
 EtwA==
X-Gm-Message-State: ACgBeo1aqrBOv7Aw0y2+VOZ+2IKPt7ck6X6eOiGPUmQURtSmgN49FP+M
 D6bMQ5MV+enMHm6YGLnaF+Z7bnDsrmd+uqspRlBs5h9Cppv9aLT2ML2rs8keKMmeOZDSBzPCFOv
 LqHc2dkm6FJrI8cb5S5/r8c12elN7ishwRfbhy5d9lwkaBWg75LQ034YLEeoyppVJlqA=
X-Received: by 2002:a17:906:8a45:b0:77c:dd3:cebd with SMTP id
 gx5-20020a1709068a4500b0077c0dd3cebdmr3997585ejc.668.1662937542885; 
 Sun, 11 Sep 2022 16:05:42 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6xkyJR6LenkBYoVr9eQeRMhfUXOhZqn4UGQQm0b2pqMjql19gmd/kk5SaLP+9oWF41cV5cmw==
X-Received: by 2002:a17:906:8a45:b0:77c:dd3:cebd with SMTP id
 gx5-20020a1709068a4500b0077c0dd3cebdmr3997570ejc.668.1662937542599; 
 Sun, 11 Sep 2022 16:05:42 -0700 (PDT)
Received: from goa-sendmail (93-44-39-154.ip95.fastwebnet.it. [93.44.39.154])
 by smtp.gmail.com with ESMTPSA id
 ka5-20020a170907920500b0073c5192cba6sm3458406ejb.114.2022.09.11.16.05.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Sep 2022 16:05:42 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH 27/37] target/i386: Use tcg gvec ops for pmovmskb
Date: Mon, 12 Sep 2022 01:04:07 +0200
Message-Id: <20220911230418.340941-28-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220911230418.340941-1-pbonzini@redhat.com>
References: <20220911230418.340941-1-pbonzini@redhat.com>
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

From: Richard Henderson <richard.henderson@linaro.org>

As pmovmskb is used by strlen et al, this is the third
highest overhead sse operation at %0.8.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
[Reorganize to generate code for any vector size. - Paolo]
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/tcg/emit.c.inc | 65 +++++++++++++++++++++++++++++++++++---
 1 file changed, 60 insertions(+), 5 deletions(-)

diff --git a/target/i386/tcg/emit.c.inc b/target/i386/tcg/emit.c.inc
index dbf2c05e16..52c0a7fbe0 100644
--- a/target/i386/tcg/emit.c.inc
+++ b/target/i386/tcg/emit.c.inc
@@ -1179,14 +1179,69 @@ static void gen_PINSR(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
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
 static void gen_PMOVMSKB(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
 {
-    if (s->prefix & PREFIX_DATA) {
-        gen_helper_pmovmskb_xmm(s->tmp2_i32, cpu_env, s->ptr2);
-    } else {
-        gen_helper_pmovmskb_mmx(s->tmp2_i32, cpu_env, s->ptr2);
+    static const TCGOpcode vecop_list[] = { INDEX_op_shli_vec, 0 };
+    static const GVecGen2 g = {
+        .fni8 = gen_pmovmskb_i64,
+        .fniv = gen_pmovmskb_vec,
+        .opt_opc = vecop_list,
+        .vece = MO_64,
+        .prefer_i64 = TCG_TARGET_REG_BITS == 64
+    };
+    MemOp ot = decode->op[0].ot;
+    int vec_len = sse_vec_len(s, decode);
+    TCGv t = tcg_temp_new();
+
+    tcg_gen_gvec_2(offsetof(CPUX86State, xmm_t0) + xmm_offset(ot), decode->op[2].offset,
+                   vec_len, vec_len, &g);
+    tcg_gen_ld8u_tl(s->T0, cpu_env, offsetof(CPUX86State, xmm_t0.ZMM_B(vec_len - 1)));
+    while (vec_len > 8) {
+        vec_len -= 8;
+        tcg_gen_shli_tl(s->T0, s->T0, 8);
+        tcg_gen_ld8u_tl(t, cpu_env, offsetof(CPUX86State, xmm_t0.ZMM_B(vec_len - 1)));
+        tcg_gen_or_tl(s->T0, s->T0, t);
     }
-    tcg_gen_extu_i32_tl(s->T0, s->tmp2_i32);
+    tcg_temp_free(t);
 }
 
 static void gen_POR(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
-- 
2.37.2



