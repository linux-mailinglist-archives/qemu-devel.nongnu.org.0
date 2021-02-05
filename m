Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E6431161C
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 23:58:48 +0100 (CET)
Received: from localhost ([::1]:43142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8A3s-0002zS-01
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 17:58:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8A26-00018h-G9
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 17:56:58 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:33283)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8A24-00038H-9a
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 17:56:58 -0500
Received: by mail-pj1-x102f.google.com with SMTP id lw17so7286030pjb.0
 for <qemu-devel@nongnu.org>; Fri, 05 Feb 2021 14:56:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=37NPpudQaaEYuOMEGAVl/adp+pn6vKaHQsmA001gEH8=;
 b=l6RLdTrmgWATbaWXExSGlpKxVMFHhEyxmaxCKL5xtpdKMvzL6N84+1ea8+HGtF7k+g
 GEB50Wcd7fnUfU4HWQp8w+5b+aD9JSEvrLF4OKNjvVMq0rKtfeekCuc8NVvFM7MRQjgY
 FQUSwJlrCQhCD716GP1SbuY7V2JzTVPmzX8OOM4WkumZJmm4emQRuX6VzF9bJOsmwoGi
 XpoMYXpyqay+xoRhO8FHq8fcmCYvkzf/1EDwVIM2cBkVNoKT+8C8KijKd6MJRE7fjBVd
 lehz6cte12dR0rJC90KO51hVDOZA8Hu7KUhcS/8mUnNUwP+htSqWccNZAmKKNtuApBnf
 E8gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=37NPpudQaaEYuOMEGAVl/adp+pn6vKaHQsmA001gEH8=;
 b=nYEnkDHeprIlEHEROPVsQOm1OUN825jiJqdRAhO1RQea2/CFBhfPax0DohrXye58aU
 ZhpLBkQsHFP5gFG6VhLulnMftL3mpz72phQle1xN2HrpBaP/aipPv6unUy1x27B2FHIR
 3TkjusBAKdA5UUFYaL4tA9dCSR/RaIGJfFrKl3LGregwtb68GOucVrSulsXNdRmlTQg/
 y4SyK4f304FeIoBhZDbHgcdTTgNwi392bH2y+r/0BF7oJ4GMRsybiNK0gO+nRf6JhePj
 EeB4RDlpfgk/4oZEtHcVu7LsHZs1IVT6tKHfBRSCjQ3D/vXY57e/DoGE5sUC7hTKww3m
 OT8w==
X-Gm-Message-State: AOAM531+R23W3wfPiz97vPGlfKpDQLby3AnRo+6+Fdd4BWuTz7O/TCeG
 G2Ys+0AdAavqwDKlthCENFOqzzlJeH6h0pEE
X-Google-Smtp-Source: ABdhPJxKiV7dKPDBgOnh1/Pz6t+F7U5UPhKLf+gttrjsMO88dw5SKgcLBWu8eS+zKrTq3G3v82LeJg==
X-Received: by 2002:a17:90a:46cb:: with SMTP id
 x11mr6249098pjg.124.1612565814301; 
 Fri, 05 Feb 2021 14:56:54 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id c23sm12155149pgc.72.2021.02.05.14.56.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 14:56:53 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 00/46] tcg patch queue
Date: Fri,  5 Feb 2021 12:56:04 -1000
Message-Id: <20210205225650.1330794-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit d0dddab40e472ba62b5f43f11cc7dba085dabe71:

  Merge remote-tracking branch 'remotes/mst/tags/for_upstream' into staging (2021-02-05 15:27:02 +0000)

are available in the Git repository at:

  https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20210205

for you to fetch changes up to fb6916dd6ca8bb4b42d44baba9c67ecaf2279577:

  accel: introduce AccelCPUClass extending CPUClass (2021-02-05 10:24:15 -1000)

----------------------------------------------------------------
TCGCPUOps cleanups (claudio)
tcg/s390 compare fix (phil)
tcg/aarch64 rotli_vec fix
tcg/tci cleanups and fixes

----------------------------------------------------------------
Claudio Fontana (13):
      target/riscv: remove CONFIG_TCG, as it is always TCG
      accel/tcg: split TCG-only code from cpu_exec_realizefn
      target/arm: do not use cc->do_interrupt for KVM directly
      cpu: move cc->do_interrupt to tcg_ops
      cpu: move cc->transaction_failed to tcg_ops
      cpu: move do_unaligned_access to tcg_ops
      physmem: make watchpoint checking code TCG-only
      cpu: move adjust_watchpoint_address to tcg_ops
      cpu: move debug_check_watchpoint to tcg_ops
      cpu: tcg_ops: move to tcg-cpu-ops.h, keep a pointer in CPUClass
      accel: extend AccelState and AccelClass to user-mode
      accel: replace struct CpusAccel with AccelOpsClass
      accel: introduce AccelCPUClass extending CPUClass

Eduardo Habkost (5):
      cpu: Introduce TCGCpuOperations struct
      cpu: Move synchronize_from_tb() to tcg_ops
      cpu: Move cpu_exec_* to tcg_ops
      cpu: Move tlb_fill to tcg_ops
      cpu: Move debug_excp_handler to tcg_ops

Philippe Mathieu-Daudé (2):
      tcg/s390: Fix compare instruction from extended-immediate facility
      exec/cpu-defs: Remove TCG backends dependency

Richard Henderson (24):
      tcg/aarch64: Do not convert TCGArg to temps that are not temps
      configure: Fix --enable-tcg-interpreter
      tcg/tci: Make tci_tb_ptr thread-local
      tcg/tci: Inline tci_write_reg32s into the only caller
      tcg/tci: Inline tci_write_reg8 into its callers
      tcg/tci: Inline tci_write_reg16 into the only caller
      tcg/tci: Inline tci_write_reg32 into all callers
      tcg/tci: Inline tci_write_reg64 into 64-bit callers
      tcg/tci: Merge INDEX_op_ld8u_{i32,i64}
      tcg/tci: Merge INDEX_op_ld8s_{i32,i64}
      tcg/tci: Merge INDEX_op_ld16u_{i32,i64}
      tcg/tci: Merge INDEX_op_ld16s_{i32,i64}
      tcg/tci: Merge INDEX_op_{ld_i32,ld32u_i64}
      tcg/tci: Merge INDEX_op_st8_{i32,i64}
      tcg/tci: Merge INDEX_op_st16_{i32,i64}
      tcg/tci: Move stack bounds check to compile-time
      tcg/tci: Merge INDEX_op_{st_i32,st32_i64}
      tcg/tci: Use g_assert_not_reached
      tcg/tci: Remove dead code for TCG_TARGET_HAS_div2_*
      tcg/tci: Implement 64-bit division
      tcg/tci: Remove TODO as unused
      tcg/tci: Restrict TCG_TARGET_NB_REGS to 16
      tcg/tci: Fix TCG_REG_R4 misusage
      tcg/tci: Remove TCG_CONST

Stefan Weil (2):
      tcg/tci: Implement INDEX_op_ld16s_i32
      tcg/tci: Implement INDEX_op_ld8s_i64

 configure                                          |   5 +-
 accel/accel-softmmu.h                              |  15 +
 accel/kvm/kvm-cpus.h                               |   2 -
 .../{tcg-cpus-icount.h => tcg-accel-ops-icount.h}  |   2 +
 accel/tcg/tcg-accel-ops-mttcg.h                    |  19 +
 accel/tcg/{tcg-cpus-rr.h => tcg-accel-ops-rr.h}    |   0
 accel/tcg/{tcg-cpus.h => tcg-accel-ops.h}          |   6 +-
 include/exec/cpu-all.h                             |  11 +-
 include/exec/cpu-defs.h                            |   3 -
 include/exec/exec-all.h                            |   2 +-
 include/hw/boards.h                                |   2 +-
 include/hw/core/accel-cpu.h                        |  38 ++
 include/hw/core/cpu.h                              |  86 +---
 include/hw/core/tcg-cpu-ops.h                      |  97 +++++
 include/{sysemu => qemu}/accel.h                   |  16 +-
 include/sysemu/accel-ops.h                         |  45 ++
 include/sysemu/cpus.h                              |  26 +-
 include/sysemu/hvf.h                               |   2 +-
 include/sysemu/kvm.h                               |   2 +-
 include/sysemu/kvm_int.h                           |   2 +-
 target/arm/internals.h                             |   6 +
 target/i386/hax/{hax-cpus.h => hax-accel-ops.h}    |   2 -
 target/i386/hax/hax-windows.h                      |   2 +-
 target/i386/hvf/{hvf-cpus.h => hvf-accel-ops.h}    |   2 -
 target/i386/hvf/hvf-i386.h                         |   2 +-
 target/i386/whpx/{whpx-cpus.h => whpx-accel-ops.h} |   2 -
 tcg/tci/tcg-target-con-set.h                       |   6 +-
 tcg/tci/tcg-target.h                               |  37 +-
 accel/accel-common.c                               | 105 +++++
 accel/{accel.c => accel-softmmu.c}                 |  61 ++-
 accel/accel-user.c                                 |  24 ++
 accel/kvm/{kvm-cpus.c => kvm-accel-ops.c}          |  28 +-
 accel/kvm/kvm-all.c                                |   2 -
 accel/qtest/qtest.c                                |  25 +-
 accel/tcg/cpu-exec.c                               |  53 ++-
 accel/tcg/cputlb.c                                 |  34 +-
 .../{tcg-cpus-icount.c => tcg-accel-ops-icount.c}  |  21 +-
 .../{tcg-cpus-mttcg.c => tcg-accel-ops-mttcg.c}    |  14 +-
 accel/tcg/{tcg-cpus-rr.c => tcg-accel-ops-rr.c}    |  13 +-
 accel/tcg/{tcg-cpus.c => tcg-accel-ops.c}          |  47 +-
 accel/tcg/tcg-all.c                                |  19 +-
 accel/tcg/user-exec.c                              |   8 +-
 accel/xen/xen-all.c                                |  26 +-
 bsd-user/main.c                                    |  11 +-
 cpu.c                                              |  66 +--
 hw/core/cpu.c                                      |  21 +-
 hw/mips/jazz.c                                     |  12 +-
 linux-user/main.c                                  |   7 +-
 softmmu/cpus.c                                     |  12 +-
 softmmu/memory.c                                   |   2 +-
 softmmu/physmem.c                                  | 149 ++++---
 softmmu/qtest.c                                    |   2 +-
 softmmu/vl.c                                       |   9 +-
 target/alpha/cpu.c                                 |  21 +-
 target/arm/cpu.c                                   |  45 +-
 target/arm/cpu64.c                                 |   4 +-
 target/arm/cpu_tcg.c                               |  32 +-
 target/arm/helper.c                                |   4 +
 target/arm/kvm64.c                                 |   6 +-
 target/avr/cpu.c                                   |  19 +-
 target/avr/helper.c                                |   5 +-
 target/cris/cpu.c                                  |  43 +-
 target/cris/helper.c                               |   5 +-
 target/hppa/cpu.c                                  |  24 +-
 target/i386/hax/{hax-cpus.c => hax-accel-ops.c}    |  33 +-
 target/i386/hax/hax-all.c                          |   7 +-
 target/i386/hax/hax-mem.c                          |   2 +-
 target/i386/hax/hax-posix.c                        |   2 +-
 target/i386/hax/hax-windows.c                      |   2 +-
 target/i386/hvf/{hvf-cpus.c => hvf-accel-ops.c}    |  29 +-
 target/i386/hvf/hvf.c                              |   5 +-
 target/i386/hvf/x86_task.c                         |   2 +-
 target/i386/hvf/x86hvf.c                           |   2 +-
 target/i386/tcg/tcg-cpu.c                          |  26 +-
 target/i386/whpx/{whpx-cpus.c => whpx-accel-ops.c} |  33 +-
 target/i386/whpx/whpx-all.c                        |   9 +-
 target/lm32/cpu.c                                  |  19 +-
 target/m68k/cpu.c                                  |  19 +-
 target/microblaze/cpu.c                            |  25 +-
 target/mips/cpu.c                                  |  35 +-
 target/moxie/cpu.c                                 |  15 +-
 target/nios2/cpu.c                                 |  18 +-
 target/openrisc/cpu.c                              |  17 +-
 target/riscv/cpu.c                                 |  26 +-
 target/riscv/cpu_helper.c                          |   2 +-
 target/rx/cpu.c                                    |  20 +-
 target/s390x/cpu.c                                 |  33 +-
 target/s390x/excp_helper.c                         |   2 +-
 target/sh4/cpu.c                                   |  21 +-
 target/sparc/cpu.c                                 |  25 +-
 target/tilegx/cpu.c                                |  17 +-
 target/tricore/cpu.c                               |  12 +-
 target/unicore32/cpu.c                             |  17 +-
 target/xtensa/cpu.c                                |  23 +-
 target/xtensa/helper.c                             |   4 +-
 tcg/tcg-common.c                                   |   4 -
 tcg/tci.c                                          | 479 ++++++++-------------
 target/ppc/translate_init.c.inc                    |  39 +-
 tcg/aarch64/tcg-target.c.inc                       |   7 +-
 tcg/s390/tcg-target.c.inc                          |   2 +-
 tcg/tci/tcg-target.c.inc                           | 149 ++-----
 MAINTAINERS                                        |   7 +-
 accel/kvm/meson.build                              |   2 +-
 accel/meson.build                                  |   4 +-
 accel/tcg/meson.build                              |  10 +-
 target/i386/hax/meson.build                        |   2 +-
 target/i386/hvf/meson.build                        |   2 +-
 target/i386/whpx/meson.build                       |   2 +-
 108 files changed, 1565 insertions(+), 1065 deletions(-)
 create mode 100644 accel/accel-softmmu.h
 rename accel/tcg/{tcg-cpus-icount.h => tcg-accel-ops-icount.h} (88%)
 create mode 100644 accel/tcg/tcg-accel-ops-mttcg.h
 rename accel/tcg/{tcg-cpus-rr.h => tcg-accel-ops-rr.h} (100%)
 rename accel/tcg/{tcg-cpus.h => tcg-accel-ops.h} (72%)
 create mode 100644 include/hw/core/accel-cpu.h
 create mode 100644 include/hw/core/tcg-cpu-ops.h
 rename include/{sysemu => qemu}/accel.h (94%)
 create mode 100644 include/sysemu/accel-ops.h
 rename target/i386/hax/{hax-cpus.h => hax-accel-ops.h} (95%)
 rename target/i386/hvf/{hvf-cpus.h => hvf-accel-ops.h} (94%)
 rename target/i386/whpx/{whpx-cpus.h => whpx-accel-ops.h} (96%)
 create mode 100644 accel/accel-common.c
 rename accel/{accel.c => accel-softmmu.c} (64%)
 create mode 100644 accel/accel-user.c
 rename accel/kvm/{kvm-cpus.c => kvm-accel-ops.c} (72%)
 rename accel/tcg/{tcg-cpus-icount.c => tcg-accel-ops-icount.c} (89%)
 rename accel/tcg/{tcg-cpus-mttcg.c => tcg-accel-ops-mttcg.c} (92%)
 rename accel/tcg/{tcg-cpus-rr.c => tcg-accel-ops-rr.c} (97%)
 rename accel/tcg/{tcg-cpus.c => tcg-accel-ops.c} (63%)
 rename target/i386/hax/{hax-cpus.c => hax-accel-ops.c} (69%)
 rename target/i386/hvf/{hvf-cpus.c => hvf-accel-ops.c} (84%)
 rename target/i386/whpx/{whpx-cpus.c => whpx-accel-ops.c} (71%)

