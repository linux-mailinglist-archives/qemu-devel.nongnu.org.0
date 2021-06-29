Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 159563B7894
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 21:26:04 +0200 (CEST)
Received: from localhost ([::1]:35968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyJMx-0007xG-2t
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 15:26:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyIsu-0007sk-U1
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 14:55:01 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:37787)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyIsr-0000q5-Ur
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 14:55:00 -0400
Received: by mail-pl1-x632.google.com with SMTP id o3so42785plg.4
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 11:54:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MDCyqZ7Vj5pkwWYjnYQwEUXqv5ckzw5EvMc/stSsL4Q=;
 b=WmKI6CCAyXCDlsqANhL0DxN+GMGtuaWGORHEM7UGbvQqN8d5RmuUiSYFXj+eZeA1e1
 rEV/1q2+NwGQTSMLrsA7hoQ9Jkzrxa8fY7l+XdK5xE3kRTUJHlSho03Vd+PQUjtRUl8E
 Sl661xYDxag81FMa4WVwixu6j5nyqVtyLU+EF+yfbCeSO7DhLEzuK4mknoV1hC43Kl2l
 WmKTo9BwC/sXSLTvpRpVBWA4lVk46JG5v+XjCTiYg6jobuLyMPafTNuTunG22xNbFM35
 k/Ovj7Ocho5QQJMGUjLPNZc9fHy7OkfHaaYNaT1DzwmDWGLFfcvd+X0mAweo6QQYjDD9
 Dnwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MDCyqZ7Vj5pkwWYjnYQwEUXqv5ckzw5EvMc/stSsL4Q=;
 b=GODA4/ndG98rWpgwCFG1RqjMWh8PqUzGPvapygo109JYCWenmf4i1xFcNzAxglmY78
 x+qA80U50kl/E51XG/TvqMWbv64kjwt8qFw94T3rgKWY883b+ywYMq3puiDXqf/FPuk7
 Dg3mtcd/pD8AGPgU4ezfS1yCbLcvCoaUObXttew9w1UMOrKcvy/KhHQMQqCKUU+vmLkj
 B+QQsIxr2MDaDtmPJpzH6ApX2Jxjd9GNOyRNHu1NvWMs8incIDbo7sLr1mPhAYUhU4rV
 51Ei42sL9wwt69vruRYpGQoeByjA0/ulPLtNKM9Q7eKQpWrTGAV4dHVj2DU0QgVBzfE/
 oNow==
X-Gm-Message-State: AOAM533KMPP6DdcKQMNFoRQYURzZ5eXoHwbQiG6Wk/imn/QMqCcaC26W
 RormAfpENN11mxmLjMLazs+6aHNjAjsJwg==
X-Google-Smtp-Source: ABdhPJwQSexJcHRX94oa4cl39SFmix2matON6kqsjitTE4fV5nGZ8N42PL4BUSGvmhlLI2vWCFaDDw==
X-Received: by 2002:a17:902:c245:b029:128:e566:111d with SMTP id
 5-20020a170902c245b0290128e566111dmr8948523plg.77.1624992896163; 
 Tue, 29 Jun 2021 11:54:56 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id j2sm18811253pfb.53.2021.06.29.11.54.55
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jun 2021 11:54:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 00/63] tcg patch queue
Date: Tue, 29 Jun 2021 11:53:52 -0700
Message-Id: <20210629185455.3131172-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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

The following changes since commit 13d5f87cc3b94bfccc501142df4a7b12fee3a6e7:

  Merge remote-tracking branch 'remotes/rth-gitlab/tags/pull-axp-20210628' into staging (2021-06-29 10:02:42 +0100)

are available in the Git repository at:

  https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20210629

for you to fetch changes up to c86bd2dc4c1d37653c27293b2dacee6bb46bb995:

  tcg/riscv: Remove MO_BSWAP handling (2021-06-29 10:04:57 -0700)

----------------------------------------------------------------
TranslatorOps conversion for target/avr
TranslatorOps conversion for target/cris
TranslatorOps conversion for target/nios2
Simple vector operations on TCGv_i32
Host signal fixes for *BSD
Improvements to tcg bswap operations

----------------------------------------------------------------
LIU Zhiwei (5):
      tcg: Add tcg_gen_vec_add{sub}16_i32
      tcg: Add tcg_gen_vec_add{sub}8_i32
      tcg: Add tcg_gen_vec_shl{shr}{sar}16i_i32
      tcg: Add tcg_gen_vec_shl{shr}{sar}8i_i32
      tcg: Implement tcg_gen_vec_add{sub}32_tl

Richard Henderson (57):
      target/nios2: Replace DISAS_TB_JUMP with DISAS_NORETURN
      target/nios2: Use global cpu_env
      target/nios2: Use global cpu_R
      target/nios2: Add DisasContextBase to DisasContext
      target/nios2: Convert to TranslatorOps
      target/nios2: Remove assignment to env in handle_instruction
      target/nios2: Clean up goto in handle_instruction
      target/nios2: Inline handle_instruction
      target/nios2: Use pc_next for pc + 4
      target/avr: Add DisasContextBase to DisasContext
      target/avr: Change ctx to DisasContext* in gen_intermediate_code
      target/avr: Convert to TranslatorOps
      target/cris: Add DisasContextBase to DisasContext
      target/cris: Remove DISAS_SWI
      target/cris: Replace DISAS_TB_JUMP with DISAS_NORETURN
      target/cris: Mark exceptions as DISAS_NORETURN
      target/cris: Fix use_goto_tb
      target/cris: Convert to TranslatorOps
      target/cris: Mark helper_raise_exception noreturn
      target/cris: Mark static arrays const
      target/cris: Fold unhandled X_FLAG changes into cpustate_changed
      target/cris: Set cpustate_changed for rfe/rfn
      target/cris: Add DISAS_UPDATE_NEXT
      target/cris: Add DISAS_DBRANCH
      target/cris: Use tcg_gen_lookup_and_goto_ptr
      target/cris: Improve JMP_INDIRECT
      target/cris: Remove dc->flagx_known
      target/cris: Do not exit tb for X_FLAG changes
      tcg: Add flags argument to bswap opcodes
      tcg/i386: Support bswap flags
      tcg/aarch64: Merge tcg_out_rev{16,32,64}
      tcg/aarch64: Support bswap flags
      tcg/arm: Support bswap flags
      tcg/ppc: Split out tcg_out_ext{8,16,32}s
      tcg/ppc: Split out tcg_out_sari{32,64}
      tcg/ppc: Split out tcg_out_bswap16
      tcg/ppc: Split out tcg_out_bswap32
      tcg/ppc: Split out tcg_out_bswap64
      tcg/ppc: Support bswap flags
      tcg/ppc: Use power10 byte-reverse instructions
      tcg/s390: Support bswap flags
      tcg/mips: Support bswap flags in tcg_out_bswap16
      tcg/mips: Support bswap flags in tcg_out_bswap32
      tcg/tci: Support bswap flags
      tcg: Handle new bswap flags during optimize
      tcg: Add flags argument to tcg_gen_bswap16_*, tcg_gen_bswap32_i64
      tcg: Make use of bswap flags in tcg_gen_qemu_ld_*
      tcg: Make use of bswap flags in tcg_gen_qemu_st_*
      target/arm: Improve REV32
      target/arm: Improve vector REV
      target/arm: Improve REVSH
      target/i386: Improve bswap translation
      target/sh4: Improve swap.b translation
      target/mips: Fix gen_mxu_s32ldd_s32lddr
      tcg/arm: Unset TCG_TARGET_HAS_MEMORY_BSWAP
      tcg/aarch64: Unset TCG_TARGET_HAS_MEMORY_BSWAP
      tcg/riscv: Remove MO_BSWAP handling

Warner Losh (1):
      tcg: Use correct trap number for page faults on *BSD systems

 include/tcg/tcg-op-gvec.h       |  43 ++++
 include/tcg/tcg-op.h            |   8 +-
 include/tcg/tcg-opc.h           |  10 +-
 include/tcg/tcg.h               |  12 +
 target/cris/helper.h            |   2 +-
 tcg/aarch64/tcg-target.h        |   2 +-
 tcg/arm/tcg-target.h            |   2 +-
 accel/tcg/user-exec.c           |  20 +-
 target/arm/translate-a64.c      |  21 +-
 target/arm/translate.c          |   4 +-
 target/avr/translate.c          | 284 ++++++++++++----------
 target/cris/translate.c         | 515 ++++++++++++++++++++--------------------
 target/i386/tcg/translate.c     |  14 +-
 target/mips/tcg/mxu_translate.c |   6 +-
 target/nios2/translate.c        | 318 ++++++++++++-------------
 target/s390x/translate.c        |   4 +-
 target/sh4/translate.c          |   3 +-
 tcg/optimize.c                  |  56 ++++-
 tcg/tcg-op-gvec.c               | 122 ++++++++++
 tcg/tcg-op.c                    | 143 +++++++----
 tcg/tcg.c                       |  28 +++
 tcg/tci.c                       |   3 +-
 target/cris/translate_v10.c.inc |  17 +-
 tcg/aarch64/tcg-target.c.inc    | 125 ++++------
 tcg/arm/tcg-target.c.inc        | 295 ++++++++++-------------
 tcg/i386/tcg-target.c.inc       |  20 +-
 tcg/mips/tcg-target.c.inc       | 102 ++++----
 tcg/ppc/tcg-target.c.inc        | 230 ++++++++++++------
 tcg/riscv/tcg-target.c.inc      |  64 ++---
 tcg/s390/tcg-target.c.inc       |  34 ++-
 tcg/tci/tcg-target.c.inc        |  23 +-
 tcg/README                      |  22 +-
 32 files changed, 1458 insertions(+), 1094 deletions(-)

