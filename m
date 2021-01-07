Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C827A2EE69C
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 21:18:09 +0100 (CET)
Received: from localhost ([::1]:49874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxbjU-0002LZ-Bz
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 15:18:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kxbgO-0000YV-HK
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 15:14:56 -0500
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:40206)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kxbgM-0001MJ-Bp
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 15:14:56 -0500
Received: by mail-pg1-x52b.google.com with SMTP id 15so5733280pgx.7
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 12:14:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bF1kYaeh36V3ea/RauljVV1QUz3fDJPlcq7uVhPig/I=;
 b=MCrM77JHmDl2qldn1T/qBIeRyfrC+GmMeCt0TVsQhplx/jImO/LDoBmEhwWrxcnXTi
 X9Lz45bm413Fur6eQpDeIYAOzIjouBVpU8MJutCniWdceYRvpPWYZnCfC0ZWfYf9Ri4x
 zCkSrCp7U4xai7h46QbFIJuZY57MbScoCrwhsdU+JSVZ8fgerzEhwu0pJm1YitbaP8gD
 BjP9T4YNZZ2TTHJhYOI57Y1spuh959RyV8C/esRnEIEZbu5JMa/4nOHQ6FhjEc7hres7
 IA9HwmxA2ovo8uOnoFEiBOOqvjR3NxatZrsVQEdNY1pt2ZDMFdAGUCOTHyDM7+mof892
 19JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bF1kYaeh36V3ea/RauljVV1QUz3fDJPlcq7uVhPig/I=;
 b=lUrATyIwX7bc4ZJ9coTn5s4EZq4lQHUFkteC46tNqJtI+ViUx8Avr/KVPTVuR8Kym9
 9Gvd5GNxfKU4LFg+eCkyFInRkTH9xcnMfiY5FiMdVIBsI6RDCeKKHYwACpOsyHT11ihJ
 OuQoWUXQZjzHMeA0F77Wl3n3al2UrWkhibZfNLwZtjlFV8kv8hRU+GEGI+zmOB2jDRg0
 X1HvWG9+gTCUiBdh0Aaq5VQXyXZ/uKkVeWsXxAdgIsHvhtHNN2ySewThLLvPCwTCMRMW
 FyWcVYy9hqzU0BMiNHKhjZw/odWQZ5MRICRjgLRcBdATASOVBdpOf+geVdNmsIhgCIay
 8lDw==
X-Gm-Message-State: AOAM532/Q7a9CS3fO6Br/f5VpZ3m36zlJ+z72m25Txzfvc7DG6SVJV+f
 D91sPmd4Z3oYrh1i9cnUtCk23Qp3f+H5Dg==
X-Google-Smtp-Source: ABdhPJwHYpmq5mOIG6uoeXg3NuQBX6KEHZV/tWtaQspCCyu2Q/uUbXL2t8TfzjOekSF1NVtoUZ5I8Q==
X-Received: by 2002:a62:65c1:0:b029:1aa:ba52:fdfd with SMTP id
 z184-20020a6265c10000b02901aaba52fdfdmr250714pfb.7.1610050492428; 
 Thu, 07 Jan 2021 12:14:52 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id v6sm6516265pfi.31.2021.01.07.12.14.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 12:14:51 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 00/47] tcg patch queue
Date: Thu,  7 Jan 2021 10:14:01 -1000
Message-Id: <20210107201448.1152301-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
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

The following changes since commit 470dd6bd360782f5137f7e3376af6a44658eb1d3:

  Merge remote-tracking branch 'remotes/stsquad/tags/pull-testing-060121-4' into staging (2021-01-06 22:18:36 +0000)

are available in the Git repository at:

  https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20210107

for you to fetch changes up to e5e2e4c73926f6f3c1f5da24a350e4345d5ad232:

  tcg: Constify TCGLabelQemuLdst.raddr (2021-01-07 05:09:42 -1000)

----------------------------------------------------------------
Build fix for ppc64 centos7.
Reduce the use of scratch registers for tcg/i386.
Use _aligned_malloc for Win32.
Enable split w^x code gen buffers.

----------------------------------------------------------------
Philippe Mathieu-Daudé (1):
      util/oslib: Assert qemu_try_memalign() alignment is a power of 2

Richard Henderson (46):
      linux-user: Conditionalize TUNSETVNETLE
      tcg/i386: Adjust TCG_TARGET_HAS_MEMORY_BSWAP
      tcg: Introduce INDEX_op_qemu_st8_i32
      util/oslib-win32: Use _aligned_malloc for qemu_try_memalign
      tcg: Do not flush icache for interpreter
      util: Enhance flush_icache_range with separate data pointer
      util: Specialize flush_idcache_range for aarch64
      tcg: Move tcg prologue pointer out of TCGContext
      tcg: Move tcg epilogue pointer out of TCGContext
      tcg: Add in_code_gen_buffer
      tcg: Introduce tcg_splitwx_to_{rx,rw}
      tcg: Adjust TCGLabel for const
      tcg: Adjust tcg_out_call for const
      tcg: Adjust tcg_out_label for const
      tcg: Adjust tcg_register_jit for const
      tcg: Adjust tb_target_set_jmp_target for split-wx
      tcg: Make DisasContextBase.tb const
      tcg: Make tb arg to synchronize_from_tb const
      tcg: Use Error with alloc_code_gen_buffer
      tcg: Add --accel tcg,split-wx property
      accel/tcg: Support split-wx for linux with memfd
      accel/tcg: Support split-wx for darwin/iOS with vm_remap
      tcg: Return the TB pointer from the rx region from exit_tb
      tcg/i386: Support split-wx code generation
      tcg/aarch64: Use B not BL for tcg_out_goto_long
      tcg/aarch64: Support split-wx code generation
      disas: Push const down through host disassembly
      tcg/tci: Push const down through bytecode reading
      tcg: Introduce tcg_tbrel_diff
      tcg/ppc: Use tcg_tbrel_diff
      tcg/ppc: Use tcg_out_mem_long to reset TCG_REG_TB
      tcg/ppc: Support split-wx code generation
      tcg/sparc: Use tcg_tbrel_diff
      tcg/sparc: Support split-wx code generation
      tcg/s390: Use tcg_tbrel_diff
      tcg/s390: Support split-wx code generation
      tcg/riscv: Fix branch range checks
      tcg/riscv: Remove branch-over-branch fallback
      tcg/riscv: Support split-wx code generation
      accel/tcg: Add mips support to alloc_code_gen_buffer_splitwx_memfd
      tcg/mips: Do not assert on relocation overflow
      tcg/mips: Support split-wx code generation
      tcg/arm: Support split-wx code generation
      tcg: Remove TCG_TARGET_SUPPORT_MIRROR
      tcg: Constify tcg_code_gen_epilogue
      tcg: Constify TCGLabelQemuLdst.raddr

 accel/tcg/tcg-runtime.h      |   2 +-
 include/disas/dis-asm.h      |   4 +-
 include/disas/disas.h        |   2 +-
 include/exec/exec-all.h      |   2 +-
 include/exec/gen-icount.h    |   4 +-
 include/exec/log.h           |   2 +-
 include/exec/translator.h    |   2 +-
 include/hw/core/cpu.h        |   3 +-
 include/qemu/cacheflush.h    |  15 ++-
 include/sysemu/tcg.h         |   3 +-
 include/tcg/tcg-op.h         |   2 +-
 include/tcg/tcg-opc.h        |   5 +
 include/tcg/tcg.h            |  61 +++++++--
 linux-user/ioctls.h          |   2 +
 tcg/aarch64/tcg-target.h     |   3 +-
 tcg/arm/tcg-target.h         |   3 +-
 tcg/i386/tcg-target.h        |  12 +-
 tcg/mips/tcg-target.h        |   3 +-
 tcg/ppc/tcg-target.h         |   3 +-
 tcg/riscv/tcg-target.h       |   3 +-
 tcg/s390/tcg-target.h        |   9 +-
 tcg/sparc/tcg-target.h       |   3 +-
 tcg/tci/tcg-target.h         |   7 +-
 accel/tcg/cpu-exec.c         |  41 +++---
 accel/tcg/tcg-all.c          |  26 +++-
 accel/tcg/tcg-runtime.c      |   4 +-
 accel/tcg/translate-all.c    | 311 ++++++++++++++++++++++++++++++++++---------
 accel/tcg/translator.c       |   4 +-
 bsd-user/main.c              |   2 +-
 disas.c                      |   2 +-
 disas/capstone.c             |   2 +-
 linux-user/main.c            |   2 +-
 softmmu/physmem.c            |   2 +-
 target/arm/cpu.c             |   3 +-
 target/arm/translate-a64.c   |   2 +-
 target/avr/cpu.c             |   3 +-
 target/hppa/cpu.c            |   3 +-
 target/i386/tcg/tcg-cpu.c    |   3 +-
 target/microblaze/cpu.c      |   3 +-
 target/mips/cpu.c            |   3 +-
 target/riscv/cpu.c           |   3 +-
 target/rx/cpu.c              |   3 +-
 target/sh4/cpu.c             |   3 +-
 target/sparc/cpu.c           |   3 +-
 target/tricore/cpu.c         |   2 +-
 tcg/optimize.c               |   1 +
 tcg/tcg-op.c                 |  21 ++-
 tcg/tcg.c                    |  94 ++++++++++---
 tcg/tci.c                    |  62 +++++----
 util/cacheflush.c            | 107 ++++++++++++---
 util/cacheinfo.c             |   8 +-
 util/oslib-posix.c           |   2 +
 util/oslib-win32.c           |  12 +-
 tcg/aarch64/tcg-target.c.inc |  75 ++++++-----
 tcg/arm/tcg-target.c.inc     |  41 +++---
 tcg/i386/tcg-target.c.inc    | 174 +++++++++++-------------
 tcg/mips/tcg-target.c.inc    |  97 ++++++--------
 tcg/ppc/tcg-target.c.inc     |  88 ++++++------
 tcg/riscv/tcg-target.c.inc   | 125 ++++++-----------
 tcg/s390/tcg-target.c.inc    |  91 ++++++-------
 tcg/sparc/tcg-target.c.inc   |  58 ++++----
 tcg/tcg-ldst.c.inc           |   2 +-
 tcg/tcg-pool.c.inc           |   6 +-
 tcg/tci/tcg-target.c.inc     |   2 +-
 accel/tcg/trace-events       |   2 +-
 qemu-options.hx              |   7 +
 tcg/README                   |   5 +
 67 files changed, 1035 insertions(+), 630 deletions(-)

