Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5D323E8CC1
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Aug 2021 11:01:50 +0200 (CEST)
Received: from localhost ([::1]:58624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDk7P-0006ms-8C
	for lists+qemu-devel@lfdr.de; Wed, 11 Aug 2021 05:01:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mDk5q-000528-7L
 for qemu-devel@nongnu.org; Wed, 11 Aug 2021 05:00:10 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:44847)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mDk5o-0003vJ-LR
 for qemu-devel@nongnu.org; Wed, 11 Aug 2021 05:00:09 -0400
Received: by mail-wr1-x42c.google.com with SMTP id x12so1965465wrr.11
 for <qemu-devel@nongnu.org>; Wed, 11 Aug 2021 02:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3qQBizcAPL+RunXn7IZ+1jfP3LDXeGB0/ACl5DPnxpE=;
 b=dptSZxwVF/YvsHzNAFeZw2PzFBqbivgpS8X5MDTo3MHSNDhOm2FZm19pgvv4bdr7g3
 hxxpEk0+P/6JaIsxrMjC3fF0dfeJfr9Ub7pHJ9ylNROr94RN4MBonD6yLyNcFyueu7P9
 DbFU8N7MNSw6sry+m5F/nZaah5Xroe4/+g3DIjV+rDA9oVKA5/CCbwtpPkJhmZCDmJTm
 Ok7CxT21e/nDm8ME2a+oYDZR/8T1e+RcVVyK9v15qnQ1OSP5UiT+rVCyUJvmOGEDINoJ
 A5GLXeVKBpI5L452B3ngly+iMHG12I41dGu6j3d3Gee8ccY9SsQT3C46zYwJ1qolEgDh
 klPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3qQBizcAPL+RunXn7IZ+1jfP3LDXeGB0/ACl5DPnxpE=;
 b=Krcp9FsXalAtEmKStnt38dPTok9ne8+GSr8Qd1ZvJ4aULgPBRKUmRC9v3bDR6DUfjW
 C5jTnBnvlhdDtEjNLxN8YcAASLclTd5FIRi7La7ms3dIha5Y/OiYRxfXy5lKbAFQCnTQ
 DRR2aQKS8RmKNQDcsU4WGK3ETzDqZ8AzniuRoLaiqjWG0cWi9xXPvxvV2Vt1BLGGqRdW
 NyYptC87M/JBUkUTJ9yA/I6XeZXwFI4w//B31Km6wnZ0lkhcJpHsfwdMvasWajx1vN2f
 fmhodpfQE2XkXQRxKwiisn2jzTg41L7JjDStGdd34qFVSeE09B2cSDMC+Qr47bHvBwHy
 h0Nw==
X-Gm-Message-State: AOAM530fyVbTIJPBvSnguMTu3X+IGOTmBQvcIZWvnR1vqJbf2dTlpKUn
 rjv0//9LnlinJ307JFZzUuRjrg==
X-Google-Smtp-Source: ABdhPJx0S9y50jqdmW+1LTdrK8pfkU2/XRrMCkHRFMUlHAHTvf7gKWUjGUAzy2e60/l1vhwMOjPnwQ==
X-Received: by 2002:a5d:4846:: with SMTP id n6mr18611226wrs.91.1628672406410; 
 Wed, 11 Aug 2021 02:00:06 -0700 (PDT)
Received: from localhost.localdomain (adsl-84-226-111-173.adslplus.ch.
 [84.226.111.173])
 by smtp.gmail.com with ESMTPSA id q5sm26227538wrx.33.2021.08.11.02.00.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Aug 2021 02:00:05 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: pbonzini@redhat.com
Subject: [PATCH 1/2] hw/arm/virt: Rename default_bus_bypass_iommu
Date: Wed, 11 Aug 2021 10:58:42 +0200
Message-Id: <20210811085842.2511545-1-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=jean-philippe@linaro.org; helo=mail-wr1-x42c.google.com
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
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>, armbru@redhat.com,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since commit d8fb7d0969d5 ("vl: switch -M parsing to keyval"), machine
parameter definitions cannot use underscores, because keyval_dashify()
transforms them to dashes and the parser doesn't find the parameter.

This affects option default_bus_bypass_iommu which was introduced in the
same release:

$ qemu-system-aarch64 -M virt,default_bus_bypass_iommu=on
qemu-system-aarch64: Property 'virt-6.1-machine.default-bus-bypass-iommu' not found

Rename the parameter to "default-bus-bypass-iommu". Passing
"default_bus_bypass_iommu" is still valid since the underscore are
transformed automatically.

Fixes: 6d7a85483a06 ("hw/arm/virt: Add default_bus_bypass_iommu machine option")
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 hw/arm/virt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index b4598d3fe6..7075cdc15e 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2671,10 +2671,10 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
                                           "Set the IOMMU type. "
                                           "Valid values are none and smmuv3");
 
-    object_class_property_add_bool(oc, "default_bus_bypass_iommu",
+    object_class_property_add_bool(oc, "default-bus-bypass-iommu",
                                    virt_get_default_bus_bypass_iommu,
                                    virt_set_default_bus_bypass_iommu);
-    object_class_property_set_description(oc, "default_bus_bypass_iommu",
+    object_class_property_set_description(oc, "default-bus-bypass-iommu",
                                           "Set on/off to enable/disable "
                                           "bypass_iommu for default root bus");
 
-- 
2.32.0


