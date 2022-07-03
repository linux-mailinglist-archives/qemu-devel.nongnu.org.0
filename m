Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4C1E564615
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jul 2022 11:06:52 +0200 (CEST)
Received: from localhost ([::1]:47166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7vZ5-0001Cr-Sw
	for lists+qemu-devel@lfdr.de; Sun, 03 Jul 2022 05:06:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uvu-0001oR-H8
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 04:26:22 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:53789)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uvt-0006B6-1X
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 04:26:22 -0400
Received: by mail-pj1-x1031.google.com with SMTP id ju17so1428110pjb.3
 for <qemu-devel@nongnu.org>; Sun, 03 Jul 2022 01:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XqyFuY6xtQUWsP/jQ4A5BA4dQ9EI8+6RDOKP4j5I7T8=;
 b=SX/PtmQoX3SyAefqW0WshbEGF+GdNUEa6OM2aUFIwXqU3U6FOz808rcD50Go3qmtqQ
 W+t44DrLvDv636LS20+UlfPKga5YbPSWNu+geHk5yfh31EzMD/QcaFWnAlwf/BAr5BMb
 6ZQeAWFxFA8idcHDC5J1Y2Oz3xGzENrv+DBeY6NDzxPoXqGmTSHDX0bRUT4553hme5H4
 vg28/5DeG5LOb0ChjpIb74jqUKJ6bVFa1drDqX5WPJ2sq2haO66d//azbpF1f3bX+Mna
 kuhq/I8P8DH6tYUXvpW2f+JXpkhBPP6/GRZvOMOGsVw5LKfTGH9O2qAAh4DDRQy8hNvN
 dO0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XqyFuY6xtQUWsP/jQ4A5BA4dQ9EI8+6RDOKP4j5I7T8=;
 b=UzdlaUo2P5cAKzry07c0cikJnYkwRvSHD3THqEF8/LPrdQ08rnw5wQ4ol6aitzaEWh
 OrWt6t+K1Di87MnMaeb5cXxkc5AaKhBPaa4+pX+yEk7pxdc2Cr8iqNpzJjSWBd8BZ/E5
 jFUGfmY4ydP0jN6jZ04rgF6G5X9BkMih9oBiN6fxVVe47yMxaKMmsz27E2wyq4TU2J9B
 JSb+j07Hzha3GOWIHL1/mW7zj5mv4ZiHTF/A2OBFg4iWMgrdFRVfNWDWuYy8Vfw2Lp4Y
 fzIfo3vbHNSd6yeB44Wdygxw/x1iRYjBKdDPEd9q8ztUkNcJkGkAKuqI9hIyfA4vPoSb
 Sxaw==
X-Gm-Message-State: AJIora9iNOuEEz1mrO1PZTVay+Gb2Ixd0njbP8OtJsylKAYsJTpxXQxc
 dWPE6sKWm8FQr8Pjpx3+atODnF9+6DIYGeMA
X-Google-Smtp-Source: AGRyM1vmTElSKDAzSDBYf1aHu7vSwj2Rj2ABWA0Mjce6ArL7BjQQbev/WCeMdIYcL6gCvpggFTyYKA==
X-Received: by 2002:a17:90a:a605:b0:1ea:6b4f:915e with SMTP id
 c5-20020a17090aa60500b001ea6b4f915emr29139094pjq.60.1656836780182; 
 Sun, 03 Jul 2022 01:26:20 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 im22-20020a170902bb1600b0016a3f9e528asm13569112plb.57.2022.07.03.01.26.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jul 2022 01:26:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 38/62] target/arm: Fix S2 disabled check in S1_ptw_translate
Date: Sun,  3 Jul 2022 13:53:55 +0530
Message-Id: <20220703082419.770989-39-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220703082419.770989-1-richard.henderson@linaro.org>
References: <20220703082419.770989-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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

Pass the correct stage2 mmu_idx to regime_translation_disabled,
which we computed afterward.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 12288ac365..12b6c2c98b 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -211,11 +211,10 @@ static hwaddr S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx,
                                ARMMMUFaultInfo *fi)
 {
     bool is_secure = *is_secure_ptr;
+    ARMMMUIdx s2_mmu_idx = is_secure ? ARMMMUIdx_Stage2_S : ARMMMUIdx_Stage2;
 
     if (arm_mmu_idx_is_stage1_of_2(mmu_idx) &&
-        !regime_translation_disabled(env, ARMMMUIdx_Stage2, is_secure)) {
-        ARMMMUIdx s2_mmu_idx = is_secure ? ARMMMUIdx_Stage2_S
-                                         : ARMMMUIdx_Stage2;
+        !regime_translation_disabled(env, s2_mmu_idx, is_secure)) {
         GetPhysAddrResult s2 = {};
         int ret;
 
-- 
2.34.1


