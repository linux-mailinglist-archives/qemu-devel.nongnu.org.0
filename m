Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E97E252DC3C
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 20:02:36 +0200 (CEST)
Received: from localhost ([::1]:55914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrkTr-0006gk-N3
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 14:02:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nrk5I-0006P5-I2
 for qemu-devel@nongnu.org; Thu, 19 May 2022 13:37:12 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:45798)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nrk5G-0000pu-VZ
 for qemu-devel@nongnu.org; Thu, 19 May 2022 13:37:12 -0400
Received: by mail-wr1-x436.google.com with SMTP id w4so8171222wrg.12
 for <qemu-devel@nongnu.org>; Thu, 19 May 2022 10:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=/SFdrSIM/EziSOFrstL4HBRSxmArkb6gryNdykc1oLA=;
 b=NA2ej8et+eM7pEvuy3KrPnj0UOOoF/GKqq1hQ8fMIs5xhWFWYm+3QcJKmfIuRwNjaP
 9GXK/0Ho/6CuBR70+mqbELrTdm2/SPig2kzu1EsbN4Vc2BfBgGFhYOjDjExcDte+1YBH
 rTD0qDhxWIW/K6pv/PRJogvrf5uGGbMBqWRO80Hh5gvDrM1EwUBGqKT6eN0nCM3iltOz
 YRv4C0u/4FRAex1t4seEx3+I+PXcz/QUcbk+Webnf9QQgVssDQ2ACI+kp7a8g0QUTWVl
 aCYPUVp1jnYRJ3Ku/OAzQNeJdGMGnSWSVMV2XY2BVeiMOEhvaPdPbEOWh0wmPVmyf7YA
 69bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/SFdrSIM/EziSOFrstL4HBRSxmArkb6gryNdykc1oLA=;
 b=YMD6PxHDxbMTGU2bmnF6Q+mLfbIu9nTwfOHSjHsk3qhhXpxzgji7jezg8nyFBamtJX
 wZ5hqTu4ZhiZwkSkiESjqQ6lwMfiMZG4lA15l909GvrFg97pu3nvNf2muMgJjVHTB2R1
 J7GTIFVnsK50FpBemQrlIj6TYhS9QydprXeyzM81u5m5XbFpWv3m07zfgyKxtb38O22Q
 846MjCgkv8ne9d8r0VTtJH8kMTuz8zJq0nc0d8KHWGy1yONvcUDgLiI/Gn2Ivdw6bhzi
 djZHR2911742V/hK9muKZ7tatw9zRWXoFKOb2MDTr1q4yUA8sZJGy2JEjO4hU4gECZP9
 FFYw==
X-Gm-Message-State: AOAM530+RItMAn34iPwd3SgvubIlQ3p7Jw8xWU2BL2zMd8gFqhM8Au5B
 R0gct4t3poAq0z5utqmelaCUKJ7bOqNpcg==
X-Google-Smtp-Source: ABdhPJwkr8u0XHfKQ1LTZ7VBpg7ENB+Swf+H/o1Vy+0HwBkbHUX5F3i8gSH9IUf58PV3prUG6XJBZQ==
X-Received: by 2002:adf:f9c7:0:b0:20d:1297:d909 with SMTP id
 w7-20020adff9c7000000b0020d1297d909mr5028075wrr.191.1652981830256; 
 Thu, 19 May 2022 10:37:10 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 e2-20020adfa742000000b0020c5253d8f2sm180183wrd.62.2022.05.19.10.37.09
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 May 2022 10:37:09 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 20/22] target/arm: Fix PAuth keys access checks for disabled
 SEL2
Date: Thu, 19 May 2022 18:36:49 +0100
Message-Id: <20220519173651.399295-21-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220519173651.399295-1-peter.maydell@linaro.org>
References: <20220519173651.399295-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
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

From: Florian Lugou <florian.lugou@provenrun.com>

As per the description of the HCR_EL2.APK field in the ARMv8 ARM,
Pointer Authentication keys accesses should only be trapped to Secure
EL2 if it is enabled.

Signed-off-by: Florian Lugou <florian.lugou@provenrun.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220517145242.1215271-1-florian.lugou@provenrun.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index aa7a8e05721..fdd51e5e754 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6768,7 +6768,7 @@ static CPAccessResult access_pauth(CPUARMState *env, const ARMCPRegInfo *ri,
     int el = arm_current_el(env);
 
     if (el < 2 &&
-        arm_feature(env, ARM_FEATURE_EL2) &&
+        arm_is_el2_enabled(env) &&
         !(arm_hcr_el2_eff(env) & HCR_APK)) {
         return CP_ACCESS_TRAP_EL2;
     }
-- 
2.25.1


