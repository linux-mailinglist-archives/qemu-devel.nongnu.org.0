Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD2A412BBD
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 04:28:01 +0200 (CEST)
Received: from localhost ([::1]:35322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSVVo-0008Jp-Sb
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 22:28:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSVTY-0005Wt-Ka
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 22:25:40 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:44927)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSVTW-0006Du-GF
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 22:25:40 -0400
Received: by mail-pg1-x531.google.com with SMTP id s11so19300940pgr.11
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 19:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kuZfkwT6TB9nWNiqSl5AuHsN/91Jerg+tZupkKJ6w5o=;
 b=wgFsSyidXtCI2VdQGxirxbOOr8tN3IS6Xi04UnkrHa05SMSe6sodgRhGOVo/aGlaqH
 DNbeNv8oikAVz3l80+jNpkmXM3/brW2rX7jSg2IWIyDYQurqu/BKVw0CM4vzaenbr2p6
 9S2ESN4xvYLOqsLxX6t8S5Gn7FX+ITib9/HMGMYEvwxUd4UVhiztum7ZgHmokwU983dP
 98ehDtSVaj+i2Re9TDTMPhTU2Dnmrwn8kNYa3yKln6fHj88aKfKStAGTCMWqms/uO+r5
 pEnlPgwoDPP90c50S4OGJoRbDjnYbsDI6u4Em5/zHpTrTgXFbNQFHhPOEwHuCF+kEu0p
 XK2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kuZfkwT6TB9nWNiqSl5AuHsN/91Jerg+tZupkKJ6w5o=;
 b=13qPSVg5BBkd4LMeVHkybn02YSbp9JsSZwiXbn6+TmJUQzZKm5w24OYqD8OwF/390L
 e0kYWP+fivfXPn3lOsuTAC+eLRHJS/Hu6iwI78jeh0tQIkK+TJ0zLC8JkDrr/AV3mkzE
 j1woEbFIB7246TpJ+c1uuUpo10A1ec48TqTbMJ7v05eUqM0OR0n8AhA1vGzZYlTb5fho
 E2G8mdjUS3Wq1EMT4UrFriDtqMhcj0kL8ic4H5juGVcWwtLuUlWM+iO3NGKW35KcHrz6
 TP634TFvVc+4EKTdDfNK35T3htuRlgOByAeo/Mllsdorqw6SoDoXqxCwKcUpV5cuslk3
 aHXQ==
X-Gm-Message-State: AOAM531BeIpajYxp2EoxOXVtU3vAcgY7b2DoS4yyFdypRuzmBZS/k1v1
 lvlbXxPBz1oLVkb/J9ULE1soqkvfbDSacw==
X-Google-Smtp-Source: ABdhPJwL/bdg/dsvEcg3QAAI+tOf9rtKdCkAlhqqYWfaYKBKOvHs9L/uE/O1t1GXIQukF5ygMEx+4g==
X-Received: by 2002:a05:6a00:a8a:b029:356:be61:7f18 with SMTP id
 b10-20020a056a000a8ab0290356be617f18mr28000805pfl.29.1632191136408; 
 Mon, 20 Sep 2021 19:25:36 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id n9sm15297621pff.37.2021.09.20.19.25.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 19:25:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 00/10] tcg patch queue, v2
Date: Mon, 20 Sep 2021 19:25:24 -0700
Message-Id: <20210921022534.365291-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
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

Drop has_work patches.
Add a few more misc cleanups.


The following changes since commit 326ff8dd09556fc2e257196c49f35009700794ac:

  Merge remote-tracking branch 'remotes/jasowang/tags/net-pull-request' into staging (2021-09-20 16:17:05 +0100)

are available in the Git repository at:

  https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20210920

for you to fetch changes up to b21ba5dfe3f4a367910d490d10fa7c9fa76f1504:

  tcg/riscv: Remove add with zero on user-only memory access (2021-09-20 14:17:54 -0700)

----------------------------------------------------------------
Move cpu_signal_handler declaration.
Restrict cpu_handle_halt to sysemu.
Make do_unaligned_access noreturn.
Misc tcg/mips cleanup
Misc tcg/sparc cleanup
Misc tcg/riscv cleanup

----------------------------------------------------------------
Philippe Mathieu-Daudé (1):
      accel/tcg: Restrict cpu_handle_halt() to sysemu

Richard Henderson (9):
      include/exec: Move cpu_signal_handler declaration
      tcg/mips: Drop inline markers
      tcg/mips: Allow JAL to be out of range in tcg_out_bswap_subr
      tcg/mips: Unset TCG_TARGET_HAS_direct_jump
      tcg/mips: Drop special alignment for code_gen_buffer
      tcg/sparc: Drop inline markers
      tcg/sparc: Introduce tcg_out_mov_delay
      hw/core: Make do_unaligned_access noreturn
      tcg/riscv: Remove add with zero on user-only memory access

 include/exec/exec-all.h        |  13 +++++
 include/hw/core/tcg-cpu-ops.h  |   3 +-
 target/alpha/cpu.h             |  10 +---
 target/arm/cpu.h               |   7 ---
 target/arm/internals.h         |   2 +-
 target/avr/cpu.h               |   2 -
 target/cris/cpu.h              |   8 ----
 target/hexagon/cpu.h           |   3 --
 target/hppa/cpu.h              |   3 --
 target/i386/cpu.h              |   7 ---
 target/m68k/cpu.h              |   8 ----
 target/microblaze/cpu.h        |   9 +---
 target/mips/cpu.h              |   3 --
 target/mips/internal.h         |   2 -
 target/mips/tcg/tcg-internal.h |   4 +-
 target/nios2/cpu.h             |   6 +--
 target/openrisc/cpu.h          |   2 -
 target/ppc/cpu.h               |   7 ---
 target/ppc/internal.h          |   4 +-
 target/riscv/cpu.h             |   4 +-
 target/rx/cpu.h                |   4 --
 target/s390x/cpu.h             |   7 ---
 target/s390x/s390x-internal.h  |   4 +-
 target/sh4/cpu.h               |   7 +--
 target/sparc/cpu.h             |   2 -
 target/tricore/cpu.h           |   2 -
 target/xtensa/cpu.h            |   6 +--
 tcg/mips/tcg-target.h          |  12 ++---
 accel/tcg/cpu-exec.c           |   6 ++-
 target/hppa/cpu.c              |   7 +--
 tcg/region.c                   |  91 -----------------------------------
 tcg/mips/tcg-target.c.inc      | 105 ++++++++++++++---------------------------
 tcg/riscv/tcg-target.c.inc     |  10 +---
 tcg/sparc/tcg-target.c.inc     |  64 ++++++++++++++-----------
 34 files changed, 119 insertions(+), 315 deletions(-)

