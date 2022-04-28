Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BFE251382E
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 17:21:50 +0200 (CEST)
Received: from localhost ([::1]:53060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk5xl-0006L5-Ah
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 11:21:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk5Ju-0005Yu-RE
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 10:40:40 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:35336)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk5Jo-0006OE-3R
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 10:40:34 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 c190-20020a1c35c7000000b0038e37907b5bso5452227wma.0
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 07:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=/GnLF5/cSmfzUi+OSCtQLBos8yqT2tmMuPAD3hre2Tw=;
 b=QGDkWAheKKgtOnv58/i+mi3ebsIUaS4OS1Eq9JeUiUoOhzrRmDLJF+Q90zma+jPCjj
 JmTGm2zWksg1WN78Nz6DS+YVEf1OHZxAjmzb+MBu5cF4xW4S+tV3ftaOepyxyIuCokII
 41/Tph5PDSodS2433mD+Ey9gFXFsJVaeuiEo7PQuAfqsCo0zyKlgsNBotOyBpKNI95QY
 6ZbyQtp2kFfK6SMnbh0DpSevlYrxPRFnWp/5P0NtK30r9edl4VWtNlTyMxA6e7u3eBV9
 l6HLEsO3WdeMkWQn42q68bxXqRFBdDGRpSroMo9tW0+TjjFc+bRYUr459N29cnBXw4yT
 S8Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/GnLF5/cSmfzUi+OSCtQLBos8yqT2tmMuPAD3hre2Tw=;
 b=HNhItGbIY64TtJaDDa39BT+8oejh182+oYNqaTy2MxPbAQt84keAJwkVOL1d/KWiYA
 L6o9ff3EE/fp0ir312oW2lCZVy8g7SxrAM+ghEsh+jPnfAyMSg6NBtvdRr+VD06lWnJx
 5PM96yLxz18lnvyVe7NqQYRMWJVJ4qMaFdQUi9Ndhx7CxbECQC/3T3oGgPrfoEh4NBts
 pv2qhaKfiXn2H7UQeQKEEzCkK252x80SoxcutHX+rhIPkRj8VO47apHBFO4MFKVqKHO4
 imPbPU5HgPyjJIxHxOI3DQ1n4b9GUhEdy/H/OpFqF8IEvW+kzqAkedE8IgzArlxL0NYa
 PRQA==
X-Gm-Message-State: AOAM530sVy5b9h7M+5GvIUn2ujqFXbUxBKQXGp6b7pVaNpE9Sru0H8Z2
 VMvIVZVKdsoSWcgtviBPh8n+YZYX3ZBHng==
X-Google-Smtp-Source: ABdhPJyF6C7kxz46Jf2hbTDPtYVe7Hf0yt6wIjDCmGSG6TMmhZsQUvUPGBaSO50YYEnrn4s3RZiigA==
X-Received: by 2002:a05:600c:6d3:b0:38e:c692:d50a with SMTP id
 b19-20020a05600c06d300b0038ec692d50amr40187868wmn.30.1651156830364; 
 Thu, 28 Apr 2022 07:40:30 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bh26-20020a05600c3d1a00b003928db85759sm130221wmb.15.2022.04.28.07.40.29
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Apr 2022 07:40:30 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 29/54] target/arm: Use tcg_constant for MOVW, UMAAL, CRC32
Date: Thu, 28 Apr 2022 15:39:33 +0100
Message-Id: <20220428143958.2451229-30-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220428143958.2451229-1-peter.maydell@linaro.org>
References: <20220428143958.2451229-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
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
Message-id: 20220426163043.100432-30-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 223fd5fdfe7..cc540f2b47f 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -5652,14 +5652,11 @@ static bool trans_ADR(DisasContext *s, arg_ri *a)
 
 static bool trans_MOVW(DisasContext *s, arg_MOVW *a)
 {
-    TCGv_i32 tmp;
-
     if (!ENABLE_ARCH_6T2) {
         return false;
     }
 
-    tmp = tcg_const_i32(a->imm);
-    store_reg(s, a->rd, tmp);
+    store_reg(s, a->rd, tcg_constant_i32(a->imm));
     return true;
 }
 
@@ -6030,14 +6027,13 @@ static bool trans_UMAAL(DisasContext *s, arg_UMAAL *a)
     t0 = load_reg(s, a->rm);
     t1 = load_reg(s, a->rn);
     tcg_gen_mulu2_i32(t0, t1, t0, t1);
-    zero = tcg_const_i32(0);
+    zero = tcg_constant_i32(0);
     t2 = load_reg(s, a->ra);
     tcg_gen_add2_i32(t0, t1, t0, t1, t2, zero);
     tcg_temp_free_i32(t2);
     t2 = load_reg(s, a->rd);
     tcg_gen_add2_i32(t0, t1, t0, t1, t2, zero);
     tcg_temp_free_i32(t2);
-    tcg_temp_free_i32(zero);
     store_reg(s, a->ra, t0);
     store_reg(s, a->rd, t1);
     return true;
@@ -6284,14 +6280,13 @@ static bool op_crc32(DisasContext *s, arg_rrr *a, bool c, MemOp sz)
     default:
         g_assert_not_reached();
     }
-    t3 = tcg_const_i32(1 << sz);
+    t3 = tcg_constant_i32(1 << sz);
     if (c) {
         gen_helper_crc32c(t1, t1, t2, t3);
     } else {
         gen_helper_crc32(t1, t1, t2, t3);
     }
     tcg_temp_free_i32(t2);
-    tcg_temp_free_i32(t3);
     store_reg(s, a->rd, t1);
     return true;
 }
-- 
2.25.1


