Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C23B60D918
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 04:15:32 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onVtB-0004B1-I4; Tue, 25 Oct 2022 22:11:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1onVt9-00046b-TC
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 22:11:27 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1onVt7-00010i-AQ
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 22:11:27 -0400
Received: by mail-pg1-x535.google.com with SMTP id f193so13494358pgc.0
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 19:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Bs7vzpnSeACkvlkZ6unDxm+y9qAAnSE+Ji02emplPFU=;
 b=gAHaY57bK+qFRQjUPsdiUABOux6ua+dOlTamNQYAwXDLVj8UoqvUQa85QpjnNjbCCY
 5Z+qjO0Bp7XCBAugTYN70m6T+lHGXjhmOMAIfTq7OucNhV/xBgLoVjLa36Hbar5tjv5p
 +aOr6iUzbecIga8VnZAOeNFGpWCQrQigdvBXz8SAP4xCeFyZzdo1226IeMCO+JL1vBnL
 7oMuUuARd45f+FXyGfKkQM5xMJMLJNa5xLUBsjtnkFJbn7cJ6BDF881Jg45OfN/gDsfF
 zfMqdoJHOyViZPShZOQRGQvt0KkFFTHVgSx3kNCP/IN2KwOr3lf8hqy8exwyupl6izk0
 1FHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Bs7vzpnSeACkvlkZ6unDxm+y9qAAnSE+Ji02emplPFU=;
 b=iVYLUx7IlMhgOTIkHD0D5ChWqMAH9vmgBuerbmIWmhVgXnTxHmYoLt+fzVVTzwwpwF
 OpblG0ntxp+1h4SIIwx0zdTMkqsmT5hMgcbkX/MTCvx7JcQaQMcPlHfEEG/bILpEmEn1
 832hNyiqMOULGaGGoZR9SBAWDCKO6S3br214m17JWyhRJVG25NAItopE23nhhlyvPmwX
 ICmqdsvzddDZ9p36LOj0fnuHOaAZSMgWuFDePIYGGZEzLmw0AkDBXg5evXVbClmd8eoB
 EZKGqrZmYA3kaMWoVjKeXPUwyQKYM9uQVrpkZXpFD7gMOsSz0gRaWQLa/LwPgvuxpo68
 g8ng==
X-Gm-Message-State: ACrzQf3dzTS2lmFQXwJckR5dIwpE9Gt12vTQZnNGjJ2nIpFkkBzWsya8
 upAd0kbFZ9aRekNLJTPwODGh7LvQ8U/tLpqU
X-Google-Smtp-Source: AMsMyM54FIJIrn08yE4SFgookB3XPMOrFFvb/kjrNO2P6ms2u2v+1hEFDZTz5XWyTBeKsl2Ik3nlnw==
X-Received: by 2002:a05:6a00:1389:b0:566:1549:c5bc with SMTP id
 t9-20020a056a00138900b005661549c5bcmr42182839pfg.8.1666750283258; 
 Tue, 25 Oct 2022 19:11:23 -0700 (PDT)
Received: from stoup.hotspotlogin.services ([103.100.225.182])
 by smtp.gmail.com with ESMTPSA id
 o29-20020a635d5d000000b0043c9da02729sm1897833pgm.6.2022.10.25.19.11.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Oct 2022 19:11:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com
Subject: [PULL 00/47] tcg patch queue
Date: Wed, 26 Oct 2022 12:10:29 +1000
Message-Id: <20221026021116.1988449-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The following changes since commit e750a7ace492f0b450653d4ad368a77d6f660fb8:

  Merge tag 'pull-9p-20221024' of https://github.com/cschoenebeck/qemu into staging (2022-10-24 14:27:12 -0400)

are available in the Git repository at:

  https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20221026

for you to fetch changes up to 04f105758b0089f73ee47260671580cde35f96cc:

  accel/tcg: Remove restore_state_to_opc function (2022-10-26 11:11:28 +1000)

----------------------------------------------------------------
Revert incorrect cflags initialization.
Add direct jumps for tcg/loongarch64.
Speed up breakpoint check.
Improve assertions for atomic.h.
Move restore_state_to_opc to TCGCPUOps.
Cleanups to TranslationBlock maintenance.

----------------------------------------------------------------
Leandro Lupori (1):
      accel/tcg: Add a quicker check for breakpoints

Peter Maydell (1):
      Revert "accel/tcg: Init TCG cflags in vCPU thread handler"

Qi Hu (2):
      tcg/loongarch64: Add direct jump support
      tcg/aarch64: Remove unused code in tcg_out_op

Richard Henderson (43):
      include/qemu/osdep: Add qemu_build_assert
      include/qemu/atomic: Use qemu_build_assert
      include/qemu/thread: Use qatomic_* functions
      accel/tcg: Make page_alloc_target_data allocation constant
      accel/tcg: Remove disabled debug in translate-all.c
      accel/tcg: Split out PageDesc to internal.h
      accel/tcg: Split out tb-maint.c
      accel/tcg: Move assert_no_pages_locked to internal.h
      accel/tcg: Drop cpu_get_tb_cpu_state from TARGET_HAS_PRECISE_SMC
      accel/tcg: Remove duplicate store to tb->page_addr[]
      accel/tcg: Introduce tb_{set_}page_addr{0,1}
      accel/tcg: Rename tb_invalidate_phys_page
      accel/tcg: Rename tb_invalidate_phys_page_range and drop end parameter
      accel/tcg: Unify declarations of tb_invalidate_phys_range
      accel/tcg: Use tb_invalidate_phys_page in page_set_flags
      accel/tcg: Call tb_invalidate_phys_page for PAGE_RESET
      accel/tcg: Use page_reset_target_data in page_set_flags
      accel/tcg: Use tb_invalidate_phys_range in page_set_flags
      accel/tcg: Move TARGET_PAGE_DATA_SIZE impl to user-exec.c
      accel/tcg: Simplify page_get/alloc_target_data
      accel/tcg: Add restore_state_to_opc to TCGCPUOps
      target/alpha: Convert to tcg_ops restore_state_to_opc
      target/arm: Convert to tcg_ops restore_state_to_opc
      target/avr: Convert to tcg_ops restore_state_to_opc
      target/cris: Convert to tcg_ops restore_state_to_opc
      target/hexagon: Convert to tcg_ops restore_state_to_opc
      target/hppa: Convert to tcg_ops restore_state_to_opc
      target/i386: Convert to tcg_ops restore_state_to_opc
      target/loongarch: Convert to tcg_ops restore_state_to_opc
      target/m68k: Convert to tcg_ops restore_state_to_opc
      target/microblaze: Convert to tcg_ops restore_state_to_opc
      target/mips: Convert to tcg_ops restore_state_to_opc
      target/nios2: Convert to tcg_ops restore_state_to_opc
      target/openrisc: Convert to tcg_ops restore_state_to_opc
      target/ppc: Convert to tcg_ops restore_state_to_opc
      target/riscv: Convert to tcg_ops restore_state_to_opc
      target/rx: Convert to tcg_ops restore_state_to_opc
      target/s390x: Convert to tcg_ops restore_state_to_opc
      target/sh4: Convert to tcg_ops restore_state_to_opc
      target/sparc: Convert to tcg_ops restore_state_to_opc
      target/tricore: Convert to tcg_ops restore_state_to_opc
      target/xtensa: Convert to tcg_ops restore_state_to_opc
      accel/tcg: Remove restore_state_to_opc function

 accel/tcg/internal.h             |   91 ++++
 include/exec/cpu-all.h           |   22 +-
 include/exec/exec-all.h          |   35 +-
 include/exec/ram_addr.h          |    2 -
 include/exec/translate-all.h     |    2 +-
 include/hw/core/tcg-cpu-ops.h    |   11 +
 include/qemu/atomic.h            |   16 +-
 include/qemu/osdep.h             |    8 +
 include/qemu/thread.h            |    8 +-
 target/arm/cpu.h                 |    8 +
 target/arm/internals.h           |    4 -
 target/mips/tcg/tcg-internal.h   |    3 +
 target/s390x/s390x-internal.h    |    4 +-
 target/sparc/cpu.h               |    3 +
 tcg/loongarch64/tcg-target.h     |    9 +-
 accel/tcg/cpu-exec.c             |   24 +-
 accel/tcg/tb-maint.c             |  704 ++++++++++++++++++++++++++
 accel/tcg/tcg-accel-ops-mttcg.c  |    5 +-
 accel/tcg/tcg-accel-ops-rr.c     |    7 +-
 accel/tcg/translate-all.c        | 1017 ++------------------------------------
 accel/tcg/translator.c           |    9 +-
 accel/tcg/user-exec.c            |   42 ++
 bsd-user/mmap.c                  |    2 -
 cpu.c                            |    4 +-
 linux-user/mmap.c                |    4 -
 target/alpha/cpu.c               |    9 +
 target/alpha/translate.c         |    6 -
 target/arm/cpu.c                 |   26 +
 target/arm/mte_helper.c          |    5 -
 target/arm/translate.c           |   22 -
 target/avr/cpu.c                 |   11 +
 target/avr/translate.c           |    6 -
 target/cris/cpu.c                |   11 +
 target/cris/translate.c          |    6 -
 target/hexagon/cpu.c             |    9 +-
 target/hppa/cpu.c                |   19 +
 target/hppa/translate.c          |   13 -
 target/i386/tcg/tcg-cpu.c        |   19 +
 target/i386/tcg/translate.c      |   15 -
 target/loongarch/cpu.c           |   11 +
 target/loongarch/translate.c     |    6 -
 target/m68k/cpu.c                |   14 +
 target/m68k/translate.c          |   10 -
 target/microblaze/cpu.c          |   11 +
 target/microblaze/translate.c    |    7 -
 target/mips/cpu.c                |    1 +
 target/mips/tcg/translate.c      |    8 +-
 target/nios2/cpu.c               |   11 +
 target/nios2/translate.c         |    6 -
 target/openrisc/cpu.c            |   13 +
 target/openrisc/translate.c      |   10 -
 target/ppc/cpu_init.c            |   10 +
 target/ppc/translate.c           |    6 -
 target/riscv/cpu.c               |    9 +-
 target/rx/cpu.c                  |   10 +
 target/rx/translate.c            |    6 -
 target/s390x/cpu.c               |    1 +
 target/s390x/tcg/translate.c     |    7 +-
 target/sh4/cpu.c                 |   16 +
 target/sh4/translate.c           |   10 -
 target/sparc/cpu.c               |    1 +
 target/sparc/translate.c         |    7 +-
 target/tricore/cpu.c             |   11 +
 target/tricore/translate.c       |    6 -
 target/xtensa/cpu.c              |   10 +
 target/xtensa/translate.c        |    6 -
 tcg/aarch64/tcg-target.c.inc     |   31 +-
 tcg/loongarch64/tcg-target.c.inc |   48 +-
 accel/tcg/meson.build            |    1 +
 69 files changed, 1304 insertions(+), 1221 deletions(-)
 create mode 100644 accel/tcg/tb-maint.c

