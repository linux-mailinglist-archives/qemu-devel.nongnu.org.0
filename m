Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8196255B91C
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 12:25:19 +0200 (CEST)
Received: from localhost ([::1]:57272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5lve-0005Dp-FK
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 06:25:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o5ltD-0002FG-FY
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 06:22:43 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:36619)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o5ltA-0004r9-Fk
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 06:22:42 -0400
Received: by mail-wr1-x42e.google.com with SMTP id o4so8387192wrh.3
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 03:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=84JiihRoFzsiR4iOYh7KxAlyc73ufBO8lBbyriviNyQ=;
 b=KEWRqLcutXOagsLDgIKS/36AYe5THp0eZEdwgSIVbCE3XAYTsZtFHusVgFD4xfwk1Y
 alBnCm92MnbCj1keZvTiPJ3/rAgM62Tblq/nT1Bk939mmhbCxjEWFBSSckulJdc6SH0s
 8l/y1j6/VKDkxwdzIdR5cFXIRX1LZGfgRsykKJUIch8Gy+rXM4IJwe9ivUyF++mKBYab
 XTZjHSMu9EI435C9C4XGGMSAD5rqqqWbIV8JUYTBoRqf8JR/r0nMrTC3D5O8kraUp8wG
 Ru/PB5TYoLxCH9glS3d7E67N1ChZNVdhzBNCEinW06TiVSEU+j99QET506ntL4UFAksP
 uilA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=84JiihRoFzsiR4iOYh7KxAlyc73ufBO8lBbyriviNyQ=;
 b=UARUlASiGM4WLcXZOUE694jGFFZkN69t+QyNuYQFzGIYe97uMoVU7t1v8gn+qbX8ZC
 XbonIRm2Ff7XF8i88dzhp313T87kAD6R5uKF8o82TxkADchGbX1VAvDIW8Tc6LmWGspI
 4eBiXnQ4wtyLWtBUdlZlDDLqvKmrKT8x7w9h7QM92INVNrPAXOG6AwTnK/AJG1aKziW9
 Qy3Y/HhjWsqunc7QbAb0bNXi742yqf2TBUqONJ1XReckoniv3cDZSWj4b9Ksuqt6AAA7
 ySSzp/k0U+55GDyiwt0wFrqlVo5W8WgBky0DQmWfIFxD7YWC1dthV6BMsJE35HWjU8Vp
 YXLQ==
X-Gm-Message-State: AJIora8xVFx0xHX/OPmEU1m4z2VuKVZJwqhmiKHhLaf6kAKNvdNdNZld
 XD81jUZSXiNNEIjJZm5TZmC0enDca3wtvA==
X-Google-Smtp-Source: AGRyM1vRDu9sb1pTLk/kEUSDg56kqE2gSbF48KBp//r4V16TIf+Y8ExJmVLeyxQoISHW/GtNgwW/WQ==
X-Received: by 2002:a05:6000:2ab:b0:211:7fd6:24ef with SMTP id
 l11-20020a05600002ab00b002117fd624efmr11705468wry.67.1656325358577; 
 Mon, 27 Jun 2022 03:22:38 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 d11-20020a5d6dcb000000b0020e6ce4dabdsm9754335wrz.103.2022.06.27.03.22.37
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 03:22:38 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 00/25] target-arm queue
Date: Mon, 27 Jun 2022 11:22:11 +0100
Message-Id: <20220627102236.3097629-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
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

target-arm queue, mostly SME preliminaries.

In the unlikely event we don't land the rest of SME before freeze
for 7.1 we can revert the docs/property changes included here.

-- PMM

The following changes since commit 097ccbbbaf2681df1e65542e5b7d2b2d0c66e2bc:

  Merge tag 'qemu-sparc-20220626' of https://github.com/mcayland/qemu into staging (2022-06-27 05:21:05 +0530)

are available in the Git repository at:

  https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20220627

for you to fetch changes up to 59e1b8a22ea9f947d038ccac784de1020f266e14:

  target/arm: Check V7VE as well as LPAE in arm_pamax (2022-06-27 11:18:17 +0100)

----------------------------------------------------------------
target-arm queue:
 * sphinx: change default language to 'en'
 * Diagnose attempts to emulate EL3 in hvf as well as kvm
 * More SME groundwork patches
 * virt: Fix calculation of physical address space size
   for v7VE CPUs (eg cortex-a15)

----------------------------------------------------------------
Alexander Graf (2):
      accel: Introduce current_accel_name()
      target/arm: Catch invalid kvm state also for hvf

Martin Liška (1):
      sphinx: change default language to 'en'

Richard Henderson (22):
      target/arm: Implement TPIDR2_EL0
      target/arm: Add SMEEXC_EL to TB flags
      target/arm: Add syn_smetrap
      target/arm: Add ARM_CP_SME
      target/arm: Add SVCR
      target/arm: Add SMCR_ELx
      target/arm: Add SMIDR_EL1, SMPRI_EL1, SMPRIMAP_EL2
      target/arm: Add PSTATE.{SM,ZA} to TB flags
      target/arm: Add the SME ZA storage to CPUARMState
      target/arm: Implement SMSTART, SMSTOP
      target/arm: Move error for sve%d property to arm_cpu_sve_finalize
      target/arm: Create ARMVQMap
      target/arm: Generalize cpu_arm_{get,set}_vq
      target/arm: Generalize cpu_arm_{get, set}_default_vec_len
      target/arm: Move arm_cpu_*_finalize to internals.h
      target/arm: Unexport aarch64_add_*_properties
      target/arm: Add cpu properties for SME
      target/arm: Introduce sve_vqm1_for_el_sm
      target/arm: Add SVL to TB flags
      target/arm: Move pred_{full, gvec}_reg_{offset, size} to translate-a64.h
      target/arm: Extend arm_pamax to more than aarch64
      target/arm: Check V7VE as well as LPAE in arm_pamax

 docs/conf.py                     |   2 +-
 docs/system/arm/cpu-features.rst |  56 ++++++++++
 include/qemu/accel.h             |   1 +
 target/arm/cpregs.h              |   5 +
 target/arm/cpu.h                 | 103 ++++++++++++++-----
 target/arm/helper-sme.h          |  21 ++++
 target/arm/helper.h              |   1 +
 target/arm/internals.h           |   4 +
 target/arm/syndrome.h            |  14 +++
 target/arm/translate-a64.h       |  38 +++++++
 target/arm/translate.h           |   6 ++
 accel/accel-common.c             |   8 ++
 hw/arm/virt.c                    |  10 +-
 softmmu/vl.c                     |   3 +-
 target/arm/cpu.c                 |  32 ++++--
 target/arm/cpu64.c               | 205 ++++++++++++++++++++++++++++---------
 target/arm/helper.c              | 213 +++++++++++++++++++++++++++++++++++++--
 target/arm/kvm64.c               |   2 +-
 target/arm/machine.c             |  34 +++++++
 target/arm/ptw.c                 |  26 +++--
 target/arm/sme_helper.c          |  61 +++++++++++
 target/arm/translate-a64.c       |  46 +++++++++
 target/arm/translate-sve.c       |  36 -------
 target/arm/meson.build           |   1 +
 24 files changed, 782 insertions(+), 146 deletions(-)
 create mode 100644 target/arm/helper-sme.h
 create mode 100644 target/arm/sme_helper.c

