Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8C7F32A274
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 15:25:59 +0100 (CET)
Received: from localhost ([::1]:59640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH5yI-00074D-RI
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 09:25:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lH5tv-00045z-1U
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 09:21:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41267)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lH5ts-0000EE-8L
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 09:21:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614694883;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aSTS7Zkq3P2VbrOZPe9sjI2kH1SjBjp0OmfmXgyEvhw=;
 b=IK7vix6FHyHKv/UJ8fmqLYO1hAUN6Jx4b2ejNnqz+F/USu0/A1azLvzQgmNwslSzdgBN/G
 IbSCempjOGGucSrDVK2QQQsC84r20WKyR4SXe3a2Y5pgrFEQMIGkurPxAt7i/M8abQWU1/
 eOG5REOh/wxVGV4XlzPe1yj/NrIGzG8=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-575-coE4v09iM8SWxbLE4Fge1g-1; Tue, 02 Mar 2021 09:21:15 -0500
X-MC-Unique: coE4v09iM8SWxbLE4Fge1g-1
Received: by mail-ej1-f71.google.com with SMTP id w22so8612560ejv.18
 for <qemu-devel@nongnu.org>; Tue, 02 Mar 2021 06:21:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=aSTS7Zkq3P2VbrOZPe9sjI2kH1SjBjp0OmfmXgyEvhw=;
 b=f0hDA4xVtI0hrrDBk1777J16pzDkaXVyS5WLRJ3QkzxHSCmCAYK8UzEP2V80rrfqwn
 tbe+D+T48RE/6PPUNQI+S8Y2xIaAk2WrNH89lEutEdRxyMqzl2qy48jrL0JBIa63SEKZ
 DLy1F6cZ5JAm1ButIgCLjHaHFvd56j2EqqGgRnHW+UAhaN9kYJs5QneGBHlh8bGZ+3VB
 LP8fBZGWeJnCNT/TEH1rHRtTYQYZTLfxK5i+73ojK3t5E9iRwMP9DOAOs3kfz0mBkaLG
 LW1HnGhsQq1hG0rBSZIV9S8vRtw6ZbyKeVvEDJMv9ZmqbTME63uUuygkq73dk16c4iUU
 Kgxg==
X-Gm-Message-State: AOAM532Xo8oAsMJfuVP7wUe7BQXWAgtyvMOyrBB3GC81HZtHJCqCM6+2
 Jbmf5zFZ5H4g8TdhHSqb505DSwqsCQtAyigZ86rWsBIf5n73b6+OiBbymn6HVL0v3oRkMp3Fk4X
 LXNQMiNbiFTcr1+M5uUs2I06vF+jHhO/Bbk/7XxWBL3CWFnxYIiBRjVoodQ5I
X-Received: by 2002:a50:e882:: with SMTP id f2mr9286035edn.184.1614694873388; 
 Tue, 02 Mar 2021 06:21:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzXpglCX9t10C4DlyZp/HwCVgBpN17UAyP6sL7bohrGs5RFWJaB2Mh+WY5wNGcsm1O+K8saug==
X-Received: by 2002:a50:e882:: with SMTP id f2mr9286011edn.184.1614694873154; 
 Tue, 02 Mar 2021 06:21:13 -0800 (PST)
Received: from redhat.com (bzq-79-180-2-31.red.bezeqint.net. [79.180.2.31])
 by smtp.gmail.com with ESMTPSA id v7sm8608763edt.90.2021.03.02.06.21.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Mar 2021 06:21:12 -0800 (PST)
Date: Tue, 2 Mar 2021 09:21:10 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 1/4] i386/acpi: restore device paths for pre-5.1 vms
Message-ID: <20210302142014.141135-2-mst@redhat.com>
References: <20210302142014.141135-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210302142014.141135-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 Richard Henderson <richard.henderson@linaro.org>, qemu-stable@nongnu.org,
 Vitaly Cheptsov <cheptsov@ispras.ru>, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>,
 Thomas Lamprecht <t.lamprecht@proxmox.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vitaly Cheptsov <cheptsov@ispras.ru>

After fixing the _UID value for the primary PCI root bridge in
af1b80ae it was discovered that this change updates Windows
configuration in an incompatible way causing network configuration
failure unless DHCP is used. More details provided on the list:

https://lists.gnu.org/archive/html/qemu-devel/2021-02/msg08484.html

This change reverts the _UID update from 1 to 0 for q35 and i440fx
VMs before version 5.2 to maintain the original behaviour when
upgrading.

Cc: qemu-stable@nongnu.org
Cc: qemu-devel@nongnu.org
Reported-by: Thomas Lamprecht <t.lamprecht@proxmox.com>
Suggested-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Vitaly Cheptsov <cheptsov@ispras.ru>
Message-Id: <20210301195919.9333-1-cheptsov@ispras.ru>
Tested-by: Thomas Lamprecht <t.lamprecht@proxmox.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Fixes: af1b80ae56c9 ("i386/acpi: fix inconsistent QEMU/OVMF device paths")
---
 include/hw/i386/pc.h | 1 +
 hw/i386/acpi-build.c | 4 ++--
 hw/i386/pc_piix.c    | 2 ++
 hw/i386/pc_q35.c     | 2 ++
 4 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index c9d194a5e7..d4c3d73c11 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -105,6 +105,7 @@ struct PCMachineClass {
     int legacy_acpi_table_size;
     unsigned acpi_data_size;
     bool do_not_add_smb_acpi;
+    int pci_root_uid;
 
     /* SMBIOS compat: */
     bool smbios_defaults;
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 31a5f6f4a5..442b4629a9 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -1277,7 +1277,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
         dev = aml_device("PCI0");
         aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0A03")));
         aml_append(dev, aml_name_decl("_ADR", aml_int(0)));
-        aml_append(dev, aml_name_decl("_UID", aml_int(0)));
+        aml_append(dev, aml_name_decl("_UID", aml_int(pcmc->pci_root_uid)));
         aml_append(sb_scope, dev);
         aml_append(dsdt, sb_scope);
 
@@ -1296,7 +1296,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
         aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0A08")));
         aml_append(dev, aml_name_decl("_CID", aml_eisaid("PNP0A03")));
         aml_append(dev, aml_name_decl("_ADR", aml_int(0)));
-        aml_append(dev, aml_name_decl("_UID", aml_int(0)));
+        aml_append(dev, aml_name_decl("_UID", aml_int(pcmc->pci_root_uid)));
         aml_append(dev, build_q35_osc_method());
         aml_append(sb_scope, dev);
         if (mcfg_valid) {
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 2904b40163..46cc951073 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -405,6 +405,7 @@ static void pc_i440fx_machine_options(MachineClass *m)
 {
     PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
     pcmc->default_nic_model = "e1000";
+    pcmc->pci_root_uid = 0;
 
     m->family = "pc_piix";
     m->desc = "Standard PC (i440FX + PIIX, 1996)";
@@ -448,6 +449,7 @@ static void pc_i440fx_5_1_machine_options(MachineClass *m)
     compat_props_add(m->compat_props, hw_compat_5_1, hw_compat_5_1_len);
     compat_props_add(m->compat_props, pc_compat_5_1, pc_compat_5_1_len);
     pcmc->kvmclock_create_always = false;
+    pcmc->pci_root_uid = 1;
 }
 
 DEFINE_I440FX_MACHINE(v5_1, "pc-i440fx-5.1", NULL,
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index 0a212443aa..53450190f5 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -329,6 +329,7 @@ static void pc_q35_machine_options(MachineClass *m)
 {
     PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
     pcmc->default_nic_model = "e1000e";
+    pcmc->pci_root_uid = 0;
 
     m->family = "pc_q35";
     m->desc = "Standard PC (Q35 + ICH9, 2009)";
@@ -375,6 +376,7 @@ static void pc_q35_5_1_machine_options(MachineClass *m)
     compat_props_add(m->compat_props, hw_compat_5_1, hw_compat_5_1_len);
     compat_props_add(m->compat_props, pc_compat_5_1, pc_compat_5_1_len);
     pcmc->kvmclock_create_always = false;
+    pcmc->pci_root_uid = 1;
 }
 
 DEFINE_Q35_MACHINE(v5_1, "pc-q35-5.1", NULL,
-- 
MST


