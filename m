Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E365146F41
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jan 2020 18:12:11 +0100 (CET)
Received: from localhost ([::1]:33100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iug1a-0006VL-3v
	for lists+qemu-devel@lfdr.de; Thu, 23 Jan 2020 12:12:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48354)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iueRY-0000Dt-ND
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 10:30:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iueRX-0003gl-IA
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 10:30:52 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:50264)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iueRX-0003fb-CK
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 10:30:51 -0500
Received: by mail-wm1-x32d.google.com with SMTP id a5so3022190wmb.0
 for <qemu-devel@nongnu.org>; Thu, 23 Jan 2020 07:30:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=YHdtbMY45khjtvmWy6PilEpBxwmOSqr/+Trm1VbjU/k=;
 b=kN0r8jOn2k2EbBnuHC37FLkc0sGqBGWaedKaBBKcC9T/M8F8YpA71HbPQ3pblRiGHG
 yYLMUCxOhqC+VuTp8RYszQnI31LTpZkKQZ5TIzvLv2E3ncRYJJ9uUjJdxjLaa1ZoRrVk
 QfvzPag7Tlnyjxc50pddeVh0bFzwQFzqf4j8NWkYMb/Ndfs57iNzMVIfvgiRhlhV70Rh
 rzFO0Xd9FxB5zwoQLQC1tVP0j/XQgyQT70qajV24B53BSZ4noAsWc45FnhZGUaK4V7kS
 nE1JlAMeqGzRRNh0TPQWPyvpFV/B8niEjWUkYcuB0z4+eVMupy+sBd/BJ/RYWZEfRwvm
 3KQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YHdtbMY45khjtvmWy6PilEpBxwmOSqr/+Trm1VbjU/k=;
 b=VYtN/QU0YrRNLDPGR+msWwiXesm+OxA7E21Chz28ejNIhDUlXIFh9VxRfmRKnhwLNw
 i1MyGNh6f8YUKskNb7veBwo4WPxvFA4HOVHHO8qGLDhmJkocnUcQrWBM7pw+zT8Lejc6
 CqfPTEvS1jase2y25wk1JWvAe3dw9QfxlKjzw/gjzvKf7LQW9F5tsgLHf2IGN8gn3hhV
 LeXeOm7g51UGLTzVc0pW/KaO1dJprlSTYTSCTcPNSNWvz8g3QJx+jr57APoWwryerwWW
 94do4vACdAO8oKVZraNcD7Izwf+pAReYSv/fjin/fTodohA8sZ6jPskv8/Evx9LeWuV9
 8ljg==
X-Gm-Message-State: APjAAAU2IUDNd9XKgcKT2cUi50WQvSzASjsWLOUqFbJk1MqSsXaz/PC3
 FmAXNQIBDk36tqmrnXP1r2kGy5W+XE1UUA==
X-Google-Smtp-Source: APXvYqwjxwQkroBTOvCaAEqq0yXBQRrszMHDMElE81oTp4+W7XakNG9LWroo/KzKdZVP37kfEC+yqg==
X-Received: by 2002:a1c:a406:: with SMTP id n6mr4673956wme.40.1579793450178;
 Thu, 23 Jan 2020 07:30:50 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id s139sm2903592wme.35.2020.01.23.07.30.49
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jan 2020 07:30:49 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 07/20] hw/arm: Use helper function to trigger hotplug handler
 plug
Date: Thu, 23 Jan 2020 15:30:28 +0000
Message-Id: <20200123153041.4248-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200123153041.4248-1-peter.maydell@linaro.org>
References: <20200123153041.4248-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::32d
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

From: Keqian Zhu <zhukeqian1@huawei.com>

We can use existing helper function to trigger hotplug handler
plug, which makes code clearer.

Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
Message-id: 20200120012755.44581-3-zhukeqian1@huawei.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/virt.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 39ab5f47e0b..656b0081c2c 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1934,7 +1934,6 @@ static void virt_memory_pre_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
 static void virt_memory_plug(HotplugHandler *hotplug_dev,
                              DeviceState *dev, Error **errp)
 {
-    HotplugHandlerClass *hhc;
     VirtMachineState *vms = VIRT_MACHINE(hotplug_dev);
     Error *local_err = NULL;
 
@@ -1943,8 +1942,9 @@ static void virt_memory_plug(HotplugHandler *hotplug_dev,
         goto out;
     }
 
-    hhc = HOTPLUG_HANDLER_GET_CLASS(vms->acpi_dev);
-    hhc->plug(HOTPLUG_HANDLER(vms->acpi_dev), dev, &error_abort);
+    hotplug_handler_plug(HOTPLUG_HANDLER(vms->acpi_dev),
+                         dev, &error_abort);
+
 out:
     error_propagate(errp, local_err);
 }
-- 
2.20.1


