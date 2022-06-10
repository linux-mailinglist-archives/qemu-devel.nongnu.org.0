Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A39CC545E5A
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 10:16:42 +0200 (CEST)
Received: from localhost ([::1]:49976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzZov-0004S2-Fu
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 04:16:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nzZWH-0006L3-C9
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 03:57:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60613)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nzZWE-0006Bl-Gb
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 03:57:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654847842;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8p3UZMvp53oc6TrQpok0PBaJsGrimApsLOLod59ne8I=;
 b=Cb0LPDqbdm4pshRI+tTQuzVxyO4eCchO8n9aouDweVGAHEvynZa3GAnaO9JJ8CmQz+X8Lb
 cJ7Mx117z3eEgkQV88p7xzs3ctmiVjYtuP5KmDuo0QDVR4Mfncj9J8LLbTuNUB9XrIugWg
 kMp2l39j0Qjq3A/7+eSAWyoQCtWTxn4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-92-TEbBjkbqNJedg2PRHzc1NQ-1; Fri, 10 Jun 2022 03:57:20 -0400
X-MC-Unique: TEbBjkbqNJedg2PRHzc1NQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 p18-20020a05600c23d200b0039c40c05687so6229083wmb.2
 for <qemu-devel@nongnu.org>; Fri, 10 Jun 2022 00:57:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=8p3UZMvp53oc6TrQpok0PBaJsGrimApsLOLod59ne8I=;
 b=5si/C60oT27IG0VIhWMFy+1vdxL1bMdWs1usTlZfh5PxxyLVJZ2iP2uiBGWIbV5DM2
 IEzuCMH26NAlBVfDdTBmz5blpw4KO8WAKl5wZdbzz9oPciWchcxAT5AyI68Dhpq2NvOh
 Z7EDWGbzkEgpVGiP6WJCCyM1hkeniUSNv6KHsSiR9uYaloQ7cNOpHt3lGIwMoNRPza+/
 utzl6EOO6zwKPWPwLa4nG/xnw4Z9RQMDedxFbuNZJvxn1xZMLQKFIAx35XFvDnGv5JK6
 GwJR9ag7RRt6zO7sYbVMHB2xL2hDBVX4Xn5Rwgxr/mqgSIR6K9mMXnLatBv0QIQEggLJ
 RzxA==
X-Gm-Message-State: AOAM5301U5vcmX4rvdH6+xoTx8bNLQQug0ng7wIQV8i1jpnThnDoIiV6
 t0d8R0RjbtWzgQ1GHOv/TrEm64UK5kfoESmmmB1Sq34mIV7MT01wizVIJiayUsybUE4QZa2cefw
 AV9BQYsLMgeYaItigI6vYhu40TzSBHTJOwazgQ7Ar4FphI0xKfENW2NfCYbLE
X-Received: by 2002:a5d:62c7:0:b0:216:fa41:2f81 with SMTP id
 o7-20020a5d62c7000000b00216fa412f81mr30700194wrv.249.1654847839204; 
 Fri, 10 Jun 2022 00:57:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxJzzlbe0XREW4OivmvtwBnjRhBcjHnkBkYJW7T1avOB5e4BhPeO0Jl5toexgEmtikUu3tkkQ==
X-Received: by 2002:a5d:62c7:0:b0:216:fa41:2f81 with SMTP id
 o7-20020a5d62c7000000b00216fa412f81mr30700174wrv.249.1654847838928; 
 Fri, 10 Jun 2022 00:57:18 -0700 (PDT)
Received: from redhat.com ([212.116.178.142]) by smtp.gmail.com with ESMTPSA id
 16-20020a05600c231000b0039c463e909asm1984721wmo.18.2022.06.10.00.57.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jun 2022 00:57:18 -0700 (PDT)
Date: Fri, 10 Jun 2022 03:57:16 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Subject: [PULL 05/54] acpi: serial-is: replace ISADeviceClass::build_aml with
 AcpiDevAmlIfClass:build_dev_aml
Message-ID: <20220610075631.367501-6-mst@redhat.com>
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
Message-Id: <20220608135340.3304695-6-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/char/serial-isa.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/hw/char/serial-isa.c b/hw/char/serial-isa.c
index 7a7ed239cd..141a6cb168 100644
--- a/hw/char/serial-isa.c
+++ b/hw/char/serial-isa.c
@@ -27,7 +27,7 @@
 #include "qapi/error.h"
 #include "qemu/module.h"
 #include "sysemu/sysemu.h"
-#include "hw/acpi/aml-build.h"
+#include "hw/acpi/acpi_aml_interface.h"
 #include "hw/char/serial.h"
 #include "hw/isa/isa.h"
 #include "hw/qdev-properties.h"
@@ -83,9 +83,9 @@ static void serial_isa_realizefn(DeviceState *dev, Error **errp)
     isa_register_ioport(isadev, &s->io, isa->iobase);
 }
 
-static void serial_isa_build_aml(ISADevice *isadev, Aml *scope)
+static void serial_isa_build_aml(AcpiDevAmlIf *adev, Aml *scope)
 {
-    ISASerialState *isa = ISA_SERIAL(isadev);
+    ISASerialState *isa = ISA_SERIAL(adev);
     Aml *dev;
     Aml *crs;
 
@@ -122,11 +122,11 @@ static Property serial_isa_properties[] = {
 static void serial_isa_class_initfn(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
-    ISADeviceClass *isa = ISA_DEVICE_CLASS(klass);
+    AcpiDevAmlIfClass *adevc = ACPI_DEV_AML_IF_CLASS(klass);
 
     dc->realize = serial_isa_realizefn;
     dc->vmsd = &vmstate_isa_serial;
-    isa->build_aml = serial_isa_build_aml;
+    adevc->build_dev_aml = serial_isa_build_aml;
     device_class_set_props(dc, serial_isa_properties);
     set_bit(DEVICE_CATEGORY_INPUT, dc->categories);
 }
@@ -146,6 +146,10 @@ static const TypeInfo serial_isa_info = {
     .instance_size = sizeof(ISASerialState),
     .instance_init = serial_isa_initfn,
     .class_init    = serial_isa_class_initfn,
+    .interfaces = (InterfaceInfo[]) {
+        { TYPE_ACPI_DEV_AML_IF },
+        { },
+    },
 };
 
 static void serial_register_types(void)
-- 
MST


