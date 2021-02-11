Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9E88319412
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 21:14:50 +0100 (CET)
Received: from localhost ([::1]:43302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAIMT-00052l-Td
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 15:14:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lAI5w-0006rm-RM
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 14:57:45 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:46256)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lAI5p-0001UM-39
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 14:57:43 -0500
Received: by mail-wr1-x435.google.com with SMTP id t15so3062985wrx.13
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 11:57:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BrBJ6BU7feqDwKigJr004AcoD0UbTDx/+y3ssbhDCFs=;
 b=mStZfj4bPXq0JwWcwQ28FMsZX2zY20kqQ2MWo6qB0z8C3hrOjWJ2Q7fvLE/Qtq69Mu
 Dzi08pVxFijPeQHryUGU5ai16PytPnwq6LJDyTSpoErfn1bHjbYpI2lhEQF1NS9o23++
 GMNfJuBBqQi2NC2xB+IxJwdhG+jq/FsR8I6IXKXsDXEPAx1+c5x29LnV18a43q96GtQU
 LQcMVoIGfXkg+vWf154LNS7GisgUfk0DcycPBNIf1AdarPibdii5yNDlSx94nFp5WxmQ
 JUu0JH6wv6+ksYZ2+B1ExccDX7HfTn9FVyVtnljyesaKv8+ruLbEAjU/oDptKdxEDhAv
 V2qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BrBJ6BU7feqDwKigJr004AcoD0UbTDx/+y3ssbhDCFs=;
 b=cnrpZO8zN1IWNo+nD3Davy9D0c4eWxVaBx4TesqmjVMJejv4SYWF1sbEZR7ND7vFFn
 cKDuKs3yjJ0nZwBQBni/17v6i6cmQ4zlp/LNFPMeL7SS3BSxPQtsQ8XERm/6tk7iL9/O
 6J4tVbbbLES3Fq70syU7z/xCMBu9ws3QbAG8P2xkYjAgHGlmOEB/TiX/79EAE1C+EuDY
 GLzvDFRHYTviT9KT28RKwrDGU62Wg1XOF/DErc9pkQc9Vq+DzN3zrKxPj2k8AdlChOhr
 3ZcJSByEA+fASEAE6y+WEBdE28SEm1g08YhZOqcwYr6ZsbAA0FGjsTc81n4eg/In2z/h
 9GlA==
X-Gm-Message-State: AOAM530kj7329BMrcEHBE9+XIx6I9ZohavA/L/KSHyoKMYgCJ4fiYslX
 JImkWeERVUtdyLmMuBr2x7FTlQPwl0vhRQ==
X-Google-Smtp-Source: ABdhPJxkFOlHAFXV6wMusOkHFGfBCNEZpWJheaRQKcGzRHQ6TUiCNKVJ++tFrAZdXxqH8jctN4lTSA==
X-Received: by 2002:a5d:4206:: with SMTP id n6mr7193904wrq.213.1613073453158; 
 Thu, 11 Feb 2021 11:57:33 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id 2sm7118459wre.24.2021.02.11.11.57.32
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Feb 2021 11:57:32 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL v2 00/11] target-arm queue
Date: Thu, 11 Feb 2021 19:57:31 +0000
Message-Id: <20210211195731.6039-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
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

Massively slimmed down v2: MemTag broke bsd-user, and the npcm7xx
ethernet device failed 'make check' on big-endian hosts.

-- PMM

The following changes since commit 83339e21d05c824ebc9131d644f25c23d0e41ecf:

  Merge remote-tracking branch 'remotes/stefanha-gitlab/tags/block-pull-request' into staging (2021-02-10 15:42:20 +0000)

are available in the Git repository at:

  https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20210211-1

for you to fetch changes up to d3c1183ffeb71ca3a783eae3d7e1c51e71e8a621:

  target/arm: Correctly initialize MDCR_EL2.HPMN (2021-02-11 19:48:09 +0000)

----------------------------------------------------------------
target-arm queue:
 * Correctly initialize MDCR_EL2.HPMN
 * versal: Use nr_apu_cpus in favor of hard coding 2
 * accel/tcg: Add URL of clang bug to comment about our workaround
 * Add support for FEAT_DIT, Data Independent Timing
 * Remove GPIO from unimplemented NPCM7XX
 * Fix SCR RES1 handling
 * Don't migrate CPUARMState.features

----------------------------------------------------------------
Aaron Lindsay (1):
      target/arm: Don't migrate CPUARMState.features

Daniel Müller (1):
      target/arm: Correctly initialize MDCR_EL2.HPMN

Edgar E. Iglesias (1):
      hw/arm: versal: Use nr_apu_cpus in favor of hard coding 2

Hao Wu (1):
      hw/arm: Remove GPIO from unimplemented NPCM7XX

Mike Nawrocki (1):
      target/arm: Fix SCR RES1 handling

Peter Maydell (2):
      arm: Update infocenter.arm.com URLs
      accel/tcg: Add URL of clang bug to comment about our workaround

Rebecca Cran (4):
      target/arm: Add support for FEAT_DIT, Data Independent Timing
      target/arm: Support AA32 DIT by moving PSTATE_SS from cpsr into env->pstate
      target/arm: Set ID_AA64PFR0.DIT and ID_PFR0.DIT to 1 for "max" AA64 CPU
      target/arm: Set ID_PFR0.DIT to 1 for "max" 32-bit CPU

 include/hw/dma/pl080.h                 |  7 ++--
 include/hw/misc/arm_integrator_debug.h |  2 +-
 include/hw/ssi/pl022.h                 |  5 ++-
 target/arm/cpu.h                       | 17 ++++++++
 target/arm/internals.h                 |  6 +++
 accel/tcg/cpu-exec.c                   | 25 +++++++++---
 hw/arm/aspeed_ast2600.c                |  2 +-
 hw/arm/musca.c                         |  4 +-
 hw/arm/npcm7xx.c                       |  8 ----
 hw/arm/xlnx-versal.c                   |  4 +-
 hw/misc/arm_integrator_debug.c         |  2 +-
 hw/timer/arm_timer.c                   |  7 ++--
 target/arm/cpu.c                       |  4 ++
 target/arm/cpu64.c                     |  5 +++
 target/arm/helper-a64.c                | 27 +++++++++++--
 target/arm/helper.c                    | 71 +++++++++++++++++++++++++++-------
 target/arm/machine.c                   |  2 +-
 target/arm/op_helper.c                 |  9 +----
 target/arm/translate-a64.c             | 12 ++++++
 19 files changed, 164 insertions(+), 55 deletions(-)

