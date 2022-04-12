Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD2FC4FC952
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Apr 2022 02:37:43 +0200 (CEST)
Received: from localhost ([::1]:49206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ne4XO-0005fu-U8
	for lists+qemu-devel@lfdr.de; Mon, 11 Apr 2022 20:37:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ne4TN-0001lP-Au
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 20:33:33 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:32909)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ne4TK-0001mo-S7
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 20:33:33 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 c12-20020a17090a020c00b001cba1ebb20cso1031795pjc.0
 for <qemu-devel@nongnu.org>; Mon, 11 Apr 2022 17:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8LKd5xer8JR43EOzT8A6TIM6/wBkWmSgb2MVfgNp/iw=;
 b=gEQGcbUElZz9OapHxbkCbJRjeJvhz40YepkrbttzkiswK7OBGMooHoX3BZw0U/N1EY
 7BZnnQ1d5b2rd4qAT+tzq11C8619MCX6XStq1KyfkowrhRLTai1k/9ZkXCW7zuxCpD93
 r0wBsjT9XalOwfUoyN5kvEpvCk6zZtjgd62A8Il5JHoyzZ1sTOekRvJ5hvdEqRSMZGQ4
 70E+7ybWr8lIhpN4lKzOhrGVvtdLNH8R1w0p69MCshQpO1xFZWBqwMNjpKwQe39xeAan
 MFTsgH9faaqtXW1xEy2Hhg8GiU5lqQE2qAj/g+msC5UCJjDvU5sCQNDQgsBNHwTvv+dp
 /UWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8LKd5xer8JR43EOzT8A6TIM6/wBkWmSgb2MVfgNp/iw=;
 b=LDZ74D4Dz/q3NLDt9dlYUR44wT2JqSyDnaQdpWYUounlDs1iKR9PyGCIjdvfJEMEVm
 lGSH3eSnApr9rwA0w8DI9s2Vf0JaT19In7/dFaWsyA3Tv6vL6T0j4ZHVRsj8koVK7ogn
 4g7LcLttGGk2U+Wxz9pkEB9VHFt5UNFNnrZ6CGkWXJck2UKNSCGH9n5ia9+iO01KHxVa
 Je9/kXajpFCduoGVNwlkOsTWU4cFhPZD+A3hVLTVjcJSHb8/srNlr49o/myAB5LndfWY
 DT1/04CeflIQION31jT4YjUpmj8tXCmSHk2fP/mSVfDwJ+qEKzR/sufS00gDRWGPfwty
 +X2g==
X-Gm-Message-State: AOAM530izdIp6uKPjQLsb6M0mI47hcWHiLszupwuod/OXGhLepys2OrP
 E3reEU7J7aKhkta9acTY0QcuEZs+sVFwEg==
X-Google-Smtp-Source: ABdhPJxy/Em6R89v7KIOC7Hsi7BxZxBGPFFGVFQrELeZ03nYCaaO/95bsUdu+lE1SZ8TF6ooJCQoJQ==
X-Received: by 2002:a17:902:9b94:b0:156:2c08:14a5 with SMTP id
 y20-20020a1709029b9400b001562c0814a5mr34852711plp.60.1649723609523; 
 Mon, 11 Apr 2022 17:33:29 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 g15-20020a056a0023cf00b004e17e11cb17sm38346669pfc.111.2022.04.11.17.33.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Apr 2022 17:33:29 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 01/24] target/arm: Add isar predicates for FEAT_Debugv8p2
Date: Mon, 11 Apr 2022 17:33:03 -0700
Message-Id: <20220412003326.588530-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220412003326.588530-1-richard.henderson@linaro.org>
References: <20220412003326.588530-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 23879de5fa..9c456ff23a 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -4026,6 +4026,11 @@ static inline bool isar_feature_aa32_ssbs(const ARMISARegisters *id)
     return FIELD_EX32(id->id_pfr2, ID_PFR2, SSBS) != 0;
 }
 
+static inline bool isar_feature_aa32_debugv8p2(const ARMISARegisters *id)
+{
+    return FIELD_EX32(id->id_dfr0, ID_DFR0, COPDBG) >= 8;
+}
+
 /*
  * 64-bit feature tests via id registers.
  */
@@ -4332,6 +4337,11 @@ static inline bool isar_feature_aa64_ssbs(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64pfr1, ID_AA64PFR1, SSBS) != 0;
 }
 
+static inline bool isar_feature_aa64_debugv8p2(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64dfr0, ID_AA64DFR0, DEBUGVER) >= 8;
+}
+
 static inline bool isar_feature_aa64_sve2(const ARMISARegisters *id)
 {
     return FIELD_EX64(id->id_aa64zfr0, ID_AA64ZFR0, SVEVER) != 0;
@@ -4415,6 +4425,11 @@ static inline bool isar_feature_any_tts2uxn(const ARMISARegisters *id)
     return isar_feature_aa64_tts2uxn(id) || isar_feature_aa32_tts2uxn(id);
 }
 
+static inline bool isar_feature_any_debugv8p2(const ARMISARegisters *id)
+{
+    return isar_feature_aa64_debugv8p2(id) || isar_feature_aa32_debugv8p2(id);
+}
+
 /*
  * Forward to the above feature tests given an ARMCPU pointer.
  */
-- 
2.25.1


