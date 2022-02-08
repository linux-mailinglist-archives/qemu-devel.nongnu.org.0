Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78F7A4ADE0C
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 17:13:25 +0100 (CET)
Received: from localhost ([::1]:48206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHT7L-0003Iq-PB
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 11:13:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nHSKU-0007YD-Lg
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 10:22:54 -0500
Received: from [2607:f8b0:4864:20::1033] (port=40469
 helo=mail-pj1-x1033.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nHSKS-0000FC-5R
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 10:22:54 -0500
Received: by mail-pj1-x1033.google.com with SMTP id
 p22-20020a17090adf9600b001b8783b2647so2304167pjv.5
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 07:22:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wjimGNya1X0Rt7zlRJBYbZm6DtFK4X3D9poDeXSYEVI=;
 b=nkvuCqPDvZrrqmvBa5iqlEsMH3VhvLju8GjHsnjdhc21NqI/vyYJ5Xak2WFnHuzWHu
 Bqy4QP60h1eXbQ4UPRRiamWSM03mV7v3y7/VlXTnsX0Z9EuPrkn22Js6Y63sIsbg/FY9
 xjzWEER3uevYvRPK4lAda411KuvBGbJSSD3SOWLLkJJEaI7agOP8g/l43ko9uT/Nm5rY
 LdEa0w8rUjkyT1yqa24GkuO4PML7B54Wg6sCgyGzLgiSKgtv07E4y0x+MBnAP9aMN3Lf
 8wtzi5aygGERgf8VeYF/ZtNrucDsl1efBzZ7LrGlnlHrJmN7RHWMECboy/HcWKieTodT
 LyAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=wjimGNya1X0Rt7zlRJBYbZm6DtFK4X3D9poDeXSYEVI=;
 b=5h/K23g0oR/B/SNd/S6n3HO11tl974XzHUQn1AInCZZqfalyXa+JQnWuu9l+0m+UeC
 jHC8QnEKgYT9CmENoiq+Ovz/+x5dd1UL3WO90eUPasqz7CTc2LVyGgi4vsEusWORzgMw
 STp9k9xtwPV39dn+jY32MvIn8j43nt3A7Pmz5Aew9a5VTsNOP2r4Pdyitfv2okem5Z5D
 zVfj5YgRltHnsSQHq/AIqC2slg+iIKouht9D5sT9NodLoEIKDyI/ruoAlGFeTz07yVm1
 qCBQ4mEEOElOOW2fWuo3r46ydgevMtj0BcDuHlZ6DrbmzzH56/fETCwsaSh1us+Pe6TC
 j11Q==
X-Gm-Message-State: AOAM5309tBPfSDUqndhVQlzioqyv8CkJAH9VbO7VRIOyCOHx1L7HhpdC
 7j47IOetGLVZasmN+mVMAfPlt+prcbM=
X-Google-Smtp-Source: ABdhPJzxcL3b9HJiTlig9kg2RURHbue+YewIxC/KsIa4XZpk7AxbP9lE/MSdGF+pLOnNv/fx9jz8Iw==
X-Received: by 2002:a17:902:ced1:: with SMTP id
 d17mr5169029plg.42.1644333770262; 
 Tue, 08 Feb 2022 07:22:50 -0800 (PST)
Received: from localhost.localdomain (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id h9sm16770950pfi.54.2022.02.08.07.22.48
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 08 Feb 2022 07:22:50 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH 00/13] exec: Move translation declarations to 'translate-all.h'
Date: Tue,  8 Feb 2022 16:22:30 +0100
Message-Id: <20220208152243.16452-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1033
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

This series move translation declarations from the generic
'cpu-all.h' to the TCG specific 'translate-all.h'. It is part
of a bigger exec/ refactor which I'm splitting in multiple
parts.

Based-on: <20220207082756.82600-1-f4bug@amsat.org>
"exec: Remove 'qemu/log.h' from 'exec-all.h'"

Philippe Mathieu-Daudé (13):
  meson: Display libfdt as disabled when system emulation is disabled
  exec/cpu_ldst: Include 'cpu.h' to get target_ulong definition
  accel: Elide kvm_update_guest_debug by checking
    kvm_supports_guest_debug
  target/i386/cpu: Ensure accelerators set CPU addressble physical bits
  target/i386/tcg/sysemu: Include missing 'exec/exec-all.h' header
  cpu: Add missing 'exec/exec-all.h' and ''exec/exec-all.h'' headers
  cpu: Move common code to cpu-common
  target: Include missing 'cpu.h'
  target: Use forward declared type instead of structure type
  target: Use CPUArchState as interface to target-specific CPU state
  exec/cpu_ldst: Restrict TCG-specific code
  exec/cpu-all: Restrict cpu_copy() to user emulation
  exec: Move translation declarations to 'translate-all.h'

 accel/stubs/kvm-stub.c                  |   5 -
 accel/stubs/tcg-stub.c                  |   1 +
 accel/tcg/cpu-exec-common.c             |   1 +
 accel/tcg/cpu-exec.c                    |   1 +
 accel/tcg/cputlb.c                      |   1 +
 accel/tcg/hmp.c                         |   2 +-
 accel/tcg/internal.h                    |   2 +-
 accel/tcg/plugin-gen.c                  |   2 +-
 accel/tcg/tb-hash.h                     |   2 +-
 accel/tcg/tcg-accel-ops-icount.c        |   2 +-
 accel/tcg/tcg-accel-ops-mttcg.c         |   2 +-
 accel/tcg/tcg-accel-ops-rr.c            |   2 +-
 accel/tcg/tcg-accel-ops.c               |   2 +-
 accel/tcg/tcg-runtime.c                 |   1 +
 accel/tcg/translate-all.c               |   1 +
 accel/tcg/translator.c                  |   2 +-
 accel/tcg/user-exec.c                   |   2 +-
 bsd-user/main.c                         |   2 +-
 bsd-user/qemu.h                         |   2 +-
 cpu.c                                   | 113 +------
 cpus-common.c                           | 112 +++++++
 gdbstub.c                               |   1 +
 hw/ppc/spapr_hcall.c                    |   1 +
 include/exec/cpu-all.h                  |   8 +-
 include/exec/cpu_ldst.h                 |  55 ++--
 include/exec/exec-all.h                 | 350 ----------------------
 include/exec/poison.h                   |   2 -
 include/exec/ram_addr.h                 |   2 -
 include/exec/translate-all.h            | 372 +++++++++++++++++++++++-
 include/hw/core/cpu.h                   |   2 +-
 include/qemu/typedefs.h                 |   1 +
 linux-user/main.c                       |   2 +-
 linux-user/user-internals.h             |   2 +-
 meson.build                             |   4 +-
 plugins/api.c                           |   2 +-
 plugins/core.c                          |   2 +-
 plugins/loader.c                        |   2 +-
 semihosting/console.c                   |   1 +
 target/alpha/cpu.c                      |   2 +-
 target/alpha/cpu.h                      |   6 +-
 target/alpha/fpu_helper.c               |   2 +-
 target/alpha/helper.c                   |   1 +
 target/alpha/int_helper.c               |   2 +-
 target/alpha/mem_helper.c               |   1 +
 target/alpha/sys_helper.c               |   1 +
 target/alpha/translate.c                |   2 +-
 target/alpha/vax_helper.c               |   2 +-
 target/arm/cpu.c                        |   2 +-
 target/arm/cpu.h                        |   2 +-
 target/arm/debug_helper.c               |   2 +-
 target/arm/helper-a64.c                 |   2 +-
 target/arm/helper.c                     |   2 +-
 target/arm/m_helper.c                   |   2 +-
 target/arm/mte_helper.c                 |   2 +-
 target/arm/mve_helper.c                 |   2 +-
 target/arm/op_helper.c                  |   1 +
 target/arm/pauth_helper.c               |   2 +-
 target/arm/sve_helper.c                 |   2 +-
 target/arm/tlb_helper.c                 |   1 +
 target/arm/translate-a64.c              |   2 +-
 target/arm/translate-mve.c              |   2 +-
 target/arm/translate-neon.c             |   2 +-
 target/arm/translate-sve.c              |   2 +-
 target/arm/translate-vfp.c              |   2 +-
 target/arm/translate.c                  |   2 +-
 target/avr/cpu.c                        |   2 +-
 target/avr/cpu.h                        |   6 +-
 target/avr/helper.c                     |   1 +
 target/avr/translate.c                  |   2 +-
 target/cris/cpu.h                       |   2 +-
 target/cris/helper.c                    |   1 +
 target/cris/mmu.c                       |   1 +
 target/cris/op_helper.c                 |   1 +
 target/cris/translate.c                 |   2 +-
 target/hexagon/cpu.c                    |   2 +-
 target/hexagon/cpu.h                    |   5 +-
 target/hexagon/op_helper.c              |   1 +
 target/hppa/cpu.c                       |   1 +
 target/hppa/cpu.h                       |   6 +-
 target/hppa/helper.c                    |   1 +
 target/hppa/mem_helper.c                |   1 +
 target/hppa/op_helper.c                 |   1 +
 target/hppa/translate.c                 |   2 +-
 target/i386/cpu.c                       |   1 +
 target/i386/cpu.h                       |   2 +-
 target/i386/helper.c                    |   1 +
 target/i386/machine.c                   |   1 +
 target/i386/tcg/excp_helper.c           |   1 +
 target/i386/tcg/fpu_helper.c            |   2 +
 target/i386/tcg/helper-tcg.h            |   2 +-
 target/i386/tcg/int_helper.c            |   2 +-
 target/i386/tcg/mem_helper.c            |   1 +
 target/i386/tcg/misc_helper.c           |   1 +
 target/i386/tcg/mpx_helper.c            |   2 +-
 target/i386/tcg/seg_helper.c            |   1 +
 target/i386/tcg/sysemu/bpt_helper.c     |   1 +
 target/i386/tcg/sysemu/excp_helper.c    |   1 +
 target/i386/tcg/sysemu/misc_helper.c    |   1 +
 target/i386/tcg/sysemu/svm_helper.c     |   1 +
 target/i386/tcg/translate.c             |   2 +-
 target/i386/tcg/user/excp_helper.c      |   1 +
 target/i386/tcg/user/seg_helper.c       |   1 +
 target/m68k/cpu.h                       |   2 +-
 target/m68k/fpu_helper.c                |   2 +-
 target/m68k/helper.c                    |   1 +
 target/m68k/op_helper.c                 |   1 +
 target/m68k/translate.c                 |   2 +-
 target/microblaze/cpu.c                 |   2 +-
 target/microblaze/cpu.h                 |   4 +-
 target/microblaze/helper.c              |   1 +
 target/microblaze/mmu.c                 |   1 +
 target/microblaze/mmu.h                 |   2 +
 target/microblaze/op_helper.c           |   1 +
 target/microblaze/translate.c           |   2 +-
 target/mips/cpu.c                       |   2 +-
 target/mips/cpu.h                       |   5 +-
 target/mips/internal.h                  |  15 +-
 target/mips/sysemu/cp0.c                |   1 +
 target/mips/sysemu/physaddr.c           |   2 +-
 target/mips/tcg/exception.c             |   1 +
 target/mips/tcg/fpu_helper.c            |   2 +-
 target/mips/tcg/ldst_helper.c           |   2 +-
 target/mips/tcg/msa_helper.c            |   2 +-
 target/mips/tcg/op_helper.c             |   2 +-
 target/mips/tcg/sysemu/cp0_helper.c     |   1 +
 target/mips/tcg/sysemu/special_helper.c |   2 +-
 target/mips/tcg/sysemu/tlb_helper.c     |   1 +
 target/nios2/cpu.h                      |   4 +-
 target/nios2/helper.c                   |   1 +
 target/nios2/mmu.c                      |   1 +
 target/nios2/mmu.h                      |   2 +
 target/nios2/op_helper.c                |   1 +
 target/nios2/translate.c                |   2 +-
 target/openrisc/cpu.h                   |   2 +-
 target/openrisc/exception.c             |   1 +
 target/openrisc/exception_helper.c      |   1 +
 target/openrisc/interrupt.c             |   2 +-
 target/openrisc/interrupt_helper.c      |   2 +-
 target/openrisc/mmu.c                   |   1 +
 target/openrisc/sys_helper.c            |   1 +
 target/openrisc/translate.c             |   2 +-
 target/ppc/cpu-qom.h                    |   2 +-
 target/ppc/cpu.h                        |   3 +-
 target/ppc/excp_helper.c                |   1 +
 target/ppc/fpu_helper.c                 |   2 +-
 target/ppc/helper_regs.c                |   1 +
 target/ppc/machine.c                    |   2 +-
 target/ppc/mem_helper.c                 |   2 +-
 target/ppc/misc_helper.c                |   1 +
 target/ppc/mmu-hash32.c                 |   2 +-
 target/ppc/mmu-hash64.c                 |   2 +-
 target/ppc/mmu-radix64.c                |   2 +-
 target/ppc/mmu_common.c                 |   2 +-
 target/ppc/mmu_helper.c                 |   1 +
 target/ppc/power8-pmu.c                 |   2 +-
 target/ppc/timebase_helper.c            |   2 +-
 target/ppc/translate.c                  |   2 +-
 target/ppc/user_only_helper.c           |   1 +
 target/riscv/bitmanip_helper.c          |   2 +-
 target/riscv/cpu.c                      |   2 +-
 target/riscv/cpu.h                      |   4 +-
 target/riscv/cpu_helper.c               |   1 +
 target/riscv/csr.c                      |   1 +
 target/riscv/fpu_helper.c               |   2 +-
 target/riscv/m128_helper.c              |   2 +-
 target/riscv/op_helper.c                |   1 +
 target/riscv/pmp.c                      |   1 +
 target/riscv/pmp.h                      |   2 +
 target/riscv/translate.c                |   2 +-
 target/riscv/vector_helper.c            |   2 +-
 target/rx/cpu-qom.h                     |   2 -
 target/rx/cpu.c                         |   1 +
 target/rx/cpu.h                         |   2 +-
 target/rx/op_helper.c                   |   1 +
 target/rx/translate.c                   |   2 +-
 target/s390x/cpu-qom.h                  |   2 +-
 target/s390x/cpu.h                      |   2 +-
 target/s390x/gdbstub.c                  |   1 +
 target/s390x/interrupt.c                |   2 +-
 target/s390x/mmu_helper.c               |   1 +
 target/s390x/sigp.c                     |   1 +
 target/s390x/tcg/cc_helper.c            |   1 +
 target/s390x/tcg/crypto_helper.c        |   2 +-
 target/s390x/tcg/excp_helper.c          |   1 +
 target/s390x/tcg/fpu_helper.c           |   2 +-
 target/s390x/tcg/int_helper.c           |   2 +-
 target/s390x/tcg/mem_helper.c           |   1 +
 target/s390x/tcg/misc_helper.c          |   1 +
 target/s390x/tcg/translate.c            |   2 +-
 target/s390x/tcg/vec_fpu_helper.c       |   2 +-
 target/s390x/tcg/vec_helper.c           |   2 +-
 target/sh4/cpu.c                        |   2 +-
 target/sh4/cpu.h                        |   2 +-
 target/sh4/helper.c                     |   1 +
 target/sh4/op_helper.c                  |   1 +
 target/sh4/translate.c                  |   2 +-
 target/sparc/cpu.c                      |   2 +-
 target/sparc/cpu.h                      |   4 +-
 target/sparc/fop_helper.c               |   1 +
 target/sparc/helper.c                   |   1 +
 target/sparc/ldst_helper.c              |   1 +
 target/sparc/machine.c                  |   2 +-
 target/sparc/mmu_helper.c               |   1 +
 target/sparc/translate.c                |   2 +-
 target/sparc/win_helper.c               |   2 +-
 target/tricore/cpu.c                    |   2 +-
 target/tricore/cpu.h                    |   5 +-
 target/tricore/helper.c                 |   1 +
 target/tricore/op_helper.c              |   1 +
 target/tricore/translate.c              |   2 +-
 target/xtensa/cpu.h                     |   8 +-
 target/xtensa/dbg_helper.c              |   2 +-
 target/xtensa/exc_helper.c              |   1 +
 target/xtensa/fpu_helper.c              |   2 +-
 target/xtensa/helper.c                  |   1 +
 target/xtensa/mmu_helper.c              |   1 +
 target/xtensa/op_helper.c               |   2 +-
 target/xtensa/translate.c               |   2 +-
 target/xtensa/win_helper.c              |   2 +-
 tcg/region.c                            |   2 +-
 tcg/tcg-op.c                            |   2 +-
 tcg/tcg.c                               |   2 +-
 222 files changed, 756 insertions(+), 658 deletions(-)

-- 
2.34.1


