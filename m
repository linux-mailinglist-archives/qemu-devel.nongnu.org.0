Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFD4253867C
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 19:02:06 +0200 (CEST)
Received: from localhost ([::1]:43738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvimL-0008HB-Ox
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 13:02:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhw8-0003nx-UC
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:08:09 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:41903)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhw6-0007GW-Jp
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:08:08 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 p5-20020a1c2905000000b003970dd5404dso6724791wmp.0
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 09:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=UpkCncvF3viMOSK4g05HRN7WhcCCIxoydNjSvVSWc/I=;
 b=Eq786jaTND5JQsWSL8cu7jvUPKzuQ0QYuv0od2N7KY33cKJVp/IGDWPEq7HmIV/7bx
 331VZyYwcJ+FYbz8LM0EHE+oqATR0bAyfdkhG3dixvKTdW1BPB/75fh+oBHyFXRDsq1X
 /T0IiyUpFomG/V18rQ+8Rrd7wSiTmLkcuqshPEuvoVcc0u2RTMj9X0h8AXLpoffYmNBr
 jIEqKblQugqCVY8mF0E67dTUSTMF7DiAd5sAg1URA/PI3P3/gnLU5QiwyoS1Ki29DgV0
 dnWbIc7WNZuDaqS7FeFfPai71Ut7K7IfjkW1aOyzLH7FdDmMAZe54B9gersoyGXL+BXO
 naqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UpkCncvF3viMOSK4g05HRN7WhcCCIxoydNjSvVSWc/I=;
 b=efg9AoSdplP3OY556Wab0nJqtDBWgT1jRBAcesyWRTING1h8C4iKtF+0mQ12DTYka+
 akxYnOkGOz1z15rHpA7XjtBJ8RCOCPj/uqYbr0gsl5bcwQo2GeP5hE1xzfuw2xewzM99
 wcfWWszX2umST1SwY96ywFZZrKNGW29MznXDC+hbyMJOwi6v0wIQYKdGawzSVmcJj7Fu
 js1DcwK6v/ZYORbPWjIz3EwYsSrZ15CpGktjEVHSoFIJs5b4NoJj+tQFCcPPmE8SeLgo
 RRuYQOoVqAzww62vMs2MUVL26SRsOXGZxDICRtKfR+Yl1oW2a0EiCCLRzJmEz++rpkWC
 IlJQ==
X-Gm-Message-State: AOAM532VCdfoEcheN3bc4mCrKNjLVLzPv2TAJ2Y+1UZtCduoL4fVIz0B
 J/OLfta8JuKZwc2rXdM9g/3fIWCn0Gyb1w==
X-Google-Smtp-Source: ABdhPJw/aJF19+L8ZIb6zz9oOJ0yVb7OuKGiROPJ4a8J1k4tQh6viyWFSFcitfCKsesHgV5G+HMJkw==
X-Received: by 2002:a7b:c1d8:0:b0:397:337a:b593 with SMTP id
 a24-20020a7bc1d8000000b00397337ab593mr19583075wmj.96.1653926885143; 
 Mon, 30 May 2022 09:08:05 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bi12-20020a05600c3d8c00b003974b95d897sm10232152wmb.37.2022.05.30.09.08.03
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 May 2022 09:08:04 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 059/117] target/arm: Use TRANS_FEAT for do_perm_pred2
Date: Mon, 30 May 2022 17:06:10 +0100
Message-Id: <20220530160708.726466-60-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220530160708.726466-1-peter.maydell@linaro.org>
References: <20220530160708.726466-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
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
Message-id: 20220527181907.189259-57-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-sve.c | 17 +++--------------
 1 file changed, 3 insertions(+), 14 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 413e89b19ca..1e6bcedb9df 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -2279,20 +2279,9 @@ TRANS_FEAT(UZP2_p, aa64_sve, do_perm_pred3, a, 1, gen_helper_sve_uzp_p)
 TRANS_FEAT(TRN1_p, aa64_sve, do_perm_pred3, a, 0, gen_helper_sve_trn_p)
 TRANS_FEAT(TRN2_p, aa64_sve, do_perm_pred3, a, 1, gen_helper_sve_trn_p)
 
-static bool trans_REV_p(DisasContext *s, arg_rr_esz *a)
-{
-    return do_perm_pred2(s, a, 0, gen_helper_sve_rev_p);
-}
-
-static bool trans_PUNPKLO(DisasContext *s, arg_PUNPKLO *a)
-{
-    return do_perm_pred2(s, a, 0, gen_helper_sve_punpk_p);
-}
-
-static bool trans_PUNPKHI(DisasContext *s, arg_PUNPKHI *a)
-{
-    return do_perm_pred2(s, a, 1, gen_helper_sve_punpk_p);
-}
+TRANS_FEAT(REV_p, aa64_sve, do_perm_pred2, a, 0, gen_helper_sve_rev_p)
+TRANS_FEAT(PUNPKLO, aa64_sve, do_perm_pred2, a, 0, gen_helper_sve_punpk_p)
+TRANS_FEAT(PUNPKHI, aa64_sve, do_perm_pred2, a, 1, gen_helper_sve_punpk_p)
 
 /*
  *** SVE Permute - Interleaving Group
-- 
2.25.1


