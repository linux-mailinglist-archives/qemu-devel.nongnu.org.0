Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D028E3BBCD7
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 14:27:57 +0200 (CEST)
Received: from localhost ([::1]:41510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0Nhc-0002mx-RD
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 08:27:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m0NaV-0003hM-0e
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 08:20:37 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:52096)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m0NaL-0001yy-Mm
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 08:20:34 -0400
Received: by mail-wm1-x335.google.com with SMTP id n33so3793458wms.1
 for <qemu-devel@nongnu.org>; Mon, 05 Jul 2021 05:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6gPMmqfd0GxTBLGXdGq3kwjL5iZPO7fHBJ4CRJajYow=;
 b=hxxMbcEocx4Rr2mLT21LKQY+ocdf4CIDdG1rWXDtixvYvvbE8ec79t1bmVOHV+vThI
 gMkqeIrHdRHLImlwVsPagr4XVSkmkvjhMTXt/OBa2bkjSLp6+4djidG0vmG+J95j6g4/
 yTSkT1oKTgXu9BwMjwrkXOc7Z1NKs/isOR1SryNj+bHxeMd8sxtKn8Z1Yj26waxCTT6a
 QU/NtHyULQkT8uHKa46ClRM+i8oNBb8bSekmfWcul2G9Hm/6/20w/mM8y4M2OFCrBSXZ
 lKeh1YTfRu3zMWAsKik+BnzpztpJnKm/8XOFzpdN8+Q/rdSUVsEhWcVVd5efYYyoxqkg
 PABw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6gPMmqfd0GxTBLGXdGq3kwjL5iZPO7fHBJ4CRJajYow=;
 b=PKjSBz9GPVaVniJ/de9sFPyUfxtos/185AkkSIZ5XIHSi21gHDx8iUV42QuujdkKS9
 9k0UYza6dUdxmkbIrDTbUFRJ/QnaY9QTVljYDksFj9p/H8oIRmJWJ8hJ6fpDvVa5Gk9z
 nMTj8hjzpUDflycKAI9R1PYrDPAgHrdVHbdWPDyLBWRsY+QWb/S1DQxXsIWXRbrSxs5I
 /krnFI73Sm7JTPzYAHbj1tkps+RIscTh2WgfUldtSCNmlKWVapg0Pz6Abl+uc/UwlmkK
 Ss/KJaif+3B5uci6tIiankJFL/c2fKLFE9cj6UR5AW3phzwLOmlUZsNQMXeJ0uhx90A2
 r9SQ==
X-Gm-Message-State: AOAM532fbkl05BudnxdUg8/fymtm4lKsYR1MYJ2Q1ZBAOVQ+c6H92Qoq
 tKvaqDa60MRlahMtU1p43DGGEg==
X-Google-Smtp-Source: ABdhPJzYXpoKXtX/q5V5WGQh/d8Ex4d24PKg4sopLGJuQlZJQrFYeN+J7vqx49teShMFdiQiWMfwHQ==
X-Received: by 2002:a05:600c:21c8:: with SMTP id
 x8mr14672248wmj.167.1625487620077; 
 Mon, 05 Jul 2021 05:20:20 -0700 (PDT)
Received: from orth.archaic.org.uk ([81.2.115.148])
 by smtp.gmail.com with ESMTPSA id f18sm13450406wru.53.2021.07.05.05.20.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jul 2021 05:20:19 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 3/3] docs: Add skeletal documentation of highbank and midway
Date: Mon,  5 Jul 2021 13:20:11 +0100
Message-Id: <20210705122011.753-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210705122011.753-1-peter.maydell@linaro.org>
References: <20210705122011.753-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
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
index d316e684106..569983997cf 100644
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
index dbbd71958ac..91546c0e943 100644
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


