Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B08286593C8
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Dec 2022 01:20:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pB2r7-0002zs-1p; Thu, 29 Dec 2022 19:02:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pB2r1-0002xH-Fb
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 19:02:33 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pB2qz-0002eq-8p
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 19:02:31 -0500
Received: by mail-pl1-x634.google.com with SMTP id n4so20381404plp.1
 for <qemu-devel@nongnu.org>; Thu, 29 Dec 2022 16:02:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=wMfWWYPSA+Wvt2YDp37zKXv93i1Lj2ZWmCA3jKpiFKA=;
 b=GrlNShfBhgaUIyWz/xz0kUc7bj48rSY0kmHNHSJhBKj5GepkIcf3vjU8QKgplP7zJG
 wdRf6DjsAqxIKSn/QjlQ+XPSrd3/Jtf7yghURHs4E/ZDf40YVhq9hDkZqnIscyKTpk8+
 MwsMGtFRewnb+0Vn/p9t6okjakGuTMZT3KJ8WB+k8mfhgomJNZcAh1KvMkilvjAzyjSE
 f8ZVCG0vxxGHMzshOKU+ZyeqoBtLxTrh3oibdiSpnyVnsOP1RVgUzD5mNnNNtvcYHroJ
 o/6gXuVxMHU2eabJ8qbnsXvbVuel+POm60oKhxYpjYW09eIqj0Gu89YS6Re50SJvLkPn
 QFkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wMfWWYPSA+Wvt2YDp37zKXv93i1Lj2ZWmCA3jKpiFKA=;
 b=HGTcfkKPMotp/GzBK8kdfCrV4d++wyDqXB4qrrXYcJ+iDltlyHqXcXa3dab+/MZfJL
 gwPzwB+Pn4GqE3e5do218+MH1GQw8eDcIE9rZJdODX3G+o///NwazaxoTWBcmQWx0tDp
 7rfVOgpsAllu92qhx8E+HNx8gxZHGYbEqfPXat6fIHSt78T0g98Ax3VFXzvnV1bEepYp
 jxAFXPgyBFSS/Pvt8oENpyqvybbt8HHCYE4++SBNaqqjDOw5I8H73cfHrHe6lOnV9I1z
 VDWvqHwiFh9AEiKemGXDSaULyiEURQBmgh3zykahlMn3ZPqMMRs3Q9VRo9w0pn4B20gk
 LzmA==
X-Gm-Message-State: AFqh2ko8G4LhfOUuxZax0z6+AzucVq+jBOu9CkpEe2C7LeuPxNAtQVOl
 Gqu7xpXzALGgHfqvNMWVp/2hlIhoMu1kb2J+
X-Google-Smtp-Source: AMrXdXufxj2GxIjUBYRbJWC/bzfK/+M/GTAFAnqX9GdXly2WCWbkXX0qirUx/jZiIUXQixOJgrpJyQ==
X-Received: by 2002:a17:902:7b8b:b0:187:4920:3a3c with SMTP id
 w11-20020a1709027b8b00b0018749203a3cmr37087217pll.33.1672358542977; 
 Thu, 29 Dec 2022 16:02:22 -0800 (PST)
Received: from stoup.. (76-14-210-194.or.wavecable.com. [76.14.210.194])
 by smtp.gmail.com with ESMTPSA id
 j14-20020a170903028e00b00192849e1d0asm7343953plr.116.2022.12.29.16.02.22
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Dec 2022 16:02:22 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 00/47] tcg patch queue
Date: Thu, 29 Dec 2022 16:01:34 -0800
Message-Id: <20221230000221.2764875-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The following changes since commit 222059a0fccf4af3be776fe35a5ea2d6a68f9a0b:

  Merge tag 'pull-ppc-20221221' of https://gitlab.com/danielhb/qemu into staging (2022-12-21 18:08:09 +0000)

are available in the Git repository at:

  https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20221229

for you to fetch changes up to b05e35533782a71a9fda472afd08442f50622a3e:

  tests/tcg/multiarch: add vma-pthread.c (2022-12-29 12:39:45 -0800)

----------------------------------------------------------------
Fix race conditions in new user-only vma tracking.
Add tcg backend paired register allocation.
Cleanup tcg backend function call abi.

----------------------------------------------------------------
Ilya Leoshkevich (1):
      tests/tcg/multiarch: add vma-pthread.c

Mark Cave-Ayland (1):
      tcg: convert tcg/README to rst

Philippe Mathieu-Daudé (5):
      tcg/s390x: Fix coding style
      tcg: Massage process_op_defs()
      tcg: Pass number of arguments to tcg_emit_op() / tcg_op_insert_*()
      tcg: Convert typecode_to_ffi from array to function
      tcg: Factor init_ffi_layouts() out of tcg_context_init()

Richard Henderson (40):
      meson: Move CONFIG_TCG_INTERPRETER to config_host
      tcg: Cleanup trailing whitespace
      qemu/main-loop: Introduce QEMU_IOTHREAD_LOCK_GUARD
      hw/mips: Use QEMU_IOTHREAD_LOCK_GUARD in cpu_mips_irq_request
      target/ppc: Use QEMU_IOTHREAD_LOCK_GUARD in ppc_maybe_interrupt
      target/ppc: Use QEMU_IOTHREAD_LOCK_GUARD in cpu_interrupt_exittb
      target/riscv: Use QEMU_IOTHREAD_LOCK_GUARD in riscv_cpu_update_mip
      hw/ppc: Use QEMU_IOTHREAD_LOCK_GUARD in ppc_set_irq
      accel/tcg: Use QEMU_IOTHREAD_LOCK_GUARD in io_readx/io_writex
      tcg: Tidy tcg_reg_alloc_op
      tcg: Remove TCG_TARGET_STACK_GROWSUP
      tci: MAX_OPC_PARAM_IARGS is no longer used
      tcg: Fix tcg_reg_alloc_dup*
      tcg: Centralize updates to reg_to_temp
      tcg: Remove check_regs
      tcg: Introduce paired register allocation
      accel/tcg: Set cflags_next_tb in cpu_common_initfn
      target/sparc: Avoid TCGV_{LOW,HIGH}
      tcg: Move TCG_{LOW,HIGH} to tcg-internal.h
      tcg: Add temp_subindex to TCGTemp
      tcg: Simplify calls to temp_sync vs mem_coherent
      tcg: Allocate TCGTemp pairs in host memory order
      tcg: Move TCG_TYPE_COUNT outside enum
      tcg: Introduce tcg_type_size
      tcg: Introduce TCGCallReturnKind and TCGCallArgumentKind
      tcg: Replace TCG_TARGET_CALL_ALIGN_ARGS with TCG_TARGET_CALL_ARG_I64
      tcg: Replace TCG_TARGET_EXTEND_ARGS with TCG_TARGET_CALL_ARG_I32
      tcg: Use TCG_CALL_ARG_EVEN for TCI special case
      accel/tcg/plugin: Don't search for the function pointer index
      accel/tcg/plugin: Avoid duplicate copy in copy_call
      accel/tcg/plugin: Use copy_op in append_{udata,mem}_cb
      tcg: Vary the allocation size for TCGOp
      tcg: Use output_pref wrapper function
      tcg: Reorg function calls
      tcg: Move ffi_cif pointer into TCGHelperInfo
      tcg/aarch64: Merge tcg_out_callr into tcg_out_call
      tcg: Add TCGHelperInfo argument to tcg_out_call
      accel/tcg: Fix tb_invalidate_phys_page_unwind
      accel/tcg: Use g_free_rcu for user-exec interval trees
      accel/tcg: Handle false negative lookup in page_check_range

 docs/devel/atomics.rst               |    2 +
 docs/devel/index-tcg.rst             |    1 +
 docs/devel/tcg-ops.rst               |  941 +++++++++++++++++++
 docs/devel/tcg.rst                   |    2 +-
 meson.build                          |    4 +-
 include/exec/helper-head.h           |    2 +-
 include/qemu/main-loop.h             |   29 +
 include/tcg/tcg-op.h                 |   35 +-
 include/tcg/tcg.h                    |   96 +-
 tcg/aarch64/tcg-target.h             |    4 +-
 tcg/arm/tcg-target.h                 |    4 +-
 tcg/i386/tcg-target.h                |    2 +
 tcg/loongarch64/tcg-target.h         |    3 +-
 tcg/mips/tcg-target.h                |    4 +-
 tcg/riscv/tcg-target.h               |    7 +-
 tcg/s390x/tcg-target.h               |    3 +-
 tcg/sparc64/tcg-target.h             |    3 +-
 tcg/tcg-internal.h                   |   58 +-
 tcg/tci/tcg-target.h                 |    7 +
 tests/tcg/multiarch/nop_func.h       |   25 +
 accel/tcg/cputlb.c                   |   25 +-
 accel/tcg/plugin-gen.c               |   54 +-
 accel/tcg/tb-maint.c                 |   78 +-
 accel/tcg/user-exec.c                |   59 +-
 hw/core/cpu-common.c                 |    1 +
 hw/mips/mips_int.c                   |   11 +-
 hw/ppc/ppc.c                         |   10 +-
 target/ppc/excp_helper.c             |   11 +-
 target/ppc/helper_regs.c             |   14 +-
 target/riscv/cpu_helper.c            |   10 +-
 target/sparc/translate.c             |   21 +-
 tcg/optimize.c                       |   10 +-
 tcg/tcg-op-vec.c                     |   10 +-
 tcg/tcg-op.c                         |   49 +-
 tcg/tcg.c                            | 1658 +++++++++++++++++++++-------------
 tcg/tci.c                            |    1 -
 tests/tcg/multiarch/munmap-pthread.c |   16 +-
 tests/tcg/multiarch/vma-pthread.c    |  207 +++++
 tcg/aarch64/tcg-target.c.inc         |   19 +-
 tcg/arm/tcg-target.c.inc             |   10 +-
 tcg/i386/tcg-target.c.inc            |    5 +-
 tcg/loongarch64/tcg-target.c.inc     |    7 +-
 tcg/mips/tcg-target.c.inc            |    3 +-
 tcg/ppc/tcg-target.c.inc             |   36 +-
 tcg/riscv/tcg-target.c.inc           |    7 +-
 tcg/s390x/tcg-target.c.inc           |   32 +-
 tcg/sparc64/tcg-target.c.inc         |    3 +-
 tcg/tci/tcg-target.c.inc             |    7 +-
 tcg/README                           |  784 ----------------
 tests/tcg/multiarch/Makefile.target  |    3 +
 50 files changed, 2630 insertions(+), 1763 deletions(-)
 create mode 100644 docs/devel/tcg-ops.rst
 create mode 100644 tests/tcg/multiarch/nop_func.h
 create mode 100644 tests/tcg/multiarch/vma-pthread.c
 delete mode 100644 tcg/README

