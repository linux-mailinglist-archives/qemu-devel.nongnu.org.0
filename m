Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 379B0413646
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 17:35:58 +0200 (CEST)
Received: from localhost ([::1]:47632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mShoL-0002Bc-9b
	for lists+qemu-devel@lfdr.de; Tue, 21 Sep 2021 11:35:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mShkR-0007C0-Sh
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 11:31:55 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:46734)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mShkP-0000yK-QX
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 11:31:55 -0400
Received: by mail-wr1-x432.google.com with SMTP id t7so7196340wrw.13
 for <qemu-devel@nongnu.org>; Tue, 21 Sep 2021 08:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5Ab2qMNNL6ztA4tCDOx1kMF8pJCOKDHsTXqf3rtUFR4=;
 b=ks+9zEgB7EjEO7tjNuZTw3LQInrmYqyZLkrjt+h2mcUkZJ0KRNedn91Gh0AetBiMaZ
 hQGmqvBJ5i0+41FJI6pX4Qmsm5VV21QCa6vcpTc3XtB3NzhpxxJ86pkzzJOeKjGYCDlf
 1JNAuWSK8UR3rmUoFqHUn3bxf+5JFxqb/PgTNZuEtpuOQ/7LmBG6/ZbPRhSwpIZcxRRt
 X112AYAipXIQdmX5fGeabXDl7tq4PqwhiSm/qKgfX1smizGeOfbWSuwOm8xBWMThaNTD
 sqkXMSRyj+CseCYDKuUKug2nfl+eczo6nAQzUMFzvakVOHwBv88dOLbNvQy9DXjf1/p7
 qyTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5Ab2qMNNL6ztA4tCDOx1kMF8pJCOKDHsTXqf3rtUFR4=;
 b=qWOdNh2mSg0AkUyhPtz/GY8aEgioAwK5XelyiYFpRxqFd+EYZZu+Wf022x/aiXbE/6
 tho5zbBsfph8SfD+DxA7tPznEEWy0YL/Q5abQu0T5w/P91+R9mQGXHPKW8AIyfrcReuV
 DZF83nT5UTTapk30TCLjE/shvuZub2R98JISS96yJ74XQuCB+yc8qQgBJv51ogsve7jN
 BtxUkbjIh8l7869BV75QImxIj+/se+ZfaDWaWg4xb926VzGN0tVg1Lgb0RzuFassa05g
 dKIvMV3plvrNdNmDpzLfOPwaM0K5XjmXCZq1IusaP39ZcoDXpW5I6jvToqcG1vMzIeVL
 AVgg==
X-Gm-Message-State: AOAM530Ct5KdxeAITt9MM3S8WnBtW9xm3PbBcewt5RU1KQaAZ38xbTDA
 QzjS9erBMVZ/8nIsdWDi8YE/jOtEDie5rQ==
X-Google-Smtp-Source: ABdhPJwPmh53JMnuKCulvq0wj+9KQaL88HHVTJPTTo2JTXoRzf+ZuRoZABROEOAL6/qRS7zwctMAPA==
X-Received: by 2002:a1c:2313:: with SMTP id j19mr5227065wmj.189.1632238311382; 
 Tue, 21 Sep 2021 08:31:51 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id t126sm3247796wma.4.2021.09.21.08.31.50
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Sep 2021 08:31:51 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL v2 00/27] target-arm queuea
Date: Tue, 21 Sep 2021 16:31:49 +0100
Message-Id: <20210921153149.10113-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

v2: added missing #include to fix osx/x86.

The following changes since commit 7adb961995a3744f51396502b33ad04a56a317c3:

  Merge remote-tracking branch 'remotes/dgilbert-gitlab/tags/pull-virtiofs-20210916' into staging (2021-09-19 18:53:29 +0100)

are available in the Git repository at:

  https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20210921

for you to fetch changes up to 4b445c926add3fdec13958736e482e88857bcad8:

  target/arm: Optimize MVE 1op-immediate insns (2021-09-21 16:28:27 +0100)

----------------------------------------------------------------
target-arm queue:
 * Optimize codegen for MVE when predication not active
 * hvf: Add Apple Silicon support
 * hw/intc: Set GIC maintenance interrupt level to only 0 or 1
 * Fix mishandling of MVE FPSCR.LTPSIZE reset for usermode emulator
 * elf2dmp: Fix coverity nits

----------------------------------------------------------------
Alexander Graf (7):
      arm: Move PMC register definitions to internals.h
      hvf: Add execute to dirty log permission bitmap
      hvf: Introduce hvf_arch_init() callback
      hvf: Add Apple Silicon support
      hvf: arm: Implement PSCI handling
      arm: Add Hypervisor.framework build target
      hvf: arm: Add rudimentary PMC support

Peter Collingbourne (1):
      arm/hvf: Add a WFI handler

Peter Maydell (18):
      elf2dmp: Check curl_easy_setopt() return value
      elf2dmp: Fail cleanly if PDB file specifies zero block_size
      target/arm: Don't skip M-profile reset entirely in user mode
      target/arm: Always clear exclusive monitor on reset
      target/arm: Consolidate ifdef blocks in reset
      hvf: arm: Implement -cpu host
      target/arm: Avoid goto_tb if we're trying to exit to the main loop
      target/arm: Enforce that FPDSCR.LTPSIZE is 4 on inbound migration
      target/arm: Add TB flag for "MVE insns not predicated"
      target/arm: Optimize MVE logic ops
      target/arm: Optimize MVE arithmetic ops
      target/arm: Optimize MVE VNEG, VABS
      target/arm: Optimize MVE VDUP
      target/arm: Optimize MVE VMVN
      target/arm: Optimize MVE VSHL, VSHR immediate forms
      target/arm: Optimize MVE VSHLL and VMOVL
      target/arm: Optimize MVE VSLI and VSRI
      target/arm: Optimize MVE 1op-immediate insns

Shashi Mallela (1):
      hw/intc: Set GIC maintenance interrupt level to only 0 or 1

 meson.build                   |    8 +
 include/sysemu/hvf_int.h      |   12 +-
 target/arm/cpu.h              |    6 +-
 target/arm/hvf_arm.h          |   18 +
 target/arm/internals.h        |   44 ++
 target/arm/kvm_arm.h          |    2 -
 target/arm/translate.h        |    2 +
 accel/hvf/hvf-accel-ops.c     |   21 +-
 contrib/elf2dmp/download.c    |   22 +-
 contrib/elf2dmp/pdb.c         |    4 +
 hw/intc/arm_gicv3_cpuif.c     |    5 +-
 target/arm/cpu.c              |   56 +-
 target/arm/helper.c           |   77 ++-
 target/arm/hvf/hvf.c          | 1278 +++++++++++++++++++++++++++++++++++++++++
 target/arm/machine.c          |   13 +
 target/arm/translate-m-nocp.c |    8 +-
 target/arm/translate-mve.c    |  310 +++++++---
 target/arm/translate-vfp.c    |   33 +-
 target/arm/translate.c        |   42 +-
 target/i386/hvf/hvf.c         |   11 +
 MAINTAINERS                   |    5 +
 target/arm/hvf/meson.build    |    3 +
 target/arm/hvf/trace-events   |   11 +
 target/arm/meson.build        |    2 +
 24 files changed, 1825 insertions(+), 168 deletions(-)
 create mode 100644 target/arm/hvf_arm.h
 create mode 100644 target/arm/hvf/hvf.c
 create mode 100644 target/arm/hvf/meson.build
 create mode 100644 target/arm/hvf/trace-events

