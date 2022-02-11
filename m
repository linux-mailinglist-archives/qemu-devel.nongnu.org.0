Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E7264B1B57
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 02:36:44 +0100 (CET)
Received: from localhost ([::1]:50122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIKrb-0006r5-LX
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 20:36:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nIKmf-0003rS-Sn
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 20:31:37 -0500
Received: from [2607:f8b0:4864:20::1035] (port=37486
 helo=mail-pj1-x1035.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nIKmc-0007EU-VF
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 20:31:37 -0500
Received: by mail-pj1-x1035.google.com with SMTP id
 v5-20020a17090a4ec500b001b8b702df57so10440033pjl.2
 for <qemu-devel@nongnu.org>; Thu, 10 Feb 2022 17:31:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eSw3VQuS4OGZ1vJO1SQbtnIIP7TGJnG1jtCx4hnzU+s=;
 b=sWTJLk/4BRKIMVce4zAYg5DJbTArsBN+dUEyaYsmd33J/fwOK3/u44twyI3t+pDVKe
 XktaUDzikZhtI4QLWIsz06GKgcQtJ8PLUdzdWZkMUfDe5CQwareTX4rFt9vxNXPDH2Y+
 t2WMHcczK6QCv/PPFTq8bQZY/snectdyKMAjAgisTSlV1UFjkjk8aKbb91OQ3AP4ZCRE
 /de8UgeQ3HTTqnzDuceKgaRGVIfX4XGbvxt+ko3QqWJ1yTxuKaifYO+QiRbLsk2Wmh00
 ILH5bl17Z5iHSAb5s8WzGIDra9MWUqIDNEDdFBZWYzwo5rFzKJSL89RDvcG+EQE+z9Bq
 44Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eSw3VQuS4OGZ1vJO1SQbtnIIP7TGJnG1jtCx4hnzU+s=;
 b=W2sVIGQbnuVVKZhiEw185IJw9aJwHjR4dRvafI+keJJNgU7jgnerFQzqtdaV2zwMzu
 1Jz9gtnKBEq3tTjl4H3+NtTWS482ohQZ2ejOGieX7r58jSUBJwIM3vXgIEFiQ16qHLWV
 Lb3UXR+jzb02+WdKMLHErRBz5MJvqoyE208Mvg18bL7P96bgWPaWIFNSY1l1L7ZPLKS0
 JpFqSwP/l9sbTnFytNTltPum0dYsKI52F57I2iyztWgkUCNTxQsuGHK44BxywTsJv7la
 hwlrsQIObZAsXk47HHEh02uyyz+kyqDaP04O3ehXka2eOSYddJ/8bgdKsIK+7Yxa5Mk6
 gW7w==
X-Gm-Message-State: AOAM5334NIvj5AO8JmOPNfr0uJkBq13p/0GFW+DC2MY+Y4L7DGEfM0x1
 MkFdtHw8MRp8Nhjk3S2tnkkSOJRdP3WdXzfy
X-Google-Smtp-Source: ABdhPJykS0WQx8vrR4uxs3a5UJcY7ab/ZRFxTayDVSzGD/BjshnmlG5ugp049XZAPyrMUTh2Ze5WnQ==
X-Received: by 2002:a17:90b:188a:: with SMTP id
 mn10mr217725pjb.186.1644543093555; 
 Thu, 10 Feb 2022 17:31:33 -0800 (PST)
Received: from localhost.localdomain ([124.189.222.164])
 by smtp.gmail.com with ESMTPSA id h5sm25738788pfi.111.2022.02.10.17.31.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Feb 2022 17:31:33 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 00/34] tcg patch queue
Date: Fri, 11 Feb 2022 12:30:25 +1100
Message-Id: <20220211013059.17994-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1035
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 0a301624c2f4ced3331ffd5bce85b4274fe132af:

  Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-20220208' into staging (2022-02-08 11:40:08 +0000)

are available in the Git repository at:

  https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20220211

for you to fetch changes up to 5c1a101ef6b85537a4ade93c39ea81cadd5c246e:

  tests/tcg/multiarch: Add sigbus.c (2022-02-09 09:00:01 +1100)

----------------------------------------------------------------
Fix safe_syscall_base for sparc64.
Fix host signal handling for sparc64-linux.
Speedups for jump cache and work list probing.
Fix for exception replays.
Raise guest SIGBUS for user-only misaligned accesses.

----------------------------------------------------------------
Idan Horowitz (2):
      accel/tcg: Optimize jump cache flush during tlb range flush
      softmmu/cpus: Check if the cpu work list is empty atomically

Pavel Dovgalyuk (1):
      replay: use CF_NOIRQ for special exception-replaying TB

Richard Henderson (29):
      common-user/host/sparc64: Fix safe_syscall_base
      linux-user: Introduce host_signal_mask
      linux-user: Introduce host_sigcontext
      linux-user: Move sparc/host-signal.h to sparc64/host-signal.h
      linux-user/include/host/sparc64: Fix host_sigcontext
      tcg/i386: Support raising sigbus for user-only
      tcg/aarch64: Support raising sigbus for user-only
      tcg/ppc: Support raising sigbus for user-only
      tcg/riscv: Support raising sigbus for user-only
      tcg/s390x: Support raising sigbus for user-only
      tcg/tci: Support raising sigbus for user-only
      tcg/arm: Drop support for armv4 and armv5 hosts
      tcg/arm: Remove use_armv5t_instructions
      tcg/arm: Remove use_armv6_instructions
      tcg/arm: Check alignment for ldrd and strd
      tcg/arm: Support unaligned access for softmmu
      tcg/arm: Reserve a register for guest_base
      tcg/arm: Support raising sigbus for user-only
      tcg/mips: Support unaligned access for user-only
      tcg/mips: Support unaligned access for softmmu
      tcg/sparc: Use tcg_out_movi_imm13 in tcg_out_addsub2_i64
      tcg/sparc: Split out tcg_out_movi_imm32
      tcg/sparc: Add scratch argument to tcg_out_movi_int
      tcg/sparc: Improve code gen for shifted 32-bit constants
      tcg/sparc: Convert patch_reloc to return bool
      tcg/sparc: Use the constant pool for 64-bit constants
      tcg/sparc: Add tcg_out_jmpl_const for better tail calls
      tcg/sparc: Support unaligned access for user-only
      tests/tcg/multiarch: Add sigbus.c

WANG Xuerui (2):
      tcg/loongarch64: Fix fallout from recent MO_Q renaming
      tcg/loongarch64: Support raising sigbus for user-only

 linux-user/include/host/aarch64/host-signal.h     |  16 +-
 linux-user/include/host/alpha/host-signal.h       |  14 +-
 linux-user/include/host/arm/host-signal.h         |  14 +-
 linux-user/include/host/i386/host-signal.h        |  14 +-
 linux-user/include/host/loongarch64/host-signal.h |  14 +-
 linux-user/include/host/mips/host-signal.h        |  14 +-
 linux-user/include/host/ppc/host-signal.h         |  14 +-
 linux-user/include/host/riscv/host-signal.h       |  14 +-
 linux-user/include/host/s390/host-signal.h        |  14 +-
 linux-user/include/host/sparc/host-signal.h       |  63 ----
 linux-user/include/host/sparc64/host-signal.h     |  65 +++-
 linux-user/include/host/x86_64/host-signal.h      |  14 +-
 tcg/aarch64/tcg-target.h                          |   2 -
 tcg/arm/tcg-target.h                              |   6 +-
 tcg/i386/tcg-target.h                             |   2 -
 tcg/loongarch64/tcg-target.h                      |   2 -
 tcg/mips/tcg-target.h                             |   2 -
 tcg/ppc/tcg-target.h                              |   2 -
 tcg/riscv/tcg-target.h                            |   2 -
 tcg/s390x/tcg-target.h                            |   2 -
 accel/tcg/cpu-exec.c                              |   3 +-
 accel/tcg/cputlb.c                                |   9 +
 linux-user/signal.c                               |  22 +-
 softmmu/cpus.c                                    |   7 +-
 tcg/tci.c                                         |  20 +-
 tests/tcg/multiarch/sigbus.c                      |  68 ++++
 tcg/aarch64/tcg-target.c.inc                      |  91 ++++-
 tcg/arm/tcg-target.c.inc                          | 410 +++++++++-------------
 tcg/i386/tcg-target.c.inc                         | 103 +++++-
 tcg/loongarch64/tcg-target.c.inc                  |  73 +++-
 tcg/mips/tcg-target.c.inc                         | 387 ++++++++++++++++++--
 tcg/ppc/tcg-target.c.inc                          |  98 +++++-
 tcg/riscv/tcg-target.c.inc                        |  63 +++-
 tcg/s390x/tcg-target.c.inc                        |  59 +++-
 tcg/sparc/tcg-target.c.inc                        | 348 +++++++++++++++---
 common-user/host/sparc64/safe-syscall.inc.S       |   5 +-
 36 files changed, 1561 insertions(+), 495 deletions(-)
 delete mode 100644 linux-user/include/host/sparc/host-signal.h
 create mode 100644 tests/tcg/multiarch/sigbus.c

