Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E2D15386AD
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 19:18:51 +0200 (CEST)
Received: from localhost ([::1]:58284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvj2Y-0004hp-Gx
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 13:18:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhvp-0003dv-Ri
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:07:56 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:37410)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhvo-0007BN-BH
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:07:49 -0400
Received: by mail-wr1-x42a.google.com with SMTP id t6so15296903wra.4
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 09:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=ABxa2liB5UmRZb7nAOaaoL+iM/4LSDSn4mCKTa5V6Kg=;
 b=r2Gm+f+3q6Dh0WNGF5a7E4c/ZAtSypvwWEH6HZP2MKgynpaexb3FgQIklvI/2UkqPB
 JW/NU9tkDRHe0rAnSYtnk5xwTVVOmaVNUNSp/8qj6leVqlsUxUK0pChqAejf31rGVUpK
 0tW3ib/l1MX9caJn1TXyfHJK2loRwWaxQftb8qv7BLsYxPX6Oe1HnPa4WWOz1ZJPjALp
 GEhrkj4CZjb2+PqvCptLBEz+lQ8TlU9jRNILPW69jXg3TJuqgdsIxyxS5ka8Y0Na5lQO
 2vHaKZU0JIQznwQXCPNiM84vAIsiE/NoOCbgztNh1zoVjhL4332ZV0m4z4KziIT14n43
 mu1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ABxa2liB5UmRZb7nAOaaoL+iM/4LSDSn4mCKTa5V6Kg=;
 b=MgWhv5NKUGs6QRlwMqKubUc1bAp6jRci6r+Ura68di3YDPpDllDStJPNw/50P8iSfW
 E0cFz5hz6XdmooMC1Vu9iAo2fo/N2UUjFr111PPGqnhiRLSIcwYgVnicFLOnf7qdCNpe
 fWcoAKUM/mjD4zM+33CTKQXoT+epkDqSq5pvfpOj2OUg40EkBKiJp1rJznAep5TtWkDH
 XQPui86ZzHslCTOhFEbxNRgj8Bzi7NRbfq9cBTJFgPf+MSoOKBX2MiiNbBmJJnO+yNTT
 3E+Ttzf3AyGZ6T/iFaNiyKqlqM25Dbt6JozMRbGJUSYMF94/zDl16clm8G13nWqyRtNj
 xNXQ==
X-Gm-Message-State: AOAM531oVbHki6UG/atJGq3xtGsfUM6VIUxP2mOtOs7Yd4ZpmwObFnFq
 +FD4Am8jbkeGUfEEk5JgVA1i7LpIJZ5cag==
X-Google-Smtp-Source: ABdhPJxTg4yyxJMkcjoFTd2p0nq2bgSySmRJR/wiNBZgDIQxyOLpQ8Tjty5e9Y9DHFk5v6nZK9KbWA==
X-Received: by 2002:a5d:6c66:0:b0:20f:86f3:ea05 with SMTP id
 r6-20020a5d6c66000000b0020f86f3ea05mr40692891wrz.154.1653926867474; 
 Mon, 30 May 2022 09:07:47 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bi12-20020a05600c3d8c00b003974b95d897sm10232152wmb.37.2022.05.30.09.07.46
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 May 2022 09:07:47 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 047/117] target/arm: Use TRANS_FEAT for do_shift_imm
Date: Mon, 30 May 2022 17:05:58 +0100
Message-Id: <20220530160708.726466-48-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220530160708.726466-1-peter.maydell@linaro.org>
References: <20220530160708.726466-1-peter.maydell@linaro.org>
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
Message-id: 20220527181907.189259-45-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-sve.c | 17 +++--------------
 1 file changed, 3 insertions(+), 14 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 6103bd7f1d4..f15e9a30b39 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -1054,20 +1054,9 @@ static bool do_shift_imm(DisasContext *s, arg_rri_esz *a, bool asr,
     return true;
 }
 
-static bool trans_ASR_zzi(DisasContext *s, arg_rri_esz *a)
-{
-    return do_shift_imm(s, a, true, tcg_gen_gvec_sari);
-}
-
-static bool trans_LSR_zzi(DisasContext *s, arg_rri_esz *a)
-{
-    return do_shift_imm(s, a, false, tcg_gen_gvec_shri);
-}
-
-static bool trans_LSL_zzi(DisasContext *s, arg_rri_esz *a)
-{
-    return do_shift_imm(s, a, false, tcg_gen_gvec_shli);
-}
+TRANS_FEAT(ASR_zzi, aa64_sve, do_shift_imm, a, true, tcg_gen_gvec_sari)
+TRANS_FEAT(LSR_zzi, aa64_sve, do_shift_imm, a, false, tcg_gen_gvec_shri)
+TRANS_FEAT(LSL_zzi, aa64_sve, do_shift_imm, a, false, tcg_gen_gvec_shli)
 
 #define DO_ZZW(NAME, name) \
     static gen_helper_gvec_3 * const name##_zzw_fns[4] = {                \
-- 
2.25.1


