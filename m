Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A08B72AD4D3
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 12:24:12 +0100 (CET)
Received: from localhost ([::1]:33314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcRkx-0007Ew-Ks
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 06:24:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kcRgP-0001re-8Z
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 06:19:29 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:53992)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kcRgI-0006mo-DE
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 06:19:28 -0500
Received: by mail-wm1-x335.google.com with SMTP id p22so2616086wmg.3
 for <qemu-devel@nongnu.org>; Tue, 10 Nov 2020 03:19:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=V0KpZX+u3JdqrN8N6AtrT0Dx53wX3a7rGNDgTvFUP8g=;
 b=byMGR3jAk3ShKMiS8WKG2cKN7uj6YAUlQEH+jWvUltnS+mSMPYSnthqmQg1I4aitUR
 ghgH/bu3OPaJ0W3IkCwp1/Kn4d0EfQC8FZv0vDqAQjPR1RJZNksH7l0dN445wSL3hYBl
 RDcD/dJNV7R+PiuEEULXXtxc+hr+/1HaSxDATdds/CafOIH2XPptCrNdY/JO4XyzziVy
 iSewTL87AYRfZjsM5GV0VQxrZSFMxty18lpy2oXgmMHV5iE7DnSqYfiBT4kmzN1PBjXc
 JN206p5DXJ5Ke/imCo8UBPTanDyqx91Hri6/Qo4xGTr8Wsms4b/WCFutbHWN+BdWV+89
 5jOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=V0KpZX+u3JdqrN8N6AtrT0Dx53wX3a7rGNDgTvFUP8g=;
 b=iUYTbL4fDX/5J0+j2BvtrQUy8JaOydYWKWd0XguWLIA+dmq0akd3IA+26fXVgjgcgw
 qnmKwztBsITa1rWIqw4RGBjZFxs9PUrx3qah4yyTkjPEgnC3EQ/uMr+Zk3orEoJtnzG6
 CWIF31iU6gz9mQBKu3E83MXtQoMLQyQHCnBTF9R87eJo+YnZ24pleHcIDVumU60SpGAj
 wy5AhpAtf1d6PJBAzknZa1Igv8mqZESjS7Ps7Va0M6xOk5RigogMvb5ClAnt9BsnSAyF
 R45kDaYGAUwAKTu4FMns46l9Ww2N8ngnxsKx9svvXQgcNQBhBWPOMf+0rpPmaqj/e+OK
 ZdoA==
X-Gm-Message-State: AOAM530HlP1jInvvFfllgqcGHRLKZCUOO3z8Bu5aYQenbffk7oENbwO2
 SkGLiQX5P+d1Oi0RK7QUF8bwjbYQSoc8Ww==
X-Google-Smtp-Source: ABdhPJxD1dQe1mSufWXKS9uMpiLMtAvQD57rOq+8X+ttjAhO1jp9QqbhpMRPQjN2IceIIF0CFiVURA==
X-Received: by 2002:a7b:c5c3:: with SMTP id n3mr4116253wmk.44.1605007160217;
 Tue, 10 Nov 2020 03:19:20 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id 109sm16909498wra.29.2020.11.10.03.19.19
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 03:19:19 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 00/16] target-arm queue
Date: Tue, 10 Nov 2020 11:19:01 +0000
Message-Id: <20201110111917.29539-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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

Patches for rc1: nothing major, just some minor bugfixes and
code cleanups.

-- PMM

The following changes since commit f7e1914adad8885a5d4c70239ab90d901ed97e9f:

  Merge remote-tracking branch 'remotes/alistair/tags/pull-riscv-to-apply-20201109' into staging (2020-11-10 09:24:56 +0000)

are available in the Git repository at:

  https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20201110

for you to fetch changes up to b6c56c8a9a4064ea783f352f43c5df6231a110fa:

  target/arm/translate-neon.c: Handle VTBL UNDEF case before VFP access check (2020-11-10 11:03:48 +0000)

----------------------------------------------------------------
target-arm queue:
 * hw/arm/Kconfig: ARM_V7M depends on PTIMER
 * Minor coding style fixes
 * docs: add some notes on the sbsa-ref machine
 * hw/arm/virt: Remove dependency on Cortex-A15 MPCore peripherals
 * target/arm: Fix neon VTBL/VTBX for len > 1
 * hw/arm/armsse: Correct expansion MPC interrupt lines
 * hw/misc/stm32f2xx_syscfg: Remove extraneous IRQ
 * hw/arm/nseries: Remove invalid/unnecessary n8x0_uart_setup()
 * hw/arm/musicpal: Don't connect two qemu_irqs directly to the same input
 * hw/arm/musicpal: Only use qdev_get_gpio_in() when necessary
 * hw/arm/nseries: Check return value from load_image_targphys()
 * tests/qtest/npcm7xx_rng-test: count runs properly
 * target/arm/translate-neon.c: Handle VTBL UNDEF case before VFP access check

----------------------------------------------------------------
Alex Bennée (1):
      docs: add some notes on the sbsa-ref machine

AlexChen (1):
      ssi: Fix bad printf format specifiers

Andrew Jones (1):
      hw/arm/Kconfig: ARM_V7M depends on PTIMER

Havard Skinnemoen (1):
      tests/qtest/npcm7xx_rng-test: count runs properly

Peter Maydell (2):
      hw/arm/nseries: Check return value from load_image_targphys()
      target/arm/translate-neon.c: Handle VTBL UNDEF case before VFP access check

Philippe Mathieu-Daudé (6):
      hw/arm/virt: Remove dependency on Cortex-A15 MPCore peripherals
      hw/arm/armsse: Correct expansion MPC interrupt lines
      hw/misc/stm32f2xx_syscfg: Remove extraneous IRQ
      hw/arm/nseries: Remove invalid/unnecessary n8x0_uart_setup()
      hw/arm/musicpal: Don't connect two qemu_irqs directly to the same input
      hw/arm/musicpal: Only use qdev_get_gpio_in() when necessary

Richard Henderson (1):
      target/arm: Fix neon VTBL/VTBX for len > 1

Xinhao Zhang (3):
      target/arm: add spaces around operator
      target/arm: Don't use '#' flag of printf format
      target/arm: add space before the open parenthesis '('

 docs/system/arm/sbsa.rst           | 32 ++++++++++++++++++++++
 docs/system/target-arm.rst         |  1 +
 include/hw/misc/stm32f2xx_syscfg.h |  2 --
 target/arm/helper.h                |  2 +-
 hw/arm/armsse.c                    |  3 +-
 hw/arm/musicpal.c                  | 40 +++++++++++++++++----------
 hw/arm/nseries.c                   | 26 ++++++++----------
 hw/arm/stm32f205_soc.c             |  1 -
 hw/misc/stm32f2xx_syscfg.c         |  2 --
 hw/ssi/imx_spi.c                   |  2 +-
 hw/ssi/xilinx_spi.c                |  2 +-
 target/arm/arch_dump.c             |  8 +++---
 target/arm/arm-semi.c              |  8 +++---
 target/arm/helper.c                |  2 +-
 target/arm/op_helper.c             | 23 +++++++++-------
 target/arm/translate-a64.c         |  4 +--
 target/arm/translate.c             |  2 +-
 tests/qtest/npcm7xx_rng-test.c     |  2 +-
 hw/arm/Kconfig                     |  3 +-
 target/arm/translate-neon.c.inc    | 56 ++++++++++++++------------------------
 20 files changed, 123 insertions(+), 98 deletions(-)
 create mode 100644 docs/system/arm/sbsa.rst

