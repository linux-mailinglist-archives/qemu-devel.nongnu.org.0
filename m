Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73D5C3C2756
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 18:12:36 +0200 (CEST)
Received: from localhost ([::1]:56466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1t7D-0004D4-6z
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 12:12:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m1t4q-0001Lq-Lu
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 12:10:08 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:35480)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m1t4o-0000rr-GF
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 12:10:08 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 k31-20020a05600c1c9fb029021727d66d33so5114672wms.0
 for <qemu-devel@nongnu.org>; Fri, 09 Jul 2021 09:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kr/lbO1PAw28PCMs3Qo5xaeTfc8vtO9VXvSysNR5pvg=;
 b=YOiJwwNvQddtCiX5rR1TyacjeW0LtC09ZPQNDN3C/GHBENFImn8KOEbWAyS3oVClNN
 NQgaw+SyWiUpchNaPzY9Ea/mfJRzJClfd2hehl0xhVuBviLnx+V63ueOT5fz83p+sSlM
 bJ6F0C8BrJO5NzDbQKDq2ClzIRO/Aobb3/P44ynJnJ496nHbb+2aQXa+Xh9Belkv1ehJ
 r5CpdpixP4cQVwLH1YNN7R/QxVFeZbRkJC6YPApcwz2032p1IdEy8WIX75HT8AyZpeDx
 jpbG8J3jUwF/aRi2paBNqbs5rUUpt78Nv/jJL1c+Nt5i+kOR+LnBYE5hiRHV1ScF6Ca4
 IHHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kr/lbO1PAw28PCMs3Qo5xaeTfc8vtO9VXvSysNR5pvg=;
 b=Fa7aYk559KtxjOvGt7vInc/inOPJw7xkokiyuaM8YWyPJ8C0fUT4JIuBxMKAWEnJq7
 JwqTRNFSmmHA8LmKH7b4+Jyb40uCqMTq7/b/J6PhmW0cjdgs9LypzDutogleG6IUWLho
 LNU6MnxSeCVL9LvL2D2LFCQh8rpNNt0JhSSeknI+C80SkDz4ni0JPfjCVc87Xa0jz/iZ
 C7fy/YBAz3xN4tUHoZmVBUF4IauJ3sTzzmFMxQ8Sr+knFoNRNCd3jRIG27nGE0P6FX2n
 Tu3joeQ1b1r+ETwno4itJgIg7tEih9uF6LdWdoNCDP5R6tSMCoxjJ/LUeo/clnE0EqZO
 1TCg==
X-Gm-Message-State: AOAM5302EMsBUYiSsqOe/+vKg5fIu3EJPZGMByJlM/TtLMD0e034p71b
 6dqBBY6ctghvXWuGjp8ruk3s5GHxxZkRPXAf
X-Google-Smtp-Source: ABdhPJzKGdFF5WqWwdNle6fHi41ms/KTjlV3QLQ77UgfHgcGqR4lUBHaXLXsAD6iviXKL0958rf65w==
X-Received: by 2002:a7b:c8d2:: with SMTP id f18mr7290205wml.135.1625847005013; 
 Fri, 09 Jul 2021 09:10:05 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id x19sm5232277wmi.10.2021.07.09.09.10.04
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jul 2021 09:10:04 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 00/17] target-arm queue
Date: Fri,  9 Jul 2021 17:09:46 +0100
Message-Id: <20210709161003.25874-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
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

Arm changes for before softfreeze: mostly my PL061/GPIO patches,
but also a new M-profile board and various other things.

thanks
-- PMM

The following changes since commit 05de778b5b8ab0b402996769117b88c7ea5c7c61:

  Merge remote-tracking branch 'remotes/mst/tags/for_upstream' into staging (2021-07-09 14:30:01 +0100)

are available in the Git repository at:

  https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20210709

for you to fetch changes up to 05449abb1d4c5f0c69ceb3d8d03cbc75de39b646:

  hw/intc: Improve formatting of MEMTX_ERROR guest error message (2021-07-09 16:09:12 +0100)

----------------------------------------------------------------
target-arm queue:
 * New machine type: stm32vldiscovery
 * hw/intc/arm_gicv3_cpuif: Fix virtual irq number check in icv_[dir|eoir]_write
 * hw/gpio/pl061: Honour Luminary PL061 PUR and PDR registers
 * virt: Fix implementation of GPIO-based powerdown/shutdown mechanism
 * Correct the encoding of MDCCSR_EL0 and DBGDSCRint
 * hw/intc: Improve formatting of MEMTX_ERROR guest error message

----------------------------------------------------------------
Alexandre Iooss (4):
      stm32f100: Add the stm32f100 SoC
      stm32vldiscovery: Add the STM32VLDISCOVERY Machine
      docs/system: arm: Add stm32 boards description
      tests/boot-serial-test: Add STM32VLDISCOVERY board testcase

Peter Maydell (10):
      hw/gpio/pl061: Convert DPRINTF to tracepoints
      hw/gpio/pl061: Clean up read/write offset handling logic
      hw/gpio/pl061: Add tracepoints for register read and write
      hw/gpio/pl061: Document the interface of this device
      hw/gpio/pl061: Honour Luminary PL061 PUR and PDR registers
      hw/gpio/pl061: Make pullup/pulldown of outputs configurable
      hw/arm/virt: Make PL061 GPIO lines pulled low, not high
      hw/gpio/pl061: Convert to 3-phase reset and assert GPIO lines correctly on reset
      hw/gpio/pl061: Document a shortcoming in our implementation
      hw/arm/stellaris: Expand comment about handling of OLED chipselect

Rebecca Cran (1):
      hw/intc: Improve formatting of MEMTX_ERROR guest error message

Ricardo Koller (1):
      hw/intc/arm_gicv3_cpuif: Fix virtual irq number check in icv_[dir|eoir]_write

hnick@vmware.com (1):
      target/arm: Correct the encoding of MDCCSR_EL0 and DBGDSCRint

 docs/system/arm/stm32.rst               |  66 +++++++
 docs/system/target-arm.rst              |   1 +
 default-configs/devices/arm-softmmu.mak |   1 +
 include/hw/arm/stm32f100_soc.h          |  57 ++++++
 hw/arm/stellaris.c                      |  56 +++++-
 hw/arm/stm32f100_soc.c                  | 182 +++++++++++++++++
 hw/arm/stm32vldiscovery.c               |  66 +++++++
 hw/arm/virt.c                           |   3 +
 hw/gpio/pl061.c                         | 341 +++++++++++++++++++++++++-------
 hw/intc/arm_gicv3_cpuif.c               |   4 +-
 hw/intc/arm_gicv3_redist.c              |   4 +-
 target/arm/helper.c                     |  16 +-
 tests/qtest/boot-serial-test.c          |  37 ++++
 MAINTAINERS                             |  13 ++
 hw/arm/Kconfig                          |  10 +
 hw/arm/meson.build                      |   2 +
 hw/gpio/trace-events                    |   9 +
 17 files changed, 790 insertions(+), 78 deletions(-)
 create mode 100644 docs/system/arm/stm32.rst
 create mode 100644 include/hw/arm/stm32f100_soc.h
 create mode 100644 hw/arm/stm32f100_soc.c
 create mode 100644 hw/arm/stm32vldiscovery.c

