Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 548AF545E66
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 10:17:11 +0200 (CEST)
Received: from localhost ([::1]:51294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzZpO-0005RI-C5
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 04:17:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nzZWM-0006Nr-AO
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 03:57:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56337)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nzZWK-0006C4-Oo
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 03:57:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654847848;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vZxTEcfc/oiDaPD6fjEHiXEYXxysVM4UQYltODL875E=;
 b=ghsjtXI2lY6nOoFfeOLehz3VmX/oLP2/TA4T7NyXAPocKwT3rAOjgdX4y/yY4agtORy0ut
 DfeUoxK6kdBjIGgSRV7wisnpVf9CpJJG5J5LYKm98RqyYXEMQNSdCdwZWFVf48lvXwpaxa
 SmUq05fKgRh5uvPZGBMozLgwvp0PluY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-463-vapPNx1zM-6VjY5vHwz3eA-1; Fri, 10 Jun 2022 03:57:26 -0400
X-MC-Unique: vapPNx1zM-6VjY5vHwz3eA-1
Received: by mail-wm1-f71.google.com with SMTP id
 bi22-20020a05600c3d9600b0039c4144992cso955657wmb.5
 for <qemu-devel@nongnu.org>; Fri, 10 Jun 2022 00:57:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=vZxTEcfc/oiDaPD6fjEHiXEYXxysVM4UQYltODL875E=;
 b=B8rleWYOfDNaLybqSK+4CtN8KKuNavbKZ5F1blKeEpg10AdWNd0H44pikRqPxgJXnG
 jta1Xb/1dC2VSznhFTzbahbCg6ywfly/gWZCPkqlfRpWBXA2k2GpLLNgsJauVvKbu+6I
 GiICc2+yDvp0KRtkdgbBrkz059Qe0NdT7mSUAnS2IyRkIxAZrBcSQmiF2ItNIGTV8nBD
 vcKKO1rnLAy4GO9ZDSoKJT2PD5B6k61Mb72DT+yMIc9DPfk2rKLOEI3Gsc+PdHiawdUf
 6aupxUWQS0v+ISuuS/hquwjcn/FiXaOsYRukrRP7oRvdykqiUg+G5M+wPTv/gZuvDkVM
 Pi1w==
X-Gm-Message-State: AOAM532hvxBLFzj/S3iHYb0j37ejZjQyh29Ts+6wIGbJtcMvFKqFOUEs
 pFm9mBxuU02CVF/q8eocukEt3+4wArn3SQ+7+xHZnVMnyZVg1efJtK1C3b1PUAPIa0CmSu8djZc
 t4GlOs611klNRD/QvtTQ00Owr8R5LzvJutrcDmY4fQP4vok+XzcR1kjoTiYs3
X-Received: by 2002:a05:600c:19cf:b0:39c:63cb:9303 with SMTP id
 u15-20020a05600c19cf00b0039c63cb9303mr7599643wmq.9.1654847845034; 
 Fri, 10 Jun 2022 00:57:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxYxh1UKPQSi6MlCUXv3zCOq1nI7eEvX1wKpe8qPTBHX8EAFiIgi+HFRkDparVHBRdAKNfWNQ==
X-Received: by 2002:a05:600c:19cf:b0:39c:63cb:9303 with SMTP id
 u15-20020a05600c19cf00b0039c63cb9303mr7599612wmq.9.1654847844714; 
 Fri, 10 Jun 2022 00:57:24 -0700 (PDT)
Received: from redhat.com ([212.116.178.142]) by smtp.gmail.com with ESMTPSA id
 c13-20020adffb0d000000b002183cf9cd69sm14222126wrr.15.2022.06.10.00.57.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jun 2022 00:57:24 -0700 (PDT)
Date: Fri, 10 Jun 2022 03:57:22 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PULL 07/54] acpi: pckbd: replace ISADeviceClass::build_aml with
 AcpiDevAmlIfClass:build_dev_aml
Message-ID: <20220610075631.367501-8-mst@redhat.com>
References: <20220610075631.367501-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220610075631.367501-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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
Message-Id: <20220608135340.3304695-8-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/input/pckbd.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/hw/input/pckbd.c b/hw/input/pckbd.c
index 4efdf75620..45c40fe3f3 100644
--- a/hw/input/pckbd.c
+++ b/hw/input/pckbd.c
@@ -29,7 +29,7 @@
 #include "qapi/error.h"
 #include "hw/isa/isa.h"
 #include "migration/vmstate.h"
-#include "hw/acpi/aml-build.h"
+#include "hw/acpi/acpi_aml_interface.h"
 #include "hw/input/ps2.h"
 #include "hw/irq.h"
 #include "hw/input/i8042.h"
@@ -767,9 +767,9 @@ static void i8042_realizefn(DeviceState *dev, Error **errp)
     qemu_register_reset(kbd_reset, s);
 }
 
-static void i8042_build_aml(ISADevice *isadev, Aml *scope)
+static void i8042_build_aml(AcpiDevAmlIf *adev, Aml *scope)
 {
-    ISAKBDState *isa_s = I8042(isadev);
+    ISAKBDState *isa_s = I8042(adev);
     Aml *kbd;
     Aml *mou;
     Aml *crs;
@@ -807,12 +807,12 @@ static Property i8042_properties[] = {
 static void i8042_class_initfn(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
-    ISADeviceClass *isa = ISA_DEVICE_CLASS(klass);
+    AcpiDevAmlIfClass *adevc = ACPI_DEV_AML_IF_CLASS(klass);
 
     device_class_set_props(dc, i8042_properties);
     dc->realize = i8042_realizefn;
     dc->vmsd = &vmstate_kbd_isa;
-    isa->build_aml = i8042_build_aml;
+    adevc->build_dev_aml = i8042_build_aml;
     set_bit(DEVICE_CATEGORY_INPUT, dc->categories);
 }
 
@@ -822,6 +822,10 @@ static const TypeInfo i8042_info = {
     .instance_size = sizeof(ISAKBDState),
     .instance_init = i8042_initfn,
     .class_init    = i8042_class_initfn,
+    .interfaces = (InterfaceInfo[]) {
+        { TYPE_ACPI_DEV_AML_IF },
+        { },
+    },
 };
 
 static void i8042_register_types(void)
-- 
MST


