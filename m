Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55D2F26039F
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Sep 2020 19:52:17 +0200 (CEST)
Received: from localhost ([::1]:40120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kFLJQ-0006Ac-73
	for lists+qemu-devel@lfdr.de; Mon, 07 Sep 2020 13:52:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kFLIK-0004fV-Bp
 for qemu-devel@nongnu.org; Mon, 07 Sep 2020 13:51:08 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:50383)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kFLII-0000kQ-Bo
 for qemu-devel@nongnu.org; Mon, 07 Sep 2020 13:51:07 -0400
Received: by mail-pj1-x102e.google.com with SMTP id b16so7020379pjp.0
 for <qemu-devel@nongnu.org>; Mon, 07 Sep 2020 10:51:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RjqVFOTeqg9LVlbApNcAWSAyva2vOJwRXeL4ngm1lCU=;
 b=Ly2Q+Fo5t8L1+9DHoUAZav5s/8jW6d0oQkAYZ1lsM5iuMG85jKeBgYBocuT4z+Tuo2
 ixh5HWJ6HYXIyG511mx2xyXdbnWq2IM92u5OkNFTp3JT3MIbGtl/CgqQudP/vDC1x2X8
 nnAVUVR64EhiB4p5bEF4ACaSzfu12AO/gQqWtL6Wtwe7HG0J4xphGw/uE3nf44gQBNPc
 +TaIZiiKCkkmPx/MWUOVi2PD+2QRcgGoEhFocmKxEUUuZzfvYxCyMVO6gWUPMMixVSJm
 CZtyqOowavL8W6d4Yz/gc94zPCHKooACH6WIiTZ7JHDI++O7aLiysxtYPxQ3P1Uv20r2
 Se1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RjqVFOTeqg9LVlbApNcAWSAyva2vOJwRXeL4ngm1lCU=;
 b=CjFjpktjH/GP44XER/l0VGsPXZ0yhqUv8c6u/mUya+qqeER0KEGtmIbjcFaF8VTnKX
 klnC9nN6qGQ6TI9lPQTBNnAExMiAT0w4FRZcabHdXX990cr3jDQSGaoyykjYl6T8x9SU
 Vc0fgndA6j1az8Nh+M4KSU9PATBux6sF9rEqRpZBR2mUvLy17aIj3dOGzp3tprsOuRCi
 SXlK9xcPFxI7GldPIupp6k6W4zMmOzISBGZu5DmNRUXjQDCJaz0mDtiyNaJ/+j8EWtgk
 u/TH4a7Un4kbS6NXtCpJm331cYANzUG6pjMWkThmnBbkmfQQzSNlw02lFzbJM1VhjnQa
 kF8Q==
X-Gm-Message-State: AOAM530YHuf7kcRGw8MqTHVHPHGpxRV4nzgUGuRgVEJEAW6CvSLfjp/C
 wO5qiHe6n3KxWfZ5SejceQv0fCWhxYKLfQ==
X-Google-Smtp-Source: ABdhPJz1cOMa49rmUu93xOepRgBrz2KtnjCSeCWctVsAr98FbfHetccUJ5+IRcPEi0roQXoHxzh4xQ==
X-Received: by 2002:a17:90a:dd45:: with SMTP id
 u5mr380363pjv.198.1599501064334; 
 Mon, 07 Sep 2020 10:51:04 -0700 (PDT)
Received: from localhost.localdomain ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id ga3sm1651496pjb.18.2020.09.07.10.51.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Sep 2020 10:51:03 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 00/19] target/microblaze patch queue
Date: Mon,  7 Sep 2020 10:50:42 -0700
Message-Id: <20200907175102.28027-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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

Doing the PR on request from Edgar.


r~


The following changes since commit 9d5589bb3feed442ae7ee24d2d882aa0312349a6:

  Merge remote-tracking branch 'remotes/vivier2/tags/linux-user-for-5.2-pull-request' into staging (2020-09-07 15:31:04 +0100)

are available in the Git repository at:

  https://github.com/rth7680/qemu.git tags/pull-mb-20200907

for you to fetch changes up to 971338d7906b89359c75bd657e4275fdb12cf38d:

  configure: Do not set TARGET_ABI32 for microblaze (2020-09-07 10:42:04 -0700)

----------------------------------------------------------------
Fix icount regresion.
Use lookup_and_goto_tb.
Cleanup and fill in VMStateDescription.

----------------------------------------------------------------
Richard Henderson (19):
      target/microblaze: Collected fixes for env->iflags
      target/microblaze: Renumber D_FLAG
      target/microblaze: Cleanup mb_cpu_do_interrupt
      target/microblaze: Rename mmu structs
      target/microblaze: Rename DISAS_UPDATE to DISAS_EXIT
      target/microblaze: Introduce DISAS_EXIT_NEXT, DISAS_EXIT_JUMP
      target/microblaze: Replace cpustate_changed with DISAS_EXIT_NEXT
      target/microblaze: Handle DISAS_EXIT_NEXT in delay slot
      target/microblaze: Force rtid, rted, rtbd to exit
      target/microblaze: Use tcg_gen_lookup_and_goto_ptr
      target/microblaze: Diagnose invalid insns in delay slots
      target/microblaze: Split out MicroBlazeCPUConfig
      target/microblaze: Reorg MicroBlazeCPUConfig to minimize holes
      target/microblaze: Move pvr regs to MicroBlazeCPUConfig
      target/microblaze: Treat pvr_regs as constant
      target/microblaze: Move mmu parameters to MicroBlazeCPUConfig
      target/microblaze: Fill in VMStateDescription for cpu
      target/microblaze: Put MicroBlazeCPUConfig into DisasContext
      configure: Do not set TARGET_ABI32 for microblaze

 configure                           |   1 -
 target/microblaze/cpu.h             |  81 +++++++------
 target/microblaze/mmu.h             |  20 +---
 hw/microblaze/petalogix_ml605_mmu.c |   6 +-
 target/microblaze/cpu.c             | 120 ++++++++++----------
 target/microblaze/gdbstub.c         |   6 +-
 target/microblaze/helper.c          | 220 ++++++++++++++++--------------------
 target/microblaze/machine.c         | 106 +++++++++++++++++
 target/microblaze/mmu.c             |  39 ++++---
 target/microblaze/op_helper.c       |   2 +-
 target/microblaze/translate.c       | 198 +++++++++++++++++++++-----------
 target/microblaze/meson.build       |   5 +-
 12 files changed, 482 insertions(+), 322 deletions(-)
 create mode 100644 target/microblaze/machine.c

