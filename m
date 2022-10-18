Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72E4F603552
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 23:59:18 +0200 (CEST)
Received: from localhost ([::1]:34696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okucH-0008JM-2f
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 17:59:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1okuXT-0004Mh-DW
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 17:54:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57071)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1okuXN-0002ob-1U
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 17:54:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666130051;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=w1OViqcuAX0zt86RJKXfGeWW2SDKSltt/vAoEqbFHlU=;
 b=h1evQx24XCuPiFGT01Qp1FiJkrGsKZXRe400ByAAXmKGAewlkLAIPnyNy86WAs8cBAinP2
 OfBfav4w8QevfOlW8jNiP/hMhyxAiyJ4IdVeluPH72HI9FBCGjiSFagrX4AhoxkpREyOWX
 rY5Kn05pbNtZg9bWsat8Rymz3Yhsxp0=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-609-vqXpAcG6OEyDHUxTGqZbLA-1; Tue, 18 Oct 2022 17:54:10 -0400
X-MC-Unique: vqXpAcG6OEyDHUxTGqZbLA-1
Received: by mail-qk1-f197.google.com with SMTP id
 h9-20020a05620a244900b006ee944ec451so13415750qkn.13
 for <qemu-devel@nongnu.org>; Tue, 18 Oct 2022 14:54:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=w1OViqcuAX0zt86RJKXfGeWW2SDKSltt/vAoEqbFHlU=;
 b=65n0wjvQDA5tOWy0e8jDzbnwniTxUOGVMosisxKSjOuFe3PWJhHvqOrpZTReak/3ok
 7WmcH+A4T5IiLf+bBpcOpj0R7EroBlHrzKLX8jS+N9sgvnO39pdt9FLwdTeMQX70mumZ
 a8lrTidvYFmIMb03bK9M7QeyxzEWulkdgBETHoJxa2nxRrb4lCZPIfhd1/F9KCNI3tuE
 vz0XrkMzfPV7KBVsbaweps34y3MFnYY94ftd1PlzMsqPjALdgnKki+mAq+GYN7PfgzCw
 nAhW3D0l8fQbwH41Uj4AVpyqBc3XHzufwlEtxbtQcVz1aYcQWFDgd+3t34JSfWHCFVSx
 fqTg==
X-Gm-Message-State: ACrzQf0kzTKq53GDkAq7teJJGrpdU3UOEFNqxA5KhF40WBKc5wbe8Xfe
 FBR4q95xkkJAlRmEpmbz0uz7c9rwy0+Ha72a0f67GiIS2IyZE6l0zcZ4cAPNWNexmpUQHCq6AWO
 GDeVChDX3mwDUC9naR4EaA16AurHkTMScdUoIp92jA7GXFyL3eI03BMV4pZhMBvQ7
X-Received: by 2002:ac8:5dcc:0:b0:39c:ef34:8a23 with SMTP id
 e12-20020ac85dcc000000b0039cef348a23mr3927976qtx.615.1666130049760; 
 Tue, 18 Oct 2022 14:54:09 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM56/lDgimHFHJxdteCtADswbflI/1SuBQw11o69cgHWcQ2wI3ctIOI11yEbb61eu1vcK+38nA==
X-Received: by 2002:ac8:5dcc:0:b0:39c:ef34:8a23 with SMTP id
 e12-20020ac85dcc000000b0039cef348a23mr3927960qtx.615.1666130049484; 
 Tue, 18 Oct 2022 14:54:09 -0700 (PDT)
Received: from x1n.redhat.com
 (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca. [70.31.27.79])
 by smtp.gmail.com with ESMTPSA id
 l20-20020a05620a28d400b006b8e8c657ccsm3303249qkp.117.2022.10.18.14.54.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Oct 2022 14:54:08 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: Jason Wang <jasowang@redhat.com>, peterx@redhat.com,
 Eric Auger <eric.auger@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
Subject: [PATCH] x86-iommu: Fail flag registration of DEVIOTLB if DT not
 supported
Date: Tue, 18 Oct 2022 17:54:07 -0400
Message-Id: <20221018215407.363986-1-peterx@redhat.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.256,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

All x86 IOMMUs need to fail DEVIOTLB notification registrations if DT is
not supported.  Otherwise any device (e.g. vhost) can register with
DEVIOTLB but it'll never receive the notifications, causing device not
operational.

Fixes: b68ba1ca57 ("memory: Add IOMMU_NOTIFIER_DEVIOTLB_UNMAP IOMMUTLBNotificationType")
Reported-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 hw/i386/amd_iommu.c   | 8 ++++++++
 hw/i386/intel_iommu.c | 7 +++++++
 2 files changed, 15 insertions(+)

diff --git a/hw/i386/amd_iommu.c b/hw/i386/amd_iommu.c
index 725f69095b..42486e790f 100644
--- a/hw/i386/amd_iommu.c
+++ b/hw/i386/amd_iommu.c
@@ -1476,6 +1476,7 @@ static int amdvi_iommu_notify_flag_changed(IOMMUMemoryRegion *iommu,
                                            Error **errp)
 {
     AMDVIAddressSpace *as = container_of(iommu, AMDVIAddressSpace, iommu);
+    X86IOMMUState *x86_iommu = X86_IOMMU_DEVICE(as->iommu_state);
 
     if (new & IOMMU_NOTIFIER_MAP) {
         error_setg(errp,
@@ -1484,6 +1485,13 @@ static int amdvi_iommu_notify_flag_changed(IOMMUMemoryRegion *iommu,
                    PCI_FUNC(as->devfn));
         return -EINVAL;
     }
+
+    if ((new & IOMMU_NOTIFIER_DEVIOTLB_UNMAP) && !x86_iommu->dt_supported) {
+        error_setg_errno(errp, ENOTSUP,
+                         "Device-iotlb not declared support for vIOMMU");
+        return -ENOTSUP;
+    }
+
     return 0;
 }
 
diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
index 6524c2ee32..a07d9631b0 100644
--- a/hw/i386/intel_iommu.c
+++ b/hw/i386/intel_iommu.c
@@ -3057,6 +3057,7 @@ static int vtd_iommu_notify_flag_changed(IOMMUMemoryRegion *iommu,
 {
     VTDAddressSpace *vtd_as = container_of(iommu, VTDAddressSpace, iommu);
     IntelIOMMUState *s = vtd_as->iommu_state;
+    X86IOMMUState *x86_iommu = X86_IOMMU_DEVICE(s);
 
     /* TODO: add support for VFIO and vhost users */
     if (s->snoop_control) {
@@ -3065,6 +3066,12 @@ static int vtd_iommu_notify_flag_changed(IOMMUMemoryRegion *iommu,
         return -ENOTSUP;
     }
 
+    if ((new & IOMMU_NOTIFIER_DEVIOTLB_UNMAP) && !x86_iommu->dt_supported) {
+        error_setg_errno(errp, ENOTSUP,
+                         "Device-iotlb not declared support for vIOMMU");
+        return -ENOTSUP;
+    }
+
     /* Update per-address-space notifier flags */
     vtd_as->notifier_flags = new;
 
-- 
2.37.3


