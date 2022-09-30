Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BEBC5F0D7B
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Sep 2022 16:25:56 +0200 (CEST)
Received: from localhost ([::1]:51738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeGxf-0005aL-LE
	for lists+qemu-devel@lfdr.de; Fri, 30 Sep 2022 10:25:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1oeGX2-000454-QD
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 09:58:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30829)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1oeGWv-0002OF-QH
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 09:58:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664546297;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Hit5reDY+zV0s5xPyqJVxKPNxv5xgy3vfjKZttxQXHY=;
 b=YAaHdrGfwO2pLcgOekz3JpIUtuvLX56gdoGVQNKVJmw9VRlPCTj04QxIR0c02BHvIxLpYQ
 2JsNIr4KgTNrFQG+nL2v8rLoK8K2bzrV84pbpvTBhHafHqICvGeQ5VgP3ZBnUp118BdcKr
 lreuV2Cf68Q+g63nqAxZlHfz244k4kA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-263-cAtD_9Q1MMqEUKAIxtvo-g-1; Fri, 30 Sep 2022 09:58:15 -0400
X-MC-Unique: cAtD_9Q1MMqEUKAIxtvo-g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6F6F32A2AD7A;
 Fri, 30 Sep 2022 13:58:15 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.194.9])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2FBC817582;
 Fri, 30 Sep 2022 13:58:15 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 321441800634; Fri, 30 Sep 2022 15:58:11 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: Eric Auger <eric.auger@redhat.com>, David Hildenbrand <david@redhat.com>,
 peter.maydell@linaro.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH v2 5/5] pci-ids: drop list of modern virtio devices
Date: Fri, 30 Sep 2022 15:58:10 +0200
Message-Id: <20220930135810.1892149-6-kraxel@redhat.com>
In-Reply-To: <20220930135810.1892149-1-kraxel@redhat.com>
References: <20220930135810.1892149-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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

Drop the list of modern virtio devices and explain how they
are calculated instead.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 docs/specs/pci-ids.txt | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/docs/specs/pci-ids.txt b/docs/specs/pci-ids.txt
index dd6859d039d0..a289d2de6521 100644
--- a/docs/specs/pci-ids.txt
+++ b/docs/specs/pci-ids.txt
@@ -23,15 +23,12 @@ maintained as part of the virtio specification.
 1af4:1005  entropy generator device (legacy)
 1af4:1009  9p filesystem device (legacy)
 
-1af4:1041  network device (modern)
-1af4:1042  block device (modern)
-1af4:1043  console device (modern)
-1af4:1044  entropy generator device (modern)
-1af4:1045  balloon device (modern)
-1af4:1048  SCSI host bus adapter device (modern)
-1af4:1049  9p filesystem device (modern)
-1af4:1050  virtio gpu device (modern)
-1af4:1052  virtio input device (modern)
+1af4:1040  Start of ID range for modern virtio devices.  The PCI device
+   to      ID is calculated from the virtio device ID by adding the
+1af4:10ef  0x1040 offset.  The virtio IDs are defined in the virtio
+           specification.  The Linux kernel has a header file with
+           defines for all virtio IDs (linux/virtio_ids.h), qemu has a
+           copy in include/standard-headers/.
 
 1af4:10f0  Available for experimental usage without registration.  Must get
    to      official ID when the code leaves the test lab (i.e. when seeking
-- 
2.37.3


