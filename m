Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4078318BCF
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 14:18:52 +0100 (CET)
Received: from localhost ([::1]:36054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lABrv-0006Q9-Nv
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 08:18:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lABYo-0007mD-Hp
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 07:59:06 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:36748)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lABYm-0008Jd-Df
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 07:59:06 -0500
Received: by mail-wr1-x42d.google.com with SMTP id u14so4117191wri.3
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 04:59:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Aqh8d9QeINGm7uiMxk98jRalTwD8uXlwhGej2U9JU78=;
 b=Eu0sNUK7NoQc+akbzn9RUOXAJWWmBEO7Iw/lvp+zyRQqfsUVv9tlFxp/tCYX8ZJgsd
 BDCgFaajKMF9H+kkPx2Nj3zKwD4uSAk0rACeTCVlQ0AEPdkV0EKuDOobsAARctRFwGfS
 /38wGvKqSagT+Ls8+5YaVEcIoam440HT/PEEfl3XrKC900l5OH/6yJTUKvpVlhh3O7ot
 Xr+lUUEpAHnM6kyLFnusB0KqA3oDH+GwKZ4t0dpkX14og9FzbDM8XqjvnXzHzmjh3Our
 qUGpd3zJNqKZpDB1mAG7cqknFGjN7p5E2JG1BMR9uOWA8HTQ41AvUeUX8Iz4f4xXffrK
 9gzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Aqh8d9QeINGm7uiMxk98jRalTwD8uXlwhGej2U9JU78=;
 b=sTTP9zvCntzcnzF2oTs7KBcaA37mEPy9w8LbyhtXmU6UusQiUagPnWSM7XS+RwxU5X
 x5TIy2JnqD5ZyUx/tZGrmoBc5o+1lvbTWbxQ5rQ/LFy8yUYvqkf9QACwLyKRfNRIo43p
 3Fr0RbpdESPxpba392TQHclsp370MwZqL6NKCJSrOH76pGcf2uRrkISpBFujdHQHASvH
 Y4UPHIPwun2uC0pnymdtmUpUDR/Y6WxY8/rbGDG1mT5ySj4H7BlG72nC0ZIQJCV23xCb
 3ohzWXmHwhGba9hqEOskyDxECF7Nqi2glFVi9JNKit8jakALQumRblc6LDJId9p/MIkB
 oUBQ==
X-Gm-Message-State: AOAM532QP2l17CyhAwFoJFX9wINFb9Z4dWhTwolfQmISELEd7p5+OEpz
 FloTNM0L20JTidPwNhkMEVmZzlQZHp2/LA==
X-Google-Smtp-Source: ABdhPJyciK3s8YaUBoReJ63rGftHrXAZHQuhK2+MZCj6fZnikUmauKXkMauWIslI5EsNYC5EEwKSUw==
X-Received: by 2002:a5d:4ecf:: with SMTP id s15mr689168wrv.132.1613048342759; 
 Thu, 11 Feb 2021 04:59:02 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g15sm4955716wrx.1.2021.02.11.04.59.01
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Feb 2021 04:59:02 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 00/45] target-arm queue
Date: Thu, 11 Feb 2021 12:58:15 +0000
Message-Id: <20210211125900.22777-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
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

Arm queue; the big bit here is RTH's MTE for user-mode series.

-- PMM

The following changes since commit 83339e21d05c824ebc9131d644f25c23d0e41ecf:

  Merge remote-tracking branch 'remotes/stefanha-gitlab/tags/block-pull-request' into staging (2021-02-10 15:42:20 +0000)

are available in the Git repository at:

  https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20210211

for you to fetch changes up to 5213c78932ecf4bae18d62baf8735724e25fb478:

  target/arm: Correctly initialize MDCR_EL2.HPMN (2021-02-11 11:50:16 +0000)

----------------------------------------------------------------
target-arm queue:
 * Correctly initialize MDCR_EL2.HPMN
 * versal: Use nr_apu_cpus in favor of hard coding 2
 * npcm7xx: Add ethernet device
 * Enable ARMv8.4-MemTag for user-mode emulation
 * accel/tcg: Add URL of clang bug to comment about our workaround
 * Add support for FEAT_DIT, Data Independent Timing
 * Remove GPIO from unimplemented NPCM7XX
 * Fix SCR RES1 handling
 * Don't migrate CPUARMState.features

----------------------------------------------------------------
Aaron Lindsay (1):
      target/arm: Don't migrate CPUARMState.features

Daniel Müller (1):
      target/arm: Correctly initialize MDCR_EL2.HPMN

Doug Evans (3):
      hw/net: Add npcm7xx emc model
      hw/arm: Add npcm7xx emc model
      tests/qtests: Add npcm7xx emc model test

Edgar E. Iglesias (1):
      hw/arm: versal: Use nr_apu_cpus in favor of hard coding 2

Hao Wu (1):
      hw/arm: Remove GPIO from unimplemented NPCM7XX

Mike Nawrocki (1):
      target/arm: Fix SCR RES1 handling

Peter Maydell (2):
      arm: Update infocenter.arm.com URLs
      accel/tcg: Add URL of clang bug to comment about our workaround

Rebecca Cran (4):
      target/arm: Add support for FEAT_DIT, Data Independent Timing
      target/arm: Support AA32 DIT by moving PSTATE_SS from cpsr into env->pstate
      target/arm: Set ID_AA64PFR0.DIT and ID_PFR0.DIT to 1 for "max" AA64 CPU
      target/arm: Set ID_PFR0.DIT to 1 for "max" 32-bit CPU

Richard Henderson (31):
      tcg: Introduce target-specific page data for user-only
      linux-user: Introduce PAGE_ANON
      exec: Use uintptr_t for guest_base
      exec: Use uintptr_t in cpu_ldst.h
      exec: Improve types for guest_addr_valid
      linux-user: Check for overflow in access_ok
      linux-user: Tidy VERIFY_READ/VERIFY_WRITE
      bsd-user: Tidy VERIFY_READ/VERIFY_WRITE
      linux-user: Do not use guest_addr_valid for h2g_valid
      linux-user: Fix guest_addr_valid vs reserved_va
      exec: Introduce cpu_untagged_addr
      exec: Use cpu_untagged_addr in g2h; split out g2h_untagged
      linux-user: Explicitly untag memory management syscalls
      linux-user: Use guest_range_valid in access_ok
      exec: Rename guest_{addr,range}_valid to *_untagged
      linux-user: Use cpu_untagged_addr in access_ok; split out *_untagged
      linux-user: Move lock_user et al out of line
      linux-user: Fix types in uaccess.c
      linux-user: Handle tags in lock_user/unlock_user
      linux-user/aarch64: Implement PR_TAGGED_ADDR_ENABLE
      target/arm: Improve gen_top_byte_ignore
      target/arm: Use the proper TBI settings for linux-user
      linux-user/aarch64: Implement PR_MTE_TCF and PR_MTE_TAG
      linux-user/aarch64: Implement PROT_MTE
      target/arm: Split out syndrome.h from internals.h
      linux-user/aarch64: Pass syndrome to EXC_*_ABORT
      linux-user/aarch64: Signal SEGV_MTESERR for sync tag check fault
      linux-user/aarch64: Signal SEGV_MTEAERR for async tag check error
      target/arm: Add allocation tag storage for user mode
      target/arm: Enable MTE for user-only
      tests/tcg/aarch64: Add mte smoke tests

 docs/system/arm/nuvoton.rst            |   3 +-
 bsd-user/qemu.h                        |   9 +-
 include/exec/cpu-all.h                 |  47 +-
 include/exec/cpu_ldst.h                |  39 +-
 include/exec/exec-all.h                |   2 +-
 include/hw/arm/npcm7xx.h               |   2 +
 include/hw/dma/pl080.h                 |   7 +-
 include/hw/misc/arm_integrator_debug.h |   2 +-
 include/hw/net/npcm7xx_emc.h           | 286 +++++++++++
 include/hw/ssi/pl022.h                 |   5 +-
 linux-user/aarch64/target_signal.h     |   3 +
 linux-user/aarch64/target_syscall.h    |  13 +
 linux-user/qemu.h                      |  76 +--
 linux-user/syscall_defs.h              |   1 +
 target/arm/cpu-param.h                 |   3 +
 target/arm/cpu.h                       |  49 ++
 target/arm/internals.h                 | 255 +---------
 target/arm/syndrome.h                  | 273 +++++++++++
 tests/tcg/aarch64/mte.h                |  60 +++
 accel/tcg/cpu-exec.c                   |  25 +-
 accel/tcg/translate-all.c              |  32 +-
 accel/tcg/user-exec.c                  |  51 +-
 bsd-user/main.c                        |   4 +-
 hw/arm/aspeed_ast2600.c                |   2 +-
 hw/arm/musca.c                         |   4 +-
 hw/arm/npcm7xx.c                       |  58 ++-
 hw/arm/xlnx-versal.c                   |   4 +-
 hw/misc/arm_integrator_debug.c         |   2 +-
 hw/net/npcm7xx_emc.c                   | 857 +++++++++++++++++++++++++++++++++
 hw/timer/arm_timer.c                   |   7 +-
 linux-user/aarch64/cpu_loop.c          |  38 +-
 linux-user/elfload.c                   |  18 +-
 linux-user/flatload.c                  |   2 +-
 linux-user/hppa/cpu_loop.c             |  39 +-
 linux-user/i386/cpu_loop.c             |   6 +-
 linux-user/i386/signal.c               |   5 +-
 linux-user/main.c                      |   4 +-
 linux-user/mmap.c                      |  86 ++--
 linux-user/ppc/signal.c                |   4 +-
 linux-user/syscall.c                   | 165 +++++--
 linux-user/uaccess.c                   |  82 +++-
 target/arm/cpu.c                       |  29 +-
 target/arm/cpu64.c                     |   5 +
 target/arm/helper-a64.c                |  31 +-
 target/arm/helper.c                    |  71 ++-
 target/arm/machine.c                   |   2 +-
 target/arm/mte_helper.c                |  39 +-
 target/arm/op_helper.c                 |   9 +-
 target/arm/tlb_helper.c                |  15 +-
 target/arm/translate-a64.c             |  37 +-
 target/hppa/op_helper.c                |   2 +-
 target/i386/tcg/mem_helper.c           |   2 +-
 target/s390x/mem_helper.c              |   4 +-
 tests/qtest/npcm7xx_emc-test.c         | 812 +++++++++++++++++++++++++++++++
 tests/tcg/aarch64/mte-1.c              |  28 ++
 tests/tcg/aarch64/mte-2.c              |  45 ++
 tests/tcg/aarch64/mte-3.c              |  51 ++
 tests/tcg/aarch64/mte-4.c              |  45 ++
 tests/tcg/aarch64/pauth-2.c            |   1 -
 hw/net/meson.build                     |   1 +
 hw/net/trace-events                    |  17 +
 tests/qtest/meson.build                |   1 +
 tests/tcg/aarch64/Makefile.target      |   6 +
 tests/tcg/configure.sh                 |   4 +
 64 files changed, 3312 insertions(+), 575 deletions(-)
 create mode 100644 include/hw/net/npcm7xx_emc.h
 create mode 100644 target/arm/syndrome.h
 create mode 100644 tests/tcg/aarch64/mte.h
 create mode 100644 hw/net/npcm7xx_emc.c
 create mode 100644 tests/qtest/npcm7xx_emc-test.c
 create mode 100644 tests/tcg/aarch64/mte-1.c
 create mode 100644 tests/tcg/aarch64/mte-2.c
 create mode 100644 tests/tcg/aarch64/mte-3.c
 create mode 100644 tests/tcg/aarch64/mte-4.c

