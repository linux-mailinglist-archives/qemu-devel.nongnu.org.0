Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B6B32FBBC5
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 16:59:02 +0100 (CET)
Received: from localhost ([::1]:57784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1tPJ-0002py-Kb
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 10:59:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1tDz-0007PL-LB
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 10:47:19 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:39138)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1tDr-0006hh-RM
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 10:47:17 -0500
Received: by mail-wr1-x432.google.com with SMTP id c5so20190179wrp.6
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 07:47:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IWXU5VBbnAlwAO5RChjWGNN4nxPWFmg1fTZB2DVLt5s=;
 b=mc0E5FI2zrmsSD1myOiSnKeEDL7C47WVcwclXv6VY592CANmFC+GK09SGrLmZxBrSh
 vSR/FnPfvAYIqkivGePDTRUGKLRKclg+T1GyNo4C5ns1vnIVB4J94eqfTFCD/+aicpkX
 U6i8SBieCTSDS9/zVqvHA1Gn/cJvYsJt+i/0B0vNpHKc+GiIEBUefjQsxAJBuMzf6py9
 m2R/x63y71BQ0p2gCxlCEfDqf4MuHH9oDe9vjl8r6OWcfKwZT+VvMogvQID+CPRC9yw1
 dvjJ289t/SFRqQMTesjHsYb9XaKnb+OpJ/u1krKgJ2Chz622NWlLzoXPxUZv5iX6Yz83
 xlNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IWXU5VBbnAlwAO5RChjWGNN4nxPWFmg1fTZB2DVLt5s=;
 b=APYwsbJinFxzt4U3jlfjila0Sw5EfI+bBFJCfmbx8yMqOvlCPLhDwUVarVA9t8j2Wy
 JCews2UUcfIeJsbI+9Nbya6+xYGaryyia9zd8x2YyuAADsqzovtoHKtgZiLrLp7MjvA1
 cTF4gZpaHs704Oiw1v3KvimOf8dBKn5Vwn/79S0RHXSZ/c6OeDazXQJKYJK4EzJtkjjK
 KDo8wA4/uaIYP0kxrnLOwEfrR9QtJGbj3j206Yu603/fVvpga1UCg777vdPjUefFm1oL
 DQnX5UkL9NY+qu2peqkab269kyAwJC6qBvB83c1qlRY/gNBIlbFSp8cZFzDblXFg3fKg
 vhcg==
X-Gm-Message-State: AOAM533+ujgvcBUfwSANmcyfvKPfPGfUCE28oPF7eyNYMjcruK2bQwU0
 L30//ljNV+lshn7vSnI+35lcc/tz++g1Xw==
X-Google-Smtp-Source: ABdhPJziIy6jopRze3uOjuwtt+KCgjI/gPhJJlX9WN6UE3r5qQIF5Z9atJQi7PXo8sCKX87oLiOKLw==
X-Received: by 2002:a5d:570e:: with SMTP id a14mr4992121wrv.126.1611071228941; 
 Tue, 19 Jan 2021 07:47:08 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id z6sm37814834wrw.58.2021.01.19.07.47.08
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jan 2021 07:47:08 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL v2 00/29] target-arm queue
Date: Tue, 19 Jan 2021 15:47:06 +0000
Message-Id: <20210119154706.22310-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
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

v2: drop pvpanic-pci patches.

The following changes since commit f1fcb6851aba6dd9838886dc179717a11e344a1c:

  Merge remote-tracking branch 'remotes/huth-gitlab/tags/pull-request-2021-01-19' into staging (2021-01-19 11:57:07 +0000)

are available in the Git repository at:

  https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20210119-1

for you to fetch changes up to b93f4fbdc48283a39089469c44a5529d79dc40a8:

  docs: Build and install all the docs in a single manual (2021-01-19 15:45:14 +0000)

----------------------------------------------------------------
target-arm queue:
 * Implement IMPDEF pauth algorithm
 * Support ARMv8.4-SEL2
 * Fix bug where we were truncating predicate vector lengths in SVE insns
 * npcm7xx_adc-test: Fix memleak in adc_qom_set
 * target/arm/m_helper: Silence GCC 10 maybe-uninitialized error
 * docs: Build and install all the docs in a single manual

----------------------------------------------------------------
Gan Qixin (1):
      npcm7xx_adc-test: Fix memleak in adc_qom_set

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
 docs/system/arm/cpu-features.rst |  21 ++
 docs/system/conf.py              |  28 ---
 docs/tools/conf.py               |  37 ----
 docs/user/conf.py                |  15 --
 include/qemu/xxhash.h            |  98 +++++++++
 target/arm/cpu-param.h           |   2 +-
 target/arm/cpu.h                 | 107 ++++++++--
 target/arm/internals.h           |  45 +++++
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
 .gitlab-ci.yml                   |   4 +-
 30 files changed, 770 insertions(+), 438 deletions(-)
 delete mode 100644 docs/devel/conf.py
 delete mode 100644 docs/index.html.in
 delete mode 100644 docs/interop/conf.py
 delete mode 100644 docs/specs/conf.py
 delete mode 100644 docs/system/conf.py
 delete mode 100644 docs/tools/conf.py
 delete mode 100644 docs/user/conf.py

