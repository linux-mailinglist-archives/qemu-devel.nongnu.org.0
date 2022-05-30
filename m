Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CAAE53866C
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 18:55:33 +0200 (CEST)
Received: from localhost ([::1]:54670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvig0-0004yl-61
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 12:55:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhw8-0003l7-7r
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:08:08 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:32840)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhw5-0007Lc-Hz
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:08:07 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 o29-20020a05600c511d00b00397697f172dso202732wms.0
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 09:08:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=SRTvm860Uf5hUyhBk4byQQKpwYL1ZUioAQoIL6c3PLU=;
 b=aoBPZoZEfPJy69/YOtI3hldGCqwMO/txf6bGeDDhG3vXIZC9aYlgNooJNBdf/IofWw
 lt4Rx3pWm7C0J40ehmimrfZHJY3L6/Idmktf9qarUplhmfp0v/jSgui0Baaa4qg00MM2
 gRe905kCUNn0TFyKj4xiZ4v9bi3Xw/q/iUhe3gwEdvRzIOSwTHNNgHPPjHx8rZmY3CyS
 nLMC9EwO6dcZXU38lmYnE9s/gXa3yQL+mmoY95lHRksNnqHm0VbWFLNTXDW1z8ltg1Ab
 V2JkSVsImC82wUjnr9uofTkw/YApD/wVNZOHE7/N8sWFFLCzROnF26OSfkJuh+6BUdwi
 3aDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SRTvm860Uf5hUyhBk4byQQKpwYL1ZUioAQoIL6c3PLU=;
 b=dULLRLsxVqGP7E3DNF3S7gzxKnBL6Ra1AVIYYMhtfus96rRzjGCjkHJyVgr7ALjnoG
 wFVOpQ/7J2Vwah+W9/jqZs2iS9kewK/xE2bWuekVb7OQYXYi0rRQqFu5Bhow7XRVLcJH
 XgdaD3fGc9T92K2V+t7NuJ+QcgTCEi8ErPFhsD/xJ+i3YUCW5Fs+1vMUaeGseNwCmaXo
 /3u10BRgoPa8ixc46M/R5KhtTBGAff42CO/Q+ti9m3tyumPaOInMp2inUOj8q4SXAf5p
 1pjLTRBRB+7u0F9pC2TESCvKBIX6QBAWjYr+bcqSxF9HZdf/f0kDvul+YN0ohK2xyMzZ
 Mjkg==
X-Gm-Message-State: AOAM530hNN1+JUxNQUukpNvcD9RK6qHS8JP7jMMooyn9qxrnfDZgTSw2
 bY1MajXGYsI30dnc57MrrtcwA1PBLeelfA==
X-Google-Smtp-Source: ABdhPJzMfslhrFypxZNH9DpJsrlgL79sEX4cJ1qVlyIH/z21LgmtjtQp24gad+ecAWBXOGsm3E55gw==
X-Received: by 2002:a05:600c:20c:b0:397:344f:326f with SMTP id
 12-20020a05600c020c00b00397344f326fmr19798815wmi.31.1653926882748; 
 Mon, 30 May 2022 09:08:02 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bi12-20020a05600c3d8c00b003974b95d897sm10232152wmb.37.2022.05.30.09.08.00
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 May 2022 09:08:02 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 058/117] target/arm: Use TRANS_FEAT for do_perm_pred3
Date: Mon, 30 May 2022 17:06:09 +0100
Message-Id: <20220530160708.726466-59-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220530160708.726466-1-peter.maydell@linaro.org>
References: <20220530160708.726466-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
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
Message-id: 20220527181907.189259-56-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-sve.c | 35 ++++++-----------------------------
 1 file changed, 6 insertions(+), 29 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 7139e6c0b04..413e89b19ca 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -2272,35 +2272,12 @@ static bool do_perm_pred2(DisasContext *s, arg_rr_esz *a, bool high_odd,
     return true;
 }
 
-static bool trans_ZIP1_p(DisasContext *s, arg_rrr_esz *a)
-{
-    return do_perm_pred3(s, a, 0, gen_helper_sve_zip_p);
-}
-
-static bool trans_ZIP2_p(DisasContext *s, arg_rrr_esz *a)
-{
-    return do_perm_pred3(s, a, 1, gen_helper_sve_zip_p);
-}
-
-static bool trans_UZP1_p(DisasContext *s, arg_rrr_esz *a)
-{
-    return do_perm_pred3(s, a, 0, gen_helper_sve_uzp_p);
-}
-
-static bool trans_UZP2_p(DisasContext *s, arg_rrr_esz *a)
-{
-    return do_perm_pred3(s, a, 1, gen_helper_sve_uzp_p);
-}
-
-static bool trans_TRN1_p(DisasContext *s, arg_rrr_esz *a)
-{
-    return do_perm_pred3(s, a, 0, gen_helper_sve_trn_p);
-}
-
-static bool trans_TRN2_p(DisasContext *s, arg_rrr_esz *a)
-{
-    return do_perm_pred3(s, a, 1, gen_helper_sve_trn_p);
-}
+TRANS_FEAT(ZIP1_p, aa64_sve, do_perm_pred3, a, 0, gen_helper_sve_zip_p)
+TRANS_FEAT(ZIP2_p, aa64_sve, do_perm_pred3, a, 1, gen_helper_sve_zip_p)
+TRANS_FEAT(UZP1_p, aa64_sve, do_perm_pred3, a, 0, gen_helper_sve_uzp_p)
+TRANS_FEAT(UZP2_p, aa64_sve, do_perm_pred3, a, 1, gen_helper_sve_uzp_p)
+TRANS_FEAT(TRN1_p, aa64_sve, do_perm_pred3, a, 0, gen_helper_sve_trn_p)
+TRANS_FEAT(TRN2_p, aa64_sve, do_perm_pred3, a, 1, gen_helper_sve_trn_p)
 
 static bool trans_REV_p(DisasContext *s, arg_rr_esz *a)
 {
-- 
2.25.1


