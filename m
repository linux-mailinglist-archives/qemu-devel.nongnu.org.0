Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A88D02D49F8
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 20:19:11 +0100 (CET)
Received: from localhost ([::1]:44784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn4zW-0002YZ-NN
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 14:19:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kn3w1-0004tP-IG
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 13:11:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:52934)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kn3vz-0000f5-Oq
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 13:11:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607537486;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rCTXiBiz0IVDGz/6PAJRoYm80wXw7KG34Wn42GEidrE=;
 b=AAtZ6znfT2P/1o5gebYe6U92DsvaxVNwNGplsItZeah+uXSj/KwwScRcqWDLvbFAhm8nbv
 +bLE8vpfhRbYsad79SH1Th70ehBHdoqwFL0d255tknRz5MLPivc6PTvzWmW6DKyGgyj+xD
 hmIDnAo+UvVrv8Vk2WrB2DcEovyCfj4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-426-xQFlPUlmM46rzy0LARsfKg-1; Wed, 09 Dec 2020 13:11:24 -0500
X-MC-Unique: xQFlPUlmM46rzy0LARsfKg-1
Received: by mail-wr1-f70.google.com with SMTP id y5so952728wrs.15
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 10:11:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=rCTXiBiz0IVDGz/6PAJRoYm80wXw7KG34Wn42GEidrE=;
 b=uIw4IlEjgNpC7sQmHMY66T6pPA7rG0IpsX/mllc6WhG53RbMesI/zBjX4dTj5agc4F
 qfEjpFN6ca31P9btW6IHQHhK4rtSv2lSQ1FwIHOzHtoTQyqsF0VTBhTVDbzOjJ+flTbc
 a/1SoBU3DXC1iy+Pp35EsKTSrxcSmlMmAPQ8Wy3kvkE4YExq4jUcHzlB5GILFKI8/cBG
 0qtLN7XvCPrIBE/jNrKSC2+Bs6vw/HY0vAxyjLWT8isfVBxXbAex0Qi36NX030ckVJWb
 b2KA6cXcsanX0oPr3LTaNJ7aXqr2whwNxWu9x1IgYBcMm6Squm7cHbjIli2N1fZo3fFA
 gEVQ==
X-Gm-Message-State: AOAM532uG6S5yBLDQeSY/MZRwDMu9SO4QPvsjqENkpuuDddMt+AxP3x3
 5/QxlBELlvtKzdx3trKm3BsVnRCNy1cjm7u/Xf56pWbx+Pv8umzUDc+OIYZUAQbmb4cqT8qfjf4
 kO3kxt1+GSyr/K/sGUwO1UJGJTmSbdZPXZrDA1spVyNli3S5AFoB5NtSKi95K
X-Received: by 2002:a1c:98cc:: with SMTP id a195mr4087627wme.150.1607537481861; 
 Wed, 09 Dec 2020 10:11:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxQXwDAdHhL0L1wVMy/JGE4z82dnOH8GigKPc63jiWSLrawvAWeydAg3T8WKo3SM4tY6BU92w==
X-Received: by 2002:a1c:98cc:: with SMTP id a195mr4087592wme.150.1607537481579; 
 Wed, 09 Dec 2020 10:11:21 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
 by smtp.gmail.com with ESMTPSA id d9sm5112287wrc.87.2020.12.09.10.11.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 10:11:20 -0800 (PST)
Date: Wed, 9 Dec 2020 13:11:14 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 59/65] x86: acpi: let the firmware handle pending "CPU
 remove" events in SMM
Message-ID: <20201209180546.721296-60-mst@redhat.com>
References: <20201209180546.721296-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201209180546.721296-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Igor Mammedov <imammedo@redhat.com>

if firmware and QEMU negotiated CPU hotunplug support, generate
_EJ0 method so that it will mark CPU for removal by firmware and
pass control to it by triggering SMI.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20201207140739.3829993-6-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/acpi/cpu.h |  1 +
 hw/acpi/cpu.c         | 14 ++++++++++++--
 hw/i386/acpi-build.c  |  1 +
 3 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/include/hw/acpi/cpu.h b/include/hw/acpi/cpu.h
index d71edde456..999caaf510 100644
--- a/include/hw/acpi/cpu.h
+++ b/include/hw/acpi/cpu.h
@@ -51,6 +51,7 @@ void cpu_hotplug_hw_init(MemoryRegion *as, Object *owner,
 typedef struct CPUHotplugFeatures {
     bool acpi_1_compatible;
     bool has_legacy_cphp;
+    bool fw_unplugs_cpu;
     const char *smi_path;
 } CPUHotplugFeatures;
 
diff --git a/hw/acpi/cpu.c b/hw/acpi/cpu.c
index 1293204438..6350caa765 100644
--- a/hw/acpi/cpu.c
+++ b/hw/acpi/cpu.c
@@ -342,6 +342,7 @@ const VMStateDescription vmstate_cpu_hotplug = {
 #define CPU_INSERT_EVENT  "CINS"
 #define CPU_REMOVE_EVENT  "CRMV"
 #define CPU_EJECT_EVENT   "CEJ0"
+#define CPU_FW_EJECT_EVENT "CEJF"
 
 void build_cpus_aml(Aml *table, MachineState *machine, CPUHotplugFeatures opts,
                     hwaddr io_base,
@@ -394,7 +395,9 @@ void build_cpus_aml(Aml *table, MachineState *machine, CPUHotplugFeatures opts,
         aml_append(field, aml_named_field(CPU_REMOVE_EVENT, 1));
         /* initiates device eject, write only */
         aml_append(field, aml_named_field(CPU_EJECT_EVENT, 1));
-        aml_append(field, aml_reserved_field(4));
+        /* tell firmware to do device eject, write only */
+        aml_append(field, aml_named_field(CPU_FW_EJECT_EVENT, 1));
+        aml_append(field, aml_reserved_field(3));
         aml_append(field, aml_named_field(CPU_COMMAND, 8));
         aml_append(cpu_ctrl_dev, field);
 
@@ -429,6 +432,7 @@ void build_cpus_aml(Aml *table, MachineState *machine, CPUHotplugFeatures opts,
         Aml *ins_evt = aml_name("%s.%s", cphp_res_path, CPU_INSERT_EVENT);
         Aml *rm_evt = aml_name("%s.%s", cphp_res_path, CPU_REMOVE_EVENT);
         Aml *ej_evt = aml_name("%s.%s", cphp_res_path, CPU_EJECT_EVENT);
+        Aml *fw_ej_evt = aml_name("%s.%s", cphp_res_path, CPU_FW_EJECT_EVENT);
 
         aml_append(cpus_dev, aml_name_decl("_HID", aml_string("ACPI0010")));
         aml_append(cpus_dev, aml_name_decl("_CID", aml_eisaid("PNP0A05")));
@@ -471,7 +475,13 @@ void build_cpus_aml(Aml *table, MachineState *machine, CPUHotplugFeatures opts,
 
             aml_append(method, aml_acquire(ctrl_lock, 0xFFFF));
             aml_append(method, aml_store(idx, cpu_selector));
-            aml_append(method, aml_store(one, ej_evt));
+            if (opts.fw_unplugs_cpu) {
+                aml_append(method, aml_store(one, fw_ej_evt));
+                aml_append(method, aml_store(aml_int(OVMF_CPUHP_SMI_CMD),
+                           aml_name("%s", opts.smi_path)));
+            } else {
+                aml_append(method, aml_store(one, ej_evt));
+            }
             aml_append(method, aml_release(ctrl_lock));
         }
         aml_append(cpus_dev, method);
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 44c9da5112..f18b71dea9 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -1293,6 +1293,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
         CPUHotplugFeatures opts = {
             .acpi_1_compatible = true, .has_legacy_cphp = true,
             .smi_path = pm->smi_on_cpuhp ? "\\_SB.PCI0.SMI0.SMIC" : NULL,
+            .fw_unplugs_cpu = pm->smi_on_cpu_unplug,
         };
         build_cpus_aml(dsdt, machine, opts, pm->cpu_hp_io_base,
                        "\\_SB.PCI0", "\\_GPE._E02");
-- 
MST


