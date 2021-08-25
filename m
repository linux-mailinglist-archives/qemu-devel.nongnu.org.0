Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 558873F73B7
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 12:52:18 +0200 (CEST)
Received: from localhost ([::1]:45202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIqVw-0005YL-4T
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 06:52:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mIqGV-0004rC-E3
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 06:36:15 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:55235)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mIqGT-0005go-Mx
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 06:36:15 -0400
Received: by mail-wm1-x336.google.com with SMTP id g138so14655290wmg.4
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 03:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=wbPly+qqd4AS1dpoI091FozMPYkS2uEC5VGsCj8EC38=;
 b=hxOTx4mMhVUOr4s9P28PARTyJI8X6E6QOrjx7O1KexsQ1foxLeD6oy8vA2YmtSFf3W
 JAXdvGfZwh3tDOb/luwdTlLM9z++9GKgEAXK/Cadv3lPtWZU8Wz+uVnPEaudaZB2N/BT
 kGJgEodBqQ7ZyesnHi0h6Lc9wMKpkm/6t5EmfFhOZxSh8u8JgmU46nImllhc2zH6Sywb
 3t8L81eAfZRbUN58ASbsrMdAZTug82kjaRN8l8hF7HdGEJM5Z3vH0+r9LuMSUNSyMP1Z
 4scMLBXe2XWRVcNA4CiYNlBGOIQ385xTve5XcsHO0lo1o8mNolSyYSuDRElPHCCn85l4
 AJgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wbPly+qqd4AS1dpoI091FozMPYkS2uEC5VGsCj8EC38=;
 b=gxCx0SGFB54X+MnJ7J/L+BJby8o0IG7N/KMcY2qQ6ti/hJs7gU+6H9H3DRo0wfliPY
 yCTtdiGWrVi4lviCV7dvKTJB4Z1Q5+fu7mvRaWNrCU3RH4DrOyCsFa/Tbwsis0yFwEtJ
 NgunqPyAKRVrgohuBH5/ApaKeymQ/+H1oEVKT2yAQ+Lau1ecR79kkFnYfda2SgQt0ZLL
 rwrGLxN0jkpw3uh3h/FOMO86Y/X2r0kK8ql/8ATjZjd+Y7LMDV3Urh3yUfyK/1ID+E7j
 pDAWmxkH9flLJFlpsh4AbCwbvFY6MVxTRKv4P/Hkqp8T9g3P8JiJUm7YUSvStYfku8ct
 hMnQ==
X-Gm-Message-State: AOAM530WcYCjJHcpVfwkRIPa3ZMl9wtf0yJLVtIB09l+ZKk3j8We50gh
 F8pi2kYN/SUEa5S6HDZTwDnnSNMGJaOycQ==
X-Google-Smtp-Source: ABdhPJwi0KORd4Ey84ANdsPxuBJVUjLUeLT/mt1C3NPuVt+OriKzeHeczKqHcExxGx3AkumVjYWcDQ==
X-Received: by 2002:a1c:1d1:: with SMTP id 200mr8395232wmb.53.1629887772318;
 Wed, 25 Aug 2021 03:36:12 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m4sm5075931wml.28.2021.08.25.03.36.11
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 03:36:11 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 43/44] fsl-imx7: Instantiate SAI1/2/3 as unimplemented devices
Date: Wed, 25 Aug 2021 11:35:33 +0100
Message-Id: <20210825103534.6936-44-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210825103534.6936-1-peter.maydell@linaro.org>
References: <20210825103534.6936-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
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

Instantiate SAI1/2/3 as unimplemented devices to avoid Linux kernel crashes
such as the following.

Unhandled fault: external abort on non-linefetch (0x808) at 0xd19b0000
pgd = (ptrval)
[d19b0000] *pgd=82711811, *pte=308a0653, *ppte=308a0453
Internal error: : 808 [#1] SMP ARM
Modules linked in:
CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.14.0-rc5 #1
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

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
Message-id: 20210810175607.538090-1-linux@roeck-us.net
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/arm/fsl-imx7.h | 5 +++++
 hw/arm/fsl-imx7.c         | 7 +++++++
 2 files changed, 12 insertions(+)

diff --git a/include/hw/arm/fsl-imx7.h b/include/hw/arm/fsl-imx7.h
index f5d527a4906..1c5fa6fd676 100644
--- a/include/hw/arm/fsl-imx7.h
+++ b/include/hw/arm/fsl-imx7.h
@@ -174,6 +174,11 @@ enum FslIMX7MemoryMap {
     FSL_IMX7_UART6_ADDR           = 0x30A80000,
     FSL_IMX7_UART7_ADDR           = 0x30A90000,
 
+    FSL_IMX7_SAI1_ADDR            = 0x308A0000,
+    FSL_IMX7_SAI2_ADDR            = 0x308B0000,
+    FSL_IMX7_SAI3_ADDR            = 0x308C0000,
+    FSL_IMX7_SAIn_SIZE            = 0x10000,
+
     FSL_IMX7_ENET1_ADDR           = 0x30BE0000,
     FSL_IMX7_ENET2_ADDR           = 0x30BF0000,
 
diff --git a/hw/arm/fsl-imx7.c b/hw/arm/fsl-imx7.c
index 2ff2cab9246..149885f2b80 100644
--- a/hw/arm/fsl-imx7.c
+++ b/hw/arm/fsl-imx7.c
@@ -467,6 +467,13 @@ static void fsl_imx7_realize(DeviceState *dev, Error **errp)
     create_unimplemented_device("can1", FSL_IMX7_CAN1_ADDR, FSL_IMX7_CANn_SIZE);
     create_unimplemented_device("can2", FSL_IMX7_CAN2_ADDR, FSL_IMX7_CANn_SIZE);
 
+    /*
+     * SAI (Audio SSI (Synchronous Serial Interface))
+     */
+    create_unimplemented_device("sai1", FSL_IMX7_SAI1_ADDR, FSL_IMX7_SAIn_SIZE);
+    create_unimplemented_device("sai2", FSL_IMX7_SAI2_ADDR, FSL_IMX7_SAIn_SIZE);
+    create_unimplemented_device("sai2", FSL_IMX7_SAI3_ADDR, FSL_IMX7_SAIn_SIZE);
+
     /*
      * OCOTP
      */
-- 
2.20.1


