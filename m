Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB29F40B82B
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 21:34:45 +0200 (CEST)
Received: from localhost ([::1]:56838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQECa-0006wg-OI
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 15:34:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mQE9a-0004By-94
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 15:31:38 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:44582)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mQE9Y-0001mz-E5
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 15:31:38 -0400
Received: by mail-pf1-x42e.google.com with SMTP id b7so284455pfo.11
 for <qemu-devel@nongnu.org>; Tue, 14 Sep 2021 12:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yLjkJDld/NkduZAOMzve/po3wnfh8pYm6OF1IYAcAbg=;
 b=r+gQAgOEPJVdxvEBbUU4vWZCoNlUfZDLmzM5B2QyPhgWbbSUuKNTn8lXw1OusWW1TN
 v1YA379lIowQ75J/GtjoGkuprZWwaKR1x8+cTZI9dQ9YKvURRfgxHljbQoXxiy7JMFHh
 YmY3wgfmgxAH2qp8ENgdyEbxH04pBH3+pbUYp6r6QfHB1Zuy1h2DnpykooC4b8/97UZX
 cGe1wXGmmO+SwqB/Fkdvv0BFFL0DRBuDTkPLz2PxZo7npTFmB9FjGCLRE4b8wGFaFZOW
 ATnc5aRZuq/20AXEjuy22moVgTZGN6NpEZIFJMzQU0M6cgZuKdy2ZpieI5AMPa3CP3BU
 HHZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yLjkJDld/NkduZAOMzve/po3wnfh8pYm6OF1IYAcAbg=;
 b=B1XaoFLM2PqspcvwEgx3NBm0mad8ebgr6nFr+RfjjIpLSMtJprPKvWbk51PltkouUD
 xOX8syacy/8XpdxD+ee2ZeOgNrmXEKh5rJkVPTo8ELRdDPC5150v3Bcb8lMQuYElhed0
 4KIML6Knd5K0ea73Df8jTfWkkmxqA/x/xu30RMnq1NMXTuLbiathFPBX/s2k6tuvORMK
 J4dWykzrKRIZYNEFGwpWpIOMSenqtOqbFU27kJvcCyvAwaUzvEaDm2yXBbMtzwJOI5y5
 MtPEV/57Q3TpQ8J9Kps3MQuMpYDRyPbiWf7uRi5yR3CjaDRaD+bcTyNDD9JSvov9FYyb
 vqYQ==
X-Gm-Message-State: AOAM530WdC3Z4lSSRYp4dvJsf1bJHBo/R7Uwb2FEcCD+lEbvvy5vjGiZ
 xdKxsvTcFo5cZaFkHJFZ8NmDEFmlKZnmsA==
X-Google-Smtp-Source: ABdhPJwhKj+Qx0w5kZaniA+O1q6B89P8VAcKULp8t+GDLBJdsQhl+l0+95TxpXQkikcVNefBCz1L4w==
X-Received: by 2002:a63:e057:: with SMTP id n23mr17124661pgj.183.1631647895002; 
 Tue, 14 Sep 2021 12:31:35 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id j5sm2398163pjv.56.2021.09.14.12.31.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Sep 2021 12:31:34 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL v4 00/43] tcg patch queue
Date: Tue, 14 Sep 2021 12:31:33 -0700
Message-Id: <20210914193133.1388599-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
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

Version 4: Drop the cpu_loop noreturn patch.


r~


The following changes since commit 4c9af1ea1457782cf0adb293179335ef6de942aa:

  gitlab-ci: Make more custom runner jobs manual, and don't allow failure (2021-09-14 17:03:03 +0100)

are available in the Git repository at:

  https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20210914-4

for you to fetch changes up to e028eada62dbfcba134ac5afdefc3aa343ae202f:

  tcg/arm: More use of the TCGReg enum (2021-09-14 12:00:21 -0700)

----------------------------------------------------------------
Fix translation race condition for user-only.
Fix tcg/i386 encoding for VPSLLVQ, VPSRLVQ.
Fix tcg/arm tcg_out_vec_op signature.
Fix tcg/ppc (32bit) build with clang.
Remove dupluate TCG_KICK_PERIOD definition.
Remove unused tcg_global_reg_new.
Restrict cpu_exec_interrupt and its callees to sysemu.
Cleanups for tcg/arm.

----------------------------------------------------------------
Bin Meng (1):
      tcg: Remove tcg_global_reg_new defines

Ilya Leoshkevich (3):
      accel/tcg: Add DisasContextBase argument to translator_ld*
      accel/tcg: Clear PAGE_WRITE before translation
      accel/tcg/user-exec: Fix read-modify-write of code on s390 hosts

Jose R. Ziviani (1):
      tcg/arm: Fix tcg_out_vec_op function signature

Luc Michel (1):
      accel/tcg: remove redundant TCG_KICK_PERIOD define

Philippe Mathieu-Daudé (24):
      target/avr: Remove pointless use of CONFIG_USER_ONLY definition
      target/i386: Restrict sysemu-only fpu_helper helpers
      target/i386: Simplify TARGET_X86_64 #ifdef'ry
      target/xtensa: Restrict do_transaction_failed() to sysemu
      accel/tcg: Rename user-mode do_interrupt hack as fake_user_interrupt
      target/alpha: Restrict cpu_exec_interrupt() handler to sysemu
      target/arm: Restrict cpu_exec_interrupt() handler to sysemu
      target/cris: Restrict cpu_exec_interrupt() handler to sysemu
      target/hppa: Restrict cpu_exec_interrupt() handler to sysemu
      target/i386: Restrict cpu_exec_interrupt() handler to sysemu
      target/i386: Move x86_cpu_exec_interrupt() under sysemu/ folder
      target/m68k: Restrict cpu_exec_interrupt() handler to sysemu
      target/microblaze: Restrict cpu_exec_interrupt() handler to sysemu
      target/mips: Restrict cpu_exec_interrupt() handler to sysemu
      target/nios2: Restrict cpu_exec_interrupt() handler to sysemu
      target/openrisc: Restrict cpu_exec_interrupt() handler to sysemu
      target/ppc: Restrict cpu_exec_interrupt() handler to sysemu
      target/riscv: Restrict cpu_exec_interrupt() handler to sysemu
      target/sh4: Restrict cpu_exec_interrupt() handler to sysemu
      target/sparc: Restrict cpu_exec_interrupt() handler to sysemu
      target/rx: Restrict cpu_exec_interrupt() handler to sysemu
      target/xtensa: Restrict cpu_exec_interrupt() handler to sysemu
      accel/tcg: Restrict TCGCPUOps::cpu_exec_interrupt() to sysemu
      user: Remove cpu_get_pic_interrupt() stubs

Richard Henderson (13):
      tcg/i386: Split P_VEXW from P_REXW
      tcg/ppc: Replace TCG_TARGET_CALL_DARWIN with _CALL_DARWIN
      tcg/ppc: Ensure _CALL_SYSV is set for 32-bit ELF
      tcg/arm: Remove fallback definition of __ARM_ARCH
      tcg/arm: Standardize on tcg_out_<branch>_{reg,imm}
      tcg/arm: Simplify use_armv5t_instructions
      tcg/arm: Support armv4t in tcg_out_goto and tcg_out_call
      tcg/arm: Split out tcg_out_ldstm
      tcg/arm: Simplify usage of encode_imm
      tcg/arm: Drop inline markers
      tcg/arm: Give enum arm_cond_code_e a typedef and use it
      tcg/arm: More use of the ARMInsn enum
      tcg/arm: More use of the TCGReg enum

 include/exec/translate-all.h              |   1 +
 include/exec/translator.h                 |  44 +--
 include/hw/core/tcg-cpu-ops.h             |  26 +-
 include/tcg/tcg-op.h                      |   2 -
 target/alpha/cpu.h                        |   2 +-
 target/arm/arm_ldst.h                     |  12 +-
 target/arm/cpu.h                          |   3 +-
 target/cris/cpu.h                         |   2 +-
 target/hppa/cpu.h                         |   4 +-
 target/i386/cpu.h                         |   3 +
 target/i386/tcg/helper-tcg.h              |   2 +
 target/m68k/cpu.h                         |   2 +
 target/microblaze/cpu.h                   |   2 +
 target/mips/tcg/tcg-internal.h            |   5 +-
 target/openrisc/cpu.h                     |   5 +-
 target/ppc/cpu.h                          |   4 +-
 target/riscv/cpu.h                        |   2 +-
 target/rx/cpu.h                           |   2 +
 target/sh4/cpu.h                          |   4 +-
 target/xtensa/cpu.h                       |   2 +
 tcg/arm/tcg-target.h                      |  27 +-
 accel/tcg/cpu-exec.c                      |  14 +-
 accel/tcg/tcg-accel-ops-rr.c              |   2 -
 accel/tcg/translate-all.c                 |  59 ++--
 accel/tcg/translator.c                    |  39 +++
 accel/tcg/user-exec.c                     |  48 ++-
 bsd-user/i386/target_arch_cpu.c           |   5 -
 bsd-user/x86_64/target_arch_cpu.c         |   5 -
 linux-user/main.c                         |   7 -
 target/alpha/cpu.c                        |   2 +-
 target/alpha/helper.c                     |   5 +-
 target/alpha/translate.c                  |   2 +-
 target/arm/cpu.c                          |   7 +-
 target/arm/cpu_tcg.c                      |   6 +-
 target/arm/translate-a64.c                |   2 +-
 target/arm/translate.c                    |   9 +-
 target/avr/cpu.c                          |   3 -
 target/cris/cpu.c                         |   4 +-
 target/cris/helper.c                      |  17 +-
 target/hexagon/translate.c                |   3 +-
 target/hppa/cpu.c                         |   2 +-
 target/hppa/int_helper.c                  |   7 +-
 target/hppa/translate.c                   |   5 +-
 target/i386/tcg/seg_helper.c              |  74 +----
 target/i386/tcg/sysemu/seg_helper.c       |  62 ++++
 target/i386/tcg/tcg-cpu.c                 |   8 +-
 target/i386/tcg/translate.c               |  10 +-
 target/m68k/cpu.c                         |   2 +-
 target/m68k/op_helper.c                   |  16 +-
 target/m68k/translate.c                   |   2 +-
 target/microblaze/cpu.c                   |   2 +-
 target/microblaze/helper.c                |  13 +-
 target/mips/cpu.c                         |   2 +-
 target/mips/tcg/exception.c               |  18 --
 target/mips/tcg/sysemu/tlb_helper.c       |  18 ++
 target/mips/tcg/translate.c               |   8 +-
 target/mips/tcg/user/tlb_helper.c         |   5 -
 target/nios2/cpu.c                        |   5 +-
 target/openrisc/cpu.c                     |   2 +-
 target/openrisc/interrupt.c               |   2 -
 target/openrisc/translate.c               |   2 +-
 target/ppc/cpu_init.c                     |   2 +-
 target/ppc/excp_helper.c                  |  21 +-
 target/ppc/translate.c                    |   5 +-
 target/riscv/cpu.c                        |   2 +-
 target/riscv/cpu_helper.c                 |   5 -
 target/riscv/translate.c                  |   5 +-
 target/rx/cpu.c                           |   2 +-
 target/rx/helper.c                        |   4 +
 target/s390x/tcg/translate.c              |  16 +-
 target/sh4/cpu.c                          |   2 +-
 target/sh4/helper.c                       |   9 +-
 target/sh4/translate.c                    |   4 +-
 target/sparc/cpu.c                        |   4 +-
 target/sparc/translate.c                  |   2 +-
 target/xtensa/cpu.c                       |   2 +-
 target/xtensa/exc_helper.c                |   7 +-
 target/xtensa/translate.c                 |   5 +-
 target/mips/tcg/micromips_translate.c.inc |   2 +-
 target/mips/tcg/mips16e_translate.c.inc   |   4 +-
 target/mips/tcg/nanomips_translate.c.inc  |   4 +-
 tcg/arm/tcg-target.c.inc                  | 517 ++++++++++++++++--------------
 tcg/i386/tcg-target.c.inc                 |  13 +-
 tcg/ppc/tcg-target.c.inc                  |  25 +-
 target/openrisc/meson.build               |   6 +-
 85 files changed, 700 insertions(+), 628 deletions(-)

