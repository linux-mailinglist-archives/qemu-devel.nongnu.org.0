Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7CE85137C3
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 17:07:46 +0200 (CEST)
Received: from localhost ([::1]:47376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk5k9-0000BP-Lk
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 11:07:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk5K1-0005b5-Tu
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 10:40:46 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:33710)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk5Jw-0006SN-En
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 10:40:43 -0400
Received: by mail-wr1-x432.google.com with SMTP id x18so7136707wrc.0
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 07:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=KB9B+yBHKQSIsE1Y/f33Wv0GlMuOzG+vMaRlhHfmsgM=;
 b=uC/C7W3YzP19pWrGE+XFGjBLTp8vHjPmsNDdVHqA9He4illKSLPI2rqCulrbk2kImO
 xU76LqYL3smZje3UOJyjcMm7Vv8I6XWq6RJBJlf9l2skKfm9279QlffZ7F7H69kmRKyM
 dp61pvkLCF9OnP0o5NNh8RmlLhl/A2wjsIFv8C+D621eRYwsY5WEKESAm7sejU1dH6Ay
 UlDYGjtHSZWHQMptD8Y+TFEqopAvXMtRsbC8dFMNr06TDvgvQfcQfhXqE4MIwRi2XAtq
 ZnGiR2XTc4s98/U9i/8chyFwBcWIBB97ZdgxJJc3WPBD1LMjfioox7c0F2AFdaKKH3YT
 Tycw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KB9B+yBHKQSIsE1Y/f33Wv0GlMuOzG+vMaRlhHfmsgM=;
 b=V5A1aUb/U43wB2Elh+ZcAqW+o9Djfk6pYypbD92yeZWd+/VfFv7NtApQRgy0tKufC/
 DLCQe1265yfx8kMcSRPxeggycvNwOJu8I7eQOBsiIy6Ej/UOZiAVmV/gTMASRbRVZ/Ej
 UL85hlcqkEDcYMq3xgQdsdFJGob9QUSBOYyLI1VTQismG55dyn/DS8Ka9LV3ODTiddr6
 +No5BxJWQAONbCEdI3Cw+LplmVW0CYj1pkq3RIzNkgqp6CceYc2h3zjD8Wg4OBp/rrmh
 cmWSsPiJhYrXVhpbbueZGLIO9Emsioq4Fbo3bTd68FfOKY4Km53EYPOMly1y1qndY9rz
 bcTA==
X-Gm-Message-State: AOAM530Lt2i/EfYap7FGbd23GqULJzZIhx9OJgW+Ou81nKqhz2IvXV7a
 7qdduUWDYhsBbKL4cKLZtemqNEubZGG+Uw==
X-Google-Smtp-Source: ABdhPJxR2LiNkz/iWFblrmLT0a4HJBUlEeDf0uJEDFGA6Q1FP+YWMTdejqaVvBxgMqK/o3OkY2BKeg==
X-Received: by 2002:a05:6000:2a1:b0:20a:7c6a:d43e with SMTP id
 l1-20020a05600002a100b0020a7c6ad43emr27486502wry.417.1651156838652; 
 Thu, 28 Apr 2022 07:40:38 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bh26-20020a05600c3d1a00b003928db85759sm130221wmb.15.2022.04.28.07.40.37
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Apr 2022 07:40:38 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 39/54] target/arm: Use tcg_constant in {incr, wrap}_last_active
Date: Thu, 28 Apr 2022 15:39:43 +0100
Message-Id: <20220428143958.2451229-40-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220428143958.2451229-1-peter.maydell@linaro.org>
References: <20220428143958.2451229-1-peter.maydell@linaro.org>
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
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-id: 20220426163043.100432-40-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-sve.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index ef57d3a2b49..c3d3f301c99 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -2793,11 +2793,9 @@ static void incr_last_active(DisasContext *s, TCGv_i32 last, int esz)
     if (is_power_of_2(vsz)) {
         tcg_gen_andi_i32(last, last, vsz - 1);
     } else {
-        TCGv_i32 max = tcg_const_i32(vsz);
-        TCGv_i32 zero = tcg_const_i32(0);
+        TCGv_i32 max = tcg_constant_i32(vsz);
+        TCGv_i32 zero = tcg_constant_i32(0);
         tcg_gen_movcond_i32(TCG_COND_GEU, last, last, max, zero, last);
-        tcg_temp_free_i32(max);
-        tcg_temp_free_i32(zero);
     }
 }
 
@@ -2809,11 +2807,9 @@ static void wrap_last_active(DisasContext *s, TCGv_i32 last, int esz)
     if (is_power_of_2(vsz)) {
         tcg_gen_andi_i32(last, last, vsz - 1);
     } else {
-        TCGv_i32 max = tcg_const_i32(vsz - (1 << esz));
-        TCGv_i32 zero = tcg_const_i32(0);
+        TCGv_i32 max = tcg_constant_i32(vsz - (1 << esz));
+        TCGv_i32 zero = tcg_constant_i32(0);
         tcg_gen_movcond_i32(TCG_COND_LT, last, last, zero, max, last);
-        tcg_temp_free_i32(max);
-        tcg_temp_free_i32(zero);
     }
 }
 
-- 
2.25.1


