Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E23574CB098
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 22:02:46 +0100 (CET)
Received: from localhost ([::1]:55610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPW7S-0003rq-1f
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 16:02:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nPVxt-0005s3-9v
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 15:52:53 -0500
Received: from [2a00:1450:4864:20::429] (port=45989
 helo=mail-wr1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nPVxr-0008Sq-Jr
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 15:52:52 -0500
Received: by mail-wr1-x429.google.com with SMTP id p9so4646503wra.12
 for <qemu-devel@nongnu.org>; Wed, 02 Mar 2022 12:52:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Drnno4VnFLtPbToNjmzneuITCSewrWEnfgXUqfz8b3M=;
 b=KZ69s9sXpbZegzB6sASBbDezN8Ki+Kep2u6cijHbA2LiCnDSZr5aqeMMOZBhXELG4W
 FDqlCsq3PzRRuz/t2wgsAgJd/3vp1LAvcJvX8DeMTuSbZu/96pggfgnIZTb6HD0WGjHI
 AwvaikWF1lVfPsClFfN4wD95hbpy4Tj5MGsc604oIqpLFhj3RLOYARhNmcE4LqBBXMiD
 6FluAyjiV1kOGO8yC0y1hEPcb6vCSZum4cw64XRZpbFZhV44FiQ1QeA4YRvgF1MV+LPT
 GGgUCvUj62Nk6ZeTP9WscLPk7QoMI6yJHEaewSTzxqUzWLClpplrCKEhUpfr+zgc522J
 pXiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Drnno4VnFLtPbToNjmzneuITCSewrWEnfgXUqfz8b3M=;
 b=Al5hlT2Dn40vaBRqtUIPjbBqE/3+aACD9dT/TTIAwb95WnQGtobbD0GlNWb+kidthS
 xqlI6ThoBhOXnYfWFuCtaTnCW6DRAkzEJw3R5HvyhzEqp8kKjn+YFg/u9M1m/XnHLENp
 e2ClQgIV0X7iEhKjswHmIlgOlKq7MS7c/Er+ayZ0N95Hefss1PsLdrt69yWIPLT3CCy+
 GBw7mKiWnTbd3mDo3YiRH2zb1HzwvnJ7qWVAUv+H+FvXbqWgFv5Di6DlhU3EVJQFS6pr
 onw+edowQQ8uokgfOA3To/TlyYcdfQvzxWOyJ8BvC58aK+5ArOfl2Q3Hv0nQJHeFOjHY
 i5JA==
X-Gm-Message-State: AOAM530ILIg7jYPUXFOUMIpL8RzkiqVMuklNooIv5RkhMmVgFBVYFvWi
 V26wZLzzlEXxbJ9rjCdUgfvEFRC7yKyMoA==
X-Google-Smtp-Source: ABdhPJyPDMfJybiLuaWqtmtAPaRhjlv1tWOIkV1wDB3yLCIpEpqe3Mo2qEm3oEndwOvNO16ya1fP9Q==
X-Received: by 2002:adf:e6cd:0:b0:1ef:db24:7ad1 with SMTP id
 y13-20020adfe6cd000000b001efdb247ad1mr10717215wrm.233.1646254370308; 
 Wed, 02 Mar 2022 12:52:50 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 x13-20020adfec0d000000b001e31279cc38sm90801wrn.11.2022.03.02.12.52.49
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Mar 2022 12:52:49 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 20/26] target/arm: Fix TLBIRange.base for 16k and 64k pages
Date: Wed,  2 Mar 2022 20:52:24 +0000
Message-Id: <20220302205230.2122390-21-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220302205230.2122390-1-peter.maydell@linaro.org>
References: <20220302205230.2122390-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::429
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

The shift of the BaseADDR field depends on the translation
granule in use.

Fixes: 84940ed8255 ("target/arm: Add support for FEAT_TLBIRANGE")
Reported-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220301215958.157011-14-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 31c2a716f2a..e455397fb57 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -4538,10 +4538,11 @@ static TLBIRange tlbi_aa64_get_range(CPUARMState *env, ARMMMUIdx mmuidx,
     ret.length = (num + 1) << (exponent + page_shift);
 
     if (regime_has_2_ranges(mmuidx)) {
-        ret.base = sextract64(value, 0, 37) << TARGET_PAGE_BITS;
+        ret.base = sextract64(value, 0, 37);
     } else {
-        ret.base = extract64(value, 0, 37) << TARGET_PAGE_BITS;
+        ret.base = extract64(value, 0, 37);
     }
+    ret.base <<= page_shift;
 
     return ret;
 }
-- 
2.25.1


