Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8930339A535
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 18:01:57 +0200 (CEST)
Received: from localhost ([::1]:53912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lopnA-0002fZ-Gi
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 12:01:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lopkV-0007hN-4j
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 11:59:11 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:54815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lopkS-0006j4-Nw
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 11:59:10 -0400
Received: by mail-wm1-x336.google.com with SMTP id o127so3710077wmo.4
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 08:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PPDy+o4JU78kUxqh7LXWYy5CwMejCTQa4LeUQatLVAo=;
 b=POEsYwk+Do82WEkF4/akQRgRZZsNPC77xG4KBYBb2O67wjzj0tBHactPUN2Ro8Ph6G
 YUbN2HU3v6l5dHwkU94raoKu4/4UCFKkPuZ+QPj1ARC/4LH9uvuzMzmYhB/GPzeahK10
 TUiKu6YzeLT4VkSfCoMCSrF+iIZBYQRZx617VnTlaOyDr7PrkWvgjE9QRtRJHcyTeL40
 BbJUMe7ofNRm25+2aiGncviAkDcvE/0wr/vy6eeOdhf2sPI5EaIYac1b1iK0b7q32/hf
 /p1DwXAx2babXS3y7bKpxjltthovTUYMyPF2pODOqXl/cOC9vHG8PKyYU0GNFElJ4VE6
 rfpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PPDy+o4JU78kUxqh7LXWYy5CwMejCTQa4LeUQatLVAo=;
 b=h4Nlf/ruqSDF539MBq3alpbbBwry49kWgPMYzUWOZgAoxPaHTp71XScaR64kW1yUo9
 /vSVUA5xib/axk5XUP6gamLn4UUrJCmzvwh2fYjqPd+4UrfMdQrP6NnekdPOZafiOYvD
 J2QX1vpP2ot5qNqRBvWwt/7Ty9lI13hkPIYc0SQ+0eF7fFQqCqfOwNoVMtXgQjaPImVv
 mvmLwRd7CWdIdmllNabQ+CRsHip1qXI9eFRSMpaKWQmqmmLUx+r41o2AtsUsEE6WoqAa
 +4Ma2g+DSl34tqeT8mbkEqXlVG3yxPHnKNqou1vCW2VVmfbv4xpe0DFqfblbMqiC7RlW
 mLNw==
X-Gm-Message-State: AOAM530l8ESzi/NyfRRsqmMDr+oOuLA0FzpGXiwDAZAsnC7UnHcNjLPv
 644A+S0zPwQ0cVDKoTTOlGV5NnZvYSdHol2x
X-Google-Smtp-Source: ABdhPJyKlHLpzKhDviKd4AVQJme7Czlhe8uKA0m7DSnWSYckJ8A/rCDO+rhhoIDf6XqveICMJ+4WWg==
X-Received: by 2002:a1c:dd09:: with SMTP id u9mr18403003wmg.58.1622735946849; 
 Thu, 03 Jun 2021 08:59:06 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m7sm3856470wrv.35.2021.06.03.08.59.06
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 08:59:06 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 00/45] target-arm queue
Date: Thu,  3 Jun 2021 16:58:19 +0100
Message-Id: <20210603155904.26021-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
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

The following changes since commit a97978bcc2d1f650c7d411428806e5b03082b8c7:

  Merge remote-tracking branch 'remotes/dg-gitlab/tags/ppc-for-6.1-20210603' into staging (2021-06-03 10:00:35 +0100)

are available in the Git repository at:

  https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20210603

for you to fetch changes up to 1c861885894d840235954060050d240259f5340b:

  tests/unit/test-vmstate: Assert that dup() and mkstemp() succeed (2021-06-03 16:43:27 +0100)

----------------------------------------------------------------
target-arm queue:
 * Some not-yet-enabled preliminaries for M-profile MVE support
 * Consistently use "Cortex-Axx", not "Cortex Axx" in docs, comments
 * docs: Fix installation of man pages with Sphinx 4.x
 * Mark LDS{MIN,MAX} as signed operations
 * Fix missing syndrome value for DAIF and PAC check exceptions
 * Implement BFloat16 extensions
 * Refactoring of hvf accelerator code in preparation for aarch64 support
 * Fix some coverity nits in test code

----------------------------------------------------------------
Alexander Graf (12):
      hvf: Move assert_hvf_ok() into common directory
      hvf: Move vcpu thread functions into common directory
      hvf: Move cpu functions into common directory
      hvf: Move hvf internal definitions into common header
      hvf: Make hvf_set_phys_mem() static
      hvf: Remove use of hv_uvaddr_t and hv_gpaddr_t
      hvf: Split out common code on vcpu init and destroy
      hvf: Use cpu_synchronize_state()
      hvf: Make synchronize functions static
      hvf: Remove hvf-accel-ops.h
      hvf: Introduce hvf vcpu struct
      hvf: Simplify post reset/init/loadvm hooks

Damien Goutte-Gattat (1):
      docs: Fix installation of man pages with Sphinx 4.x

Jamie Iles (4):
      target/arm: fix missing exception class
      target/arm: fold do_raise_exception into raise_exception
      target/arm: use raise_exception_ra for MTE check failure
      target/arm: use raise_exception_ra for stack limit exception

Peter Maydell (15):
      target/arm: Add isar feature check functions for MVE
      target/arm: Update feature checks for insns which are "MVE or FP"
      target/arm: Move fpsp/fpdp isar check into callers of do_vfp_2op_sp/dp
      target/arm: Add MVE check to VMOV_reg_sp and VMOV_reg_dp
      target/arm: Fix return values in fp_sysreg_checks()
      target/arm: Implement M-profile VPR register
      target/arm: Make FPSCR.LTPSIZE writable for MVE
      target/arm: Allow board models to specify initial NS VTOR
      arm: Consistently use "Cortex-Axx", not "Cortex Axx"
      tests/qtest/bios-tables-test: Check for dup2() failure
      tests/qtest/e1000e-test: Check qemu_recv() succeeded
      tests/qtest/hd-geo-test: Fix checks on mkstemp() return value
      tests/qtest/pflash-cfi02-test: Avoid potential integer overflow
      tests/qtest/tpm-tests: Remove unnecessary NULL checks
      tests/unit/test-vmstate: Assert that dup() and mkstemp() succeed

Richard Henderson (13):
      target/arm: Mark LDS{MIN,MAX} as signed operations
      target/arm: Add isar_feature_{aa32, aa64, aa64_sve}_bf16
      target/arm: Unify unallocated path in disas_fp_1src
      target/arm: Implement scalar float32 to bfloat16 conversion
      target/arm: Implement vector float32 to bfloat16 conversion
      softfpu: Add float_round_to_odd_inf
      target/arm: Implement bfloat16 dot product (vector)
      target/arm: Implement bfloat16 dot product (indexed)
      target/arm: Implement bfloat16 matrix multiply accumulate
      target/arm: Implement bfloat widening fma (vector)
      target/arm: Implement bfloat widening fma (indexed)
      linux-user/aarch64: Enable hwcap bits for bfloat16
      target/arm: Enable BFloat16 extensions

 docs/conf.py                    |   1 +
 docs/system/arm/aspeed.rst      |   4 +-
 docs/system/arm/nuvoton.rst     |   6 +-
 docs/system/arm/sabrelite.rst   |   2 +-
 include/fpu/softfloat-types.h   |   4 +-
 include/hw/arm/allwinner-h3.h   |   2 +-
 include/hw/arm/armv7m.h         |   2 +
 include/hw/core/cpu.h           |   3 +-
 include/sysemu/hvf_int.h        |  58 +++++
 target/arm/cpu.h                |  48 +++-
 target/arm/helper-sve.h         |   4 +
 target/arm/helper.h             |  15 ++
 target/i386/hvf/hvf-accel-ops.h |  23 --
 target/i386/hvf/hvf-i386.h      |  33 +--
 target/i386/hvf/vmx.h           |  24 +-
 target/i386/hvf/x86hvf.h        |   2 -
 target/arm/neon-dp.decode       |   1 +
 target/arm/neon-shared.decode   |  11 +
 target/arm/sve.decode           |  19 +-
 target/arm/vfp.decode           |   2 +
 accel/hvf/hvf-accel-ops.c       | 471 ++++++++++++++++++++++++++++++++++++++++
 accel/hvf/hvf-all.c             |  47 ++++
 hw/arm/armv7m.c                 |   7 +
 hw/arm/aspeed.c                 |   6 +-
 hw/arm/mcimx6ul-evk.c           |   2 +-
 hw/arm/mcimx7d-sabre.c          |   2 +-
 hw/arm/npcm7xx_boards.c         |   4 +-
 hw/arm/sabrelite.c              |   2 +-
 hw/misc/npcm7xx_clk.c           |   2 +-
 linux-user/elfload.c            |   2 +
 target/arm/cpu.c                |  13 ++
 target/arm/cpu64.c              |   3 +
 target/arm/cpu_tcg.c            |   1 +
 target/arm/m_helper.c           |   5 +-
 target/arm/machine.c            |  20 ++
 target/arm/mte_helper.c         |  12 +-
 target/arm/op_helper.c          |  32 ++-
 target/arm/sve_helper.c         |   2 +
 target/arm/translate-a64.c      | 155 +++++++++++--
 target/arm/translate-neon.c     |  91 ++++++++
 target/arm/translate-sve.c      | 112 ++++++++++
 target/arm/translate-vfp.c      | 164 ++++++++++----
 target/arm/vec_helper.c         | 140 +++++++++++-
 target/arm/vfp_helper.c         |  21 +-
 target/i386/hvf/hvf-accel-ops.c | 146 -------------
 target/i386/hvf/hvf.c           | 464 +++++----------------------------------
 target/i386/hvf/x86.c           |  28 +--
 target/i386/hvf/x86_descr.c     |  26 +--
 target/i386/hvf/x86_emu.c       |  62 +++---
 target/i386/hvf/x86_mmu.c       |   4 +-
 target/i386/hvf/x86_task.c      |  12 +-
 target/i386/hvf/x86hvf.c        | 222 +++++++++----------
 tests/qtest/bios-tables-test.c  |   8 +-
 tests/qtest/e1000e-test.c       |   3 +-
 tests/qtest/hd-geo-test.c       |   4 +-
 tests/qtest/pflash-cfi02-test.c |   2 +-
 tests/qtest/tpm-tests.c         |  12 +-
 tests/unit/test-vmstate.c       |   5 +-
 fpu/softfloat-parts.c.inc       |   6 +-
 MAINTAINERS                     |   8 +
 accel/hvf/meson.build           |   7 +
 accel/meson.build               |   1 +
 target/i386/hvf/meson.build     |   1 -
 63 files changed, 1666 insertions(+), 935 deletions(-)
 create mode 100644 include/sysemu/hvf_int.h
 delete mode 100644 target/i386/hvf/hvf-accel-ops.h
 create mode 100644 accel/hvf/hvf-accel-ops.c
 create mode 100644 accel/hvf/hvf-all.c
 delete mode 100644 target/i386/hvf/hvf-accel-ops.c
 create mode 100644 accel/hvf/meson.build

