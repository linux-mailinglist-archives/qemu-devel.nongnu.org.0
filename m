Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD1E242B2DB
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 04:48:38 +0200 (CEST)
Received: from localhost ([::1]:44376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maUJp-0006vE-CE
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 22:48:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maUHY-00047D-5v
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 22:46:16 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:40700)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maUHT-0004i2-U3
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 22:46:15 -0400
Received: by mail-pf1-x429.google.com with SMTP id o133so1147257pfg.7
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 19:46:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=D+SL9DK22+05zjJaps7prWGE0LusCQdvTcC7DuV82kM=;
 b=rwGVTEGq9a/v8jzTA2T0Y957citRTtdQUYQQgXfaQgharmoY3Z9u/kSSEvgc8OnBhM
 xPuZHCK7o3RhKIaQbnY/uH7LOZvBLmRWpmcAeTaGw8VVfKJEB6HUea6hAHknMxO3L0cR
 llXyDzZ/2LfnydoB2V3Q1U0U9t8mhB/l3mcBn9h3mNVFHTB42KjGAbQbMkqhUEzgS7b2
 sKbd8/1cWuUm7osdbbHhP5XfXscDHXKJ0YomTNurIwv74leceIB5tXsBlf7OpnK81AJZ
 qjdect1SJvHGywLoAgYaxwt0WkV/tMHKCSdfqYPe0orpJxQzYmRnseI9aVsNNqXMDVm4
 CMBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=D+SL9DK22+05zjJaps7prWGE0LusCQdvTcC7DuV82kM=;
 b=1qlnhir2EOuMeUA4vYTx4+P7bAMD1e+hS/aEupGFOa9CKO8nvbYKwvKAcZcwHrsISF
 rYMzoXzb5DmWiKv//wfowSe7XXIC4Cak0mbTjgUx3+vP6e9Es08mGWasXEiwBbnqSGJo
 marg8lh0Yysrrl+vUjoH+lkOjeoTAW+QV6vF6XAUDpCmUapE85YsFonqROwEbtn2xih0
 nfC30hYtwtE8vFv/NbfPIBKJqR16T47gSuUVRpvvVCpWNWQ3lApKshnOKEUReJNVg/cU
 oeUvjKU+ARxxtrGWiWccn811QqN/5UaqrF4BVFi4vKDd9EDslX1/3dLJckWvWKvtbHhe
 x9qQ==
X-Gm-Message-State: AOAM5321Tmo1ZuILqEsj+6NuzQfG+7m5VdqC3EaILzXYOawDcXxKeULR
 QCdFG6bvYW3/nzc0wDV9gmHjG5R5Dvp9Bw==
X-Google-Smtp-Source: ABdhPJynbtPdRV6/F9sZXbxQ7p8bJMsQd5R3qyk1wmkxW9fcc3V5eHxfLW3Sgg4Qik+pRI7nJLbtHw==
X-Received: by 2002:a63:ce0f:: with SMTP id y15mr25792278pgf.249.1634093169807; 
 Tue, 12 Oct 2021 19:46:09 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id qe17sm4855014pjb.39.2021.10.12.19.46.08
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 19:46:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 00/48] 
Date: Tue, 12 Oct 2021 19:45:19 -0700
Message-Id: <20211013024607.731881-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
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

Based-on: 20211006172307.780893-1-richard.henderson@linaro.org
("[PATCH v4 00/41] linux-user: Streamline handling of SIGSEGV")

This began with Peter wanting a cpu_ldst.h interface that can handle
alignment info for Arm M-profile system mode, which will also compile
for user-only without ifdefs.

Once I had that interface, I thought I might as well enforce the
requested alignment in user-only.  There are plenty of cases where
we ought to have been doing that for quite a while.  This took rather
more work than I imagined to start.

Changes for v4:
  * Rebase, with some patches now upstream.
  * Rename the core function to cpu_loop_exit_sigbus.

Changes for v3:
  * Updated tcg/{aarch64,ppc,s390,riscv,tci}.

Changes for v2:
  * Cleanup prctl(2), add support for prctl(PR_GET/SET_UNALIGN).
  * Adjustments for ppc and sparc reporting address during alignment fault.


r~


Richard Henderson (48):
  hw/core: Add TCGCPUOps.record_sigbus
  linux-user: Add cpu_loop_exit_sigbus
  linux-user/alpha: Remove EXCP_UNALIGN handling
  target/arm: Implement arm_cpu_record_sigbus
  linux-user/hppa: Remove EXCP_UNALIGN handling
  target/microblaze: Do not set MO_ALIGN for user-only
  target/ppc: Move SPR_DSISR setting to powerpc_excp
  target/ppc: Set fault address in ppc_cpu_do_unaligned_access
  target/ppc: Restrict ppc_cpu_do_unaligned_access to sysemu
  target/s390x: Implement s390x_cpu_record_sigbus
  linux-user/hppa: Remove POWERPC_EXCP_ALIGN handling
  target/sh4: Set fault address in superh_cpu_do_unaligned_access
  target/sparc: Remove DEBUG_UNALIGNED
  target/sparc: Split out build_sfsr
  target/sparc: Set fault address in sparc_cpu_do_unaligned_access
  accel/tcg: Report unaligned atomics for user-only
  target/arm: Use MO_128 for 16 byte atomics
  target/i386: Use MO_128 for 16 byte atomics
  target/ppc: Use MO_128 for 16 byte atomics
  target/s390x: Use MO_128 for 16 byte atomics
  target/hexagon: Implement cpu_mmu_index
  accel/tcg: Add cpu_{ld,st}*_mmu interfaces
  accel/tcg: Move cpu_atomic decls to exec/cpu_ldst.h
  target/mips: Use cpu_*_data_ra for msa load/store
  target/mips: Use 8-byte memory ops for msa load/store
  target/s390x: Use cpu_*_mmu instead of helper_*_mmu
  target/sparc: Use cpu_*_mmu instead of helper_*_mmu
  target/arm: Use cpu_*_mmu instead of helper_*_mmu
  tcg: Move helper_*_mmu decls to tcg/tcg-ldst.h
  tcg: Add helper_unaligned_{ld,st} for user-only sigbus
  linux-user: Split out do_prctl and subroutines
  linux-user: Disable more prctl subcodes
  Revert "cpu: Move cpu_common_props to hw/core/cpu.c"
  linux-user: Add code for PR_GET/SET_UNALIGN
  target/alpha: Reorg fp memory operations
  target/alpha: Reorg integer memory operations
  target/alpha: Implement prctl_unalign_sigbus
  target/hppa: Implement prctl_unalign_sigbus
  target/sh4: Implement prctl_unalign_sigbus
  linux-user/signal: Handle BUS_ADRALN in host_signal_handler
  tcg: Canonicalize alignment flags in MemOp
  tcg/i386: Support raising sigbus for user-only
  tcg/aarch64: Support raising sigbus for user-only
  tcg/ppc: Support raising sigbus for user-only
  tcg/s390: Support raising sigbus for user-only
  tcg/tci: Support raising sigbus for user-only
  tcg/riscv: Support raising sigbus for user-only
  tests/tcg/multiarch: Add sigbus.c

 docs/devel/loads-stores.rst               |  52 ++-
 include/exec/cpu_ldst.h                   | 332 ++++++++-------
 include/exec/exec-all.h                   |  14 +
 include/hw/core/cpu.h                     |   4 +
 include/hw/core/tcg-cpu-ops.h             |  23 +
 include/tcg/tcg-ldst.h                    |  79 ++++
 include/tcg/tcg.h                         | 158 -------
 linux-user/aarch64/target_prctl.h         | 160 +++++++
 linux-user/aarch64/target_syscall.h       |  23 -
 linux-user/alpha/target_prctl.h           |   1 +
 linux-user/arm/target_prctl.h             |   1 +
 linux-user/cris/target_prctl.h            |   1 +
 linux-user/generic/target_prctl_unalign.h |  27 ++
 linux-user/hexagon/target_prctl.h         |   1 +
 linux-user/hppa/target_prctl.h            |   1 +
 linux-user/i386/target_prctl.h            |   1 +
 linux-user/m68k/target_prctl.h            |   1 +
 linux-user/microblaze/target_prctl.h      |   1 +
 linux-user/mips/target_prctl.h            |  88 ++++
 linux-user/mips/target_syscall.h          |   6 -
 linux-user/mips64/target_prctl.h          |   1 +
 linux-user/mips64/target_syscall.h        |   6 -
 linux-user/nios2/target_prctl.h           |   1 +
 linux-user/openrisc/target_prctl.h        |   1 +
 linux-user/ppc/target_prctl.h             |   1 +
 linux-user/riscv/target_prctl.h           |   1 +
 linux-user/s390x/target_prctl.h           |   1 +
 linux-user/sh4/target_prctl.h             |   1 +
 linux-user/sparc/target_prctl.h           |   1 +
 linux-user/x86_64/target_prctl.h          |   1 +
 linux-user/xtensa/target_prctl.h          |   1 +
 target/alpha/cpu.h                        |   5 +
 target/arm/internals.h                    |   2 +
 target/hexagon/cpu.h                      |   9 +
 target/hppa/cpu.h                         |   5 +-
 target/ppc/internal.h                     |   8 +-
 target/s390x/s390x-internal.h             |   8 +-
 target/sh4/cpu.h                          |   4 +
 tcg/aarch64/tcg-target.h                  |   2 -
 tcg/i386/tcg-target.h                     |   2 -
 tcg/ppc/tcg-target.h                      |   2 -
 tcg/riscv/tcg-target.h                    |   2 -
 tcg/s390x/tcg-target.h                    |   2 -
 accel/tcg/cputlb.c                        | 393 ++++++-----------
 accel/tcg/user-exec.c                     | 414 ++++++++----------
 cpu.c                                     |  31 ++
 hw/core/cpu-common.c                      |  17 +-
 linux-user/aarch64/cpu_loop.c             |  12 +-
 linux-user/alpha/cpu_loop.c               |  15 -
 linux-user/arm/cpu_loop.c                 |  30 +-
 linux-user/hppa/cpu_loop.c                |   7 -
 linux-user/ppc/cpu_loop.c                 |   8 -
 linux-user/signal.c                       |  17 +
 linux-user/syscall.c                      | 490 +++++++++-------------
 target/alpha/translate.c                  | 188 +++++----
 target/arm/cpu.c                          |   1 +
 target/arm/cpu_tcg.c                      |   1 +
 target/arm/helper-a64.c                   |  61 +--
 target/arm/m_helper.c                     |   6 +-
 target/arm/tlb_helper.c                   |   6 +
 target/hppa/translate.c                   |  19 +-
 target/i386/tcg/mem_helper.c              |   2 +-
 target/m68k/op_helper.c                   |   1 -
 target/microblaze/translate.c             |  16 +
 target/mips/tcg/msa_helper.c              | 389 ++++-------------
 target/ppc/excp_helper.c                  |  41 +-
 target/ppc/mem_helper.c                   |   1 -
 target/ppc/translate.c                    |  12 +-
 target/s390x/cpu.c                        |   1 +
 target/s390x/tcg/excp_helper.c            |  27 +-
 target/s390x/tcg/mem_helper.c             |  13 +-
 target/sh4/op_helper.c                    |   5 +
 target/sh4/translate.c                    |  50 ++-
 target/sparc/ldst_helper.c                |  36 +-
 target/sparc/mmu_helper.c                 |  92 ++--
 tcg/tcg-op.c                              |   7 +-
 tcg/tcg.c                                 |   1 +
 tcg/tci.c                                 |  21 +-
 tests/tcg/multiarch/sigbus.c              |  68 +++
 accel/tcg/ldst_common.c.inc               | 307 ++++++++++++++
 tcg/aarch64/tcg-target.c.inc              |  91 +++-
 tcg/i386/tcg-target.c.inc                 | 103 ++++-
 tcg/ppc/tcg-target.c.inc                  |  98 ++++-
 tcg/riscv/tcg-target.c.inc                |  63 ++-
 tcg/s390x/tcg-target.c.inc                |  59 ++-
 85 files changed, 2457 insertions(+), 1804 deletions(-)
 create mode 100644 include/tcg/tcg-ldst.h
 create mode 100644 linux-user/aarch64/target_prctl.h
 create mode 100644 linux-user/alpha/target_prctl.h
 create mode 100644 linux-user/arm/target_prctl.h
 create mode 100644 linux-user/cris/target_prctl.h
 create mode 100644 linux-user/generic/target_prctl_unalign.h
 create mode 100644 linux-user/hexagon/target_prctl.h
 create mode 100644 linux-user/hppa/target_prctl.h
 create mode 100644 linux-user/i386/target_prctl.h
 create mode 100644 linux-user/m68k/target_prctl.h
 create mode 100644 linux-user/microblaze/target_prctl.h
 create mode 100644 linux-user/mips/target_prctl.h
 create mode 100644 linux-user/mips64/target_prctl.h
 create mode 100644 linux-user/nios2/target_prctl.h
 create mode 100644 linux-user/openrisc/target_prctl.h
 create mode 100644 linux-user/ppc/target_prctl.h
 create mode 100644 linux-user/riscv/target_prctl.h
 create mode 100644 linux-user/s390x/target_prctl.h
 create mode 100644 linux-user/sh4/target_prctl.h
 create mode 100644 linux-user/sparc/target_prctl.h
 create mode 100644 linux-user/x86_64/target_prctl.h
 create mode 100644 linux-user/xtensa/target_prctl.h
 create mode 100644 tests/tcg/multiarch/sigbus.c
 create mode 100644 accel/tcg/ldst_common.c.inc

-- 
2.25.1


