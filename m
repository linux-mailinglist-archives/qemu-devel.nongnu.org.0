Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53FAC61372E
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 13:59:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opUIa-0003J4-AY; Mon, 31 Oct 2022 08:53:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opUIN-0002GZ-Tr
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:53:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opUIM-0003Ig-Co
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:53:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667220817;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ps8QJRGN+47BbvPd8yHBrkkg70UnCtXifweZPYFMUqM=;
 b=ZPdJMet6mjkuji9fLPPKl1BRflXvrX6uF0JMbIjTMkzCHBqmHd+pdAyLWvlHOC+Nh2VVS9
 X4lDFJmI2DlPXD3kbWy4BmI241J6328FVRALFhIUJXbWBhU1LNsBdBGjAEb98KlCSHPhEE
 dfj8l5Or3/xVs3IPd3Imn4UUjJKnIk8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-247-6PEAFu7uPUWI9-0CHzbs7A-1; Mon, 31 Oct 2022 08:53:36 -0400
X-MC-Unique: 6PEAFu7uPUWI9-0CHzbs7A-1
Received: by mail-wr1-f71.google.com with SMTP id
 l16-20020adfc790000000b00230c2505f96so2998701wrg.4
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 05:53:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ps8QJRGN+47BbvPd8yHBrkkg70UnCtXifweZPYFMUqM=;
 b=jp863FnEXzsXj1fV+V1MwQHS0M6tkC8oIpv+ufsNEEkEZj7ueAyY9sUe47fJmj0OJL
 yROh5KHTCuDJrwrSCFbtPF2eYy7C242yH5FrWNDLhc/8nxQkq8u58yyPRvZZzV1y2xCV
 Ea4BDL4IgQdbUrV3sDY92vW2mzS5I4FXk82NzZoblPNBvK8FCLDW5AmNENxusf9Fi+1X
 DwL27jiGO87QbCrkvOx1hCT0DfwKnNy+Ksxir3cj/qFHLv45qYObYf6U68V77ql/oiGB
 9zQzzMHCo+dwge+sB5LOe3E7BsuevKO1a9o5CGdir44yPF5o2nWzJpqstJJ5qbWU5OXx
 oFDA==
X-Gm-Message-State: ACrzQf1Wi0xPPhHTbfGEUI9U9o0+8U4cMywE3OxaXUPXC4J85ojYGAg4
 65wP20HveaFULf4QO3Kv2UETPPTiJwVi8gUAOLVn+FrfifYy+Ct7i3DOcvw4QVWkMdJnW3zwY/g
 4ZYpvq0PKzHhZxzqEGKd8pU14+AFZNCCIKPxhaorS3B1UB4qxU2w0v/3Gg+S5
X-Received: by 2002:a05:600c:21c9:b0:3cf:7833:2940 with SMTP id
 x9-20020a05600c21c900b003cf78332940mr813498wmj.35.1667220815181; 
 Mon, 31 Oct 2022 05:53:35 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5/6CloBe++3uoF/8Kt77Zu7FxS3gneLbU5UKzO/trKCxyCjcrzXaOq8oiEeZ3ZRhPIDwvOvg==
X-Received: by 2002:a05:600c:21c9:b0:3cf:7833:2940 with SMTP id
 x9-20020a05600c21c900b003cf78332940mr813482wmj.35.1667220814897; 
 Mon, 31 Oct 2022 05:53:34 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 fc6-20020a05600c524600b003c6bbe910fdsm8465679wmb.9.2022.10.31.05.53.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 05:53:34 -0700 (PDT)
Date: Mon, 31 Oct 2022 08:53:32 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PULL 60/86] acpi: enumerate SMB bridge automatically along with
 other PCI devices
Message-ID: <20221031124928.128475-61-mst@redhat.com>
References: <20221031124928.128475-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221031124928.128475-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.048,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

From: Igor Mammedov <imammedo@redhat.com>

to make that happen (bridge sits at _ADR: 0x001F0003),
relax PCI enumeration logic to include devices with *function* > 0
if device has something to say about itself (i.e. has build_dev_aml
callback set).

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20221017102146.2254096-8-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/i386/acpi-build.c | 27 +++------------------------
 1 file changed, 3 insertions(+), 24 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index e1483bb11a..916343d8d6 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -448,9 +448,10 @@ static void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus,
             /*
              * allow describing coldplugged bridges in ACPI even if they are not
              * on function 0, as they are not unpluggable, for all other devices
-             * generate description only for function 0 per slot
+             * generate description only for function 0 per slot, and for other
+             * functions if device on function provides its own AML
              */
-            if (func && !bridge_in_acpi) {
+            if (func && !bridge_in_acpi && !get_dev_aml_func(DEVICE(pdev))) {
                 continue;
             }
         } else {
@@ -1319,25 +1320,6 @@ static Aml *build_q35_osc_method(bool enable_native_pcie_hotplug)
     return method;
 }
 
-static void build_smb0(Aml *table, int devnr, int func)
-{
-    Aml *scope = aml_scope("_SB.PCI0");
-    Aml *dev = aml_device("SMB0");
-    bool ambiguous;
-    Object *obj;
-    /*
-     * temporarily fish out device hosting SMBUS, build_smb0 will be gone once
-     * PCI enumeration will be switched to call_dev_aml_func()
-     */
-    obj = object_resolve_path_type("", TYPE_ICH9_SMB_DEVICE, &ambiguous);
-    assert(obj && !ambiguous);
-
-    aml_append(dev, aml_name_decl("_ADR", aml_int(devnr << 16 | func)));
-    call_dev_aml_func(DEVICE(obj), dev);
-    aml_append(scope, dev);
-    aml_append(table, scope);
-}
-
 static void build_acpi0017(Aml *table)
 {
     Aml *dev, *scope, *method;
@@ -1440,9 +1422,6 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
             build_x86_acpi_pci_hotplug(dsdt, pm->pcihp_io_base);
         }
         build_q35_pci0_int(dsdt);
-        if (pcms->smbus) {
-            build_smb0(dsdt, ICH9_SMB_DEV, ICH9_SMB_FUNC);
-        }
     }
 
     if (misc->has_hpet) {
-- 
MST


