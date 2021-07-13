Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6F763C722D
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 16:28:53 +0200 (CEST)
Received: from localhost ([::1]:39052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3JP2-0004LU-Hx
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 10:28:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3JIy-0001hD-H2
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 10:22:40 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:52170)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3JIv-0001f2-Ab
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 10:22:36 -0400
Received: by mail-wm1-x32d.google.com with SMTP id n4so3357685wms.1
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 07:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LceErhheS5L5/y4VH2OfmPzwif8aAP4fxnUPjSh8ZQs=;
 b=v5CTGGThGJ5hMIZM8nbBH2fiYUDXi9N24IiwqgEHpJk0f5TK0kyTHwb0YWc5sj2lj+
 TpRjk7pOFC7QL+MyhNCqrGlccrGrbTZzLLP/hdH6ZeCAtR3rXod/t0rFencWJdlliAi5
 uB1mJp4hN3a5C4HC5tA9+suc+tsOcYiOU1mLx1ag3Rd4QdHWxfcqumghdjHFinike0Tm
 fiaUyckd6ocIYzaiMQmQXpezJVbgMiuVohSpL/+2ua/s2UDnjxoVAmlmbBOO4vf6N3Qi
 EPf8Abtu7XvZBfdlhWrvH6Fviulvt9++aHMzpsNEIrCxHc62p6LtrtZx1YmPiry+jp5J
 AQ3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LceErhheS5L5/y4VH2OfmPzwif8aAP4fxnUPjSh8ZQs=;
 b=n70k/RYL/fqDiLKmc0IcMmZlBGvNY7mu0Sdsivo40U54hu2Aq5rWoE3kYZjM/ATfd8
 18crgJnn9DZhvpDEyBKaTH0yhtTedbG0X9t6eNBwssrBKSiDkV8SR3YKUMkUpjNTLOrz
 lhjHNjSC4ja584Tz333LXnJs9QpIBeOHQZp6gfa+xXUR+UpF0mC6JcuqO3oOhypJDKMI
 +VCx1JkQfX1vemFDwYVfz4MB0p3sbBgrk61DdHnnag8Ob7Iu0hgZC1VHQx9o5jwvsfpa
 l0UCxO0LN5HYXHQht+EnrbHpJ7H0Klg7QVRoZVjhWyQ1TUSBLwiTZGxhpHd2m4SWFQ6K
 CaEw==
X-Gm-Message-State: AOAM531xZMeJtlBI7vAI+f9p5fby0KEdsEcispSzLIPY3rqJs46KQVjZ
 ZekujL7ZfxWYDhTZdSwMWwkfVw==
X-Google-Smtp-Source: ABdhPJwBV6SAEHTrvGk0XrK/hgVa35n2Pj0DZUOfVkKqIso3mEe/SegEUL9NI351wVjqOeQyHy6mlw==
X-Received: by 2002:a7b:c7cb:: with SMTP id z11mr333237wmk.102.1626186151307; 
 Tue, 13 Jul 2021 07:22:31 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id l15sm7916469wrv.87.2021.07.13.07.22.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 07:22:30 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 3/3] docs: Add skeletal documentation of highbank and midway
Date: Tue, 13 Jul 2021 15:22:26 +0100
Message-Id: <20210713142226.19155-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210713142226.19155-1-peter.maydell@linaro.org>
References: <20210713142226.19155-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
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
Cc: Beniamino Galvani <b.galvani@gmail.com>, Rob Herring <robh@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add skeletal documentation for the highbank and midway machines.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/system/arm/highbank.rst | 19 +++++++++++++++++++
 docs/system/target-arm.rst   |  1 +
 MAINTAINERS                  |  1 +
 3 files changed, 21 insertions(+)
 create mode 100644 docs/system/arm/highbank.rst

diff --git a/docs/system/arm/highbank.rst b/docs/system/arm/highbank.rst
new file mode 100644
index 00000000000..bb4965b367f
--- /dev/null
+++ b/docs/system/arm/highbank.rst
@@ -0,0 +1,19 @@
+Calxeda Highbank and Midway (``highbank``, ``midway``)
+======================================================
+
+``highbank`` is a model of the Calxeda Highbank (ECX-1000) system,
+which has four Cortex-A9 cores.
+
+``midway`` is a model of the Calxeda Midway (ECX-2000) system,
+which has four Cortex-A15 cores.
+
+Emulated devices:
+
+- L2x0 cache controller
+- SP804 dual timer
+- PL011 UART
+- PL061 GPIOs
+- PL031 RTC
+- PL022 synchronous serial port controller
+- AHCI
+- XGMAC ethernet controllers
diff --git a/docs/system/target-arm.rst b/docs/system/target-arm.rst
index c52902acdad..c0c2585c0ad 100644
--- a/docs/system/target-arm.rst
+++ b/docs/system/target-arm.rst
@@ -87,6 +87,7 @@ undocumented; you can get a complete list by running
    arm/digic
    arm/cubieboard
    arm/emcraft-sf2
+   arm/highbank
    arm/musicpal
    arm/gumstix
    arm/nrf
diff --git a/MAINTAINERS b/MAINTAINERS
index f23cf874c66..767adc64ba2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -642,6 +642,7 @@ L: qemu-arm@nongnu.org
 S: Odd Fixes
 F: hw/arm/highbank.c
 F: hw/net/xgmac.c
+F: docs/system/arm/highbank.rst
 
 Canon DIGIC
 M: Antony Pavlov <antonynpavlov@gmail.com>
-- 
2.20.1


