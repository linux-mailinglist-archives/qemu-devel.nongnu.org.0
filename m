Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7149B513902
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 17:48:57 +0200 (CEST)
Received: from localhost ([::1]:56856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk6O0-0006MM-He
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 11:48:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk5K4-0005dS-W9
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 10:40:50 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:42752)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk5K3-0006VA-DD
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 10:40:48 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 n126-20020a1c2784000000b0038e8af3e788so3152045wmn.1
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 07:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Izmv02AEuunVtOpjJUm1/YuhI2UgDXNvJpCjfoRnjVA=;
 b=hGibfx6Z9FuIceKWpH5x9wULzAe+PeQHYUodqf1VKIgjg/C5WU043D4AAxXhe6A4dA
 m7k18NsB6USbMcxts7WdU3whlDrg4sXp93Lkfxw90v/BA4oYphmA7Rqj1U7KCMMwmSwO
 RGKRYs7tzYdjJiN4RFFcv/lUYjPHI8VzKpVFf1SPu10nxcdtiTAHwqve++KAjIZ51d1q
 uToOFlUfDz23elJjyIedBx9w590HrN1Kul7lAiRyr8rhoj2IB68sDFJpnsI4wsetkyyG
 5PxhuUeWgVOciSxA4+ThO6MUKoUHbelXoQ5sa6lFGxxOinZNcS0gGAySWGlAz00ByBrK
 nHgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Izmv02AEuunVtOpjJUm1/YuhI2UgDXNvJpCjfoRnjVA=;
 b=l0of3EM6Eao1+h3pcqAT+uL3YrG6Og1wF9yRhiM5d8QLb67a/AtCJkdxnDtb9b6S8a
 qH0RITUVb6ZE9cVtyaElkj5zgPeePUS7yQ/Js5dpjH3aOJIDaC7+9mSRPKm8XVGkWVcs
 XssWQhpNkwLnsikOCNAf2BT0gJkbSWHpJi2+KZ30RgtwCYaeOkUQatz/AF2ervJ/TsJX
 RbXURqcRsr5jlHZEo1BC1ZIF0Cpc0OE2ecgTJ6Ubzt1Rw0KOvDWiFa1vwGcUnXwG5cLF
 fMF+Y6eX9LBjUx6978TVSH5Xk3jt7tGT8KB5CwD5zy9njPYJvOFAub+Xlt+mLkOu9n0x
 5Iuw==
X-Gm-Message-State: AOAM531MOaAw41ZWH8i+KwSGMNEdPR4LC9dMoYh1JL0UcdySpls+cbwb
 2EcMB+VBgKEZnsWLpQc6+hCLFBAJNzc81A==
X-Google-Smtp-Source: ABdhPJz7M/wQlpVJoIZffH0/hcKJOvHVWKXwSZuyNHIE4AVKS26beeSO7FkWP800/xfFPhcmM8Tg3Q==
X-Received: by 2002:a05:600c:3b27:b0:393:ee55:5682 with SMTP id
 m39-20020a05600c3b2700b00393ee555682mr17099090wms.3.1651156846017; 
 Thu, 28 Apr 2022 07:40:46 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bh26-20020a05600c3d1a00b003928db85759sm130221wmb.15.2022.04.28.07.40.45
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Apr 2022 07:40:45 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 48/54] target/arm: Disable cryptographic instructions when neon
 is disabled
Date: Thu, 28 Apr 2022 15:39:52 +0100
Message-Id: <20220428143958.2451229-49-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220428143958.2451229-1-peter.maydell@linaro.org>
References: <20220428143958.2451229-1-peter.maydell@linaro.org>
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

From: Damien Hedde <damien.hedde@greensocs.com>

As of now, cryptographic instructions ISAR fields are never cleared so
we can end up with a cpu with cryptographic instructions but no
floating-point/neon instructions which is not a possible configuration
according to Arm specifications.

In QEMU, we have 3 kinds of cpus regarding cryptographic instructions:
+ no support
+ cortex-a57/a72: cryptographic extension is optional,
  floating-point/neon is not.
+ cortex-a53: crytographic extension is optional as well as
  floating-point/neon. But cryptographic requires
  floating-point/neon support.

Therefore we can safely clear the ISAR fields when neon is disabled.

Note that other Arm cpus seem to follow this. For example cortex-a55 is
like cortex-a53 and cortex-a76/cortex-a710 are like cortex-a57/a72.

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220427090117.6954-1-damien.hedde@greensocs.com
[PMM: fixed commit message typos]
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index e3f82152035..e46a766d770 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1587,6 +1587,12 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
         unset_feature(env, ARM_FEATURE_NEON);
 
         t = cpu->isar.id_aa64isar0;
+        t = FIELD_DP64(t, ID_AA64ISAR0, AES, 0);
+        t = FIELD_DP64(t, ID_AA64ISAR0, SHA1, 0);
+        t = FIELD_DP64(t, ID_AA64ISAR0, SHA2, 0);
+        t = FIELD_DP64(t, ID_AA64ISAR0, SHA3, 0);
+        t = FIELD_DP64(t, ID_AA64ISAR0, SM3, 0);
+        t = FIELD_DP64(t, ID_AA64ISAR0, SM4, 0);
         t = FIELD_DP64(t, ID_AA64ISAR0, DP, 0);
         cpu->isar.id_aa64isar0 = t;
 
@@ -1601,6 +1607,9 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
         cpu->isar.id_aa64pfr0 = t;
 
         u = cpu->isar.id_isar5;
+        u = FIELD_DP32(u, ID_ISAR5, AES, 0);
+        u = FIELD_DP32(u, ID_ISAR5, SHA1, 0);
+        u = FIELD_DP32(u, ID_ISAR5, SHA2, 0);
         u = FIELD_DP32(u, ID_ISAR5, RDM, 0);
         u = FIELD_DP32(u, ID_ISAR5, VCMA, 0);
         cpu->isar.id_isar5 = u;
-- 
2.25.1


