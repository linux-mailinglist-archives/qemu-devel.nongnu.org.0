Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC4C2F365E
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 18:01:46 +0100 (CET)
Received: from localhost ([::1]:34706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzN3A-00034J-Qr
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 12:01:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kzMzV-0001Q0-D0
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 11:57:57 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:37794)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kzMzS-0006v7-6S
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 11:57:56 -0500
Received: by mail-wr1-x429.google.com with SMTP id i9so3239763wrc.4
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 08:57:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=b60faFjynFuGhvGHbbTD6kAorHJJFmjBjdmrPqPG5i8=;
 b=ioYqWr4Xmk/Z16DOSgdk3oaVFzxd7yIuGMHfA3piI1xkXkf16iQ4x2XTCZ55AvDkNq
 xFZq4bCmAHIjFnadcBt7F1gm1QHPNgYczUwaDH3HhT+eNtOxesFsWhJAjINZzuxPi52/
 rleDriRUlxoyUdfZwNszXdj5q+zZvTUZmequ0KfHXM+uWWkxYulSHE5I6TxXmgogTtF5
 8wNjzRBRdPB6d8gLmbmxmZYL5KldVQ5LKWF1atExWpkZgeL9hJCEBAAjR9bgfEsCSIXG
 XXbRZaEmSDcJbKp0E8Mp2QRbex/UUhIQFuQTs+B7Ssc8DLKuBndRLpfCl+sHVaFHVuxX
 Qx5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=b60faFjynFuGhvGHbbTD6kAorHJJFmjBjdmrPqPG5i8=;
 b=cA33sEluOE1ny8nERkitMvOax/1rpgs/oZXOWlNBYlZ9e/4Rf8SHqDudF3mIC9eLJh
 b9jynGg6JpD6C+q9FZ058R1sm2IKCJZNY6JyDGZzHNcnUX4Q+1Q2u8ZD69I0I3BOZ4kh
 wKNpZsz3mcnRCyrKGmUs6U/MjCNjWhskAS0HRfGNiLhrZs07tcpSPRjaIUwussqAGOZr
 y8hyGvS5g1zPHOJQXnTiV5N5fYuNciVpYI0Rk0e6EZ/d1jXy+cwEwvQ0WmKa+YDVGr4v
 2DOVa+0rOokKsoEyoIMbJ1zYyMHtCxBXon84UKvp/Hc9IjtlMeXiueDFMLAovSNgXomB
 AGFA==
X-Gm-Message-State: AOAM5337C2as11G8+/kYhY70P9U1Sk3LlD8lDb2W0Ybto2+vmaknxYzB
 u3HRft7ASvT01M2/GbY9O68Y0CPCD+zW2g==
X-Google-Smtp-Source: ABdhPJyha0xHTedVBC05fxZMoaDg+IAMF+qnypWBh3PfNsMlmfGvmJNBkfrKPiK8ZtB5F31SHUW98Q==
X-Received: by 2002:adf:e552:: with SMTP id z18mr5496625wrm.29.1610470672205; 
 Tue, 12 Jan 2021 08:57:52 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id i18sm6210083wrp.74.2021.01.12.08.57.51
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 08:57:51 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 00/21] target-arm queue
Date: Tue, 12 Jan 2021 16:57:29 +0000
Message-Id: <20210112165750.30475-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
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

Arm queue; not huge but I figured I might as well send it out since
I've been doing code review today and there's no queue of unprocessed
pullreqs...

thanks
-- PMM

The following changes since commit b3f846c59d8405bb87c551187721fc92ff2f1b92:

  Merge remote-tracking branch 'remotes/huth-gitlab/tags/pull-request-2021-01-11v2' into staging (2021-01-11 15:15:35 +0000)

are available in the Git repository at:

  https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20210112

for you to fetch changes up to 19d131395ccaf503db21dadd8257e6dc9fc1d7de:

  ui/cocoa: Fix openFile: deprecation on Big Sur (2021-01-12 11:38:37 +0000)

----------------------------------------------------------------
target-arm queue:
 * arm: Support emulation of ARMv8.4-TTST extension
 * arm: Update cpu.h ID register field definitions
 * arm: Fix breakage of XScale instruction emulation
 * hw/net/lan9118: Fix RX Status FIFO PEEK value
 * npcm7xx: Add ADC and PWM emulation
 * ui/cocoa: Make "open docs" help menu entry work again when binary
   is run from the build tree
 * ui/cocoa: Fix openFile: deprecation on Big Sur
 * docs: Add qemu-storage-daemon(1) manpage to meson.build
 * docs: Build and install all the docs in a single manual

----------------------------------------------------------------
Hao Wu (6):
      hw/misc: Add clock converter in NPCM7XX CLK module
      hw/timer: Refactor NPCM7XX Timer to use CLK clock
      hw/adc: Add an ADC module for NPCM7XX
      hw/misc: Add a PWM module for NPCM7XX
      hw/misc: Add QTest for NPCM7XX PWM Module
      hw/*: Use type casting for SysBusDevice in NPCM7XX

Leif Lindholm (6):
      target/arm: fix typo in cpu.h ID_AA64PFR1 field name
      target/arm: make ARMCPU.clidr 64-bit
      target/arm: make ARMCPU.ctr 64-bit
      target/arm: add descriptions of CLIDR_EL1, CCSIDR_EL1, CTR_EL0 to cpu.h
      target/arm: add aarch64 ID register fields to cpu.h
      target/arm: add aarch32 ID register fields to cpu.h

Peter Maydell (5):
      docs: Add qemu-storage-daemon(1) manpage to meson.build
      docs: Build and install all the docs in a single manual
      target/arm: Don't decode insns in the XScale/iWMMXt space as cp insns
      hw/net/lan9118: Fix RX Status FIFO PEEK value
      hw/net/lan9118: Add symbolic constants for register offsets

Roman Bolshakov (2):
      ui/cocoa: Update path to docs in build tree
      ui/cocoa: Fix openFile: deprecation on Big Sur

Rémi Denis-Courmont (2):
      target/arm: ARMv8.4-TTST extension
      target/arm: enable Small Translation tables in max CPU

 docs/conf.py                     |  46 ++-
 docs/devel/conf.py               |  15 -
 docs/index.html.in               |  17 -
 docs/interop/conf.py             |  28 --
 docs/meson.build                 |  65 ++--
 docs/specs/conf.py               |  16 -
 docs/system/arm/nuvoton.rst      |   4 +-
 docs/system/conf.py              |  28 --
 docs/tools/conf.py               |  37 --
 docs/user/conf.py                |  15 -
 meson.build                      |   1 +
 hw/adc/trace.h                   |   1 +
 include/hw/adc/npcm7xx_adc.h     |  69 ++++
 include/hw/arm/npcm7xx.h         |   4 +
 include/hw/misc/npcm7xx_clk.h    | 146 ++++++-
 include/hw/misc/npcm7xx_pwm.h    | 105 +++++
 include/hw/timer/npcm7xx_timer.h |   1 +
 target/arm/cpu.h                 |  85 ++++-
 hw/adc/npcm7xx_adc.c             | 301 +++++++++++++++
 hw/arm/npcm7xx.c                 |  55 ++-
 hw/arm/npcm7xx_boards.c          |   2 +-
 hw/mem/npcm7xx_mc.c              |   2 +-
 hw/misc/npcm7xx_clk.c            | 807 ++++++++++++++++++++++++++++++++++++++-
 hw/misc/npcm7xx_gcr.c            |   2 +-
 hw/misc/npcm7xx_pwm.c            | 550 ++++++++++++++++++++++++++
 hw/misc/npcm7xx_rng.c            |   2 +-
 hw/net/lan9118.c                 |  26 +-
 hw/nvram/npcm7xx_otp.c           |   2 +-
 hw/ssi/npcm7xx_fiu.c             |   2 +-
 hw/timer/npcm7xx_timer.c         |  39 +-
 target/arm/cpu64.c               |   1 +
 target/arm/helper.c              |  15 +-
 target/arm/translate.c           |   7 +
 tests/qtest/npcm7xx_adc-test.c   | 377 ++++++++++++++++++
 tests/qtest/npcm7xx_pwm-test.c   | 490 ++++++++++++++++++++++++
 hw/adc/meson.build               |   1 +
 hw/adc/trace-events              |   5 +
 hw/misc/meson.build              |   1 +
 hw/misc/trace-events             |   6 +
 tests/qtest/meson.build          |   4 +-
 ui/cocoa.m                       |   7 +-
 41 files changed, 3124 insertions(+), 263 deletions(-)
 delete mode 100644 docs/devel/conf.py
 delete mode 100644 docs/index.html.in
 delete mode 100644 docs/interop/conf.py
 delete mode 100644 docs/specs/conf.py
 delete mode 100644 docs/system/conf.py
 delete mode 100644 docs/tools/conf.py
 delete mode 100644 docs/user/conf.py
 create mode 100644 hw/adc/trace.h
 create mode 100644 include/hw/adc/npcm7xx_adc.h
 create mode 100644 include/hw/misc/npcm7xx_pwm.h
 create mode 100644 hw/adc/npcm7xx_adc.c
 create mode 100644 hw/misc/npcm7xx_pwm.c
 create mode 100644 tests/qtest/npcm7xx_adc-test.c
 create mode 100644 tests/qtest/npcm7xx_pwm-test.c
 create mode 100644 hw/adc/trace-events

