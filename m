Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71D6E51380F
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 17:18:20 +0200 (CEST)
Received: from localhost ([::1]:44714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk5uN-0000gE-Ig
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 11:18:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk5K1-0005b6-UO
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 10:40:46 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:38797)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk5Jw-0006Rj-E4
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 10:40:42 -0400
Received: by mail-wr1-x42a.google.com with SMTP id k2so7089153wrd.5
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 07:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=COCMGAJOa85nHXPRsawfCPsQNsQEWAegWOZAtOdocqU=;
 b=l2/5TreR4/Jd8J7+fOcLG2ZDakbZEoENaNFvjM/ong0/2WJi2wmKSeNB/1s+9K0YY6
 iA+qnr5j8FutuSwl2r4D5lZ0IUBm8osO3JGq4IqBUZPoJIrPPWyNuHcGDJ6E9xXidXYN
 bBoJghaMd+KlIpW10NgvSdXstnF5dSIA2MeHoAeoMHkZEDuuklr8NtakinnEOJoShHBX
 W4+FpwnQzRSosY6E/Eh19V4mSYiwRytageHRcPNSBMjQNk+7JHNvGZo5p+1HKaFHrgSb
 0kwOWRM6GTaqXfOtsIFRaGod+I9TsOahBhYoUOUZ9tmmn1EWQP26WXGp/y4CqzUThDuq
 jCpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=COCMGAJOa85nHXPRsawfCPsQNsQEWAegWOZAtOdocqU=;
 b=FLHGCr355SNQZqjdyQpw8mRkZMZGgMbr9oj8cvWjohod7Ol+kRnM9IuKPizBvSBi2J
 jEzMKXegIVy6BtGCRGkEGVY7GUGvC5PQJPb4xLZtPFDh3ALia7JF2J/orFgPHiecP3uL
 x2GyqJdpzEau/WMDQK5WEn0KB1XIzRF+gN1tYFJ4txByUcc066TAMac8SCloaIoUsOh0
 D4npbi0CC0p9NkAh+Fatn0vTRs9O1wEnrA6q05otEhrLdOgfTaaDFWJGNaELh1YTJXgs
 d8aKC8DcKJIv8AlWdf3zMBLMqeUxQ7TXzRwCrvsM1DSKmnsA0aMwda7XrLbJsTkOwkcv
 y4jw==
X-Gm-Message-State: AOAM532XIPIa9iJCHmkwPVcvyHhmVz66lSZ70iEJuU86XVpIME8rZRMp
 yrE57Snsfohj40GHSII7E0m84jQz1VTL/w==
X-Google-Smtp-Source: ABdhPJzjhi4mzu4KMZqORXTZFflM2G04+8b+WM0fk/IeuW0Rb+J9kPAfFzUj4a+ct9MR5QHjHJwhuQ==
X-Received: by 2002:a5d:64c6:0:b0:20a:f5e6:4a13 with SMTP id
 f6-20020a5d64c6000000b0020af5e64a13mr3435031wri.620.1651156837903; 
 Thu, 28 Apr 2022 07:40:37 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bh26-20020a05600c3d1a00b003928db85759sm130221wmb.15.2022.04.28.07.40.37
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Apr 2022 07:40:37 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 38/54] target/arm: Use tcg_constant in FCPY, CPY
Date: Thu, 28 Apr 2022 15:39:42 +0100
Message-Id: <20220428143958.2451229-39-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220428143958.2451229-1-peter.maydell@linaro.org>
References: <20220428143958.2451229-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-id: 20220426163043.100432-39-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-sve.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 9321457f31e..ef57d3a2b49 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -2259,9 +2259,7 @@ static bool trans_FCPY(DisasContext *s, arg_FCPY *a)
     if (sve_access_check(s)) {
         /* Decode the VFP immediate.  */
         uint64_t imm = vfp_expand_imm(a->esz, a->imm);
-        TCGv_i64 t_imm = tcg_const_i64(imm);
-        do_cpy_m(s, a->esz, a->rd, a->rn, a->pg, t_imm);
-        tcg_temp_free_i64(t_imm);
+        do_cpy_m(s, a->esz, a->rd, a->rn, a->pg, tcg_constant_i64(imm));
     }
     return true;
 }
@@ -2272,9 +2270,7 @@ static bool trans_CPY_m_i(DisasContext *s, arg_rpri_esz *a)
         return false;
     }
     if (sve_access_check(s)) {
-        TCGv_i64 t_imm = tcg_const_i64(a->imm);
-        do_cpy_m(s, a->esz, a->rd, a->rn, a->pg, t_imm);
-        tcg_temp_free_i64(t_imm);
+        do_cpy_m(s, a->esz, a->rd, a->rn, a->pg, tcg_constant_i64(a->imm));
     }
     return true;
 }
@@ -2291,11 +2287,10 @@ static bool trans_CPY_z_i(DisasContext *s, arg_CPY_z_i *a)
     }
     if (sve_access_check(s)) {
         unsigned vsz = vec_full_reg_size(s);
-        TCGv_i64 t_imm = tcg_const_i64(a->imm);
         tcg_gen_gvec_2i_ool(vec_full_reg_offset(s, a->rd),
                             pred_full_reg_offset(s, a->pg),
-                            t_imm, vsz, vsz, 0, fns[a->esz]);
-        tcg_temp_free_i64(t_imm);
+                            tcg_constant_i64(a->imm),
+                            vsz, vsz, 0, fns[a->esz]);
     }
     return true;
 }
-- 
2.25.1


