Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E43560F83E
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 14:58:25 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo2S6-00008l-4y; Thu, 27 Oct 2022 08:57:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oo2S3-0007rI-E3
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 08:57:39 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oo2S1-0002lD-Ck
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 08:57:39 -0400
Received: by mail-wr1-x42f.google.com with SMTP id bp11so2017726wrb.9
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 05:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=9N1tVJ1QPefxzd86dc7+4uzKAmDca1+CTaoHd0AHvLQ=;
 b=LB1DUmwPBH2fN45OzLi+Ah+9OlD184L6K791elEAmjP/4p/hS9Lz6NYuzRrYz/vDaS
 YuitbOND0o7oLaCcjMye8EDq95KHYkZ+t8J8/5ZVjviQLRbcuGDeXOw4yW9dvEcTUU65
 H+Bc/TtKhbYTWE6570R+UF6nvZKLRuzOTeMGdYUnamwVBxfzWW+1qf6kF5vrXYHiMivD
 KyhjsPQGr/RnGzDE7BxvOKwkUP6w1bpz3CASTdvQ2ZuHHE4mkAhgx+F90No70CGHOKHW
 xU5RtLNAbtmL1qLM8RVWjcof1gZpbAptDGRe6AyhO0Ewo+R7ogPAHUaFNaLsWqjO/4Hi
 LPVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9N1tVJ1QPefxzd86dc7+4uzKAmDca1+CTaoHd0AHvLQ=;
 b=rEEZ+lbEg3mKF7rwg0GMylSjFzrA+SNAXKJ2L7PLbbgWoDfgU9IIi2QduwW5MVzxKc
 jMOq/1y5hgZdQZR/IzH6bK3jp+JJEdHDkd99NppVu9UAT6+zGou0HYKVe+HKjGwD7kvm
 6cr5TdnONVL8G5uspUhITWwhl8h4ruV1FaPqFcejD2Ga2+OsKcXfJp3RoMOEwIB6dYZk
 yuqDDqFN33/qQr1+x0qoeZJITb7BXubdqkKYntBKuTY8+oxBey4pgtvpSJFcFRnoIQ/k
 y0ES7ZSREX7nw3Gs9rdnWjceVM753k+PhtoIhJ5RkmVOQzJTMkaImYb56a2tditToneE
 rl+A==
X-Gm-Message-State: ACrzQf3bBmDo23m1b1RRkkbGJfpXX8MYStgpcN8xxGIJvDU/EZEQ+qMp
 mkDHOmAkSZP5jdMjLHj6Tcp1rTa01P0uiw==
X-Google-Smtp-Source: AMsMyM7r/X5LX809SoHXQKdId+D+A1XP4EGRhwnl63EixA36YrjAgis+j3p+ZFflRbBJkU4sx+Q+sQ==
X-Received: by 2002:a5d:654d:0:b0:235:197d:72d1 with SMTP id
 z13-20020a5d654d000000b00235197d72d1mr26345010wrv.680.1666875455239; 
 Thu, 27 Oct 2022 05:57:35 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 l8-20020a5d6d88000000b0022b315b4649sm1396822wrs.26.2022.10.27.05.57.33
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Oct 2022 05:57:34 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL v2 00/31] target-arm queue
Date: Thu, 27 Oct 2022 13:57:31 +0100
Message-Id: <20221027125731.321978-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

v2: fixes two build failures, and adds the mips/malta RNG reset patch.

thanks
-- PMM

The following changes since commit 344744e148e6e865f5a57e745b02a87e5ea534ad:

  Merge tag 'dump-pull-request' of https://gitlab.com/marcandre.lureau/qemu into staging (2022-10-26 10:53:49 -0400)

are available in the Git repository at:

  https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20221027

for you to fetch changes up to 6233a138599bea89ad683b883dca38388f12fd2d:

  mips/malta: pass RNG seed via env var and re-randomize on reboot (2022-10-27 11:47:45 +0100)

----------------------------------------------------------------
target-arm queue:
 * Implement FEAT_E0PD
 * Implement FEAT_HAFDBS
 * honor HCR_E2H and HCR_TGE in arm_excp_unmasked()
 * hw/arm/virt: Fix devicetree warnings about the virtio-iommu node
 * hw/core/resettable: fix reset level counting
 * hw/hyperv/hyperv.c: Use device_cold_reset() instead of device_legacy_reset()
 * imx: reload cmp timer outside of the reload ptimer transaction
 * x86: do not re-randomize RNG seed on snapshot load
 * m68k/virt: do not re-randomize RNG seed on snapshot load
 * m68k/q800: do not re-randomize RNG seed on snapshot load
 * arm: re-randomize rng-seed on reboot
 * riscv: re-randomize rng-seed on reboot
 * mips/boston: re-randomize rng-seed on reboot
 * openrisc: re-randomize rng-seed on reboot
 * rx: re-randomize rng-seed on reboot

----------------------------------------------------------------
Ake Koomsin (1):
      target/arm: honor HCR_E2H and HCR_TGE in arm_excp_unmasked()

Axel Heider (1):
      target/imx: reload cmp timer outside of the reload ptimer transaction

Damien Hedde (1):
      hw/core/resettable: fix reset level counting

Jason A. Donenfeld (11):
      reset: allow registering handlers that aren't called by snapshot loading
      device-tree: add re-randomization helper function
      x86: do not re-randomize RNG seed on snapshot load
      arm: re-randomize rng-seed on reboot
      riscv: re-randomize rng-seed on reboot
      m68k/virt: do not re-randomize RNG seed on snapshot load
      m68k/q800: do not re-randomize RNG seed on snapshot load
      mips/boston: re-randomize rng-seed on reboot
      openrisc: re-randomize rng-seed on reboot
      rx: re-randomize rng-seed on reboot
      mips/malta: pass RNG seed via env var and re-randomize on reboot

Jean-Philippe Brucker (1):
      hw/arm/virt: Fix devicetree warnings about the virtio-iommu node

Peter Maydell (2):
      target/arm: Implement FEAT_E0PD
      hw/hyperv/hyperv.c: Use device_cold_reset() instead of device_legacy_reset()

Richard Henderson (14):
      target/arm: Introduce regime_is_stage2
      target/arm: Add ptw_idx to S1Translate
      target/arm: Add isar predicates for FEAT_HAFDBS
      target/arm: Extract HA and HD in aa64_va_parameters
      target/arm: Move S1_ptw_translate outside arm_ld[lq]_ptw
      target/arm: Add ARMFault_UnsuppAtomicUpdate
      target/arm: Remove loop from get_phys_addr_lpae
      target/arm: Fix fault reporting in get_phys_addr_lpae
      target/arm: Don't shift attrs in get_phys_addr_lpae
      target/arm: Consider GP an attribute in get_phys_addr_lpae
      target/arm: Tidy merging of attributes from descriptor and table
      target/arm: Implement FEAT_HAFDBS, access flag portion
      target/arm: Implement FEAT_HAFDBS, dirty bit portion
      target/arm: Use the max page size in a 2-stage ptw

 docs/devel/reset.rst          |   8 +-
 docs/system/arm/emulation.rst |   2 +
 qapi/run-state.json           |   6 +-
 include/hw/boards.h           |   2 +-
 include/sysemu/device_tree.h  |   9 +
 include/sysemu/reset.h        |   5 +-
 target/arm/cpu.h              |  15 ++
 target/arm/internals.h        |  30 +++
 hw/arm/aspeed.c               |   4 +-
 hw/arm/boot.c                 |   2 +
 hw/arm/mps2-tz.c              |   4 +-
 hw/arm/virt.c                 |   5 +-
 hw/core/reset.c               |  17 +-
 hw/core/resettable.c          |   3 +-
 hw/hppa/machine.c             |   4 +-
 hw/hyperv/hyperv.c            |   2 +-
 hw/i386/microvm.c             |   4 +-
 hw/i386/pc.c                  |   6 +-
 hw/i386/x86.c                 |   2 +-
 hw/m68k/q800.c                |  33 ++-
 hw/m68k/virt.c                |  20 +-
 hw/mips/boston.c              |   3 +
 hw/mips/malta.c               |  27 +++
 hw/openrisc/boot.c            |   3 +
 hw/ppc/pegasos2.c             |   4 +-
 hw/ppc/pnv.c                  |   4 +-
 hw/ppc/spapr.c                |   4 +-
 hw/riscv/boot.c               |   3 +
 hw/rx/rx-gdbsim.c             |   3 +
 hw/s390x/s390-virtio-ccw.c    |   4 +-
 hw/timer/imx_epit.c           |   9 +-
 migration/savevm.c            |   2 +-
 softmmu/device_tree.c         |  21 ++
 softmmu/runstate.c            |  11 +-
 target/arm/cpu.c              |  24 +-
 target/arm/cpu64.c            |   2 +
 target/arm/helper.c           |  31 ++-
 target/arm/ptw.c              | 525 ++++++++++++++++++++++++++++--------------
 38 files changed, 600 insertions(+), 263 deletions(-)

