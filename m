Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B68F340A1E2
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 02:27:15 +0200 (CEST)
Received: from localhost ([::1]:48382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPwI6-0004vs-OZ
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 20:27:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPw6P-0001i6-1A
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 20:15:09 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:44807)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPw6F-0007YU-Qa
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 20:15:08 -0400
Received: by mail-pl1-x636.google.com with SMTP id d18so6969848pll.11
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 17:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cqsNI8eB8dYdrkbYfVw44LeDsz6A95z3X+kux7Iyodc=;
 b=m7AGjrzK6GAz6j0ckkXwkpb6pK+LfS598/yfeL7XT68S408rcTPEUXsG1VJa7+Mc4J
 Q05fNo7GFrFmTi+oeSkoCQmg7NMuA8R5WCfA40FQD//Xvf4a04+w62MdN/zyImMO17iQ
 IddEe7cf7b1M57BfuAuf/1IdVv7lmTnNZlLhSrC7n8y5Z2t+M8/DWtcURAmzpFXHlSMJ
 SLxhxRq/XEeQxjFJwpqm17W9vGxFf41cozSKSIo5SOmvuOh/Z0iJaSBUjK3rla8hMEaT
 q3I/S11gL3TXFRj4bwFAi50itRq0KNPhCdgP8TeCO+E15JMmJt+ngof8vLcJtwamfV9K
 +Itw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cqsNI8eB8dYdrkbYfVw44LeDsz6A95z3X+kux7Iyodc=;
 b=TzgQJ9e7SuP8OHbDert92SP/yBoDvP8cnaazEg7T9XmBPfswx94ZynbjrONLQzNxNP
 PochjoFYr4C9XSYpeQ2SEEvlXukLz16c/Rk6Z6hO4HnFA03vVyP0wDs5hcQRvNtCNku4
 cmre80vzztqd4yunfscZJPWlUo6mgRkprfw4wKEdjUXErbueWJPNwnRr+6o729eeKzsp
 NOM7gqG+Ri/Bq1Daqah1jIpxD8K6QDWqlw+GXeoP3Zf4Xcuyo9vCwwLVlv76pOJHCHAi
 MyG/FDhhf+c2HjUdU0aj/nXZXSH1es//2YXULnem8hFt2rH0eRD5uGkmMZA3Doohhrnp
 IaQg==
X-Gm-Message-State: AOAM530wiZxcGOlEoxTdVBStfkp8sk14wP7ASmh0IcmS0HwfrYvyDhz3
 5D3c4Gs7lHuiiJ1K35JtTOAwPH2hNN2JeQ==
X-Google-Smtp-Source: ABdhPJyRYQMFPye2KGzIoNy0O5wxoVoWV9WJM67fKpPEy94FkgDyWitTDPC1XKRok/nBmag+YjyNvQ==
X-Received: by 2002:a17:902:b202:b0:13a:2f9a:bd97 with SMTP id
 t2-20020a170902b20200b0013a2f9abd97mr12697092plr.2.1631578498067; 
 Mon, 13 Sep 2021 17:14:58 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id m7sm9334179pgn.32.2021.09.13.17.14.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 17:14:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 00/44] tcg patch queue, v2
Date: Mon, 13 Sep 2021 17:14:12 -0700
Message-Id: <20210914001456.793490-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

Version 2 drops the bswap patch that caused such problems
on the various BSDs; I'll have to look at that further.
In the meantime I've also been collecting more pending
patches, and I might as well include them now.


r~


The following changes since commit 7d79344d4fa44e520e6e89f8fed9a27d3d554a9b:

  Merge remote-tracking branch 'remotes/bonzini-gitlab/tags/for-upstream' into staging (2021-09-13 13:33:21 +0100)

are available in the Git repository at:

  https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20210913

for you to fetch changes up to 5b778e9b4e0e0a37a86200e6af322b2a9b69c62e:

  tcg/arm: More use of the TCGReg enum (2021-09-13 12:09:05 -0700)

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

Philippe Mathieu-Daudé (25):
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
      user: Mark cpu_loop() with noreturn attribute

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

 bsd-user/qemu.h                           |   2 +-
 include/exec/translate-all.h              |   1 +
 include/exec/translator.h                 |  44 +--
 include/hw/core/tcg-cpu-ops.h             |  26 +-
 include/tcg/tcg-op.h                      |   2 -
 linux-user/qemu.h                         |   2 +-
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
 87 files changed, 702 insertions(+), 630 deletions(-)

