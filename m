Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7415C3DD515
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 14:03:36 +0200 (CEST)
Received: from localhost ([::1]:53060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAWfP-0000Cd-At
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 08:03:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mAWaI-0000IX-K3
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 07:58:18 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:42933)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mAWaG-0003Xp-RP
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 07:58:18 -0400
Received: by mail-wr1-x436.google.com with SMTP id j2so21113918wrx.9
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 04:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=g8zSSxlwwOd/Ei3jqIbJDyuDbX9lwwum1BX0g/f66Ws=;
 b=w4ckBxSL38q5M7FgtkHo1Xf8+iOz4rzLnkMcRNRcJJzYUs5LZpUaCDwFEYT4JGR0Bx
 6RXasL/i8EqXL8xvFNxRXW5aFpJU2H6TWkIpFuLyv7TvBOF2eKcRVkmGOMmPxA8NDkdU
 ZnGmLSW5mYC8mfuCdIzep8vYrZHdCZdXYAs2Dw/if5WIIezXSkbkvnsM63x8Pg0Kdveo
 4/+LuZQFpGAr+sVaNJaT/sNwVnXtC3ufcWNezZVLwgLnUSDFE3+yTGGjlKhnnfvBVPMN
 g3oZ9asprnl0YUk9NPwEdVzPAtWVGjEGa46s2aO2186ayzzIH4s8GlLPIaIMn25KNM+2
 KOrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=g8zSSxlwwOd/Ei3jqIbJDyuDbX9lwwum1BX0g/f66Ws=;
 b=iKB/Ci5ta9T+wRMzDb7+HlHC9q6KDkiQlFS7FHES61oHjUnrwnnO2vP6U37XgIgoSN
 6N7ti8DBlguY7JQaEVqYmmXzCnSgT1ppGhYXQt7GepNmBHKmMEZrSqMg+l4hkHxoSSAf
 vFK1tnetnMpm2ZfMmFUMkONb6j3M3iRGVH/0tSnasHdY7e1u/gnBDbqTnXF4nH9MSi3f
 3ACNAEYQssdk+0np5MBG7BTqSKBN+uH7JhZObdJ16GLlV/iEnajSHp0FyEDkjVXRqW8J
 YKwdGrQNbk+RubmqZMimvHHNXor7piZaUT11KEaNbQADGA1nir+KuJKCNUdRGERtbUdx
 HyZg==
X-Gm-Message-State: AOAM5334ayJ6LHD5jqq7hmfcPRyAfGWuQ3uxJPvkviCw9fMhAIAcMirc
 3XTSJ6FF0frNm3dnU/JqvcoSCIAZRr8U5g==
X-Google-Smtp-Source: ABdhPJxZz1eagYWXKVfziPriwOaXcO5WvxRBdsf15fKHRMACNQl+f/iH4FFRAgHatmqpdZFJBOpsRA==
X-Received: by 2002:adf:d1e4:: with SMTP id g4mr3833593wrd.371.1627905495252; 
 Mon, 02 Aug 2021 04:58:15 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y66sm10102772wmy.39.2021.08.02.04.58.14
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Aug 2021 04:58:14 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 02/21] docs: Add documentation of Arm 'kzm' board
Date: Mon,  2 Aug 2021 12:57:53 +0100
Message-Id: <20210802115812.10731-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210802115812.10731-1-peter.maydell@linaro.org>
References: <20210802115812.10731-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

Add brief documentation of the Arm 'kzm' board.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210722175229.29065-3-peter.maydell@linaro.org
---
 docs/system/arm/kzm.rst    | 18 ++++++++++++++++++
 docs/system/target-arm.rst |  1 +
 MAINTAINERS                |  1 +
 3 files changed, 20 insertions(+)
 create mode 100644 docs/system/arm/kzm.rst

diff --git a/docs/system/arm/kzm.rst b/docs/system/arm/kzm.rst
new file mode 100644
index 00000000000..bb018fbdf7c
--- /dev/null
+++ b/docs/system/arm/kzm.rst
@@ -0,0 +1,18 @@
+Kyoto Microcomputer KZM-ARM11-01 (``kzm``)
+==========================================
+
+The ``kzm`` board emulates the Kyoto Microcomputer KZM-ARM11-01
+evaluation board, which is based on an NXP i.MX32 SoC
+which uses an ARM1136 CPU.
+
+Emulated devices:
+
+- UARTs
+- LAN9118 ethernet
+- AVIC
+- CCM
+- GPT
+- EPIT timers
+- I2C
+- GPIO controllers
+- Watchdog timer
diff --git a/docs/system/target-arm.rst b/docs/system/target-arm.rst
index ad3f5f435d6..d423782d661 100644
--- a/docs/system/target-arm.rst
+++ b/docs/system/target-arm.rst
@@ -91,6 +91,7 @@ undocumented; you can get a complete list by running
    arm/musicpal
    arm/gumstix
    arm/mainstone
+   arm/kzm
    arm/nrf
    arm/nseries
    arm/nuvoton
diff --git a/MAINTAINERS b/MAINTAINERS
index 24e0819bf8c..6c558303f96 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -694,6 +694,7 @@ F: hw/*/imx_*
 F: hw/*/*imx31*
 F: include/hw/*/imx_*
 F: include/hw/*/*imx31*
+F: docs/system/arm/kzm.rst
 
 Integrator CP
 M: Peter Maydell <peter.maydell@linaro.org>
-- 
2.20.1


