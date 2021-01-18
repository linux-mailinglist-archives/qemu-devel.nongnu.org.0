Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9756D2F9DD7
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 12:19:09 +0100 (CET)
Received: from localhost ([::1]:55408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1SYu-00051S-Fb
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 06:19:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l1SXf-0004by-NK
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 06:17:51 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:34010)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l1SXd-00025p-FL
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 06:17:51 -0500
Received: by mail-wm1-x32a.google.com with SMTP id o10so5681148wmc.1
 for <qemu-devel@nongnu.org>; Mon, 18 Jan 2021 03:17:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pviYIAPGnPPpQWGISbuqzpVXqCAK10wCDqvSJv7v3XY=;
 b=Fo/sA1brvztW2/7uT0wSi9b94EMBjSPELq/Sbrny1txAgMgJzEt/kgnNmAsNxUQivD
 orKRZJQWxWnG8nw9NFIeLa2B52AMXkr2EidwPy4zXiM+9fdZDr2pBEwkRsDd0fIFg9Jz
 9FJwumpyrOqA+WvTzzxYwI5X4CaRZFSDyr+lmk2BzHcytt4qrfq23dMgyZVBkM2Pvb/q
 dklgaA/pTlpjAEJAmJHtt//rRuwJ5XRP+Di6+6nEeckr8rEG3ne+S4AJ87y5m/OIIYeA
 bWk7oOCE0x5FMijE1ovM8zei0xT9ZwQ5UFWiqnwEV+iv/4R61TgOuhcYtf4huEXrbgcg
 dd3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pviYIAPGnPPpQWGISbuqzpVXqCAK10wCDqvSJv7v3XY=;
 b=azLewPT/GfuH9djboxQsh6vrGpdlKH5JF2ccRUp9wVDUQ/eKx0O0y+2MVT6BRaOBPb
 znXjmDdySu8R6VqRdJyTHzAdkzsabh4DhL/x80qGnrai8S825An98bGJL9MUVrFhKWUG
 kq2Td7U3vQTilAmV2wpmxbQqHWOzCGWdHpMjWBRqBnChqNeXHiZfPgrgSdSfuAYd53T8
 76td+naCtMcBQyKuN0s+uldxsC41McIHYwIkGVe51KwRgiB0akzX6MI7Cecmvs22428B
 //NzGUN/hD8aj/jU3YzPwlhawrF87Om4U1yexlhV9MW9uE1O+n2zIO//El1Ae2gDRiqu
 ljWg==
X-Gm-Message-State: AOAM530i04+iDpsei8GyJF3OtU1qsgAEgvhP9xQ9yH5y69t5bouJ0ybN
 HVvBIkNMm4Kic+3L+Unsn3lbHA==
X-Google-Smtp-Source: ABdhPJxGU9m5t5xnXEguAUp8ezwJqouZN63yi1j8xjDEj3TN2ahjQLVmw7b48n3Uan9EvbJPzzTbFg==
X-Received: by 2002:a1c:2341:: with SMTP id j62mr7200920wmj.34.1610968667391; 
 Mon, 18 Jan 2021 03:17:47 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id l12sm11735584wmj.9.2021.01.18.03.17.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jan 2021 03:17:45 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 29BF51FF7E;
 Mon, 18 Jan 2021 11:17:45 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL v2 00/30] testing, gdbstub and semihosting
Date: Mon, 18 Jan 2021 11:17:45 +0000
Message-Id: <20210118111745.20104-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 825a215c003cd028e26c7d19aa5049d957345f43:

  Merge remote-tracking branch 'remotes/kraxel/tags/audio-20210115-pull-request' into staging (2021-01-15 22:21:21 +0000)

are available in the Git repository at:

  https://github.com/stsquad/qemu.git tags/pull-testing-and-misc-180121-2

for you to fetch changes up to 767ba049b8f8f8ebfebe90ecaf1b5a9cf8c865ff:

  semihosting: Implement SYS_ISERROR (2021-01-18 10:05:06 +0000)

----------------------------------------------------------------
Testing, gdbstub and semihosting patches:

  - clean-ups to docker images
  - drop duplicate jobs from shippable
  - prettier tag generation (+gtags)
  - generate browsable source tree
  - more Travis->GitLab migrations
  - fix checkpatch to deal with commits
  - gate gdbstub tests on 8.3.1, expand tests
  - support Xfer:auxv:read gdb packet
  - better gdbstub cleanup
  - use GDB's SVE register layout
  - make arm-compat-semihosting common
  - add riscv semihosting support
  - add HEAPINFO, ELAPSED, TICKFREQ, TMPNAM and ISERROR to semihosting

----------------------------------------------------------------
Alessandro Di Federico (1):
      Add newline when generating Dockerfile

Alex Bennée (16):
      Makefile: add GNU global tags support
      Makefile: wrap ctags in quiet-command calls
      Makefile: wrap etags in quiet-command calls
      Makefile: wrap cscope in quiet-command calls
      docker: expand debian-amd64 image to include tag tools
      gitlab: move docs and tools build across from Travis
      gitlab: migrate the minimal tools and unit tests from Travis
      scripts/checkpatch.pl: fix git-show invocation to include diffstat
      test/guest-debug: echo QEMU command as well
      configure: gate our use of GDB to 8.3.1 or above
      Revert "tests/tcg/multiarch/Makefile.target: Disable run-gdbstub-sha1 test"
      gdbstub: implement a softmmu based test
      gdbstub: drop CPUEnv from gdb_exit()
      gdbstub: drop gdbserver_cleanup in favour of gdb_exit
      gdbstub: ensure we clean-up when terminated
      target/arm: use official org.gnu.gdb.aarch64.sve layout for registers

Keith Packard (8):
      semihosting: Move ARM semihosting code to shared directories
      semihosting: Change common-semi API to be architecture-independent
      semihosting: Change internal common-semi interfaces to use CPUState *
      semihosting: Support SYS_HEAPINFO when env->boot_info is not set
      riscv: Add semihosting support
      semihosting: Implement SYS_ELAPSED and SYS_TICKFREQ
      semihosting: Implement SYS_TMPNAM
      semihosting: Implement SYS_ISERROR

Kito Cheng (1):
      riscv: Add semihosting support for user mode

Lirong Yuan (1):
      gdbstub: add support to Xfer:auxv:read: packet

Lukas Straub (1):
      Fix build with new yank feature by adding stubs

Philippe Mathieu-Daudé (2):
      tests/docker: Remove Debian 9 remnant lines
      shippable.yml: Remove jobs duplicated on Gitlab-CI

 configure                                          |   7 +-
 Makefile                                           |  46 +-
 default-configs/devices/arm-softmmu.mak            |   1 +
 default-configs/devices/riscv32-softmmu.mak        |   2 +
 default-configs/devices/riscv64-softmmu.mak        |   2 +
 default-configs/targets/aarch64-linux-user.mak     |   1 +
 default-configs/targets/aarch64_be-linux-user.mak  |   1 +
 default-configs/targets/arm-linux-user.mak         |   1 +
 default-configs/targets/armeb-linux-user.mak       |   1 +
 default-configs/targets/riscv32-linux-user.mak     |   1 +
 default-configs/targets/riscv64-linux-user.mak     |   1 +
 hw/semihosting/common-semi.h                       |  39 ++
 include/exec/gdbstub.h                             |  14 +-
 include/qemu/timer.h                               |   2 +
 linux-user/qemu.h                                  |   4 +-
 target/arm/cpu.h                                   |   8 -
 target/riscv/cpu_bits.h                            |   1 +
 bsd-user/syscall.c                                 |   6 +-
 gdbstub.c                                          |  65 ++-
 .../arm-semi.c => hw/semihosting/arm-compat-semi.c | 525 ++++++++++++++-------
 linux-user/aarch64/cpu_loop.c                      |   3 +-
 linux-user/arm/cpu_loop.c                          |   3 +-
 linux-user/exit.c                                  |   2 +-
 linux-user/riscv/cpu_loop.c                        |   5 +
 linux-user/{arm => }/semihost.c                    |   8 +-
 softmmu/runstate.c                                 |   2 +-
 stubs/yank.c                                       |  29 ++
 target/arm/gdbstub.c                               |  75 ++-
 target/arm/helper.c                                |   7 +-
 target/arm/m_helper.c                              |   7 +-
 target/m68k/m68k-semi.c                            |   2 +-
 target/nios2/nios2-semi.c                          |   2 +-
 target/riscv/cpu_helper.c                          |  10 +
 target/riscv/translate.c                           |  11 +
 util/qemu-timer-common.c                           |   4 +
 target/riscv/insn_trans/trans_privileged.c.inc     |  37 +-
 .gitignore                                         |   3 +
 .gitlab-ci.yml                                     |  30 +-
 .shippable.yml                                     |  14 +-
 .travis.yml                                        |  25 -
 MAINTAINERS                                        |   2 +
 hw/semihosting/Kconfig                             |   4 +
 hw/semihosting/meson.build                         |   3 +
 linux-user/arm/meson.build                         |   3 -
 linux-user/meson.build                             |   1 +
 qemu-options.hx                                    |  10 +-
 scripts/checkpatch.pl                              |   2 +-
 stubs/meson.build                                  |   1 +
 target/arm/meson.build                             |   2 -
 tests/docker/Makefile.include                      |   1 -
 tests/docker/docker.py                             |   4 +-
 tests/docker/dockerfiles/debian-amd64.docker       |   5 +-
 tests/guest-debug/run-test.py                      |  35 +-
 tests/tcg/aarch64/Makefile.softmmu-target          |   1 +
 tests/tcg/aarch64/gdbstub/test-sve-ioctl.py        |  11 +
 tests/tcg/aarch64/system/boot.S                    |   1 +
 tests/tcg/i386/Makefile.softmmu-target             |   1 +
 tests/tcg/i386/system/boot.S                       |   2 +-
 tests/tcg/multiarch/Makefile.target                |  13 +-
 tests/tcg/multiarch/gdbstub/memory.py              | 130 +++++
 .../tcg/multiarch/gdbstub/test-qxfer-auxv-read.py  |  57 +++
 tests/tcg/multiarch/system/Makefile.softmmu-target |  19 +-
 tests/tcg/x86_64/Makefile.softmmu-target           |   1 +
 tests/tcg/x86_64/system/boot.S                     |   2 +-
 64 files changed, 982 insertions(+), 336 deletions(-)
 create mode 100644 hw/semihosting/common-semi.h
 rename target/arm/arm-semi.c => hw/semihosting/arm-compat-semi.c (66%)
 rename linux-user/{arm => }/semihost.c (89%)
 create mode 100644 stubs/yank.c
 create mode 100644 tests/tcg/multiarch/gdbstub/memory.py
 create mode 100644 tests/tcg/multiarch/gdbstub/test-qxfer-auxv-read.py

-- 
2.20.1


