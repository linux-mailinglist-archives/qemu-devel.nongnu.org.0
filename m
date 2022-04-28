Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DC67513789
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 16:58:14 +0200 (CEST)
Received: from localhost ([::1]:49032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk5av-00073a-9B
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 10:58:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk5JZ-0005CL-CW
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 10:40:18 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:42843)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk5JX-0006GA-Pj
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 10:40:17 -0400
Received: by mail-wr1-x435.google.com with SMTP id e24so7060703wrc.9
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 07:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=5Y7pNte1LLspgnSd1wrzXvCBtopn0VLHohZ/8ka6EkU=;
 b=jsArb1AGfwAMM5FGYCXrTn2UHkFPkWfhxP+Miq3w2mQ1C0Z4ZecfEXrSgJqld0OqAX
 4Z3qkdK5HXyHf0ROTlMCcnZ13pih5m1SGslEvLHXhSGEPfKyhseZ7wCB4zNABn1uwDmD
 B6XbfiKDCcvlCDrTPmwe+r3ADXARM5la89sgdbITBy6BJIAZX2I3MTfazlk4ZPlDJpWY
 c+Tudo1ckThv2RwTKDxh/+GFJkVPxbsnSa7ODwHlX9N68z5/bv23dV2lG27v+hP4bBxx
 pO8mki734GtGFiLBgo/Kw6+AR/kEWXbTy9FpWeZTisGfK68hh7UhRU9WCIHn/uUIJaIB
 9AyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5Y7pNte1LLspgnSd1wrzXvCBtopn0VLHohZ/8ka6EkU=;
 b=2oY78XQoZ++zLnl0fZKlMHrhNBGbHIulJctVYzHFajjis6M4qGlB3Sqn1ogR8hxgva
 vGhFu8ownrBMQTYY+hHfwpmiuGcV2ZgBSzcMPV3Uoy24jGZo/hFRs+u2MO8Wb2SS4Tq2
 yUBnFkw737I3em8SquZBQvHcgwIyKX+3WK33CzGKHcGqu2NuMihFagZNVcgMTPSwwgNd
 Zc/FRZJ1nHsANjrnSka8XYqJslkf2XUR1CGB77ZEcM0JK8Q9uAuOolbM3mPF0lhMvFXB
 VV5nlaQTvuLLDJGaR6sK/yRPYqEcoMRwHZWoLlYnZpcVMSRj1XKXIYVo5mAJ3KT/g6x4
 2klw==
X-Gm-Message-State: AOAM5336aCADSN1SmgREaDHcXpow/7ehtbNR2R2/J8DBSs9YOxQSC40Y
 CqkwNao/m9jh8PQB3gmc+bPqyTGdClxj2A==
X-Google-Smtp-Source: ABdhPJxZuNLKliyWp7g9ycjJViwOzCKjW4h9MCDELrCj+BzlxC5eoZZFZUohCxGl+uEu2FxrMTzFeA==
X-Received: by 2002:a05:6000:2a1:b0:20a:7c6a:d43e with SMTP id
 l1-20020a05600002a100b0020a7c6ad43emr27485218wry.417.1651156814457; 
 Thu, 28 Apr 2022 07:40:14 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bh26-20020a05600c3d1a00b003928db85759sm130221wmb.15.2022.04.28.07.40.13
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Apr 2022 07:40:14 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 12/54] target/arm: Use tcg_constant in disas_movw_imm
Date: Thu, 28 Apr 2022 15:39:16 +0100
Message-Id: <20220428143958.2451229-13-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220428143958.2451229-1-peter.maydell@linaro.org>
References: <20220428143958.2451229-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
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
Message-id: 20220426163043.100432-13-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-a64.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 6c88772eb32..537eebbf1da 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -4419,7 +4419,6 @@ static void disas_movw_imm(DisasContext *s, uint32_t insn)
     int opc = extract32(insn, 29, 2);
     int pos = extract32(insn, 21, 2) << 4;
     TCGv_i64 tcg_rd = cpu_reg(s, rd);
-    TCGv_i64 tcg_imm;
 
     if (!sf && (pos >= 32)) {
         unallocated_encoding(s);
@@ -4439,9 +4438,7 @@ static void disas_movw_imm(DisasContext *s, uint32_t insn)
         tcg_gen_movi_i64(tcg_rd, imm);
         break;
     case 3: /* MOVK */
-        tcg_imm = tcg_const_i64(imm);
-        tcg_gen_deposit_i64(tcg_rd, tcg_rd, tcg_imm, pos, 16);
-        tcg_temp_free_i64(tcg_imm);
+        tcg_gen_deposit_i64(tcg_rd, tcg_rd, tcg_constant_i64(imm), pos, 16);
         if (!sf) {
             tcg_gen_ext32u_i64(tcg_rd, tcg_rd);
         }
-- 
2.25.1


