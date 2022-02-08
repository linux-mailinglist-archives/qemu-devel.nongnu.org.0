Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50DFF4AD9F0
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 14:33:24 +0100 (CET)
Received: from localhost ([::1]:49958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHQcU-0002ng-VR
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 08:33:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHOql-0000iM-36
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 06:40:00 -0500
Received: from [2a00:1450:4864:20::430] (port=41976
 helo=mail-wr1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHOqh-00023S-0p
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 06:39:57 -0500
Received: by mail-wr1-x430.google.com with SMTP id k1so13650039wrd.8
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 03:39:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=X7Rrh0lJtSWpmXtO87Kz9MGXWLKHe7DJRwFSr69atlE=;
 b=kWJQ51ZtR1/s4ah01VjGOREvddz7LouFkvIc+xMZkJuBUJRyWg7Aj6kvQdM53lUISk
 5aLwPgfTbotqEKj8zHp40+H0mOT8s99OHdunuqshaXnrzc7XT+qvO7PkFaGmu0oAmYnB
 CZT9l7x1J5alAkZttSUiq0RgeDul6Wr1enTcsURQu6ki1C9WHiByNua7HdeZgsuPCQL/
 c5LgvKC0OOnP9VPnky7n9iOXRw+dZPIDK8AXsIOqFuCEbPTu/3svArvKMkKRM4WHvYXt
 Ii+t8IReG5RpzZzJE7mqAa2BYiNkuZZE/NI7Bcq8E8IZB4QbfpqlYHQo5s//kyoomqki
 /TLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=X7Rrh0lJtSWpmXtO87Kz9MGXWLKHe7DJRwFSr69atlE=;
 b=sC1e0hujUZuZelKr5xn0ZrtwuuoQmJNsXBiWqLHl+qyTq+YLlvdRGyOeazGlB2b7lz
 N1F6IqYq6MDhjOIC1zGQX6IPDesgf8EnpXWcak+ROqelU9rA6mzc3iOEEz4rAFWCWebN
 s+1kPZNmx8W6hjKGd4eQV62ZCJExa/VpSF8Vm1f8FDpYRGTMiDt1AagsAa7XkAiwnszM
 Eo+IqQMDsj4UbR9lJmBlzWXA4bcPAXNxsfoJNoo6rwwA8g5NB19e8oqIYLx5JOeTOQyH
 c1FLyKxY2w0Va1Dv6wQzJX+ecJbJps3bvvwNzboM4jWFBeA1FxoiyK5JsZpvw0o8N/IG
 nP+A==
X-Gm-Message-State: AOAM530I69DDlZO0CCgqziOVeevkPe7I6WYJv6TnWyMdprUwbaGhGZ+/
 OqCZiqZArwbBuk7/siLQDhr/TJGplBGmBA==
X-Google-Smtp-Source: ABdhPJxd6p4nJ0tk/FuYSbQ2/IoqCviZVuDtBoan4KcWEQIGIWCLu5sgsxLG7CVj6X1OnpB43OZKiA==
X-Received: by 2002:a5d:64e9:: with SMTP id g9mr3209166wri.341.1644320390588; 
 Tue, 08 Feb 2022 03:39:50 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id r11sm4245199wrt.28.2022.02.08.03.39.49
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 03:39:50 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 00/39] target-arm queue
Date: Tue,  8 Feb 2022 11:39:09 +0000
Message-Id: <20220208113948.3217356-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::430
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 55ef0b702bc2c90c3c4ed97f97676d8f139e5ca1:

  Merge remote-tracking branch 'remotes/lvivier-gitlab/tags/linux-user-for-7.0-pull-request' into staging (2022-02-07 10:48:25 +0000)

are available in the Git repository at:

  https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20220208

for you to fetch changes up to 4fd1ebb10593087d45d2f56f7f3d13447d24802c:

  hw/sensor: Add lsm303dlhc magnetometer device (2022-02-08 10:56:29 +0000)

----------------------------------------------------------------
target-arm queue:
 * Fix handling of SVE ZCR_LEN when using VHE
 * xlnx-zynqmp: 'Or' the QSPI / QSPI DMA IRQs
 * Don't ever enable PSCI when booting guest in EL3
 * Adhere to SMCCC 1.3 section 5.2
 * highbank: Fix issues with booting SMP
 * midway: Fix issues booting at all
 * boot: Drop existing dtb /psci node rather than retaining it
 * versal-virt: Always call arm_load_kernel()
 * force flag recalculation when messing with DAIF
 * hw/timer/armv7m_systick: Update clock source before enabling timer
 * hw/arm/smmuv3: Fix device reset
 * hw/intc/arm_gicv3_its: refactorings and minor bug fixes
 * hw/sensor: Add lsm303dlhc magnetometer device

----------------------------------------------------------------
Alex Bennée (1):
      arm: force flag recalculation when messing with DAIF

Edgar E. Iglesias (1):
      hw/arm: versal-virt: Always call arm_load_kernel()

Eric Auger (1):
      hw/arm/smmuv3: Fix device reset

Francisco Iglesias (1):
      hw/arm/xlnx-zynqmp: 'Or' the QSPI / QSPI DMA IRQs

Kevin Townsend (1):
      hw/sensor: Add lsm303dlhc magnetometer device

Peter Maydell (29):
      target/arm: make psci-conduit settable after realize
      cpu.c: Make start-powered-off settable after realize
      hw/arm/boot: Support setting psci-conduit based on guest EL
      hw/arm: imx: Don't enable PSCI conduit when booting guest in EL3
      hw/arm: allwinner: Don't enable PSCI conduit when booting guest in EL3
      hw/arm/xlnx-zcu102: Don't enable PSCI conduit when booting guest in EL3
      hw/arm/versal: Let boot.c handle PSCI enablement
      hw/arm/virt: Let boot.c handle PSCI enablement
      hw/arm: highbank: For EL3 guests, don't enable PSCI, start all cores
      arm: tcg: Adhere to SMCCC 1.3 section 5.2
      hw/arm/highbank: Drop use of secure_board_setup
      hw/arm/boot: Prevent setting both psci_conduit and secure_board_setup
      hw/arm/boot: Don't write secondary boot stub if using PSCI
      hw/arm/highbank: Drop unused secondary boot stub code
      hw/arm/boot: Drop nb_cpus field from arm_boot_info
      hw/arm/boot: Drop existing dtb /psci node rather than retaining it
      hw/intc/arm_gicv3_its: Use address_space_map() to access command queue packets
      hw/intc/arm_gicv3_its: Keep DTEs as a struct, not a raw uint64_t
      hw/intc/arm_gicv3_its: Pass DTEntry to update_dte()
      hw/intc/arm_gicv3_its: Keep CTEs as a struct, not a raw uint64_t
      hw/intc/arm_gicv3_its: Pass CTEntry to update_cte()
      hw/intc/arm_gicv3_its: Fix address calculation in get_ite() and update_ite()
      hw/intc/arm_gicv3_its: Avoid nested ifs in get_ite()
      hw/intc/arm_gicv3_its: Pass ITE values back from get_ite() via a struct
      hw/intc/arm_gicv3_its: Make update_ite() use ITEntry
      hw/intc/arm_gicv3_its: Drop TableDesc and CmdQDesc valid fields
      hw/intc/arm_gicv3_its: In MAPC with V=0, don't check rdbase field
      hw/intc/arm_gicv3_its: Don't allow intid 1023 in MAPI/MAPTI
      hw/intc/arm_gicv3_its: Split error checks

Richard Henderson (4):
      target/arm: Fix sve_zcr_len_for_el for VHE mode running
      target/arm: Tidy sve_exception_el for CPACR_EL1 access
      target/arm: Fix {fp, sve}_exception_el for VHE mode running
      target/arm: Use CPTR_TFP with CPTR_EL3 in fp_exception_el

Richard Petri (1):
      hw/timer/armv7m_systick: Update clock source before enabling timer

 hw/intc/gicv3_internal.h               |  23 +-
 include/hw/arm/boot.h                  |  14 +-
 include/hw/arm/xlnx-versal.h           |   1 -
 include/hw/arm/xlnx-zynqmp.h           |   2 +
 include/hw/intc/arm_gicv3_its_common.h |   2 -
 cpu.c                                  |  22 +-
 hw/arm/allwinner-h3.c                  |   9 +-
 hw/arm/aspeed.c                        |   1 -
 hw/arm/boot.c                          | 107 ++++-
 hw/arm/exynos4_boards.c                |   1 -
 hw/arm/fsl-imx6ul.c                    |   2 -
 hw/arm/fsl-imx7.c                      |   8 +-
 hw/arm/highbank.c                      |  72 +---
 hw/arm/imx25_pdk.c                     |   3 +-
 hw/arm/kzm.c                           |   1 -
 hw/arm/mcimx6ul-evk.c                  |   2 +-
 hw/arm/mcimx7d-sabre.c                 |   2 +-
 hw/arm/npcm7xx.c                       |   3 -
 hw/arm/orangepi.c                      |   5 +-
 hw/arm/raspi.c                         |   1 -
 hw/arm/realview.c                      |   1 -
 hw/arm/sabrelite.c                     |   1 -
 hw/arm/sbsa-ref.c                      |   1 -
 hw/arm/smmuv3.c                        |   6 +
 hw/arm/vexpress.c                      |   1 -
 hw/arm/virt.c                          |  13 +-
 hw/arm/xilinx_zynq.c                   |   1 -
 hw/arm/xlnx-versal-virt.c              |  17 +-
 hw/arm/xlnx-versal.c                   |   5 +-
 hw/arm/xlnx-zcu102.c                   |   1 +
 hw/arm/xlnx-zynqmp.c                   |  25 +-
 hw/intc/arm_gicv3_its.c                | 696 +++++++++++++++------------------
 hw/sensor/lsm303dlhc_mag.c             | 556 ++++++++++++++++++++++++++
 hw/timer/armv7m_systick.c              |   8 +-
 target/arm/cpu.c                       |   6 +-
 target/arm/helper-a64.c                |   2 +
 target/arm/helper.c                    | 118 ++++--
 target/arm/psci.c                      |  35 +-
 tests/qtest/lsm303dlhc-mag-test.c      | 148 +++++++
 hw/sensor/Kconfig                      |   4 +
 hw/sensor/meson.build                  |   1 +
 tests/qtest/meson.build                |   1 +
 42 files changed, 1308 insertions(+), 620 deletions(-)
 create mode 100644 hw/sensor/lsm303dlhc_mag.c
 create mode 100644 tests/qtest/lsm303dlhc-mag-test.c

