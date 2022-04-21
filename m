Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3614D509E76
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 13:23:05 +0200 (CEST)
Received: from localhost ([::1]:36988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhUts-0007ZU-8e
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 07:23:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhUpo-0002gA-LW
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 07:18:52 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:40641)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhUpm-0003Pu-Ka
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 07:18:52 -0400
Received: by mail-wr1-x432.google.com with SMTP id q3so6207298wrj.7
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 04:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uHYJs05JUgxiv/eX3VbdjcS7Fv0UiN0SN4hx/uh2t7M=;
 b=Fs2x0KcRF5XN1wBI2Mw7faPpw9VgABz3/9oJIbhHdY8s8BgRAZ/KxuJOtOi2X9HAjt
 kGT0Ysrg6xs/7BonBFknOC8PFVkVznG9irhCEntbxPwgIeDIhRbuwecMyXFK0Z9FfY2n
 7/YPSHfh3HvCMynyjnBw1Twwyzfm72wgkJ+EQxc4j15K7PRGrMrABzeFysf11lF50dg+
 dgk2Sv+wZCmjrCEeVkXSTvgCgz0Hx0xIWbxEci0WifYhTisli58fO33anO/vWY/vn4VW
 6fIgP80yYF99twBgqQVukOZikn7C1QYClSJ0lW4xAybXiHClYbKYxYg79q3oGLkEtMil
 W8Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uHYJs05JUgxiv/eX3VbdjcS7Fv0UiN0SN4hx/uh2t7M=;
 b=Jtm3L1XRxF5iPVBZXHq5rDxrwJPxBpqmsUcORkiLKEd8X9jlpe+KGRtxVMPNsGAocd
 thOyq/XXx7d41YS5wWrXp2YZ3A2jiVxM3WRJedx77RvefI4uZ3zwWTft1QAnlMPlB1Mw
 QZOBKNNqy6KaLwl6pmrXE+faTo9Y/jbXl8acy9louLjwBhm/7+yq0I/FBNIL1z66XDGR
 Qyc4GwhimwjPUL4WMgWmpSt1a4WeRzeLxLMKBMlM5U4J4mLOjISzySgSLZ6XbPqm4bZz
 FXXb+7oqyCkZTxRl8dSgn17+XM4SnQ9Xs4Xcyx9fB6wUHkJuN7EmBRKDIhWkgxqq5u6J
 ss2Q==
X-Gm-Message-State: AOAM533qeNGLN+P+a+x516L8JzOX5S7Cp7oawEuh+m2NPpCVjwBPVo3T
 dvnc9UsKKWNBUJ4tMpGXk7XKJHsvVcRPiw==
X-Google-Smtp-Source: ABdhPJwmZn1RF3PUhwH7PbZswRs2RxFUUOKe+wL3RUaaGurLZ4dRJKW0ffFuD5wt65h97YM3xotRPg==
X-Received: by 2002:a05:6000:71c:b0:207:a807:e297 with SMTP id
 bs28-20020a056000071c00b00207a807e297mr18675503wrb.596.1650539928111; 
 Thu, 21 Apr 2022 04:18:48 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 e4-20020a5d6d04000000b0020a8bbbb72bsm2597694wrq.97.2022.04.21.04.18.47
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 04:18:47 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 00/31] target-arm queue
Date: Thu, 21 Apr 2022 12:18:15 +0100
Message-Id: <20220421111846.2011565-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

First arm pullreq for 7.1. The bulk of this is the qemu_split_irq
removal.

I have enough stuff in my to-review queue that I expect to do another
pullreq early next week, but 31 patches is enough to not hang on to.

thanks
-- PMM

The following changes since commit 9c125d17e9402c232c46610802e5931b3639d77b:

  Merge tag 'pull-tcg-20220420' of https://gitlab.com/rth7680/qemu into staging (2022-04-20 16:43:11 -0700)

are available in the Git repository at:

  https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20220421

for you to fetch changes up to 5b415dd61bdbf61fb4be0e9f1a7172b8bce682c6:

  hw/arm: Use bit fields for NPCM7XX PWRON STRAPs (2022-04-21 11:37:05 +0100)

----------------------------------------------------------------
target-arm queue:
 * hw/arm/virt: Check for attempt to use TrustZone with KVM or HVF
 * versal: Add the Cortex-R5s in the Real-Time Processing Unit (RPU) subsystem
 * versal: model enough of the Clock/Reset Low-power domain (CRL) to allow control of the Cortex-R5s
 * xlnx-zynqmp: Connect 4 TTC timers
 * exynos4210: Refactor GIC/combiner code to stop using qemu_split_irq
 * realview: replace 'qemu_split_irq' with 'TYPE_SPLIT_IRQ'
 * stellaris: replace 'qemu_split_irq' with 'TYPE_SPLIT_IRQ'
 * hw/core/irq: remove unused 'qemu_irq_split' function
 * npcm7xx: use symbolic constants for PWRON STRAP bit fields
 * virt: document impact of gic-version on max CPUs

----------------------------------------------------------------
Edgar E. Iglesias (6):
      timer: cadence_ttc: Break out header file to allow embedding
      hw/arm/xlnx-zynqmp: Connect 4 TTC timers
      hw/arm: versal: Create an APU CPU Cluster
      hw/arm: versal: Add the Cortex-R5Fs
      hw/misc: Add a model of the Xilinx Versal CRL
      hw/arm: versal: Connect the CRL

Hao Wu (2):
      hw/misc: Add PWRON STRAP bit fields in GCR module
      hw/arm: Use bit fields for NPCM7XX PWRON STRAPs

Heinrich Schuchardt (1):
      hw/arm/virt: impact of gic-version on max CPUs

Peter Maydell (19):
      hw/arm/virt: Check for attempt to use TrustZone with KVM or HVF
      hw/arm/exynos4210: Use TYPE_OR_IRQ instead of custom OR-gate device
      hw/intc/exynos4210_gic: Remove unused TYPE_EXYNOS4210_IRQ_GATE
      hw/arm/exynos4210: Put a9mpcore device into state struct
      hw/arm/exynos4210: Drop int_gic_irq[] from Exynos4210Irq struct
      hw/arm/exynos4210: Coalesce board_irqs and irq_table
      hw/arm/exynos4210: Fix code style nit in combiner_grp_to_gic_id[]
      hw/arm/exynos4210: Move exynos4210_init_board_irqs() into exynos4210.c
      hw/arm/exynos4210: Put external GIC into state struct
      hw/arm/exynos4210: Drop ext_gic_irq[] from Exynos4210Irq struct
      hw/arm/exynos4210: Move exynos4210_combiner_get_gpioin() into exynos4210.c
      hw/arm/exynos4210: Delete unused macro definitions
      hw/arm/exynos4210: Use TYPE_SPLIT_IRQ in exynos4210_init_board_irqs()
      hw/arm/exynos4210: Fill in irq_table[] for internal-combiner-only IRQ lines
      hw/arm/exynos4210: Connect MCT_G0 and MCT_G1 to both combiners
      hw/arm/exynos4210: Don't connect multiple lines to external GIC inputs
      hw/arm/exynos4210: Fold combiner splits into exynos4210_init_board_irqs()
      hw/arm/exynos4210: Put combiners into state struct
      hw/arm/exynos4210: Drop Exynos4210Irq struct

Zongyuan Li (3):
      hw/arm/realview: replace 'qemu_split_irq' with 'TYPE_SPLIT_IRQ'
      hw/arm/stellaris: replace 'qemu_split_irq' with 'TYPE_SPLIT_IRQ'
      hw/core/irq: remove unused 'qemu_irq_split' function

 docs/system/arm/virt.rst              |   4 +-
 include/hw/arm/exynos4210.h           |  50 ++--
 include/hw/arm/xlnx-versal.h          |  16 ++
 include/hw/arm/xlnx-zynqmp.h          |   4 +
 include/hw/intc/exynos4210_combiner.h |  57 +++++
 include/hw/intc/exynos4210_gic.h      |  43 ++++
 include/hw/irq.h                      |   5 -
 include/hw/misc/npcm7xx_gcr.h         |  30 +++
 include/hw/misc/xlnx-versal-crl.h     | 235 +++++++++++++++++++
 include/hw/timer/cadence_ttc.h        |  54 +++++
 hw/arm/exynos4210.c                   | 430 ++++++++++++++++++++++++++++++----
 hw/arm/npcm7xx_boards.c               |  24 +-
 hw/arm/realview.c                     |  33 ++-
 hw/arm/stellaris.c                    |  15 +-
 hw/arm/virt.c                         |   7 +
 hw/arm/xlnx-versal-virt.c             |   6 +-
 hw/arm/xlnx-versal.c                  |  99 +++++++-
 hw/arm/xlnx-zynqmp.c                  |  22 ++
 hw/core/irq.c                         |  15 --
 hw/intc/exynos4210_combiner.c         | 108 +--------
 hw/intc/exynos4210_gic.c              | 344 +--------------------------
 hw/misc/xlnx-versal-crl.c             | 421 +++++++++++++++++++++++++++++++++
 hw/timer/cadence_ttc.c                |  32 +--
 MAINTAINERS                           |   2 +-
 hw/misc/meson.build                   |   1 +
 25 files changed, 1457 insertions(+), 600 deletions(-)
 create mode 100644 include/hw/intc/exynos4210_combiner.h
 create mode 100644 include/hw/intc/exynos4210_gic.h
 create mode 100644 include/hw/misc/xlnx-versal-crl.h
 create mode 100644 include/hw/timer/cadence_ttc.h
 create mode 100644 hw/misc/xlnx-versal-crl.c

