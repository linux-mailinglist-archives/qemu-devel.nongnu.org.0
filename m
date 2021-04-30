Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0FAA36F88F
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 12:39:16 +0200 (CEST)
Received: from localhost ([::1]:36814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcQYF-00046r-Ns
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 06:39:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lcQTr-0007DO-G3
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:34:43 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:46955)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lcQTp-00019g-HN
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:34:43 -0400
Received: by mail-wr1-x435.google.com with SMTP id x5so19715967wrv.13
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 03:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gM5E5Yy0FlYcFwC7dEFo8AEl1ujsqePrZs6iFbpaFzM=;
 b=vFLy3XJrQqWys3roHF4Q56i/taM6bUexL2phSskT+vxsP3apSzepLltmn1K/E/Sj/s
 h7xGrpts9Y80eXEm+qgXRpSpjyIafg62f5UlJ71pkFP5hhAO5Q5/p36q9qwspCQjXGe2
 LoQdfufzvAvJY/AYwFBsUYlFNCIPX5TEagjULrHpkJhigdKp0anKHcqDcLTa3fDNtjGg
 ilt2f+R5RdjQ6it0FgWEUzgZTYshWEfPQ+7adAIE09d8ejkNxqbKo7seOVomixjDHZ5n
 qpnFWvqt0fYlgzBiWUaYhZ34VopRkYrHECEuJvbGXoOfbwA63yUzCh2NeUNe6JkwO2jX
 DyMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gM5E5Yy0FlYcFwC7dEFo8AEl1ujsqePrZs6iFbpaFzM=;
 b=QsEBW+2artORI5UFYQ0n7X/wlnCW5V17dKPHs4nwnUkJnaYiz3Y9UIOupR+fi9YBB+
 7tfcbZcX03b/8tCe4gGiBwUNH3kPOqi1jNUsWGb+Umdrpzyp7HL1W2c82qBQeF4eqttJ
 HuCXGHUvgoRL+bhKY/cPF4oWkM0AKWs5UPYoPp7l82wBMR/1/ZbJOaSePo9EOcHKt/+z
 olExbR9bio3waGdQfkJbUdEmf0oxd+e9lDNby6TihC8nBGYIxWzhbBhhKasMe8CHYSnE
 DRwgnogjnHvlG3HUyacgey7YumfKF4zMSeM+AjQSehr8cj5qrilZDteagEKAg7Tak9P5
 PgmA==
X-Gm-Message-State: AOAM532Mvqa9ZlzI6kr9fbUaX3NMTZ1EB954vxv/WrFKrBrS83cWcW/m
 9fZpm7a/QOpve5aRW2hcVw22HEVM/rCQ+ane
X-Google-Smtp-Source: ABdhPJx+yZD2wjxnfODxTPRy6BnAvypGom43yPH2ZPgbdKIjChWFgAOR9ednfAyPZzIdTaIrzl9y3A==
X-Received: by 2002:a5d:43c1:: with SMTP id v1mr6071104wrr.248.1619778879498; 
 Fri, 30 Apr 2021 03:34:39 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id 18sm12997817wmo.47.2021.04.30.03.34.38
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 03:34:39 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 00/43] target-arm queue
Date: Fri, 30 Apr 2021 11:33:54 +0100
Message-Id: <20210430103437.4140-1-peter.maydell@linaro.org>
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

First arm pullreq for 6.1 cycle. The big stuff here is RTH's alignment series.

thanks
-- PMM

The following changes since commit ccdf06c1db192152ac70a1dd974c624f566cb7d4:

  Open 6.1 development tree (2021-04-30 11:15:40 +0100)

are available in the Git repository at:

  https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20210430

for you to fetch changes up to a6091108aa44e9017af4ca13c43f55a629e3744c:

  hw/pci-host/gpex: Don't fault for unmapped parts of MMIO and PIO windows (2021-04-30 11:16:52 +0100)

----------------------------------------------------------------
target-arm queue:
 * hw/pci-host/gpex: Don't fault for unmapped parts of MMIO and PIO windows
 * hw: add compat machines for 6.1
 * Fault misaligned accesses where the architecture requires it
 * Fix some corner cases of MTE faults (notably with misaligned accesses)
 * Make Thumb store insns UNDEF for Rn==1111
 * hw/arm/smmuv3: Support 16K translation granule

----------------------------------------------------------------
Cornelia Huck (1):
      hw: add compat machines for 6.1

Kunkun Jiang (1):
      hw/arm/smmuv3: Support 16K translation granule

Peter Maydell (2):
      target/arm: Make Thumb store insns UNDEF for Rn==1111
      hw/pci-host/gpex: Don't fault for unmapped parts of MMIO and PIO windows

Richard Henderson (39):
      target/arm: Fix mte_checkN
      target/arm: Split out mte_probe_int
      target/arm: Fix unaligned checks for mte_check1, mte_probe1
      test/tcg/aarch64: Add mte-5
      target/arm: Replace MTEDESC ESIZE+TSIZE with SIZEM1
      target/arm: Merge mte_check1, mte_checkN
      target/arm: Rename mte_probe1 to mte_probe
      target/arm: Simplify sve mte checking
      target/arm: Remove log2_esize parameter to gen_mte_checkN
      target/arm: Fix decode of align in VLDST_single
      target/arm: Rename TBFLAG_A32, SCTLR_B
      target/arm: Rename TBFLAG_ANY, PSTATE_SS
      target/arm: Add wrapper macros for accessing tbflags
      target/arm: Introduce CPUARMTBFlags
      target/arm: Move mode specific TB flags to tb->cs_base
      target/arm: Move TBFLAG_AM32 bits to the top
      target/arm: Move TBFLAG_ANY bits to the bottom
      target/arm: Add ALIGN_MEM to TBFLAG_ANY
      target/arm: Adjust gen_aa32_{ld, st}_i32 for align+endianness
      target/arm: Merge gen_aa32_frob64 into gen_aa32_ld_i64
      target/arm: Fix SCTLR_B test for TCGv_i64 load/store
      target/arm: Adjust gen_aa32_{ld, st}_i64 for align+endianness
      target/arm: Enforce word alignment for LDRD/STRD
      target/arm: Enforce alignment for LDA/LDAH/STL/STLH
      target/arm: Enforce alignment for LDM/STM
      target/arm: Enforce alignment for RFE
      target/arm: Enforce alignment for SRS
      target/arm: Enforce alignment for VLDM/VSTM
      target/arm: Enforce alignment for VLDR/VSTR
      target/arm: Enforce alignment for VLDn (all lanes)
      target/arm: Enforce alignment for VLDn/VSTn (multiple)
      target/arm: Enforce alignment for VLDn/VSTn (single)
      target/arm: Use finalize_memop for aa64 gpr load/store
      target/arm: Use finalize_memop for aa64 fpr load/store
      target/arm: Enforce alignment for aa64 load-acq/store-rel
      target/arm: Use MemOp for size + endian in aa64 vector ld/st
      target/arm: Enforce alignment for aa64 vector LDn/STn (multiple)
      target/arm: Enforce alignment for aa64 vector LDn/STn (single)
      target/arm: Enforce alignment for sve LD1R

 include/hw/boards.h               |   3 +
 include/hw/i386/pc.h              |   3 +
 include/hw/pci-host/gpex.h        |   4 +
 target/arm/cpu.h                  | 105 ++++++++++-----
 target/arm/helper-a64.h           |   3 +-
 target/arm/internals.h            |  11 +-
 target/arm/translate-a64.h        |   2 +-
 target/arm/translate.h            |  38 ++++++
 target/arm/neon-ls.decode         |   4 +-
 hw/arm/smmuv3.c                   |   6 +-
 hw/arm/virt.c                     |   7 +-
 hw/core/machine.c                 |   5 +
 hw/i386/pc.c                      |   3 +
 hw/i386/pc_piix.c                 |  14 +-
 hw/i386/pc_q35.c                  |  13 +-
 hw/pci-host/gpex.c                |  56 +++++++-
 hw/ppc/spapr.c                    |  17 ++-
 hw/s390x/s390-virtio-ccw.c        |  14 +-
 target/arm/helper-a64.c           |   2 +-
 target/arm/helper.c               | 162 ++++++++++++----------
 target/arm/mte_helper.c           | 185 ++++++++++---------------
 target/arm/sve_helper.c           | 100 +++++---------
 target/arm/translate-a64.c        | 236 ++++++++++++++++----------------
 target/arm/translate-sve.c        |  11 +-
 target/arm/translate.c            | 274 ++++++++++++++++++++++----------------
 tests/tcg/aarch64/mte-5.c         |  44 ++++++
 target/arm/translate-neon.c.inc   | 117 ++++++++++++----
 target/arm/translate-vfp.c.inc    |  20 +--
 tests/tcg/aarch64/Makefile.target |   2 +-
 29 files changed, 878 insertions(+), 583 deletions(-)
 create mode 100644 tests/tcg/aarch64/mte-5.c

