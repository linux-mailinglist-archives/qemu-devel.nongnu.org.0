Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 783AF50B61A
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 13:23:07 +0200 (CEST)
Received: from localhost ([::1]:46114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhrNR-00055p-EO
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 07:23:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhqAV-0005hg-W9
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 06:05:40 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:34695)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhqAM-0002xh-Rb
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 06:05:38 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 ay36-20020a05600c1e2400b0038ebc885115so4692547wmb.1
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 03:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=zaKs7nV/Bv9VFOMg50MhiPk1cL7Obi+7zlrOm4dY3bM=;
 b=aw74E6hdP1Rf33WMmCKAhc0wtRx2sTcz0n4Eg40KXzBjH0fdbgU0CzXwxBKaOWCVNF
 g4CkbKTmf4M3+AxBe1IZOqOIlZB0GAg3kL4Q5zgcVtiJJYOndQpsBnOX5NUbV2KHKDhF
 yNQR83OLf+iOWV+yPOegRi6wW4svRfqbSMwxiS23LCbMuKZjpz5xGhLoekpiCn6oTeHZ
 b3EZJgr5zeDaGtdnVwrB8Z9rB2d5nWNwyzAA0QaP1IWYTFq8kKfCeT630KVA21xwoQo0
 jtSeaE6rOWBVdr1R1t6VzhPp1QSde/r4AEWmYrAfBKqEnZf7TpVn0YgcSYjriHvgv27N
 qixw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zaKs7nV/Bv9VFOMg50MhiPk1cL7Obi+7zlrOm4dY3bM=;
 b=Z5LSmStvY7eJNp2Aylu5s1hbIrRqKzDir12JfWwidx1bPOq4jhnP99yLChFQSlHFrF
 Ok9SUJv7ReSwsvo8AzMKGEyXYCl6khwoXmFU0fvGWyWO4DTMRGCGoFdOhhgEDPRKg6Sc
 eAwwHhgty5uwcQhu4McAjxCcD8swL+xO2186ySE9+2puNrxWOGxiM2y2Bfu+5yqZEiSn
 VLGBDidaUhaljfkwPLXc10O3rx5pAXVEdwPqFR189DF74L7S2VdemAAWF2VewwLAyRpa
 3DYBeidb6qFsidD2JD9jclPhTtgQRNqRCAoV8+G/N1kC80PVl020/mmJ3cPnNdOfbvMZ
 Gumw==
X-Gm-Message-State: AOAM532WUeSeIGtPILTvLaM/lwVm6dvtd4YXWbBzcLcILJfEkMdAupQ9
 vjU5Mxq9x6slJP7+jLQw/3i/0kEJEQaFYw==
X-Google-Smtp-Source: ABdhPJx6oO/INrFIEXi8hzdH+jJbZFDBFVEj6EydSQgytQMSMO4eomwa5oO3SLzXJTlO82TIIK05Vg==
X-Received: by 2002:a05:600c:29c7:b0:38e:c58d:7b00 with SMTP id
 s7-20020a05600c29c700b0038ec58d7b00mr3535714wmd.47.1650621929065; 
 Fri, 22 Apr 2022 03:05:29 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 e16-20020a05600c2dd000b0038ed449cbdbsm4312148wmh.3.2022.04.22.03.05.28
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 03:05:28 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 58/61] target/arm: Use smin/smax for do_sat_addsub_32
Date: Fri, 22 Apr 2022 11:04:29 +0100
Message-Id: <20220422100432.2288247-59-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220422100432.2288247-1-peter.maydell@linaro.org>
References: <20220422100432.2288247-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

The operation we're performing with the movcond
is either min/max depending on cond -- simplify.
Use tcg_constant_i64 while we're at it.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-sve.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 180e14d9f88..726cf88d7c5 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -1916,8 +1916,6 @@ static bool trans_PNEXT(DisasContext *s, arg_rr_esz *a)
 static void do_sat_addsub_32(TCGv_i64 reg, TCGv_i64 val, bool u, bool d)
 {
     int64_t ibound;
-    TCGv_i64 bound;
-    TCGCond cond;
 
     /* Use normal 64-bit arithmetic to detect 32-bit overflow.  */
     if (u) {
@@ -1928,15 +1926,12 @@ static void do_sat_addsub_32(TCGv_i64 reg, TCGv_i64 val, bool u, bool d)
     if (d) {
         tcg_gen_sub_i64(reg, reg, val);
         ibound = (u ? 0 : INT32_MIN);
-        cond = TCG_COND_LT;
+        tcg_gen_smax_i64(reg, reg, tcg_constant_i64(ibound));
     } else {
         tcg_gen_add_i64(reg, reg, val);
         ibound = (u ? UINT32_MAX : INT32_MAX);
-        cond = TCG_COND_GT;
+        tcg_gen_smin_i64(reg, reg, tcg_constant_i64(ibound));
     }
-    bound = tcg_const_i64(ibound);
-    tcg_gen_movcond_i64(cond, reg, reg, bound, bound, reg);
-    tcg_temp_free_i64(bound);
 }
 
 /* Similarly with 64-bit values.  */
-- 
2.25.1


