Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7E712D59AC
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 12:51:30 +0100 (CET)
Received: from localhost ([::1]:38384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knKTp-0003eR-Lo
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 06:51:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knKQf-0001HR-Dr
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 06:48:13 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:39664)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knKQT-0006w9-Rk
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 06:48:13 -0500
Received: by mail-wm1-x329.google.com with SMTP id 3so4990676wmg.4
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 03:48:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9yZA4g3A8HZN+50GCnNcBF1Lx4mak0axvIgtiXKAWUQ=;
 b=bmzpuGS7SG0LWVamO+TnL3AfcxAktjeA7YldX6zEqbVGILCyAEKjh3TEHhAJvEA1FD
 FqwK/EXHSUX1DNZ4QbrEbasPn25l6H55gzsnsZ0saR9TsAmyWMsbQTv2DQx1SHEImiiN
 TMKS0ezdoXD26iVbATHVL66hk5WeCkWesdByiH1kCEtjc7VkzkfBUnudwM43namW6BCS
 V42cK1Cen7v9CuIhTUAkRMqmLdrFUtGmG8FGgZIhdjMzJWa+f9LOIl9dg+8CQLL9riEZ
 8/MBh3lJjb/XHLX9Ay2VayM2SXjWSbuACPx0804d9DQrqBW9xjhcnBoECe7Pi0K38c4R
 JiqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9yZA4g3A8HZN+50GCnNcBF1Lx4mak0axvIgtiXKAWUQ=;
 b=EuszclsvePJXWSz7ucevxBBQTGXGr2TtiE0PcbA5o/LPio7d+7oRbp4ILSCnmXyLdP
 pT8jQifIMN/JPLgFouY6dwvMBj6pE05wBg3j3sB76fV+UwSU6HnjqE6nD06ZB5gUwIjM
 LUr+oBRtXt8+57sjmON/Cb46ITbKgY8EsyflH8rtjMOWrPIppBV1eeZ72Fbi3jhshV9o
 u+x3RSrgLsyCcHMIZz3cbmycN50/P1f1dW5cXr7/z0K5lI/6T7qiSY8s+FDLAb2dUrPn
 q/nUKM+anUOJ6kWpbwu286YKHH2ICwzSDBGa0r6PfSslR0TC1ElN42D/JRxeJpCXKNt/
 xSvA==
X-Gm-Message-State: AOAM533bYn3ec1HTACZh7AF2yB9IwP9YHglDYwUUOtiDat2afw0cq2tj
 WwNv8XPHo6WkHWMHN8sgEh0PMO+f9HK5Qw==
X-Google-Smtp-Source: ABdhPJxvMw/qowiN71pkXheLpuzrniiryIZ4zxu/acvsJIawsJH+d/0bLJyXvIAZoyJIuNjtMsInmw==
X-Received: by 2002:a1c:4954:: with SMTP id w81mr7736233wma.60.1607600878878; 
 Thu, 10 Dec 2020 03:47:58 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g192sm9304725wme.48.2020.12.10.03.47.58
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Dec 2020 03:47:58 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 00/36] target-arm queue
Date: Thu, 10 Dec 2020 11:47:20 +0000
Message-Id: <20201210114756.16501-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
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

First pullreq for 6.0: mostly my v8.1M work, plus some other
bits and pieces. (I still have a lot of stuff in my to-review
folder, which I may or may not get to before the Christmas break...)

thanks
-- PMM

The following changes since commit 5e7b204dbfae9a562fc73684986f936b97f63877:

  Merge remote-tracking branch 'remotes/mst/tags/for_upstream' into staging (2020-12-09 20:08:54 +0000)

are available in the Git repository at:

  https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20201210

for you to fetch changes up to 71f916be1c7e9ede0e37d9cabc781b5a9e8638ff:

  hw/arm/armv7m: Correct typo in QOM object name (2020-12-10 11:44:56 +0000)

----------------------------------------------------------------
target-arm queue:
 * hw/arm/smmuv3: Fix up L1STD_SPAN decoding
 * xlnx-zynqmp: Support Xilinx ZynqMP CAN controllers
 * sbsa-ref: allow to use Cortex-A53/57/72 cpus
 * Various minor code cleanups
 * hw/intc/armv7m_nvic: Make all of system PPB range be RAZWI/BusFault
 * Implement more pieces of ARMv8.1M support

----------------------------------------------------------------
Alex Chen (4):
      i.MX25: Fix bad printf format specifiers
      i.MX31: Fix bad printf format specifiers
      i.MX6: Fix bad printf format specifiers
      i.MX6ul: Fix bad printf format specifiers

Havard Skinnemoen (1):
      tests/qtest/npcm7xx_rng-test: dump random data on failure

Kunkun Jiang (1):
      hw/arm/smmuv3: Fix up L1STD_SPAN decoding

Marcin Juszkiewicz (1):
      sbsa-ref: allow to use Cortex-A53/57/72 cpus

Peter Maydell (25):
      hw/intc/armv7m_nvic: Make all of system PPB range be RAZWI/BusFault
      target/arm: Implement v8.1M PXN extension
      target/arm: Don't clobber ID_PFR1.Security on M-profile cores
      target/arm: Implement VSCCLRM insn
      target/arm: Implement CLRM instruction
      target/arm: Enforce M-profile VMRS/VMSR register restrictions
      target/arm: Refactor M-profile VMSR/VMRS handling
      target/arm: Move general-use constant expanders up in translate.c
      target/arm: Implement VLDR/VSTR system register
      target/arm: Implement M-profile FPSCR_nzcvqc
      target/arm: Use new FPCR_NZCV_MASK constant
      target/arm: Factor out preserve-fp-state from full_vfp_access_check()
      target/arm: Implement FPCXT_S fp system register
      hw/intc/armv7m_nvic: Update FPDSCR masking for v8.1M
      target/arm: For v8.1M, always clear R0-R3, R12, APSR, EPSR on exception entry
      target/arm: In v8.1M, don't set HFSR.FORCED on vector table fetch failures
      target/arm: Implement v8.1M REVIDR register
      target/arm: Implement new v8.1M NOCP check for exception return
      target/arm: Implement new v8.1M VLLDM and VLSTM encodings
      hw/intc/armv7m_nvic: Support v8.1M CCR.TRD bit
      target/arm: Implement CCR_S.TRD behaviour for SG insns
      hw/intc/armv7m_nvic: Fix "return from inactive handler" check
      target/arm: Implement M-profile "minimal RAS implementation"
      hw/intc/armv7m_nvic: Implement read/write for RAS register block
      hw/arm/armv7m: Correct typo in QOM object name

Vikram Garhwal (4):
      hw/net/can: Introduce Xilinx ZynqMP CAN controller
      xlnx-zynqmp: Connect Xilinx ZynqMP CAN controllers
      tests/qtest: Introduce tests for Xilinx ZynqMP CAN controller
      MAINTAINERS: Add maintainer entry for Xilinx ZynqMP CAN controller

 meson.build                      |    1 +
 hw/arm/smmuv3-internal.h         |    2 +-
 hw/net/can/trace.h               |    1 +
 include/hw/arm/xlnx-zynqmp.h     |    8 +
 include/hw/intc/armv7m_nvic.h    |    2 +
 include/hw/net/xlnx-zynqmp-can.h |   78 +++
 target/arm/cpu.h                 |   46 ++
 target/arm/m-nocp.decode         |   10 +-
 target/arm/t32.decode            |   10 +-
 target/arm/vfp.decode            |   14 +
 hw/arm/armv7m.c                  |    4 +-
 hw/arm/sbsa-ref.c                |   23 +-
 hw/arm/xlnx-zcu102.c             |   20 +
 hw/arm/xlnx-zynqmp.c             |   34 ++
 hw/intc/armv7m_nvic.c            |  246 ++++++--
 hw/misc/imx25_ccm.c              |   12 +-
 hw/misc/imx31_ccm.c              |   14 +-
 hw/misc/imx6_ccm.c               |   20 +-
 hw/misc/imx6_src.c               |    2 +-
 hw/misc/imx6ul_ccm.c             |    4 +-
 hw/misc/imx_ccm.c                |    4 +-
 hw/net/can/xlnx-zynqmp-can.c     | 1161 ++++++++++++++++++++++++++++++++++++++
 target/arm/cpu.c                 |    5 +-
 target/arm/helper.c              |    7 +-
 target/arm/m_helper.c            |  130 ++++-
 target/arm/translate.c           |  105 +++-
 tests/qtest/npcm7xx_rng-test.c   |   12 +
 tests/qtest/xlnx-can-test.c      |  360 ++++++++++++
 MAINTAINERS                      |    8 +
 hw/Kconfig                       |    1 +
 hw/net/can/meson.build           |    1 +
 hw/net/can/trace-events          |    9 +
 target/arm/translate-vfp.c.inc   |  511 ++++++++++++++++-
 tests/qtest/meson.build          |    1 +
 34 files changed, 2713 insertions(+), 153 deletions(-)
 create mode 100644 hw/net/can/trace.h
 create mode 100644 include/hw/net/xlnx-zynqmp-can.h
 create mode 100644 hw/net/can/xlnx-zynqmp-can.c
 create mode 100644 tests/qtest/xlnx-can-test.c
 create mode 100644 hw/net/can/trace-events

