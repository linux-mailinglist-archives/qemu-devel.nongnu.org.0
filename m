Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 419D231D7E1
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 12:06:53 +0100 (CET)
Received: from localhost ([::1]:34412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCKfU-0006BA-Bo
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 06:06:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lCKcV-0003yj-5E
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 06:03:47 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:54635)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lCKcT-0001f2-3P
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 06:03:46 -0500
Received: by mail-wm1-x333.google.com with SMTP id w4so1724960wmi.4
 for <qemu-devel@nongnu.org>; Wed, 17 Feb 2021 03:03:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gOD9Vhfx20P8Nff5zb+Kvdov1mLL1UqNdCETnnbVSfI=;
 b=HCA/UyWS2CjZ6aUmCO+K9uPghtAbCQ8uuiOqyhzBT/WpTY+LNbFnC6vx5wjQvluHLZ
 +kFsH1zGklSgPd9636r4hs2kydHzNCqqip7reCGVfFFSTzhcUCgpSLLFmLnLOj9E6Meq
 PyKNbAXaSF71L7CMwcjsfuVQHf6h6pSXQXPkzU1HEA0COnkH1UY/V7jTRRLD7eskOTEn
 HAFzi1pZ5GCBkDs/7CtsvQACzDisqkOrhN+FjkF6C5EoZ9dxlipIok4hYHyCi3hnqvkA
 CyHxVbKAFJSdxUGZqpzgSWlsr2UonAFl71F+H7ujjZis6lR0CQocJtcco4agU9hP2DWm
 2o5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gOD9Vhfx20P8Nff5zb+Kvdov1mLL1UqNdCETnnbVSfI=;
 b=NJkhQigCBLvI1hNJXK3jGRO4P11lmp3njvTCcTWMbNevNPm45UIeMPtEFNGNyBbBuD
 RXbB77qRfZU9lxH0s6dYSU6s4E1qeQqjKi9SDM2+k8FgyRuwrtspHKr8gTGQRu5+sFZa
 xApkPArYs9YXJp2M7uL1c2HdAtwxer8FCRXtE+bUWsiDzyJZrbnRQ1Hvir01uEyZU5MS
 oJSBb64A5JCzNeQZvV1ku9dtMC7kinIPMw9b0JI1wD2cQy/MRIXqeeiTKzzxIqnWR80u
 KPLPcTAeTCGeMbK4NV3rXsRqbf/pH8Kpc7x5Y47nPBbC6ncEfSOmBDfYTmISHOKXdp/W
 xSxA==
X-Gm-Message-State: AOAM531HoQ2ZAvff9Klzom5vTxJbUcxCq/sAbm//95fklN7mjI8iFYBB
 vx7p0l3uV8sGOLuc5uAve7X8xtnD5OUx4g==
X-Google-Smtp-Source: ABdhPJwG4bI/MQbYBR8duvFpXVmiLU220seroKWPbXCgbYj3010UDMWyAhy5plW3Rdv5GEer8xVyuQ==
X-Received: by 2002:a7b:c1d6:: with SMTP id a22mr6544483wmj.113.1613559823394; 
 Wed, 17 Feb 2021 03:03:43 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id t16sm3268118wrp.87.2021.02.17.03.03.42
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Feb 2021 03:03:42 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL v2 00/37] target-arm queue
Date: Wed, 17 Feb 2021 11:03:41 +0000
Message-Id: <20210217110341.2243-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
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

v2: dropped the npcm7xx ethernet device, whose test case
fails weirdly on the 'build-disabled' gitlab CI job:
https://gitlab.com/qemu-project/qemu/-/jobs/1034174731#L12

The following changes since commit 8ba4bca570ace1e60614a0808631a517cf5df67a:

  Merge remote-tracking branch 'remotes/kevin/tags/for-upstream' into staging (2021-02-15 17:13:57 +0000)

are available in the Git repository at:

  https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20210217

for you to fetch changes up to 59c7a187dd8bd8ef675768dd8af9de11528ea7e2:

  MAINTAINERS: add myself maintainer for the clock framework (2021-02-16 14:16:17 +0000)

----------------------------------------------------------------
target-arm queue:
 * Support ARMv8.5-MemTag for linux-user
 * ncpm7xx: Support SMBus
 * MAINTAINERS: add section for Clock framework

----------------------------------------------------------------
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

 docs/system/arm/nuvoton.rst         |    2 +-
 bsd-user/qemu.h                     |   17 +-
 include/exec/cpu-all.h              |   47 +-
 include/exec/cpu_ldst.h             |   39 +-
 include/exec/exec-all.h             |    2 +-
 include/hw/arm/npcm7xx.h            |    2 +
 include/hw/i2c/npcm7xx_smbus.h      |  113 ++++
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
 hw/arm/npcm7xx.c                    |   68 ++-
 hw/arm/npcm7xx_boards.c             |   46 ++
 hw/i2c/npcm7xx_smbus.c              | 1099 +++++++++++++++++++++++++++++++++++
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
 tests/qtest/meson.build             |    1 +
 tests/tcg/aarch64/Makefile.target   |    6 +
 tests/tcg/configure.sh              |    4 +
 56 files changed, 2976 insertions(+), 553 deletions(-)
 create mode 100644 include/hw/i2c/npcm7xx_smbus.h
 create mode 100644 target/arm/syndrome.h
 create mode 100644 tests/tcg/aarch64/mte.h
 create mode 100644 hw/i2c/npcm7xx_smbus.c
 create mode 100644 tests/qtest/npcm7xx_smbus-test.c
 create mode 100644 tests/tcg/aarch64/mte-1.c
 create mode 100644 tests/tcg/aarch64/mte-2.c
 create mode 100644 tests/tcg/aarch64/mte-3.c
 create mode 100644 tests/tcg/aarch64/mte-4.c

