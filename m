Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6411F2FB44C
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 09:39:13 +0100 (CET)
Received: from localhost ([::1]:58216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1mXg-0001Wi-DN
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 03:39:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <th.huth@gmail.com>) id 1l1mVV-0008HT-Fx
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 03:36:57 -0500
Received: from mail-wr1-f41.google.com ([209.85.221.41]:42088)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <th.huth@gmail.com>) id 1l1mVT-0003R1-A7
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 03:36:57 -0500
Received: by mail-wr1-f41.google.com with SMTP id m4so18815341wrx.9
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 00:36:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Qbd3uRup0liNXicJnrMPcveN1/VaEWxOq7+Ev6ZyREM=;
 b=JebxMztFgup2DtRO4+GcjyWeNRjrl574xDfLxKubu2fE8+8vqFXbNHdNCEgT2WRE+A
 BvJE8lO4ztV8aeF6PB/wX0DAH5aY6q+dFjSiv8mKqWm06FeEfeMXL0Z6dn04LSKeW76Q
 YsRCL/atVu4PB2CvZOzOq6bd751eeGUug+34Ou3C7RvwKVFxmxFUsGR8kFxPYVRZ2mSC
 h8KyIDRb8Tg8gJiaqnrNkzGBh3+BAKvs0B2A8trEUa4DAUztIwB811O6rkmcqDMMXaMZ
 Cmol5rZVigTWf4Paug2hhyevoCsxJN4BZsYYaEkwrLO3a4jMOTYGjJf/F9GGMIUcTYUQ
 yxDQ==
X-Gm-Message-State: AOAM530CViy0fI2Ts0p0OD5XS8nanSRiDg21Qrz8jjPYbrxS4KaPBJS+
 JVYFFq3aSBcvZiXFXK1fpXzvFkXhahs=
X-Google-Smtp-Source: ABdhPJxAiMlGyx+xsSQrR3SLAQ6Bl7VFyK10/rG0CE2ZBeq/SmSlIw+GFIM6g4pmRg3Rg0SuNebZuQ==
X-Received: by 2002:a5d:4e8c:: with SMTP id e12mr3032052wru.321.1611045413155; 
 Tue, 19 Jan 2021 00:36:53 -0800 (PST)
Received: from localhost.localdomain (pd9e83aed.dip0.t-ipconnect.de.
 [217.232.58.237])
 by smtp.gmail.com with ESMTPSA id z14sm540833wrm.5.2021.01.19.00.36.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jan 2021 00:36:52 -0800 (PST)
From: Thomas Huth <huth@tuxfamily.org>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 00/11] m68k next-cube patches
Date: Tue, 19 Jan 2021 09:36:06 +0100
Message-Id: <20210119083617.6337-1-huth@tuxfamily.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.221.41; envelope-from=th.huth@gmail.com;
 helo=mail-wr1-f41.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.248, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

 Hi Peter,

the following changes since commit e43d564fa3a0d1e133935c8180ad4f4ccf699f33:

  Merge remote-tracking branch 'remotes/vivier2/tags/trivial-branch-for-6.0-pull-request' into staging (2021-01-18 15:19:06 +0000)

are available in the Git repository at:

  https://gitlab.com/huth/qemu.git tags/pull-request-2021-01-19

for you to fetch changes up to 41da32471183d7ca4756ad3ed8bb11c1d0c37a32:

  hw/m68k/next-cube: Add missing header comment to next-cube.h (2021-01-19 09:11:52 +0100)

----------------------------------------------------------------
* Refactor next-cube interrupt and register handling into a proper QOM device
----------------------------------------------------------------

Peter Maydell (11):
      hw/m68k/next-cube: Make next_irq() function static
      hw/m68k/next-cube: Move register/interrupt functionality into a device
      hw/m68k/next-cube: Move mmio_ops into NeXTPC device
      hw/m68k/next-cube: Move scr_ops into NeXTPC device
      hw/m68k/next-cube: Make next_irq take NeXTPC* as its opaque
      hw/m68k/next-cube: Move int_status and int_mask to NeXTPC struct
      hw/m68k/next-cube: Make next_irq GPIO inputs to NEXT_PC device
      hw/m68k/next-cube: Move rtc into NeXTPC struct
      hw/m68k/next-cube: Remove unused fields from NeXTState
      hw/m68k/next-cube: Add vmstate for NeXTPC device
      hw/m68k/next-cube: Add missing header comment to next-cube.h

 hw/m68k/next-cube.c         | 239 +++++++++++++++++++++++++++++---------------
 include/hw/m68k/next-cube.h |  15 ++-
 2 files changed, 169 insertions(+), 85 deletions(-)

