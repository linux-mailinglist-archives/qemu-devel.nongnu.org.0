Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FC6B390495
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 17:05:39 +0200 (CEST)
Received: from localhost ([::1]:54374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llYcj-0004ET-H3
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 11:05:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llYah-0001Px-7U
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:03:31 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:38754)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llYae-0003xQ-Ot
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:03:30 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 u4-20020a05600c00c4b02901774b80945cso13673103wmm.3
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 08:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rf7g6SJO45NPT1cTsOJ5hopJ0l8UmF8t++lihBx79kA=;
 b=TVGDki5kHQREy0dEaqxcUJb2UbAHU5SroxUXBdoTH2Gka/lPH9RkWATBRmCMaI2963
 ri8miPb0BSnznT3ZpfXBielhfkvyQmg+6FxYtNLXciexDToloY0GfpVpcLGBTFZD0TGE
 YwCPL/r5sFtSzJJsr8Lr/tMu0OeRQdjLgaBJevNgQaS+vIsHfIWPin+8PtnjXGpiQDBM
 QQGQofanei70KwJm0EpLAi9TUyVLUkPCDRUvX6tD673a/wEZk88vTpqrs46Z7wtxFs6f
 3zJilAZfE0yQsBz31B8HwOoV2itylCtYQo+9MDDb2yBRqWrSzkHb2PfNr9PW+RHk5RDf
 RTXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rf7g6SJO45NPT1cTsOJ5hopJ0l8UmF8t++lihBx79kA=;
 b=kI0ee5Xq3CuGsrfy//qpFXx7xObDutVQLe7hxoRVAcesgKUGo3jKYoXKoiAiRchcn6
 UC/FmMPn2CIJjnUzXS4OGubZukO4fAe5G9IzDZQYq9zZnjwMfPapKXpkToTZ5q1lqUkq
 PgS6NpIaziTvZmKTRWUBM8DKNT3l98gAhAUZdqvCy9xjjyENJgzF5T6gnqTg1V9/knbn
 yoP1JBzD70OAa0UDdYbLxUlgToVc11SV+fn20NBPRrHup2/HmNxleFSiabIRZ5L0HQO0
 SPQWi+AyBUwR0wA7DYpjgkKDhoZ0yvlDUqOoFBG7/H/RhX+8liGKFu1ARTYeHGZ4jdZx
 t/rA==
X-Gm-Message-State: AOAM533ObF1y8b0P7oFQLhz01txdDiv9JOBe35FEwYUtegB/KSpyb8OY
 VMi6Hz7feLXhbvcO9EmznBMXUsJUTs6jFYhC
X-Google-Smtp-Source: ABdhPJzOU+tgKvUhxbyNKcOuLqSFDRP2bt031Oyq2ZyLVs13k7W1GxZIZY78rfeybWPTzmzTxAQg7A==
X-Received: by 2002:a05:600c:2056:: with SMTP id
 p22mr4379448wmg.146.1621955006461; 
 Tue, 25 May 2021 08:03:26 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q62sm11710284wma.42.2021.05.25.08.03.25
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 08:03:25 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 000/114] target-arm queue
Date: Tue, 25 May 2021 16:01:30 +0100
Message-Id: <20210525150324.32370-1-peter.maydell@linaro.org>
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

Big fat pullreq this time around, because it has all of RTH's
SVE2 emulation patchset in it.

-- PMM

The following changes since commit 0dab1d36f55c3ed649bb8e4c74b9269ef3a63049:

  Merge remote-tracking branch 'remotes/stefanha-gitlab/tags/block-pull-request' into staging (2021-05-24 15:48:08 +0100)

are available in the Git repository at:

  https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20210525

for you to fetch changes up to f8680aaa6e5bfc6022b75157c23db7d2ea98ab11:

  target/arm: Enable SVE2 and related extensions (2021-05-25 16:01:44 +0100)

----------------------------------------------------------------
target-arm queue:
 * Implement SVE2 emulation
 * Implement integer matrix multiply accumulate
 * Implement FEAT_TLBIOS
 * Implement FEAT_TLBRANGE
 * disas/libvixl: Protect C system header for C++ compiler
 * Use correct SP in M-profile exception return
 * AN524, AN547: Correct modelling of internal SRAMs
 * hw/intc/arm_gicv3_cpuif: Fix EOIR write access check logic
 * hw/arm/smmuv3: Another range invalidation fix

----------------------------------------------------------------
Eric Auger (1):
      hw/arm/smmuv3: Another range invalidation fix

Peter Maydell (8):
      hw/intc/arm_gicv3_cpuif: Fix EOIR write access check logic
      hw/arm/mps2-tz: Don't duplicate modelling of SRAM in AN524
      hw/arm/mps2-tz: Make SRAM_ADDR_WIDTH board-specific
      hw/arm/armsse.c: Correct modelling of SSE-300 internal SRAMs
      hw/arm/armsse: Convert armsse_realize() to use ERRP_GUARD
      hw/arm/mps2-tz: Allow board to specify a boot RAM size
      hw/arm: Model TCMs in the SSE-300, not the AN547
      target/arm: Use correct SP in M-profile exception return

Philippe Mathieu-Daudé (1):
      disas/libvixl: Protect C system header for C++ compiler

Rebecca Cran (3):
      target/arm: Add support for FEAT_TLBIRANGE
      target/arm: Add support for FEAT_TLBIOS
      target/arm: set ID_AA64ISAR0.TLB to 2 for max AARCH64 CPU type

Richard Henderson (84):
      accel/tcg: Replace g_new() + memcpy() by g_memdup()
      accel/tcg: Pass length argument to tlb_flush_range_locked()
      accel/tlb: Rename TLBFlushPageBitsByMMUIdxData -> TLBFlushRangeData
      accel/tcg: Remove {encode,decode}_pbm_to_runon
      accel/tcg: Add tlb_flush_range_by_mmuidx()
      accel/tcg: Add tlb_flush_range_by_mmuidx_all_cpus()
      accel/tlb: Add tlb_flush_range_by_mmuidx_all_cpus_synced()
      accel/tcg: Rename tlb_flush_page_bits -> range]_by_mmuidx_async_0
      accel/tlb: Rename tlb_flush_[page_bits > range]_by_mmuidx_async_[2 > 1]
      target/arm: Add ID_AA64ZFR0 fields and isar_feature_aa64_sve2
      target/arm: Implement SVE2 Integer Multiply - Unpredicated
      target/arm: Implement SVE2 integer pairwise add and accumulate long
      target/arm: Implement SVE2 integer unary operations (predicated)
      target/arm: Split out saturating/rounding shifts from neon
      target/arm: Implement SVE2 saturating/rounding bitwise shift left (predicated)
      target/arm: Implement SVE2 integer halving add/subtract (predicated)
      target/arm: Implement SVE2 integer pairwise arithmetic
      target/arm: Implement SVE2 saturating add/subtract (predicated)
      target/arm: Implement SVE2 integer add/subtract long
      target/arm: Implement SVE2 integer add/subtract interleaved long
      target/arm: Implement SVE2 integer add/subtract wide
      target/arm: Implement SVE2 integer multiply long
      target/arm: Implement SVE2 PMULLB, PMULLT
      target/arm: Implement SVE2 bitwise shift left long
      target/arm: Implement SVE2 bitwise exclusive-or interleaved
      target/arm: Implement SVE2 bitwise permute
      target/arm: Implement SVE2 complex integer add
      target/arm: Implement SVE2 integer absolute difference and accumulate long
      target/arm: Implement SVE2 integer add/subtract long with carry
      target/arm: Implement SVE2 bitwise shift right and accumulate
      target/arm: Implement SVE2 bitwise shift and insert
      target/arm: Implement SVE2 integer absolute difference and accumulate
      target/arm: Implement SVE2 saturating extract narrow
      target/arm: Implement SVE2 SHRN, RSHRN
      target/arm: Implement SVE2 SQSHRUN, SQRSHRUN
      target/arm: Implement SVE2 UQSHRN, UQRSHRN
      target/arm: Implement SVE2 SQSHRN, SQRSHRN
      target/arm: Implement SVE2 WHILEGT, WHILEGE, WHILEHI, WHILEHS
      target/arm: Implement SVE2 WHILERW, WHILEWR
      target/arm: Implement SVE2 bitwise ternary operations
      target/arm: Implement SVE2 saturating multiply-add long
      target/arm: Implement SVE2 saturating multiply-add high
      target/arm: Implement SVE2 integer multiply-add long
      target/arm: Implement SVE2 complex integer multiply-add
      target/arm: Implement SVE2 XAR
      target/arm: Use correct output type for gvec_sdot_*_b
      target/arm: Pass separate addend to {U, S}DOT helpers
      target/arm: Pass separate addend to FCMLA helpers
      target/arm: Split out formats for 2 vectors + 1 index
      target/arm: Split out formats for 3 vectors + 1 index
      target/arm: Implement SVE2 integer multiply (indexed)
      target/arm: Implement SVE2 integer multiply-add (indexed)
      target/arm: Implement SVE2 saturating multiply-add high (indexed)
      target/arm: Implement SVE2 saturating multiply-add (indexed)
      target/arm: Implement SVE2 saturating multiply (indexed)
      target/arm: Implement SVE2 signed saturating doubling multiply high
      target/arm: Implement SVE2 saturating multiply high (indexed)
      target/arm: Implement SVE2 multiply-add long (indexed)
      target/arm: Implement SVE2 integer multiply long (indexed)
      target/arm: Implement SVE2 complex integer multiply-add (indexed)
      target/arm: Implement SVE2 complex integer dot product
      target/arm: Macroize helper_gvec_{s,u}dot_{b,h}
      target/arm: Macroize helper_gvec_{s,u}dot_idx_{b,h}
      target/arm: Implement SVE mixed sign dot product (indexed)
      target/arm: Implement SVE mixed sign dot product
      target/arm: Implement SVE2 crypto unary operations
      target/arm: Implement SVE2 crypto destructive binary operations
      target/arm: Implement SVE2 crypto constructive binary operations
      target/arm: Implement SVE2 FCVTNT
      target/arm: Share table of sve load functions
      target/arm: Tidy do_ldrq
      target/arm: Implement SVE2 LD1RO
      target/arm: Implement 128-bit ZIP, UZP, TRN
      target/arm: Move endian adjustment macros to vec_internal.h
      target/arm: Implement aarch64 SUDOT, USDOT
      target/arm: Split out do_neon_ddda_fpst
      target/arm: Remove unused fpst from VDOT_scalar
      target/arm: Fix decode for VDOT (indexed)
      target/arm: Split out do_neon_ddda
      target/arm: Split decode of VSDOT and VUDOT
      target/arm: Implement aarch32 VSUDOT, VUSDOT
      target/arm: Implement integer matrix multiply accumulate
      linux-user/aarch64: Enable hwcap bits for sve2 and related extensions
      target/arm: Enable SVE2 and related extensions

Stephen Long (17):
      target/arm: Implement SVE2 floating-point pairwise
      target/arm: Implement SVE2 MATCH, NMATCH
      target/arm: Implement SVE2 ADDHNB, ADDHNT
      target/arm: Implement SVE2 RADDHNB, RADDHNT
      target/arm: Implement SVE2 SUBHNB, SUBHNT
      target/arm: Implement SVE2 RSUBHNB, RSUBHNT
      target/arm: Implement SVE2 HISTCNT, HISTSEG
      target/arm: Implement SVE2 scatter store insns
      target/arm: Implement SVE2 gather load insns
      target/arm: Implement SVE2 FMMLA
      target/arm: Implement SVE2 SPLICE, EXT
      target/arm: Implement SVE2 TBL, TBX
      target/arm: Implement SVE2 FCVTLT
      target/arm: Implement SVE2 FCVTXNT, FCVTX
      target/arm: Implement SVE2 FLOGB
      target/arm: Implement SVE2 bitwise shift immediate
      target/arm: Implement SVE2 fp multiply-add long

 disas/libvixl/vixl/code-buffer.h |    2 +-
 disas/libvixl/vixl/globals.h     |   16 +-
 disas/libvixl/vixl/invalset.h    |    2 +-
 disas/libvixl/vixl/platform.h    |    2 +
 disas/libvixl/vixl/utils.h       |    2 +-
 include/exec/exec-all.h          |   44 +
 include/hw/arm/armsse.h          |    2 +
 target/arm/cpu.h                 |   76 +
 target/arm/helper-sve.h          |  722 ++++++++-
 target/arm/helper.h              |  110 +-
 target/arm/translate-a64.h       |    3 +
 target/arm/vec_internal.h        |  167 ++
 target/arm/neon-shared.decode    |   24 +-
 target/arm/sve.decode            |  574 ++++++-
 accel/tcg/cputlb.c               |  231 ++-
 hw/arm/armsse.c                  |   35 +-
 hw/arm/mps2-tz.c                 |   39 +-
 hw/arm/smmuv3.c                  |   50 +-
 hw/intc/arm_gicv3_cpuif.c        |   48 +-
 linux-user/elfload.c             |   10 +
 target/arm/cpu.c                 |    2 +
 target/arm/cpu64.c               |   14 +
 target/arm/cpu_tcg.c             |    1 +
 target/arm/helper.c              |  327 +++-
 target/arm/kvm64.c               |   21 +-
 target/arm/m_helper.c            |    3 +-
 target/arm/neon_helper.c         |  507 +-----
 target/arm/sve_helper.c          | 2110 +++++++++++++++++++++++--
 target/arm/translate-a64.c       |  111 +-
 target/arm/translate-neon.c      |  231 +--
 target/arm/translate-sve.c       | 3200 +++++++++++++++++++++++++++++++++++---
 target/arm/vec_helper.c          |  887 ++++++++---
 disas/libvixl/vixl/utils.cc      |    2 +-
 33 files changed, 8275 insertions(+), 1300 deletions(-)

