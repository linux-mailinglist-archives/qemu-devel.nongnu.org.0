Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 427D53D1773
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 22:02:25 +0200 (CEST)
Received: from localhost ([::1]:53174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6IQC-00059g-Ud
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 16:02:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m6INs-0002JI-So
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 16:00:00 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:56302)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m6INr-0005ZW-2C
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 16:00:00 -0400
Received: by mail-pj1-x102e.google.com with SMTP id gx2so2539315pjb.5
 for <qemu-devel@nongnu.org>; Wed, 21 Jul 2021 12:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=e7Le8qRgJ4TXiH9rM1qiiHtdQwgVABSJT2i6NWZMk4A=;
 b=aD6hl/p3TT4A48eCuhPah6Y5bO+35EF8SNLS27P2RFKSPsHLLNJtWO+O+MtwWCp2Na
 7MR2E1DIenXWOBGigpm++2IYJSdjgZhtW1OoTV4x50/0iRMNUWLrS2BWZ+xlRradQUNF
 uyMi+KA0Fffos5yUoPkFNQax2m6xJiXv9zQcYF8l5dQlWa7baXtuhlC2zIP6XPVNNnK/
 R9XI3sG2oweoeRu8f6veQC+KA3qkJ0R0lgv+Vv6lOAm6BnsXfjwP1qia91nAyfq60Ra8
 MBm8nar4kx+QtrHbCAaFK1xRI2GuCR+Wa7BljmpSmSob7t1SauXCdW77U/r9yMQLp61y
 1SDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=e7Le8qRgJ4TXiH9rM1qiiHtdQwgVABSJT2i6NWZMk4A=;
 b=uGkg0/qYeIqliVvrIs+Jz6wSHPL2KPfr6NmD4+0MFMhCCis6OLe/PfS1OKXPr9ZcGp
 jftrWXEcSrsQC8pVdMBCUDinmTjpdjN9UJYprVfqhAJV+SoejDDV6x6BeS7Lr4h5mkCC
 ASassIxzaDjavloIUm2Xt6p41LpKPIW/qe8Y8KCYTXeuzxsqlFSHZK1q6KrfCIVQHz0L
 iP37wauEh7C/ilyJUUactkgr2Q2/iNGY89D885kwd4YlkaWLhc7kdde2UuuDmEGUSF98
 k6wCeH4cRGi3XN3PRv65jqQVtmx2/JSi9xX5P5849tEq9mcnjBsG9jutXrI3B/R0pHrr
 eL0Q==
X-Gm-Message-State: AOAM5337t29L602HFUU5TKTsWTTrMj6h8yT1rw9ICOpIAuPSrRojgjyS
 B3Cn13sVHHv7kTftNIHdVlANWoVvAAytfA==
X-Google-Smtp-Source: ABdhPJybgMc1BWNDe15gTWKZwDDmy/SuEYclpBQ4n47cmN70tknRMsItaBNyjSU04YjJykiRdMCgXw==
X-Received: by 2002:a17:90a:c095:: with SMTP id
 o21mr37031187pjs.53.1626897597342; 
 Wed, 21 Jul 2021 12:59:57 -0700 (PDT)
Received: from localhost.localdomain (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id w3sm706028pjq.12.2021.07.21.12.59.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jul 2021 12:59:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 00/27] tcg patch queue for rc0
Date: Wed, 21 Jul 2021 09:59:27 -1000
Message-Id: <20210721195954.879535-1-richard.henderson@linaro.org>
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

The following changes since commit e77c8b8b8e933414ef07dbed04e02973fccffeb0:

  Update version for v6.1.0-rc0 release (2021-07-21 17:10:15 +0100)

are available in the Git repository at:

  https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20210721

for you to fetch changes up to c2ffd7549b14373e9ca68eccd84fab141ffde646:

  accel/tcg: Record singlestep_enabled in tb->cflags (2021-07-21 07:47:05 -1000)

----------------------------------------------------------------
Atomic build fixes for clang-12
Breakpoint reorg

----------------------------------------------------------------
Richard Henderson (27):
      qemu/atomic: Use macros for CONFIG_ATOMIC64
      qemu/atomic: Remove pre-C11 atomic fallbacks
      qemu/atomic: Add aligned_{int64,uint64}_t types
      tcg: Rename helper_atomic_*_mmu and provide for user-only
      accel/tcg: Standardize atomic helpers on softmmu api
      accel/tcg: Fold EXTRA_ARGS into atomic_template.h
      accel/tcg: Remove ATOMIC_MMU_DECLS
      accel/tcg: Expand ATOMIC_MMU_LOOKUP_*
      trace: Fold mem-internal.h into mem.h
      accel/tcg: Push trace info building into atomic_common.c.inc
      accel/tcg: Reduce CF_COUNT_MASK to match TCG_MAX_INSNS
      accel/tcg: Move curr_cflags into cpu-exec.c
      target/alpha: Drop goto_tb path in gen_call_pal
      accel/tcg: Add CF_NO_GOTO_TB and CF_NO_GOTO_PTR
      accel/tcg: Drop CF_NO_GOTO_PTR from -d nochain
      accel/tcg: Handle -singlestep in curr_cflags
      accel/tcg: Use CF_NO_GOTO_{TB, PTR} in cpu_exec_step_atomic
      hw/core: Introduce TCGCPUOps.debug_check_breakpoint
      target/arm: Implement debug_check_breakpoint
      target/i386: Implement debug_check_breakpoint
      hw/core: Introduce CPUClass.gdb_adjust_breakpoint
      target/avr: Implement gdb_adjust_breakpoint
      accel/tcg: Merge tb_find into its only caller
      accel/tcg: Move breakpoint recognition outside translation
      accel/tcg: Remove TranslatorOps.breakpoint_check
      accel/tcg: Hoist tb_cflags to a local in translator_loop
      accel/tcg: Record singlestep_enabled in tb->cflags

 configure                     |   7 --
 accel/tcg/atomic_template.h   | 141 +++++++++++-------------
 accel/tcg/tcg-runtime.h       |  46 --------
 include/exec/exec-all.h       |  24 ++--
 include/exec/translator.h     |  11 --
 include/hw/core/cpu.h         |   4 +
 include/hw/core/tcg-cpu-ops.h |   6 +
 include/qemu/atomic.h         | 247 ++++++------------------------------------
 include/qemu/stats64.h        |   2 +-
 include/tcg/tcg.h             |  78 ++++++-------
 softmmu/timers-state.h        |   2 +-
 target/arm/helper.h           |   2 -
 target/arm/internals.h        |   3 +
 target/avr/cpu.h              |   1 +
 trace/mem-internal.h          |  50 ---------
 trace/mem.h                   |  50 +++++++--
 accel/tcg/cpu-exec.c          | 205 +++++++++++++++++++++++++++--------
 accel/tcg/cputlb.c            |  49 +--------
 accel/tcg/translate-all.c     |   7 +-
 accel/tcg/translator.c        |  39 ++-----
 accel/tcg/user-exec.c         |  41 +++----
 cpu.c                         |  34 ++----
 linux-user/hppa/cpu_loop.c    |   2 +-
 plugins/core.c                |   2 +-
 target/alpha/translate.c      |  31 +-----
 target/arm/cpu.c              |   1 +
 target/arm/cpu_tcg.c          |   1 +
 target/arm/debug_helper.c     |  12 +-
 target/arm/helper-a64.c       |   8 +-
 target/arm/translate-a64.c    |  25 -----
 target/arm/translate.c        |  29 -----
 target/avr/cpu.c              |   1 +
 target/avr/gdbstub.c          |  13 +++
 target/avr/translate.c        |  32 ------
 target/cris/translate.c       |  20 ----
 target/hexagon/translate.c    |  17 ---
 target/hppa/translate.c       |  11 --
 target/i386/tcg/mem_helper.c  |  15 +--
 target/i386/tcg/tcg-cpu.c     |  12 ++
 target/i386/tcg/translate.c   |  28 -----
 target/m68k/op_helper.c       |  19 +---
 target/m68k/translate.c       |  18 ---
 target/microblaze/translate.c |  18 ---
 target/mips/tcg/translate.c   |  19 ----
 target/nios2/translate.c      |  27 -----
 target/openrisc/translate.c   |  17 ---
 target/ppc/mem_helper.c       |  16 +--
 target/ppc/translate.c        |  18 ---
 target/riscv/translate.c      |  17 ---
 target/rx/translate.c         |  14 ---
 target/s390x/tcg/mem_helper.c |  19 ++--
 target/s390x/tcg/translate.c  |  24 ----
 target/sh4/translate.c        |  18 ---
 target/sparc/translate.c      |  17 ---
 target/tricore/translate.c    |  16 ---
 target/xtensa/translate.c     |  17 ---
 tcg/tcg-op.c                  |  79 ++++----------
 util/qsp.c                    |   4 +-
 accel/tcg/atomic_common.c.inc | 107 ++++++++++++++++--
 59 files changed, 577 insertions(+), 1216 deletions(-)
 delete mode 100644 trace/mem-internal.h

