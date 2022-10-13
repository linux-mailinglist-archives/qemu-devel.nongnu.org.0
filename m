Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DFE95FD606
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 10:14:42 +0200 (CEST)
Received: from localhost ([::1]:45590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oitMX-0004nf-4E
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 04:14:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ois6E-0005Wp-Tc
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 02:53:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ois6A-0006uG-6p
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 02:53:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665644021;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HVRGforIOSrop9TS6FZkictES+zjhFwXTuBWX+p4rkQ=;
 b=JRG6DmyTFvLh8/GIV1veFjvYp/avFnFO6XlZICZACwqQiQsMBC0/77dR+Ddf9tf9RjXkAw
 /zqZZ9nJ+rG2SWcjzbdPISwldYzFyPjEfa7rvpCaP08QKHVj5T4Vmue/gQzpc6uXpNcVkD
 TnF+ABg6aJMkYTZLx+ei9xgdspad/p0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-399-K8Yk280YN5C9a5DQ3DYhfQ-1; Thu, 13 Oct 2022 02:53:40 -0400
X-MC-Unique: K8Yk280YN5C9a5DQ3DYhfQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9ED1286C043;
 Thu, 13 Oct 2022 06:53:39 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.195.183])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3F9DB7AE5;
 Thu, 13 Oct 2022 06:53:39 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 7C6131800D53; Thu, 13 Oct 2022 08:52:25 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Kashyap Chamarthy <kchamart@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Eric Blake <eblake@redhat.com>
Subject: [PULL 20/26] pci-ids: drop list of modern virtio devices
Date: Thu, 13 Oct 2022 08:52:18 +0200
Message-Id: <20221013065224.1864145-21-kraxel@redhat.com>
In-Reply-To: <20221013065224.1864145-1-kraxel@redhat.com>
References: <20221013065224.1864145-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Message-Id: <20221004112100.301935-5-kraxel@redhat.com>
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


