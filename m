Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E42D1334AEB
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 23:05:37 +0100 (CET)
Received: from localhost ([::1]:40366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK6xU-0001ak-Cb
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 17:05:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lK6eC-0003HS-1w; Wed, 10 Mar 2021 16:45:40 -0500
Received: from mout.kundenserver.de ([212.227.17.24]:49075)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lK6e5-0004U9-F2; Wed, 10 Mar 2021 16:45:39 -0500
Received: from localhost.localdomain ([82.142.6.26]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MvJjz-1lbdOZ3OYz-00rIq1; Wed, 10 Mar 2021 22:45:27 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 19/22] hw/lm32/Kconfig: Rename CONFIG_LM32 ->
 CONFIG_LM32_DEVICES
Date: Wed, 10 Mar 2021 22:45:01 +0100
Message-Id: <20210310214504.1183162-20-laurent@vivier.eu>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210310214504.1183162-1-laurent@vivier.eu>
References: <20210310214504.1183162-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:a9WCaY+0nvu/siBpDQeu07bMY23HpZ82qMlhDL0DD15lHCKf26Y
 Ycxgs7YNoAck2yRBceJSlSWLynUrwfrMbZI2t+00bka1WrG/P368kEYBvnrWQ2xobKO/GvE
 pJuqmglK0Xy3YVPqOpCCh9k0mQTEjcnWxmI0lqO1YMADbHfBYxaataVBtEP2yIcQ6hjhELM
 uuFOc4X+2SnSqNZMZUp3g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:fHakgi4e9bI=:nlkfbfy90gpCYDMgQnHDUl
 cpI0hFdbcXwiA2G951mP9JA1X09Bm0sT3KTVuonI2TtLsK3t+drCozHLBeOst5faesF2CXmMA
 IVxB6FcvADbDOiSz71cvz5oY0uS6RkfoUYzTLkpH4SNGchsAQhY9cKVa6ZMRLZtaXRpzObxTd
 0LKYppgMPJ6M5DNM+XY9vwpKxpbFFkgj44/zELViqEs4WthAqsl8HrRMHNoj8jq1xrI1E7vAt
 vklxdLufM+zktPiIPE3WdDWzHFNMDhcY+tN54XXBfMAG91z2oGCWQXltjEpfbtYwzsr/MbhzU
 +WP57N+/OdXzaPTVATfe8iBcBrU9wm8X96bi25agglpv9G33sbwbRP7fzpA1aZvyUdZPTlj11
 8os/phRE0OHfQ2mnJj/QllR+bOfKv1/UfzmirzHYsALQDLz1PEhV48eoCGxi7bxRnN10ft1bR
 a3zQMmeiDA==
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

We want to be able to use the 'LM32' config for architecture
specific features. As CONFIG_LM32 is only used to select
peripherals, rename it CONFIG_LM32_DEVICES.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210221225626.2589247-3-f4bug@amsat.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/char/meson.build  | 4 ++--
 hw/intc/meson.build  | 2 +-
 hw/lm32/Kconfig      | 4 ++--
 hw/timer/meson.build | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/hw/char/meson.build b/hw/char/meson.build
index afe9a0af88c1..7ba38dbd965f 100644
--- a/hw/char/meson.build
+++ b/hw/char/meson.build
@@ -8,8 +8,8 @@ softmmu_ss.add(when: 'CONFIG_IMX', if_true: files('imx_serial.c'))
 softmmu_ss.add(when: 'CONFIG_IPACK', if_true: files('ipoctal232.c'))
 softmmu_ss.add(when: 'CONFIG_ISA_BUS', if_true: files('parallel-isa.c'))
 softmmu_ss.add(when: 'CONFIG_ISA_DEBUG', if_true: files('debugcon.c'))
-softmmu_ss.add(when: 'CONFIG_LM32', if_true: files('lm32_juart.c'))
-softmmu_ss.add(when: 'CONFIG_LM32', if_true: files('lm32_uart.c'))
+softmmu_ss.add(when: 'CONFIG_LM32_DEVICES', if_true: files('lm32_juart.c'))
+softmmu_ss.add(when: 'CONFIG_LM32_DEVICES', if_true: files('lm32_uart.c'))
 softmmu_ss.add(when: 'CONFIG_MILKYMIST', if_true: files('milkymist-uart.c'))
 softmmu_ss.add(when: 'CONFIG_NRF51_SOC', if_true: files('nrf51_uart.c'))
 softmmu_ss.add(when: 'CONFIG_PARALLEL', if_true: files('parallel.c'))
diff --git a/hw/intc/meson.build b/hw/intc/meson.build
index b3d9345a0d2e..8df3656419e3 100644
--- a/hw/intc/meson.build
+++ b/hw/intc/meson.build
@@ -14,7 +14,7 @@ softmmu_ss.add(when: 'CONFIG_HEATHROW_PIC', if_true: files('heathrow_pic.c'))
 softmmu_ss.add(when: 'CONFIG_I8259', if_true: files('i8259_common.c', 'i8259.c'))
 softmmu_ss.add(when: 'CONFIG_IMX', if_true: files('imx_avic.c', 'imx_gpcv2.c'))
 softmmu_ss.add(when: 'CONFIG_IOAPIC', if_true: files('ioapic_common.c'))
-softmmu_ss.add(when: 'CONFIG_LM32', if_true: files('lm32_pic.c'))
+softmmu_ss.add(when: 'CONFIG_LM32_DEVICES', if_true: files('lm32_pic.c'))
 softmmu_ss.add(when: 'CONFIG_OPENPIC', if_true: files('openpic.c'))
 softmmu_ss.add(when: 'CONFIG_PL190', if_true: files('pl190.c'))
 softmmu_ss.add(when: 'CONFIG_PUV3', if_true: files('puv3_intc.c'))
diff --git a/hw/lm32/Kconfig b/hw/lm32/Kconfig
index 20c36edc402c..518c84ed5084 100644
--- a/hw/lm32/Kconfig
+++ b/hw/lm32/Kconfig
@@ -1,4 +1,4 @@
-config LM32
+config LM32_DEVICES
     bool
     select PTIMER
 
@@ -14,5 +14,5 @@ config MILKYMIST
 
 config LM32_EVR
     bool
-    select LM32
+    select LM32_DEVICES
     select PFLASH_CFI02
diff --git a/hw/timer/meson.build b/hw/timer/meson.build
index 26c2701fd78f..a2372629f001 100644
--- a/hw/timer/meson.build
+++ b/hw/timer/meson.build
@@ -19,7 +19,7 @@ softmmu_ss.add(when: 'CONFIG_HPET', if_true: files('hpet.c'))
 softmmu_ss.add(when: 'CONFIG_I8254', if_true: files('i8254_common.c', 'i8254.c'))
 softmmu_ss.add(when: 'CONFIG_IMX', if_true: files('imx_epit.c'))
 softmmu_ss.add(when: 'CONFIG_IMX', if_true: files('imx_gpt.c'))
-softmmu_ss.add(when: 'CONFIG_LM32', if_true: files('lm32_timer.c'))
+softmmu_ss.add(when: 'CONFIG_LM32_DEVICES', if_true: files('lm32_timer.c'))
 softmmu_ss.add(when: 'CONFIG_MILKYMIST', if_true: files('milkymist-sysctl.c'))
 softmmu_ss.add(when: 'CONFIG_MIPS_CPS', if_true: files('mips_gictimer.c'))
 softmmu_ss.add(when: 'CONFIG_MSF2', if_true: files('mss-timer.c'))
-- 
2.29.2


