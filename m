Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 830BA30D758
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 11:21:12 +0100 (CET)
Received: from localhost ([::1]:53934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7FHb-0003sN-FC
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 05:21:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l7FDv-0000MV-Ak
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 05:17:24 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:50202)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l7FDr-0003Cx-MF
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 05:17:23 -0500
Received: by mail-wm1-x32e.google.com with SMTP id 190so4897136wmz.0
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 02:17:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=flOIuyhUIR+9ENdv1efgsi10MqukyC+92Pj9S8UkMU8=;
 b=IW2cO2Sx5znijZ23+owqPyBUEorRPJJcr8CQpP4VH3/o6xMBRkR63AcFrU5jwZo1lf
 Q0bJuqqpg+GJUUOcck1j1026kHMG+ylBYfQU6zVmRULSa45lIkRmmlaQQUYnybHbUooC
 lFENQgaIIxeZb8lBCXYh350F2F/B5AzJnQ9F2rW++Mpaz14uIoyy+AGk0LyB7E06XQN0
 atUL++kq28NXajYChwsBVzrkJHm34315SYS429IuR7b6xzFS2zjorI4lQCpbWSDkI7cP
 mFVrcULEMsk4gs6RmlnpGbN4vD13HolzZ7AQ5p3k0iZSy2/FmHdOT4HELkemhaMkmV59
 UYDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=flOIuyhUIR+9ENdv1efgsi10MqukyC+92Pj9S8UkMU8=;
 b=hSkTz5FCijtE4he9mGdpNfo1ItUFJdtWiP8RBreP3yemB27wBRKDJLX1ByAkO0A5Qu
 PJ0T+WexRk+B/tqjZ6aOuKPb9Udg/HYaKGfJgxD7WXqWfaU0ZMMJxS3MfELvUmAXFO65
 nP15Fhuf7G+ZAJJuF0ReAXBoNySjql5bQE7L3JShb6DFC1KbrTWzeUklyePR4Cg2CSd8
 XQtiXhh4aTmOnhS3SzkbktXQiIbaY4bGgINJFicKkubv0i4wIAU80WVw5wwQ3+b2Yd9h
 4beMPNW1A4m09Iy3CUeEf4mJBnh/lxFakGGkBLsm3CW5KIU62zrouZlbq6s1ixm5ze+K
 /WjA==
X-Gm-Message-State: AOAM533g2vSE2nd4z3TfEpdh5ALjcXEyJw07eTbFWXiNk1EgwKJuWhUe
 oyjLK6oNMaXDiPCbVnmu+GZ8A/Yx4uS0HA==
X-Google-Smtp-Source: ABdhPJwuRze38abzoCq3z7W0Cq2s4mh7wQYq0Vq2yCyNun5gJi/VEYgZNmFM1U2cbhE5uLJ8PpXQWg==
X-Received: by 2002:a1c:b6c5:: with SMTP id g188mr828942wmf.27.1612347437876; 
 Wed, 03 Feb 2021 02:17:17 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id f17sm3094497wrv.0.2021.02.03.02.17.17
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 02:17:17 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL v2 00/21] target-arm queue
Date: Wed,  3 Feb 2021 10:17:15 +0000
Message-Id: <20210203101715.9229-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
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

no changes to v1, except adding the CVE identifier to one of the commit
messages.

-- PMM

The following changes since commit cf7ca7d5b9faca13f1f8e3ea92cfb2f741eb0c0e:

  Merge remote-tracking branch 'remotes/stefanha-gitlab/tags/tracing-pull-request' into staging (2021-02-01 16:28:00 +0000)

are available in the Git repository at:

  https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20210203

for you to fetch changes up to fd8f71b95da86f530aae3d02a14b0ccd9e024772:

  hw/arm: Display CPU type in machine description (2021-02-03 10:15:51 +0000)

----------------------------------------------------------------
target-arm queue:
 * hw/intc/arm_gic: Allow to use QTest without crashing
 * hw/char/exynos4210_uart: Fix buffer size reporting with FIFO disabled
 * hw/char/exynos4210_uart: Fix missing call to report ready for input
 * hw/arm/smmuv3: Fix addr_mask for range-based invalidation
 * hw/ssi/imx_spi: Fix various minor bugs
 * hw/intc/arm_gic: Fix interrupt ID in GICD_SGIR register
 * hw/arm: Add missing Kconfig dependencies
 * hw/arm: Display CPU type in machine description

----------------------------------------------------------------
Bin Meng (5):
      hw/ssi: imx_spi: Use a macro for number of chip selects supported
      hw/ssi: imx_spi: Remove imx_spi_update_irq() in imx_spi_reset()
      hw/ssi: imx_spi: Round up the burst length to be multiple of 8
      hw/ssi: imx_spi: Correct the burst length > 32 bit transfer logic
      hw/ssi: imx_spi: Correct tx and rx fifo endianness

Iris Johnson (2):
      hw/char/exynos4210_uart: Fix buffer size reporting with FIFO disabled
      hw/char/exynos4210_uart: Fix missing call to report ready for input

Philippe Mathieu-Daudé (12):
      hw/intc/arm_gic: Allow to use QTest without crashing
      hw/ssi: imx_spi: Remove pointless variable initialization
      hw/ssi: imx_spi: Rework imx_spi_reset() to keep CONREG register value
      hw/ssi: imx_spi: Rework imx_spi_read() to handle block disabled
      hw/ssi: imx_spi: Rework imx_spi_write() to handle block disabled
      hw/intc/arm_gic: Fix interrupt ID in GICD_SGIR register
      hw/arm/stm32f405_soc: Add missing dependency on OR_IRQ
      hw/arm/exynos4210: Add missing dependency on OR_IRQ
      hw/arm/xlnx-versal: Versal SoC requires ZDMA
      hw/arm/xlnx-versal: Versal SoC requires ZynqMP peripherals
      hw/net/can: ZynqMP CAN device requires PTIMER
      hw/arm: Display CPU type in machine description

Xuzhou Cheng (1):
      hw/ssi: imx_spi: Disable chip selects when controller is disabled

Zenghui Yu (1):
      hw/arm/smmuv3: Fix addr_mask for range-based invalidation

 include/hw/ssi/imx_spi.h  |   5 +-
 hw/arm/digic_boards.c     |   2 +-
 hw/arm/microbit.c         |   2 +-
 hw/arm/netduino2.c        |   2 +-
 hw/arm/netduinoplus2.c    |   2 +-
 hw/arm/orangepi.c         |   2 +-
 hw/arm/smmuv3.c           |   4 +-
 hw/arm/stellaris.c        |   4 +-
 hw/char/exynos4210_uart.c |   7 ++-
 hw/intc/arm_gic.c         |   5 +-
 hw/ssi/imx_spi.c          | 153 +++++++++++++++++++++++++++++-----------------
 hw/Kconfig                |   1 +
 hw/arm/Kconfig            |   5 ++
 hw/dma/Kconfig            |   3 +
 hw/dma/meson.build        |   2 +-
 15 files changed, 130 insertions(+), 69 deletions(-)

