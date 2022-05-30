Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB8553867A
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 19:02:05 +0200 (CEST)
Received: from localhost ([::1]:43574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvimK-0008AR-Fo
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 13:02:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhwJ-0003rH-Pv
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:08:26 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:33613)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhwI-0007NQ-0c
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:08:19 -0400
Received: by mail-wr1-x432.google.com with SMTP id h5so7199563wrb.0
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 09:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=DZMI81NOXIQjNm/3uSsk7ZYE64V08May20hDceafsJk=;
 b=P4o/Che92Af98wfndsa/NGKrSSxRLlpE3iTaSJDSMdZhOhhhytbQYe6NrfNi1e1Lkh
 u1sGiAQBKddpGrurSHfVXGFHAzWqfR4GV+EeSvpni3WMWGqKrMEQA2Ko/S3H/vG5l8Tp
 KPrSn4bWr1/WdGo9iGNVM7Gm+X9KA0WVd+yIec8crciKuyUgjNrI+n4Eu7QeTn6zpdVy
 H6+TyrBvSbN49YXXD9K8GZnMsodSeTXr5xRli3WfBduxreUpunt+bBz1uW+eb4z/BohF
 VoQ2GtogU8MVB2W0hEEBge9PaglZeAYglccMvYQiWqS82/HKAuqv0cCDl01Ebwr4J3fG
 lgEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DZMI81NOXIQjNm/3uSsk7ZYE64V08May20hDceafsJk=;
 b=OQ0Anf82E8inYCS9wqvNu3xZEKnBmCCaqfIQ2DaoJFuEL39Aw+U0LHZCTMZPupfWXZ
 RNXHOmK9yzDBTj23jWPkNz/Gf04/m5khHmyFOzITTxD0fcii0H8yHjmTNl7pV2lviFNn
 6Luw6YR/1hP/VR77KNJq6ESOsyLzvUmwSZR+aw5rd0/NyM14FhMtA8AeODWn+YOKdwk8
 Czh5jW475ZrKBu6UaiPZW8WLWNW0qiHOYYC0+goGI4ByuaRAn1hZ9tSfpVkVW3bttm9J
 IbyKAx4XP1GsL5Xqo/y/aHVsfQUY4JTG/e9skijRkotN8MVauVYAeuSM3Ey0TAkzF7QH
 my2g==
X-Gm-Message-State: AOAM5337H4Q4UDey/yDAljD0eGrPRyRL45Oz3j2LPYSoPZMU777wKUjR
 4/kcp8UYOST2FsM7mg8j9gfjMqIMpj0tEQ==
X-Google-Smtp-Source: ABdhPJylimvHXypCGkUN1Z+2nL19f3gsdQmMv47My6yu8Y27dg9kQ8JmRifKNMuWtL2S32rF1WFauQ==
X-Received: by 2002:adf:fc01:0:b0:20c:ff9a:2c53 with SMTP id
 i1-20020adffc01000000b0020cff9a2c53mr45898215wrr.142.1653926896226; 
 Mon, 30 May 2022 09:08:16 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bi12-20020a05600c3d8c00b003974b95d897sm10232152wmb.37.2022.05.30.09.08.15
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 May 2022 09:08:15 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 070/117] target/arm: Use TRANS_FEAT for do_sve2_ppzz_flags
Date: Mon, 30 May 2022 17:06:21 +0100
Message-Id: <20220530160708.726466-71-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220530160708.726466-1-peter.maydell@linaro.org>
References: <20220530160708.726466-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
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
Message-id: 20220527181907.189259-68-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-sve.c | 28 ++++++++--------------------
 1 file changed, 8 insertions(+), 20 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 73b5b67c250..22acd5ead0b 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -7319,27 +7319,15 @@ DO_SVE2_ZZZ_NARROW(SUBHNT, subhnt)
 DO_SVE2_ZZZ_NARROW(RSUBHNB, rsubhnb)
 DO_SVE2_ZZZ_NARROW(RSUBHNT, rsubhnt)
 
-static bool do_sve2_ppzz_flags(DisasContext *s, arg_rprr_esz *a,
-                               gen_helper_gvec_flags_4 *fn)
-{
-    if (!dc_isar_feature(aa64_sve2, s)) {
-        return false;
-    }
-    return do_ppzz_flags(s, a, fn);
-}
+static gen_helper_gvec_flags_4 * const match_fns[4] = {
+    gen_helper_sve2_match_ppzz_b, gen_helper_sve2_match_ppzz_h, NULL, NULL
+};
+TRANS_FEAT(MATCH, aa64_sve2, do_ppzz_flags, a, match_fns[a->esz])
 
-#define DO_SVE2_PPZZ_MATCH(NAME, name)                                      \
-static bool trans_##NAME(DisasContext *s, arg_rprr_esz *a)                  \
-{                                                                           \
-    static gen_helper_gvec_flags_4 * const fns[4] = {                       \
-        gen_helper_sve2_##name##_ppzz_b, gen_helper_sve2_##name##_ppzz_h,   \
-        NULL,                            NULL                               \
-    };                                                                      \
-    return do_sve2_ppzz_flags(s, a, fns[a->esz]);                           \
-}
-
-DO_SVE2_PPZZ_MATCH(MATCH, match)
-DO_SVE2_PPZZ_MATCH(NMATCH, nmatch)
+static gen_helper_gvec_flags_4 * const nmatch_fns[4] = {
+    gen_helper_sve2_nmatch_ppzz_b, gen_helper_sve2_nmatch_ppzz_h, NULL, NULL
+};
+TRANS_FEAT(NMATCH, aa64_sve2, do_ppzz_flags, a, nmatch_fns[a->esz])
 
 static gen_helper_gvec_4 * const histcnt_fns[4] = {
     NULL, NULL, gen_helper_sve2_histcnt_s, gen_helper_sve2_histcnt_d
-- 
2.25.1


