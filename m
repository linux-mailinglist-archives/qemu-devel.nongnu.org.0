Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3EC866471B
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 18:15:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFHkY-00047S-NT; Tue, 10 Jan 2023 11:45:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFHk4-00043r-6Q
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 11:44:52 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFHk2-0006E9-AC
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 11:44:51 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 i17-20020a05600c355100b003d99434b1cfso10569516wmq.1
 for <qemu-devel@nongnu.org>; Tue, 10 Jan 2023 08:44:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U5AzzHmUwF9EkYU4+2STuaeBR+wnyLjuTzOXCdKeZuQ=;
 b=wTQbab7mRQhcSOmQh1COeTtP/GWmQ0o0ir81b5S3ZSMJ2Ixun3ligJWPjC9uBhyJgh
 3lBLT6SVDa8KxQv5lUt+eD2Ol1zI44zI8W/DhWA61qrFhre9DFEYtMDS6Qe1R4qQLsUH
 OiJj7zrC+P/A/N9AoGDP3mVR01//aG1rP/8kJ/9QP4ZylUauM4pWN/+7GPwhdYEo/hgr
 B0iGXPAY0eFccA9CD0nABz2gBX2EcJVrg2Kcx9tThFKBIuLto59oVNAn0P8S3j4FOB5E
 aAbZkcVs6Iyw0kREkUx/fwAhdakQeIFduSVhq8w8fRBqLkoOPW4YYdjH+NnCAv+lwviV
 Y2bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=U5AzzHmUwF9EkYU4+2STuaeBR+wnyLjuTzOXCdKeZuQ=;
 b=20gdOtw06oS1GDwoGs5tiunPijPzrw+yeG0f0pnUvCq6j30B/yhDqHfiG3+4am3SX2
 5LK+fwcwv6ldSQCeMxY/OTlr/kWk81vpQW6jhxUPJo5FiB01mXi8LobGbLcm/wTqomkr
 VzFEowhlnaI0rB0sGXZKA4npjtDEx3MMYNYM3bbZme82DcV1icqj18aSptnbi4q6OPgS
 bIYabm/5KQxgRw+nZe8+k4vr5jeQCzYATx9dEttBBqbqgUpS7ZVBEa7p6fvkVmg22KJp
 KTf0WYFatClVg04hr80BKChZ8o9+oLmNfa9bx6cCNCqmFLserwYE6xOh26g+v6zN2Efk
 kWEA==
X-Gm-Message-State: AFqh2krVJ/LYcXQostFQC8eRs5WWb+CgZoJonOutPuolwx068ajWI3DZ
 Kd6jjilnIyktFUNwZeSJ4xDG6FzMkP1mfncw
X-Google-Smtp-Source: AMrXdXtODRXbYbrAiiUNuV9W19oduQLd+MPYCTxNso1bNsLjnfkMPUa8M04sLGYtSiNW5me9qNUQSQ==
X-Received: by 2002:a05:600c:3844:b0:3d2:191d:2420 with SMTP id
 s4-20020a05600c384400b003d2191d2420mr50736477wmr.7.1673369088850; 
 Tue, 10 Jan 2023 08:44:48 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 i8-20020a05600c354800b003cf894dbc4fsm16720914wmq.25.2023.01.10.08.44.47
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 10 Jan 2023 08:44:48 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: ale@rev.ng, Andrey Smirnov <andrew.smirnov@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Niek Linnenbank <nieklinnenbank@gmail.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Antonio Caggiano <antonio.caggiano@collabora.com>,
 Rob Herring <robh@kernel.org>, Antony Pavlov <antonynpavlov@gmail.com>,
 Jan Kiszka <jan.kiszka@web.de>, Beniamino Galvani <b.galvani@gmail.com>
Subject: [PATCH 07/18] hw/arm: Move more units to softmmu_ss[]
Date: Tue, 10 Jan 2023 17:43:55 +0100
Message-Id: <20230110164406.94366-8-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230110164406.94366-1-philmd@linaro.org>
References: <20230110164406.94366-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The following units don't require "target/arm/cpu.h":

 - collie.c
 - gumstix.c
 - omap_sx1.c
 - z2.c

Once the header removed, we can move the units from
meson's arm_ss[] to softmmu_ss[] to build them once.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/collie.c    | 1 -
 hw/arm/gumstix.c   | 1 -
 hw/arm/meson.build | 8 ++++----
 hw/arm/omap_sx1.c  | 1 -
 hw/arm/z2.c        | 1 -
 5 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/hw/arm/collie.c b/hw/arm/collie.c
index 9edff59370..a4576feff0 100644
--- a/hw/arm/collie.c
+++ b/hw/arm/collie.c
@@ -17,7 +17,6 @@
 #include "hw/arm/boot.h"
 #include "hw/block/flash.h"
 #include "exec/address-spaces.h"
-#include "cpu.h"
 #include "qom/object.h"
 
 #define RAM_SIZE            (512 * MiB)
diff --git a/hw/arm/gumstix.c b/hw/arm/gumstix.c
index 2ca4140c9f..3f2bcaa24e 100644
--- a/hw/arm/gumstix.c
+++ b/hw/arm/gumstix.c
@@ -44,7 +44,6 @@
 #include "hw/boards.h"
 #include "exec/address-spaces.h"
 #include "sysemu/qtest.h"
-#include "cpu.h"
 
 #define CONNEX_FLASH_SIZE   (16 * MiB)
 #define CONNEX_RAM_SIZE     (64 * MiB)
diff --git a/hw/arm/meson.build b/hw/arm/meson.build
index 4babaa8dfc..7c71798661 100644
--- a/hw/arm/meson.build
+++ b/hw/arm/meson.build
@@ -13,16 +13,12 @@ arm_ss.add(when: 'CONFIG_NETDUINO2', if_true: files('netduino2.c'))
 arm_ss.add(when: 'CONFIG_NETDUINOPLUS2', if_true: files('netduinoplus2.c'))
 arm_ss.add(when: 'CONFIG_NPCM7XX', if_true: files('npcm7xx.c', 'npcm7xx_boards.c'))
 arm_ss.add(when: 'CONFIG_NSERIES', if_true: files('nseries.c'))
-arm_ss.add(when: 'CONFIG_SX1', if_true: files('omap_sx1.c'))
 arm_ss.add(when: 'CONFIG_CHEETAH', if_true: files('palm.c'))
-arm_ss.add(when: 'CONFIG_GUMSTIX', if_true: files('gumstix.c'))
 arm_ss.add(when: 'CONFIG_SPITZ', if_true: files('spitz.c'))
-arm_ss.add(when: 'CONFIG_Z2', if_true: files('z2.c'))
 arm_ss.add(when: 'CONFIG_REALVIEW', if_true: files('realview.c'))
 arm_ss.add(when: 'CONFIG_SBSA_REF', if_true: files('sbsa-ref.c'))
 arm_ss.add(when: 'CONFIG_STELLARIS', if_true: files('stellaris.c'))
 arm_ss.add(when: 'CONFIG_STM32VLDISCOVERY', if_true: files('stm32vldiscovery.c'))
-arm_ss.add(when: 'CONFIG_COLLIE', if_true: files('collie.c'))
 arm_ss.add(when: 'CONFIG_VERSATILE', if_true: files('versatilepb.c'))
 arm_ss.add(when: 'CONFIG_VEXPRESS', if_true: files('vexpress.c'))
 arm_ss.add(when: 'CONFIG_ZYNQ', if_true: files('xilinx_zynq.c'))
@@ -62,8 +58,12 @@ arm_ss.add(when: 'CONFIG_FSL_IMX6UL', if_true: files('fsl-imx6ul.c', 'mcimx6ul-e
 arm_ss.add(when: 'CONFIG_NRF51_SOC', if_true: files('nrf51_soc.c'))
 
 softmmu_ss.add(when: 'CONFIG_ARM_SMMUV3', if_true: files('smmu-common.c'))
+softmmu_ss.add(when: 'CONFIG_COLLIE', if_true: files('collie.c'))
 softmmu_ss.add(when: 'CONFIG_EXYNOS4', if_true: files('exynos4_boards.c'))
+softmmu_ss.add(when: 'CONFIG_GUMSTIX', if_true: files('gumstix.c'))
 softmmu_ss.add(when: 'CONFIG_RASPI', if_true: files('bcm2835_peripherals.c'))
+softmmu_ss.add(when: 'CONFIG_SX1', if_true: files('omap_sx1.c'))
 softmmu_ss.add(when: 'CONFIG_TOSA', if_true: files('tosa.c'))
+softmmu_ss.add(when: 'CONFIG_Z2', if_true: files('z2.c'))
 
 hw_arch += {'arm': arm_ss}
diff --git a/hw/arm/omap_sx1.c b/hw/arm/omap_sx1.c
index 1d156bc344..c7ddc90d02 100644
--- a/hw/arm/omap_sx1.c
+++ b/hw/arm/omap_sx1.c
@@ -35,7 +35,6 @@
 #include "hw/block/flash.h"
 #include "sysemu/qtest.h"
 #include "exec/address-spaces.h"
-#include "cpu.h"
 #include "qemu/cutils.h"
 
 /*****************************************************************************/
diff --git a/hw/arm/z2.c b/hw/arm/z2.c
index dc25304290..610f3b5a0f 100644
--- a/hw/arm/z2.c
+++ b/hw/arm/z2.c
@@ -25,7 +25,6 @@
 #include "hw/audio/wm8750.h"
 #include "audio/audio.h"
 #include "exec/address-spaces.h"
-#include "cpu.h"
 #include "qom/object.h"
 
 #ifdef DEBUG_Z2
-- 
2.38.1


