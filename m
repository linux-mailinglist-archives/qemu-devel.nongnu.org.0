Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 275D930C904
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 19:08:44 +0100 (CET)
Received: from localhost ([::1]:36638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l706V-0001DN-6N
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 13:08:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6ztw-0005O7-QR
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 12:55:44 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:41372)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6ztc-0002Ec-Db
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 12:55:40 -0500
Received: by mail-wr1-x433.google.com with SMTP id p15so21373809wrq.8
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 09:55:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kYKLzqTblqio1iIbqzNBXCrN5kTa5b1JCMVTypqklSY=;
 b=Q6bbg34XahQLBB6zDuNdrSV6ryF0AeoZJ+gIl2bvprAO/FMIHt6N0qttLDe8+8jWUX
 BQO0edEVaC3JnAq/9/Mw9NmG7gc/HukkA8VEpvbfJ1S1R7lpFPWiFnpS6Bz9z24pW0GJ
 bZqR61lt2Vgqek0zrZvPIEQSb5iNRhWQTSXURvbA3HL0KLk2WbxW14vRpPzT5W4vf/hu
 ev5lDnuSKgyoGgQ0EaDy8GCfOV6Q7NmtCb7KzQkFBT40k3KS4yqD9sovaXffEqhCBMmI
 1n/DBUsgIwH9iE1Szr4x7o1Ni1XTG4t668PKygdGO8hCBRco38hjTV4mASkRX2w0K8RL
 dwrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kYKLzqTblqio1iIbqzNBXCrN5kTa5b1JCMVTypqklSY=;
 b=Fz/BQOuRFWszRtCZDb4jEa6K2ZQajhTXET61A2FAwFti35cwQtHtVdKoUYz4As72lO
 2LX5HSUtquzdPz6YvzdY5aRXmb8QGgxDJir4kUM926JB4HXJB6tjgPm+QZ4RFxErymsc
 Sh+1LZKie3ygjsGZX+UMKtmZn6No5915d3eJzwmF3AVa0ymgryU+KCXeNuELKaGVkrjl
 JGrpMdP4INWnGD++vw4xCfjW4LZFJehujsTICtvRdDN1flk7bZRqwKm2W28ofcrNEPwH
 vf8JEjqVHgWoehiKMbXryDMPOSxmM5D1cAF+LXo0yYe4Z97eqsKh13AWHYUKWaHr30SU
 zlLg==
X-Gm-Message-State: AOAM530Lf4Qnn4waQ75iXjJs4iBK5ZIQVJoWgVQzAN+4Hkf9lLarBKy/
 drsfQ4qhbaxBxUaaS3x8Syk5RqSCgV7OVQ==
X-Google-Smtp-Source: ABdhPJyH6DGodrzwpGE8Ygio8dTlB6eVdzx6FSY/6yE43O9H3VjILbPajYNpDZOEsPez8ovx10KoKA==
X-Received: by 2002:a5d:5484:: with SMTP id h4mr25392330wrv.94.1612288520263; 
 Tue, 02 Feb 2021 09:55:20 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q6sm4142283wmj.32.2021.02.02.09.55.19
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Feb 2021 09:55:19 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 00/21] target-arm queue
Date: Tue,  2 Feb 2021 17:54:56 +0000
Message-Id: <20210202175517.28729-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
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

Mostly just bug fixes. The important one here is
  hw/intc/arm_gic: Fix interrupt ID in GICD_SGIR register
which fixes a buffer overrun that's a security issue if you're running
KVM on Arm with kernel-irqchip=off (which hopefully nobody is doing in
a security context, because kernel-irqchip=on is the default and the
sensible choice for performance).

-- PMM

The following changes since commit cf7ca7d5b9faca13f1f8e3ea92cfb2f741eb0c0e:

  Merge remote-tracking branch 'remotes/stefanha-gitlab/tags/tracing-pull-request' into staging (2021-02-01 16:28:00 +0000)

are available in the Git repository at:

  https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20210202-1

for you to fetch changes up to 14657850c9cc10948551fbb884c30eb5a3a7370a:

  hw/arm: Display CPU type in machine description (2021-02-02 17:53:44 +0000)

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

