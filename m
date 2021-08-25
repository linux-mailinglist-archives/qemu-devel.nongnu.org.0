Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0556E3F73FE
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 13:04:23 +0200 (CEST)
Received: from localhost ([::1]:36490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIqhi-0003yG-3T
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 07:04:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mIqGT-0004k6-Ku
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 06:36:13 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:43577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mIqGR-0005fX-Le
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 06:36:13 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 o39-20020a05600c512700b002e74638b567so4240463wms.2
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 03:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=n63vJxGRMpP5Eh4GilygWZg8oc7U1262scL0OrU0E08=;
 b=ydX2AQy1ExyjeX1w7zPJw7JDdSZR8mnV2QkdHUu0zxJa/tlQWhWqEnKZE01P9Hj/kH
 6gifO6B/EscR4481JTciQw8a5XBIPymrHFaXHRDatYzVOfs5SbCgtpiHwwBVs+XD2Y3n
 9VhhsOM9iA25y/ligOJ1H4jktldHPBCdbvWxs0nlOYB5YZ/PXW6u3ARg6fA+y41Lfp2S
 TvMPy5219/ErRMW2qq2M/GT5wt4OE6uF4tyPpG4nmxfdZccA4ph4oJVabYn8mtGaFX2t
 jMY8rEPfDg6j2jeUVQpNMYVHGX2kPsBpo/M4Nyz+aGf04BpP2N5KMkFFnGIQ8IPjVUeB
 B/BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=n63vJxGRMpP5Eh4GilygWZg8oc7U1262scL0OrU0E08=;
 b=gPcSCBi6qThCAJQBahhcMPyh+dExDzfky6caaPTnUFa+AQ7QAoBwzdxYnUmFXAp6r9
 KaWQS4xf63vUczqu5orGMvYsE3MinkfmTnzXVYIftnnuKVKFZRHsvuHhkLPnNwUs8VtR
 H1irNz/NoPQhYF22vwpCz05GKw9l2m7TxvfUNqoqByjd70fnSPuX5O9leza7iJjBn0rO
 fDKaiMsF/dyj9wXnhgnk4WW8UTsmQXgCFj8EYDV14RjEy4MvH5v4x9ppzL7LzJe0WDyx
 Se2FuVFYDkubSP/qrH3K498mQRY/+4qHVYku4vv5cYTQSA22/SiLRz5hNEvRe7dQsYec
 BfwA==
X-Gm-Message-State: AOAM530wQshePNs63iQ/yUTTGEtzcSEfhbqwI16T4GZe3QViW0T65lpz
 SxOMWv3f4bfbZKcyzR3wfvxqv7vv4oB/fg==
X-Google-Smtp-Source: ABdhPJwKO854cagAOLpMkm47BaDGqhPm9POTHLgNKZHagSkfpnYJerikyD7FTLWka4AeKg/Igjiabg==
X-Received: by 2002:a05:600c:1d0d:: with SMTP id
 l13mr8467494wms.76.1629887770188; 
 Wed, 25 Aug 2021 03:36:10 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m4sm5075931wml.28.2021.08.25.03.36.09
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 03:36:09 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 40/44] fsl-imx6ul: Instantiate SAI1/2/3 and ASRC as
 unimplemented devices
Date: Wed, 25 Aug 2021 11:35:30 +0100
Message-Id: <20210825103534.6936-41-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210825103534.6936-1-peter.maydell@linaro.org>
References: <20210825103534.6936-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
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

From: Guenter Roeck <linux@roeck-us.net>

Instantiate SAI1/2/3 and ASRC as unimplemented devices to avoid random
Linux kernel crashes, such as

Unhandled fault: external abort on non-linefetch (0x808) at 0xd1580010
pgd = (ptrval)
[d1580010] *pgd=8231b811, *pte=02034653, *ppte=02034453
Internal error: : 808 [#1] SMP ARM
...
[<c095e974>] (regmap_mmio_write32le) from [<c095eb48>] (regmap_mmio_write+0x3c/0x54)
[<c095eb48>] (regmap_mmio_write) from [<c09580f4>] (_regmap_write+0x4c/0x1f0)
[<c09580f4>] (_regmap_write) from [<c095837c>] (_regmap_update_bits+0xe4/0xec)
[<c095837c>] (_regmap_update_bits) from [<c09599b4>] (regmap_update_bits_base+0x50/0x74)
[<c09599b4>] (regmap_update_bits_base) from [<c0d3e9e4>] (fsl_asrc_runtime_resume+0x1e4/0x21c)
[<c0d3e9e4>] (fsl_asrc_runtime_resume) from [<c0942464>] (__rpm_callback+0x3c/0x108)
[<c0942464>] (__rpm_callback) from [<c0942590>] (rpm_callback+0x60/0x64)
[<c0942590>] (rpm_callback) from [<c0942b60>] (rpm_resume+0x5cc/0x808)
[<c0942b60>] (rpm_resume) from [<c0942dfc>] (__pm_runtime_resume+0x60/0xa0)
[<c0942dfc>] (__pm_runtime_resume) from [<c0d3ecc4>] (fsl_asrc_probe+0x2a8/0x708)
[<c0d3ecc4>] (fsl_asrc_probe) from [<c0935b08>] (platform_probe+0x58/0xb8)
[<c0935b08>] (platform_probe) from [<c0933264>] (really_probe.part.0+0x9c/0x334)
[<c0933264>] (really_probe.part.0) from [<c093359c>] (__driver_probe_device+0xa0/0x138)
[<c093359c>] (__driver_probe_device) from [<c0933664>] (driver_probe_device+0x30/0xc8)
[<c0933664>] (driver_probe_device) from [<c0933c88>] (__driver_attach+0x90/0x130)
[<c0933c88>] (__driver_attach) from [<c0931060>] (bus_for_each_dev+0x78/0xb8)
[<c0931060>] (bus_for_each_dev) from [<c093254c>] (bus_add_driver+0xf0/0x1d8)
[<c093254c>] (bus_add_driver) from [<c0934a30>] (driver_register+0x88/0x118)
[<c0934a30>] (driver_register) from [<c01022c0>] (do_one_initcall+0x7c/0x3a4)
[<c01022c0>] (do_one_initcall) from [<c1601204>] (kernel_init_freeable+0x198/0x22c)
[<c1601204>] (kernel_init_freeable) from [<c0f5ff2c>] (kernel_init+0x10/0x128)
[<c0f5ff2c>] (kernel_init) from [<c010013c>] (ret_from_fork+0x14/0x38)

or

Unhandled fault: external abort on non-linefetch (0x808) at 0xd19b0000
pgd = (ptrval)
[d19b0000] *pgd=82711811, *pte=308a0653, *ppte=308a0453
Internal error: : 808 [#1] SMP ARM
...
[<c095e974>] (regmap_mmio_write32le) from [<c095eb48>] (regmap_mmio_write+0x3c/0x54)
[<c095eb48>] (regmap_mmio_write) from [<c09580f4>] (_regmap_write+0x4c/0x1f0)
[<c09580f4>] (_regmap_write) from [<c0959b28>] (regmap_write+0x3c/0x60)
[<c0959b28>] (regmap_write) from [<c0d41130>] (fsl_sai_runtime_resume+0x9c/0x1ec)
[<c0d41130>] (fsl_sai_runtime_resume) from [<c0942464>] (__rpm_callback+0x3c/0x108)
[<c0942464>] (__rpm_callback) from [<c0942590>] (rpm_callback+0x60/0x64)
[<c0942590>] (rpm_callback) from [<c0942b60>] (rpm_resume+0x5cc/0x808)
[<c0942b60>] (rpm_resume) from [<c0942dfc>] (__pm_runtime_resume+0x60/0xa0)
[<c0942dfc>] (__pm_runtime_resume) from [<c0d4231c>] (fsl_sai_probe+0x2b8/0x65c)
[<c0d4231c>] (fsl_sai_probe) from [<c0935b08>] (platform_probe+0x58/0xb8)
[<c0935b08>] (platform_probe) from [<c0933264>] (really_probe.part.0+0x9c/0x334)
[<c0933264>] (really_probe.part.0) from [<c093359c>] (__driver_probe_device+0xa0/0x138)
[<c093359c>] (__driver_probe_device) from [<c0933664>] (driver_probe_device+0x30/0xc8)
[<c0933664>] (driver_probe_device) from [<c0933c88>] (__driver_attach+0x90/0x130)
[<c0933c88>] (__driver_attach) from [<c0931060>] (bus_for_each_dev+0x78/0xb8)
[<c0931060>] (bus_for_each_dev) from [<c093254c>] (bus_add_driver+0xf0/0x1d8)
[<c093254c>] (bus_add_driver) from [<c0934a30>] (driver_register+0x88/0x118)
[<c0934a30>] (driver_register) from [<c01022c0>] (do_one_initcall+0x7c/0x3a4)
[<c01022c0>] (do_one_initcall) from [<c1601204>] (kernel_init_freeable+0x198/0x22c)
[<c1601204>] (kernel_init_freeable) from [<c0f5ff2c>] (kernel_init+0x10/0x128)
[<c0f5ff2c>] (kernel_init) from [<c010013c>] (ret_from_fork+0x14/0x38)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
Message-id: 20210810160318.87376-1-linux@roeck-us.net
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/fsl-imx6ul.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/hw/arm/fsl-imx6ul.c b/hw/arm/fsl-imx6ul.c
index e0128d73161..1d1a708dd97 100644
--- a/hw/arm/fsl-imx6ul.c
+++ b/hw/arm/fsl-imx6ul.c
@@ -534,6 +534,13 @@ static void fsl_imx6ul_realize(DeviceState *dev, Error **errp)
      */
     create_unimplemented_device("sdma", FSL_IMX6UL_SDMA_ADDR, 0x4000);
 
+    /*
+     * SAI (Audio SSI (Synchronous Serial Interface))
+     */
+    create_unimplemented_device("sai1", FSL_IMX6UL_SAI1_ADDR, 0x4000);
+    create_unimplemented_device("sai2", FSL_IMX6UL_SAI2_ADDR, 0x4000);
+    create_unimplemented_device("sai3", FSL_IMX6UL_SAI3_ADDR, 0x4000);
+
     /*
      * PWM
      */
@@ -542,6 +549,11 @@ static void fsl_imx6ul_realize(DeviceState *dev, Error **errp)
     create_unimplemented_device("pwm3", FSL_IMX6UL_PWM3_ADDR, 0x4000);
     create_unimplemented_device("pwm4", FSL_IMX6UL_PWM4_ADDR, 0x4000);
 
+    /*
+     * Audio ASRC (asynchronous sample rate converter)
+     */
+    create_unimplemented_device("asrc", FSL_IMX6UL_ASRC_ADDR, 0x4000);
+
     /*
      * CAN
      */
-- 
2.20.1


