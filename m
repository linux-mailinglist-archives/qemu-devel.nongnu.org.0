Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1287E3C79A5
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 00:29:00 +0200 (CEST)
Received: from localhost ([::1]:34774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3Qtf-0003yG-3p
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 18:28:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m3QfE-0007OS-3Q
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 18:14:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48381)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m3QfC-0001o5-EB
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 18:14:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626214441;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wGJK3zOQMsPUthycRa07iCj/XcAJGJjnk+sZAHLKKJI=;
 b=JtJR5lYlDWiaC44H1Nkjk+o2ETyuwWbJbm4MQzLDHsrwyMAZHD8BIeIuol/aomeY5bcSg8
 p1tJq11BKAEwHzwXAOigHLShKTVjl6uHV35ySv3pIP1v6NBBjAtJJs88y3CyfNinZErGni
 ulsy5bgF/WxC6xu/40q/G6tFlWKXKWY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-221-yzeknj2UPr25h3NdzCYzMg-1; Tue, 13 Jul 2021 18:11:00 -0400
X-MC-Unique: yzeknj2UPr25h3NdzCYzMg-1
Received: by mail-wr1-f72.google.com with SMTP id
 32-20020adf82a30000b029013b21c75294so317391wrc.14
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 15:11:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=wGJK3zOQMsPUthycRa07iCj/XcAJGJjnk+sZAHLKKJI=;
 b=pBG8bGNDyZRrKWU4DYGBBMFnlkzCmLlLasX/qdF7q4rhIYA82oI0OhQz+2hStfPsyP
 CJNboK22ns/J/+uBCmT+L9ZKZPXs7rD+kr8A209zr+jxv0a7YAQqfdtT4AxVTSiwWwsj
 oiX58F7yaZQ/PQTzvwzfa0PBt0H3NnMCd297c4VfY5GnG9C1Ivz4Elt8ADgETfT2T4V7
 +ruqWdjoF6nQ015SoqDzl/jNkrmote+3DSnVCmtnqwo/ciMZvETEcBEc+lq9XE1OK5RQ
 f9vGzKlo5/RvUgf2e+GCipA6mzm6dp6wTFr0WMWdGdl2D0KkbkmCtGeAHJcGks5GggyD
 4UdQ==
X-Gm-Message-State: AOAM530zhj2hSshJFy+FEi0B6F/N9lhvGJX5VV45wNtynv0OWh1K3X0P
 Ee2Xg+EJ+U123Mu0gkLk0ftTf4tIDQNPtpGsszWbFIiIr60FYYOgT+4swW/YL0mISzq41GjF+lR
 wb+VHrLID5mf3jUMDCWySOnNvbl+fMFt+bbGrxj7pZ0WU9FuTkoPhqzuMT/yv
X-Received: by 2002:a05:600c:4896:: with SMTP id
 j22mr7327332wmp.43.1626214259328; 
 Tue, 13 Jul 2021 15:10:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzx/Gmoq5ndgjugVPG6wwPGM9kRMcqJU/sjnPw7tKEhC0xlg9QuX7UHQlIKjsh4RHFgcy2gow==
X-Received: by 2002:a05:600c:4896:: with SMTP id
 j22mr7327313wmp.43.1626214259099; 
 Tue, 13 Jul 2021 15:10:59 -0700 (PDT)
Received: from redhat.com ([2.55.15.23])
 by smtp.gmail.com with ESMTPSA id t22sm284297wmi.22.2021.07.13.15.10.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 15:10:58 -0700 (PDT)
Date: Tue, 13 Jul 2021 18:10:56 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 16/23] hw/arm/virt: Add default_bus_bypass_iommu machine option
Message-ID: <20210713220946.212562-17-mst@redhat.com>
References: <20210713220946.212562-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210713220946.212562-1-mst@redhat.com>
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
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Xingang Wang <wangxingang5@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Xingang Wang <wangxingang5@huawei.com>

Add a default_bus_bypass_iommu machine option to enable/disable
bypass_iommu for default root bus. The option is disabled by
default and can be enabled with:
$QEMU -machine virt,iommu=smmuv3,default_bus_bypass_iommu=true

Signed-off-by: Xingang Wang <wangxingang5@huawei.com>
Message-Id: <1625748919-52456-4-git-send-email-wangxingang5@huawei.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/arm/virt.h |  1 +
 hw/arm/virt.c         | 26 ++++++++++++++++++++++++++
 2 files changed, 27 insertions(+)

diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 921416f918..9661c46699 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -147,6 +147,7 @@ struct VirtMachineState {
     OnOffAuto acpi;
     VirtGICType gic_version;
     VirtIOMMUType iommu;
+    bool default_bus_bypass_iommu;
     VirtMSIControllerType msi_controller;
     uint16_t virtio_iommu_bdf;
     struct arm_boot_info bootinfo;
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 93ab9d21ea..81eda46b0b 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1367,6 +1367,7 @@ static void create_pcie(VirtMachineState *vms)
     }
 
     pci = PCI_HOST_BRIDGE(dev);
+    pci->bypass_iommu = vms->default_bus_bypass_iommu;
     vms->bus = pci->bus;
     if (vms->bus) {
         for (i = 0; i < nb_nics; i++) {
@@ -2322,6 +2323,21 @@ static void virt_set_iommu(Object *obj, const char *value, Error **errp)
     }
 }
 
+static bool virt_get_default_bus_bypass_iommu(Object *obj, Error **errp)
+{
+    VirtMachineState *vms = VIRT_MACHINE(obj);
+
+    return vms->default_bus_bypass_iommu;
+}
+
+static void virt_set_default_bus_bypass_iommu(Object *obj, bool value,
+                                              Error **errp)
+{
+    VirtMachineState *vms = VIRT_MACHINE(obj);
+
+    vms->default_bus_bypass_iommu = value;
+}
+
 static CpuInstanceProperties
 virt_cpu_index_to_props(MachineState *ms, unsigned cpu_index)
 {
@@ -2661,6 +2677,13 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
                                           "Set the IOMMU type. "
                                           "Valid values are none and smmuv3");
 
+    object_class_property_add_bool(oc, "default_bus_bypass_iommu",
+                                   virt_get_default_bus_bypass_iommu,
+                                   virt_set_default_bus_bypass_iommu);
+    object_class_property_set_description(oc, "default_bus_bypass_iommu",
+                                          "Set on/off to enable/disable "
+                                          "bypass_iommu for default root bus");
+
     object_class_property_add_bool(oc, "ras", virt_get_ras,
                                    virt_set_ras);
     object_class_property_set_description(oc, "ras",
@@ -2728,6 +2751,9 @@ static void virt_instance_init(Object *obj)
     /* Default disallows iommu instantiation */
     vms->iommu = VIRT_IOMMU_NONE;
 
+    /* The default root bus is attached to iommu by default */
+    vms->default_bus_bypass_iommu = false;
+
     /* Default disallows RAS instantiation */
     vms->ras = false;
 
-- 
MST


