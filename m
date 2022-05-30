Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46C1B538680
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 19:02:51 +0200 (CEST)
Received: from localhost ([::1]:46266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvin4-0001h2-Bz
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 13:02:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhvo-0003Zt-H6
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:07:48 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:33972)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhvm-0007Ha-Tx
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:07:48 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 d5-20020a05600c34c500b0039776acee62so186885wmq.1
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 09:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=l5jfhKqYMx6NiFtWtX7yMPyKDLs4b64TvAsGNIxHFfk=;
 b=PyktAQdG6u5ZqXioQOE/TtOVIuHY7IRNUiNviWe8eO7JbTtfPFh1KATwNankOuT/pq
 qSTYKnE2ehRuitU5NdTmQ6lSqWTAwz0Vddtb2UydsPzaCGy+P5OXf0vU5MCm4hU/0W18
 /dapA8Q4/UPA+VtbBUikoNUkvEM0Yn0MLzMVM0kXr/Urfhw2epG2LWvbTZYpHUGAMb1Y
 kgesU1c6vo86ce9LYcze1bpAwz0wInbE21G5bJELtFPD0hCD2FVciKvpNY9grGS1aEmo
 d7xNzEaGXP7hzFUpn5CwJBFmj2btms26puDi5zLffxhPc87a/JAJ1uHckEdQGPY8jxQZ
 fFtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=l5jfhKqYMx6NiFtWtX7yMPyKDLs4b64TvAsGNIxHFfk=;
 b=OxIcD647y2fR28jqOM6DNFmNe/IXUtO4x7ZfmdjJu1+0eVng23cyuIytnWIeeAXhf6
 wKmKAHGly4mRQpsfTucFjSu3ctqVfoeCk8gXqYX1ImALO2Q6BaFjLdeJ0H0JqnvlxGx0
 2jh+oArM6ed2+ez+4nxatv20Ii+ZE0pRx3FHkdYAExRBGrbcfEF1+288ZWRLgPRt1t8h
 47L2kxgfQhMboKIm8Ixk2aO0yK/H6aOotF1RXaiUUMKjDLmju/TxcdK6146UZnRO+B/I
 LOkjrUqjaoZBX5k90IoANqCfrn9AN6IQR1vLqIiS8CWWsiXGEMdI52kj/P6zHjLzDkYs
 Jq2Q==
X-Gm-Message-State: AOAM530Gd5iEgAwx/8XoGpBAuM4UkH+D6p+2pusReedeogJfuYJ8a24j
 UHX3eU4+Pkq3Gb09z/k4QwVOup9qtLwvDg==
X-Google-Smtp-Source: ABdhPJxm4rhloB/ZXR9ILUi90xUD0CLWaCj+q+5HK/RPN8wKuJxAw8iD8M97FtKff8+De6jRuX84Og==
X-Received: by 2002:a7b:c00a:0:b0:397:475b:1ad7 with SMTP id
 c10-20020a7bc00a000000b00397475b1ad7mr20027601wmb.42.1653926866073; 
 Mon, 30 May 2022 09:07:46 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bi12-20020a05600c3d8c00b003974b95d897sm10232152wmb.37.2022.05.30.09.07.45
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 May 2022 09:07:45 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 045/117] target/arm: Use TRANS_FEAT for do_sve2_fn2i
Date: Mon, 30 May 2022 17:05:56 +0100
Message-Id: <20220530160708.726466-46-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220530160708.726466-1-peter.maydell@linaro.org>
References: <20220530160708.726466-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
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

Convert SVE translation functions using do_sve2_fn2i
to use TRANS_FEAT and gen_gvec_fn_arg_zzi.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220527181907.189259-43-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-sve.c | 43 ++++++--------------------------------
 1 file changed, 6 insertions(+), 37 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 7a3b5f137ac..911d2e28bf4 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -6828,43 +6828,12 @@ static bool do_adcl(DisasContext *s, arg_rrrr_esz *a, bool sel)
 TRANS_FEAT(ADCLB, aa64_sve2, do_adcl, a, false)
 TRANS_FEAT(ADCLT, aa64_sve2, do_adcl, a, true)
 
-static bool do_sve2_fn2i(DisasContext *s, arg_rri_esz *a, GVecGen2iFn *fn)
-{
-    if (!dc_isar_feature(aa64_sve2, s)) {
-        return false;
-    }
-    return gen_gvec_fn_arg_zzi(s, fn, a);
-}
-
-static bool trans_SSRA(DisasContext *s, arg_rri_esz *a)
-{
-    return do_sve2_fn2i(s, a, gen_gvec_ssra);
-}
-
-static bool trans_USRA(DisasContext *s, arg_rri_esz *a)
-{
-    return do_sve2_fn2i(s, a, gen_gvec_usra);
-}
-
-static bool trans_SRSRA(DisasContext *s, arg_rri_esz *a)
-{
-    return do_sve2_fn2i(s, a, gen_gvec_srsra);
-}
-
-static bool trans_URSRA(DisasContext *s, arg_rri_esz *a)
-{
-    return do_sve2_fn2i(s, a, gen_gvec_ursra);
-}
-
-static bool trans_SRI(DisasContext *s, arg_rri_esz *a)
-{
-    return do_sve2_fn2i(s, a, gen_gvec_sri);
-}
-
-static bool trans_SLI(DisasContext *s, arg_rri_esz *a)
-{
-    return do_sve2_fn2i(s, a, gen_gvec_sli);
-}
+TRANS_FEAT(SSRA, aa64_sve2, gen_gvec_fn_arg_zzi, gen_gvec_ssra, a)
+TRANS_FEAT(USRA, aa64_sve2, gen_gvec_fn_arg_zzi, gen_gvec_usra, a)
+TRANS_FEAT(SRSRA, aa64_sve2, gen_gvec_fn_arg_zzi, gen_gvec_srsra, a)
+TRANS_FEAT(URSRA, aa64_sve2, gen_gvec_fn_arg_zzi, gen_gvec_ursra, a)
+TRANS_FEAT(SRI, aa64_sve2, gen_gvec_fn_arg_zzi, gen_gvec_sri, a)
+TRANS_FEAT(SLI, aa64_sve2, gen_gvec_fn_arg_zzi, gen_gvec_sli, a)
 
 TRANS_FEAT(SABA, aa64_sve2, gen_gvec_fn_arg_zzz, gen_gvec_saba, a)
 TRANS_FEAT(UABA, aa64_sve2, gen_gvec_fn_arg_zzz, gen_gvec_uaba, a)
-- 
2.25.1


