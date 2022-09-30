Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 264DC5F0CA2
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Sep 2022 15:45:02 +0200 (CEST)
Received: from localhost ([::1]:51554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeGK5-0003Dq-6R
	for lists+qemu-devel@lfdr.de; Fri, 30 Sep 2022 09:45:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oeGAh-00007e-V5
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 09:35:21 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:39889)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oeGAf-0006TJ-54
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 09:35:18 -0400
Received: by mail-wr1-x434.google.com with SMTP id f11so4225672wrm.6
 for <qemu-devel@nongnu.org>; Fri, 30 Sep 2022 06:35:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date;
 bh=qXjvnFqlcj1oGUt7FPt68kfyCx7LXoJuTxfpZUjysL8=;
 b=p+XcNklmJMWhg434RQyO/bmmKl129qhtAQeJiuP8eD8k2hUgFQs+JLs5I8ZxprMGTL
 zR2cVG5ubpIKQbd10wdYAXCGHUuHHLrjXbjW6UByovTLRbNgWFdtjZACQyefM1cMszAK
 NuPCv9HyNLeq10kcexXZvP10Gk9LOyngn3+bJCPA61XBXeLV892lHRJp46wjaWLBR9Yd
 vZMhaATTtdE0zvvpAAj91wRWicdyqgzhf5at/NTJxtU1FQJ9muVKMWUSvet4TUEaw++v
 SGei4yqddTdb7eZGaoyrz+pnQKbqhpZFDzWdFu9eYk9Jm+Gf+RnKbWGjWEjHuq2EflV4
 cPtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date;
 bh=qXjvnFqlcj1oGUt7FPt68kfyCx7LXoJuTxfpZUjysL8=;
 b=M0MEPPlExn4OpGY9zTYSEpYUxeN75ChpbUnIugVRkFPlP+25AfVIGH33C3kvxsPYgm
 HF6oh/6tG5F192LkOKzhtZ7VBm1gZf39izeD1z15P46sSJjaYRgncEvDq4+7wUKVtLmz
 jNmkph1GnRgfzpCn/7pvms7/NomgNeIGqd2VmO6KXOoSB8EPkKDn15n4Uey5sU/mF/02
 UZpOAiHB6EpIVL2CX43BCJ30Huwr8sgQo/xEFtDj2A7GfzYXXojEdIqrm9PLbX9sPb1q
 aeeC5+TuqJ58xcwLlZv85Kt37J7DNJOtpid+ZAcQtQrKrRvvCLf/DNSC9rrRirUuT8r0
 PkhA==
X-Gm-Message-State: ACrzQf1pLnB/AlmDoezpKZ4w2fCw8bxBhni0KOiJFexk2DZMVZWzMAjg
 5fLJ5R6xAMV/lRoeTaFLm7g6WXmSEujAvw==
X-Google-Smtp-Source: AMsMyM62sfSkW82YtsCendtfFGAjnkDxrybwaejn/gI5lWbfljlMhLj6S28gcofmbGeE338iCh3cNA==
X-Received: by 2002:a5d:5846:0:b0:22a:f7d2:9045 with SMTP id
 i6-20020a5d5846000000b0022af7d29045mr6125698wrf.250.1664544914088; 
 Fri, 30 Sep 2022 06:35:14 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 q12-20020adfcd8c000000b0021e4829d359sm1982551wrj.39.2022.09.30.06.35.13
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Sep 2022 06:35:13 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 00/10] target-arm queue
Date: Fri, 30 Sep 2022 14:35:01 +0100
Message-Id: <20220930133511.2112734-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi; not so many patches in this one, but notably it includes the
fix for various Avocado CI tests failing (incorrectly reported by
Avocado as a timeout, but really a QEMU exit-with-error).

thanks
-- PMM

The following changes since commit c8de6ec63d766ca1998c5af468483ce912fdc0c2:

  Merge tag 'pull-request-2022-09-28' of https://gitlab.com/thuth/qemu into staging (2022-09-28 17:04:11 -0400)

are available in the Git repository at:

  https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20220930

for you to fetch changes up to beeec926d24aac28f95cc7694ef3837d7a4cd3bb:

  target/arm: mark SP_EL1 with ARM_CP_EL3_NO_EL2_KEEP (2022-09-29 18:01:09 +0100)

----------------------------------------------------------------
target-arm queue:
 * Fix breakage of icount mode when guest touches MDCR_EL3, MDCR_EL2,
   PMCNTENSET_EL0 or PMCNTENCLR_EL0
 * Make writes to MDCR_EL3 use PMU start/finish calls
 * Let AArch32 write to SDCR.SCCD
 * Rearrange cpu64.c so all the CPU initfns are together
 * hw/arm/xlnx-zynqmp: Connect ZynqMP's USB controllers
 * hw/arm/virt: fix some minor issues with generated device tree
 * Fix regression where EL3 could not write to SP_EL1 if there is no EL2

----------------------------------------------------------------
Francisco Iglesias (1):
      hw/arm/xlnx-zynqmp: Connect ZynqMP's USB controllers

Jean-Philippe Brucker (4):
      hw/arm/virt: Fix devicetree warning about the root node
      hw/arm/virt: Fix devicetree warning about the GIC node
      hw/arm/virt: Use "msi-map" devicetree property for PCI
      hw/arm/virt: Fix devicetree warning about the SMMU node

Jerome Forissier (1):
      target/arm: mark SP_EL1 with ARM_CP_EL3_NO_EL2_KEEP

Peter Maydell (4):
      target/arm: Mark registers which call pmu_op_start() as ARM_CP_IO
      target/arm: Make writes to MDCR_EL3 use PMU start/finish calls
      target/arm: Update SDCR_VALID_MASK to include SCCD
      target/arm: Rearrange cpu64.c so all the CPU initfns are together

 include/hw/arm/xlnx-zynqmp.h |   3 +
 target/arm/cpu.h             |   8 +-
 hw/arm/virt.c                |   8 +-
 hw/arm/xlnx-zynqmp.c         |  36 +++
 target/arm/cpu64.c           | 712 +++++++++++++++++++++----------------------
 target/arm/helper.c          |  32 +-
 6 files changed, 427 insertions(+), 372 deletions(-)

