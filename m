Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E68A34509ED
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Nov 2021 17:46:00 +0100 (CET)
Received: from localhost ([::1]:53296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmf7I-0006hr-2C
	for lists+qemu-devel@lfdr.de; Mon, 15 Nov 2021 11:46:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mmezw-00021h-AU
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 11:38:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30492)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mmezu-0005Dp-JM
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 11:38:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636994302;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LaY+8Sks35E+sW73i45j3BLIhjePFay5RJ/y5SCcbtU=;
 b=CVSAkUP172RoD4RCZ3IrfhVgLgwGBrOtYFJ+kh7vryPfVmHncJPYWbJr39wT9vXYrfSyYX
 GQYucJOH8/qTVJjft/Fcj2Q86M4VIoB5yX6jlRf8bsUuJpBpjTtMfjwcEevWXAs2FE66Ux
 DlzYILOHS/TnNOcPf8vNkAZKmerKvpE=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-350-ENARr8VdOrSwNZutjT4k9w-1; Mon, 15 Nov 2021 11:38:20 -0500
X-MC-Unique: ENARr8VdOrSwNZutjT4k9w-1
Received: by mail-ed1-f72.google.com with SMTP id
 v10-20020aa7d9ca000000b003e7bed57968so3291432eds.23
 for <qemu-devel@nongnu.org>; Mon, 15 Nov 2021 08:38:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=LaY+8Sks35E+sW73i45j3BLIhjePFay5RJ/y5SCcbtU=;
 b=QX3NZij2Y6ahf2lt909tyZ0Sja2NrOHylO9gR8bqG7jtwe8GiXQ3H//7LM+l2UYWl8
 +UjcPPvhGnMFxIRwNkT1xvopI8JJ/4+S7D0h37sdxznKisQphOTz3ULuMPJGX63oIuJD
 5QjmnWRf74q4mY+uxdgEXNVXyLX6YRR0NSkFb5uUu9+BEdgoMnpLTYX9YExXnfK5rzk8
 Hvem87lYv8DPM66L5Gup3ov7JYtCAWXIv+H3IdINM39SrfC7N+3Km/Seqb1HBie0WYz5
 t+rBSnw6jXRywPXuEJg4zgYNkwLWQucRzZlk0XZSowOdICU0n3HbRw394e6GqGlNpCoj
 bfcA==
X-Gm-Message-State: AOAM5332Ekhr+CV3uo40DqZMPYwefvYElspN4EFYIBAVsFkt6QGGjTF/
 CJf3k93K1cE0532rDhyP6ymsp/I331OLIsK/UXfBXxfZL4Dk2gEN+4VBCTBrW4BE0Gm0rxo6BwU
 u9O8JUAeRJ/FDbfx3hTIvA5ekLl+HilH4bsql/lTOdv0rmz4Ap4mr+l3YfCNL
X-Received: by 2002:a17:907:961d:: with SMTP id
 gb29mr449186ejc.102.1636994299162; 
 Mon, 15 Nov 2021 08:38:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw3bxXCwflMyz16wNlscAIvVSGznsA1DbOCzXZpeDxchjWBKbQubPYHeHwoLn4LtqYvHVb9cw==
X-Received: by 2002:a17:907:961d:: with SMTP id
 gb29mr449142ejc.102.1636994298958; 
 Mon, 15 Nov 2021 08:38:18 -0800 (PST)
Received: from redhat.com ([2a03:c5c0:207e:9a71:d0b:1947:b534:3230])
 by smtp.gmail.com with ESMTPSA id g21sm8285333edb.89.2021.11.15.08.38.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Nov 2021 08:38:18 -0800 (PST)
Date: Mon, 15 Nov 2021 11:38:13 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 09/20] hw/i386/acpi-build: Deny control on PCIe Native
 Hot-plug in _OSC
Message-ID: <20211115163607.177432-10-mst@redhat.com>
References: <20211115163607.177432-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211115163607.177432-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Julia Suvorova <jusual@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Julia Suvorova <jusual@redhat.com>

There are two ways to enable ACPI PCI Hot-plug:

        * Disable the Hot-plug Capable bit on PCIe slots.

This was the first approach which led to regression [1-2], as
I/O space for a port is allocated only when it is hot-pluggable,
which is determined by HPC bit.

        * Leave the HPC bit on and disable PCIe Native Hot-plug in _OSC
          method.

This removes the (future) ability of hot-plugging switches with PCIe
Native hotplug since ACPI PCI Hot-plug only works with cold-plugged
bridges. If the user wants to explicitely use this feature, they can
disable ACPI PCI Hot-plug with:
        --global ICH9-LPC.acpi-pci-hotplug-with-bridge-support=off

Change the bit in _OSC method so that the OS selects ACPI PCI Hot-plug
instead of PCIe Native.

[1] https://gitlab.com/qemu-project/qemu/-/issues/641
[2] https://bugzilla.redhat.com/show_bug.cgi?id=2006409

Signed-off-by: Julia Suvorova <jusual@redhat.com>
Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20211112110857.3116853-5-imammedo@redhat.com>
Reviewed-by: Ani Sinha <ani@anisinha.ca>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/i386/acpi-build.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index a3ad6abd33..a99c6e4fe3 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -1337,7 +1337,7 @@ static void build_x86_acpi_pci_hotplug(Aml *table, uint64_t pcihp_addr)
     aml_append(table, scope);
 }
 
-static Aml *build_q35_osc_method(void)
+static Aml *build_q35_osc_method(bool enable_native_pcie_hotplug)
 {
     Aml *if_ctx;
     Aml *if_ctx2;
@@ -1359,8 +1359,10 @@ static Aml *build_q35_osc_method(void)
     /*
      * Always allow native PME, AER (no dependencies)
      * Allow SHPC (PCI bridges can have SHPC controller)
+     * Disable PCIe Native Hot-plug if ACPI PCI Hot-plug is enabled.
      */
-    aml_append(if_ctx, aml_and(a_ctrl, aml_int(0x1F), a_ctrl));
+    aml_append(if_ctx, aml_and(a_ctrl,
+        aml_int(0x1E | (enable_native_pcie_hotplug ? 0x1 : 0x0)), a_ctrl));
 
     if_ctx2 = aml_if(aml_lnot(aml_equal(aml_arg(1), aml_int(1))));
     /* Unknown revision */
@@ -1449,7 +1451,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
         aml_append(dev, aml_name_decl("_CID", aml_eisaid("PNP0A03")));
         aml_append(dev, aml_name_decl("_ADR", aml_int(0)));
         aml_append(dev, aml_name_decl("_UID", aml_int(pcmc->pci_root_uid)));
-        aml_append(dev, build_q35_osc_method());
+        aml_append(dev, build_q35_osc_method(!pm->pcihp_bridge_en));
         aml_append(sb_scope, dev);
         if (mcfg_valid) {
             aml_append(sb_scope, build_q35_dram_controller(&mcfg));
@@ -1565,7 +1567,9 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
             if (pci_bus_is_express(bus)) {
                 aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0A08")));
                 aml_append(dev, aml_name_decl("_CID", aml_eisaid("PNP0A03")));
-                aml_append(dev, build_q35_osc_method());
+
+                /* Expander bridges do not have ACPI PCI Hot-plug enabled */
+                aml_append(dev, build_q35_osc_method(true));
             } else {
                 aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0A03")));
             }
-- 
MST


