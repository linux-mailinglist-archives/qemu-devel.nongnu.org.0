Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9821C392362
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 01:50:44 +0200 (CEST)
Received: from localhost ([::1]:59576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lm3IR-0008WD-54
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 19:50:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lm3FG-0005ag-I6
 for qemu-devel@nongnu.org; Wed, 26 May 2021 19:47:26 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:42523)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lm3F7-0004RD-26
 for qemu-devel@nongnu.org; Wed, 26 May 2021 19:47:22 -0400
Received: by mail-pf1-x42d.google.com with SMTP id x18so2199294pfi.9
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 16:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=S636ir5m1cIj+5LH66dyHGsr5PmCk7hh7e7L5ugTs+w=;
 b=qA3v0HEejN8DQV9ZOxzcFx1rekxVtn+M7+nYY1+w7j5rsUgyB5QFsAxZ1m0DkP/Xeo
 55aN+X5vmtrVVtbhVVFEfGdtie1dxGcnfur/RPRdoOu2p4qMhvENorin7fFXdu7ZrL/x
 T4mAKndvrfpc/W1TBv/90bqv7rjpD22O7otFmelt3j3IK8m1ecjww6cuEwNUeZjVRgzg
 Zyjlqz/C/N9vhyWmizJsltA3zMmbuKuwOyNUYZuXcyDTh08uUZIiBpqylD5JomDsWVgX
 pI0SQhvnDIx+caUV5+rHh8DGFRebUFr+6BIiIcpVKHCU7BTIQLKUnqisnbBlt8PJle3f
 G5Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=S636ir5m1cIj+5LH66dyHGsr5PmCk7hh7e7L5ugTs+w=;
 b=XI2gjpdDIbnmAtta2gWsMlq13Klzapnhsk2DhMx+J8yHQjtsfA6HSU248lAMRbGebj
 Cxg55rfHg1doQ5s4zEXuTiN0BzjwU+NLqKGxzAqOkbNrySnmsbPWIOEx6Y1vPZ8FMMWv
 YSxg5AE30NEIRTwUtT4XzZbO9v+HjOmjLCuoiFg213pnOi/0Ic5QUifRPAllMUjtK4I5
 M8AQJDx1K/Ku1qzwElc/gjz0utiIMDnpvNRQxQKxd4SM9hQbPF/+ujYBREy6sF5JzCFn
 cpsqEwWEio3Zw1Vj6n9GmN6y8LkgC8oUW4eUR0J6hSM1HHNat1G8BoIuSsxXY9tiNc8R
 wc5w==
X-Gm-Message-State: AOAM533GSHfxNYABO8Rz8KivVEguqSs1W+6FGz1vGfIIQIuEnzIiZg4S
 Ktue47cOpSZmH+EKynQJnRtQpQkhPLr+mQ==
X-Google-Smtp-Source: ABdhPJzM7pToa8anQSPV57pk+0BBQ0HeBrVGD28NJ3dmZ+xQIZ2KizP4MJzyJu9jEoGWG0I1kLM1Fw==
X-Received: by 2002:a62:1614:0:b029:2d8:314b:7e7f with SMTP id
 20-20020a6216140000b02902d8314b7e7fmr959864pfw.8.1622072833429; 
 Wed, 26 May 2021 16:47:13 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id g13sm285355pfi.18.2021.05.26.16.47.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 16:47:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 00/31] tcg patch queue
Date: Wed, 26 May 2021 16:46:39 -0700
Message-Id: <20210526234710.125396-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
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

The following changes since commit 0319ad22bd5789e1eaa8a2dd5773db2d2c372f20:

  Merge remote-tracking branch 'remotes/stsquad/tags/pull-testing-and-misc-updates-250521-2' into staging (2021-05-25 17:31:04 +0100)

are available in the Git repository at:

  https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20210526

for you to fetch changes up to 119065574d02deffc28fe5b6a864db9b467c6ffd:

  hw/core: Constify TCGCPUOps (2021-05-26 15:33:59 -0700)

----------------------------------------------------------------
Adjust types for some memory access functions.
Reduce inclusion of tcg headers.
Fix watchpoints vs replay.
Fix tcg/aarch64 roli expansion.
Introduce SysemuCPUOps structure.

----------------------------------------------------------------
Pavel Dovgalyuk (1):
      replay: fix watchpoint processing for reverse debugging

Philippe Mathieu-Daudé (27):
      exec/memory_ldst_cached: Sort declarations
      exec/memory_ldst_phys: Sort declarations
      exec/memory_ldst: Use correct type sizes
      exec/memory_ldst_phys: Use correct type sizes
      exec/memory_ldst_cached: Use correct type size
      exec/memory: Use correct type size
      accel/tcg: Reduce 'exec/tb-context.h' inclusion
      accel/tcg: Keep TranslationBlock headers local to TCG
      cpu: Remove duplicated 'sysemu/hw_accel.h' header
      cpu: Split as cpu-common / cpu-sysemu
      cpu: Un-inline cpu_get_phys_page_debug and cpu_asidx_from_attrs
      cpu: Introduce cpu_virtio_is_big_endian()
      cpu: Directly use cpu_write_elf*() fallback handlers in place
      cpu: Directly use get_paging_enabled() fallback handlers in place
      cpu: Directly use get_memory_mapping() fallback handlers in place
      cpu: Assert DeviceClass::vmsd is NULL on user emulation
      cpu: Rename CPUClass vmsd -> legacy_vmsd
      cpu: Move AVR target vmsd field from CPUClass to DeviceClass
      cpu: Introduce SysemuCPUOps structure
      cpu: Move CPUClass::vmsd to SysemuCPUOps
      cpu: Move CPUClass::virtio_is_big_endian to SysemuCPUOps
      cpu: Move CPUClass::get_crash_info to SysemuCPUOps
      cpu: Move CPUClass::write_elf* to SysemuCPUOps
      cpu: Move CPUClass::asidx_from_attrs to SysemuCPUOps
      cpu: Move CPUClass::get_phys_page_debug to SysemuCPUOps
      cpu: Move CPUClass::get_memory_mapping to SysemuCPUOps
      cpu: Move CPUClass::get_paging_enabled to SysemuCPUOps

Richard Henderson (2):
      target/mips: Fold jazz behaviour into mips_cpu_do_transaction_failed
      hw/core: Constify TCGCPUOps

Yasuo Kuwahara (1):
      tcg/aarch64: Fix tcg_out_rotl

 {include/exec => accel/tcg}/tb-context.h |   0
 {include/exec => accel/tcg}/tb-hash.h    |   0
 {include/exec => accel/tcg}/tb-lookup.h  |   2 +-
 include/exec/exec-all.h                  |   1 -
 include/exec/memory.h                    |   2 +-
 include/hw/core/cpu.h                    |  94 +++++---------------
 include/hw/core/sysemu-cpu-ops.h         |  92 ++++++++++++++++++++
 include/migration/vmstate.h              |   2 -
 include/tcg/tcg.h                        |   1 -
 plugins/plugin.h                         |   1 +
 target/mips/cpu-qom.h                    |   3 +
 include/exec/memory_ldst.h.inc           |  16 ++--
 include/exec/memory_ldst_cached.h.inc    |  46 +++++-----
 include/exec/memory_ldst_phys.h.inc      |  72 +++++++--------
 accel/tcg/cpu-exec.c                     |   5 +-
 accel/tcg/cputlb.c                       |   2 +-
 accel/tcg/tcg-runtime.c                  |   2 +-
 accel/tcg/translate-all.c                |   3 +-
 cpu.c                                    |  18 ++--
 hw/core/{cpu.c => cpu-common.c}          | 116 -------------------------
 hw/core/cpu-sysemu.c                     | 145 +++++++++++++++++++++++++++++++
 hw/mips/jazz.c                           |  35 +-------
 hw/virtio/virtio.c                       |   4 +-
 softmmu/physmem.c                        |  10 +++
 stubs/vmstate.c                          |   2 -
 target/alpha/cpu.c                       |  12 ++-
 target/arm/cpu.c                         |  22 +++--
 target/arm/cpu_tcg.c                     |   2 +-
 target/avr/cpu.c                         |  12 ++-
 target/avr/machine.c                     |   4 +-
 target/cris/cpu.c                        |  14 ++-
 target/hexagon/cpu.c                     |   2 +-
 target/hppa/cpu.c                        |  12 ++-
 target/i386/cpu.c                        |  30 ++++---
 target/i386/tcg/tcg-cpu.c                |   2 +-
 target/m68k/cpu.c                        |  12 ++-
 target/microblaze/cpu.c                  |  12 ++-
 target/mips/cpu.c                        |  14 ++-
 target/mips/tcg/op_helper.c              |   3 +-
 target/nios2/cpu.c                       |  12 ++-
 target/openrisc/cpu.c                    |  12 ++-
 target/ppc/cpu_init.c                    |  24 ++---
 target/riscv/cpu.c                       |  19 ++--
 target/rx/cpu.c                          |  14 ++-
 target/s390x/cpu.c                       |  18 ++--
 target/sh4/cpu.c                         |  15 +++-
 target/sparc/cpu.c                       |  14 ++-
 target/tricore/cpu.c                     |  10 ++-
 target/xtensa/cpu.c                      |  14 ++-
 memory_ldst.c.inc                        |  20 ++---
 tcg/aarch64/tcg-target.c.inc             |   5 +-
 MAINTAINERS                              |   1 -
 hw/core/meson.build                      |   3 +-
 53 files changed, 602 insertions(+), 406 deletions(-)
 rename {include/exec => accel/tcg}/tb-context.h (100%)
 rename {include/exec => accel/tcg}/tb-hash.h (100%)
 rename {include/exec => accel/tcg}/tb-lookup.h (98%)
 create mode 100644 include/hw/core/sysemu-cpu-ops.h
 rename hw/core/{cpu.c => cpu-common.c} (73%)
 create mode 100644 hw/core/cpu-sysemu.c

