Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 776F131CDD8
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 17:19:30 +0100 (CET)
Received: from localhost ([::1]:59896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC34T-0000bB-G1
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 11:19:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lC32D-0006td-RV
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 11:17:09 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:54555)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lC328-0002Li-32
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 11:17:09 -0500
Received: by mail-wm1-x32e.google.com with SMTP id w4so9549838wmi.4
 for <qemu-devel@nongnu.org>; Tue, 16 Feb 2021 08:17:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/4g7OxkDfBoZUgvDH1ddlqQHuAeacEL0ex4Mh5BK8po=;
 b=gBCZ3z0k7yIiqHOuLpIbGmxlVuutSoa5wqI8IPySUTQkOtm0ZGZAO2r8aHP13qV7M5
 XnCs9nShtVEE+8Rmemdr+hExNeFxYaNR6BK14URGpik2xfa2w2LlbykBZ6P9s4zzHDNl
 AkJM1l5V6RjoT2JWAIaBeBIbHEwm8z/8baR3hLBU74BlEo2E+B3bBRhSHg60axJnhfnU
 RO7nurDGrNiKcLrXTKxYJwvRXSsnXokWPhYAhlD3k1srSMnHqbXfJKlqR5BynO0bLph7
 r9GTofkKWyzZK2E3etqTRSxlDmryqvW3EsCwvIaId+jYC24VzIAaJrbgpT5q3p8DHiC/
 LAxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/4g7OxkDfBoZUgvDH1ddlqQHuAeacEL0ex4Mh5BK8po=;
 b=SSw6yeBawbPGzpnmBEO/4/th4qsn7va+y8qvGf4pghjmH7XbXx0MiJFDTjZ8EojCJR
 BoB36PPhQp69DcqNXbEfkWhIALdkPSDG0O288DBOPxkObercrrAyxI4X5zPKMmayAD45
 LbeQWIxwUqW3tf7GXYsQjt9lxRlekZu8q53ZC98YjySmfs0CT28KIMDZ/SbOfaZZOxuG
 S5XMfd/AaLnFED59kgA/e9X/v5dVRY5UMkPNv0TASnJfD5Rb2srjN+fIkQBJFJx6NVJt
 idcklZuiVZFryI7D+zCNDAoRzAqGyKFRy/z0TgTh65ersMB6RrrLZq0F1sgKHS9LcFbD
 hnjw==
X-Gm-Message-State: AOAM531P4Tw7Iu/69rIx7VAj4T6ywAX6y8DN89FKdCXHyQGEkIrZRDzl
 5pjKtI5ZQWPImJm6TayL/Op1G2zKfg7YbA==
X-Google-Smtp-Source: ABdhPJzV7CFfa8q1+oWq74HP/4gILMxpI/ez17wZxo36OM7F/iAfT85HfNwncWLFZbHgLrdDsJyhPA==
X-Received: by 2002:a05:600c:2351:: with SMTP id
 17mr3880382wmq.2.1613492220745; 
 Tue, 16 Feb 2021 08:17:00 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id d5sm30630482wrb.14.2021.02.16.08.17.00
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Feb 2021 08:17:00 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 00/40] target-arm queue
Date: Tue, 16 Feb 2021 16:16:18 +0000
Message-Id: <20210216161658.29881-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
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

Another go at the v8.5-MemTag linux-user support, plus a
couple more npcm7xx devices.

-- PMM

The following changes since commit 8ba4bca570ace1e60614a0808631a517cf5df67a:

  Merge remote-tracking branch 'remotes/kevin/tags/for-upstream' into staging (2021-02-15 17:13:57 +0000)

are available in the Git repository at:

  https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20210216

for you to fetch changes up to 64fd5bddf3b71d1b92b55382ab39768bd87ecfbd:

  tests/qtests: Add npcm7xx emc model test (2021-02-16 14:27:05 +0000)

----------------------------------------------------------------
target-arm queue:
 * Support ARMv8.5-MemTag for linux-user
 * ncpm7xx: Support SMBus, EMC ethernet devices
 * MAINTAINERS: add section for Clock framework

----------------------------------------------------------------
Doug Evans (3):
      hw/net: Add npcm7xx emc model
      hw/arm: Add npcm7xx emc model
      tests/qtests: Add npcm7xx emc model test

Hao Wu (5):
      hw/i2c: Implement NPCM7XX SMBus Module Single Mode
      hw/arm: Add I2C sensors for NPCM750 eval board
      hw/arm: Add I2C sensors and EEPROM for GSJ machine
      hw/i2c: Add a QTest for NPCM7XX SMBus Device
      hw/i2c: Implement NPCM7XX SMBus Module FIFO Mode

Luc Michel (1):
      MAINTAINERS: add myself maintainer for the clock framework

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

 docs/system/arm/nuvoton.rst         |    5 +-
 bsd-user/qemu.h                     |   17 +-
 include/exec/cpu-all.h              |   47 +-
 include/exec/cpu_ldst.h             |   39 +-
 include/exec/exec-all.h             |    2 +-
 include/hw/arm/npcm7xx.h            |    4 +
 include/hw/i2c/npcm7xx_smbus.h      |  113 ++++
 include/hw/net/npcm7xx_emc.h        |  286 +++++++++
 linux-user/aarch64/target_signal.h  |    3 +
 linux-user/aarch64/target_syscall.h |   13 +
 linux-user/qemu.h                   |   76 +--
 linux-user/syscall_defs.h           |    1 +
 target/arm/cpu-param.h              |    3 +
 target/arm/cpu.h                    |   32 +
 target/arm/internals.h              |  249 +-------
 target/arm/syndrome.h               |  273 +++++++++
 tests/tcg/aarch64/mte.h             |   60 ++
 accel/tcg/translate-all.c           |   32 +-
 accel/tcg/user-exec.c               |   51 +-
 bsd-user/elfload.c                  |    2 +-
 bsd-user/main.c                     |    8 +-
 bsd-user/mmap.c                     |   23 +-
 hw/arm/npcm7xx.c                    |  118 +++-
 hw/arm/npcm7xx_boards.c             |   46 ++
 hw/i2c/npcm7xx_smbus.c              | 1099 +++++++++++++++++++++++++++++++++++
 hw/net/npcm7xx_emc.c                |  857 +++++++++++++++++++++++++++
 linux-user/aarch64/cpu_loop.c       |   38 +-
 linux-user/elfload.c                |   18 +-
 linux-user/flatload.c               |    2 +-
 linux-user/hppa/cpu_loop.c          |   39 +-
 linux-user/i386/cpu_loop.c          |    6 +-
 linux-user/i386/signal.c            |    5 +-
 linux-user/main.c                   |    4 +-
 linux-user/mmap.c                   |   88 +--
 linux-user/ppc/signal.c             |    4 +-
 linux-user/syscall.c                |  165 ++++--
 linux-user/uaccess.c                |   82 ++-
 target/arm/cpu.c                    |   25 +-
 target/arm/helper-a64.c             |    4 +-
 target/arm/mte_helper.c             |   39 +-
 target/arm/tlb_helper.c             |   15 +-
 target/arm/translate-a64.c          |   25 +-
 target/hppa/op_helper.c             |    2 +-
 target/i386/tcg/mem_helper.c        |    2 +-
 target/s390x/mem_helper.c           |    4 +-
 tests/qtest/npcm7xx_emc-test.c      |  862 +++++++++++++++++++++++++++
 tests/qtest/npcm7xx_smbus-test.c    |  495 ++++++++++++++++
 tests/tcg/aarch64/mte-1.c           |   28 +
 tests/tcg/aarch64/mte-2.c           |   45 ++
 tests/tcg/aarch64/mte-3.c           |   51 ++
 tests/tcg/aarch64/mte-4.c           |   45 ++
 tests/tcg/aarch64/pauth-2.c         |    1 -
 MAINTAINERS                         |   11 +
 hw/arm/Kconfig                      |    1 +
 hw/i2c/meson.build                  |    1 +
 hw/i2c/trace-events                 |   12 +
 hw/net/meson.build                  |    1 +
 hw/net/trace-events                 |   17 +
 tests/qtest/meson.build             |    2 +
 tests/tcg/aarch64/Makefile.target   |    6 +
 tests/tcg/configure.sh              |    4 +
 61 files changed, 5052 insertions(+), 556 deletions(-)
 create mode 100644 include/hw/i2c/npcm7xx_smbus.h
 create mode 100644 include/hw/net/npcm7xx_emc.h
 create mode 100644 target/arm/syndrome.h
 create mode 100644 tests/tcg/aarch64/mte.h
 create mode 100644 hw/i2c/npcm7xx_smbus.c
 create mode 100644 hw/net/npcm7xx_emc.c
 create mode 100644 tests/qtest/npcm7xx_emc-test.c
 create mode 100644 tests/qtest/npcm7xx_smbus-test.c
 create mode 100644 tests/tcg/aarch64/mte-1.c
 create mode 100644 tests/tcg/aarch64/mte-2.c
 create mode 100644 tests/tcg/aarch64/mte-3.c
 create mode 100644 tests/tcg/aarch64/mte-4.c

