Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 508E2565101
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 11:37:09 +0200 (CEST)
Received: from localhost ([::1]:59336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8IVw-0002ZY-Dk
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 05:37:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8IT0-0008Bd-59
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 05:34:06 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:38867)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8ISy-0004vg-BK
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 05:34:05 -0400
Received: by mail-pl1-x634.google.com with SMTP id m14so8086319plg.5
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 02:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=g/C7pMCzKb1XPcQQ6AL3USzeuF7QIbSNDBe6PatQDIQ=;
 b=PlGZzCSYOWkAOcethmQDeq509aa5gyNIJRM4sGSLfq8qFCBKz05rb8MGI6X5J3xzaE
 141B/3hipaQeUbn44I8/0VaRs+YKblzcePxS6LSrD628BD3wgkVI9DqjlOAUBNbVqjOp
 GE8uPShuA8aoOZpv7RPxNoPkG048NXvHrIaW/Sx5ApgTsf6eWP3RQyTlI9DqtIoANRST
 aePSXipBfykeGWHIx0OfpPvK4+5J/Ix34KevVYpK9YSxn5JFnsTFIpd+vWMTMzqkOhhl
 7xDYwQLkqppIJq69TfAAQEd1InoPr9XPFNeuZpwCHj5ZJC8gu5pUZF03Ig1BX7czHrHv
 EnDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=g/C7pMCzKb1XPcQQ6AL3USzeuF7QIbSNDBe6PatQDIQ=;
 b=ZEMDaUXWCbScJb1JaM1ncbKT88Gq8+/7oHvqqi9h89i314A+0XH27KQwj2YdwqAwOu
 e6ffK+UiLSR3xsK3GJiTqVC/9GpRuzLaBYOe+dBXsvuSLYvyqBlKP5Ziil55mMbqSdF9
 D6efEqcPnFwsdapqxzJn5dNo5Sgl1gjnIlhJjAr8BVW0V4Um+KRnRFSfNBCzPWgvvlYp
 m0k2di7THyhAmVdL6y2S1uA1mvHRArp7jZfDi3fso8BdzbpOkzKDLxkjNiNkUQdCAdQM
 7joJAHjhKZk+hGK2e07QaVe0UlRX4m4KTmof/ACr27WdPOF4EbqcWkXM3dYcen8J8Nkp
 ZQyw==
X-Gm-Message-State: AJIora+MsQNV4CeB6zBPVq11DGAcLIUStAD5rTZGRGc+eDiQqNa/xHrK
 rhs6+l1GKk3dbTbWRwdAs4Ck1ch0AENVijag
X-Google-Smtp-Source: AGRyM1sRj20wb3BIeIIPxhc52jmrEqFAnPzyF9f1+OU6acpaqV4Lb3x8Qo5ibkY8PJFZuBDMlr21Ww==
X-Received: by 2002:a17:90b:4a0a:b0:1ec:bd8d:a128 with SMTP id
 kk10-20020a17090b4a0a00b001ecbd8da128mr35545674pjb.67.1656927242667; 
 Mon, 04 Jul 2022 02:34:02 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 z5-20020aa79e45000000b00525b7f3e906sm15353355pfq.27.2022.07.04.02.34.00
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Jul 2022 02:34:02 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 00/23] loongarch64 patch queue
Date: Mon,  4 Jul 2022 15:03:34 +0530
Message-Id: <20220704093357.983255-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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

The following changes since commit e8e86b484eac70cd86e15fa10a2f0038a536cbba:

  Merge tag 'pull-riscv-to-apply-20220703-1' of github.com:alistair23/qemu into staging (2022-07-03 06:29:02 +0530)

are available in the Git repository at:

  https://gitlab.com/rth7680/qemu.git tags/pull-la-20220704

for you to fetch changes up to eb1e9ff8bba91674b4321f2b075c55aa8d9948cc:

  target/loongarch: Add lock when writing timer clear reg (2022-07-04 11:08:58 +0530)

----------------------------------------------------------------
LoongArch patch queue:
  Support linux-user.
  Fixes for CSR BADV.
  Fix ASRT{LE,GT} exception.
  Fixes for LS7A RTC.
  Fix for interrupt vector spacing.

----------------------------------------------------------------
Mao Bibo (1):
      hw/intc/loongarch_pch_msi: Fix msi vector convertion

Song Gao (13):
      linux-user: Add LoongArch generic header files
      linux-user: Add LoongArch signal support
      linux-user: Add LoongArch elf support
      linux-user: Add LoongArch syscall support
      linux-user: Add LoongArch cpu_loop support
      scripts: add loongarch64 binfmt config
      target/loongarch: remove badaddr from CPULoongArch
      target/loongarch: Fix missing update CSR_BADV
      target/loongarch: Fix helper_asrtle_d/asrtgt_d raise wrong exception
      target/loongarch: remove unused include hw/loader.h
      target/loongarch: Adjust functions and structure to support user-mode
      default-configs: Add loongarch linux-user support
      target/loongarch: Update README

Xiaojuan Yang (9):
      hw/rtc/ls7a_rtc: Fix uninitialied bugs and toymatch writing function
      hw/rtc/ls7a_rtc: Fix timer call back function
      hw/rtc/ls7a_rtc: Remove unimplemented device in realized function
      hw/rtc/ls7a_rtc: Add reset function
      hw/rtc/ls7a_rtc: Fix rtc enable and disable function
      hw/rtc/ls7a_rtc: Use tm struct pointer as arguments in toy_time_to_val()
      hw/rtc/ls7a_rtc: Fix 'calculate' spelling errors
      target/loongarch: Fix the meaning of ECFG reg's VS field
      target/loongarch: Add lock when writing timer clear reg

 configs/targets/loongarch64-linux-user.mak         |   3 +
 include/hw/intc/loongarch_pch_msi.h                |   2 +
 linux-user/loongarch64/sockbits.h                  |  11 +
 linux-user/loongarch64/syscall_nr.h                | 312 +++++++++++++++++++
 linux-user/loongarch64/target_cpu.h                |  34 +++
 linux-user/loongarch64/target_elf.h                |  12 +
 linux-user/loongarch64/target_errno_defs.h         |  12 +
 linux-user/loongarch64/target_fcntl.h              |  11 +
 linux-user/loongarch64/target_prctl.h              |   1 +
 linux-user/loongarch64/target_resource.h           |  11 +
 linux-user/loongarch64/target_signal.h             |  13 +
 linux-user/loongarch64/target_structs.h            |  11 +
 linux-user/loongarch64/target_syscall.h            |  48 +++
 linux-user/loongarch64/termbits.h                  |  11 +
 linux-user/syscall_defs.h                          |   6 +-
 target/loongarch/cpu.h                             |   8 +-
 target/loongarch/helper.h                          |   2 +
 target/loongarch/internals.h                       |   2 +
 hw/intc/loongarch_pch_msi.c                        |  22 +-
 hw/loongarch/loongson3.c                           |   1 +
 hw/rtc/ls7a_rtc.c                                  | 131 ++++----
 linux-user/elfload.c                               |  91 ++++++
 linux-user/loongarch64/cpu_loop.c                  |  96 ++++++
 linux-user/loongarch64/signal.c                    | 335 +++++++++++++++++++++
 target/loongarch/cpu.c                             |  38 ++-
 target/loongarch/csr_helper.c                      |   2 +
 target/loongarch/gdbstub.c                         |   2 +-
 target/loongarch/op_helper.c                       |  10 +-
 target/loongarch/insn_trans/trans_privileged.c.inc |  36 +++
 scripts/gensyscalls.sh                             |   2 +
 scripts/qemu-binfmt-conf.sh                        |   6 +-
 target/loongarch/README                            |  39 ++-
 32 files changed, 1226 insertions(+), 95 deletions(-)
 create mode 100644 configs/targets/loongarch64-linux-user.mak
 create mode 100644 linux-user/loongarch64/sockbits.h
 create mode 100644 linux-user/loongarch64/syscall_nr.h
 create mode 100644 linux-user/loongarch64/target_cpu.h
 create mode 100644 linux-user/loongarch64/target_elf.h
 create mode 100644 linux-user/loongarch64/target_errno_defs.h
 create mode 100644 linux-user/loongarch64/target_fcntl.h
 create mode 100644 linux-user/loongarch64/target_prctl.h
 create mode 100644 linux-user/loongarch64/target_resource.h
 create mode 100644 linux-user/loongarch64/target_signal.h
 create mode 100644 linux-user/loongarch64/target_structs.h
 create mode 100644 linux-user/loongarch64/target_syscall.h
 create mode 100644 linux-user/loongarch64/termbits.h
 create mode 100644 linux-user/loongarch64/cpu_loop.c
 create mode 100644 linux-user/loongarch64/signal.c

