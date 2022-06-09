Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3C8554474C
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 11:24:19 +0200 (CEST)
Received: from localhost ([::1]:37042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzEOo-0002mf-MM
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 05:24:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzE6t-0001OL-KI
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 05:05:48 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:46807)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzE6q-0005v7-J9
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 05:05:47 -0400
Received: by mail-wr1-x429.google.com with SMTP id u8so27137454wrm.13
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 02:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=n6D/t27wwLVN4prcAZRU1vm1AJNkQw3wnfuM1H0pUck=;
 b=h5Hwx/K2RSxhAEALBLGhe9sLO7nb48J383r2uyz/pSSfGhvp7FgZZnakzY+n7A7xEp
 U1x5Z/uuRLLBhDjZ5cbfP3P8Kmu2JlTx66BBe/Uy4R92F0tIK/SMms+15yrBnPe9dcBI
 PFV6B8lvXrMBjocMsh4KceBi06mCS86XLB8doY43a5Yt6dlyTQadknLB/2uQhHXMTQng
 O7v2LAwv4IIK3uALE/YpdXQW9JyV5050/PyrNPQgp1U2fCt6fyQcBcE79WSKAEsQw34Y
 vSyERkpyerYei2/mjJRFYpofejufXwfcSjOntAg9zsATD6shNrkkkTvSzhnoz9Ha7g1q
 cn7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=n6D/t27wwLVN4prcAZRU1vm1AJNkQw3wnfuM1H0pUck=;
 b=JZh8kCIyPhSXCtVr4Jp36qBn2xIFUH3PPURa7zSbGgjU1tvxrdicZ7VL7nHJMZ+2fN
 gp/Dm8r3PwhVy/kicXNG/P1Ak085GZ21Hfes3s71L/UNP8TOtmj0nANoTM2aOGy7Lzo2
 NxS7VemyL0kf+hTbnprflpz70mOVpOqqX6/Ydr+U90hmmEwEAo3dpeELhEdXSWM5vRIO
 dxl0ZWxyhB4IsBw6w9w6LdcpJNpKvb8zx6QU//70oAHiqQxYv8kWKyGLL5tJsDRww4lw
 JiMRvgQbhahJgOuU5XH68eIo+7mZYtIEIuRs25hVECq4POTZrWkQQltBUQ9aDNQLb0Rs
 rc4A==
X-Gm-Message-State: AOAM533L4oTfDsV3BIS3jCkoj5Pi5J9bBycJMahcKJwbqSWmXmsynHFE
 uwhGz5qC4ZMDXj0Xqw5J9WihMfXI17F02Q==
X-Google-Smtp-Source: ABdhPJz541PpLudOFm4JUSnMHYwZDslojfnzgjk3sF+xmhsER1uO6SbRR4YzGSyYzJmDlMPDQ3Jluw==
X-Received: by 2002:a5d:4290:0:b0:213:badd:abc5 with SMTP id
 k16-20020a5d4290000000b00213baddabc5mr32113648wrq.54.1654765541512; 
 Thu, 09 Jun 2022 02:05:41 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 c13-20020adffb0d000000b002183cf9cd69sm11349796wrr.15.2022.06.09.02.05.40
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 02:05:41 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 01/55] target/arm: Declare support for FEAT_RASv1p1
Date: Thu,  9 Jun 2022 10:04:43 +0100
Message-Id: <20220609090537.1971756-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220609090537.1971756-1-peter.maydell@linaro.org>
References: <20220609090537.1971756-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
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

The architectural feature RASv1p1 introduces the following new
features:
 * new registers ERXPFGCDN_EL1, ERXPFGCTL_EL1 and ERXPFGF_EL1
 * new bits in the fine-grained trap registers that control traps
   for these new registers
 * new trap bits HCR_EL2.FIEN and SCR_EL3.FIEN that control traps
   for ERXPFGCDN_EL1, ERXPFGCTL_EL1, ERXPFGP_EL1
 * a larger number of the ERXMISC<n>_EL1 registers
 * the format of ERR<n>STATUS registers changes

The architecture permits that if ERRIDR_EL1.NUM is 0 (as it is for
QEMU) then all these new registers may UNDEF, and the HCR_EL2.FIEN
and SCR_EL3.FIEN bits may be RES0.  We don't have any ERR<n>STATUS
registers (again, because ERRIDR_EL1.NUM is 0).  QEMU does not yet
implement the fine-grained-trap extension.  So there is nothing we
need to implement to be compliant with the feature spec.  Make the
'max' CPU report the feature in its ID registers, and document it.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220531114258.855804-1-peter.maydell@linaro.org
---
 docs/system/arm/emulation.rst | 1 +
 target/arm/cpu64.c            | 1 +
 2 files changed, 2 insertions(+)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index 49cc3e8340e..81467f02ce9 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -52,6 +52,7 @@ the following architecture extensions:
 - FEAT_PMUv3p1 (PMU Extensions v3.1)
 - FEAT_PMUv3p4 (PMU Extensions v3.4)
 - FEAT_RAS (Reliability, availability, and serviceability)
+- FEAT_RASv1p1 (RAS Extension v1.1)
 - FEAT_RDM (Advanced SIMD rounding double multiply accumulate instructions)
 - FEAT_RNG (Random number generator)
 - FEAT_S2FWB (Stage 2 forced Write-Back)
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 3ff9219ca3b..bd1c62a3428 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -916,6 +916,7 @@ static void aarch64_max_initfn(Object *obj)
      * we do for EL2 with the virtualization=on property.
      */
     t = FIELD_DP64(t, ID_AA64PFR1, MTE, 3);       /* FEAT_MTE3 */
+    t = FIELD_DP64(t, ID_AA64PFR1, RAS_FRAC, 1);  /* FEAT_RASv1p1 */
     t = FIELD_DP64(t, ID_AA64PFR1, CSV2_FRAC, 0); /* FEAT_CSV2_2 */
     cpu->isar.id_aa64pfr1 = t;
 
-- 
2.25.1


