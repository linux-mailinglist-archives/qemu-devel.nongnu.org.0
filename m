Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AF41513739
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 16:45:43 +0200 (CEST)
Received: from localhost ([::1]:53196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk5Oo-000753-72
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 10:45:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk5JW-00055i-NO
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 10:40:15 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:53237)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk5JV-0006EQ-6M
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 10:40:14 -0400
Received: by mail-wm1-x32b.google.com with SMTP id y21so3078979wmi.2
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 07:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=/yDO7++Z+HrE8q9Tl4I5SBZlbbqQD8rc7Y6ufd3IgGQ=;
 b=xbR4cyLMNkm3AFUi7diqnLvic1hlf8FSRqvZIDxEtTlUL2QcZBovt2KpoH0IbjCf+3
 ezKQYs9ZzAkKNNgTnpc1+Gg39hBXTQ/hKR6gtw3vHWER9S3POJjFOAFhF+ZZFYF5betO
 jwC1OxE8tPzVvX3PHGUFk+PgSdIEJS+rgL7C1huNCJzn5zFWIok/1IBnbjmrBkl/8dqG
 o9joZEAd3QE3wWbTLX6hTOPYZonezb37E29NHO6i2scV74mnv7jXn2ZcH6KNIC1dO/XM
 U8jxK1riiwG/xz9+MV+v+9nARcIK924m0YvtS/IIGJp1mZIq8sAJ3cTPQ5aNDdKVuEkO
 DK9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/yDO7++Z+HrE8q9Tl4I5SBZlbbqQD8rc7Y6ufd3IgGQ=;
 b=EpFdn84AwLMksDd9Ba0/VDev6Wd9s+3Yf1Y+a4p+PIbDpuMOIWuiyRJ23+bgGE5sLC
 9XXT/bUJN0KBW1k8Pbi27rIF9XZTs4NrENSJvCAKlx/f5hIescleZEGxgO05rbrs68dx
 LXsIytU6vB8LTv6645TaW2TFWzl718edM6raY4ewo0ipZvIDUHspQOUqGCc/18xVVYG0
 wqoNzuS0vOKN83NsSFTnbCx3PW/pVxgRq+sG2m361LiRaJZFugAplUSqfmfyPTZ0/Tka
 F7AoohsSnIw6qv0vteLb+IPP9S6xtb4Kbo93T8yzvNfnzt18iHSi5trjnGe3X426rOt3
 RisA==
X-Gm-Message-State: AOAM5311CCqGvt+MZCR8q49t3ttKan+wIVaz7G+H2zijup7JeRmRj5vY
 L5tM2REo9oj1u99r5WqZoOD0axK0YJ98Ew==
X-Google-Smtp-Source: ABdhPJyVuWWoo9C94EdUKTkHhotRI6jLsXIwPsSV+qCeUoVjwhhm26290Qv390tO2DqnT0r2NJxCdQ==
X-Received: by 2002:a05:600c:1d08:b0:393:ef4f:c267 with SMTP id
 l8-20020a05600c1d0800b00393ef4fc267mr16279128wms.103.1651156811825; 
 Thu, 28 Apr 2022 07:40:11 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bh26-20020a05600c3d1a00b003928db85759sm130221wmb.15.2022.04.28.07.40.10
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Apr 2022 07:40:11 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 09/54] target/arm: Use tcg_constant in disas_ld_lit
Date: Thu, 28 Apr 2022 15:39:13 +0100
Message-Id: <20220428143958.2451229-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220428143958.2451229-1-peter.maydell@linaro.org>
References: <20220428143958.2451229-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
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
Message-id: 20220426163043.100432-10-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-a64.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index af6844b4b60..1caca38a798 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -2778,7 +2778,7 @@ static void disas_ld_lit(DisasContext *s, uint32_t insn)
 
     tcg_rt = cpu_reg(s, rt);
 
-    clean_addr = tcg_const_i64(s->pc_curr + imm);
+    clean_addr = tcg_constant_i64(s->pc_curr + imm);
     if (is_vector) {
         do_fp_ld(s, rt, clean_addr, size);
     } else {
@@ -2788,7 +2788,6 @@ static void disas_ld_lit(DisasContext *s, uint32_t insn)
         do_gpr_ld(s, tcg_rt, clean_addr, size + is_signed * MO_SIGN,
                   false, true, rt, iss_sf, false);
     }
-    tcg_temp_free_i64(clean_addr);
 }
 
 /*
-- 
2.25.1


