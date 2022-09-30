Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 026E85F05E3
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Sep 2022 09:40:37 +0200 (CEST)
Received: from localhost ([::1]:59474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeAdP-0002Ea-Kt
	for lists+qemu-devel@lfdr.de; Fri, 30 Sep 2022 03:40:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1oeAYz-0007y4-3o
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 03:36:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1oeAYx-0006bM-6H
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 03:36:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664523358;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=Of1AtkM84qaowSNs9rl8Ms6Mrwaj03kW3fLY4NFyT2g=;
 b=GOAhPd4rEB7+evBjFVZykkzB/svYqF6OWwLzuxe9PUlPlS/lVRQkMSwC0uIX6xR/CX1fzN
 24CquOkqHuZ52ckw1HZkaRtGZd5y0nYlVPeF261kV0p/YA5iZwA2agbW+YuOdIT4ZitkQ8
 bb+ervOz6XPvCsCPFWy0GW3FirdL6TE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-669-oGGkVN6hN_-k-jYyfzVXfQ-1; Fri, 30 Sep 2022 03:35:55 -0400
X-MC-Unique: oGGkVN6hN_-k-jYyfzVXfQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BAA56185A794;
 Fri, 30 Sep 2022 07:35:54 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.194.9])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 799A640C6EC2;
 Fri, 30 Sep 2022 07:35:54 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 2FC6B180039F; Fri, 30 Sep 2022 09:35:53 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, peter.maydell@linaro.org,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH] pci-ids: sync docs + header
Date: Fri, 30 Sep 2022 09:35:53 +0200
Message-Id: <20220930073553.1626190-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.08,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

docs/specs/pci-ids.txt and include/hw/pci/pci.h are out of sync,
fix that.  Try improve the comment which points to pci-ids.txt.

Also drop the list of modern virtio devices and explain how they
are calculated instead.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 docs/specs/pci-ids.txt | 19 ++++++++++---------
 include/hw/pci/pci.h   |  7 ++++++-
 2 files changed, 16 insertions(+), 10 deletions(-)

diff --git a/docs/specs/pci-ids.txt b/docs/specs/pci-ids.txt
index dd6859d039d0..6be7bc108d66 100644
--- a/docs/specs/pci-ids.txt
+++ b/docs/specs/pci-ids.txt
@@ -22,16 +22,17 @@ maintained as part of the virtio specification.
 1af4:1004  SCSI host bus adapter device (legacy)
 1af4:1005  entropy generator device (legacy)
 1af4:1009  9p filesystem device (legacy)
+1af4:1012  vsock device (legacy)
+1af4:1013  pmem device (legacy)
+1af4:1014  iommu device (legacy)
+1af4:1015  mem device (legacy)
 
-1af4:1041  network device (modern)
-1af4:1042  block device (modern)
-1af4:1043  console device (modern)
-1af4:1044  entropy generator device (modern)
-1af4:1045  balloon device (modern)
-1af4:1048  SCSI host bus adapter device (modern)
-1af4:1049  9p filesystem device (modern)
-1af4:1050  virtio gpu device (modern)
-1af4:1052  virtio input device (modern)
+1af4:1040  Start of id range for modern virtio devices.  The pci device
+           id is is calculated from the virtio device id by adding the
+           0x1040 offset.  The virtio ids are defined in the virtio
+           specification.  The linux kernel has a header file with
+           defines for all virtio ids (linux/virtio_ids.h), qemu has a
+           copy in include/standard-headers/.
 
 1af4:10f0  Available for experimental usage without registration.  Must get
    to      official ID when the code leaves the test lab (i.e. when seeking
diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index b54b6ef88fc3..3b852199660c 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -71,7 +71,12 @@ extern bool pci_available;
 #define PCI_DEVICE_ID_INTEL_82557        0x1229
 #define PCI_DEVICE_ID_INTEL_82801IR      0x2922
 
-/* Red Hat / Qumranet (for QEMU) -- see pci-ids.txt */
+/*
+ * Red Hat / Qumranet (for QEMU)
+ *
+ * These are documented in docs/specs/pci-ids.txt
+ * PLEASE KEEP HEADER + DOCS IN SYNC
+ */
 #define PCI_VENDOR_ID_REDHAT_QUMRANET    0x1af4
 #define PCI_SUBVENDOR_ID_REDHAT_QUMRANET 0x1af4
 #define PCI_SUBDEVICE_ID_QEMU            0x1100
-- 
2.37.3


