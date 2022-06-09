Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 127A954471C
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 11:17:05 +0200 (CEST)
Received: from localhost ([::1]:56658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzEHn-0004xo-LM
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 05:17:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzE6s-0001OA-TB
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 05:05:48 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:43532)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzE6q-0005uZ-Hr
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 05:05:46 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 67-20020a1c1946000000b00397382b44f4so12289092wmz.2
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 02:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OZiBFuQJe3qRRxefKzTWUt42ay2lpVYFJNPjvtmLelg=;
 b=yKTa0yD5rDPPmn0VjAI0R/vBaNptASzfNoyKLEWhx7jgV+xVU6uE5sxPZXrq8ri0Qh
 B1WAOoBbCM99lnCWSEzZaI2rj4Ig+dFHPYm4rQmgGZR3Ku3FPRlWBt64ChuK2Jmf2gv5
 hRuJ31/fyxYWQ18PDsSzpdy8MWqgY1/83ZpD0GBSR0f02Xj8A58JlEoD4ABFM19+qpaF
 ksBoh4s8M4zZC0KJGAUIJdSKn+Lo9fpa6Yr3NmTUx+IOkxQAzWehsWZf5gMuJLylyuwy
 aiqdtDkCp3JOOa2vL8wHafJfmVK6Ls2DOtxXL9yx/HGdMc3RtQDdGk1fCeIocZdZMX1b
 4LJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OZiBFuQJe3qRRxefKzTWUt42ay2lpVYFJNPjvtmLelg=;
 b=DijkohsOtUBulx+KLUmEiql2O9H6fmvK5W+pbbPd5Z1Ze1xPFTqiAdLm6gj8mZ+xLr
 nGrIdc6tmtdzjzVNuq7Aq1Zu3Y+D3//1Nm5n9KsCcDJk/IQTaVR/SQjiyiAPM7wDKNJx
 7V/QuGYn7WgBGnPvWAY4sM7hFAyU+bbSrAADl1z9Wr+5wzl64xkxncc5H3FtysijLa0d
 gpNo8OeMSB2usiYIg8Pr8uHBX0mJeykD8exxJS++NI+dYSAEICbuI1vpvXC/bLK6MrEX
 SEmC6FoAc69SRZWXVcKSMEgLOjPq7mrBM2Cvt973m7DXDOX5GiDaGYrtqPODdK3yjVoF
 096Q==
X-Gm-Message-State: AOAM531+M6+Fr9+TH1rsmPuMbWOTEN8koCLYTMnjPan6CtxysuWWQf6K
 vvO1EnohQ7b4OsVCZDWUOpGfk06ZfwyvXA==
X-Google-Smtp-Source: ABdhPJyb3ekftm/knMN4qSwUsr+upW5CsZi71l0FFnPUopSKvI1O+6NyEJKBPEa49CLolEfg4oHsVQ==
X-Received: by 2002:a7b:ce8c:0:b0:39c:5bf4:abc0 with SMTP id
 q12-20020a7bce8c000000b0039c5bf4abc0mr2222500wmj.135.1654765540591; 
 Thu, 09 Jun 2022 02:05:40 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 c13-20020adffb0d000000b002183cf9cd69sm11349796wrr.15.2022.06.09.02.05.39
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 02:05:39 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 00/55] target-arm queue
Date: Thu,  9 Jun 2022 10:04:42 +0100
Message-Id: <20220609090537.1971756-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
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
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

The following changes since commit 6d940eff4734bcb40b1a25f62d7cec5a396f994a:

  Merge tag 'pull-tpm-2022-06-07-1' of https://github.com/stefanberger/qemu-tpm into staging (2022-06-07 19:22:18 -0700)

are available in the Git repository at:

  https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20220609

for you to fetch changes up to 414c54d515dba16bfaef643a8acec200c05f229a:

  target/arm: Add ID_AA64SMFR0_EL1 (2022-06-08 19:38:59 +0100)

----------------------------------------------------------------
target-arm queue:
 * target/arm: Declare support for FEAT_RASv1p1
 * target/arm: Implement FEAT_DoubleFault
 * Fix 'writeable' typos
 * xlnx_dp: Implement vblank interrupt
 * target/arm: Move page-table-walk code to ptw.c
 * target/arm: Preparatory patches for SME support

----------------------------------------------------------------
Frederic Konrad (2):
      xlnx_dp: fix the wrong register size
      xlnx-zynqmp: fix the irq mapping for the display port and its dma

Peter Maydell (3):
      target/arm: Declare support for FEAT_RASv1p1
      target/arm: Implement FEAT_DoubleFault
      Fix 'writeable' typos

Richard Henderson (48):
      target/arm: Move stage_1_mmu_idx decl to internals.h
      target/arm: Move get_phys_addr to ptw.c
      target/arm: Move get_phys_addr_v5 to ptw.c
      target/arm: Move get_phys_addr_v6 to ptw.c
      target/arm: Move get_phys_addr_pmsav5 to ptw.c
      target/arm: Move get_phys_addr_pmsav7_default to ptw.c
      target/arm: Move get_phys_addr_pmsav7 to ptw.c
      target/arm: Move get_phys_addr_pmsav8 to ptw.c
      target/arm: Move pmsav8_mpu_lookup to ptw.c
      target/arm: Move pmsav7_use_background_region to ptw.c
      target/arm: Move v8m_security_lookup to ptw.c
      target/arm: Move m_is_{ppb,system}_region to ptw.c
      target/arm: Move get_level1_table_address to ptw.c
      target/arm: Move combine_cacheattrs and subroutines to ptw.c
      target/arm: Move get_phys_addr_lpae to ptw.c
      target/arm: Move arm_{ldl,ldq}_ptw to ptw.c
      target/arm: Move {arm_s1_, }regime_using_lpae_format to tlb_helper.c
      target/arm: Move arm_pamax, pamax_map into ptw.c
      target/arm: Move get_S1prot, get_S2prot to ptw.c
      target/arm: Move check_s2_mmu_setup to ptw.c
      target/arm: Move aa32_va_parameters to ptw.c
      target/arm: Move ap_to_tw_prot etc to ptw.c
      target/arm: Move regime_is_user to ptw.c
      target/arm: Move regime_ttbr to ptw.c
      target/arm: Move regime_translation_disabled to ptw.c
      target/arm: Move arm_cpu_get_phys_page_attrs_debug to ptw.c
      target/arm: Move stage_1_mmu_idx, arm_stage1_mmu_idx to ptw.c
      target/arm: Pass CPUARMState to arm_ld[lq]_ptw
      target/arm: Rename TBFLAG_A64 ZCR_LEN to VL
      linux-user/aarch64: Introduce sve_vq
      target/arm: Remove route_to_el2 check from sve_exception_el
      target/arm: Remove fp checks from sve_exception_el
      target/arm: Add el_is_in_host
      target/arm: Use el_is_in_host for sve_zcr_len_for_el
      target/arm: Use el_is_in_host for sve_exception_el
      target/arm: Hoist arm_is_el2_enabled check in sve_exception_el
      target/arm: Do not use aarch64_sve_zcr_get_valid_len in reset
      target/arm: Merge aarch64_sve_zcr_get_valid_len into caller
      target/arm: Use uint32_t instead of bitmap for sve vq's
      target/arm: Rename sve_zcr_len_for_el to sve_vqm1_for_el
      target/arm: Split out load/store primitives to sve_ldst_internal.h
      target/arm: Export sve contiguous ldst support functions
      target/arm: Move expand_pred_b to vec_internal.h
      target/arm: Use expand_pred_b in mve_helper.c
      target/arm: Move expand_pred_h to vec_internal.h
      target/arm: Export bfdotadd from vec_helper.c
      target/arm: Add isar_feature_aa64_sme
      target/arm: Add ID_AA64SMFR0_EL1

Sai Pavan Boddu (2):
      xlnx_dp: Introduce a vblank signal
      xlnx_dp: Fix the interrupt disable logic

 docs/interop/vhost-user.rst       |    2 +-
 docs/specs/vmgenid.txt            |    4 +-
 docs/system/arm/emulation.rst     |    2 +
 hw/scsi/mfi.h                     |    2 +-
 include/hw/display/xlnx_dp.h      |   12 +-
 linux-user/aarch64/target_prctl.h |   20 +-
 target/arm/cpu.h                  |   66 +-
 target/arm/internals.h            |   45 +-
 target/arm/kvm_arm.h              |    7 +-
 target/arm/sve_ldst_internal.h    |  221 +++
 target/arm/translate-a64.h        |    2 +-
 target/arm/translate.h            |    2 +-
 target/arm/vec_internal.h         |   28 +-
 target/i386/hvf/vmcs.h            |    2 +-
 target/i386/hvf/vmx.h             |    2 +-
 accel/hvf/hvf-accel-ops.c         |    4 +-
 accel/kvm/kvm-all.c               |    4 +-
 accel/tcg/user-exec.c             |    6 +-
 hw/acpi/ghes.c                    |    2 +-
 hw/arm/xlnx-zynqmp.c              |    4 +-
 hw/display/xlnx_dp.c              |   49 +-
 hw/intc/arm_gicv3_cpuif.c         |    2 +-
 hw/intc/arm_gicv3_dist.c          |    2 +-
 hw/intc/arm_gicv3_redist.c        |    4 +-
 hw/intc/riscv_aclint.c            |    2 +-
 hw/intc/riscv_aplic.c             |    2 +-
 hw/pci/shpc.c                     |    2 +-
 hw/sparc64/sun4u_iommu.c          |    2 +-
 hw/timer/sse-timer.c              |    2 +-
 linux-user/aarch64/signal.c       |    4 +-
 target/arm/arch_dump.c            |    2 +-
 target/arm/cpu.c                  |    5 +-
 target/arm/cpu64.c                |  120 +-
 target/arm/gdbstub.c              |    2 +-
 target/arm/gdbstub64.c            |    2 +-
 target/arm/helper.c               | 2742 ++-----------------------------------
 target/arm/hvf/hvf.c              |    4 +-
 target/arm/kvm64.c                |   47 +-
 target/arm/mve_helper.c           |    6 +-
 target/arm/ptw.c                  | 2540 ++++++++++++++++++++++++++++++++++
 target/arm/sve_helper.c           |  232 +---
 target/arm/tlb_helper.c           |   26 +
 target/arm/translate-a64.c        |    2 +-
 target/arm/translate-sve.c        |    2 +-
 target/arm/vec_helper.c           |   28 +-
 target/i386/cpu-sysemu.c          |    2 +-
 target/s390x/ioinst.c             |    2 +-
 python/qemu/machine/machine.py    |    2 +-
 target/arm/meson.build            |    1 +
 tests/tcg/x86_64/system/boot.S    |    2 +-
 50 files changed, 3240 insertions(+), 3037 deletions(-)
 create mode 100644 target/arm/sve_ldst_internal.h
 create mode 100644 target/arm/ptw.c

