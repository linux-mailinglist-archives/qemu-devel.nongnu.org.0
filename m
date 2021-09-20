Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C10A41173D
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 16:37:20 +0200 (CEST)
Received: from localhost ([::1]:53552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSKQ3-0002EV-Cg
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 10:37:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mSK9H-0002aN-Hv
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 10:19:59 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:39603)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mSK99-0000kE-43
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 10:19:58 -0400
Received: by mail-wr1-x42d.google.com with SMTP id u15so30214390wru.6
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 07:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sGzbk7ZEOIwNzP0ifLwge8kgYDnLUPuNFcH6dczwLNQ=;
 b=MFCLD+FQy9TG0Fp6ILU0vxE3gFtEja+mbhzTJc6CXpTb81h0mnRK5HqARcbA2gp/uR
 BPX/Qwk8I552kzqXtX7w3ET55u09pvvufhacK1Yu485drl+aRORr7Mh+Xk8+yZeG3Jmt
 +1LudXyvd6VxdIPJU8n2pR2FPhq/x6IVXFu2egPnqFjETlCUc0VfamvNt8yjnamYsILm
 wlmbO5wViNo0wM8FxUMqULxBgcmBNfkQa4i1LuTRZOi99JPW3j6YMvDL7ptHjIBsjEuu
 Qoc6fJ8e5gIbbjTssv+MYK5+dKix2d9aJQNYU1+TEbCth+7Jrm/iETNGTniDIK3xOP6R
 Ev3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sGzbk7ZEOIwNzP0ifLwge8kgYDnLUPuNFcH6dczwLNQ=;
 b=2I8jF7Rxn7qPxP8V4lcfCSAQqD3d2sxiuKWmlJRAF2JFOQ3glwyNiOVkCvQTk1POIG
 GxXZ2Xmh2tYC3xv2C6tGteLFMCIL/3zXXJYJJnFucV+IcumwMykY1wQq3oDHX8xRF12Y
 EwnIJm0v6sceAfJ6XLOSlMImHGgF5kbpAK+Dxxz0g2biK6JvWbJSVClDaMxZaAcWMtYt
 kl/fzPTlbB7XpTlMYiR2I/jq01VixfIPMZpN/4RACDm6Q8r+cxNyRdf3fTrxYwwcZ88h
 dSrefYaEJu4CdCOuXKS35Zrjne40j4BbVsrU8FrJHaX1FQJB+bYPqlFl9d1ay9FCcQuP
 14bw==
X-Gm-Message-State: AOAM530cKeASyBQaWY9prOQJ08jd6Vw4VE21rx+Y76z09+KIMygWZ27i
 dp664U7Kbioq6J6tuEFF/eK9KeGq6q35OA==
X-Google-Smtp-Source: ABdhPJxPhZlKk3LvvcbyAuQqK3+tQrtXnS2KOylN+yNqQbgshhbAa5hGocMFFGTE2gLkX9p/rvoNCQ==
X-Received: by 2002:a05:600c:2144:: with SMTP id
 v4mr24173155wml.80.1632147589419; 
 Mon, 20 Sep 2021 07:19:49 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id n17sm16229693wrp.17.2021.09.20.07.19.48
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 07:19:48 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 00/27] target-arm queue
Date: Mon, 20 Sep 2021 15:19:20 +0100
Message-Id: <20210920141947.5537-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

arm queue: big stuff here is my MVE codegen optimisation,
and Alex's Apple Silicon hvf support.

-- PMM

The following changes since commit 7adb961995a3744f51396502b33ad04a56a317c3:

  Merge remote-tracking branch 'remotes/dgilbert-gitlab/tags/pull-virtiofs-20210916' into staging (2021-09-19 18:53:29 +0100)

are available in the Git repository at:

  https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20210920

for you to fetch changes up to 1dc5a60bfe406bc1122d68cbdefda38d23134b27:

  target/arm: Optimize MVE 1op-immediate insns (2021-09-20 14:18:01 +0100)

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
 target/i386/hvf/hvf.c         |   10 +
 MAINTAINERS                   |    5 +
 target/arm/hvf/meson.build    |    3 +
 target/arm/hvf/trace-events   |   11 +
 target/arm/meson.build        |    2 +
 24 files changed, 1824 insertions(+), 168 deletions(-)
 create mode 100644 target/arm/hvf_arm.h
 create mode 100644 target/arm/hvf/hvf.c
 create mode 100644 target/arm/hvf/meson.build
 create mode 100644 target/arm/hvf/trace-events

