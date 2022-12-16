Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6352A64F3BB
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 23:09:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6IU7-00062J-7R; Fri, 16 Dec 2022 16:43:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p6ITn-0005vt-43
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 16:43:00 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p6ITi-0000aj-Gb
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 16:42:52 -0500
Received: by mail-wm1-x329.google.com with SMTP id bg10so2757352wmb.1
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 13:42:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=w2wDSdFPCVKSJxok1ajjwKeJYPQLxC628rf9HNcdV6c=;
 b=TriZc+aSjCoL2CAUEgtfCW8ynwCVA4rO5WOuNzijboXViEUhZcyT+LUJYQhyo4b8QX
 HFPMSR+F4qAz6WZPZUe493k7a11q0KRxwSfcfnn6MPi73hyjQrXlR4ZoKFq7vhLGZCzi
 MTxE1jbwSa0ui7KOkrvc0fEqxNvfThMZ3sNPvCpdjqZewL8ANVE5RelYPIGINZz1T5uj
 SfFam0Aarb2Z7I6SDsSUGmiZHHerS6UMhlL9lwZk7jQZW7OcpaMMxuwoUJobWPpgXmoV
 l+cNS01L1KkSa+bb9l+aTnB0411gSQJkMGFmfK6YbDSPASasYpSdU6RRdovJ+pQo+MWt
 PAjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=w2wDSdFPCVKSJxok1ajjwKeJYPQLxC628rf9HNcdV6c=;
 b=R+VMNlBCoDsoROThmY4nFe4jTJH32Dw69/qLtdu/jiNhHMipL30ZldFS64vAbgMJkL
 e5i++EGAFlvTYNza9QYUSHALI/pgmVEYJH5yhY8xsq4pFj8O+PALvXtQ8OuWyjM7aelR
 yM6lT4zk1LqNxhVe919DxYAXfU/RTrbjgvGc/A0RfbPmy95UoPp2uh7pl+OO7p6QUJug
 o+HWYxCj7pBxazOJKVwMnm5QNNrWAqf39CxYbOzFhaibZiE0uEN9y5HXwMnkMVJPZmBx
 Bk9CdznDSu/WpYmkJNt0CT0OBDHl/sCHpe1dLyegEQd7V5D1iJOfbXkNzqJi88VknCLH
 FrzA==
X-Gm-Message-State: ANoB5plWeoMpmo7fgNTE9VfjxUp6HbSR31cE9CYn9/Ya/xstkapqaU1f
 jrV5eRxwdsEFWZoFwZ5b9pj1OrLn36FftAkf
X-Google-Smtp-Source: AA0mqf65fJ/7YT2cJDuEKzVG4KWIiPg4lCl66WrQ1YiEtVLICQfzAmLmRRcwf6RUFiNe3BOLac6Siw==
X-Received: by 2002:a05:600c:4451:b0:3cf:894d:1d06 with SMTP id
 v17-20020a05600c445100b003cf894d1d06mr27935399wmn.30.1671226968110; 
 Fri, 16 Dec 2022 13:42:48 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 y7-20020a05600c364700b003d33ab317dasm4135263wmq.14.2022.12.16.13.42.47
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Dec 2022 13:42:47 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 02/36] pci: Use device_cold_reset() and bus_cold_reset()
Date: Fri, 16 Dec 2022 21:42:10 +0000
Message-Id: <20221216214244.1391647-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221216214244.1391647-1-peter.maydell@linaro.org>
References: <20221216214244.1391647-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

In the PCI subsystem we currently use the legacy function
qdev_reset_all() and qbus_reset_all().  These perform a recursive
reset, starting from either a qbus or a qdev.  However they do not
permit any of the devices in the tree to use three-phase reset,
because device reset goes through the device_legacy_reset() function
that only calls the single DeviceClass::reset method.

Switch to using the device_cold_reset() and bus_cold_reset()
functions.  These also perform a recursive reset, where first the
children are reset and then finally the parent, but they use the new
(...in 2020...) Resettable mechanism, which supports both the old
style single-reset method and also the new 3-phase reset handling.

This should be a no-behaviour-change commit which just reduces the
use of a deprecated API.

Commit created with:
 sed -i -e 's/qdev_reset_all/device_cold_reset/g;s/qbus_reset_all/bus_cold_reset/g' hw/pci/*.c

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/pci/pci.c        | 6 +++---
 hw/pci/pci_bridge.c | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index e6292d8060b..c61348dca01 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -378,14 +378,14 @@ static void pci_do_device_reset(PCIDevice *dev)
  */
 void pci_device_reset(PCIDevice *dev)
 {
-    qdev_reset_all(&dev->qdev);
+    device_cold_reset(&dev->qdev);
     pci_do_device_reset(dev);
 }
 
 /*
  * Trigger pci bus reset under a given bus.
- * Called via qbus_reset_all on RST# assert, after the devices
- * have been reset qdev_reset_all-ed already.
+ * Called via bus_cold_reset on RST# assert, after the devices
+ * have been reset device_cold_reset-ed already.
  */
 static void pcibus_reset(BusState *qbus)
 {
diff --git a/hw/pci/pci_bridge.c b/hw/pci/pci_bridge.c
index da34c8ebcd1..b2b180edd61 100644
--- a/hw/pci/pci_bridge.c
+++ b/hw/pci/pci_bridge.c
@@ -275,7 +275,7 @@ void pci_bridge_write_config(PCIDevice *d,
     newctl = pci_get_word(d->config + PCI_BRIDGE_CONTROL);
     if (~oldctl & newctl & PCI_BRIDGE_CTL_BUS_RESET) {
         /* Trigger hot reset on 0->1 transition. */
-        qbus_reset_all(BUS(&s->sec_bus));
+        bus_cold_reset(BUS(&s->sec_bus));
     }
 }
 
-- 
2.25.1


