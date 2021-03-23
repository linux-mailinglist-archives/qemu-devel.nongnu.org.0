Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C176A346174
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 15:28:41 +0100 (CET)
Received: from localhost ([::1]:39480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOi1Q-0008LO-Os
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 10:28:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lOhzr-0006WB-23
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 10:27:04 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:45635)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lOhzl-0007A3-W7
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 10:27:02 -0400
Received: by mail-wm1-x344.google.com with SMTP id
 r10-20020a05600c35cab029010c946c95easo10947882wmq.4
 for <qemu-devel@nongnu.org>; Tue, 23 Mar 2021 07:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pxPYHGRv8zHwDLQYgqJZd6OxOiklLKw2TYf41av2j44=;
 b=DHrUEPXhd3It/tjVpkjg3bJ5LPrxagsuTQ6M6yTcUV6+sziSaEHLblEKJEZk/d9p83
 WhuaPd9J4BvjK63FIgGf7D2hH2I27xJS0sk2KuGcKf71RuIID9YCsVwO/OMwxmhJZhhI
 Qwun+CHcDPWXOGfdR1atRR15rcjrfQaMRyIiplGXcmDWzgG02cQmce7RAS3VzEhqtkHi
 35C4PAP+PmO5s1yWQn7d6nlMak4uRY6APKCD5sSyc8lcOOnghfLrpv+ufUjGuiB2PLmL
 LimKXg5XJw8MjltxFnhkh4gn7fSJcPT6yv1fbGmhLaEHEnkJ0YQKJ3LDT12u0yTcE14W
 KYpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pxPYHGRv8zHwDLQYgqJZd6OxOiklLKw2TYf41av2j44=;
 b=NlNNFtLU/HkBKX9gJelUEF+xzfJ4BIy7SLgPNKiXOD6/VTbsbZFIOaYxhPLwiLGpO1
 UPFQd6JcwIYYLb501ZOygbnWsVf9NPTXjhJQFFH7FxJzsfAk1cVL9QUgJ/c/IbDPXXsF
 CMzGWHBu2vGdq3DphJB7oSVi6nrGCvDzj7nrYxW0iixQKcEcYH9BsR0aF4/CIDvEnanJ
 ua5xgnoAUavuhOZrul9XjYS8ZimPdO2vMnRT92KFStq0hUcSryw7qiPzze3S5Z/r83/t
 27/FbWNa8U/TwSv3/v+kAacZK/iYxLRrqtEXtzb8v52MK2BFkTWrDn8dqrsiFqc2LhsX
 Xvng==
X-Gm-Message-State: AOAM533JgRfQhqT+TC/Iu74AZX5cUij4Dbk2O6LHdxhWQUnyHNHPoo2U
 tusyzUD51+i6j5BoYYvzvuSFYF7LPGqt35eX
X-Google-Smtp-Source: ABdhPJxbgOfyUc1B1KO+UVcdagbA1XLsGhVJGMw+fAPHT9QGHd6lAM46Heg3w4312xCS+DRt8eMYFQ==
X-Received: by 2002:a1c:3c8a:: with SMTP id j132mr3556935wma.127.1616509615581; 
 Tue, 23 Mar 2021 07:26:55 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id a131sm2861292wmc.48.2021.03.23.07.26.54
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 07:26:55 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 0/7] target-arm queue
Date: Tue, 23 Mar 2021 14:26:46 +0000
Message-Id: <20210323142653.3538-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::344;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x344.google.com
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

Small pullreq with some bug fixes to go into rc1.

-- PMM

The following changes since commit 5ca634afcf83215a9a54ca6e66032325b5ffb5f6:

  Merge remote-tracking branch 'remotes/philmd/tags/sdmmc-20210322' into staging (2021-03-22 18:50:25 +0000)

are available in the Git repository at:

  https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20210323

for you to fetch changes up to dad90de78e9e9d47cefcbcd30115706b98e6ec87:

  target/arm: Set ARMMMUFaultInfo.level in user-only arm_cpu_tlb_fill (2021-03-23 14:07:55 +0000)

----------------------------------------------------------------
target-arm queue:
 * hw/arm/virt: Disable pl011 clock migration if needed
 * target/arm: Make M-profile VTOR loads on reset handle memory aliasing
 * target/arm: Set ARMMMUFaultInfo.level in user-only arm_cpu_tlb_fill

----------------------------------------------------------------
Gavin Shan (1):
      hw/arm/virt: Disable pl011 clock migration if needed

Peter Maydell (5):
      memory: Make flatview_cb return bool, not int
      memory: Document flatview_for_each_range()
      memory: Add offset_in_region to flatview_cb arguments
      hw/core/loader: Add new function rom_ptr_for_as()
      target/arm: Make M-profile VTOR loads on reset handle memory aliasing

Richard Henderson (1):
      target/arm: Set ARMMMUFaultInfo.level in user-only arm_cpu_tlb_fill

 include/exec/memory.h           | 32 +++++++++++++++---
 include/hw/char/pl011.h         |  1 +
 include/hw/loader.h             | 31 +++++++++++++++++
 hw/char/pl011.c                 |  9 +++++
 hw/core/loader.c                | 75 +++++++++++++++++++++++++++++++++++++++++
 hw/core/machine.c               |  1 +
 softmmu/memory.c                |  4 ++-
 target/arm/cpu.c                |  2 +-
 target/arm/tlb_helper.c         |  1 +
 tests/qtest/fuzz/generic_fuzz.c | 11 +++---
 10 files changed, 157 insertions(+), 10 deletions(-)

