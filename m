Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FD6B578539
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 16:21:26 +0200 (CEST)
Received: from localhost ([::1]:51566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDRcj-0003VR-3E
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 10:21:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oDRHU-00023w-AE
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 09:59:29 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:35510)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oDRHS-00039s-EK
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 09:59:28 -0400
Received: by mail-wr1-x431.google.com with SMTP id b26so17198781wrc.2
 for <qemu-devel@nongnu.org>; Mon, 18 Jul 2022 06:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CdwR/q3spG46Oy+vZh7cJasc4ZERmNJMIqQjjt0xlgQ=;
 b=DZE7zkFczjyvafJjsNn19n2MLHRDAmNWXwCmmnRhFhV1m9MkTXHTxmR/To+clFUajm
 O47981gA7Xt+YRLNSbhHrmVV3g4a7F8ZPAxiujagBJlG96rk7lSoZCEYQYdt7j0F5Jhg
 OGFY6Yvxu490ExcS9SdGqIi1cY9sVH6Cb85aUzrQfo6XIg6Fz87d54KiCP9sJ81DNKF2
 V4GMmXyWsVgJTj+Wg1UY2tZSGdHC3V5pPCEdRFqEKTYeKlMTI6bDp6lY3VFl8AFf0igk
 oMZBHMsJfImosqX/xmq3hvc90BnUzzEe4u+fz2FFmjbN9Mzhmc/n8uTn6jyf9P7K7sUt
 2yIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CdwR/q3spG46Oy+vZh7cJasc4ZERmNJMIqQjjt0xlgQ=;
 b=bjIUBQLx8bdliOiQoeUvi3Uy8e8auaBREpGYqQ2ny0vbGzAKAqP+RHJZZ3cMKqOo5K
 yZ+ogeYRVlePq2lvht+YVKDcHRhMYjzGdgnrmVno+6vrLAODmgMkl4h9M7AqLuKv03uY
 qfRfHHuMvgwVNzcw/Gy/M+zmJlpdppq39B1oADZ7nZhDxdD8z2D/jywiskGgRudxuutV
 RtlWIxWzo7VfDA3xM3EAFnYz9UU8TLlFtJ23jo8TtajuGulcwvxgw+5BG7avaAoZX/s6
 juvy1tqIYn6Ylc2SWcy+Au5Dqyizvk8xxR5m5K4vYvWRT7b5m5IA+3kmHjVfCZbEXu8+
 An3w==
X-Gm-Message-State: AJIora9o3DwhGNjSZteAHDEnKOE/tT2+QGPytZx0J5YeyQ/qkSR3+Dsp
 8HUOTWxJngYDhE+HnfHEgHAcJLhogfMmZw==
X-Google-Smtp-Source: AGRyM1tbH/OYyS8hheXlcqE2uEVEqA3iYbmfixyAz1JOhWktL2+bg4sW1fFBRogIptDsT1jUbQCbnw==
X-Received: by 2002:a5d:6d0e:0:b0:21d:6d4c:e0e4 with SMTP id
 e14-20020a5d6d0e000000b0021d6d4ce0e4mr23877659wrq.355.1658152764139; 
 Mon, 18 Jul 2022 06:59:24 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 id15-20020a05600ca18f00b003a31f1edfa7sm1805798wmb.41.2022.07.18.06.59.23
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jul 2022 06:59:23 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 00/15] target-arm queue
Date: Mon, 18 Jul 2022 14:59:05 +0100
Message-Id: <20220718135920.13667-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
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

Some arm patches before softfreeze. These are all bug fixes.

-- PMM

The following changes since commit 0ebf76aae58324b8f7bf6af798696687f5f4c2a9:

  Merge tag 'nvme-next-pull-request' of git://git.infradead.org/qemu-nvme into staging (2022-07-15 15:38:13 +0100)

are available in the Git repository at:

  https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20220718

for you to fetch changes up to 004c8a8bc569c8b18fca6fc90ffe3223daaf17b7:

  Align Raspberry Pi DMA interrupts with Linux DTS (2022-07-18 13:25:13 +0100)

----------------------------------------------------------------
target-arm queue:
 * hw/intc/armv7m_nvic: ICPRn must not unpend an IRQ that is being held high
 * target/arm: Fill in VL for tbflags when SME enabled and SVE disabled
 * target/arm: Fix aarch64_sve_change_el for SME
 * linux-user/aarch64: Do not clear PROT_MTE on mprotect
 * target/arm: Honour VTCR_EL2 bits in Secure EL2
 * hw/adc: Fix CONV bit in NPCM7XX ADC CON register
 * hw/adc: Make adci[*] R/W in NPCM7XX ADC
 * target/arm: Don't set syndrome ISS for loads and stores with writeback
 * Align Raspberry Pi DMA interrupts with Linux DTS

----------------------------------------------------------------
Andrey Makarov (1):
      Align Raspberry Pi DMA interrupts with Linux DTS

Hao Wu (2):
      hw/adc: Fix CONV bit in NPCM7XX ADC CON register
      hw/adc: Make adci[*] R/W in NPCM7XX ADC

Peter Maydell (9):
      hw/intc/armv7m_nvic: ICPRn must not unpend an IRQ that is being held high
      target/arm: Define and use new regime_tcr_value() function
      target/arm: Calculate mask/base_mask in get_level1_table_address()
      target/arm: Fold regime_tcr() and regime_tcr_value() together
      target/arm: Fix big-endian host handling of VTCR
      target/arm: Store VTCR_EL2, VSTCR_EL2 registers as uint64_t
      target/arm: Store TCR_EL* registers as uint64_t
      target/arm: Honour VTCR_EL2 bits in Secure EL2
      target/arm: Don't set syndrome ISS for loads and stores with writeback

Richard Henderson (3):
      target/arm: Fill in VL for tbflags when SME enabled and SVE disabled
      target/arm: Fix aarch64_sve_change_el for SME
      linux-user/aarch64: Do not clear PROT_MTE on mprotect

 include/hw/arm/bcm2835_peripherals.h |   2 +
 target/arm/cpu.h                     |  38 ++++++++---
 target/arm/internals.h               |  34 +++++++---
 accel/tcg/translate-all.c            |  13 +++-
 hw/adc/npcm7xx_adc.c                 |   4 +-
 hw/arm/bcm2835_peripherals.c         |  26 ++++++-
 hw/intc/armv7m_nvic.c                |   9 ++-
 target/arm/cpu.c                     |   2 +-
 target/arm/debug_helper.c            |   2 +-
 target/arm/helper.c                  | 128 ++++++++++++++++-------------------
 target/arm/ptw.c                     |  38 ++++++-----
 target/arm/tlb_helper.c              |   2 +-
 target/arm/translate-a64.c           |   4 +-
 tests/qtest/bcm2835-dma-test.c       | 118 ++++++++++++++++++++++++++++++++
 tests/qtest/npcm7xx_adc-test.c       |   2 +-
 tests/qtest/meson.build              |   3 +-
 16 files changed, 306 insertions(+), 119 deletions(-)
 create mode 100644 tests/qtest/bcm2835-dma-test.c

