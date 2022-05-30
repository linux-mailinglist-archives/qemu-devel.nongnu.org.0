Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 677955386B8
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 19:22:18 +0200 (CEST)
Received: from localhost ([::1]:39042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvj5t-0002dD-H2
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 13:22:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhwW-0003zs-9B
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:08:36 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:35748)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhwS-0007MD-Qu
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:08:31 -0400
Received: by mail-wr1-x434.google.com with SMTP id q21so4089541wra.2
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 09:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=FD6w/7DiE3v3KE01pXoBFAU8YKoTVucpdCsqwe263ok=;
 b=rEiUAKorCPqUR4n/l2Emgzm3UblNYrzx/Zk6TqdMw3MCDx62+68my3+OoMt0TeZent
 iwN9wtBi3Qmekyd0Ls4hJD8wWfPc0gYEm5+kbH/bYECTi+G2TVgpH8VRjOTfdHvHvyZ/
 KlFSWtaIMxzOJ0pv4PBuP1CPeEcyw/x8v+K5NxY2buZnSw8nFppH2kkTiluu1XC7Hyjz
 ubrOVbRlLseKGdTzSp0Ph8H+nxDcdEg01YNlLt/NbSzNYorI5YnOPxrYAxXb6UGg3Asw
 nIgguL/TWQpISkuPOI4Wfbyg1wp3YwA1ojVZg4vHR8WPpuycn7pb+qei3uU/+RQ4AWfA
 FJ9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FD6w/7DiE3v3KE01pXoBFAU8YKoTVucpdCsqwe263ok=;
 b=2gX/h7y8BnyNkQmjmzM5tHilv8m0gb3g4GOW2fBySE0KJXuahufPC9rOjCxyTcfia7
 ZYjPNIr3/apGIvMB2uBwcaGXLaAUiE9NsxoOyG4PKAvdVNztXDD0fpP2lQsC6YIt5ilp
 9b/j8yfi/70SL+d7ycEo9FWBm38mJkg6f0O/n9LZpkiFzKHntu6I6gbancQ153OgybCP
 rrSwNzHHDoZxT1DdpjGoYvuwQZnM3VeJLHnKe6H99zRUVk3llBBvV50FYVQY1E1AILY2
 z6ypKKsXh/I0nSN1qSfNzj8yjG5uga6s9Jf7OVo+ZiRzU3C0J0ivFXFXmiwjsGDbwu0K
 ZRuw==
X-Gm-Message-State: AOAM533oZG/28gLX9ybmr2cbmH8Y5ZhX5asdaao8WyNgcbKjYDJJcOTO
 +/4HzRnpZnsyEmnSBh69fpDyCqURx1nymQ==
X-Google-Smtp-Source: ABdhPJz6BD4Ey+mYRubvxRIQOZa/dIucfq08WTddPmTkJV0gYXyi00YEpWh1gkXHgriDqN4AnI6nhQ==
X-Received: by 2002:adf:e0c3:0:b0:20c:5672:9577 with SMTP id
 m3-20020adfe0c3000000b0020c56729577mr45682568wri.466.1653926907875; 
 Mon, 30 May 2022 09:08:27 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bi12-20020a05600c3d8c00b003974b95d897sm10232152wmb.37.2022.05.30.09.08.27
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 May 2022 09:08:27 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 085/117] target/arm: Use TRANS_FEAT for MOVPRFX
Date: Mon, 30 May 2022 17:06:36 +0100
Message-Id: <20220530160708.726466-86-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220530160708.726466-1-peter.maydell@linaro.org>
References: <20220530160708.726466-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
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
Message-id: 20220527181907.189259-83-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-sve.c | 17 +++--------------
 1 file changed, 3 insertions(+), 14 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index a040d694eab..6e8d8d54bfe 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -6054,20 +6054,9 @@ static bool trans_PRF_rr(DisasContext *s, arg_PRF_rr *a)
  * In the meantime, just emit the moves.
  */
 
-static bool trans_MOVPRFX(DisasContext *s, arg_MOVPRFX *a)
-{
-    return do_mov_z(s, a->rd, a->rn);
-}
-
-static bool trans_MOVPRFX_m(DisasContext *s, arg_rpr_esz *a)
-{
-    return do_sel_z(s, a->rd, a->rn, a->rd, a->pg, a->esz);
-}
-
-static bool trans_MOVPRFX_z(DisasContext *s, arg_rpr_esz *a)
-{
-    return do_movz_zpz(s, a->rd, a->rn, a->pg, a->esz, false);
-}
+TRANS_FEAT(MOVPRFX, aa64_sve, do_mov_z, a->rd, a->rn)
+TRANS_FEAT(MOVPRFX_m, aa64_sve, do_sel_z, a->rd, a->rn, a->rd, a->pg, a->esz)
+TRANS_FEAT(MOVPRFX_z, aa64_sve, do_movz_zpz, a->rd, a->rn, a->pg, a->esz, false)
 
 /*
  * SVE2 Integer Multiply - Unpredicated
-- 
2.25.1


