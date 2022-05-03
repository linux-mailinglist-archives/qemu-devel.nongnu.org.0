Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EDF6518DA1
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 21:58:14 +0200 (CEST)
Received: from localhost ([::1]:35762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlyez-0002NC-HO
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 15:58:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nlyVu-0000tF-Ie
 for qemu-devel@nongnu.org; Tue, 03 May 2022 15:48:50 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:38522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nlyVs-0003VY-6V
 for qemu-devel@nongnu.org; Tue, 03 May 2022 15:48:50 -0400
Received: by mail-pl1-x632.google.com with SMTP id n18so15881478plg.5
 for <qemu-devel@nongnu.org>; Tue, 03 May 2022 12:48:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ucbWrXGCADjIBHX46eDzOyvPI6/OOVWU2t1Aaxgg4bc=;
 b=SbKr9AG79A8+0NuyQTmIb4nb2EezFDniKbs20xmkRs/5/tfKnoeCnyIzk0lzHvy/qv
 C9mzX7Py34HJYmoOMxlcinPA/t9Mc4HKt+VPct2eSi5j43ib9JVGusrjQkLUHbKHv3UJ
 QL0ZvveYMuz/OAInYO6brOEAOnP2FR119HvSA6xhK7Ry1qehJyIfh1TN+9LXGHgbRC+j
 HHMQLgGyL3WGu7TLw+rwQOOlX2XBJ8iRyMuArfGz6KP9UqPB2ne0vLVN2Iqq2zYe/lhg
 NJYcYtgMnKT69v1OM0yDOkWB5YJkErwFrt1hObiMZouCiTOTgL0TwpkiZZ9fR+UXNkja
 SaRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ucbWrXGCADjIBHX46eDzOyvPI6/OOVWU2t1Aaxgg4bc=;
 b=LEPunIq4trbaYa3Tk97EblP0iKtYMaxVA+7djs5vN4EnzSR8q3UewPOsGLdlgD8gWv
 9ZAfrXqhej2VOTKncJGIZLQgeOaHrYhlL1x7fm2hAX1DHr4kTez/eqNV8i3HfDUh8FM4
 6gsBinsKHc84ZEP/gwurOWpP7v1TgTfGzXp70TYmYrDEcyrX8rIBhWT/qfGbw6jXMhcD
 6U2LSjMSacACZycL/C+WIoAk+RAUhnWP5MvzfrEoTUirLh0VXkR82qo+8BjkUtNmvwRf
 A7KAp+R6zYOVeCzSPK12uK1NggQMpBWuyDdFAZsroRkn3LBDRIbCt14Bug6ZHpUTztRn
 Zzrg==
X-Gm-Message-State: AOAM530TuYBb7Wqw2MCSpSxJ8rblLrX1FiPfWRSsuvLaroL17B5RjVyQ
 UPmWLbaZvNeaHD3KbC/3DEnXMlN69nc/lQ==
X-Google-Smtp-Source: ABdhPJxsJXF5ZuToBtdpW8Npx09z3pwjTIAqdQwjo9t5qCPsJlgz2v1mn5uHjYmQNhC7NSCns6pPcw==
X-Received: by 2002:a17:902:c2cc:b0:15b:a4e6:f58c with SMTP id
 c12-20020a170902c2cc00b0015ba4e6f58cmr17823527pla.149.1651607325255; 
 Tue, 03 May 2022 12:48:45 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 p11-20020a17090ad30b00b001cd4989fed3sm1712383pju.31.2022.05.03.12.48.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 May 2022 12:48:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org, f4bug@amsat.org, crwulff@gmail.com,
 laurent@vivier.eu, shorne@gmail.com
Subject: [PATCH v2 00/74] semihosting cleanup
Date: Tue,  3 May 2022 12:47:29 -0700
Message-Id: <20220503194843.1379101-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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

Changes for v2:
  * Drop m68k and nios2 patches to move semihosting exception to helper.

  * Merge semihosting console into GuestFD.

  * Split syscalls into new files.
    Having them in guestfd.[ch] seemed wrong.

  * Standardize on GDB remote-protocol errno.  Having done this, I'm
    not sure it's the best idea -- mips and xtensa semihosting have a
    larger set of errno values than GDB.  Better, perhaps, to standardize
    on host errno and then convert GDB errno back to host on the way
    out of gdbstub.c:handle_file_io.

  * Convert mips and xtensa to semihosting/syscalls.h

  * Implement rx semihosting, with tests.

Still on the to-do list:

  * Non-Coldfire m68k semihosting.  The libgloss spec says that "bkpt"
    may be used when "halt" is not available in the ISA.  Add m68k
    semihosting tests -- we already have a cross toolchain in docker,
    so this should be easy.

  * Support dynamic endianness in arm-compat-semi.c; add tests for
    aarch64 big-endian system mode.

  * Split this patch set.  :-)


r~


Cc: alex.bennee@linaro.org
Cc: f4bug@amsat.org
Cc: crwulff@gmail.com
Cc: laurent@vivier.eu
Cc: shorne@gmail.com


Richard Henderson (74):
  semihosting: Move exec/softmmu-semi.h to semihosting/softmmu-uaccess.h
  semihosting: Return failure from softmmu-uaccess.h functions
  semihosting: Improve condition for config.c and console.c
  semihosting: Move softmmu-uaccess.h functions out of line
  semihosting: Add target_strlen for softmmu-uaccess.h
  semihosting: Simplify softmmu_lock_user_string
  semihosting: Split out guestfd.c
  semihosting: Generalize GuestFDFeatureFile
  semihosting: Return void from do_common_semihosting
  semihosting: Adjust error checking in common_semi_cb
  semihosting: Move common-semi.h to include/semihosting/
  include/exec: Move gdb open flags to gdbstub.h
  include/exec: Move gdb_stat and gdb_timeval to gdbstub.h
  include/exec: Define errno values in gdbstub.h
  semihosting: Use struct gdb_stat in common_semi_flen_cb
  semihosting: Split is_64bit_semihosting per target
  semihosting: Split common_semi_flen_buf per target
  semihosting: Split out common_semi_has_synccache
  semihosting: Use env more often in do_common_semihosting
  semihosting: Move GET_ARG/SET_ARG earlier in the file
  semihosting: Split out semihost_sys_open
  semihosting: Split out semihost_sys_close
  semihosting: Split out semihost_sys_read
  semihosting: Split out semihost_sys_write
  semihosting: Bound length for semihost_sys_{read,write}
  semihosting: Split out semihost_sys_lseek
  semihosting: Split out semihost_sys_isatty
  semihosting: Split out semihost_sys_flen
  semihosting: Split out semihost_sys_remove
  semihosting: Split out semihost_sys_rename
  semihosting: Split out semihost_sys_system
  semihosting: Create semihost_sys_{stat,fstat}
  semihosting: Create semihost_sys_gettimeofday
  gdbstub: Widen gdb_syscall_complete_cb return value
  semihosting: Fix docs comment for qemu_semihosting_console_inc
  semihosting: Pass CPUState to qemu_semihosting_console_inc
  semihosting: Expand qemu_semihosting_console_inc to read
  semihosting: Cleanup chardev init
  semihosting: Create qemu_semihosting_console_write
  semihosting: Add GuestFDConsole
  semihosting: Create qemu_semihosting_guestfd_init
  semihosting: Use console_in_gf for SYS_READC
  semihosting: Use console_out_gf for SYS_WRITEC
  semihosting: Remove qemu_semihosting_console_outc
  semihosting: Use console_out_gf for SYS_WRITE0
  semihosting: Remove qemu_semihosting_console_outs
  semihosting: Create semihost_sys_poll_one
  target/m68k: Eliminate m68k_semi_is_fseek
  target/m68k: Make semihosting system only
  target/m68k: Use semihosting/syscalls.h
  target/nios2: Eliminate nios2_semi_is_lseek
  target/nios2: Move nios2-semi.c to nios2_softmmu_ss
  target/nios2: Use semihosting/syscalls.h
  target/mips: Use an exception for semihosting
  target/mips: Add UHI errno values
  target/mips: Create report_fault for semihosting
  target/mips: Drop link syscall from semihosting
  target/mips: Drop pread and pwrite syscalls from semihosting
  target/mips: Use semihosting/syscalls.h
  target/mips: Avoid qemu_semihosting_log_out for UHI_plog
  target/mips: Use error_report for UHI_assert
  semihosting: Remove qemu_semihosting_log_out
  target/mips: Simplify UHI_argnlen and UHI_argn
  target/mips: Remove GET_TARGET_STRING and FREE_TARGET_STRING
  target/xtensa: Use an exception for semihosting
  target/xtensa: Use semihosting/syscalls.h
  tests/docker: Add debian-rx-cross image
  hw/rx: Handle a kernel file that is ELF
  target/rx: Fix the base of the fixed vector table
  target/rx: Name the exceptions
  target/rx: Consolidate exception helpers
  target/rx: Cleanup rx_cpu_do_interrupt
  target/rx: Implement libgloss semihosting
  tests/tcg/rx: Enable semihosting multiarch tests

 configs/devices/rx-softmmu/default.mak        |    1 +
 configs/targets/aarch64-linux-user.mak        |    1 +
 configs/targets/aarch64_be-linux-user.mak     |    1 +
 configs/targets/arm-linux-user.mak            |    1 +
 configs/targets/armeb-linux-user.mak          |    1 +
 configs/targets/riscv32-linux-user.mak        |    1 +
 configs/targets/riscv64-linux-user.mak        |    1 +
 include/exec/gdbstub.h                        |   67 +-
 include/exec/softmmu-semi.h                   |  101 --
 .../semihosting}/common-semi.h                |    2 +-
 include/semihosting/console.h                 |   74 +-
 include/semihosting/guestfd.h                 |   52 +
 include/semihosting/semihost.h                |   14 +-
 include/semihosting/softmmu-uaccess.h         |   59 +
 include/semihosting/syscalls.h                |   75 ++
 target/arm/common-semi-target.h               |   62 +
 target/mips/cpu.h                             |    3 +-
 target/mips/tcg/tcg-internal.h                |    2 +
 target/riscv/common-semi-target.h             |   50 +
 target/rx/cpu.h                               |   26 +
 target/rx/helper.h                            |    6 +-
 target/xtensa/cpu.h                           |    3 +-
 target/xtensa/helper.h                        |    3 -
 target/mips/tcg/sysemu_helper.h.inc           |    2 -
 gdbstub.c                                     |    7 +-
 hw/rx/rx-gdbsim.c                             |   24 +-
 hw/xtensa/sim.c                               |    3 -
 linux-user/aarch64/cpu_loop.c                 |    2 +-
 linux-user/arm/cpu_loop.c                     |    2 +-
 linux-user/m68k/cpu_loop.c                    |    5 -
 linux-user/main.c                             |    9 +
 linux-user/riscv/cpu_loop.c                   |    2 +-
 linux-user/semihost.c                         |   48 +-
 semihosting/arm-compat-semi.c                 |  987 ++++------------
 semihosting/config.c                          |   17 +-
 semihosting/console.c                         |  144 +--
 semihosting/guestfd.c                         |  160 +++
 semihosting/syscalls.c                        | 1008 +++++++++++++++++
 semihosting/uaccess.c                         |   71 ++
 softmmu/vl.c                                  |    3 +-
 stubs/semihost.c                              |    6 +-
 target/arm/helper.c                           |    4 +-
 target/arm/m_helper.c                         |    2 +-
 target/m68k/m68k-semi.c                       |  368 +-----
 target/mips/tcg/exception.c                   |    1 +
 target/mips/tcg/sysemu/mips-semi.c            |  468 ++++----
 target/mips/tcg/sysemu/tlb_helper.c           |    4 +
 target/mips/tcg/translate.c                   |   12 +-
 target/nios2/nios2-semi.c                     |  354 +-----
 target/riscv/cpu_helper.c                     |    2 +-
 target/rx/helper.c                            |  116 +-
 target/rx/op_helper.c                         |   30 +-
 target/rx/rx-semi.c                           |  165 +++
 target/rx/translate.c                         |   28 +-
 target/xtensa/exc_helper.c                    |    4 +
 target/xtensa/translate.c                     |    3 +-
 target/xtensa/xtensa-semi.c                   |  306 ++---
 tests/tcg/rx/outc.c                           |   15 +
 target/mips/tcg/micromips_translate.c.inc     |    6 +-
 target/mips/tcg/mips16e_translate.c.inc       |    2 +-
 target/mips/tcg/nanomips_translate.c.inc      |    4 +-
 MAINTAINERS                                   |    1 +
 qemu-options.hx                               |   13 +-
 semihosting/meson.build                       |    6 +
 target/m68k/meson.build                       |    6 +-
 target/nios2/meson.build                      |    4 +-
 target/rx/meson.build                         |    4 +-
 tests/docker/Makefile.include                 |    6 +
 .../debian-rx-cross.d/build-toolchain.sh      |   58 +
 tests/tcg/configure.sh                        |    6 +
 tests/tcg/rx/Makefile.softmmu-target          |   24 +
 71 files changed, 2825 insertions(+), 2303 deletions(-)
 delete mode 100644 include/exec/softmmu-semi.h
 rename {semihosting => include/semihosting}/common-semi.h (96%)
 create mode 100644 include/semihosting/guestfd.h
 create mode 100644 include/semihosting/softmmu-uaccess.h
 create mode 100644 include/semihosting/syscalls.h
 create mode 100644 target/arm/common-semi-target.h
 create mode 100644 target/riscv/common-semi-target.h
 create mode 100644 semihosting/guestfd.c
 create mode 100644 semihosting/syscalls.c
 create mode 100644 semihosting/uaccess.c
 create mode 100644 target/rx/rx-semi.c
 create mode 100644 tests/tcg/rx/outc.c
 create mode 100755 tests/docker/dockerfiles/debian-rx-cross.d/build-toolchain.sh
 create mode 100644 tests/tcg/rx/Makefile.softmmu-target

-- 
2.34.1


