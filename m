Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35A2B5F4201
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 13:30:03 +0200 (CEST)
Received: from localhost ([::1]:57658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofg7d-0000EU-D8
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 07:30:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1offz5-0005h5-Gj
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 07:21:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48713)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1offz1-0007fh-4e
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 07:21:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664882466;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=926SWnSLMccgBjkjxqbW8eiulrqp6UsBpHGdDxmGoIQ=;
 b=FpS8jQe077APzR+KKOg+67mZMfuL92nZZnfpHtTESNY9qDyKSZf/NXkfLDFDHw/C8d6T9Y
 kYPOWcydrZA6SLtPXMsRrl9zqQIidmdXF3W4nhHlVMlFpPw/ivVhV6s0f8JTNcWpe6UxT7
 18CQQ2yvO7FxV9UQYwoEfenhZBPKqKA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-507-Yar-san9McO5r0cGVnUgjQ-1; Tue, 04 Oct 2022 07:21:05 -0400
X-MC-Unique: Yar-san9McO5r0cGVnUgjQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E22E085A59D;
 Tue,  4 Oct 2022 11:21:04 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.48])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A1A40112132D;
 Tue,  4 Oct 2022 11:21:04 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 9E08B1800916; Tue,  4 Oct 2022 13:21:00 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 David Hildenbrand <david@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 peter.maydell@linaro.org, Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH v3 4/5] pci-ids: drop list of modern virtio devices
Date: Tue,  4 Oct 2022 13:20:59 +0200
Message-Id: <20221004112100.301935-5-kraxel@redhat.com>
In-Reply-To: <20221004112100.301935-1-kraxel@redhat.com>
References: <20221004112100.301935-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Reviewed-by: Eric Auger <eric.auger@redhat.com>
---
 docs/specs/pci-ids.txt | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/docs/specs/pci-ids.txt b/docs/specs/pci-ids.txt
index dd6859d039d0..e463c4cb3a22 100644
--- a/docs/specs/pci-ids.txt
+++ b/docs/specs/pci-ids.txt
@@ -22,16 +22,14 @@ maintained as part of the virtio specification.
 1af4:1004  SCSI host bus adapter device (legacy)
 1af4:1005  entropy generator device (legacy)
 1af4:1009  9p filesystem device (legacy)
+1af4:1012  vsock device (bug compatibility)
 
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


