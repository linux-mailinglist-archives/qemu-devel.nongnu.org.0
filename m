Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D669C3E8149
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 19:58:16 +0200 (CEST)
Received: from localhost ([::1]:56352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDW11-0006A2-Up
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 13:58:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1mDVz3-0004Is-ET; Tue, 10 Aug 2021 13:56:13 -0400
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f]:43967)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1mDVz1-0006tM-Oi; Tue, 10 Aug 2021 13:56:13 -0400
Received: by mail-ot1-x32f.google.com with SMTP id
 r16-20020a0568304190b02904f26cead745so33771otu.10; 
 Tue, 10 Aug 2021 10:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qS/22leVWfTTilKCAwDu9JaM+8d73K/CskvFmLZ/x2o=;
 b=tRcutMazKZq/76aJ6+IiJrAcTR6ufedTzc40tj25timU4JI1snepvR+r/QNm5xmCt7
 LRkHlAVF3ITPUhms8fkWWB//UhmCs82CfoXMYkEAnEdd/eDPfysivXCiNTDCJLG7BiyX
 JJARqH3YkAdJkSS8x8g7aPYFVSgP1yyMEjoZ6FMuOyL2rGQSZHQJQLFSj46nmp0slu/E
 fncYMB7VejQ7Qug/Hp1iNyUI/LA4OCNaWb8hkebcM8wlR7ED7a7Z7YxebdJ8JW5pAqEw
 HWdFR+7NjvylpMrHqM10fnEGl8TGjpowUfkkojF9Wg5TAjNBptVqUxuN0dDdzQi6f09y
 mAqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=qS/22leVWfTTilKCAwDu9JaM+8d73K/CskvFmLZ/x2o=;
 b=XHSA7oT53C7bQRuQWh4hTYrXu6dgi9EE29z3XnBELFcsaPa1Gxq5qb5AqNwIy7eJfC
 bypPswE4V6V3ej/4l0TEwiBA+fg05QE4V6UA0HoTamDB6Rt/1DdkDvfcqNe7AhkHrKPE
 zkuYQPukUBvjnjemWCHIIVJIao6h9s/FLkz9W2obvUOOMEHB1b2/F8KPAGOCRwfUrVq5
 bhW3o/c5nTVTGxilOXd6vxGT3+nTKgeUnBiMBHKlue4GXXqPZ+8CG3FabDl42uIZ3oYr
 HcoBI3Ozrq7KSJYX9oV+SXq6JdkfLy2eKX6l1AGLYAJW1YxsasPJ33lU7b7rYu1QZ05+
 0Xiw==
X-Gm-Message-State: AOAM533s/ld6L1Bb6LxmIPTv2BE4jWLplDmPkXjP7iWyzNIbMwDJVe5v
 P/lYkKNlXuEGrfkRqyDFMH0=
X-Google-Smtp-Source: ABdhPJx+zobb/rVhYNtzMsswwj6CYzsgscAVJCBPBekQ8l15AlrwQsJivNLCMrcyy8bPcvuXuxrIhw==
X-Received: by 2002:a9d:1c85:: with SMTP id l5mr17138262ota.5.1628618170398;
 Tue, 10 Aug 2021 10:56:10 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 e3sm3427270oow.34.2021.08.10.10.56.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Aug 2021 10:56:09 -0700 (PDT)
From: Guenter Roeck <linux@roeck-us.net>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH] fsl-imx7: Instantiate SAI1/2/3 as unimplemented devices
Date: Tue, 10 Aug 2021 10:56:07 -0700
Message-Id: <20210810175607.538090-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32f;
 envelope-from=groeck7@gmail.com; helo=mail-ot1-x32f.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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
---
 hw/arm/fsl-imx7.c         | 7 +++++++
 include/hw/arm/fsl-imx7.h | 5 +++++
 2 files changed, 12 insertions(+)

diff --git a/hw/arm/fsl-imx7.c b/hw/arm/fsl-imx7.c
index 908aa6ca8a..81daac7747 100644
--- a/hw/arm/fsl-imx7.c
+++ b/hw/arm/fsl-imx7.c
@@ -483,6 +483,13 @@ static void fsl_imx7_realize(DeviceState *dev, Error **errp)
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
diff --git a/include/hw/arm/fsl-imx7.h b/include/hw/arm/fsl-imx7.h
index 6cc5752457..e8d963b6fb 100644
--- a/include/hw/arm/fsl-imx7.h
+++ b/include/hw/arm/fsl-imx7.h
@@ -175,6 +175,11 @@ enum FslIMX7MemoryMap {
     FSL_IMX7_UART6_ADDR           = 0x30A80000,
     FSL_IMX7_UART7_ADDR           = 0x30A90000,
 
+    FSL_IMX7_SAI1_ADDR            = 0x308A0000,
+    FSL_IMX7_SAI2_ADDR            = 0x308B0000,
+    FSL_IMX7_SAI3_ADDR            = 0x308C0000,
+    FSL_IMX7_SAIn_SIZE            = 0x10000,
+
     FSL_IMX7_ENET1_ADDR           = 0x30BE0000,
     FSL_IMX7_ENET2_ADDR           = 0x30BF0000,
 
-- 
2.25.1


