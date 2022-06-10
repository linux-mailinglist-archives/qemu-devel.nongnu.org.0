Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F26F7545F19
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 10:32:08 +0200 (CEST)
Received: from localhost ([::1]:40266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nza3r-0002Bs-Vo
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 04:32:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nzZWd-0006sP-9o
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 03:57:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37237)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nzZWb-0006ET-Jj
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 03:57:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654847865;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3iqbkxSoYmAB2JME6Zce7lenT6KOo4YHchMzDk3y2nA=;
 b=crRgCHxOm49qixaFH6cVJBAH6Ryez+0Xo+xZEeZ0090ZUzT0E9I7GC8Js2v/Opo93PvsKK
 7qbO68C2UIF/Hyh5umvsC7dWs+eeAAFeH9ReqGngRctB8qoUmFkmzWgTYEzg2LSHP2r737
 uVlxlI6s6EDcSPnt0uUgA+rh9iqLnTI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-372-YuwHv-pzMOq0hAqxrfcy7Q-1; Fri, 10 Jun 2022 03:57:43 -0400
X-MC-Unique: YuwHv-pzMOq0hAqxrfcy7Q-1
Received: by mail-wm1-f69.google.com with SMTP id
 v125-20020a1cac83000000b0039c6608296dso942878wme.4
 for <qemu-devel@nongnu.org>; Fri, 10 Jun 2022 00:57:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=3iqbkxSoYmAB2JME6Zce7lenT6KOo4YHchMzDk3y2nA=;
 b=RkaKUFyGnATrhOUe5VlnC31ypNzNhQO85w4rp4ffIEvord3+P/P+KSO4vPrgRCTr8k
 78trABcRXYoSFjpGxeE3SgqOsrzqDgWsDf6ZhZtoQauQIvugiR6/RIh4pQKCjDa72w0I
 CTDZagn/UE3sXZIutLM0hogvOsz58T1YvSDlUm1xLRWP3KneHaklyry8KTGBixS0zOI4
 1bqy1furZjKyXfupnXCSDb4p1zqM1wVQRkJv9W7rLTq6l2N2+9mH/atBQ5/MbPbwHSrL
 C2mJoCEeQA426aBWAQDdU4CsGTFmCBAlFxJvQ2bhDbpc6QTPR67g0SvHUuHEv8EOpL7I
 YgGg==
X-Gm-Message-State: AOAM533tjPrOgPeB4GasbS5FmFdNF9qnvbLLPyRdYVEpFgFLdhIU7cOn
 EYdrCmSDvs8Kz4vlDgYyVkzOFBR8fJBEG3cg6E57h5Xse/jqGdTo2gNrVZOz45FNwqCalDew3sN
 i0ElrzRy98BxblTKNXXImAgQNyLhIaFpcdnH6dzhz6ANBaVkBJr8BX0o8Xwuk
X-Received: by 2002:adf:e28a:0:b0:210:b31:722 with SMTP id
 v10-20020adfe28a000000b002100b310722mr43052540wri.65.1654847862432; 
 Fri, 10 Jun 2022 00:57:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxbZyHjj68hETli8m6Nr50HBG2R3IYBtebbiFNt43cW1rHsuALXHyPvX9R4LFkoCNQvpZlcyQ==
X-Received: by 2002:adf:e28a:0:b0:210:b31:722 with SMTP id
 v10-20020adfe28a000000b002100b310722mr43052510wri.65.1654847862103; 
 Fri, 10 Jun 2022 00:57:42 -0700 (PDT)
Received: from redhat.com ([212.116.178.142]) by smtp.gmail.com with ESMTPSA id
 l12-20020a05600c2ccc00b0039c4d9737f3sm2094095wmc.34.2022.06.10.00.57.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jun 2022 00:57:41 -0700 (PDT)
Date: Fri, 10 Jun 2022 03:57:39 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PULL 13/54] ipmi: acpi: use relative path to resource source
Message-ID: <20220610075631.367501-14-mst@redhat.com>
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

smbus-ipmi AML description needs to specify a path to its parent
node in _CRS. The rest of IPMI inplementations (ISA based)
do not need path at all. Instead of passing through a full path
use relative path to point to smbus-ipmi's parent node, it will
let follow up patches to create IPMI device AML in a generic
way instead of current ad-hoc way. (i.e. AML will be generated
the same way it's done for other ISA device, and smbus will be
converted to generate AML for its slave devices the same way
as ISA)

expected AML change:
     Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
     {
        I2cSerialBusV2 (0x0000, ControllerInitiated, 0x000186A0,
-           AddressingMode7Bit, "\\_SB.PCI0.SMB0",
+           AddressingMode7Bit, "^",
            0x00, ResourceProducer, , Exclusive,
            )
      })

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Acked-by: Gerd Hoffmann <kraxel@redhat.com>
Message-Id: <20220608135340.3304695-14-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/acpi/ipmi.h |  2 +-
 hw/acpi/ipmi-stub.c    |  2 +-
 hw/acpi/ipmi.c         | 12 ++++++------
 hw/i386/acpi-build.c   |  4 ++--
 4 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/include/hw/acpi/ipmi.h b/include/hw/acpi/ipmi.h
index c14ad682ac..c38483565c 100644
--- a/include/hw/acpi/ipmi.h
+++ b/include/hw/acpi/ipmi.h
@@ -16,6 +16,6 @@
  * bus matches the given bus.  The resource is the ACPI resource that
  * contains the IPMI device, this is required for the I2C CRS.
  */
-void build_acpi_ipmi_devices(Aml *table, BusState *bus, const char *resource);
+void build_acpi_ipmi_devices(Aml *table, BusState *bus);
 
 #endif /* HW_ACPI_IPMI_H */
diff --git a/hw/acpi/ipmi-stub.c b/hw/acpi/ipmi-stub.c
index 8634fb325c..f525f71c2d 100644
--- a/hw/acpi/ipmi-stub.c
+++ b/hw/acpi/ipmi-stub.c
@@ -10,6 +10,6 @@
 #include "qemu/osdep.h"
 #include "hw/acpi/ipmi.h"
 
-void build_acpi_ipmi_devices(Aml *table, BusState *bus, const char *resource)
+void build_acpi_ipmi_devices(Aml *table, BusState *bus)
 {
 }
diff --git a/hw/acpi/ipmi.c b/hw/acpi/ipmi.c
index 96e48eba15..c30b44fcf5 100644
--- a/hw/acpi/ipmi.c
+++ b/hw/acpi/ipmi.c
@@ -13,7 +13,7 @@
 #include "hw/acpi/acpi.h"
 #include "hw/acpi/ipmi.h"
 
-static Aml *aml_ipmi_crs(IPMIFwInfo *info, const char *resource)
+static Aml *aml_ipmi_crs(IPMIFwInfo *info)
 {
     Aml *crs = aml_resource_template();
 
@@ -49,7 +49,7 @@ static Aml *aml_ipmi_crs(IPMIFwInfo *info, const char *resource)
         break;
     case IPMI_MEMSPACE_SMBUS:
         aml_append(crs, aml_i2c_serial_bus_device(info->base_address,
-                                                  resource));
+                                                  "^"));
         break;
     default:
         abort();
@@ -62,7 +62,7 @@ static Aml *aml_ipmi_crs(IPMIFwInfo *info, const char *resource)
     return crs;
 }
 
-static Aml *aml_ipmi_device(IPMIFwInfo *info, const char *resource)
+static Aml *aml_ipmi_device(IPMIFwInfo *info)
 {
     Aml *dev;
     uint16_t version = ((info->ipmi_spec_major_revision << 8)
@@ -75,14 +75,14 @@ static Aml *aml_ipmi_device(IPMIFwInfo *info, const char *resource)
     aml_append(dev, aml_name_decl("_STR", aml_string("ipmi_%s",
                                                      info->interface_name)));
     aml_append(dev, aml_name_decl("_UID", aml_int(info->uuid)));
-    aml_append(dev, aml_name_decl("_CRS", aml_ipmi_crs(info, resource)));
+    aml_append(dev, aml_name_decl("_CRS", aml_ipmi_crs(info)));
     aml_append(dev, aml_name_decl("_IFT", aml_int(info->interface_type)));
     aml_append(dev, aml_name_decl("_SRV", aml_int(version)));
 
     return dev;
 }
 
-void build_acpi_ipmi_devices(Aml *scope, BusState *bus, const char *resource)
+void build_acpi_ipmi_devices(Aml *scope, BusState *bus)
 {
 
     BusChild *kid;
@@ -102,6 +102,6 @@ void build_acpi_ipmi_devices(Aml *scope, BusState *bus, const char *resource)
         iic = IPMI_INTERFACE_GET_CLASS(obj);
         memset(&info, 0, sizeof(info));
         iic->get_fwinfo(ii, &info);
-        aml_append(scope, aml_ipmi_device(&info, resource));
+        aml_append(scope, aml_ipmi_device(&info));
     }
 }
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 1449832aa9..88506d563f 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -873,7 +873,7 @@ static void build_isa_devices_aml(Aml *table)
     assert(obj && !ambiguous);
 
     scope = aml_scope("_SB.PCI0.ISA");
-    build_acpi_ipmi_devices(scope, BUS(obj), "\\_SB.PCI0.ISA");
+    build_acpi_ipmi_devices(scope, BUS(obj));
     isa_build_aml(ISA_BUS(obj), scope);
 
     aml_append(table, scope);
@@ -1406,7 +1406,7 @@ static void build_smb0(Aml *table, I2CBus *smbus, int devnr, int func)
     Aml *dev = aml_device("SMB0");
 
     aml_append(dev, aml_name_decl("_ADR", aml_int(devnr << 16 | func)));
-    build_acpi_ipmi_devices(dev, BUS(smbus), "\\_SB.PCI0.SMB0");
+    build_acpi_ipmi_devices(dev, BUS(smbus));
     aml_append(scope, dev);
     aml_append(table, scope);
 }
-- 
MST


