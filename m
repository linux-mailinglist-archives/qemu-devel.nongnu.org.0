Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE2F5386A8
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 19:17:12 +0200 (CEST)
Received: from localhost ([::1]:52472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvj0x-0000Ya-Ee
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 13:17:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhwA-0003qm-Ut
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:08:26 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:34543)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhw9-0007By-9z
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:08:10 -0400
Received: by mail-wr1-x42f.google.com with SMTP id e2so15315033wrc.1
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 09:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=JqrBxr5VDjo33u7pbXWCf2yzBi5cLxpeHqYjbCwf5Qs=;
 b=el81m7M9ZstZiy3VRCJJb0V3Jnffelym7PXRiboHbw5yjtQOu/vnR4Ts0u/9cSdRQD
 93BIKhQ9BNTEhXo0e+hvlwSEL77B870PxdbWAGtwXoZGaqJ1h8geZ+zV7plg3a/oJXG3
 uhrMmjmSA5JSEp3zfgAyI7EsVeoETCSfN7i+JuJ6mD5ga69ivz/IUBO5qptzN7cgz2TL
 yuJfsOqWCZUL6ztYUVEaLXeemgYP2anCxbCrvPADKkazSdVnuIZFCdNRUuurtMx+KAvW
 uBqqUiwDAUNGA4igPmboxhdgWogivxnrqPOTIPFUKo17CqYcyn2fJ1r8Z/Va191I343S
 iIZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JqrBxr5VDjo33u7pbXWCf2yzBi5cLxpeHqYjbCwf5Qs=;
 b=JvwgmUyKIiSUDOqcGLtXmkwCerAyyLMBMYlTY2GxRTvuGBQGB7kgU1lBFEUspx/D9C
 NUdmYe5eYVBmZsUR429Y5Y4cOjcdUYaCQo6ND642PeMdlwY1byUbrPnsUKIjB1XOO5Y+
 YNUGSPFU2JR7Q5pRDNdR6ohDhHOVbJdPe/f4nhGniVKsCh198QcbIeykaSs/gzy98lV/
 87ylcY8V1V8DLx2KZKvcmUus9Q61hAXZPC5osUbA4s5OtYn4E5yLe2F1gQR3mhKVgAov
 tTyYoCdZFigmJfq1641GsemNz+Xowbj7FQAqWWLdVh6JQPTGt9vnED/T+/xdfpIQByvj
 9GEw==
X-Gm-Message-State: AOAM533Ae1gfdyEytW9gIKqgOjMS8wAPvPllJ8wNh6iDeV1DFKbWS5ML
 kSNGsUf0M0BtewDfgVwj3a7FygWDDZeM9Q==
X-Google-Smtp-Source: ABdhPJxLBRuA29phz9qxly96Q5ZQ3Ccz6xJZO4X5S9Q7e+zMpOXAEdjV0mfRdaFlOEqOWtD5DL/kng==
X-Received: by 2002:adf:f68f:0:b0:210:2ef7:e801 with SMTP id
 v15-20020adff68f000000b002102ef7e801mr7012477wrp.318.1653926888115; 
 Mon, 30 May 2022 09:08:08 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bi12-20020a05600c3d8c00b003974b95d897sm10232152wmb.37.2022.05.30.09.08.05
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 May 2022 09:08:07 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 060/117] target/arm: Move sve zip high_ofs into simd_data
Date: Mon, 30 May 2022 17:06:11 +0100
Message-Id: <20220530160708.726466-61-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220530160708.726466-1-peter.maydell@linaro.org>
References: <20220530160708.726466-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

From: Richard Henderson <richard.henderson@linaro.org>

This is in line with how we treat uzp, and will
eliminate the special case code during translation.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220527181907.189259-58-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/sve_helper.c    |  6 ++++--
 target/arm/translate-sve.c | 12 ++++++------
 2 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index e0f9aa9983c..3bdcd4ce9d0 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -3382,6 +3382,7 @@ void HELPER(sve_punpk_p)(void *vd, void *vn, uint32_t pred_desc)
 void HELPER(NAME)(void *vd, void *vn, void *vm, uint32_t desc)       \
 {                                                                    \
     intptr_t oprsz = simd_oprsz(desc);                               \
+    intptr_t odd_ofs = simd_data(desc);                              \
     intptr_t i, oprsz_2 = oprsz / 2;                                 \
     ARMVectorReg tmp_n, tmp_m;                                       \
     /* We produce output faster than we consume input.               \
@@ -3393,8 +3394,9 @@ void HELPER(NAME)(void *vd, void *vn, void *vm, uint32_t desc)       \
         vm = memcpy(&tmp_m, vm, oprsz_2);                            \
     }                                                                \
     for (i = 0; i < oprsz_2; i += sizeof(TYPE)) {                    \
-        *(TYPE *)(vd + H(2 * i + 0)) = *(TYPE *)(vn + H(i));         \
-        *(TYPE *)(vd + H(2 * i + sizeof(TYPE))) = *(TYPE *)(vm + H(i)); \
+        *(TYPE *)(vd + H(2 * i + 0)) = *(TYPE *)(vn + odd_ofs + H(i)); \
+        *(TYPE *)(vd + H(2 * i + sizeof(TYPE))) =                    \
+            *(TYPE *)(vm + odd_ofs + H(i));                          \
     }                                                                \
     if (sizeof(TYPE) == 16 && unlikely(oprsz & 16)) {                \
         memset(vd + oprsz - 16, 0, 16);                              \
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 1e6bcedb9df..c2ced3e2bb1 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -2298,9 +2298,9 @@ static bool do_zip(DisasContext *s, arg_rrr_esz *a, bool high)
         unsigned vsz = vec_full_reg_size(s);
         unsigned high_ofs = high ? vsz / 2 : 0;
         tcg_gen_gvec_3_ool(vec_full_reg_offset(s, a->rd),
-                           vec_full_reg_offset(s, a->rn) + high_ofs,
-                           vec_full_reg_offset(s, a->rm) + high_ofs,
-                           vsz, vsz, 0, fns[a->esz]);
+                           vec_full_reg_offset(s, a->rn),
+                           vec_full_reg_offset(s, a->rm),
+                           vsz, vsz, high_ofs, fns[a->esz]);
     }
     return true;
 }
@@ -2324,9 +2324,9 @@ static bool do_zip_q(DisasContext *s, arg_rrr_esz *a, bool high)
         unsigned vsz = vec_full_reg_size(s);
         unsigned high_ofs = high ? QEMU_ALIGN_DOWN(vsz, 32) / 2 : 0;
         tcg_gen_gvec_3_ool(vec_full_reg_offset(s, a->rd),
-                           vec_full_reg_offset(s, a->rn) + high_ofs,
-                           vec_full_reg_offset(s, a->rm) + high_ofs,
-                           vsz, vsz, 0, gen_helper_sve2_zip_q);
+                           vec_full_reg_offset(s, a->rn),
+                           vec_full_reg_offset(s, a->rm),
+                           vsz, vsz, high_ofs, gen_helper_sve2_zip_q);
     }
     return true;
 }
-- 
2.25.1


