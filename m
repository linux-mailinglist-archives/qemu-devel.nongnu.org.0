Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 710EC2FBAD3
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 16:15:26 +0100 (CET)
Received: from localhost ([::1]:59232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1sj5-0003Pn-U8
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 10:15:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1sf1-0007KF-0T
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 10:11:12 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:38478)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1sey-000183-DG
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 10:11:10 -0500
Received: by mail-wr1-x42b.google.com with SMTP id a9so16621495wrt.5
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 07:11:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Eul6bbu4Izl6G6mF6Kh7XfNVnLHrdyeUf2tXfwmffoY=;
 b=QCPvonxK6BMEZxGLDyHOtQOwW3NPD91mWgXLTPxURFu3s8LOQgeUKqwR1+VgkdIjQE
 5Nnwrs4JjNMcZoej2BMKt0dzogUp0OnK6kSU9SCUuVMWzf2DKUSmK/7Fce0gI41kMsu0
 dWjaIubJDe0TJKuXi/xRa5GboQtwW6IhBBKrys256PqTWoAMKCimL2GwyQhE09V/TfxX
 ohFTDwZ29ACrAiisEF/RZGegCQ1At3SV3YJ0v794UgYEoDin8TTCAT3CIvtjvS9VXN7i
 APEn+GPgoU+2NtcylzsAZn0emm4uVUsYTsm2M/aOEWUHOR8xaAphH9BmamXOWDY7EwPR
 1XFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Eul6bbu4Izl6G6mF6Kh7XfNVnLHrdyeUf2tXfwmffoY=;
 b=kl6H34jOIoeV/sE+tYdWndD3TY6ZCJBvXHPiVMrUSfrEXYP8IsXG/soXT2njv9W3Xv
 uS7mmne/OvDgZf1LjE87YWC/+frrvSXQt/BiUOfDI39Wkzz7VnO1ddSCuJJE+S/eHjA8
 wI6PDOhIVozZ34oB1cvHaWa3q8Wl/V5TD8Fad3f/pv5tju1FKa+NfyKpFqirWVb1tVzd
 NG4Mu2Ss/Lme7bj9jnVsQWxw6RHsJ8WmuCC49f/jaC/O6XhQZjP3B/5jIYuwaWOxvBhi
 LXZC+3tsWvbtNk92TjJOEaqUGW1b9yvwPP68vHMnuqZ/OlKJka8oFeRCjTYzfmzestsD
 BK3Q==
X-Gm-Message-State: AOAM5336CXOHjZtCgQlfTUnQY4lXl7mjI/jjNAmE71ziT80lUzstA465
 BpgwuP8bVE6Ox5cbWvKOJF0aMP2HNhUeVA==
X-Google-Smtp-Source: ABdhPJwpxKPb48p1ZtUKptl8FoSGfzhSQpmhPSZEry+fhZGxICUfLV0YzUN62UBwTEHXeA6uULXPzg==
X-Received: by 2002:adf:ef51:: with SMTP id c17mr4899844wrp.101.1611069066516; 
 Tue, 19 Jan 2021 07:11:06 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id a184sm4843699wme.35.2021.01.19.07.11.05
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jan 2021 07:11:06 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 00/33] target-arm queue
Date: Tue, 19 Jan 2021 15:10:31 +0000
Message-Id: <20210119151104.16264-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
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

Arm pullreq: Rémi's ARMv8.4-SEL2 support is the big thing here.

thanks
-- PMM

The following changes since commit f1fcb6851aba6dd9838886dc179717a11e344a1c:

  Merge remote-tracking branch 'remotes/huth-gitlab/tags/pull-request-2021-01-19' into staging (2021-01-19 11:57:07 +0000)

are available in the Git repository at:

  https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20210119

for you to fetch changes up to 6d39956891b3d1857af84f72f0230a6d99eb3b6a:

  docs: Build and install all the docs in a single manual (2021-01-19 14:38:53 +0000)

----------------------------------------------------------------
target-arm queue:
 * Implement IMPDEF pauth algorithm
 * Support ARMv8.4-SEL2
 * Fix bug where we were truncating predicate vector lengths in SVE insns
 * Implement new pvpanic-pci device
 * npcm7xx_adc-test: Fix memleak in adc_qom_set
 * target/arm/m_helper: Silence GCC 10 maybe-uninitialized error
 * docs: Build and install all the docs in a single manual

----------------------------------------------------------------
Gan Qixin (1):
      npcm7xx_adc-test: Fix memleak in adc_qom_set

Mihai Carabas (4):
      hw/misc/pvpanic: split-out generic and bus dependent code
      hw/misc/pvpanic: add PCI interface support
      pvpanic : update pvpanic spec document
      tests/qtest: add a test case for pvpanic-pci

Peter Maydell (1):
      docs: Build and install all the docs in a single manual

Philippe Mathieu-Daudé (1):
      target/arm/m_helper: Silence GCC 10 maybe-uninitialized error

Richard Henderson (7):
      target/arm: Implement an IMPDEF pauth algorithm
      target/arm: Add cpu properties to control pauth
      target/arm: Use object_property_add_bool for "sve" property
      target/arm: Introduce PREDDESC field definitions
      target/arm: Update PFIRST, PNEXT for pred_desc
      target/arm: Update ZIP, UZP, TRN for pred_desc
      target/arm: Update REV, PUNPK for pred_desc

Rémi Denis-Courmont (19):
      target/arm: remove redundant tests
      target/arm: add arm_is_el2_enabled() helper
      target/arm: use arm_is_el2_enabled() where applicable
      target/arm: use arm_hcr_el2_eff() where applicable
      target/arm: factor MDCR_EL2 common handling
      target/arm: Define isar_feature function to test for presence of SEL2
      target/arm: add 64-bit S-EL2 to EL exception table
      target/arm: add MMU stage 1 for Secure EL2
      target/arm: add ARMv8.4-SEL2 system registers
      target/arm: handle VMID change in secure state
      target/arm: do S1_ptw_translate() before address space lookup
      target/arm: translate NS bit in page-walks
      target/arm: generalize 2-stage page-walk condition
      target/arm: secure stage 2 translation regime
      target/arm: set HPFAR_EL2.NS on secure stage 2 faults
      target/arm: revector to run-time pick target EL
      target/arm: Implement SCR_EL2.EEL2
      target/arm: enable Secure EL2 in max CPU
      target/arm: refactor vae1_tlbmask()

 docs/conf.py                     |  46 ++++-
 docs/devel/conf.py               |  15 --
 docs/index.html.in               |  17 --
 docs/interop/conf.py             |  28 ---
 docs/meson.build                 |  64 +++---
 docs/specs/conf.py               |  16 --
 docs/specs/pci-ids.txt           |   1 +
 docs/specs/pvpanic.txt           |  13 +-
 docs/system/arm/cpu-features.rst |  21 ++
 docs/system/conf.py              |  28 ---
 docs/tools/conf.py               |  37 ----
 docs/user/conf.py                |  15 --
 include/hw/misc/pvpanic.h        |  24 ++-
 include/hw/pci/pci.h             |   1 +
 include/qemu/xxhash.h            |  98 +++++++++
 target/arm/cpu-param.h           |   2 +-
 target/arm/cpu.h                 | 107 ++++++++--
 target/arm/internals.h           |  45 +++++
 hw/misc/pvpanic-isa.c            |  94 +++++++++
 hw/misc/pvpanic-pci.c            |  95 +++++++++
 hw/misc/pvpanic.c                |  85 +-------
 target/arm/cpu.c                 |  23 ++-
 target/arm/cpu64.c               |  65 ++++--
 target/arm/helper-a64.c          |   8 +-
 target/arm/helper.c              | 414 ++++++++++++++++++++++++++-------------
 target/arm/m_helper.c            |   2 +-
 target/arm/monitor.c             |   1 +
 target/arm/op_helper.c           |   4 +-
 target/arm/pauth_helper.c        |  27 ++-
 target/arm/sve_helper.c          |  33 ++--
 target/arm/tlb_helper.c          |   3 +
 target/arm/translate-a64.c       |   4 +
 target/arm/translate-sve.c       |  31 ++-
 target/arm/translate.c           |  36 +++-
 tests/qtest/arm-cpu-features.c   |  13 ++
 tests/qtest/npcm7xx_adc-test.c   |   1 +
 tests/qtest/pvpanic-pci-test.c   |  62 ++++++
 .gitlab-ci.yml                   |   4 +-
 hw/i386/Kconfig                  |   2 +-
 hw/misc/Kconfig                  |  12 +-
 hw/misc/meson.build              |   4 +-
 tests/qtest/meson.build          |   3 +-
 42 files changed, 1080 insertions(+), 524 deletions(-)
 delete mode 100644 docs/devel/conf.py
 delete mode 100644 docs/index.html.in
 delete mode 100644 docs/interop/conf.py
 delete mode 100644 docs/specs/conf.py
 delete mode 100644 docs/system/conf.py
 delete mode 100644 docs/tools/conf.py
 delete mode 100644 docs/user/conf.py
 create mode 100644 hw/misc/pvpanic-isa.c
 create mode 100644 hw/misc/pvpanic-pci.c
 create mode 100644 tests/qtest/pvpanic-pci-test.c

