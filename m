Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75F6B2F7C3B
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 14:13:46 +0100 (CET)
Received: from localhost ([::1]:56820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0OvB-0000PY-HM
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 08:13:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l0OqJ-00069W-1v
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 08:08:43 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:37354)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l0OqC-0006VA-M4
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 08:08:42 -0500
Received: by mail-wm1-x331.google.com with SMTP id g10so7552255wmh.2
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 05:08:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qYgjXnM5+weLRerajYGqUg9AhOZiddNIPBG7F/je1PY=;
 b=cAebHsSEBZbJk0sokLR5mZ7aYtT6FFR538wk5DB/fUFuAHv/bOelzwKiMkt+eF7O9m
 J343SxV3NgrtHbob+bTLnvUVVMluhtMVvNPeM+9cLp5GXtAWxyNfVwJlF1chJpi9FDyO
 hQaBwEssn0usrssWxRRNnYwNCLIBXi7K3hSmd1wT8UvWzb+UuQhquEfGU2wibKtXHs9D
 KiKN9FuTeeygNCIuale2Vbs14IzPT6UXjzhsnPHVczXIMXLschx+Nz9P16bs9khkDlMb
 5zzpcKwLfWEHdVdYrGJJpa+ocqhjYHuJY15TBJt9bcNL6oOUoz9PoRVoZuYgDE1gtEJo
 w7DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qYgjXnM5+weLRerajYGqUg9AhOZiddNIPBG7F/je1PY=;
 b=bKq5jLcAJbi5zW922VvFNC9sYJL8RVR8WgaP7c0opSYsjtnSlddfzkCc3P2laoPBiR
 0O1g4R07/d/N1w1b71rDarhsghXhoW5p7vuZax/RtqZJpFiINQvHcXh6L97rnTgFyi/q
 ucSfoblYqqMNVTDcMLqgpxoqp71WTg833uSlfifWC07GQN+NFsv/WTyYpG/3GNeCjEAf
 na0LQJT285NgsaLbOPiBu8lAoQuuAFslc0pIlcdB7W4Le0iDr1Bqt8NsJfo2qMsiWvLE
 I+mM4LRTRn0Aa4xQjYIiA7k+uBy1yPPRPS0hEn9YI9JhRDloZXqqPyH1Psqgkoq5FrPy
 aVew==
X-Gm-Message-State: AOAM531Tk7mKj1MutmAggB7W8chy4HLDvCqbH+lOSmMYsK9RA/5/wmaS
 TbdyK798JDdA3f0aDzaln45SkQ==
X-Google-Smtp-Source: ABdhPJzKp1GdYrPp+Oiz9uOpHrXwtTHXi3mdhuBI6HlwBJJTGj0yruEfxwXVoH26ailfA3YXZoAAtQ==
X-Received: by 2002:a05:600c:29cc:: with SMTP id
 s12mr8685843wmd.180.1610716114883; 
 Fri, 15 Jan 2021 05:08:34 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id t188sm12422024wmf.9.2021.01.15.05.08.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 05:08:29 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id ABBED1FF7E;
 Fri, 15 Jan 2021 13:08:28 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 00/30] testing, gdbstub and semihosting
Date: Fri, 15 Jan 2021 13:07:58 +0000
Message-Id: <20210115130828.23968-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x331.google.com
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

The following changes since commit 7c79721606be11b5bc556449e5bcbc331ef6867d:

  Merge remote-tracking branch 'remotes/rth-gitlab/tags/pull-tcg-20210113' into staging (2021-01-14 09:54:29 +0000)

are available in the Git repository at:

  https://github.com/stsquad/qemu.git tags/pull-testing-and-misc-150121-1

for you to fetch changes up to be846761ca8b5a7e2e7b7108c8c156126b799824:

  semihosting: Implement SYS_ISERROR (2021-01-15 11:12:34 +0000)

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


