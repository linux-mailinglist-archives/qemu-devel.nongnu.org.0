Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F7BA2F3BCF
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 22:24:04 +0100 (CET)
Received: from localhost ([::1]:59396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzR90-0001Qp-Q4
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 16:24:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kzR8E-00010D-IA
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 16:23:14 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:43567)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kzR8C-000714-GP
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 16:23:14 -0500
Received: by mail-wr1-x430.google.com with SMTP id y17so3956595wrr.10
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 13:23:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CArlpq2HpgoM1iwKOyR3QoAwVUvtwhXJlVL4SabSkqE=;
 b=ODSMyPKMCj3or7WtJ6rPmQollVF576R3dSaIzU5k1YkHtkkquYAZ2KVli7qs30qLIR
 MeL1XaY/KmHTq6poz2BnXwVJZgGqNyuLNYCOtgnB131QooSteVaZViFE9D1bzsDRuKfv
 d84IX7mNnrFjkBWHM2NRQxFUbjv2DhkLTmVWAPaEaBObbLhx9TocE12BGFBK7yZEUQqM
 uipFsd/vH0GaC+aA/O2Zbwv6JB8k+EvQGprgYA7XdQyWGfCgY9/MIs1AkcJKwLCER7Di
 7WeU4lconJXL6IcCpVzoM/c2Sgi9XciJd8wOO0N7JW2ovKn1XBHEvEc654PLuvOwwu1T
 7xrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CArlpq2HpgoM1iwKOyR3QoAwVUvtwhXJlVL4SabSkqE=;
 b=t5AYqMB+MhFVT+3mvvSumlF3A3zTZNR3RJXeK1IKCjWTfZ2m8hkKruL4PinggFDicJ
 j+nrYM/X+EDparUQTzZyeeAnWVZ7SnWv+gTl7gJ4zPT4zUaqFIRvNE53RDMuXhpmdrJ0
 zWVgESw2UFgyu3gom65G2thaIdEQslxgO03beyC3klt9aGvc/ojqjQ/bnNjPaMtizGN+
 4Cu2i1OtR9jIbeFa/Qj3CaXByHYOHONTPbLKimb80SvkUA43rp5oQnihM8hYftSRC7K9
 giUoaV9/oNi9O80TAR+l/hG2ZGkPS+IUYqrS91t4KY3WvhLRlr62M7AK3Vs6NSIcp82u
 IWaw==
X-Gm-Message-State: AOAM531g7dR1y9832wN23m4WUSVn/949gpiXewu/nQxtD32pzjRjaIq3
 VCrTtX/lkhI7fKhClfsnlLkR81i/gVG20A==
X-Google-Smtp-Source: ABdhPJzyR09NCfl/jPHFzMGh3CPEh5qwaXAtSn90Y6wnwdIG237rL1YM3+JLsf35fJyF2ZOcgFWYYg==
X-Received: by 2002:adf:92c2:: with SMTP id 60mr745767wrn.266.1610486589416;
 Tue, 12 Jan 2021 13:23:09 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id u66sm5732142wmg.2.2021.01.12.13.23.08
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 13:23:08 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL v2 00/20] target-arm queue
Date: Tue, 12 Jan 2021 21:23:06 +0000
Message-Id: <20210112212306.20899-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
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

v2: drop the 'merge the manuals' patch: it breaks the gitlab job which tries
to publish the docs on gitlab, and I also realised I forgot to update the
Windows installer scripts.

-- PMM

The following changes since commit b3f846c59d8405bb87c551187721fc92ff2f1b92:

  Merge remote-tracking branch 'remotes/huth-gitlab/tags/pull-request-2021-01-11v2' into staging (2021-01-11 15:15:35 +0000)

are available in the Git repository at:

  https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20210112-1

for you to fetch changes up to 1ff5a063d60c7737de11465516331b8ca8700865:

  ui/cocoa: Fix openFile: deprecation on Big Sur (2021-01-12 21:19:02 +0000)

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

Peter Maydell (4):
      docs: Add qemu-storage-daemon(1) manpage to meson.build
      target/arm: Don't decode insns in the XScale/iWMMXt space as cp insns
      hw/net/lan9118: Fix RX Status FIFO PEEK value
      hw/net/lan9118: Add symbolic constants for register offsets

Roman Bolshakov (2):
      ui/cocoa: Update path to docs in build tree
      ui/cocoa: Fix openFile: deprecation on Big Sur

Rémi Denis-Courmont (2):
      target/arm: ARMv8.4-TTST extension
      target/arm: enable Small Translation tables in max CPU

 docs/meson.build                 |   1 +
 docs/system/arm/nuvoton.rst      |   4 +-
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
 33 files changed, 3054 insertions(+), 67 deletions(-)
 create mode 100644 hw/adc/trace.h
 create mode 100644 include/hw/adc/npcm7xx_adc.h
 create mode 100644 include/hw/misc/npcm7xx_pwm.h
 create mode 100644 hw/adc/npcm7xx_adc.c
 create mode 100644 hw/misc/npcm7xx_pwm.c
 create mode 100644 tests/qtest/npcm7xx_adc-test.c
 create mode 100644 tests/qtest/npcm7xx_pwm-test.c
 create mode 100644 hw/adc/trace-events

