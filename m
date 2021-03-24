Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CF763472C0
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 08:36:06 +0100 (CET)
Received: from localhost ([::1]:49680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOy3h-0007z7-Ia
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 03:36:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <viresh.kumar@linaro.org>)
 id 1lOy1T-0006J6-Tf
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 03:33:48 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:37446)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <viresh.kumar@linaro.org>)
 id 1lOy1S-0005ww-Dt
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 03:33:47 -0400
Received: by mail-pl1-x62d.google.com with SMTP id h20so7463542plr.4
 for <qemu-devel@nongnu.org>; Wed, 24 Mar 2021 00:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LK0GmNGUPbPNBXEhJlF2QfVGhEIlr16Wq8o08kNLbaw=;
 b=mvWiGvGNwRzTq49Yn1sv2ztMWAq4quUNViMB/4rL9g6A7L73e/KQegnLq2q82nVEs4
 LyS0RA6WKfnUgVwdsaeOfZbNudWO96A2ypF5ZMG+seCQxYFAT6z2l1HRO2UQN/iRTCdt
 jt/izgSmc/A+4XttSHDUj8yFoeuQ/Pk5XI2U2cuAS7ZdTosgvEdHrElw/uZOnw6Ab6O2
 CxBmz/4DmQt6Ni69ytOLP1k3SdJsgKf+osyafeTg0fJ+8fYv8g/la/Qz6VA7d68ApyVP
 EVGVjYsr5j3rkmNAgT9usTFpgswdJGIV16HMizHggKqJNtD6RyZfw0Zrn3JTfVQrZvxp
 cgAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LK0GmNGUPbPNBXEhJlF2QfVGhEIlr16Wq8o08kNLbaw=;
 b=ljlhNjDOH6j5GQUfN3H5m53b0PIgiseBxXw8HyNbv0xwzdROsyOtXfNJ6ihKDLj+xu
 /02X9jMZ1q+y7H7cB/zbmg+X2oYCa67gXwiG9mkqiRbWXmLDKUWyqUI+TOCb5+Xn44pK
 JdJCeBUdkX3yQ7m46IUUAVyrWYDxrpz8HFa8x+g7IRcXllV3Rz2AavdBhjqaNAUt3Y91
 G34hN0KxdLPXb6EUhBt2CHArU4FegkLsJBFCv0AQk0bEAZ9aHf9tWcuCrOWm0iVzP6OT
 /moQ9uKOFpfciNRFw499ntDI9qOvBpBxjLMcqif86KSxlHhvgBoK1TG7iNyQftFAXXaV
 T27Q==
X-Gm-Message-State: AOAM531tmZG1Vy8qkapkhVMeEgqPriypvgW78MRitkaEJqnbUQ32dicj
 MuteDyq5naQOWNhJHDbaMJI+Blmj4uBYkQ==
X-Google-Smtp-Source: ABdhPJw12sFx1s5fFTnN69zCx7U6CzU9p9cHwEhjXRUgXFdpgw/GPQXE40IuJX4k1RoknKalfcG37A==
X-Received: by 2002:a17:90a:b293:: with SMTP id
 c19mr2103523pjr.193.1616571225004; 
 Wed, 24 Mar 2021 00:33:45 -0700 (PDT)
Received: from localhost ([122.172.6.13])
 by smtp.gmail.com with ESMTPSA id v2sm1368046pjg.34.2021.03.24.00.33.44
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 24 Mar 2021 00:33:44 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/5] MAINTAINERS: Add entry for virtio-i2c
Date: Wed, 24 Mar 2021 13:03:14 +0530
Message-Id: <43b9fe06a6c23943fc6feab5c2340e38ef2359e9.1616570702.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
In-Reply-To: <cover.1616570702.git.viresh.kumar@linaro.org>
References: <cover.1616570702.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=viresh.kumar@linaro.org; helo=mail-pl1-x62d.google.com
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, Jie Deng <jie.deng@intel.com>,
 Viresh Kumar <viresh.kumar@linaro.org>, Bill Mills <bill.mills@linaro.org>,
 Arnd Bergmann <arnd.bergmann@linaro.com>, Mike Holmes <mike.holmes@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 stratos-dev@op-lists.linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch adds entry for virtio-i2c related files in MAINTAINERS.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 9147e9a429a0..3a80352fc85b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1967,6 +1967,15 @@ F: hw/virtio/virtio-mem-pci.h
 F: hw/virtio/virtio-mem-pci.c
 F: include/hw/virtio/virtio-mem.h
 
+virtio-i2c
+M: Viresh Kumar <viresh.kumar@linaro.org>
+S: Supported
+F: docs/tools/vhost-user-i2c.rst
+F: hw/virtio/vhost-user-i2c.c
+F: hw/virtio/vhost-user-i2c-pci.c
+F: include/hw/virtio/vhost-user-i2c.h
+F: tools/vhost-user-i2c/*
+
 nvme
 M: Keith Busch <kbusch@kernel.org>
 M: Klaus Jensen <its@irrelevant.dk>
-- 
2.25.0.rc1.19.g042ed3e048af


