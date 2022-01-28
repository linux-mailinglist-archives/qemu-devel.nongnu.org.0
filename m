Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E775749FD29
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 16:54:34 +0100 (CET)
Received: from localhost ([::1]:34446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDTa6-0006y2-1m
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 10:54:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nDTD5-0002Ac-P3
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 10:30:53 -0500
Received: from [2a00:1450:4864:20::42f] (port=40799
 helo=mail-wr1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nDTCy-0006JQ-93
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 10:30:43 -0500
Received: by mail-wr1-x42f.google.com with SMTP id s18so11559181wrv.7
 for <qemu-devel@nongnu.org>; Fri, 28 Jan 2022 07:30:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3nqq6Er5DPcsISJj2hyu2C062BekUHKIeaHvVyJaSz0=;
 b=AVyWbalIAkBcZE64DBrEpVeQjuKHYx4g8N6noYNtXAu/pRQSk4hpFxxA7xP12NBfZ+
 AHjs5mVsE7Uqi9eVKMpqiyWw9A2x2ntGL1DRfbTitWcAb92jLexZLAjzHvC96u13bVPK
 wYev2JD6msWJqWl6TtmoAPwNmMqFy/U6zINYh0LLWRQ1LZ/lcjxosCoDy3vr9c9JHDv9
 xKThbeAHOCjDFZyA9xlgQH2elDd6HTu4ZW7zfK1UkWDCk4HagrqWdeR72TI2eNEbrOL7
 cH9lSfVaFOVk2q00oGVVxE1o27E13noqX/4gzEKK9Gmrpbj4I0KFl914xkM/2e79huMw
 2s2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3nqq6Er5DPcsISJj2hyu2C062BekUHKIeaHvVyJaSz0=;
 b=hWXuuMo3XoHu7o+ARiu0irDJ2zwUnH2d1De7RE5vg6wetmIFtuMfHlhRoLszVo71Mx
 ZnrAdL7Q5e+/R8CDlVKcdAPtnX2WVKspz7su6mo+1d4yWS/dypEWPQOlgMpc60lj/sqe
 vvDnHUJDw5pUlZlyvcpwcqsEF6Fv8I0rciHWrLOEJwZ/Hb03KHJt2VtRqqI+6mJfwNvi
 gETPwHUhDYVyKpvPbEogJUuUwxhW3ewRgp+XnrxDDWuK7xux8q5q3jA01RP8Pi2pQ4Fm
 2y6bartestr91tdjoOarXCtDvJDKHDDkOzDuJ4q6gm5gbsWyBFxkntiRRZLbpaRHVqrq
 RYOQ==
X-Gm-Message-State: AOAM531hxOE/pEKRyw8yqbiVgxIEcKN8//swQHGUx3R5dvwJK6GbN6cz
 DinI0B1C8VY881eJ0zKbKZvAR9ekFUe7tQ==
X-Google-Smtp-Source: ABdhPJxezRWAkBM/49tZEzFs28/NdKcTRDlYM71Yqpja5FGpXIjd1pOtsZoifE5F5JKkpOFDQ+1Zyw==
X-Received: by 2002:a05:6000:1884:: with SMTP id
 a4mr7166517wri.509.1643383814836; 
 Fri, 28 Jan 2022 07:30:14 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id j3sm4749485wrb.57.2022.01.28.07.30.14
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jan 2022 07:30:14 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 00/32] target-arm queue
Date: Fri, 28 Jan 2022 15:29:37 +0000
Message-Id: <20220128153009.2467560-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
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

The following changes since commit b367db48126d4ee14579af6cf5cdbffeb9496627:

  Merge remote-tracking branch 'remotes/aperard/tags/pull-xen-20220127' into staging (2022-01-28 11:05:29 +0000)

are available in the Git repository at:

  https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20220128

for you to fetch changes up to 2c023d3675a3ffb54fc30504dcd715bc6f6e234f:

  target/arm: Use correct entrypoint for SVC taken from Hyp to Hyp (2022-01-28 14:30:36 +0000)

----------------------------------------------------------------
target-arm queue:
 * Update copyright dates to 2022
 * hw/armv7m: Fix broken VMStateDescription
 * hw/char/exynos4210_uart: Fix crash on trying to load VM state
 * rtc: Move RTC function prototypes to their own header
 * xlnx-versal-virt: Support PMC SLCR
 * xlnx-versal-virt: Support OSPI flash memory controller
 * scripts: Explain the difference between linux-headers and standard-headers
 * target/arm: Log CPU index in 'Taking exception' log
 * arm_gicv3_its: Various bugfixes and cleanups
 * arm_gicv3_its: Implement the missing MOVI and MOVALL commands
 * ast2600: Fix address mapping of second SPI controller
 * target/arm: Use correct entrypoint for SVC taken from Hyp to Hyp

----------------------------------------------------------------
Andrew Baumann (1):
      MAINTAINERS: Remove myself (for raspi).

Cédric Le Goater (1):
      hw/arm: ast2600: Fix address mapping of second SPI controller

Francisco Iglesias (10):
      hw/misc: Add a model of Versal's PMC SLCR
      hw/arm/xlnx-versal: 'Or' the interrupts from the BBRAM and RTC models
      hw/arm/xlnx-versal: Connect Versal's PMC SLCR
      include/hw/dma/xlnx_csu_dma: Add in missing includes in the header
      hw/dma/xlnx_csu_dma: Support starting a read transfer through a class method
      hw/ssi: Add a model of Xilinx Versal's OSPI flash memory controller
      hw/arm/xlnx-versal: Connect the OSPI flash memory controller model
      hw/block/m25p80: Add support for Micron Xccela flash mt35xu01g
      hw/arm/xlnx-versal-virt: Connect mt35xu01g flashes to the OSPI
      MAINTAINERS: Add an entry for Xilinx Versal OSPI

Peter Maydell (20):
      Update copyright dates to 2022
      hw/armv7m: Fix broken VMStateDescription
      hw/char/exynos4210_uart: Fix crash on trying to load VM state
      rtc: Move RTC function prototypes to their own header
      scripts: Explain the difference between linux-headers and standard-headers
      target/arm: Log CPU index in 'Taking exception' log
      hw/intc/arm_gicv3_its: Add tracepoints
      hw/intc/arm_gicv3: Initialise dma_as in GIC, not ITS
      hw/intc/arm_gicv3_its: Don't clear GITS_CREADR when GITS_CTLR.ENABLED is set
      hw/intc/arm_gicv3_its: Don't clear GITS_CWRITER on writes to GITS_CBASER
      hw/intc/arm_gicv3: Honour GICD_CTLR.EnableGrp1NS for LPIs
      hw/intc/arm_gicv3_its: Sort ITS command list into numeric order
      hw/intc/arm_gicv3_redist: Remove unnecessary zero checks
      hw/intc/arm_gicv3: Set GICR_CTLR.CES if LPIs are supported
      hw/intc/arm_gicv3_its: Provide read accessor for translation_ops
      hw/intc/arm_gicv3_its: Make GITS_BASER<n> RAZ/WI for unimplemented registers
      hw/intc/arm_gicv3_its: Check table bounds against correct limit
      hw/intc/arm_gicv3_its: Implement MOVALL
      hw/intc/arm_gicv3_its: Implement MOVI
      target/arm: Use correct entrypoint for SVC taken from Hyp to Hyp

 docs/conf.py                               |    2 +-
 hw/intc/gicv3_internal.h                   |   43 +-
 include/hw/arm/xlnx-versal.h               |   30 +-
 include/hw/dma/xlnx_csu_dma.h              |   24 +-
 include/hw/intc/arm_gicv3_its_common.h     |    1 -
 include/hw/misc/xlnx-versal-pmc-iou-slcr.h |   78 ++
 include/hw/ssi/xlnx-versal-ospi.h          |  111 ++
 include/qemu-common.h                      |    5 +-
 include/sysemu/rtc.h                       |   58 +
 target/arm/internals.h                     |    2 +-
 hw/arm/armv7m.c                            |    4 +-
 hw/arm/aspeed_ast2600.c                    |    2 +-
 hw/arm/omap1.c                             |    2 +-
 hw/arm/pxa2xx.c                            |    2 +-
 hw/arm/strongarm.c                         |    2 +-
 hw/arm/xlnx-versal-virt.c                  |   25 +-
 hw/arm/xlnx-versal.c                       |  190 ++-
 hw/block/m25p80.c                          |    2 +
 hw/char/exynos4210_uart.c                  |    2 +-
 hw/dma/xlnx_csu_dma.c                      |   17 +
 hw/intc/arm_gicv3.c                        |    1 +
 hw/intc/arm_gicv3_common.c                 |    9 +
 hw/intc/arm_gicv3_its.c                    |  258 +++-
 hw/intc/arm_gicv3_redist.c                 |  115 +-
 hw/misc/mac_via.c                          |    2 +-
 hw/misc/macio/cuda.c                       |    2 +-
 hw/misc/macio/pmu.c                        |    2 +-
 hw/misc/xlnx-versal-pmc-iou-slcr.c         | 1446 ++++++++++++++++++++++
 hw/ppc/spapr_rtc.c                         |    2 +-
 hw/rtc/allwinner-rtc.c                     |    2 +-
 hw/rtc/aspeed_rtc.c                        |    2 +-
 hw/rtc/ds1338.c                            |    2 +-
 hw/rtc/exynos4210_rtc.c                    |    2 +-
 hw/rtc/goldfish_rtc.c                      |    2 +-
 hw/rtc/m41t80.c                            |    2 +-
 hw/rtc/m48t59.c                            |    2 +-
 hw/rtc/mc146818rtc.c                       |    2 +-
 hw/rtc/pl031.c                             |    2 +-
 hw/rtc/twl92230.c                          |    2 +-
 hw/rtc/xlnx-zynqmp-rtc.c                   |    2 +-
 hw/s390x/tod-tcg.c                         |    2 +-
 hw/scsi/megasas.c                          |    2 +-
 hw/ssi/xlnx-versal-ospi.c                  | 1853 ++++++++++++++++++++++++++++
 net/dump.c                                 |    2 +-
 softmmu/rtc.c                              |    2 +-
 target/arm/helper.c                        |   13 +-
 target/arm/m_helper.c                      |    2 +-
 MAINTAINERS                                |    7 +-
 hw/intc/trace-events                       |    8 +
 hw/misc/meson.build                        |    5 +-
 hw/ssi/meson.build                         |    1 +
 scripts/update-linux-headers.sh            |   16 +
 52 files changed, 4300 insertions(+), 74 deletions(-)
 create mode 100644 include/hw/misc/xlnx-versal-pmc-iou-slcr.h
 create mode 100644 include/hw/ssi/xlnx-versal-ospi.h
 create mode 100644 include/sysemu/rtc.h
 create mode 100644 hw/misc/xlnx-versal-pmc-iou-slcr.c
 create mode 100644 hw/ssi/xlnx-versal-ospi.c

