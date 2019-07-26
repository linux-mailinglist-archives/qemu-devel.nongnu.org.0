Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8F7076C7B
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Jul 2019 17:20:41 +0200 (CEST)
Received: from localhost ([::1]:41072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hr21P-0002FQ-5s
	for lists+qemu-devel@lfdr.de; Fri, 26 Jul 2019 11:20:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37487)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hr20k-0000lR-HJ
 for qemu-devel@nongnu.org; Fri, 26 Jul 2019 11:19:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hr20j-0006uQ-6l
 for qemu-devel@nongnu.org; Fri, 26 Jul 2019 11:19:58 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:33279)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hr20i-0006qf-P4
 for qemu-devel@nongnu.org; Fri, 26 Jul 2019 11:19:57 -0400
Received: by mail-wr1-x441.google.com with SMTP id n9so54937089wru.0
 for <qemu-devel@nongnu.org>; Fri, 26 Jul 2019 08:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7uIz+LSSoeCrJ2fwjZ8GZL3iHsWasPuz5qBkhzBsUfY=;
 b=BsUW30u0MoD3W/VX/xjM8Qaey/mAod+qWPW6g9VHN19RRO9Eh+TZoC0k6/AlxdG69j
 H9YOpIz1s/Z8P5njKYP/868DhOjP8KhCzvBh9E1ghBnsRHGzV4KJuUOAqts7VCfqupnL
 1UzYKhbWHJE5mMawbUvrtUod1HKyQnkCUKQKvFMc8dFGnmaFl7UXsY9X5agTSlfnOEkq
 YyzlRUEo+jLikD8on2QK8+mJc/i+HYNbC2h5LQkbJIYl0QIwK5ZjfO63+retszHkfWJD
 JShsIpurIIrPc2oeygTKFjDABYf9NopMazIsU73qjgHDPaGfLEJBBayrPw14zU/wAKnU
 7DGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7uIz+LSSoeCrJ2fwjZ8GZL3iHsWasPuz5qBkhzBsUfY=;
 b=cDw/lk9KAsM0dobhHbg6v4U++zvoEDPRjSoDSyKYxi1lqWlN9mBvuzlJmapoOThLXo
 emumNAEhU6kTY30DjGX38keIbn3bJc6/Hmn/oizKOvzFNrEUfx4oAhpqSko+W+mUWiq0
 wQc5b9yAEQVFcPbBUDfM+1EdQHLSViflEZ66y62p9+T5XmSoEJ408fqMAvs8Pybej0cY
 D05mLzRqN0X6MA3dZ/r/NdkiyOc9DRz3EUwpUAbxpbUpOBYDEcc7MipdvGMnIrkIfrnJ
 +F9EJJJRD/8tL30nDSPO/2BhyS6yOnhRoFoQvc4YmtQFC8Kau0V1mF/OpcmH57lzfgpX
 l4kQ==
X-Gm-Message-State: APjAAAVPnKRnlnjy+gfUfmA2s7JIHjKJQ/+0WVfNuUwKuqWJYIJiMPNv
 yh7QgBl1zrjlU8SN5+BoXBH7gz/9UeN5Ng==
X-Google-Smtp-Source: APXvYqz7uneu9mb/1HreTOKQSjaYleSot1ny8CQROXdNVb9uTwkZOVghrXi6WKNoceonpuWReHpZPQ==
X-Received: by 2002:a5d:428a:: with SMTP id k10mr15982565wrq.329.1564154394866; 
 Fri, 26 Jul 2019 08:19:54 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id v16sm32746844wrn.28.2019.07.26.08.19.53
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 26 Jul 2019 08:19:54 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Fri, 26 Jul 2019 16:19:47 +0100
Message-Id: <20190726151952.1932-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::441
Subject: [Qemu-devel] [PULL 0/5] target-arm queue
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

Handful of bug fixes to sneak in before rc3.

thanks
-- PMM

The following changes since commit c985266ea5b50e46e07b3568c1346e10064205c9:

  Merge remote-tracking branch 'remotes/cohuck/tags/s390x-20190726' into staging (2019-07-26 13:52:06 +0100)

are available in the Git repository at:

  https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20190726

for you to fetch changes up to 67505c114e6acc26f3a1a2b74833c61b6a34ff95:

  hw/arm/boot: Further improve initrd positioning code (2019-07-26 16:17:56 +0100)

----------------------------------------------------------------
target-arm queue:
 * Fix broken migration on pl330 device
 * Fix broken migration on stellaris-input device
 * Add type checks to vmstate varry macros to avoid this class of bugs
 * hw/arm/boot: Fix some remaining cases where we would put the
   initrd on top of the kernel image

----------------------------------------------------------------
Damien Hedde (1):
      pl330: fix vmstate description

Peter Maydell (4):
      stellaris_input: Fix vmstate description of buttons field
      vmstate.h: Type check VMSTATE_STRUCT_VARRAY macros
      hw/arm/boot: Rename elf_{low, high}_addr to image_{low, high}_addr
      hw/arm/boot: Further improve initrd positioning code

 include/migration/vmstate.h | 30 ++++++++++++++++++++++++------
 hw/arm/boot.c               | 37 +++++++++++++++++++++++++++----------
 hw/dma/pl330.c              | 17 +++++++++--------
 hw/input/stellaris_input.c  | 10 ++++++----
 4 files changed, 66 insertions(+), 28 deletions(-)

