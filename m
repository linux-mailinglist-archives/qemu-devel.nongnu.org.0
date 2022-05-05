Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B37D51BD18
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 12:23:51 +0200 (CEST)
Received: from localhost ([::1]:56106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmYeE-0002mt-G0
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 06:23:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nmXWv-0005La-As
 for qemu-devel@nongnu.org; Thu, 05 May 2022 05:12:14 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:36599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nmXWt-0003P1-2N
 for qemu-devel@nongnu.org; Thu, 05 May 2022 05:12:12 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 a14-20020a7bc1ce000000b00393fb52a386so4711953wmj.1
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 02:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=EWdjm92nfPShmGSJgJfifu3iePdWQS75dHEQNsXsTtM=;
 b=SLS4Rgfy/P4dsfCSzI7yfxhDWCzxpVEd/vO9FzzP6NklYY4Px+AnACbc4HGuY0VoVO
 HIyHFzKcRo3sGhsRJWB0deo+0WLYdRa1KZ+/gW8mJxiUvABMIWhiazirjLM/IrqQClkK
 aqqoCpoN9lJTbDA5r+KonFHepmDgrEv/7HzwRoRqL+GHAMaZq41u51r0uVqjfElvjEO/
 VDkSkO8cFdrIZ0vDLn9CSIPwLP+19rlYQryz2e5yM/5+JKpyXgUORR04afMcLOGfI+9B
 IIdfqWNDRRdH/XUnff7BaWhe3I/wsfsEM5COScwlyq2VVSdLN2RcTKkzb94PMFUWE0TN
 vcvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EWdjm92nfPShmGSJgJfifu3iePdWQS75dHEQNsXsTtM=;
 b=YaUXGGMRXfe548PMKreL/SL15zG2oWrkqaVK1xnd2pq8ewYxrjgxp204OuNP4TW061
 wv5CWHSQU4fhL2IU/MBO39M1Kmq3uz0q5oc/HKyufW26G2AtNnn0aW+TZ50FmEt8fDnX
 DZnzmRSp8yKGnest8Yr0BBh8tbEw4q3HUwwniv/PHhGvY0a02Y7EvK3XmkTKyycEwXvu
 kiiwOefC/C5UX9ymZfJSBgBQd8n9BhIzGNo+YTz/V+WZqP23lm7vRdq2jbCDToO4Hzbl
 wyRSArzRKBnivdzx8axS21Dmbga/WXioEc1afTFFnwvGVJw2Sij5ZHIY7gCOQrk0VIHO
 dBRg==
X-Gm-Message-State: AOAM5329sRgLUJ7+CUW1SiGK+UTV3KTwMZIqN7FUgw+Xp4pza1sH9IUF
 e0U8ySMC6/uBx0ZuuH64PK3Se4sMdCiOSQ==
X-Google-Smtp-Source: ABdhPJy2+gmkchV44nfTRxA0/AxFsdY+jmphqOIrKKEyFzOEZuxqqYjSxgJCAufsq+5dvnZLmVSGPA==
X-Received: by 2002:a05:600c:4f94:b0:394:6dec:7392 with SMTP id
 n20-20020a05600c4f9400b003946dec7392mr692040wmq.149.1651741929556; 
 Thu, 05 May 2022 02:12:09 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 j14-20020adfe50e000000b0020c6a524fd5sm841612wrm.99.2022.05.05.02.12.08
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 02:12:09 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 22/23] target/arm: Add isar_feature_{aa64,any}_ras
Date: Thu,  5 May 2022 10:11:46 +0100
Message-Id: <20220505091147.2657652-23-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220505091147.2657652-1-peter.maydell@linaro.org>
References: <20220505091147.2657652-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
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

Add the aa64 predicate for detecting RAS support from id registers.
We already have the aa32 version from the M-profile work.
Add the 'any' predicate for testing both aa64 and aa32.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220501055028.646596-34-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 7303103016f..ca01f909a86 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3886,6 +3886,11 @@ static inline bool isar_feature_aa64_aa32_el1(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64pfr0, ID_AA64PFR0, EL1) >= 2;
 }
 
+static inline bool isar_feature_aa64_ras(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64pfr0, ID_AA64PFR0, RAS) != 0;
+}
+
 static inline bool isar_feature_aa64_sve(const ARMISARegisters *id)
 {
     return FIELD_EX64(id->id_aa64pfr0, ID_AA64PFR0, SVE) != 0;
@@ -4108,6 +4113,11 @@ static inline bool isar_feature_any_debugv8p2(const ARMISARegisters *id)
     return isar_feature_aa64_debugv8p2(id) || isar_feature_aa32_debugv8p2(id);
 }
 
+static inline bool isar_feature_any_ras(const ARMISARegisters *id)
+{
+    return isar_feature_aa64_ras(id) || isar_feature_aa32_ras(id);
+}
+
 /*
  * Forward to the above feature tests given an ARMCPU pointer.
  */
-- 
2.25.1


