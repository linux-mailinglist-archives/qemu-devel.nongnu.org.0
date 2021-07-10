Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 443B13C3526
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Jul 2021 17:33:28 +0200 (CEST)
Received: from localhost ([::1]:40452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2Eys-0007qI-No
	for lists+qemu-devel@lfdr.de; Sat, 10 Jul 2021 11:33:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m2ExJ-0004wX-DO
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 11:31:49 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:45637)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m2ExH-0002B8-8M
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 11:31:48 -0400
Received: by mail-pg1-x529.google.com with SMTP id y17so13139939pgf.12
 for <qemu-devel@nongnu.org>; Sat, 10 Jul 2021 08:31:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Dk+zuhETsq+BLQbY3QHW1Nzi0+O3z9iny10j1AXt6ak=;
 b=LXePg6goPC97RG3lJx0SdNDAHJ+FYyyMOYpVSNubPuu23T+Xfjt0HZeCBo+4o/hQwQ
 Sr8V7gqZOiTkzcJsUWi7McYa71993AEkldm7nkVPXG1CZA4p6W1nv/pb+h8qED57uPDs
 hroQtyumi4Q6gVjGhOXPz0PcYCofpcQ77fXQatFlPxVfLIR2SC2IzCzpzlN3h9tBZLJM
 AX1wFS3zulVkWgUNMnK0y6BaAq1UErTqFruSnG8UHapOagbdEr7mgPXwlYmoJqFrOh1Z
 XL3rD8CDNlp6p3vldvZkPtn2He7Z3HDCfGm9xIDtau0E8HZeF5bqTLwA2amkY8KsVjdS
 /9CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Dk+zuhETsq+BLQbY3QHW1Nzi0+O3z9iny10j1AXt6ak=;
 b=MPdl7y3ZIapvN9DYoZDI98d4e/8ePM3dgpNwGvG22Z5lRqtVQL5J5LFHJjU6iURS4e
 wC6iXYTDkUWcOt2weEhhcHf2OsVIyiPNIcblgs2Kf4x+2u1lmMRmLUgVIMd3m5VTffqV
 s6iKxbQJb4i+N/VHU0N17xG/CHW4O6QMzWDtyYorX7U8CxSGL04w6QFl3pp3GLEGrhEQ
 g9J+BnXmIcmiCtIHoZbvwoH5UfteMMpB6HCj15fxbu8ZBDRJUt2WtDFb6O66hqUEomes
 b1V4peYAzWH3k9SSfLNSVBxu5Ll/fqvUoXlRQBbfXmcyAZ2h6orffZmFN+Oom6wziV/o
 pn7g==
X-Gm-Message-State: AOAM532W6EWGAyhIOMmtdwbUTAlUvjrLB7GGUu91gMdueESYIlR5Cwfu
 h15wwWwrgfLi+QruUC0f+CFZcIwNnPVF5A==
X-Google-Smtp-Source: ABdhPJz87usBcWyjcuMnRzUG7v88SGmdlps+FQytaBBqAzaAh9u+dvqxiUmywoNjHH//2NQJ6V0I9g==
X-Received: by 2002:aa7:81c5:0:b029:2f7:d4e3:78e9 with SMTP id
 c5-20020aa781c50000b02902f7d4e378e9mr44196917pfn.31.1625931104931; 
 Sat, 10 Jul 2021 08:31:44 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id u23sm11975374pgk.38.2021.07.10.08.31.44
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Jul 2021 08:31:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 00/41] tcg patch queue
Date: Sat, 10 Jul 2021 08:31:02 -0700
Message-Id: <20210710153143.1320521-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 05de778b5b8ab0b402996769117b88c7ea5c7c61:

  Merge remote-tracking branch 'remotes/mst/tags/for_upstream' into staging (2021-07-09 14:30:01 +0100)

are available in the Git repository at:

  https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20210710

for you to fetch changes up to ad1a706f386c2281adb0b09257d892735e405834:

  cpu: Add breakpoint tracepoints (2021-07-09 21:31:11 -0700)

----------------------------------------------------------------
Add translator_use_goto_tb.
Cleanups in prep of breakpoint fixes.
Misc fixes.

----------------------------------------------------------------
Liren Wei (2):
      accel/tcg: Hoist tcg_tb_insert() up above tb_link_page()
      tcg: Bake tb_destroy() into tcg_region_tree

Philippe Mathieu-Daudé (1):
      tcg: Avoid including 'trace-tcg.h' in target translate.c

Richard Henderson (38):
      tcg: Add separator in INDEX_op_call dump
      tcg: Move tb_phys_invalidate_count to tb_ctx
      accel/tcg: Introduce translator_use_goto_tb
      target/alpha: Remove use_exit_tb
      target/alpha: Remove in_superpage
      target/alpha: Use translator_use_goto_tb
      target/arm: Use DISAS_TOO_MANY for ISB and SB
      target/arm: Use translator_use_goto_tb for aarch64
      target/arm: Use translator_use_goto_tb for aarch32
      target/avr: Use translator_use_goto_tb
      target/avr: Mark some helpers noreturn
      target/cris: Use translator_use_goto_tb
      target/hppa: Use translator_use_goto_tb
      target/i386: Use translator_use_goto_tb
      target/m68k: Use translator_use_goto_tb
      target/microblaze: Use translator_use_goto_tb
      target/mips: Use translator_use_goto_tb
      target/mips: Fix missing else in gen_goto_tb
      target/nios2: Use translator_use_goto_tb
      target/openrisc: Use translator_use_goto_tb
      target/ppc: Use translator_use_goto_tb
      target/riscv: Use translator_use_goto_tb
      target/rx: Use translator_use_goto_tb
      target/s390x: Use translator_use_goto_tb
      target/s390x: Remove use_exit_tb
      target/sh4: Use translator_use_goto_tb
      target/sparc: Use translator_use_goto_tb
      target/tricore: Use translator_use_goto_tb
      target/tricore: Use tcg_gen_lookup_and_goto_ptr
      target/xtensa: Use translator_use_goto_tb
      tcg: Fix prologue disassembly
      target/i386: Use cpu_breakpoint_test in breakpoint_handler
      accel/tcg: Move helper_lookup_tb_ptr to cpu-exec.c
      accel/tcg: Move tb_lookup to cpu-exec.c
      accel/tcg: Split out log_cpu_exec
      accel/tcg: Log tb->cflags with -d exec
      tcg: Remove TCG_TARGET_HAS_goto_ptr
      cpu: Add breakpoint tracepoints

 accel/tcg/tb-context.h              |   1 +
 accel/tcg/tb-lookup.h               |  49 ----------------
 include/exec/translator.h           |  10 ++++
 include/tcg/tcg-opc.h               |   3 +-
 include/tcg/tcg.h                   |   4 --
 target/avr/helper.h                 |   8 +--
 tcg/aarch64/tcg-target.h            |   1 -
 tcg/arm/tcg-target.h                |   1 -
 tcg/i386/tcg-target.h               |   1 -
 tcg/mips/tcg-target.h               |   1 -
 tcg/ppc/tcg-target.h                |   1 -
 tcg/riscv/tcg-target.h              |   1 -
 tcg/s390/tcg-target.h               |   1 -
 tcg/sparc/tcg-target.h              |   1 -
 tcg/tci/tcg-target.h                |   1 -
 accel/tcg/cpu-exec.c                | 112 ++++++++++++++++++++++++++++--------
 accel/tcg/tcg-runtime.c             |  22 -------
 accel/tcg/translate-all.c           |  23 ++++----
 accel/tcg/translator.c              |  11 ++++
 cpu.c                               |  13 +++--
 target/alpha/translate.c            |  47 ++-------------
 target/arm/translate-a64.c          |  26 ++-------
 target/arm/translate-sve.c          |   1 -
 target/arm/translate.c              |  17 +-----
 target/avr/translate.c              |   9 ++-
 target/cris/translate.c             |   6 +-
 target/hppa/translate.c             |   6 +-
 target/i386/tcg/sysemu/bpt_helper.c |  12 +---
 target/i386/tcg/translate.c         |  15 +----
 target/m68k/translate.c             |  13 +----
 target/microblaze/translate.c       |  12 +---
 target/mips/tcg/translate.c         |  21 ++-----
 target/nios2/translate.c            |  15 +----
 target/openrisc/translate.c         |  16 +++---
 target/ppc/translate.c              |  11 +---
 target/riscv/translate.c            |  20 +------
 target/rx/translate.c               |  12 +---
 target/s390x/translate.c            |  19 +-----
 target/sh4/translate.c              |  12 +---
 target/sparc/translate.c            |  20 ++-----
 target/tricore/translate.c          |  20 ++-----
 target/xtensa/translate.c           |   7 +--
 tcg/region.c                        |  33 +++--------
 tcg/tcg-op.c                        |   2 +-
 tcg/tcg.c                           |  14 ++---
 trace-events                        |   5 ++
 46 files changed, 217 insertions(+), 439 deletions(-)
 delete mode 100644 accel/tcg/tb-lookup.h

