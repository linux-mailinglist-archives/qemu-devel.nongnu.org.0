Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B65FB50B5D6
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 13:04:49 +0200 (CEST)
Received: from localhost ([::1]:36874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhr5k-0001dO-RJ
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 07:04:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhqAJ-0005aK-Lw
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 06:05:30 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:45966)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhqAH-0002wI-Ur
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 06:05:27 -0400
Received: by mail-wr1-x42a.google.com with SMTP id w4so10279697wrg.12
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 03:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=7SQzC5lAEqp5CMAsa+8Njn6FSg2/QmhMegZg1nRW8BE=;
 b=r/2Fc9tM+dO9ptE5xAcfNqAZqG/+s2l3NcMwagHwZncxYBdZ+2ZJNVAOoe0/ZGVcbu
 Q2DrefOWE4mrFcDBFEVw0Py9oZhajDjiIIDTkcshOxPvupV/NKAWS7Po8++vbHebMCsR
 Q1FC8Ybxo62JaMXdoyB5auLBzlFlFKze3LfgTbUpKMjX0B1ysTjx5MCJG87jOsmx2djY
 OhbEmD9OouzdNc9u1bV5LybEcfhcw4w9j/3WAp4jSg769cC6Tu/WmVOVWiZQxwfM3eMH
 QHALCprCrDrOecdp2qYmdi55cmctDnhCVlke7AiU/hb1SLswOik5kx6rWIF+30KzdlVG
 QBDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7SQzC5lAEqp5CMAsa+8Njn6FSg2/QmhMegZg1nRW8BE=;
 b=sSBJgZsmI3qQ6i0GgjF8jJk6Wd5eRyNTxz+dpCU9Jb60sXkNcMElTj9wGTxM/fxiIo
 vGaH1AOODnrcoOF7iAlhj+wvHETEIHiwC1+/6IoiCCY/Qi4J8R72ce//U+df3sM1Otea
 d9ygdgCuykCUDes4YwGQZ5bXRZ4opM7LWEhYLPEhjIsfNiLNVln5NE+FYKzdLUclSXwe
 rMVchohRb617UDLh8zdYFNshPNi5wsCDcLl333khU7y5N8U6v4gxoio0ctCIVj4gVadb
 WWMQ/B4i+OOYCRhD/L/aX5QBDLcwt8R7fc4ezMxqRw7Yz//D67CuEkgmFYmDy6AyEgoh
 BReg==
X-Gm-Message-State: AOAM531aYxWXYq1/Pb9K2fYhrxjUhAHe9xRlyE5tamhvlgBMHy/p0fZ9
 i5+JBLiiNUkaHnv6LsDCqmVyb2iZFrnuig==
X-Google-Smtp-Source: ABdhPJx4vJu/g6zhzh/WsCQBks94d/hCoSxt/knmM+bNlOmL9ZkM1PxVKaXlDqn/g0Ejvg2bnbKjuw==
X-Received: by 2002:a05:6000:1a87:b0:20a:7ea5:2aef with SMTP id
 f7-20020a0560001a8700b0020a7ea52aefmr3037461wry.666.1650621924610; 
 Fri, 22 Apr 2022 03:05:24 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 e16-20020a05600c2dd000b0038ed449cbdbsm4312148wmh.3.2022.04.22.03.05.23
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 03:05:24 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 53/61] target/arm: Simplify GEN_SHIFT in translate.c
Date: Fri, 22 Apr 2022 11:04:24 +0100
Message-Id: <20220422100432.2288247-54-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220422100432.2288247-1-peter.maydell@linaro.org>
References: <20220422100432.2288247-1-peter.maydell@linaro.org>
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

Instead of computing

    tmp1 = shift & 0xff;
    dest = (tmp1 > 0x1f ? 0 : value) << (tmp1 & 0x1f)

use

    tmpd = value << (shift & 0x1f);
    dest = shift & 0xe0 ? 0 : tmpd;

which has a flatter dependency tree.
Use tcg_constant_i32 while we're at it.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 4d7886fa853..0c9d50d48df 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -552,16 +552,14 @@ static void gen_sbc_CC(TCGv_i32 dest, TCGv_i32 t0, TCGv_i32 t1)
 #define GEN_SHIFT(name)                                               \
 static void gen_##name(TCGv_i32 dest, TCGv_i32 t0, TCGv_i32 t1)       \
 {                                                                     \
-    TCGv_i32 tmp1, tmp2, tmp3;                                        \
-    tmp1 = tcg_temp_new_i32();                                        \
-    tcg_gen_andi_i32(tmp1, t1, 0xff);                                 \
-    tmp2 = tcg_const_i32(0);                                          \
-    tmp3 = tcg_const_i32(0x1f);                                       \
-    tcg_gen_movcond_i32(TCG_COND_GTU, tmp2, tmp1, tmp3, tmp2, t0);    \
-    tcg_temp_free_i32(tmp3);                                          \
-    tcg_gen_andi_i32(tmp1, tmp1, 0x1f);                               \
-    tcg_gen_##name##_i32(dest, tmp2, tmp1);                           \
-    tcg_temp_free_i32(tmp2);                                          \
+    TCGv_i32 tmpd = tcg_temp_new_i32();                               \
+    TCGv_i32 tmp1 = tcg_temp_new_i32();                               \
+    TCGv_i32 zero = tcg_constant_i32(0);                              \
+    tcg_gen_andi_i32(tmp1, t1, 0x1f);                                 \
+    tcg_gen_##name##_i32(tmpd, t0, tmp1);                             \
+    tcg_gen_andi_i32(tmp1, t1, 0xe0);                                 \
+    tcg_gen_movcond_i32(TCG_COND_NE, dest, tmp1, zero, zero, tmpd);   \
+    tcg_temp_free_i32(tmpd);                                          \
     tcg_temp_free_i32(tmp1);                                          \
 }
 GEN_SHIFT(shl)
-- 
2.25.1


