Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA5B34CC794
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 22:04:42 +0100 (CET)
Received: from localhost ([::1]:36648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPscr-00050I-VO
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 16:04:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPsYA-00053j-Pu
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 15:59:50 -0500
Received: from [2607:f8b0:4864:20::636] (port=46041
 helo=mail-pl1-x636.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPsY8-00041a-UA
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 15:59:50 -0500
Received: by mail-pl1-x636.google.com with SMTP id s1so5851216plg.12
 for <qemu-devel@nongnu.org>; Thu, 03 Mar 2022 12:59:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1HGzodKNv7EF3Nh2aDIr9yPlvfXCtU8c/6DJreqL2d4=;
 b=FzdNOgA1fhqX4TanM8E8KFQ9XtCbYzyfRgmmbdKC5+B0pYpjwrMvTgSgnoboIm+11S
 9Dxr+ELrXEpNk/D2aohjuhyHVqMrn9dW8R9tIzlhjce/ITeyMnxROa5xABTJnteNIxWr
 tJJmbnepdzsv6hGtpvb9P5bay0AHfiry6rSW7YqAQLytDoZpmXnsM3w9AtBY5bFqof7v
 M/wfs9HJdUImRRuH2F0CLgkynI5ngHNQ10l7EOpeh8XrPzVV5Ia8NDrEMZk3vEjhsa9o
 bi+fIW8UMvYroM08a3S23k3qlsX65g9VIIhR8zse9Zkg9EqovyBhyD2nUuhB345lEEO1
 +PBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1HGzodKNv7EF3Nh2aDIr9yPlvfXCtU8c/6DJreqL2d4=;
 b=USbB0Durkkuf2HqBrXVyYEPEEQ8GtbEM09jYu5m6a1tc4BVkR6dHffk5Lf2PsfJk72
 +dtUTX0EOnvs8DRbru+v7mZ5ZoRgy6EIq+WOq3DgQJmEq3GCsMpbsm/ngbDKfE2ZGRL0
 9dyCp328DZEzdXeFxDFCuqkT/PAC2NsYPC6cHNCANd8xa5BK+OT/MOfBq+SqeFefddiv
 oy6SKj/v44CowKfo4Jr7MhPJLm4Qbj9XLCn6hEu5X5U8OZ82dIbAtqrwCYv8M5t6uz7J
 YUzPfAb/H/lveiuD7OwXkULEd84S2NEfNmhN7+qnZiWcQ8RePxsXBEIDOhb9j51idyjJ
 gFEg==
X-Gm-Message-State: AOAM533wpUqMzFkYZRTVFz78qLRZgBr0qrkLxZ06BXyg2CnSdqUgSRSD
 7NERgrqf368BTJZqsaXXg7VzdUuANQVSlw==
X-Google-Smtp-Source: ABdhPJxWP4Bo98KCMIYedu+yDhYWKsQ3M6LK7X7fJeoo5J4t5eM+utjMrcIim8qJGybpG2pkNtlnXQ==
X-Received: by 2002:a17:90b:17ce:b0:1bd:3384:eab7 with SMTP id
 me14-20020a17090b17ce00b001bd3384eab7mr7313161pjb.184.1646341187441; 
 Thu, 03 Mar 2022 12:59:47 -0800 (PST)
Received: from localhost.localdomain
 (2603-800c-1201-c600-119c-490c-a4ee-08e8.res6.spectrum.com.
 [2603:800c:1201:c600:119c:490c:a4ee:8e8])
 by smtp.gmail.com with ESMTPSA id
 t8-20020a6549c8000000b00372eb3a7fb3sm2729934pgs.92.2022.03.03.12.59.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 12:59:46 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 00/30] tcg patch queue
Date: Thu,  3 Mar 2022 10:59:14 -1000
Message-Id: <20220303205944.469445-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::636
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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

The following changes since commit 36eae3a732a1f2aa81391e871ac0e9bb3233e7d7:

  Merge remote-tracking branch 'remotes/dgilbert-gitlab/tags/pull-migration-20220302b' into staging (2022-03-02 20:55:48 +0000)

are available in the Git repository at:

  https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20220303

for you to fetch changes up to f23e6de25c31cadd9a3b7122f9384e6b259ce37f:

  tcg/loongarch64: Support TCG_TARGET_SIGNED_ADDR32 (2022-03-03 10:47:20 -1000)

----------------------------------------------------------------
Reorder do_constant_folding_cond test to satisfy valgrind.
Fix value of MAX_OPC_PARAM_IARGS.
Add opcodes for vector nand, nor, eqv.
Support vector nand, nor, eqv on PPC and S390X hosts.
Support AVX512VL, AVX512BW, AVX512DQ, and AVX512VBMI2.
Support 32-bit guest addresses as signed values.

----------------------------------------------------------------
Alex Bennée (1):
      tcg/optimize: only read val after const check

Richard Henderson (28):
      tcg: Add opcodes for vector nand, nor, eqv
      tcg/ppc: Implement vector NAND, NOR, EQV
      tcg/s390x: Implement vector NAND, NOR, EQV
      tcg/i386: Detect AVX512
      tcg/i386: Add tcg_out_evex_opc
      tcg/i386: Use tcg_can_emit_vec_op in expand_vec_cmp_noinv
      tcg/i386: Implement avx512 variable shifts
      tcg/i386: Implement avx512 scalar shift
      tcg/i386: Implement avx512 immediate sari shift
      tcg/i386: Implement avx512 immediate rotate
      tcg/i386: Implement avx512 variable rotate
      tcg/i386: Support avx512vbmi2 vector shift-double instructions
      tcg/i386: Expand vector word rotate as avx512vbmi2 shift-double
      tcg/i386: Remove rotls_vec from tcg_target_op_def
      tcg/i386: Expand scalar rotate with avx512 insns
      tcg/i386: Implement avx512 min/max/abs
      tcg/i386: Implement avx512 multiply
      tcg/i386: Implement more logical operations for avx512
      tcg/i386: Implement bitsel for avx512
      tcg: Add TCG_TARGET_SIGNED_ADDR32
      accel/tcg: Split out g2h_tlbe
      accel/tcg: Support TCG_TARGET_SIGNED_ADDR32 for softmmu
      accel/tcg: Add guest_base_signed_addr32 for user-only
      linux-user: Support TCG_TARGET_SIGNED_ADDR32
      tcg/aarch64: Support TCG_TARGET_SIGNED_ADDR32
      tcg/mips: Support TCG_TARGET_SIGNED_ADDR32
      tcg/riscv: Support TCG_TARGET_SIGNED_ADDR32
      tcg/loongarch64: Support TCG_TARGET_SIGNED_ADDR32

Ziqiao Kong (1):
      tcg: Set MAX_OPC_PARAM_IARGS to 7

 include/exec/cpu-all.h            |  20 +-
 include/exec/cpu_ldst.h           |   3 +-
 include/qemu/cpuid.h              |  20 +-
 include/tcg/tcg-opc.h             |   3 +
 include/tcg/tcg.h                 |   5 +-
 tcg/aarch64/tcg-target-sa32.h     |   7 +
 tcg/aarch64/tcg-target.h          |   3 +
 tcg/arm/tcg-target-sa32.h         |   1 +
 tcg/arm/tcg-target.h              |   3 +
 tcg/i386/tcg-target-con-set.h     |   1 +
 tcg/i386/tcg-target-sa32.h        |   1 +
 tcg/i386/tcg-target.h             |  17 +-
 tcg/i386/tcg-target.opc.h         |   3 +
 tcg/loongarch64/tcg-target-sa32.h |   1 +
 tcg/mips/tcg-target-sa32.h        |   9 +
 tcg/ppc/tcg-target-sa32.h         |   1 +
 tcg/ppc/tcg-target.h              |   3 +
 tcg/riscv/tcg-target-sa32.h       |   5 +
 tcg/s390x/tcg-target-sa32.h       |   1 +
 tcg/s390x/tcg-target.h            |   3 +
 tcg/sparc/tcg-target-sa32.h       |   1 +
 tcg/tci/tcg-target-sa32.h         |   1 +
 accel/tcg/cputlb.c                |  36 ++--
 bsd-user/main.c                   |   4 +
 linux-user/elfload.c              |  62 ++++--
 linux-user/main.c                 |   3 +
 tcg/optimize.c                    |  20 +-
 tcg/tcg-op-vec.c                  |  27 ++-
 tcg/tcg.c                         |  10 +
 tcg/aarch64/tcg-target.c.inc      |  81 +++++---
 tcg/i386/tcg-target.c.inc         | 387 +++++++++++++++++++++++++++++++-------
 tcg/loongarch64/tcg-target.c.inc  |  15 +-
 tcg/mips/tcg-target.c.inc         |  10 +-
 tcg/ppc/tcg-target.c.inc          |  15 ++
 tcg/riscv/tcg-target.c.inc        |   8 +-
 tcg/s390x/tcg-target.c.inc        |  17 ++
 tcg/tci/tcg-target.c.inc          |   2 +-
 37 files changed, 640 insertions(+), 169 deletions(-)
 create mode 100644 tcg/aarch64/tcg-target-sa32.h
 create mode 100644 tcg/arm/tcg-target-sa32.h
 create mode 100644 tcg/i386/tcg-target-sa32.h
 create mode 100644 tcg/loongarch64/tcg-target-sa32.h
 create mode 100644 tcg/mips/tcg-target-sa32.h
 create mode 100644 tcg/ppc/tcg-target-sa32.h
 create mode 100644 tcg/riscv/tcg-target-sa32.h
 create mode 100644 tcg/s390x/tcg-target-sa32.h
 create mode 100644 tcg/sparc/tcg-target-sa32.h
 create mode 100644 tcg/tci/tcg-target-sa32.h

