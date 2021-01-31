Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18600309B71
	for <lists+qemu-devel@lfdr.de>; Sun, 31 Jan 2021 12:04:41 +0100 (CET)
Received: from localhost ([::1]:39992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6AX2-0001OX-42
	for lists+qemu-devel@lfdr.de; Sun, 31 Jan 2021 06:04:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6AST-0007WZ-Eg; Sun, 31 Jan 2021 05:59:57 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:36255)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6ASR-0000Sa-Tq; Sun, 31 Jan 2021 05:59:57 -0500
Received: by mail-wr1-x432.google.com with SMTP id 6so13415142wri.3;
 Sun, 31 Jan 2021 02:59:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=K1GY+CrGWLNKk4VjoQeZ9qm50XB2sG8rwszIkKr7Jqk=;
 b=HPsDKu0PbsmcYP4UG3Hicq8cpwlvvUW4qW/gmBKuMHCa8hdR5bL3/3/ZItGtYFpsTT
 mDvvb8wUDAAFol6ZNlljn0WRYc71vICmgQSWEPPblanSXRHyByMWGN8PVZ0D2Iwrb3MH
 Dydwd2Biq4CiM0aK2oCwdIuJcRO4rGntZUSN8rFjxns9+5BZd+ZV8jl7NNdePkPzrJ7u
 3BqApBC0GbyqgzPH6BL8XNcDiQlx7l3aPfOek8jsy4r15IRgnmhRBZ2Yg3GwkeHu+s1V
 MRNJcwztz135kzI0K1woinW1reEf7UaQSDbYD/vaVGOqcwa89Bezua6K1YCs/4vgZJCH
 MfQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=K1GY+CrGWLNKk4VjoQeZ9qm50XB2sG8rwszIkKr7Jqk=;
 b=eij4ihk9U6Np5/h5YLSOXtQRBESG7DmwFXEHBUiApkrcoofOCVziJyzPeZ6EIA0Tno
 eRqVovUOw0CdqxyK5a2BpI1+drCG8Mbs1/Hc0/55gWF9GuvczpUWJbYWFOjboXGuoXMS
 kt/2oID6diafFxVnEqLoWxiGR7w2iRCXZMhCDri3b3QGOvCusz2zclXf7S4cP7lIX3rs
 TQo06Cs4p28YbM7+ZNSXgHwH20C5/sddm4lqTTtbabgeANWuBxVvjL9ZG6g0BUubykii
 EMyqEX7MIUWXrc5BXI2kae1Iwj6wv0c2N2jIBVkp5TTZNNpU+LVsj4w3POXMOGYpUgeM
 oX7g==
X-Gm-Message-State: AOAM531HNVme8Nxh5oHOkxXleERiJKqfFkQ54Qu/fOEpxpUjAHee5ShL
 TQErGDyFBseK1eb8zdL+4p4P3Kqzdls=
X-Google-Smtp-Source: ABdhPJxKNEYJ5VvvJzCCmtbw1/g2mbbDx3EPmWrYWzj6CY26h/S9CXQeuFKtaNO73YMh+/NQl+f7Zg==
X-Received: by 2002:a5d:58dc:: with SMTP id o28mr13079263wrf.414.1612090793758; 
 Sun, 31 Jan 2021 02:59:53 -0800 (PST)
Received: from localhost.localdomain (7.red-83-57-171.dynamicip.rima-tde.net.
 [83.57.171.7])
 by smtp.gmail.com with ESMTPSA id l14sm22091419wrq.87.2021.01.31.02.59.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Jan 2021 02:59:53 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 6/7] hw/arm/xlnx-zcu102: Restrict ZynqMP ZCU102 board to
 64-bit build
Date: Sun, 31 Jan 2021 11:59:17 +0100
Message-Id: <20210131105918.228787-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210131105918.228787-1-f4bug@amsat.org>
References: <20210131105918.228787-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org,
 Alistair Francis <alistair@alistair23.me>, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 Antony Pavlov <antonynpavlov@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The ZynqMP ZCU102 board only use the Cortex-A53 CPU, which
is only available in the 64-bit build. It is pointless to
have this board present in the 32-bit build where this CPU
is not available.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
Cc: Alistair Francis <alistair@alistair23.me>
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
---
 hw/arm/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/meson.build b/hw/arm/meson.build
index 059ff7382f2..345099f5a1b 100644
--- a/hw/arm/meson.build
+++ b/hw/arm/meson.build
@@ -41,7 +41,7 @@
 arm_ss.add(when: 'CONFIG_RASPI', if_true: files('bcm2835_peripherals.c', 'bcm2836.c', 'raspi.c'))
 arm_ss.add(when: 'CONFIG_STM32F205_SOC', if_true: files('stm32f205_soc.c'))
 arm_ss.add(when: 'CONFIG_STM32F405_SOC', if_true: files('stm32f405_soc.c'))
-arm_ss.add(when: 'CONFIG_XLNX_ZYNQMP_ARM', if_true: files('xlnx-zynqmp.c', 'xlnx-zcu102.c'))
+arm_ss.add(when: ['CONFIG_XLNX_ZYNQMP_ARM', 'TARGET_AARCH64'], if_true: files('xlnx-zynqmp.c', 'xlnx-zcu102.c'))
 arm_ss.add(when: 'CONFIG_XLNX_VERSAL', if_true: files('xlnx-versal.c', 'xlnx-versal-virt.c'))
 arm_ss.add(when: 'CONFIG_FSL_IMX25', if_true: files('fsl-imx25.c', 'imx25_pdk.c'))
 arm_ss.add(when: 'CONFIG_FSL_IMX31', if_true: files('fsl-imx31.c', 'kzm.c'))
-- 
2.26.2


