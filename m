Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AC05545E33
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 10:10:00 +0200 (CEST)
Received: from localhost ([::1]:42938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzZiR-0007rR-Hu
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 04:09:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nzZWK-0006NM-RM
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 03:57:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33882)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nzZWI-0006Bw-LN
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 03:57:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654847845;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cLORGfaruhYv2bPWorlB7iLm1JTkrMOr7JSAOkHYBXQ=;
 b=d2PJrEmJVZ7pwr5+Dre2di5EoxrvA/m3T5fMQnvbQdsnZB4caQvrIpX/uQOPgfacynL1dw
 ozDTtc8Ds3FmiQ+4h6H6uTtkQoZh2IvK2jLLDbsjVr3DOVekcVN/T9fStbUzVv1D8Ax2vv
 QjL9ssTMp4CnZVkUKkBFGzytt0FEL84=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-526-0QoStz0wOwee4gmcPPiF0A-1; Fri, 10 Jun 2022 03:57:23 -0400
X-MC-Unique: 0QoStz0wOwee4gmcPPiF0A-1
Received: by mail-wm1-f69.google.com with SMTP id
 ay28-20020a05600c1e1c00b0039c5cbe76c1so952308wmb.1
 for <qemu-devel@nongnu.org>; Fri, 10 Jun 2022 00:57:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=cLORGfaruhYv2bPWorlB7iLm1JTkrMOr7JSAOkHYBXQ=;
 b=oq3uj3oM7Pjavo4rsTbH6uWBk0bbnRDKMr0hh/Mx7VTXxRFNvvEDr2RkzShx9U+xxr
 mvy5XSC+bY+4W1TtRlp3ycaZlq4cWk8A6vFfwke5UojpNKa3jGkRIVhJCcR3glAcisfY
 OYR66Ock6rr3bdSj0UvSZfxmv424vlSZrL8Iew9XN1rDxfKDpPjK4LAZkmAoqc9CPXUt
 0RwIU9hHbTjRJ4M6/2jTUi/Lm1y7WqJf3E/l1CdpduLOFyej5kE2g0Zs3Qk6PvjMEDLg
 B4N/Qn2eatZUmjud+zmUhNYFyYNLXpg7pBFItXZNx8rSIqwE3tg01nJV76vC0p460EXk
 F17A==
X-Gm-Message-State: AOAM532XIJGzXRDII3GBXeqLrxfivojX5yUbnEMIj7TkNXvizDngrtbP
 UDP7b1a7KnCggJaacJ2aCrHM21g+zJImjTVK8ian/eXKF7eeHp5Ftjh+0Jza8EjWsPBulnS8EdM
 v2d6+ODlAYySKIIFivMd01GvYxwhy1ZYYajhBkOp/3qcDA9Icpct/P/T7pi4Q
X-Received: by 2002:adf:e186:0:b0:213:3b79:370d with SMTP id
 az6-20020adfe186000000b002133b79370dmr41193630wrb.151.1654847842159; 
 Fri, 10 Jun 2022 00:57:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwRvyy36uljo0vNsYLNk4BSZY1HE4TD5JAR5WKLcHCvPCW5PqtJjJrQDgqnefnv4BwgQSuHrQ==
X-Received: by 2002:adf:e186:0:b0:213:3b79:370d with SMTP id
 az6-20020adfe186000000b002133b79370dmr41193601wrb.151.1654847841810; 
 Fri, 10 Jun 2022 00:57:21 -0700 (PDT)
Received: from redhat.com ([212.116.178.142]) by smtp.gmail.com with ESMTPSA id
 l15-20020a05600c4f0f00b003942a244f39sm2656763wmq.18.2022.06.10.00.57.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jun 2022 00:57:21 -0700 (PDT)
Date: Fri, 10 Jun 2022 03:57:19 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PULL 06/54] acpi: mc146818rtc: replace ISADeviceClass::build_aml
 with AcpiDevAmlIfClass:build_dev_aml
Message-ID: <20220610075631.367501-7-mst@redhat.com>
References: <20220610075631.367501-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220610075631.367501-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Igor Mammedov <imammedo@redhat.com>

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Acked-by: Gerd Hoffmann <kraxel@redhat.com>
Message-Id: <20220608135340.3304695-7-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/rtc/mc146818rtc.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/hw/rtc/mc146818rtc.c b/hw/rtc/mc146818rtc.c
index f235c2ddbe..ef9765bb8f 100644
--- a/hw/rtc/mc146818rtc.c
+++ b/hw/rtc/mc146818rtc.c
@@ -26,7 +26,7 @@
 #include "qemu/cutils.h"
 #include "qemu/module.h"
 #include "qemu/bcd.h"
-#include "hw/acpi/aml-build.h"
+#include "hw/acpi/acpi_aml_interface.h"
 #include "hw/irq.h"
 #include "hw/qdev-properties.h"
 #include "hw/qdev-properties-system.h"
@@ -1017,9 +1017,9 @@ static void rtc_reset_hold(Object *obj)
     qemu_irq_lower(s->irq);
 }
 
-static void rtc_build_aml(ISADevice *isadev, Aml *scope)
+static void rtc_build_aml(AcpiDevAmlIf *adev, Aml *scope)
 {
-    RTCState *s = MC146818_RTC(isadev);
+    RTCState *s = MC146818_RTC(adev);
     Aml *dev;
     Aml *crs;
 
@@ -1043,13 +1043,13 @@ static void rtc_class_initfn(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
     ResettableClass *rc = RESETTABLE_CLASS(klass);
-    ISADeviceClass *isa = ISA_DEVICE_CLASS(klass);
+    AcpiDevAmlIfClass *adevc = ACPI_DEV_AML_IF_CLASS(klass);
 
     dc->realize = rtc_realizefn;
     dc->vmsd = &vmstate_rtc;
     rc->phases.enter = rtc_reset_enter;
     rc->phases.hold = rtc_reset_hold;
-    isa->build_aml = rtc_build_aml;
+    adevc->build_dev_aml = rtc_build_aml;
     device_class_set_props(dc, mc146818rtc_properties);
     set_bit(DEVICE_CATEGORY_MISC, dc->categories);
 }
@@ -1059,6 +1059,10 @@ static const TypeInfo mc146818rtc_info = {
     .parent        = TYPE_ISA_DEVICE,
     .instance_size = sizeof(RTCState),
     .class_init    = rtc_class_initfn,
+    .interfaces = (InterfaceInfo[]) {
+        { TYPE_ACPI_DEV_AML_IF },
+        { },
+    },
 };
 
 static void mc146818rtc_register_types(void)
-- 
MST


