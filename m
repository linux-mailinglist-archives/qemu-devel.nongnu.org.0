Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 011EC3A9C14
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 15:37:16 +0200 (CEST)
Received: from localhost ([::1]:35534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltVjG-0003u5-IN
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 09:37:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltVi9-0002So-G3
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 09:36:05 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:52137)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltVi7-0000Jm-6e
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 09:36:05 -0400
Received: by mail-wm1-x335.google.com with SMTP id l9so1303173wms.1
 for <qemu-devel@nongnu.org>; Wed, 16 Jun 2021 06:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RDRYpGFsvGleIhpzJynSPDNrIwIWcVHDiCKvxMQ3UdM=;
 b=IXI43CYZCVDURxzrRUCcJoO2gTMubK0TsqvM3pDCEdBNQ636QlI9vKNlTLUS+77P7S
 5CmO7xnGYIsVVOtc2zhqXXZ98aPMqcHU4KttxhXLTjK5YetNRsCsQ6ptkglLxOHVFqDR
 orxo1Em1wwCaU7WVGoM8o3vbcXKgrISb53T0XJFD6b3Utdx292UJ422TLIi59ojYW0w/
 X0Crj1e4p4W7BaDpD4ssJhdIvxelcgDQAncVD4u4fee2bBkOyi2v00hZ4o5Dj7s2oji8
 Ch8IncCsUKTGjc9aKpdAR5P2IYk7LgpJbwenhL1MctLHiUvqv4I85HZIiKeKrlH3KGq+
 co1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RDRYpGFsvGleIhpzJynSPDNrIwIWcVHDiCKvxMQ3UdM=;
 b=nB6HOojpyoj1V87wHlRuNUCR/tA+YPg086qMxKikY7Q0l4pOOsNR9RWePf9xJqjRn5
 m8Bf2CkCcFR3q+GsyENQL4Llyuj29uVXwxk0TQvAeSvJFKxbaAbkUj1IluQ/9tiVB/EN
 YgfxQJNKS/3quNBNXUZsHgQCh81FNGpMpbskO/p/y2Z0ALp1NbDHk9ULKrslWXOEUyJ1
 002F0ddjDWONXoRX+xT9uNe/evndJhkqAc2Fx1mygF4YG7It7T0SPOdJqQ1F8p7UnLRR
 mMRV2eeLFyoEWR+1XjuK/GQC+OZNXv1eiLBVe7oXnqrSyHjMFoa//dwItzY6WOJhshlM
 pGBg==
X-Gm-Message-State: AOAM531U9D3cEVe6UexGeIHS0fbeFfJjg1rnXOB0N6UjFoKF1QzGr0sC
 MS7DS2p8FXv5PTQx2VGux81pcxezJVUdkw==
X-Google-Smtp-Source: ABdhPJx4qNKxwNyWP3AIOIwxESTWrUyGJm5glV7b1HdL/30nHCuF9Y28HySEYRaul4nGZfriWdgIsA==
X-Received: by 2002:a1c:32c6:: with SMTP id y189mr11405403wmy.54.1623850561498; 
 Wed, 16 Jun 2021 06:36:01 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id 6sm1940299wmg.17.2021.06.16.06.36.00
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jun 2021 06:36:00 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 00/25] target-arm queue
Date: Wed, 16 Jun 2021 14:35:59 +0100
Message-Id: <20210616133559.9211-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
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

v2: dropped the hw/acpi/ghes-stub.c changes, which produce a
weird Meson error ("Tried to extract unknown source ghes-stub.c")
which didn't happen on my local builds; I'll investigate later...

-- PMM

The following changes since commit 1ea06abceec61b6f3ab33dadb0510b6e09fb61e2:

  Merge remote-tracking branch 'remotes/berrange-gitlab/tags/misc-fixes-pull-request' into staging (2021-06-14 15:59:13 +0100)

are available in the Git repository at:

  https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20210616

for you to fetch changes up to 703235a303d6862a7e3f5c6aa9eff7471cb138b2:

  include/qemu/int128.h: Add function to create Int128 from int64_t (2021-06-16 14:33:52 +0100)

----------------------------------------------------------------
target-arm queue:
 * hw/intc/arm_gicv3_cpuif: Tolerate spurious EOIR writes
 * handle some UNALLOCATED decode cases correctly rather
   than asserting
 * hw: virt: consider hw_compat_6_0
 * hw/arm: add quanta-gbs-bmc machine
 * hw/intc/armv7m_nvic: Remove stale comment
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

Peter Maydell (14):
      hw/intc/armv7m_nvic: Remove stale comment
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

 include/qemu/bitops.h             |  29 +++
 include/qemu/int128.h             |  10 +
 target/arm/translate-a32.h        |   2 +
 target/arm/translate.h            |   9 +
 target/arm/vec_internal.h         |   9 +
 target/arm/mve.decode             |  20 ++
 target/arm/t32.decode             |  15 +-
 hw/arm/aspeed.c                   |  11 +-
 hw/arm/npcm7xx_boards.c           | 107 ++++++++++-
 hw/arm/virt.c                     |   2 +
 hw/intc/arm_gicv3_cpuif.c         |   5 +-
 hw/intc/armv7m_nvic.c             |   6 -
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
 hw/arm/Kconfig                    |   2 +
 target/arm/meson.build            |   2 +
 tests/tcg/aarch64/Makefile.target |   2 +-
 26 files changed, 967 insertions(+), 348 deletions(-)
 create mode 100644 target/arm/mve.decode
 create mode 100644 target/arm/translate-mve.c
 create mode 100644 tests/tcg/aarch64/mte-7.c

