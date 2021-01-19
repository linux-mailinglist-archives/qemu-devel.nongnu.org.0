Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EE112FB44B
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 09:39:13 +0100 (CET)
Received: from localhost ([::1]:58248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1mXg-0001XP-Bm
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 03:39:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <th.huth@gmail.com>) id 1l1mVV-0008HS-EW
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 03:36:57 -0500
Received: from mail-wm1-f49.google.com ([209.85.128.49]:35043)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <th.huth@gmail.com>) id 1l1mVT-0003Rc-P6
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 03:36:57 -0500
Received: by mail-wm1-f49.google.com with SMTP id e15so9498886wme.0
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 00:36:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UTQI37oR54GYDHZtQ+wpT20H2kBawm8mU+1wQ7QZ7Qw=;
 b=lZFvVuILz0BBVmtQzLvMTcVwFE5pdl38i5wsU3shbgujTEbT09JViXbSteUDq7Ugbx
 9IY6TQIkZkfKSE8Htfii1uINMyyoSlbN07kUSyLa9+sd/vfRUoPZF0qXo/c8OBd+Nlnb
 sjbBTJwPGBt7k+f0F5j59GGTK22Wj3DuMLCeQlwWgFOfldyukE1s2UZAR8LdSamc8L1R
 kX3Ikfp2w8JpbL+6dOGVIu3nrgucF0rbVyaTPfIy6aLiBzeeArpgXyK/Rz7PeJiVIyjP
 cRCtxSY2BgiJ+wDBXbvUoLu+cWtqhpHdJt16LKb/SD77jJI4vy3/WPGdk0fXJqMU0Klg
 YmCQ==
X-Gm-Message-State: AOAM5307UU9O2I2TV+PbVWLqYBhHsFTpbYe0YkqGu+UlZf5cF8MvFqya
 rEx2oG7RqMm3bM7Pw5esdeti0BpcHwg=
X-Google-Smtp-Source: ABdhPJx8vxCbcDqvpT4C02AYwfS5E+q20jsSzbfxnBTMB5CXNIMsEEqWbfdWzxAOv4SbQ8YndLCOlA==
X-Received: by 2002:a7b:c08f:: with SMTP id r15mr3027594wmh.22.1611045413789; 
 Tue, 19 Jan 2021 00:36:53 -0800 (PST)
Received: from localhost.localdomain (pd9e83aed.dip0.t-ipconnect.de.
 [217.232.58.237])
 by smtp.gmail.com with ESMTPSA id z14sm540833wrm.5.2021.01.19.00.36.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jan 2021 00:36:53 -0800 (PST)
From: Thomas Huth <huth@tuxfamily.org>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 01/11] hw/m68k/next-cube: Make next_irq() function static
Date: Tue, 19 Jan 2021 09:36:07 +0100
Message-Id: <20210119083617.6337-2-huth@tuxfamily.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210119083617.6337-1-huth@tuxfamily.org>
References: <20210119083617.6337-1-huth@tuxfamily.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.128.49; envelope-from=th.huth@gmail.com;
 helo=mail-wm1-f49.google.com
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

From: Peter Maydell <peter.maydell@linaro.org>

The next_irq() function is global, but isn't actually used anywhere
outside next-cube.c. Make it static.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20210115201206.17347-2-peter.maydell@linaro.org>
Signed-off-by: Thomas Huth <huth@tuxfamily.org>
---
 hw/m68k/next-cube.c         | 2 +-
 include/hw/m68k/next-cube.h | 2 --
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/hw/m68k/next-cube.c b/hw/m68k/next-cube.c
index 37bc35dfa4..f622d6589c 100644
--- a/hw/m68k/next-cube.c
+++ b/hw/m68k/next-cube.c
@@ -724,7 +724,7 @@ static const MemoryRegionOps dma_ops = {
  * TODO: set the shift numbers as values in the enum, so the first switch
  * will not be needed
  */
-void next_irq(void *opaque, int number, int level)
+static void next_irq(void *opaque, int number, int level)
 {
     M68kCPU *cpu = opaque;
     int shift = 0;
diff --git a/include/hw/m68k/next-cube.h b/include/hw/m68k/next-cube.h
index a3be2b32ab..5a56c354b8 100644
--- a/include/hw/m68k/next-cube.h
+++ b/include/hw/m68k/next-cube.h
@@ -42,6 +42,4 @@ enum next_irqs {
     NEXT_SND_I
 };
 
-void next_irq(void *opaque, int number, int level);
-
 #endif /* NEXT_CUBE_H */
-- 
2.29.2


