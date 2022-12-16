Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB0AF64F3AF
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 23:03:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6IV7-0006lu-QH; Fri, 16 Dec 2022 16:44:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p6IUJ-00067K-68
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 16:43:33 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p6IUC-0000b3-HH
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 16:43:26 -0500
Received: by mail-wm1-x32a.google.com with SMTP id ja17so2736807wmb.3
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 13:43:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=bRq697OJRpkwMKWFeobURUSNyr0IVAGEj4jxSGYd0BA=;
 b=hVWKA9fQ2t/WFzhF/LlZVMHlVn0VG9JBFIsixsL2xWnlUkVBqFUCy34yn9c1BZEHgf
 /Hb886HyO0fuuez9TQhaARasogVrq90p3AGqDYmjWqxLrdnC1zVKE2ynvAU/2JdlFhXT
 Xq1Q+zrAk4T4RBUN2sMEBTYinlyDtVBeSbVGMuWCHBVLQbrf1KlKFLjk2wwc9f70I374
 6ZG2z93ZAaBYg+iA6aIb0+43Rg7A22UQGe2pjBx/Y9zgro67W+mDYUs0a8HSQT9umZ9c
 uTqIiSMH9qeJEJV864cxVfeRJbH+60cB12e1rBAbWcTKKGexvYATHpQcTnx5J+dmgYFf
 79ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bRq697OJRpkwMKWFeobURUSNyr0IVAGEj4jxSGYd0BA=;
 b=jbCnVtRdo2HT9atZ9NV7caEX/5jtiH4/hmWAXMOmkUEgekC/mSl2/+TGVCTIGtPtky
 qIKIJbwHqkAij+/zqnxz26P17Xn+2jdWhB3/nDyYfs67y2AViL7JB7MVNBUbg+LvIPep
 jRZ0vjTmHntbwugEKyafXWz5jugdoa9GRHVMtfpATblipoVPy3jDld/m34zpQCCFofxS
 MES9Qll32V+R104ozAgx3ynuDyz0ri+KJmtWZhKNd9HO54PczPubKJPWFEC1CIE2aS/O
 saRGWHRdqOOGZCGnJStmOZYXGIZCtKPFBsZs3B4YSp0+2X+lSuaG/TH+6ap8o92nw/yY
 F7kQ==
X-Gm-Message-State: AFqh2krbhogsUtQatvDYXwXFwc0xW7UBnGHKZOJGeSx6D9bMTmKLaoid
 d5OPEnDiAfEB0SiRWT8UxPT8BgukTQAikspf
X-Google-Smtp-Source: AMrXdXtLIjFwD5oyukE4kP4wXEH8sYLuiijQXol3sthNGsPajaFF1LccfMT/bM+kVGpDNotQefOl6Q==
X-Received: by 2002:a05:600c:5126:b0:3d3:3c60:b2bb with SMTP id
 o38-20020a05600c512600b003d33c60b2bbmr5903150wms.23.1671226999786; 
 Fri, 16 Dec 2022 13:43:19 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 y7-20020a05600c364700b003d33ab317dasm4135263wmq.14.2022.12.16.13.43.18
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Dec 2022 13:43:19 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 36/36] hw/pci-host/pnv_phb3_msi: Convert TYPE_PHB3_MSI to
 3-phase reset
Date: Fri, 16 Dec 2022 21:42:44 +0000
Message-Id: <20221216214244.1391647-37-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221216214244.1391647-1-peter.maydell@linaro.org>
References: <20221216214244.1391647-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
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

Convert the TYPE_PHB3_MSI class to 3-phase reset, so we can
avoid using the device_class_set_parent_reset() function.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Tested-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-id: 20221125115240.3005559-8-peter.maydell@linaro.org
---
 include/hw/ppc/xics.h      |  2 +-
 hw/pci-host/pnv_phb3_msi.c | 15 +++++++++------
 2 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/include/hw/ppc/xics.h b/include/hw/ppc/xics.h
index 00b80b08c27..95ead0dd7c9 100644
--- a/include/hw/ppc/xics.h
+++ b/include/hw/ppc/xics.h
@@ -95,7 +95,7 @@ struct ICSStateClass {
     DeviceClass parent_class;
 
     DeviceRealize parent_realize;
-    DeviceReset parent_reset;
+    ResettablePhases parent_phases;
 
     void (*reject)(ICSState *s, uint32_t irq);
     void (*resend)(ICSState *s);
diff --git a/hw/pci-host/pnv_phb3_msi.c b/hw/pci-host/pnv_phb3_msi.c
index ae908fd9e41..41e63b066f9 100644
--- a/hw/pci-host/pnv_phb3_msi.c
+++ b/hw/pci-host/pnv_phb3_msi.c
@@ -228,12 +228,14 @@ static void phb3_msi_resend(ICSState *ics)
     }
 }
 
-static void phb3_msi_reset(DeviceState *dev)
+static void phb3_msi_reset_hold(Object *obj)
 {
-    Phb3MsiState *msi = PHB3_MSI(dev);
-    ICSStateClass *icsc = ICS_GET_CLASS(dev);
+    Phb3MsiState *msi = PHB3_MSI(obj);
+    ICSStateClass *icsc = ICS_GET_CLASS(obj);
 
-    icsc->parent_reset(dev);
+    if (icsc->parent_phases.hold) {
+        icsc->parent_phases.hold(obj);
+    }
 
     memset(msi->rba, 0, sizeof(msi->rba));
     msi->rba_sum = 0;
@@ -287,11 +289,12 @@ static void phb3_msi_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
     ICSStateClass *isc = ICS_CLASS(klass);
+    ResettableClass *rc = RESETTABLE_CLASS(klass);
 
     device_class_set_parent_realize(dc, phb3_msi_realize,
                                     &isc->parent_realize);
-    device_class_set_parent_reset(dc, phb3_msi_reset,
-                                  &isc->parent_reset);
+    resettable_class_set_parent_phases(rc, NULL, phb3_msi_reset_hold, NULL,
+                                       &isc->parent_phases);
 
     isc->reject = phb3_msi_reject;
     isc->resend = phb3_msi_resend;
-- 
2.25.1


