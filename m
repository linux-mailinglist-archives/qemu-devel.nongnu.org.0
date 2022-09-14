Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CAF25B8A2C
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Sep 2022 16:17:03 +0200 (CEST)
Received: from localhost ([::1]:53096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYTCI-0002HE-EU
	for lists+qemu-devel@lfdr.de; Wed, 14 Sep 2022 10:17:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oYSME-0007oC-Jp
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 09:23:14 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:34395)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oYSMC-0000aP-R1
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 09:23:14 -0400
Received: by mail-wr1-x42f.google.com with SMTP id bo13so9176037wrb.1
 for <qemu-devel@nongnu.org>; Wed, 14 Sep 2022 06:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date;
 bh=CYTdOUndJ0NNVP/wi0jzotzgGZG1nxD3CGhmvMhgchA=;
 b=iZ8VfF1w+Vcyf+/MZbe4KYv2p0K9rKvBZOl1TdY0NfiSMAJG0Ox5yuYSkUAoM2j0cC
 F/mxP6YzV9ex108plBAx1zfwuFTeAIYRwyCPuNZxnhhjHP/AIZgSEBHXV2ZMpfATd1bS
 WDY28EwIAJGCr20eldE4KX9dgxQKmiRBW92qVgFbmufALpJlsyUeBWLVfnvZ01uIPC5v
 DE13I0miZ02PiRXv1+d/9G9wi/gDz4y2SNXjdsWO114AH3r/tdFK/q4fbMyi8sSM7GQT
 JE7bock5lNxYSphGP8ifDUXPU+xziVQvUcuC47efoJxZKKJNZPqGbXCg0ItIO9QIFwt3
 chXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date;
 bh=CYTdOUndJ0NNVP/wi0jzotzgGZG1nxD3CGhmvMhgchA=;
 b=HXMPsYcd76NU9/E1xVM7yzyKurwTwQtsHp4DlbcsBSSywA+V79KkwgVLvtRPwi3nFj
 vC6UXPyX5Egik8eUXR6AWyqHg6wTxEojmv70oFGQv9u6pynECF8Buqk5Hnm7jxJurRby
 HivKSGvdWZm9Zyly1GkLA4ZBYF+TSiRK21FMeXn4+fTbxgLqPiSiewyZcx0V58gGte0s
 ZJFiN1GrxJPBcSPqvYXIpXMzgPoaRti22h2reyhNxoX3/YJlUgNz47Ym4Hzme8KExuDi
 +Re72g+2/rHmedFE8unJptWxOzuIad4scM5F9oLQh0Vp3uKgmbWbnv6+ijJ/q6Xh27Xg
 6w1Q==
X-Gm-Message-State: ACgBeo1u2hMRXdqg2ftAu1Pph551SdJi8oAj572w6JdHX1PiJlw8tCd3
 BgioP6O137z9mWMN82so+ctxON7jUqjqcR13
X-Google-Smtp-Source: AA6agR63MHzRWUgUUGOA9zI8gTbfHJFqtSYhrqlQNClpMk3UQ/uqfJkLL9i1GicdVatZbcKd/AdTHA==
X-Received: by 2002:adf:e19a:0:b0:22a:bc4f:6d6e with SMTP id
 az26-20020adfe19a000000b0022abc4f6d6emr6042860wrb.436.1663161790928; 
 Wed, 14 Sep 2022 06:23:10 -0700 (PDT)
Received: from stoup.. ([89.101.193.70]) by smtp.gmail.com with ESMTPSA id
 p15-20020a5d48cf000000b00226dedf1ab7sm13768244wrs.76.2022.09.14.06.23.09
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Sep 2022 06:23:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 00/11] semihosting patch queue
Date: Wed, 14 Sep 2022 14:22:57 +0100
Message-Id: <20220914132308.118495-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42f.google.com
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

The following changes since commit 79dfa177ae348bb5ab5f97c0915359b13d6186e2:

  Merge tag 'pull-qapi-2022-09-07' of git://repo.or.cz/qemu/armbru into staging (2022-09-07 13:13:30 -0400)

are available in the Git repository at:

  https://gitlab.com/rth7680/qemu.git tags/pull-semi-20220914

for you to fetch changes up to 7d7fb11615809839ff858328134c6a0abad27ea4:

  target/riscv: Honour -semihosting-config userspace=on and enable=on (2022-09-13 17:18:21 +0100)

----------------------------------------------------------------
Convert m68k to semihosting/syscalls.h.
Convert nios2 to semihosting/syscalls.h.
Allow optional use of semihosting from userspace.

----------------------------------------------------------------
Peter Maydell (7):
      semihosting: Allow optional use of semihosting from userspace
      target/arm: Honour -semihosting-config userspace=on
      target/m68k: Honour -semihosting-config userspace=on
      target/mips: Honour -semihosting-config userspace=on
      target/nios2: Honour -semihosting-config userspace=on
      target/xtensa: Honour -semihosting-config userspace=on
      target/riscv: Honour -semihosting-config userspace=on and enable=on

Richard Henderson (4):
      target/nios2: Use semihosting/syscalls.h
      target/nios2: Convert semihosting errno to gdb remote errno
      target/m68k: Use semihosting/syscalls.h
      target/m68k: Convert semihosting errno to gdb remote errno

 include/semihosting/semihost.h                 |  10 +-
 semihosting/config.c                           |  10 +-
 softmmu/vl.c                                   |   2 +-
 stubs/semihost.c                               |   2 +-
 target/arm/translate-a64.c                     |  12 +-
 target/arm/translate.c                         |  16 +-
 target/m68k/m68k-semi.c                        | 306 ++++++-----------------
 target/m68k/op_helper.c                        |   3 +-
 target/mips/tcg/translate.c                    |   9 +-
 target/nios2/nios2-semi.c                      | 321 ++++++-------------------
 target/nios2/translate.c                       |   3 +-
 target/riscv/cpu_helper.c                      |   9 +-
 target/riscv/translate.c                       |   1 +
 target/xtensa/translate.c                      |   7 +-
 target/mips/tcg/micromips_translate.c.inc      |   6 +-
 target/mips/tcg/mips16e_translate.c.inc        |   2 +-
 target/mips/tcg/nanomips_translate.c.inc       |   4 +-
 target/riscv/insn_trans/trans_privileged.c.inc |   3 +-
 qemu-options.hx                                |  11 +-
 19 files changed, 209 insertions(+), 528 deletions(-)

