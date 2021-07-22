Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E3103D2B8E
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 19:56:45 +0200 (CEST)
Received: from localhost ([::1]:38964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6cw8-0005wT-BB
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 13:56:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m6cs9-0004N1-KV
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 13:52:37 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:40859)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m6cs6-00020S-Qb
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 13:52:37 -0400
Received: by mail-wr1-x435.google.com with SMTP id l7so6823395wrv.7
 for <qemu-devel@nongnu.org>; Thu, 22 Jul 2021 10:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8+GjQHA/86gBeSic8mJVE0mbJv/WFN9BdhNr+zuh/Q4=;
 b=gLEy3TZh8jWPkcj6IlbdYyL1XSiY4rPI9fvEmitTJBjdEI+p59wHagVforq4WBwBdB
 y/TOI1HCvfCNYyL/mirOhy6BIALcoOfV4p5TEYirecQlEzASN6T0Frs7WfVLx3huPQnw
 mF4oS374kBJ49CzCBbJqsZcGWL3gKLkephanVMGdt7nLxfG2u+H1hmOEVm5YI6i4zymQ
 xxzCyimf6r1wFZ8stMaXFrSGPhM5WbV7CApB8rUSADBeTzLy8bmQ8pi1D/rZz5+/MgmN
 uMb7SK/FUHhCW08hQYYu+yYwHBIpx0LIPHOTthvAKpdQQAMgAZNf5zvJ3F7KJwMPrTnT
 IPPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8+GjQHA/86gBeSic8mJVE0mbJv/WFN9BdhNr+zuh/Q4=;
 b=Cy2YETQTLcavZPSNBRalrdoyx00GqaBcUWWM6s7IKvVQ9jNzULMZq2T/TMKG3xH2QK
 dJe8pZWXZKB4mfulPd7o6Nu0C97ReUYfJx9iYYNXKMRWL3t31XuHSJd8qafA7/AVUfrR
 A1cHye7GDbczEEVo3t5EeeKrOyZchpLuueHftuWpVxS1Q64ReSRu9z92kh79yqMGh/4r
 QOn7QymeL+y0FRrNZJKcdsCAohNSMO3su3Rji0/xbWhfoi4N+c9ifV7M+kNLMQGFAmRm
 nsNl8rSveh2vlTKLjf3uiAV6+y6V/uPHZcxVkci0LYGb+04a1HuZPo2m7iVqgp2mHyYA
 xZ+A==
X-Gm-Message-State: AOAM531aqmXgk9nHKi+b2sEy6QtAeAWrO18/ylXg18aEBarikRj5LkRW
 HfNOR3OhUAFJvz/kR2MacSW60U2z66sqSg==
X-Google-Smtp-Source: ABdhPJw20ArGxabtECehwPBfdpoo1d7bdD0AKGCvBuZpKfk0qTU8HaiC26Bnyqyfr/rarsMmY0ezwQ==
X-Received: by 2002:adf:e7c6:: with SMTP id e6mr1125245wrn.221.1626976353110; 
 Thu, 22 Jul 2021 10:52:33 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id s13sm30278651wrm.13.2021.07.22.10.52.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jul 2021 10:52:32 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.1 2/3] docs: Add documentation of Arm 'kzm' board
Date: Thu, 22 Jul 2021 18:52:28 +0100
Message-Id: <20210722175229.29065-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210722175229.29065-1-peter.maydell@linaro.org>
References: <20210722175229.29065-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
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
Cc: Jean-Christophe Dubois <jcd@tribudubois.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add brief documentation of the Arm 'kzm' board.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
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
index 47ddcbb7f7a..063d8e07b75 100644
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


