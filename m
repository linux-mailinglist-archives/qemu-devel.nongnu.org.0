Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01EF43DD505
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 13:59:58 +0200 (CEST)
Received: from localhost ([::1]:44474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAWbs-0002nl-Lr
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 07:59:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mAWaH-0000G7-Gh
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 07:58:17 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:35763)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mAWaF-0003Xi-T3
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 07:58:17 -0400
Received: by mail-wr1-x435.google.com with SMTP id n12so21182306wrr.2
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 04:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=SI/Yhp0mK4jAlx2Z9SWd6mts9nvU3MwCROGAVFLjxyI=;
 b=q17p82xd39tFBerYd2v6GgKbgXxS7u4k4GeXLK886+nmtPC+U//BEFqAWee+H9Yi0d
 D+ZqGzNsU+Hdj8nrHj29qBGJaDDGGeuMuyRE4N8VmvN5Bu7YSkue12RA21e5a4bGQRuA
 PEmwNTZ3C/n0dZoioTRk6RyQ0sVjwgbrllsKJvM3WNPK11DE2SwiYroxed0uN1hwckve
 gQYbKTu8FaW/yQYC/HcnisPFaSmlUYkDeNhM64ZIBNHM+KFBO+E7fOzg2fSyjoHcFd/t
 LHiNz715d1PqV5nY/K+HvxB08XrYglstvTsO11/1MwfeJGjQbsp9/ySc7J0qr9m5XKmF
 b8Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SI/Yhp0mK4jAlx2Z9SWd6mts9nvU3MwCROGAVFLjxyI=;
 b=b9y4wKGvBXD0LPuourRkF9Ck/tWbWoQTqQq1YRNjSWabC1ssQGOj2UPzMXR8jwLwMX
 p+oRMhIM+y8Yjv0Z/HCFb3Y1bEaICHH1G+G1tA3BJ8v2zln9VIUCBKBikXl/fTC6bTfb
 06CM/yEGT8A9mzBT3LW7fLLW9G+bSEYQUxJbj6Dqqlnb8BTUe3ZVtilK3GK106xEytf8
 ahHxjFCrdTLsXEk0hHRzltFhifBEFwAOe6y9q8q0xOP+NFiORGnruTsgRIUpZ+khQQHz
 PGSyp1M+F8MZiBAS1CJcGnCcA/HeEQ/Hd/VOdg2S5eoByH7x4TWjmCR07/szD7P2tK5J
 +PsA==
X-Gm-Message-State: AOAM533xVmQcDDX1sLqMzIDZYV8a59c6J4/7ZAoBi7X9swemD3NzpLRq
 S4uQJVm7BiBVmLXUmtHchnFn420Q2VvUUQ==
X-Google-Smtp-Source: ABdhPJykvJvR6NxjohGpZ9WZQEzN8uKM+nSdrYHZDViJudrNG+OwtknBtph3snxxAVO5HrGdc3TDTw==
X-Received: by 2002:adf:d4cd:: with SMTP id w13mr16959299wrk.355.1627905494625; 
 Mon, 02 Aug 2021 04:58:14 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y66sm10102772wmy.39.2021.08.02.04.58.14
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Aug 2021 04:58:14 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 01/21] docs: Add documentation of Arm 'mainstone' board
Date: Mon,  2 Aug 2021 12:57:52 +0100
Message-Id: <20210802115812.10731-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210802115812.10731-1-peter.maydell@linaro.org>
References: <20210802115812.10731-1-peter.maydell@linaro.org>
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add brief documentation of the Arm 'mainstone' board.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210722175229.29065-2-peter.maydell@linaro.org
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
index 6831978d2cd..24e0819bf8c 100644
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


