Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB6EF669CA3
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 16:43:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGKmX-0000rI-EM; Fri, 13 Jan 2023 09:11:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pGKmM-0000pM-FK
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 09:11:34 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pGKmI-0003dg-6C
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 09:11:32 -0500
Received: by mail-wm1-x329.google.com with SMTP id g10so15354136wmo.1
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 06:11:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=mWgqsSok28ce6z1en5gN9OjiS2muZQLwHlwjFb+KAq0=;
 b=gt6bi3alpntXpUTCiSPlgKXWMBU5uLIe7Pu40lfmOXG1Z4AZeV7sAKEPLwhftjzAdZ
 evpD8+ztI1le/m3Uegu70AoLSlVKzYY/ClSKqisz9JiA7um2I5KwG7+XrjIgtWvauJ1k
 qwgHdOdARfFVZfrtTQ+XaIIsPT4pwLDH6shzcT+wjVnIkLxhqdYFS9QymqX5/aG/MQ3o
 WgjGsWDBJnQo9/TltxxtnxQXHs4vYdCsbkDfgRAqrdYf8uu176R9ggGolRhnHPe9GauC
 NQdPrTnYF5n3nwVtxC5mkWLeQZlE+AqEQ6Od28rudOM4NrhXdbDyP2w1Tj8RnkeP7juC
 o60w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mWgqsSok28ce6z1en5gN9OjiS2muZQLwHlwjFb+KAq0=;
 b=k+GnbeoqQXqqAdFn0yYIex0iiyjMKmedU6JEitmPv23BRNRKylI6u8dRadngR5riEI
 zy3uwJCaC97Erj0Nrqqntz2aZ9nhk7GfbmUrhI9naBIKepc5G2LlqdgXd9CsclUNCj4Y
 ItI5+SuWcsqPpybnLGGgyWpHqm/3MDi6cUF5fZHsd1HE1w1fAx5GFjLqLodO88yWqkA4
 Z8uIGlt6qYzIWz0IIv8Sh3rKh9Q2YvtAiyw2DEJ2Icg7FKhn1nq71IQ6Dawvw6V73NSU
 gCdABKZzXHKuanBdqa+ahZu4EN7bfcW6vn+RkDXj9thdgVHjgaTIljI0yVATbGGnLqdk
 ke3w==
X-Gm-Message-State: AFqh2koIyQwij/b+Dl6jsygNHesh4X0IV9VNsUQOb/5Tipy2HHI+qp1E
 rgRBr1w9qrChIgvh+bg+kExd20t6nMPPTjgr
X-Google-Smtp-Source: AMrXdXujsqqa5C5Pyp2CVr/ssGYJ0CKRpDzP0zPaz3jNywyBDsv03smLSF9DmGv1qXzDkPkUd6TxUw==
X-Received: by 2002:a05:600c:44d4:b0:3cf:7925:7a3 with SMTP id
 f20-20020a05600c44d400b003cf792507a3mr57423805wmo.24.1673619088068; 
 Fri, 13 Jan 2023 06:11:28 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 n36-20020a05600c502400b003da0b75de94sm5334464wmr.8.2023.01.13.06.11.27
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jan 2023 06:11:27 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 00/38] target-arm queue
Date: Fri, 13 Jan 2023 14:10:48 +0000
Message-Id: <20230113141126.535646-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

The following changes since commit 3db29dcac23da85486704ef9e7a8e7217f7829cd:

  Merge tag 'for-upstream' of https://gitlab.com/bonzini/qemu into staging (2023-01-12 13:51:36 +0000)

are available in the Git repository at:

  https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20230113

for you to fetch changes up to 08899b5c68a55a3780d707e2464073c8f2670d31:

  target/arm: allow writes to SCR_EL3.HXEn bit when FEAT_HCX is enabled (2023-01-13 13:19:36 +0000)

----------------------------------------------------------------
target-arm queue:
 hw/arm/stm32f405: correctly describe the memory layout
 hw/arm: Add Olimex H405 board
 cubieboard: Support booting from an SD card image with u-boot on it
 target/arm: Fix sve_probe_page
 target/arm: allow writes to SCR_EL3.HXEn bit when FEAT_HCX is enabled
 various code cleanups

----------------------------------------------------------------
Evgeny Iakovlev (1):
      target/arm: allow writes to SCR_EL3.HXEn bit when FEAT_HCX is enabled

Felipe Balbi (2):
      hw/arm/stm32f405: correctly describe the memory layout
      hw/arm: Add Olimex H405

Philippe Mathieu-Daudé (27):
      hw/arm/pxa2xx: Simplify pxa255_init()
      hw/arm/pxa2xx: Simplify pxa270_init()
      hw/arm/collie: Use the IEC binary prefix definitions
      hw/arm/collie: Simplify flash creation using for() loop
      hw/arm/gumstix: Improve documentation
      hw/arm/gumstix: Use the IEC binary prefix definitions
      hw/arm/mainstone: Use the IEC binary prefix definitions
      hw/arm/musicpal: Use the IEC binary prefix definitions
      hw/arm/omap_sx1: Remove unused 'total_ram' definitions
      hw/arm/omap_sx1: Use the IEC binary prefix definitions
      hw/arm/z2: Use the IEC binary prefix definitions
      hw/arm/vexpress: Remove dead code in vexpress_common_init()
      hw/arm: Remove unreachable code calling pflash_cfi01_register()
      hw/arm/pxa: Avoid forward-declaring PXA2xxI2CState
      hw/gpio/omap_gpio: Add local variable to avoid embedded cast
      hw/arm/omap: Drop useless casts from void * to pointer
      hw/gpio/omap_gpio: Use CamelCase for TYPE_OMAP1_GPIO type name
      hw/gpio/omap_gpio: Use CamelCase for TYPE_OMAP2_GPIO type name
      hw/intc/omap_intc: Use CamelCase for TYPE_OMAP_INTC type name
      hw/arm/stellaris: Drop useless casts from void * to pointer
      hw/arm/stellaris: Use CamelCase for STELLARIS_ADC type name
      hw/arm/bcm2836: Remove definitions generated by OBJECT_DECLARE_TYPE()
      hw/arm/npcm7xx: Declare QOM macros using OBJECT_DECLARE_SIMPLE_TYPE()
      hw/misc/sbsa_ec: Rename TYPE_SBSA_EC -> TYPE_SBSA_SECURE_EC
      hw/misc/sbsa_ec: Declare QOM macros using OBJECT_DECLARE_SIMPLE_TYPE()
      hw/intc/xilinx_intc: Use 'XpsIntc' typedef instead of 'struct xlx_pic'
      hw/timer/xilinx_timer: Use XpsTimerState instead of 'struct timerblock'

Richard Henderson (1):
      target/arm: Fix sve_probe_page

Strahinja Jankovic (7):
      hw/misc: Allwinner-A10 Clock Controller Module Emulation
      hw/misc: Allwinner A10 DRAM Controller Emulation
      {hw/i2c,docs/system/arm}: Allwinner TWI/I2C Emulation
      hw/misc: AXP209 PMU Emulation
      hw/arm: Add AXP209 to Cubieboard
      hw/arm: Allwinner A10 enable SPL load from MMC
      tests/avocado: Add SD boot test to Cubieboard

 docs/system/arm/cubieboard.rst          |   1 +
 docs/system/arm/orangepi.rst            |   1 +
 docs/system/arm/stm32.rst               |   1 +
 configs/devices/arm-softmmu/default.mak |   1 +
 include/hw/adc/npcm7xx_adc.h            |   7 +-
 include/hw/arm/allwinner-a10.h          |  27 ++
 include/hw/arm/allwinner-h3.h           |   3 +
 include/hw/arm/npcm7xx.h                |  18 +-
 include/hw/arm/omap.h                   |  24 +-
 include/hw/arm/pxa.h                    |  11 +-
 include/hw/arm/stm32f405_soc.h          |   5 +-
 include/hw/i2c/allwinner-i2c.h          |  55 ++++
 include/hw/i2c/npcm7xx_smbus.h          |   7 +-
 include/hw/misc/allwinner-a10-ccm.h     |  67 +++++
 include/hw/misc/allwinner-a10-dramc.h   |  68 +++++
 include/hw/misc/npcm7xx_clk.h           |   2 +-
 include/hw/misc/npcm7xx_gcr.h           |   6 +-
 include/hw/misc/npcm7xx_mft.h           |   7 +-
 include/hw/misc/npcm7xx_pwm.h           |   3 +-
 include/hw/misc/npcm7xx_rng.h           |   6 +-
 include/hw/net/npcm7xx_emc.h            |   5 +-
 include/hw/sd/npcm7xx_sdhci.h           |   4 +-
 hw/arm/allwinner-a10.c                  |  40 +++
 hw/arm/allwinner-h3.c                   |  11 +-
 hw/arm/bcm2836.c                        |   9 +-
 hw/arm/collie.c                         |  25 +-
 hw/arm/cubieboard.c                     |  11 +
 hw/arm/gumstix.c                        |  45 ++--
 hw/arm/mainstone.c                      |  37 ++-
 hw/arm/musicpal.c                       |   9 +-
 hw/arm/olimex-stm32-h405.c              |  69 +++++
 hw/arm/omap1.c                          | 115 ++++----
 hw/arm/omap2.c                          |  40 ++-
 hw/arm/omap_sx1.c                       |  53 ++--
 hw/arm/palm.c                           |   2 +-
 hw/arm/pxa2xx.c                         |   8 +-
 hw/arm/spitz.c                          |   6 +-
 hw/arm/stellaris.c                      |  73 +++--
 hw/arm/stm32f405_soc.c                  |   8 +
 hw/arm/tosa.c                           |   2 +-
 hw/arm/versatilepb.c                    |   6 +-
 hw/arm/vexpress.c                       |  10 +-
 hw/arm/z2.c                             |  16 +-
 hw/char/omap_uart.c                     |   7 +-
 hw/display/omap_dss.c                   |  15 +-
 hw/display/omap_lcdc.c                  |   9 +-
 hw/dma/omap_dma.c                       |  15 +-
 hw/gpio/omap_gpio.c                     |  48 ++--
 hw/i2c/allwinner-i2c.c                  | 459 ++++++++++++++++++++++++++++++++
 hw/intc/omap_intc.c                     |  38 +--
 hw/intc/xilinx_intc.c                   |  28 +-
 hw/misc/allwinner-a10-ccm.c             | 224 ++++++++++++++++
 hw/misc/allwinner-a10-dramc.c           | 179 +++++++++++++
 hw/misc/axp209.c                        | 238 +++++++++++++++++
 hw/misc/omap_gpmc.c                     |  12 +-
 hw/misc/omap_l4.c                       |   7 +-
 hw/misc/omap_sdrc.c                     |   7 +-
 hw/misc/omap_tap.c                      |   5 +-
 hw/misc/sbsa_ec.c                       |  12 +-
 hw/sd/omap_mmc.c                        |   9 +-
 hw/ssi/omap_spi.c                       |   7 +-
 hw/timer/omap_gptimer.c                 |  22 +-
 hw/timer/omap_synctimer.c               |   4 +-
 hw/timer/xilinx_timer.c                 |  27 +-
 target/arm/helper.c                     |   3 +
 target/arm/sve_helper.c                 |  14 +-
 MAINTAINERS                             |   8 +
 hw/arm/Kconfig                          |   9 +
 hw/arm/meson.build                      |   1 +
 hw/i2c/Kconfig                          |   4 +
 hw/i2c/meson.build                      |   1 +
 hw/i2c/trace-events                     |   5 +
 hw/misc/Kconfig                         |  10 +
 hw/misc/meson.build                     |   3 +
 hw/misc/trace-events                    |   5 +
 tests/avocado/boot_linux_console.py     |  47 ++++
 76 files changed, 1951 insertions(+), 455 deletions(-)
 create mode 100644 include/hw/i2c/allwinner-i2c.h
 create mode 100644 include/hw/misc/allwinner-a10-ccm.h
 create mode 100644 include/hw/misc/allwinner-a10-dramc.h
 create mode 100644 hw/arm/olimex-stm32-h405.c
 create mode 100644 hw/i2c/allwinner-i2c.c
 create mode 100644 hw/misc/allwinner-a10-ccm.c
 create mode 100644 hw/misc/allwinner-a10-dramc.c
 create mode 100644 hw/misc/axp209.c

