Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8ACA570500
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jul 2022 16:05:06 +0200 (CEST)
Received: from localhost ([::1]:52782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oAu26-000758-0D
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 10:05:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oAtvC-0006JP-P9
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 09:57:58 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:38522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oAtv8-0002bg-Ls
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 09:57:57 -0400
Received: by mail-wr1-x433.google.com with SMTP id v14so7134367wra.5
 for <qemu-devel@nongnu.org>; Mon, 11 Jul 2022 06:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DQk9DmWtqtvD4nHry4G30rbxmtCygV0H+jlz6QQuc38=;
 b=cLpu4fJdDx413cMAWVzJNKY8u2sL8go0s8Rk42Obc96WsYPKhH1cEeW1I8Xvis4Z70
 lItjXxqna+3r0lS90S8tQdr7bFthk0TVZP/fEyvr0CfIGL93//yspLXJk7lYpteqUydj
 6Ii+HNAsT2EgP/ydpLBB0ALpAIlVH8CXrx0iE7xYjOOqiLY7qB8kTro3clIXiIfLPSgd
 WsO4iNSSf+I/pZk5YL0h+C43z1fi83m0XVG058Q9SkbRZdiG3WLbU0nY7daGKzBXwAJl
 EHZFogTXwqEtSrh/m6wReu04IQ46baatLYCrM/9TUJ6hF7Ca5irJtKQfD6v4Ftl/DyMq
 Y56w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DQk9DmWtqtvD4nHry4G30rbxmtCygV0H+jlz6QQuc38=;
 b=8GxbQBajqYzCdyioJMo9Ob07yDH1yBHdlk5dQ6FyIqD5yWW7mHwkwhU6tw9iTJMX4L
 Xy5KgnLk80XgRrbg5ew7glYLSSchIYe4lY9MISY8Ba3A+wlduXBjrH8n20q+dyANgqsN
 GWgi4A2xNeYSOVNAHENEW37EVjucb63ccRpPtrZLgskLsinKCGfjc6UwndDqBLX+GRju
 KsPHShB4JTcCe50Ji/EKuJJ7taiOBdaVOYqm3Qtp4bG7i+EcCx/rpPppdNufSRZySYNX
 ZlyFPc2ntsyyw3av4j+yIiPREguIfK3raKDphzgqHg/Ot7UzJtd2GPkL6KCxe0cJ47fW
 eJHA==
X-Gm-Message-State: AJIora8GYfNnz5Qi6UaGQZDsHO9QiWIq3//dhfEaaaLlJJ8zbKRKFKpL
 aVNFfIIh5JuUInwu2yYiSqLPxxcf41jNNQ==
X-Google-Smtp-Source: AGRyM1vB7fbVeaJKGWeUl09CIpZKEPgdsHX/qc5qn/5x19goUjQHhp+4bNXRGwa9QM5b2/kG4QoMxA==
X-Received: by 2002:a5d:5f05:0:b0:21d:9ad7:f281 with SMTP id
 cl5-20020a5d5f05000000b0021d9ad7f281mr10846680wrb.4.1657547872948; 
 Mon, 11 Jul 2022 06:57:52 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 q123-20020a1c4381000000b00397402ae674sm7595596wma.11.2022.07.11.06.57.52
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jul 2022 06:57:52 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 00/45] target-arm queue
Date: Mon, 11 Jul 2022 14:57:05 +0100
Message-Id: <20220711135750.765803-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
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

I don't have anything else queued up at the moment, so this is just
Richard's SME patches.

-- PMM

The following changes since commit 63b38f6c85acd312c2cab68554abf33adf4ee2b3:

  Merge tag 'pull-target-arm-20220707' of https://git.linaro.org/people/pmaydell/qemu-arm into staging (2022-07-08 06:17:11 +0530)

are available in the Git repository at:

  https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20220711

for you to fetch changes up to f9982ceaf26df27d15547a3a7990a95019e9e3a8:

  linux-user/aarch64: Add SME related hwcap entries (2022-07-11 13:43:52 +0100)

----------------------------------------------------------------
target-arm:
 * Implement SME emulation, for both system and linux-user

----------------------------------------------------------------
Richard Henderson (45):
      target/arm: Handle SME in aarch64_cpu_dump_state
      target/arm: Add infrastructure for disas_sme
      target/arm: Trap non-streaming usage when Streaming SVE is active
      target/arm: Mark ADR as non-streaming
      target/arm: Mark RDFFR, WRFFR, SETFFR as non-streaming
      target/arm: Mark BDEP, BEXT, BGRP, COMPACT, FEXPA, FTSSEL as non-streaming
      target/arm: Mark PMULL, FMMLA as non-streaming
      target/arm: Mark FTSMUL, FTMAD, FADDA as non-streaming
      target/arm: Mark SMMLA, UMMLA, USMMLA as non-streaming
      target/arm: Mark string/histo/crypto as non-streaming
      target/arm: Mark gather/scatter load/store as non-streaming
      target/arm: Mark gather prefetch as non-streaming
      target/arm: Mark LDFF1 and LDNF1 as non-streaming
      target/arm: Mark LD1RO as non-streaming
      target/arm: Add SME enablement checks
      target/arm: Handle SME in sve_access_check
      target/arm: Implement SME RDSVL, ADDSVL, ADDSPL
      target/arm: Implement SME ZERO
      target/arm: Implement SME MOVA
      target/arm: Implement SME LD1, ST1
      target/arm: Export unpredicated ld/st from translate-sve.c
      target/arm: Implement SME LDR, STR
      target/arm: Implement SME ADDHA, ADDVA
      target/arm: Implement FMOPA, FMOPS (non-widening)
      target/arm: Implement BFMOPA, BFMOPS
      target/arm: Implement FMOPA, FMOPS (widening)
      target/arm: Implement SME integer outer product
      target/arm: Implement PSEL
      target/arm: Implement REVD
      target/arm: Implement SCLAMP, UCLAMP
      target/arm: Reset streaming sve state on exception boundaries
      target/arm: Enable SME for -cpu max
      linux-user/aarch64: Clear tpidr2_el0 if CLONE_SETTLS
      linux-user/aarch64: Reset PSTATE.SM on syscalls
      linux-user/aarch64: Add SM bit to SVE signal context
      linux-user/aarch64: Tidy target_restore_sigframe error return
      linux-user/aarch64: Do not allow duplicate or short sve records
      linux-user/aarch64: Verify extra record lock succeeded
      linux-user/aarch64: Move sve record checks into restore
      linux-user/aarch64: Implement SME signal handling
      linux-user: Rename sve prctls
      linux-user/aarch64: Implement PR_SME_GET_VL, PR_SME_SET_VL
      target/arm: Only set ZEN in reset if SVE present
      target/arm: Enable SME for user-only
      linux-user/aarch64: Add SME related hwcap entries

 docs/system/arm/emulation.rst     |    4 +
 linux-user/aarch64/target_cpu.h   |    5 +-
 linux-user/aarch64/target_prctl.h |   62 +-
 target/arm/cpu.h                  |    7 +
 target/arm/helper-sme.h           |  126 ++++
 target/arm/helper-sve.h           |    4 +
 target/arm/helper.h               |   18 +
 target/arm/translate-a64.h        |   45 ++
 target/arm/translate.h            |   16 +
 target/arm/sme-fa64.decode        |   60 ++
 target/arm/sme.decode             |   88 +++
 target/arm/sve.decode             |   41 +-
 linux-user/aarch64/cpu_loop.c     |    9 +
 linux-user/aarch64/signal.c       |  243 ++++++--
 linux-user/elfload.c              |   20 +
 linux-user/syscall.c              |   28 +-
 target/arm/cpu.c                  |   35 +-
 target/arm/cpu64.c                |   11 +
 target/arm/helper.c               |   56 +-
 target/arm/sme_helper.c           | 1140 +++++++++++++++++++++++++++++++++++++
 target/arm/sve_helper.c           |   28 +
 target/arm/translate-a64.c        |  103 +++-
 target/arm/translate-sme.c        |  373 ++++++++++++
 target/arm/translate-sve.c        |  393 ++++++++++---
 target/arm/translate-vfp.c        |   12 +
 target/arm/translate.c            |    2 +
 target/arm/vec_helper.c           |   24 +
 target/arm/meson.build            |    3 +
 28 files changed, 2821 insertions(+), 135 deletions(-)
 create mode 100644 target/arm/sme-fa64.decode
 create mode 100644 target/arm/sme.decode
 create mode 100644 target/arm/translate-sme.c

