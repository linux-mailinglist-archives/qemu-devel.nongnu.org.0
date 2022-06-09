Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E81D544AF0
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 13:48:00 +0200 (CEST)
Received: from localhost ([::1]:36128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzGdr-0000Na-31
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 07:47:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzE7W-0001cl-Q9
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 05:06:28 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:53919)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzE7V-00067I-Ao
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 05:06:26 -0400
Received: by mail-wm1-x331.google.com with SMTP id z9so5330339wmf.3
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 02:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=lq+u7f2f7YE5vmdKlLixcNnaKlj2/xU4nnWKz5bhpYE=;
 b=MUrD7RXva30XHSMxqFTV9lc8x1KlHVijSZRf+PibyhYch/MRfG/ERrlbrAMa5K7Lbi
 Zh0hCq8gpwkTmWCCAEoIwIa/YBKI+MJsBSdTRikbaHwPDzOHrSci16Y27NIGCezsFy17
 1lDwisM/ONvYtEi0W+U6a4Y2FxskNC1W5x5DaHm1u1AFO3WSeqjYNxIjWoWulRmdwoXc
 U7axr4SlRTm0QDriWRDmArFhMgsXjN5hCxhyIatTPpERVJo68ecmxRtH373ThXDxLM/+
 xS6UMNisK67Tsm07sZkl+t5muA0hOT2q8Y9L9oRDBEcCsr1ngmMVPZbIj6k4D0+2RSB+
 BgVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lq+u7f2f7YE5vmdKlLixcNnaKlj2/xU4nnWKz5bhpYE=;
 b=1Gneaqf0TGKtLDPRQIEPtsTrtedTTu6DjzUILgmn8QsQix8vg/kgNqnnMFJQ29H9/W
 1vjD54e2jovsTiKfbLcuQzP2chLBFIqmL56VAzMiPqLyjQI86bqGW/s6wM29H7zmRkru
 +cU4KNpnS6CXOYY92dTI8I2XrwCuqU3bqvrVryR04RGLYbiurPOrdTNW5DrxidhiuvDW
 QsVoiy5JxFZzrd2Jlc/6Btd8SvqeHjvQcKILHhR6dGM46BLy5l4XBg5iHx6NPrRtnjd/
 JNCLVAtgGTVNpiI8HhPywjbyv7tLyT8ZWPaBQPnf+/LzJEccRhGsQ9ZkMBK1KVFZCSL7
 AWVQ==
X-Gm-Message-State: AOAM530gua54tczfeA2qlyqeoH9hSSzm7uPt5EN+Ru2IqpP1IUjcRY43
 TO5/5dZm1KcAbgrYVpO+JfvH1iGY82n3aQ==
X-Google-Smtp-Source: ABdhPJxQ17r9VyzK3KbQyjLZWjSci/tpSPqH0J+HQXEcG3gDFo+qef0lJRGFgwkiR1CGoz6NRwCsNQ==
X-Received: by 2002:a05:600c:a42:b0:393:d831:bf05 with SMTP id
 c2-20020a05600c0a4200b00393d831bf05mr2190206wmq.187.1654765583991; 
 Thu, 09 Jun 2022 02:06:23 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 c13-20020adffb0d000000b002183cf9cd69sm11349796wrr.15.2022.06.09.02.06.23
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 02:06:23 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 41/55] target/arm: Use el_is_in_host for sve_zcr_len_for_el
Date: Thu,  9 Jun 2022 10:05:23 +0100
Message-Id: <20220609090537.1971756-42-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220609090537.1971756-1-peter.maydell@linaro.org>
References: <20220609090537.1971756-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
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

The ARM pseudocode function NVL uses this predicate now,
and I think it's a bit clearer.  Simplify the pseudocode
condition by noting that IsInHost is always false for EL1.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220607203306.657998-7-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 322508170e3..6b17c0f507f 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6238,8 +6238,7 @@ uint32_t sve_zcr_len_for_el(CPUARMState *env, int el)
     ARMCPU *cpu = env_archcpu(env);
     uint32_t zcr_len = cpu->sve_max_vq - 1;
 
-    if (el <= 1 &&
-        (arm_hcr_el2_eff(env) & (HCR_E2H | HCR_TGE)) != (HCR_E2H | HCR_TGE)) {
+    if (el <= 1 && !el_is_in_host(env, el)) {
         zcr_len = MIN(zcr_len, 0xf & (uint32_t)env->vfp.zcr_el[1]);
     }
     if (el <= 2 && arm_feature(env, ARM_FEATURE_EL2)) {
-- 
2.25.1


