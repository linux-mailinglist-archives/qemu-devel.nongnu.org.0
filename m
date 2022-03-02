Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E96DC4CB0A2
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 22:05:43 +0100 (CET)
Received: from localhost ([::1]:33252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPWAJ-0007pU-1P
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 16:05:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nPVxd-0005cB-1I
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 15:52:37 -0500
Received: from [2a00:1450:4864:20::336] (port=56208
 helo=mail-wm1-x336.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nPVxa-00084n-SF
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 15:52:36 -0500
Received: by mail-wm1-x336.google.com with SMTP id i66so1929498wma.5
 for <qemu-devel@nongnu.org>; Wed, 02 Mar 2022 12:52:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Q7fmJdA/E8zzJ3FaF8R/fe96KRlG+MhxrTv+eMd4euM=;
 b=Fa5FQix/SAaWJP7n83B5pn73Qb3138ilNU0PbY+VQ6tCk1vHCO36RiyGY/c7+8P8jt
 1wGCMOlK/1H8Abqr9T8NzcLPFmjB3HXvHtVQsMHNubhxvz0n3uGs9cyuSZUSCZ9/LJg1
 s6xS02CjbPy58eclHhVotjwvlXnr4c9Nf57xlNGTXtpOZPHbSTSYMVwIQ1a4T3kUpWFz
 OaFbbdZ9vGTAACUnLM5LBMCAztGRltMfyFFriECWpQcjIr0b1M5lfZJCOcZQxl65ix4p
 McANMpcWmLZRMKfWiVlrLHr9ftBZbWXStJLgHepINlSlmVURFipr0uugjLqnkcSA3RZ8
 MPBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Q7fmJdA/E8zzJ3FaF8R/fe96KRlG+MhxrTv+eMd4euM=;
 b=46WDdLlt0JxY01OaENVloxp/FiEckE0N1KquKATktI1u/OZVWwbtNCoLR1Wsm+5WGg
 V2yaEBjfJtlcjaXYqX6O+AWID7qOjBaPQUG0KgKgMpoUeaORVxoTfejEb0h4YvDshkdo
 eLFQ07ZBPAQqkrnf9qnQWvb92gg089moizUwPiAG3FzvDsARpzQMd1m81KvESEY7JN4T
 CqdDXCwi/fxleg/wueSssnTjb0ljYk063ovjgVySk4FbqdWYLZoEY4fsyW2m6CdZukVG
 F1oIeynv/BQSggWo6iHkXGBgMxnhJQjE9h7msYatEd9S2zmXevW7GdOlSLeVDT63hRnS
 wypw==
X-Gm-Message-State: AOAM532MHshCkFSHNxKeoJRxksQ2Ju+W7kiF9FRDyUmh7QL8GW+JmCJ/
 dYltpRUDne6NXndNJ9kbhN8dkT/caz9kJg==
X-Google-Smtp-Source: ABdhPJwxpI+dNDf/xPl5qlF3GLQP1qXJH2rJIzVQBu+JiqgN8TUfOQjiWCvEsCOlgbRfzO42MF9Y+Q==
X-Received: by 2002:a1c:e908:0:b0:37c:3d08:e0d3 with SMTP id
 q8-20020a1ce908000000b0037c3d08e0d3mr1305047wmc.97.1646254352970; 
 Wed, 02 Mar 2022 12:52:32 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 x13-20020adfec0d000000b001e31279cc38sm90801wrn.11.2022.03.02.12.52.31
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Mar 2022 12:52:32 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 00/26] target-arm queue
Date: Wed,  2 Mar 2022 20:52:04 +0000
Message-Id: <20220302205230.2122390-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::336
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

The following changes since commit 64ada298b98a51eb2512607f6e6180cb330c47b1:

  Merge remote-tracking branch 'remotes/legoater/tags/pull-ppc-20220302' into staging (2022-03-02 12:38:46 +0000)

are available in the Git repository at:

  https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20220302

for you to fetch changes up to 268c11984e67867c22f53beb3c7f8b98900d66b2:

  ui/cocoa.m: Remove unnecessary NSAutoreleasePools (2022-03-02 19:27:37 +0000)

----------------------------------------------------------------
target-arm queue:
 * mps3-an547: Add missing user ahb interfaces
 * hw/arm/mps2-tz.c: Update AN547 documentation URL
 * hw/input/tsc210x: Don't abort on bad SPI word widths
 * hw/i2c: flatten pca954x mux device
 * target/arm: Support PSCI 1.1 and SMCCC 1.0
 * target/arm: Fix early free of TCG temp in handle_simd_shift_fpint_conv()
 * tests/qtest: add qtests for npcm7xx sdhci
 * Implement FEAT_LVA
 * Implement FEAT_LPA
 * Implement FEAT_LPA2 (but do not enable it yet)
 * Report KVM's actual PSCI version to guest in dtb
 * ui/cocoa.m: Fix updateUIInfo threading issues
 * ui/cocoa.m: Remove unnecessary NSAutoreleasePools

----------------------------------------------------------------
Akihiko Odaki (1):
      target/arm: Support PSCI 1.1 and SMCCC 1.0

Jimmy Brisson (1):
      mps3-an547: Add missing user ahb interfaces

Patrick Venture (1):
      hw/i2c: flatten pca954x mux device

Peter Maydell (5):
      hw/arm/mps2-tz.c: Update AN547 documentation URL
      hw/input/tsc210x: Don't abort on bad SPI word widths
      target/arm: Report KVM's actual PSCI version to guest in dtb
      ui/cocoa.m: Fix updateUIInfo threading issues
      ui/cocoa.m: Remove unnecessary NSAutoreleasePools

Richard Henderson (16):
      hw/registerfields: Add FIELD_SEX<N> and FIELD_SDP<N>
      target/arm: Set TCR_EL1.TSZ for user-only
      target/arm: Fault on invalid TCR_ELx.TxSZ
      target/arm: Move arm_pamax out of line
      target/arm: Pass outputsize down to check_s2_mmu_setup
      target/arm: Use MAKE_64BIT_MASK to compute indexmask
      target/arm: Honor TCR_ELx.{I}PS
      target/arm: Prepare DBGBVR and DBGWVR for FEAT_LVA
      target/arm: Implement FEAT_LVA
      target/arm: Implement FEAT_LPA
      target/arm: Extend arm_fi_to_lfsc to level -1
      target/arm: Introduce tlbi_aa64_get_range
      target/arm: Fix TLBIRange.base for 16k and 64k pages
      target/arm: Validate tlbi TG matches translation granule in use
      target/arm: Advertise all page sizes for -cpu max
      target/arm: Implement FEAT_LPA2

Shengtan Mao (1):
      tests/qtest: add qtests for npcm7xx sdhci

Wentao_Liang (1):
      target/arm: Fix early free of TCG temp in handle_simd_shift_fpint_conv()

 docs/system/arm/emulation.rst    |   3 +
 include/hw/registerfields.h      |  48 +++++-
 target/arm/cpu-param.h           |   4 +-
 target/arm/cpu.h                 |  27 ++++
 target/arm/internals.h           |  58 ++++---
 target/arm/kvm-consts.h          |  14 +-
 hw/arm/boot.c                    |  11 +-
 hw/arm/mps2-tz.c                 |   6 +-
 hw/i2c/i2c_mux_pca954x.c         |  77 ++-------
 hw/input/tsc210x.c               |   8 +-
 target/arm/cpu.c                 |   8 +-
 target/arm/cpu64.c               |   7 +-
 target/arm/helper.c              | 332 ++++++++++++++++++++++++++++++---------
 target/arm/hvf/hvf.c             |  27 +++-
 target/arm/kvm64.c               |  14 +-
 target/arm/psci.c                |  35 ++++-
 target/arm/translate-a64.c       |   2 +-
 tests/qtest/npcm7xx_sdhci-test.c | 215 +++++++++++++++++++++++++
 tests/qtest/meson.build          |   1 +
 ui/cocoa.m                       |  31 ++--
 20 files changed, 736 insertions(+), 192 deletions(-)
 create mode 100644 tests/qtest/npcm7xx_sdhci-test.c

