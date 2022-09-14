Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF47C5B8871
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Sep 2022 14:43:28 +0200 (CEST)
Received: from localhost ([::1]:39150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYRjj-0002he-J7
	for lists+qemu-devel@lfdr.de; Wed, 14 Sep 2022 08:43:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oYQwR-0008UF-C6
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 07:52:32 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:34778)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oYQwH-0008Us-Ag
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 07:52:31 -0400
Received: by mail-wr1-x42d.google.com with SMTP id bo13so8783144wrb.1
 for <qemu-devel@nongnu.org>; Wed, 14 Sep 2022 04:52:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=Zs0jk/JvFwnbKE+lfj5whsCWpH9I9SNQHFUNr6TNfl8=;
 b=RJP3AHInzLmoZ3g5TUk+4Dk+p51zG49upQyRUlhBONqw+kMdjD6Meg45pnvi3mImrs
 wf9JhFj4TR5D+sw62ziksE15hP/hPOIgfLl/hz1jT0a6NqD1HxVoLHIZwtlJrKDyjZDo
 RrYCKaMIppYK7Tv3D7/n5HEdsm77fpPYagiWHXwer7TUC27oyUTUy/kQCahcWEzqZo5m
 knssq8jH6IpUT5x0/4PlBioh6zcTCZeFKyOS7yu0XubVKdPXL5UrpLdV5kkAGRB6SxXc
 8YNpnzpk+VCa2CciBCpPZIpuf6TGIYSbTHCt5K4E0xnKZaA+cPuNrLaeifqpuc55pgrV
 k1bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=Zs0jk/JvFwnbKE+lfj5whsCWpH9I9SNQHFUNr6TNfl8=;
 b=WMHzBb/QcXVXxZwzievSd1hy6duy3HULZkqMS4+LKyF4E4OO+lKsAsm5YFDdXiZBaa
 rl3uHnGbN0QxZB13qdjreZNiAxEjJSW3nXUPU8+goFdRQoROordZpoymwjezGM19jqRm
 7+90pmr+eCpKovc/pj1wqFBG91jdi2oA0k6UYBLCYOUq6NuIzQFeOSLpMiaSPQ3QCr0r
 vre4i4Ghr1/EbWnVOHm9gdN5QBBtJeNKhgP9Gj3wcE3Qnn5IolPZqTvEk9PkkAhvPgZe
 qXVDMaN0unQUIiEgGst5/jZ/yzDxgtmX66AkXlDXJNBrZ3whf/FZQF9gIiksJS+f5l6z
 qO6Q==
X-Gm-Message-State: ACgBeo18itd0r09OBZgKyeAARCzX/hkkybsJ9jzQTT1CNrzIugAbsyv3
 PyPOoOBfOWzaEzSc5xvG50Kdluf4Vk8EtGnO
X-Google-Smtp-Source: AA6agR7JGEbYJDNr1d0GahGsq9/PEtYMwE2TznfqaY4YMGpS6bAYMdHCp7PXhhqnMRR8DlgXxdaPsQ==
X-Received: by 2002:a5d:64e8:0:b0:22a:bbb0:fa with SMTP id
 g8-20020a5d64e8000000b0022abbb000famr5926128wri.372.1663156338816; 
 Wed, 14 Sep 2022 04:52:18 -0700 (PDT)
Received: from stoup.. ([89.101.193.70]) by smtp.gmail.com with ESMTPSA id
 t9-20020a5d6909000000b0022a3a887ceasm13712970wru.49.2022.09.14.04.52.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Sep 2022 04:52:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PULL 00/20] target-arm.next patch queue
Date: Wed, 14 Sep 2022 12:51:56 +0100
Message-Id: <20220914115217.117532-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

A collection of arm-related patches that I collected while
Peter was on holiday.  There are some still outstanding that
I didn't feel comfortable collecting, such as cortex-r52.


r~


The following changes since commit 79dfa177ae348bb5ab5f97c0915359b13d6186e2:

  Merge tag 'pull-qapi-2022-09-07' of git://repo.or.cz/qemu/armbru into staging (2022-09-07 13:13:30 -0400)

are available in the Git repository at:

  https://gitlab.com/rth7680/qemu.git tags/pull-arm-20220914

for you to fetch changes up to 761c532ab1ebe9d345c9afe4fb9c2c4b26c58582:

  target/arm: Make boards pass base address to armv7m_load_kernel() (2022-09-14 11:19:40 +0100)

----------------------------------------------------------------
Add cortex-a35.
Fix bcm2835 framebuffer for rpi firmware.
Add FEAT_ETS.
Add FEAT_PMUv3p5.
Cleanups to armv7m_load_kernel.

----------------------------------------------------------------
Enrik Berkhan (1):
      hw/arm/bcm2835_property: Add support for RPI_FIRMWARE_FRAMEBUFFER_GET_NUM_DISPLAYS

Hao Wu (1):
      target/arm: Add cortex-a35

Peter Maydell (18):
      target/arm: Make cpregs 0, c0, c{3-15}, {0-7} correctly RAZ in v8
      target/arm: Sort KVM reads of AArch32 ID registers into encoding order
      target/arm: Implement ID_MMFR5
      target/arm: Implement ID_DFR1
      target/arm: Advertise FEAT_ETS for '-cpu max'
      target/arm: Add missing space in comment
      target/arm: Don't corrupt high half of PMOVSR when cycle counter overflows
      target/arm: Correct value returned by pmu_counter_mask()
      target/arm: Don't mishandle count when enabling or disabling PMU counters
      target/arm: Ignore PMCR.D when PMCR.LC is set
      target/arm: Honour MDCR_EL2.HPMD in Secure EL2
      target/arm: Detect overflow when calculating next PMU interrupt
      target/arm: Rename pmu_8_n feature test functions
      target/arm: Implement FEAT_PMUv3p5 cycle counter disable bits
      target/arm: Support 64-bit event counters for FEAT_PMUv3p5
      target/arm: Report FEAT_PMUv3p5 for TCG '-cpu max'
      target/arm: Remove useless TARGET_BIG_ENDIAN check in armv7m_load_kernel()
      target/arm: Make boards pass base address to armv7m_load_kernel()

 docs/system/arm/emulation.rst |   2 +
 docs/system/arm/virt.rst      |   1 +
 include/hw/arm/boot.h         |   5 +-
 target/arm/cpu.h              |  39 ++++--
 target/arm/internals.h        |   5 +-
 hw/arm/armv7m.c               |  14 +--
 hw/arm/aspeed.c               |   1 +
 hw/arm/microbit.c             |   2 +-
 hw/arm/mps2-tz.c              |   2 +-
 hw/arm/mps2.c                 |   2 +-
 hw/arm/msf2-som.c             |   2 +-
 hw/arm/musca.c                |   3 +-
 hw/arm/netduino2.c            |   2 +-
 hw/arm/netduinoplus2.c        |   2 +-
 hw/arm/stellaris.c            |   2 +-
 hw/arm/stm32vldiscovery.c     |   2 +-
 hw/arm/virt.c                 |   1 +
 hw/misc/bcm2835_property.c    |   4 +
 target/arm/cpu64.c            |  83 ++++++++++++-
 target/arm/cpu_tcg.c          |   8 +-
 target/arm/helper.c           | 267 ++++++++++++++++++++++++++++++++++--------
 target/arm/kvm64.c            |   8 +-
 22 files changed, 374 insertions(+), 83 deletions(-)

