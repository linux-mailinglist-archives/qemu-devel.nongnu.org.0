Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 292AA4DDA70
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 14:25:37 +0100 (CET)
Received: from localhost ([::1]:52076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVCbn-0000Fx-QT
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 09:25:35 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nVCZW-00065G-6W
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 09:23:14 -0400
Received: from [2a00:1450:4864:20::431] (port=44825
 helo=mail-wr1-x431.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nVCZU-00029x-87
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 09:23:13 -0400
Received: by mail-wr1-x431.google.com with SMTP id b19so11705909wrh.11
 for <qemu-devel@nongnu.org>; Fri, 18 Mar 2022 06:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JggyrUHmewSYJvgrhP6kp2P1mXbT+By8J9VtBBKC/AU=;
 b=iOhlkpL8cRYg3iZZVETD66XIqGVItWOohPZC+QS/ZombMhn9aeNO5hNM6Uh6LlG4cz
 gGmViRQfTXBqyYpxFPe9YdS1IUQxpzHij0olkq7M5+/WqAwn4dNN74k8bIiSFArJTznR
 pON2n973dysYkSl28TjVMKnXap/m/JfnQkq2SoeoxZSuToov1XK450S6J7sqL2J7kWNl
 tChvIfJlJySmse1uo2BnBB9jMIKenG/VzHlqgPWVN6m548gsu/DdJpwYRMhIFpMwcsot
 YMNtJsz7elyJosqtvBG3agOzs1EGkdK82Q29BuMWK2jBnTVxhhy0doTJ5lyeqRJ8HvTO
 B9dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JggyrUHmewSYJvgrhP6kp2P1mXbT+By8J9VtBBKC/AU=;
 b=6X7HqM62Bfp1+LKszQid8tFBhU9zrrffwTOApmv06ly7TSnoyGP4wtY9NYgfMd+Mg3
 kdSgCEcRVPXsqV/lCLidYfOqhXe4qB3YABMIlGRK96zwL8tETOPF4ViKpBihoWUJtO4T
 UXvIoK58koRuaqQJYyN70HOHGUZp1/JxN36sk8aa9wgOF3SoSf2FtsL/psIs4hqB3ctu
 cfTB9JbwkjN1rBqlmELMDQsYmqjeLAy27oX7woXFGCy4W9UZ1UORBk5mxkt87tA5wTx8
 OaPaWyfSrapsTt06zgvb8KkhwQztss9KwLb1dpv8EXAxjI0y9LstK7d9M0lPG8M7b/fx
 OEBw==
X-Gm-Message-State: AOAM531Wc3NZEWxKZ5NtuJo7+5ygEfuH0RGheNePqz+w+HGlxPvOhFNH
 nhbq7V9eILCOs7oI1KhjqWV/xxktejTWJw==
X-Google-Smtp-Source: ABdhPJwhggggwOWOHw7ZBk45Tc3GATEhQn8W+jOy2BKKh0UbrG7OuJsPnhbJXRBv/vn/f9KAXrrpvA==
X-Received: by 2002:adf:d1cb:0:b0:203:d2f7:43cf with SMTP id
 b11-20020adfd1cb000000b00203d2f743cfmr8317287wrd.287.1647609790639; 
 Fri, 18 Mar 2022 06:23:10 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 y15-20020a05600015cf00b00203e324347bsm6316599wry.102.2022.03.18.06.23.09
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Mar 2022 06:23:10 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 00/21] target-arm queue
Date: Fri, 18 Mar 2022 13:22:45 +0000
Message-Id: <20220318132306.3254960-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::431
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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

Mostly straightforward bugfixes. The new Xilinx devices are
arguably 'new feature', but they're fixing a regression where
our changes to PSCI in commit 3f37979bf mean that EL3 guest
code now needs to talk to a proper emulated power-controller
device to turn on secondary CPUs; and it's not yet rc1 and
they only affect the Xilinx board, so it seems OK to me.

thanks
-- PMM

The following changes since commit 1d60bb4b14601e38ed17384277aa4c30c57925d3:

  Merge tag 'pull-request-2022-03-15v2' of https://gitlab.com/thuth/qemu into staging (2022-03-16 10:43:58 +0000)

are available in the Git repository at:

  https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20220318

for you to fetch changes up to 79d54c9eac04c554e3c081589542f801ace71797:

  util/osdep: Remove some early cruft (2022-03-18 11:32:13 +0000)

----------------------------------------------------------------
target-arm queue:
 * Fix sve2 ldnt1 and stnt1
 * Fix pauth_check_trap vs SEL2
 * Fix handling of LPAE block descriptors
 * hw/dma/xlnx_csu_dma: Set TYPE_XLNX_CSU_DMA class_size
 * hw/misc/npcm7xx_clk: Don't leak string in npcm7xx_clk_sel_init()
 * nsis installer: List emulators in alphabetical order
 * nsis installer: Suppress "ANSI targets are deprecated" warning
 * nsis installer: Fix mouse-over descriptions for emulators
 * hw/arm/virt: Fix gic-version=max when CONFIG_ARM_GICV3_TCG is unset
 * Improve M-profile vector table access logging
 * Xilinx ZynqMP: model CRF and APU control
 * Fix compile issues on modern Solaris

----------------------------------------------------------------
Andrew Deason (3):
      util/osdep: Avoid madvise proto on modern Solaris
      hw/i386/acpi-build: Avoid 'sun' identifier
      util/osdep: Remove some early cruft

Edgar E. Iglesias (6):
      hw/arm/xlnx-zynqmp: Add an unimplemented SERDES area
      target/arm: Make rvbar settable after realize
      hw/misc: Add a model of the Xilinx ZynqMP CRF
      hw/arm/xlnx-zynqmp: Connect the ZynqMP CRF
      hw/misc: Add a model of the Xilinx ZynqMP APU Control
      hw/arm/xlnx-zynqmp: Connect the ZynqMP APU Control

Eric Auger (2):
      hw/intc: Rename CONFIG_ARM_GIC_TCG into CONFIG_ARM_GICV3_TCG
      hw/arm/virt: Fix gic-version=max when CONFIG_ARM_GICV3_TCG is unset

Peter Maydell (8):
      target/arm: Fix handling of LPAE block descriptors
      hw/dma/xlnx_csu_dma: Set TYPE_XLNX_CSU_DMA class_size
      hw/misc/npcm7xx_clk: Don't leak string in npcm7xx_clk_sel_init()
      nsis installer: List emulators in alphabetical order
      nsis installer: Suppress "ANSI targets are deprecated" warning
      nsis installer: Fix mouse-over descriptions for emulators
      target/arm: Log M-profile vector table accesses
      target/arm: Log fault address for M-profile faults

Richard Henderson (2):
      target/arm: Fix sve2 ldnt1 and stnt1
      target/arm: Fix pauth_check_trap vs SEL2

 meson.build                            |  23 ++-
 include/hw/arm/xlnx-zynqmp.h           |   4 +
 include/hw/misc/xlnx-zynqmp-apu-ctrl.h |  93 ++++++++++++
 include/hw/misc/xlnx-zynqmp-crf.h      | 211 ++++++++++++++++++++++++++
 include/qemu/osdep.h                   |   8 +
 target/arm/cpu.h                       |   3 +-
 target/arm/sve.decode                  |   5 +-
 hw/arm/virt.c                          |   7 +-
 hw/arm/xlnx-zynqmp.c                   |  46 +++++-
 hw/dma/xlnx_csu_dma.c                  |   1 +
 hw/i386/acpi-build.c                   |   4 +-
 hw/misc/npcm7xx_clk.c                  |   4 +-
 hw/misc/xlnx-zynqmp-apu-ctrl.c         | 253 +++++++++++++++++++++++++++++++
 hw/misc/xlnx-zynqmp-crf.c              | 266 +++++++++++++++++++++++++++++++++
 target/arm/cpu.c                       |  17 ++-
 target/arm/helper.c                    |  20 ++-
 target/arm/m_helper.c                  |  11 ++
 target/arm/pauth_helper.c              |   2 +-
 target/arm/translate-sve.c             |  51 ++++++-
 tests/tcg/aarch64/test-826.c           |  50 +++++++
 util/osdep.c                           |  10 --
 hw/intc/Kconfig                        |   2 +-
 hw/intc/meson.build                    |   4 +-
 hw/misc/meson.build                    |   2 +
 qemu.nsi                               |   8 +-
 scripts/nsis.py                        |  17 ++-
 tests/tcg/aarch64/Makefile.target      |   4 +
 tests/tcg/configure.sh                 |   4 +
 28 files changed, 1084 insertions(+), 46 deletions(-)
 create mode 100644 include/hw/misc/xlnx-zynqmp-apu-ctrl.h
 create mode 100644 include/hw/misc/xlnx-zynqmp-crf.h
 create mode 100644 hw/misc/xlnx-zynqmp-apu-ctrl.c
 create mode 100644 hw/misc/xlnx-zynqmp-crf.c
 create mode 100644 tests/tcg/aarch64/test-826.c

