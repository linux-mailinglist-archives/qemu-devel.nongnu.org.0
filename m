Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB8083553FF
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 14:34:51 +0200 (CEST)
Received: from localhost ([::1]:44294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTkuw-0002mi-QY
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 08:34:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lTknn-0005AM-Fy
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 08:27:28 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:38788)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lTkn2-0005kc-4P
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 08:27:25 -0400
Received: by mail-wr1-x433.google.com with SMTP id i18so10565261wrm.5
 for <qemu-devel@nongnu.org>; Tue, 06 Apr 2021 05:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=M16rCpImqFDOskMDEHXCDffahwTj59MwabnnxtsK4OY=;
 b=G8Do9tMI1VwRxDGZY7/aYYz3Hlw8q6NWcFfvNARsLOpUZDVqH7W4ud9oJwMQ6eJwQw
 Gxhfub5RoLbXDQjRlIYvbOQWxvOt0AA2mVho3ZuclFz4/j+nnGS1Z/7aOdr5tNQnKFpK
 j95S93G/1Ya+9I6uo7enC0QBFLzviY/QU5jyoi/SYhkwoSSYXTbYnxr1GGAypGm9Ic4F
 CsXPdZzttTFctCd3vHugnOL4L2nx2HAHhbcIgEc0XKprK1xd+y4cpv8owx37Fne6UH7A
 HQSH0q/kvwKD9DeAa5gV1sqFmCz1LR1UHDqxvzhkJJe55VHuMPMeV5/ss4Muk5bS+mAp
 6msw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=M16rCpImqFDOskMDEHXCDffahwTj59MwabnnxtsK4OY=;
 b=dJ4tdO+OMAnD5S41Mzakg6iK7GX0sJOPD9dGpISLLl4WEyf0Wqn0oIXctruMFYpmLn
 /R00pOGja62HxNw5xV00ysqt7VT56GHAj3Ie3sc5PNWZStI11ABos94md/uY2rSfJYKL
 R8hNmBG5GvVQQSZPLtgrt3CR9IjmTJ4YjVMZqsa1JG1UvGvZ/LmGhPsSRwxEoM1aFFDQ
 5+Gud1nn75sr6EGY1grz9KzVnH8p+3B2tr9NWSkVPsTGJGC80c2f3F0nqM/sQr0m+Rn2
 ZzuvBSSuS4kbzeh9GVe3E61wxIemNR31JrLN00LKxfrcR53iKjXHLikl2Nvd/BaZGgqC
 u/rA==
X-Gm-Message-State: AOAM533PjYdS/U5afjb5a8Rq4PfMiGHqWcjsMPVxX/7pE3EwEBh+9AEx
 OpYoWVs1ToHrhskqTuP3qlRufNAZ1xGGsgD0
X-Google-Smtp-Source: ABdhPJzdvOHCAC1GUFK3ceXzi3Xl+heWmAGUgBOinhMbsP32wdIbtDB/wvRRuhDiXkOadS3PwBdaLw==
X-Received: by 2002:adf:ce83:: with SMTP id r3mr20963241wrn.144.1617711997498; 
 Tue, 06 Apr 2021 05:26:37 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id l6sm31160252wrt.56.2021.04.06.05.26.36
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Apr 2021 05:26:37 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 0/6] target-arm queue
Date: Tue,  6 Apr 2021 13:26:29 +0100
Message-Id: <20210406122635.28268-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
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

A few patches for the rc today...

The following changes since commit 109918d24a3bb9ed3d05beb34ea4ac6be443c138:

  Merge remote-tracking branch 'remotes/nvme/tags/nvme-fixes-for-6.0-pull-request' into staging (2021-04-05 22:15:38 +0100)

are available in the Git repository at:

  https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20210406

for you to fetch changes up to 49bc76550c37f4a2b92a05cb3e6989a739d56ac9:

  Remove myself as i.mx31 maintainer (2021-04-06 11:49:15 +0100)

----------------------------------------------------------------
target-arm queue:
 * ppc/e500 and arm/virt: only add valid dynamic sysbus devices to the
   platform bus
 * update i.mx31 maintainer list
 * Revert "target/arm: Make number of counters in PMCR follow the CPU"

----------------------------------------------------------------
Chubb, Peter (Data61, Eveleigh) (1):
      Remove myself as i.mx31 maintainer

Peter Maydell (5):
      include/hw/boards.h: Document machine_class_allow_dynamic_sysbus_dev()
      machine: Provide a function to check the dynamic sysbus allowlist
      hw/arm/virt: Only try to add valid dynamic sysbus devices to platform bus
      hw/ppc/e500plat: Only try to add valid dynamic sysbus devices to platform bus
      Revert "target/arm: Make number of counters in PMCR follow the CPU"

 include/hw/boards.h  | 39 +++++++++++++++++++++++++++++++++++++++
 target/arm/cpu.h     |  1 -
 hw/arm/virt.c        |  8 ++++++--
 hw/core/machine.c    | 21 ++++++++++++++++-----
 hw/ppc/e500plat.c    |  8 ++++++--
 target/arm/cpu64.c   |  3 ---
 target/arm/cpu_tcg.c |  5 -----
 target/arm/helper.c  | 29 ++++++++++++-----------------
 target/arm/kvm64.c   |  2 --
 MAINTAINERS          |  1 -
 10 files changed, 79 insertions(+), 38 deletions(-)

