Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B60293D2B84
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 19:54:26 +0200 (CEST)
Received: from localhost ([::1]:57426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6ctt-0007m7-Qn
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 13:54:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m6cs8-0004M4-DR
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 13:52:36 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:45736)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m6cs5-00020E-NX
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 13:52:36 -0400
Received: by mail-wr1-x42f.google.com with SMTP id t5so6803011wrw.12
 for <qemu-devel@nongnu.org>; Thu, 22 Jul 2021 10:52:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=74f+hApLCCjhuECeBbrvH7CjKMuQYwF916lVlUEeB5U=;
 b=a8n9Vys3ASOZJ3vS1W1F6kvHdkMFYmWFayfRRxzwp4FrHSHipYALLqLfUXuuWBXhhD
 UOf7QWevZ12rOfyC29hRM7ZoPeIQMBPp9U5171NQaxYvm6s3sRlzwZnnEEmQziagNm/a
 ZQNCVXt1ZcwqzG6w1f1Wkm2UfkGrg4fh5hzfqxuBO07rlKqy3PDiS6lQ5KdvXvAmxEwk
 uakPqo8zhxZcRW81CATENpDLTByVZG99kSAA4md4NCqztCR3SYPASbl75qagd0pioHMh
 zEGF8wauxHLGCdQRlVUpHCxFiVXxuzlVT7ufbdoZMu16eL449S5lbsI2gikQHMK/q5X2
 QSqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=74f+hApLCCjhuECeBbrvH7CjKMuQYwF916lVlUEeB5U=;
 b=DYB1tjwIMlk56R5sYFk7qGJnIuElRWjt00WWKZzHNhBRH2/MaGyUk1dPrVy/8sqbrj
 SMYhAv6zkVaAtmzL0lasuW73GsKc9yM0oKe8+DoukF37SkV2/hl1wTEmD2HiK/mrMbB9
 DkTxglAUxU/7ZyxQo5YkCXYBNypCAs6EWGY2bwKyl3LcEGXUjZ71jkZ/Fvvj1yVxFJFL
 jBFqktzNSBr+vLcYLIeerkuTeghBH8a7Z9S9dIeQzmM7AEfAtqoLA3L6Iu9Jv6FUShU1
 2rlDnHMrN/tOK1HKnb9+0aZLPWV3B4a0w9VrjnzTrfhiR15AK2nPYV7a9U1V7mhaN217
 fMfg==
X-Gm-Message-State: AOAM532j16FWP/Ph5fOdYh/5hoqgtf11MIuI++uh55AOrbgtBsCG1JF7
 1wUgALi5UcM6+u8Udd+FtTNECA==
X-Google-Smtp-Source: ABdhPJxRIt2envMmRIeEgSwKSBL/4ryGQj70komAeUFl4xnEPs4uh1oXkVhp+eci3WUJ73dLdaHg1Q==
X-Received: by 2002:a5d:59ab:: with SMTP id p11mr1196110wrr.74.1626976352483; 
 Thu, 22 Jul 2021 10:52:32 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id s13sm30278651wrm.13.2021.07.22.10.52.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jul 2021 10:52:32 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.1 1/3] docs: Add documentation of Arm 'mainstone' board
Date: Thu, 22 Jul 2021 18:52:27 +0100
Message-Id: <20210722175229.29065-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210722175229.29065-1-peter.maydell@linaro.org>
References: <20210722175229.29065-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Add brief documentation of the Arm 'mainstone' board.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/system/arm/mainstone.rst | 25 +++++++++++++++++++++++++
 docs/system/target-arm.rst    |  1 +
 MAINTAINERS                   |  1 +
 3 files changed, 27 insertions(+)
 create mode 100644 docs/system/arm/mainstone.rst

diff --git a/docs/system/arm/mainstone.rst b/docs/system/arm/mainstone.rst
new file mode 100644
index 00000000000..05310f42c7f
--- /dev/null
+++ b/docs/system/arm/mainstone.rst
@@ -0,0 +1,25 @@
+Intel Mainstone II board (``mainstone``)
+========================================
+
+The ``mainstone`` board emulates the Intel Mainstone II development
+board, which uses a PXA270 CPU.
+
+Emulated devices:
+
+- Flash memory
+- Keypad
+- MMC controller
+- 91C111 ethernet
+- PIC
+- Timer
+- DMA
+- GPIO
+- FIR
+- Serial
+- LCD controller
+- SSP
+- USB controller
+- RTC
+- PCMCIA
+- I2C
+- I2S
diff --git a/docs/system/target-arm.rst b/docs/system/target-arm.rst
index c0c2585c0ad..ad3f5f435d6 100644
--- a/docs/system/target-arm.rst
+++ b/docs/system/target-arm.rst
@@ -90,6 +90,7 @@ undocumented; you can get a complete list by running
    arm/highbank
    arm/musicpal
    arm/gumstix
+   arm/mainstone
    arm/nrf
    arm/nseries
    arm/nuvoton
diff --git a/MAINTAINERS b/MAINTAINERS
index 4256ad1adbb..47ddcbb7f7a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -856,6 +856,7 @@ F: include/hw/arm/pxa.h
 F: include/hw/arm/sharpsl.h
 F: include/hw/display/tc6393xb.h
 F: docs/system/arm/xscale.rst
+F: docs/system/arm/mainstone.rst
 
 SABRELITE / i.MX6
 M: Peter Maydell <peter.maydell@linaro.org>
-- 
2.20.1


