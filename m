Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30BEB40DE30
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 17:35:45 +0200 (CEST)
Received: from localhost ([::1]:41182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQtQO-00061e-6I
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 11:35:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mQtLL-0001Dq-HR
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 11:30:35 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:36666)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mQtLI-0002L2-39
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 11:30:31 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 u13-20020a17090abb0db0290177e1d9b3f7so7814849pjr.1
 for <qemu-devel@nongnu.org>; Thu, 16 Sep 2021 08:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+Pd4PxPzl+YtvsplSupB34Clbhb6OnJ4/tVDJ6pFE4w=;
 b=w1iPK4RhhndaQw8+vL7CtKyiSBmJuGNXNrNz3yZp0k2MMGAUC0EX0zrkLuvrTHWVws
 745ZIjDQhX80PFMI2lnyfPkGpoN7bCSoe2Mz7IdGbw0/EIWCt7g7kLwU2ZkPthjLbQh3
 ygekEEBHDup/RiE7Yr5BMWWl/OX5VCANJjpJ/pEuB7Wf06vstoQ02TTLGlusxCKL1y6h
 UaTlS7QBGgdM9tYJkaiWtUvYZq9VzMNtlxLSkIIGFgABQuAwTTZRabC3rhx1sjslV64S
 Q6AbWdcrJHdV+qcm2rmDOITB/SwAWpF/BLCMCFdK7+VSnFwltczKQD9wiSegvcZaxVYy
 yqRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+Pd4PxPzl+YtvsplSupB34Clbhb6OnJ4/tVDJ6pFE4w=;
 b=JIYqK/lDbPbTFQchijgN8iJidworVVfzgzdb+SdXS9ApOZ3D+i8FbL8uwB8MHEBrOs
 DrzGEudOFU0qTr8pcmIqQPQdMVCnooeIYkwSo9Dfxi17hVmfkLGywKy0BxvAYQ04kJJG
 HO1iu13DADgoROlwgA27NJ5xhnhCk0cyFkq4Oak9wKjhptPAnZgkc4ZyB7q2Jic7qAD0
 nPqA8atdvz5Me42+WwA1tfvKps5RrAsd5VUDEl4JSC+3rWprWZKi7HNP0k9KCllrWj1s
 BPqKWvtFBzNrSFOnvuwAEOfYoj65kCq25yq3SVCEFdZ5Mb5r9S+SiocsLHSKZaj1RkQz
 2ZWg==
X-Gm-Message-State: AOAM530YA2dhHoTwlwkauWWxpZZjlXd8phnqyD358t5kGXtgmUQ98TYJ
 GjKyZhWMp81AYLXJcsNAuMhriTCgflZwvQ==
X-Google-Smtp-Source: ABdhPJw0wT96HEbUslNGlD9ZtBwTjZLQvzftiT8Kro8vkqbfqHkI+WjjrfuZORw4556OE4NxE2gukw==
X-Received: by 2002:a17:90a:77c2:: with SMTP id
 e2mr6656138pjs.96.1631806226191; 
 Thu, 16 Sep 2021 08:30:26 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id b7sm3779447pgs.64.2021.09.16.08.30.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Sep 2021 08:30:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 00/35] tcg patch queue
Date: Thu, 16 Sep 2021 08:29:50 -0700
Message-Id: <20210916153025.1944763-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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

The following changes since commit 57b6f58c1d0df757c9311496c32d502925056894:

  Merge remote-tracking branch 'remotes/hreitz/tags/pull-block-2021-09-15' into staging (2021-09-15 18:55:59 +0100)

are available in the Git repository at:

  https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20210916

for you to fetch changes up to 50febfe212f24a9b91b4224d03f653415fddf8e1:

  tcg/mips: Drop special alignment for code_gen_buffer (2021-09-16 09:37:39 -0400)

----------------------------------------------------------------
Restrict cpu_has_work to sysemu, and move to AccelOpsClass.
Move cpu_signal_handler declaration out of target/.
Misc tcg/mips/ cleanups.

----------------------------------------------------------------
Philippe Mathieu-Daudé (30):
      accel/tcg: Restrict cpu_handle_halt() to sysemu
      hw/core: Restrict cpu_has_work() to sysemu
      hw/core: Un-inline cpu_has_work()
      sysemu: Introduce AccelOpsClass::has_work()
      accel/kvm: Implement AccelOpsClass::has_work()
      accel/whpx: Implement AccelOpsClass::has_work()
      accel/tcg: Implement AccelOpsClass::has_work() as stub
      target/alpha: Restrict has_work() handler to sysemu
      target/arm: Restrict has_work() handler to sysemu and TCG
      target/avr: Restrict has_work() handler to sysemu
      target/cris: Restrict has_work() handler to sysemu
      target/hexagon: Remove unused has_work() handler
      target/hppa: Restrict has_work() handler to sysemu
      target/i386: Restrict has_work() handler to sysemu and TCG
      target/m68k: Restrict has_work() handler to sysemu
      target/microblaze: Restrict has_work() handler to sysemu
      target/mips: Restrict has_work() handler to sysemu and TCG
      target/nios2: Restrict has_work() handler to sysemu
      target/openrisc: Restrict has_work() handler to sysemu
      target/ppc: Introduce PowerPCCPUClass::has_work()
      target/ppc: Restrict has_work() handlers to sysemu and TCG
      target/riscv: Restrict has_work() handler to sysemu and TCG
      target/rx: Restrict has_work() handler to sysemu
      target/s390x: Restrict has_work() handler to sysemu and TCG
      target/sh4: Restrict has_work() handler to sysemu
      target/sparc: Remove pointless use of CONFIG_TCG definition
      target/sparc: Restrict has_work() handler to sysemu
      target/tricore: Restrict has_work() handler to sysemu
      target/xtensa: Restrict has_work() handler to sysemu
      accel: Add missing AccelOpsClass::has_work() and drop SysemuCPUOps one

Richard Henderson (5):
      include/exec: Move cpu_signal_handler declaration
      tcg/mips: Drop inline markers
      tcg/mips: Allow JAL to be out of range in tcg_out_bswap_subr
      tcg/mips: Unset TCG_TARGET_HAS_direct_jump
      tcg/mips: Drop special alignment for code_gen_buffer

 include/exec/exec-all.h           |  13 +++++
 include/hw/core/cpu.h             |  28 ++++------
 include/hw/core/tcg-cpu-ops.h     |   4 ++
 include/sysemu/accel-ops.h        |   5 ++
 target/alpha/cpu.h                |   6 ---
 target/arm/cpu.h                  |   7 ---
 target/avr/cpu.h                  |   2 -
 target/cris/cpu.h                 |   8 ---
 target/hexagon/cpu.h              |   3 --
 target/hppa/cpu.h                 |   3 --
 target/i386/cpu.h                 |   7 ---
 target/m68k/cpu.h                 |   8 ---
 target/microblaze/cpu.h           |   7 ---
 target/mips/cpu.h                 |   3 --
 target/mips/internal.h            |   2 -
 target/nios2/cpu.h                |   2 -
 target/openrisc/cpu.h             |   2 -
 target/ppc/cpu-qom.h              |   3 ++
 target/ppc/cpu.h                  |   7 ---
 target/riscv/cpu.h                |   2 -
 target/rx/cpu.h                   |   4 --
 target/s390x/cpu.h                |   7 ---
 target/sh4/cpu.h                  |   3 --
 target/sparc/cpu.h                |   2 -
 target/tricore/cpu.h              |   2 -
 target/xtensa/cpu.h               |   2 -
 tcg/mips/tcg-target.h             |  12 ++---
 accel/hvf/hvf-accel-ops.c         |   6 +++
 accel/kvm/kvm-accel-ops.c         |   6 +++
 accel/qtest/qtest.c               |   6 +++
 accel/tcg/cpu-exec.c              |   6 ++-
 accel/tcg/tcg-accel-ops.c         |  12 +++++
 accel/xen/xen-all.c               |   6 +++
 hw/core/cpu-common.c              |   6 ---
 softmmu/cpus.c                    |  10 ++--
 target/alpha/cpu.c                |   4 +-
 target/arm/cpu.c                  |   7 ++-
 target/avr/cpu.c                  |   2 +-
 target/cris/cpu.c                 |   4 +-
 target/hexagon/cpu.c              |   6 ---
 target/hppa/cpu.c                 |   4 +-
 target/i386/cpu.c                 |   6 ---
 target/i386/hax/hax-accel-ops.c   |   6 +++
 target/i386/nvmm/nvmm-accel-ops.c |   6 +++
 target/i386/tcg/tcg-cpu.c         |   8 ++-
 target/i386/whpx/whpx-accel-ops.c |   6 +++
 target/m68k/cpu.c                 |   4 +-
 target/microblaze/cpu.c           |   8 +--
 target/mips/cpu.c                 |   4 +-
 target/nios2/cpu.c                |   4 +-
 target/openrisc/cpu.c             |   4 +-
 target/ppc/cpu_init.c             |  37 ++++++++++----
 target/riscv/cpu.c                |   8 ++-
 target/rx/cpu.c                   |   4 +-
 target/s390x/cpu.c                |   4 +-
 target/sh4/cpu.c                  |   5 +-
 target/sparc/cpu.c                |   6 +--
 target/tricore/cpu.c              |   6 ++-
 target/xtensa/cpu.c               |  14 ++---
 tcg/region.c                      |  91 ---------------------------------
 tcg/mips/tcg-target.c.inc         | 105 +++++++++++++-------------------------
 61 files changed, 233 insertions(+), 342 deletions(-)

