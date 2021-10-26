Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8114543AF46
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 11:43:07 +0200 (CEST)
Received: from localhost ([::1]:50014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfIz4-0008UW-Lq
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 05:43:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mfIxw-00075p-59
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 05:41:57 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:52963)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mfIxt-00063y-7O
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 05:41:55 -0400
Received: by mail-wm1-x335.google.com with SMTP id m42so13449247wms.2
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 02:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BmMrpYkgE/fWANKuzs5Jq3pS/XyK0/piOHbkSrbmmZU=;
 b=wvQGtyI78kw9nVM9Vxuzg3QyJMq/9aiy4ldGAHMKdGomIiCg7qV6wDxEbf81rSWemY
 evjdhYfUYQw8ayFhl4BmjlHUnMm9g43f9qQdFnhhLAKALiOw4V0dGkVGJuDWOyKdXr9N
 LueAaqqP8/CMHsa9xI3bzJyw/0TrEUH0xlgTUNN/YjnOqQ/EAhRb2OJTHtWFUWe4cb4M
 7aorBI7gnjBOupne0P0dGBtt3+0qAcRf1RPhTv/UqGZbcC29cw7O8XWqiE0/W5HyVVcs
 uWtYPqLaee9fBl8PcFM/665wYNNorNtBt9PiD50xIsx0dYUvQ+gKJW7Ovmz7uzis/gV7
 ebDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BmMrpYkgE/fWANKuzs5Jq3pS/XyK0/piOHbkSrbmmZU=;
 b=iYnsbKA+JVv2j6dXy0L6QvQ59dVAmf8YGtD7FI0//2/VJJnyduXnFewIqJZ/Z8/qG6
 1O5TMuVtVKgTqdjgQYnD7wYmCjKNSzc07Y236JYRtSVXdB2EolqD5mvOt6SSQ/a+0ZkC
 c4ki2q0ATPyN77k9EdoCcCp5MtIwZ3R6y1nBc0RQXhkZdeuaZWhFO52DbYcxe0FKBS7e
 AmSmERFzeA8iJm/SS7rKWj/3PjJZsxUgcfah25H5NOP41Kob//t+6hE9I9x29phop4xs
 wdOqPqtNPbMd6rTBtrHHZ+Kiwj3lRc9R0kDuoTYGkeyl2Pa+w12e5WETRUYT3m/48rCi
 Vqlg==
X-Gm-Message-State: AOAM532LqFMKI3ZQWcgUGzKP2/guHSHVFo0xPrIx35JWsgivSpPtZ5u+
 eRSGpySoTVJnCDI0TfInViqJcw==
X-Google-Smtp-Source: ABdhPJyGt/3oBxO4OH//6VrUutrYq+naOY7Ej8ZIdm6gN/Zh7MVuOP/SBN1GHltF8Bp4WR6s5AM9/w==
X-Received: by 2002:a05:600c:1912:: with SMTP id
 j18mr7870695wmq.173.1635241311644; 
 Tue, 26 Oct 2021 02:41:51 -0700 (PDT)
Received: from localhost.localdomain
 (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net. [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id s3sm71554wmh.30.2021.10.26.02.41.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 02:41:51 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: peter.maydell@linaro.org
Subject: [PATCH v2] hw/arm/virt: Rename default_bus_bypass_iommu
Date: Tue, 26 Oct 2021 10:37:34 +0100
Message-Id: <20211026093733.2144161-1-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=jean-philippe@linaro.org; helo=mail-wm1-x335.google.com
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
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>, qemu-devel@nongnu.org,
 qemu-stable@nongnu.org, Eric Auger <eric.auger@redhat.com>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
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
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
v2: Resending to be merged separately from the equivalent x86 fix,
    already queued by Paolo [2]. No change other than added review tag.
v1: https://lore.kernel.org/qemu-devel/20211013160607.649990-2-jean-philippe@linaro.org/

[2] https://lore.kernel.org/qemu-devel/55e7387a-4bc0-1743-1013-19c38a6ceb77@redhat.com/
---
 hw/arm/virt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index ca433adb5b..369552ad45 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2737,10 +2737,10 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
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
2.33.0


