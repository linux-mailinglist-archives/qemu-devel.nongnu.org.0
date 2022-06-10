Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0C47545E00
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 10:00:46 +0200 (CEST)
Received: from localhost ([::1]:33462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzZZU-00013l-Cq
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 04:00:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nzZW5-0006C6-Oy
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 03:57:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37538)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nzZW4-0006As-Ac
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 03:57:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654847831;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kO7ZymzZRMHV3HTDQI9d5yNC5sEwLHsMcUWYcMukFFs=;
 b=F3zZJjiCln1XDY2pPP0Rn3RoBOhktiFBOo7jAU5cAL7xGwxS14SnbFB+OvGp9WPdvBm8ki
 veKGeYwopAxkH6DL2cvwTaikfL82d/pQkhj9jFwl4b91cOln/PIXcmW+Biayz71VbZMBOc
 5iFMwFpXh4R82bR+mgu+Zb/g8btX7do=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-373-472rpzfMNUaIe2VLwAyBcQ-1; Fri, 10 Jun 2022 03:57:10 -0400
X-MC-Unique: 472rpzfMNUaIe2VLwAyBcQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 o3-20020a05600c510300b0039743540ac7so9320305wms.5
 for <qemu-devel@nongnu.org>; Fri, 10 Jun 2022 00:57:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=kO7ZymzZRMHV3HTDQI9d5yNC5sEwLHsMcUWYcMukFFs=;
 b=6c1KPSkOxYcykLfyQVVkP7N1gYDxpXtYMdjMhYyknk4OT9RUzReGi2OnmMDa90TO8y
 ctaA2CYpzDWhrC2IF5nkCyHlzQVA2kKHV9s2yHzpmMhqcYCuSex/mWhirZXB5OcM+Asp
 wc5Lv2DucG+Z/FQUXSxiJaWJrrKYMSsMRLtyoIPDrdMKEeflkNVK8buXAa0D1hAtMqWn
 oqPAsdc4x0lRszxt5m8e267QC4jIWAhQNH/GXsgdnz1Wwy82+oQ8hZ7Kr6zO/jTjSDGA
 XylOPCPpEtr2uDUb7bhrpJjawrWGkK1nyYcdx4uZ8e9sErxWHnyGMI+YzR8bxtibmMdE
 kMmw==
X-Gm-Message-State: AOAM533620daeZNauuQCQ7jfVz+lum/rkDrdRK917E2Gg1nTOlx9cSQN
 MrBJtz8gVatof1glj3uqwrMl7fHUJIzoGdGMFmVvUz0Yh4aq5z03eeaAAA2z9j6d3x2K1XUtz2l
 Ioc6h7+4EJdO3kMnfpUe0V1Lw1rvCZPp48BH247s43GhLivWOWCYsv+C6w0MD
X-Received: by 2002:a05:600c:3b0c:b0:39c:7d91:26d0 with SMTP id
 m12-20020a05600c3b0c00b0039c7d9126d0mr1695677wms.40.1654847829213; 
 Fri, 10 Jun 2022 00:57:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwRKZKWvo++a9/RtHZ1eDJl7h20l4/5aDmmgiJKXTc0cTa5Cv3eqkSA+On8HbCuw1r4KMnGzw==
X-Received: by 2002:a05:600c:3b0c:b0:39c:7d91:26d0 with SMTP id
 m12-20020a05600c3b0c00b0039c7d9126d0mr1695654wms.40.1654847828992; 
 Fri, 10 Jun 2022 00:57:08 -0700 (PDT)
Received: from redhat.com ([212.116.178.142]) by smtp.gmail.com with ESMTPSA id
 z13-20020adfe54d000000b002103cfd2fbasm28105979wrm.65.2022.06.10.00.57.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jun 2022 00:57:08 -0700 (PDT)
Date: Fri, 10 Jun 2022 03:57:05 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Bernhard Beschow <shentey@gmail.com>, Thomas Huth <thuth@redhat.com>
Subject: [PULL 02/54] acpi: make isa_build_aml() support AcpiDevAmlIf interface
Message-ID: <20220610075631.367501-3-mst@redhat.com>
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

To allow incremental conversion from ISADeviceClass::build_aml
to AcpiDevAmlIf, add support for the later without removing
the former. Once conversion is complete, another commit will
drop ISADeviceClass::build_aml related code.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Ani Sinha <ani@anisinha.ca>
Acked-by: Gerd Hoffmann <kraxel@redhat.com>
Message-Id: <20220608135340.3304695-3-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/isa/isa-bus.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/isa/isa-bus.c b/hw/isa/isa-bus.c
index cd5ad3687d..237e2cee12 100644
--- a/hw/isa/isa-bus.c
+++ b/hw/isa/isa-bus.c
@@ -24,6 +24,7 @@
 #include "hw/sysbus.h"
 #include "sysemu/sysemu.h"
 #include "hw/isa/isa.h"
+#include "hw/acpi/acpi_aml_interface.h"
 
 static ISABus *isabus;
 
@@ -196,8 +197,12 @@ void isa_build_aml(ISABus *bus, Aml *scope)
     QTAILQ_FOREACH(kid, &bus->parent_obj.children, sibling) {
         dev = ISA_DEVICE(kid->child);
         dc = ISA_DEVICE_GET_CLASS(dev);
+        bool has_build_dev_aml = !!object_dynamic_cast(OBJECT(dev),
+                                                       TYPE_ACPI_DEV_AML_IF);
         if (dc->build_aml) {
             dc->build_aml(dev, scope);
+        } else if (has_build_dev_aml) {
+            call_dev_aml_func(DEVICE(dev), scope);
         }
     }
 }
-- 
MST


