Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64C4A59C07E
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Aug 2022 15:27:54 +0200 (CEST)
Received: from localhost ([::1]:58570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQ7T6-0004Hl-T9
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 09:27:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oQ7PQ-0005oq-1y
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 09:24:04 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:40813)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oQ7PO-0001dP-8M
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 09:24:03 -0400
Received: by mail-wr1-x429.google.com with SMTP id h5so12399957wru.7
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 06:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=pIy10pkV/qSrGBev3njdPMpeM5s94Dv8TShU4GCav8Y=;
 b=nCVRTB0KBrQXAulwcR9D0rvdulg9LloJEko2Bc066/NMOdthG8CysHuXspLvrcodMX
 Yjc3jL7/7VLyZvM7Kf/ydaqqjBeP6QsIOiOnnfgr08/4ar9w4pmypRt4sQvzQLR0dx26
 9Nx9nRwSS9uduLMLSdscX4PRijFetglc/nz4R2QPmNj4LXNidaaX9zGQETRKY417BOPW
 MfXXCVC0exDpSLULBEU8FQR9qey6hbiOb7ZjUgbC8IHtLhSxZXLVbifK6g/iwzzW8oCV
 5EOrzVTXevfM7W8OMetJ8hOHbHBZTmhtQ17Re66/zC1+ageY5PouuIMfcjqwcn3wsA0t
 PtNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=pIy10pkV/qSrGBev3njdPMpeM5s94Dv8TShU4GCav8Y=;
 b=ZhnMrIBj9YxIH8gGRwSTED5PWN8gFEyU0lVGaB+AlJg5JP96miwKg3F1s3zpM58qnt
 vyC7KWQfTOXAkQIukiW9sA2Co+ZZUixncDqSq8Q3IuyEhGAJiWbKOhw0287kmUcgSUxr
 Boq94JhzOiVfBByuwHJRbigc6eZ+kU9yDcGyusSlv+FDzwD3D0V2fm2tHbH7cyxYPx4j
 RbRMsT+QAtKguw5lASSUuX2JeDdi1UrOwuRCOLUQHHXak3RK2DGizDr4pX2nLvECGvkE
 DgJpT8DqJVH8gCO1UjQKgjd/1E1LfNmXJ7c9txBWHxDtFgaJx/41kQs9zQnnfQZOKNzf
 Boww==
X-Gm-Message-State: ACgBeo0vcj4Z0k+dpVSwLEM7BkyodY6Tnd0GOhR2WTRUMwNfrdg4slNQ
 EqNsruHj8fg0yS6F8NKBZ5V9sg==
X-Google-Smtp-Source: AA6agR4u7L7UUR/hgD3o2X/NYPj43eIhGpyDD5Yv/eXJilleuMZhS7TNzaRUGjcu+17ICfP4D4Uwiw==
X-Received: by 2002:a05:6000:1a88:b0:225:5f70:9a1 with SMTP id
 f8-20020a0560001a8800b002255f7009a1mr1441172wry.209.1661174640756; 
 Mon, 22 Aug 2022 06:24:00 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 f12-20020adff98c000000b0021f13097d6csm11527946wrr.16.2022.08.22.06.23.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 06:23:59 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 00/10] target/arm: Implement FEAT_PMUv3p5
Date: Mon, 22 Aug 2022 14:23:48 +0100
Message-Id: <20220822132358.3524971-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
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

This patchset implements the Armv8.5 feature FEAT_PMUv3p5, which is
a set of minor enhancements to the PMU:
 * EL2 and EL3 can now prohibit the cycle counter from counting
   when in EL2 or when Secure, using new MDCR_EL2.HCCD and
   MDCR_EL3.SCCD bits
 * event counters are now 64 bits, with the overflow detection
   configurably at the 32 bit or 64 bit mark

It also fixes a set of bugs in the existing PMU emulation which I
discovered while trying to test my additions.

This is of course all intended for 7.2.

Changes v1->v2:
 * fixed indent error, comment typo
 * a non-change: opted not to use bitwise |= for bool
 * fixed patch 8 to implement MDCR_EL3.SCCD, not some
   weird mix of MCCD and SCCD
 * update emulation.rst to note feature is implemented

Patch 8 is the only one that needs review.

thanks
-- PMM

Peter Maydell (10):
  target/arm: Don't corrupt high half of PMOVSR when cycle counter
    overflows
  target/arm: Correct value returned by pmu_counter_mask()
  target/arm: Don't mishandle count when enabling or disabling PMU
    counters
  target/arm: Ignore PMCR.D when PMCR.LC is set
  target/arm: Honour MDCR_EL2.HPMD in Secure EL2
  target/arm: Detect overflow when calculating next PMU interrupt
  target/arm: Rename pmu_8_n feature test functions
  target/arm: Implement FEAT_PMUv3p5 cycle counter disable bits
  target/arm: Support 64-bit event counters for FEAT_PMUv3p5
  target/arm: Report FEAT_PMUv3p5 for TCG '-cpu max'

 docs/system/arm/emulation.rst |   1 +
 target/arm/cpu.h              |  37 +++++--
 target/arm/internals.h        |   5 +-
 target/arm/cpu64.c            |   2 +-
 target/arm/cpu_tcg.c          |   2 +-
 target/arm/helper.c           | 198 +++++++++++++++++++++++++++-------
 6 files changed, 192 insertions(+), 53 deletions(-)

-- 
2.25.1


