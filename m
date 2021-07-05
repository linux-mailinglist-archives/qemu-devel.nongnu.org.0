Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88DC03BBCD2
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 14:23:58 +0200 (CEST)
Received: from localhost ([::1]:34928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0Ndl-0006UX-IP
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 08:23:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m0NaQ-0003gY-En
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 08:20:33 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:43809)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m0NaI-0001yo-6P
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 08:20:30 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 q18-20020a1ce9120000b02901f259f3a250so11275230wmc.2
 for <qemu-devel@nongnu.org>; Mon, 05 Jul 2021 05:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XMUB+p/IFGPvYVtXtlwgo5/EDMvD/ScL/O9/NTh5KPI=;
 b=A6X/FhvH2aXMlyR4zE2WIOe6x2R6EXaPRzcqgho61CzA9O4xiw8t3wug11gVzLE5v4
 LfkMimKpL7YEer1YVwWrZT8oOFjn7DmhjNgqizTgvGdW5y6Mv0sJS1V7bSfQP2r+Z6/4
 dbBVT42BKKxeoMMLjicYd5YHloLNklQCCBFOSXzt/a5UXoKcK+a4u44eo+qiEzdIbv5I
 sNyTuZSVMquuzffd5WftwtWCWceGYv8jMmz5z36MjOU2e9+Uv0RDVlvpYHF1yE+3JwhJ
 ufSG6kKbhOh3QoKNKILmcmqtiKdBMmJB/PFSRbjcTHxZK0OxlDqs/tZhS3Hssn3flSGr
 S3Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XMUB+p/IFGPvYVtXtlwgo5/EDMvD/ScL/O9/NTh5KPI=;
 b=BdfFoA618X2/LknuDRRSG7thhdsUaZPpc3TC6QTMLtFxnNeQsLCu3EazKe+4z3OGu8
 Zt3QYKX6l795Brp+iDMV1IjQ6h5usMhVVZt+lscqub8qpLIgr0ZSAag28+V6S1+zW0CZ
 UoCAmk2Md2bkAQ8gBPb+Aeju+exnM4EJHnyoIAVRSZqEnkHP1u23ca408MJ/c4vvHGsU
 Ech+uUhTmANbP08bjRIWVU/MP3LMhbd+hc+1OWo/AfBKyhJqSLlUWrjWA8CkJ0N6Nkt0
 g/xf1AeezYXZmGNP90UBzd62fhPtuQtTAtp5+4je62kdXmFSp4YsFkht2E0HGAAf88F4
 gGdQ==
X-Gm-Message-State: AOAM530YaJ0HU3eGKBZl9supBomiibZcbQpgS8KV3PE5jjslIn7IB3Ha
 0WVgnzza+5TuWdWe5zKe7dXw8w==
X-Google-Smtp-Source: ABdhPJyjsGkKEFotuze3nciWW9zr5QsBH/yFBh14+o4Ri8EjM/NYUZjhXRyXBw+o5x05Qh6VDHQjCA==
X-Received: by 2002:a05:600c:4f56:: with SMTP id
 m22mr15055889wmq.16.1625487619365; 
 Mon, 05 Jul 2021 05:20:19 -0700 (PDT)
Received: from orth.archaic.org.uk ([81.2.115.148])
 by smtp.gmail.com with ESMTPSA id f18sm13450406wru.53.2021.07.05.05.20.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jul 2021 05:20:19 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 2/3] docs: Add skeletal documentation of the emcraft-sf2
Date: Mon,  5 Jul 2021 13:20:10 +0100
Message-Id: <20210705122011.753-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210705122011.753-1-peter.maydell@linaro.org>
References: <20210705122011.753-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
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

Add skeletal documentation of the emcraft-sf2 machine.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/system/arm/emcraft-sf2.rst | 10 ++++++++++
 docs/system/target-arm.rst      |  1 +
 MAINTAINERS                     |  1 +
 3 files changed, 12 insertions(+)
 create mode 100644 docs/system/arm/emcraft-sf2.rst

diff --git a/docs/system/arm/emcraft-sf2.rst b/docs/system/arm/emcraft-sf2.rst
new file mode 100644
index 00000000000..9f10b86427a
--- /dev/null
+++ b/docs/system/arm/emcraft-sf2.rst
@@ -0,0 +1,10 @@
+Emcraft SmartFusion2 SOM kit (``emcraft-sf2``)
+==============================================
+
+The ``emcraft-sf2`` board emulates the SmartFusion2 SOM kit from
+Emcraft (M2S010). This is a System-on-Module from EmCraft systems,
+based on the SmartFusion2 SoC FPGA from Microsemi Corporation.
+The SoC is based on a Cortex-M4 processor.
+
+At the moment only the system timer, system registers and SPI
+controller are modelled.
diff --git a/docs/system/target-arm.rst b/docs/system/target-arm.rst
index 0a3ef309472..d316e684106 100644
--- a/docs/system/target-arm.rst
+++ b/docs/system/target-arm.rst
@@ -86,6 +86,7 @@ undocumented; you can get a complete list by running
    arm/sabrelite
    arm/digic
    arm/cubieboard
+   arm/emcraft-sf2
    arm/musicpal
    arm/gumstix
    arm/nrf
diff --git a/MAINTAINERS b/MAINTAINERS
index 76a2c608d1e..dbbd71958ac 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1007,6 +1007,7 @@ M: Peter Maydell <peter.maydell@linaro.org>
 L: qemu-arm@nongnu.org
 S: Maintained
 F: hw/arm/msf2-som.c
+F: docs/system/arm/emcraft-sf2.rst
 
 ASPEED BMCs
 M: Cédric Le Goater <clg@kaod.org>
-- 
2.20.1


