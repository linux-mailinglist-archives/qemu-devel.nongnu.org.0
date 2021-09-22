Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 227D9413FC5
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 04:51:43 +0200 (CEST)
Received: from localhost ([::1]:50478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSsMH-0006b1-PP
	for lists+qemu-devel@lfdr.de; Tue, 21 Sep 2021 22:51:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSsLF-0005sm-KB
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 22:50:37 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:38402)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSsLD-0007Fj-Rk
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 22:50:37 -0400
Received: by mail-pf1-x433.google.com with SMTP id y4so1434362pfe.5
 for <qemu-devel@nongnu.org>; Tue, 21 Sep 2021 19:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bS5TG+ZF3gtTGUyek7vqzOfYXC/RB+1kpLPOu3JfcWI=;
 b=US1HQWR7/bZ3kjzY6laBdgtL85IJQIMYifvE/nJyZ01CK8Bn/zv/jSTomqJxyUQgua
 YipR74/JAM36+QKQFsUP3+v7s1AMdgVPn9kAOEoD+j1W8fyKVFDRGIzJtXu1Em68YZXt
 BgJW7uJr9VyrgmRVY5u3ejZ1EpPTqb/pA7DOXdcsPLwPasxz67lHir5ABExjhDrFI/NK
 ckTOiQPFA2BGWFatFjxK8Eg8jW4SJT/81Z0YOC821hNBD/hW5gFkEH2jt1UYy1+lLGWH
 CLpIHNDx8EISkNPne9laQet1t9uAKO+UczHrLYPzHbWOzYxB4ABi8wAzNZPpb5qWznj8
 cvnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bS5TG+ZF3gtTGUyek7vqzOfYXC/RB+1kpLPOu3JfcWI=;
 b=H6qn8QhJIEBnIA0AB6EA/ftJCDskayJnGhdIQa4GrpjcafQYe6jWwisp0qQpJUk3Q8
 CWQ+dOaZhUwN6lnvylJFRZMd/XW84pDW/AVhOHvLA3GbvNyV+7k/WHrAqE9tN5Pjpmsv
 lHolje+wwAy/L3lNJXH4vdE52HmYX60KouuQtqnH2YVd4Nad2mBgg9mdSVXmNsfAdxVG
 2kfZdqYSP3M1S19iQgBmBmSWaaAZfDmVa3lx4rFQ4vqEOlS9b0nLLp4VeH38n2/aYTIk
 8f9qJMGOZQ1DDnjX+IxixDPx21d3UvSVchbsGQGpvZu/abPQYCb3F8o4zX2ioSDu7gO/
 8yJQ==
X-Gm-Message-State: AOAM532xTGc3j9YM2U7WVjJHg2SjfoKIu3AQ8N4m439tXsTq6UEYf63O
 1j0EhH8hkBDu86tcd05gCBLN6RKW4sfsvA==
X-Google-Smtp-Source: ABdhPJzd6gGMAJjnatBuFYYJ4DDhNX85LjV10pWoaMyb9hZ0I5dDUmf38idRZzpmkNQjFnj0wuIL0w==
X-Received: by 2002:a63:b20c:: with SMTP id x12mr23888865pge.10.1632279031801; 
 Tue, 21 Sep 2021 19:50:31 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id x13sm433112pfp.133.2021.09.21.19.50.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Sep 2021 19:50:31 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 00/10] tcg patch queue, v3
Date: Tue, 21 Sep 2021 19:50:30 -0700
Message-Id: <20210922025030.574829-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
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

Rebase and resolve minor conflict.

r~


The following changes since commit 2c3e83f92d93fbab071b8a96b8ab769b01902475:

  Merge remote-tracking branch 'remotes/alistair23/tags/pull-riscv-to-apply-20210921' into staging (2021-09-21 10:57:48 -0700)

are available in the Git repository at:

  https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20210921

for you to fetch changes up to 81c65ee223ba759c15c11068f9b292a59a900451:

  tcg/riscv: Remove add with zero on user-only memory access (2021-09-21 19:36:44 -0700)

----------------------------------------------------------------
Move cpu_signal_handler declaration.
Restrict cpu_handle_halt to sysemu.
Make do_unaligned_access noreturn.
Misc tcg/mips cleanup
Misc tcg/sparc cleanup
Misc tcg/riscv cleanup

----------------------------------------------------------------
Philippe Mathieu-Daudé (1):
      accel/tcg: Restrict cpu_handle_halt() to sysemu

Richard Henderson (9):
      include/exec: Move cpu_signal_handler declaration
      tcg/mips: Drop inline markers
      tcg/mips: Allow JAL to be out of range in tcg_out_bswap_subr
      tcg/mips: Unset TCG_TARGET_HAS_direct_jump
      tcg/mips: Drop special alignment for code_gen_buffer
      tcg/sparc: Drop inline markers
      tcg/sparc: Introduce tcg_out_mov_delay
      hw/core: Make do_unaligned_access noreturn
      tcg/riscv: Remove add with zero on user-only memory access

 include/exec/exec-all.h        |  13 +++++
 include/hw/core/tcg-cpu-ops.h  |   3 +-
 target/alpha/cpu.h             |  10 +---
 target/arm/cpu.h               |   7 ---
 target/arm/internals.h         |   2 +-
 target/avr/cpu.h               |   2 -
 target/cris/cpu.h              |   8 ----
 target/hexagon/cpu.h           |   3 --
 target/hppa/cpu.h              |   3 --
 target/i386/cpu.h              |   7 ---
 target/m68k/cpu.h              |   8 ----
 target/microblaze/cpu.h        |   9 +---
 target/mips/cpu.h              |   3 --
 target/mips/internal.h         |   2 -
 target/mips/tcg/tcg-internal.h |   4 +-
 target/nios2/cpu.h             |   6 +--
 target/openrisc/cpu.h          |   2 -
 target/ppc/cpu.h               |   7 ---
 target/ppc/internal.h          |   4 +-
 target/riscv/cpu.h             |   4 +-
 target/rx/cpu.h                |   4 --
 target/s390x/cpu.h             |   7 ---
 target/s390x/s390x-internal.h  |   4 +-
 target/sh4/cpu.h               |   7 +--
 target/sparc/cpu.h             |   2 -
 target/tricore/cpu.h           |   2 -
 target/xtensa/cpu.h            |   6 +--
 tcg/mips/tcg-target.h          |  12 ++---
 accel/tcg/cpu-exec.c           |   6 ++-
 target/hppa/cpu.c              |   7 +--
 tcg/region.c                   |  91 -----------------------------------
 tcg/mips/tcg-target.c.inc      | 105 ++++++++++++++---------------------------
 tcg/riscv/tcg-target.c.inc     |  10 +---
 tcg/sparc/tcg-target.c.inc     |  64 ++++++++++++++-----------
 34 files changed, 119 insertions(+), 315 deletions(-)

