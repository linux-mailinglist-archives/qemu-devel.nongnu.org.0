Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 345D23A8520
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 17:51:43 +0200 (CEST)
Received: from localhost ([::1]:54324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltBLq-0006Rb-3y
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 11:51:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltBEo-0005o3-Sr
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 11:44:31 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:37727)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltBEZ-0000u7-R6
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 11:44:26 -0400
Received: by mail-wr1-x435.google.com with SMTP id i94so18824814wri.4
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 08:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=x2M6GI0MNnwtegg3o9UeHpwhTCMC9Qe1Vp7S7O0Tjio=;
 b=q2/s0ndno3H72pGYEjHQRpB6I4ZDca7GQjKR9T+6e+FzH9EUEVcGIcRlc9QBpCKGWi
 mo/rVc0NNOQ+A1IH2ikul5QUQIFTpUJm3cXa8nQ15LOK5XfNr7eBh2WKLJokfIrh86zU
 ei3Bs2tLCkOPapwXc5SA19ilmwAD1uK2+z+AQEAEM1Ce73Ms5G11M7CNmcPefVlhuarG
 mpTWZy3cb9ZZxZwGHibMwfN7cJJIFAEiTSQcx+F5FoK1sBMv9r2ns9JwCEGwehSAebAF
 t6S4d3+TiArOEo0e/T60y0NESLlEEemqrwsAApGJH6YXgzMNoK3ydtSsSu/Fw/DPWqBq
 fTYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=x2M6GI0MNnwtegg3o9UeHpwhTCMC9Qe1Vp7S7O0Tjio=;
 b=G49yFqa4TAzd/X6k9yj1YZ2AQ3eDImyFmLhqk/EbcuDTwK8du9jC4Vv/8u094U9pAv
 mY/TOGs7UHoDPm2cj1CbFth9Q/Jnjb3froJvSfYWCHidKA7RJQYG3yprkG8Xmu6j0ril
 f/RH6fVMPmPE7MHDM0mQVuhEsm9+pF/gy/x4YlRA2LsJi9XKVkrpLC4X35VNCtNzyvwd
 UzHzhjXWpV7EGf1DDP9HORIfT/nyX/EaErqGA8O9twBtVgbH8akFsbPLHE7tnYJDca0g
 B/09fTHgPvJPcZCnYG6kKmjKYt8pbDpbulY/qJ8yDrDVIBIKGYbxLnOa+Lye8TtwY2cE
 MVQQ==
X-Gm-Message-State: AOAM531cJWVfqIzmwqeCjrbg/YyATqdys/iveTnSpb4e61vbQ9u+wBrD
 OmhPGNORnPXTNvsQY5/NRr2c8mukR9ZxoQ==
X-Google-Smtp-Source: ABdhPJxByJlH8rjYGx8Qy/V7wR7/bxC2vxGhGObWWf4kCa5D7RM0hapKemDgzYQXXmDMnQGWYWqUnQ==
X-Received: by 2002:a05:6000:10c8:: with SMTP id
 b8mr3180542wrx.383.1623771848979; 
 Tue, 15 Jun 2021 08:44:08 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id d15sm18985662wri.58.2021.06.15.08.44.08
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 08:44:08 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 00/28] target-arm queue
Date: Tue, 15 Jun 2021 16:43:37 +0100
Message-Id: <20210615154405.21399-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

The following changes since commit 1ea06abceec61b6f3ab33dadb0510b6e09fb61e2:

  Merge remote-tracking branch 'remotes/berrange-gitlab/tags/misc-fixes-pull-request' into staging (2021-06-14 15:59:13 +0100)

are available in the Git repository at:

  https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20210615

for you to fetch changes up to c611c956c7fdce651e30687b1f5d19b4cab78b6a:

  include/qemu/int128.h: Add function to create Int128 from int64_t (2021-06-15 16:18:50 +0100)

----------------------------------------------------------------
target-arm queue:
 * hw/intc/arm_gicv3_cpuif: Tolerate spurious EOIR writes
 * handle some UNALLOCATED decode cases correctly rather
   than asserting
 * hw: virt: consider hw_compat_6_0
 * hw/arm: add quanta-gbs-bmc machine
 * hw/intc/armv7m_nvic: Remove stale comment
 * arm, acpi: Remove dependency on presence of 'virt' board
 * target/arm: Fix mte page crossing test
 * hw/arm: quanta-q71l add pca954x muxes
 * target/arm: First few parts of MVE support

----------------------------------------------------------------
Heinrich Schuchardt (1):
      hw: virt: consider hw_compat_6_0

Jean-Philippe Brucker (1):
      hw/intc/arm_gicv3_cpuif: Tolerate spurious EOIR writes

Patrick Venture (5):
      hw/arm: add quanta-gbs-bmc machine
      hw/arm: quanta-gbs-bmc add i2c comments
      hw/arm: gsj add i2c comments
      hw/arm: gsj add pca9548
      hw/arm: quanta-q71l add pca954x muxes

Peter Maydell (17):
      hw/intc/armv7m_nvic: Remove stale comment
      hw/acpi: Provide stub version of acpi_ghes_record_errors()
      hw/acpi: Provide function acpi_ghes_present()
      target/arm: Use acpi_ghes_present() to see if we report ACPI memory errors
      target/arm: Provide and use H8 and H1_8 macros
      target/arm: Enable FPSCR.QC bit for MVE
      target/arm: Handle VPR semantics in existing code
      target/arm: Add handling for PSR.ECI/ICI
      target/arm: Let vfp_access_check() handle late NOCP checks
      target/arm: Implement MVE LCTP
      target/arm: Implement MVE WLSTP insn
      target/arm: Implement MVE DLSTP
      target/arm: Implement MVE LETP insn
      target/arm: Add framework for MVE decode
      target/arm: Move expand_pred_b() data to vec_helper.c
      bitops.h: Provide hswap32(), hswap64(), wswap64() swapping operations
      include/qemu/int128.h: Add function to create Int128 from int64_t

Richard Henderson (4):
      target/arm: Diagnose UNALLOCATED in disas_simd_two_reg_misc_fp16
      target/arm: Remove fprintf from disas_simd_mod_imm
      target/arm: Diagnose UNALLOCATED in disas_simd_three_reg_same_fp16
      target/arm: Fix mte page crossing test

 include/hw/acpi/ghes.h            |   9 +
 include/qemu/bitops.h             |  29 +++
 include/qemu/int128.h             |  10 +
 target/arm/translate-a32.h        |   2 +
 target/arm/translate.h            |   9 +
 target/arm/vec_internal.h         |   9 +
 target/arm/mve.decode             |  20 ++
 target/arm/t32.decode             |  15 +-
 hw/acpi/ghes-stub.c               |  22 +++
 hw/acpi/ghes.c                    |  17 ++
 hw/arm/aspeed.c                   |  11 +-
 hw/arm/npcm7xx_boards.c           | 107 ++++++++++-
 hw/arm/virt.c                     |   2 +
 hw/intc/arm_gicv3_cpuif.c         |   5 +-
 hw/intc/armv7m_nvic.c             |   6 -
 target/arm/kvm64.c                |   6 +-
 target/arm/m_helper.c             |  54 +++++-
 target/arm/mte_helper.c           |   2 +-
 target/arm/sve_helper.c           | 381 +++++++++++++-------------------------
 target/arm/translate-a64.c        |  87 +++++----
 target/arm/translate-m-nocp.c     |  16 +-
 target/arm/translate-mve.c        |  29 +++
 target/arm/translate-vfp.c        |  65 +++++--
 target/arm/translate.c            | 300 ++++++++++++++++++++++++++++--
 target/arm/vec_helper.c           | 116 +++++++++++-
 target/arm/vfp_helper.c           |   3 +-
 tests/tcg/aarch64/mte-7.c         |  31 ++++
 hw/acpi/meson.build               |   6 +-
 hw/arm/Kconfig                    |   2 +
 target/arm/meson.build            |   2 +
 tests/tcg/aarch64/Makefile.target |   2 +-
 31 files changed, 1019 insertions(+), 356 deletions(-)
 create mode 100644 target/arm/mve.decode
 create mode 100644 hw/acpi/ghes-stub.c
 create mode 100644 target/arm/translate-mve.c
 create mode 100644 tests/tcg/aarch64/mte-7.c

