Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DCBC69C476
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 04:24:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pTwmL-00018t-EQ; Sun, 19 Feb 2023 22:23:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pTwmJ-00018d-S4
 for qemu-devel@nongnu.org; Sun, 19 Feb 2023 22:23:47 -0500
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pTwmI-0005po-7T
 for qemu-devel@nongnu.org; Sun, 19 Feb 2023 22:23:47 -0500
Received: by mail-pl1-x641.google.com with SMTP id q9so2040082plh.6
 for <qemu-devel@nongnu.org>; Sun, 19 Feb 2023 19:23:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=UOihc448srJe4HKo/7mBKCaeeAg13XcIhCz0dW+ajOw=;
 b=JfcNNcR08H13Id9Ea381vgLLSZu740OLtVhYFfbkkEJRzCtQBna7NbVVa/oPoPfzpA
 SmTqplY5jXZt3E6bD7JL88cGnRBv7yZKPGDMr0ipNuA4IY/nIrLlaucWj2YUgzwpAw+t
 0cjNF+VY9RRUZYwg82TuoCMCfdzSwIEgCkVodE8jfUCIyUmtraqEfxTYcDCjwF9E62Br
 /28jcGK1FueguyXZUMDKzwr5+AlXX/C2AJZWGfZBVZm/xpkI05J4bFx1eQvZiXN+TE7N
 idqtKoO7DdtYPpTz9dTRAvRzenmpXxeONSdKpdXVpIX2CcSuV1uMLTRsreGo5N3Ao38H
 rTAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UOihc448srJe4HKo/7mBKCaeeAg13XcIhCz0dW+ajOw=;
 b=JTo2wmvrzwT130M1cxFgDx290BU8/aKgQ3zwp87ip8yYIcUVo8a6Jkc/L8wbNgZ3kT
 BlQbenHU0D0OLSJHuLajun5YNW7VaaQacrzZw27vopCtn5ki7CrtHW9qZKbxEUUmVxLz
 E12Dl7Kq3iljg/YlC4nG8vP5FCaW7aqRyDMvM/T6BYFxaN16iYlFBQILyuNelpoC/Rkd
 AhqFQBfL15Z1Zv6znAzHwn4f3Hpv42FH26mWru9OUiRZ5H1qphRfZSG79Ydu6PB4k0k1
 yfzQ76mEXIkbJHDgKanaZYAB1y68I+pqkQj51rz9iFaN86KqBXX5sFQiXz8Xq3xDxjCG
 8jMw==
X-Gm-Message-State: AO0yUKWA4TtbRVXWJoYEUzK+/MZqeO7px+NVaRKIsTpxpXVJBLOJBjjJ
 67rj885NJgl2ez8G/+h2W8QP2EkZUx2T3c/ABD1Gow==
X-Google-Smtp-Source: AK7set/ch/34fprOL2UnpjKBZxX4vpKVK6BcZibBKP/Q1+rK3PW6Vzq7dMI2mIWhSPODYaf357HU+g==
X-Received: by 2002:a17:902:db02:b0:19a:96a0:4af5 with SMTP id
 m2-20020a170902db0200b0019a96a04af5mr3525197plx.57.1676863424193; 
 Sun, 19 Feb 2023 19:23:44 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 l11-20020a170902d34b00b00198e1bc9d83sm6621302plk.266.2023.02.19.19.23.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Feb 2023 19:23:43 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org
Subject: [PULL 0/7] tcg patch queue
Date: Sun, 19 Feb 2023 17:23:31 -1000
Message-Id: <20230220032338.5619-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::641;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x641.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The linux-user patches are on the tcg-ish side of user-only
emulation, rather than the syscall-ish side, so queuing here.
Solving the deadlock issue is quite important vs timeouts.


r~


The following changes since commit 6dffbe36af79e26a4d23f94a9a1c1201de99c261:

  Merge tag 'migration-20230215-pull-request' of https://gitlab.com/juan.quintela/qemu into staging (2023-02-16 13:09:51 +0000)

are available in the Git repository at:

  https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20230219

for you to fetch changes up to 2f5b4792c0220920831ac84f94c3435b14791857:

  target/microblaze: Add gdbstub xml (2023-02-19 16:12:26 -1000)

----------------------------------------------------------------
tcg: Allow first half of insn in ram, and second half in mmio
linux-user/sparc: SIGILL for unknown trap vectors
linux-user/microblaze: SIGILL for privileged insns
linux-user: Fix deadlock while exiting due to signal
target/microblaze: Add gdbstub xml

----------------------------------------------------------------
Ilya Leoshkevich (4):
      linux-user: Always exit from exclusive state in fork_end()
      cpus: Make {start,end}_exclusive() recursive
      linux-user/microblaze: Handle privileged exception
      tests/tcg/linux-test: Add linux-fork-trap test

Richard Henderson (3):
      accel/tcg: Allow the second page of an instruction to be MMIO
      linux-user/sparc: Raise SIGILL for all unhandled software traps
      target/microblaze: Add gdbstub xml

 configs/targets/microblaze-linux-user.mak   |  1 +
 configs/targets/microblaze-softmmu.mak      |  1 +
 configs/targets/microblazeel-linux-user.mak |  1 +
 configs/targets/microblazeel-softmmu.mak    |  1 +
 include/hw/core/cpu.h                       |  4 +-
 target/microblaze/cpu.h                     |  2 +
 accel/tcg/translator.c                      | 12 +++++-
 cpus-common.c                               | 12 +++++-
 linux-user/main.c                           | 10 +++--
 linux-user/microblaze/cpu_loop.c            | 10 ++++-
 linux-user/sparc/cpu_loop.c                 |  8 ++++
 linux-user/syscall.c                        |  1 +
 target/microblaze/cpu.c                     |  7 ++-
 target/microblaze/gdbstub.c                 | 51 ++++++++++++++++------
 tests/tcg/multiarch/linux/linux-fork-trap.c | 51 ++++++++++++++++++++++
 gdb-xml/microblaze-core.xml                 | 67 +++++++++++++++++++++++++++++
 gdb-xml/microblaze-stack-protect.xml        | 12 ++++++
 17 files changed, 224 insertions(+), 27 deletions(-)
 create mode 100644 tests/tcg/multiarch/linux/linux-fork-trap.c
 create mode 100644 gdb-xml/microblaze-core.xml
 create mode 100644 gdb-xml/microblaze-stack-protect.xml

