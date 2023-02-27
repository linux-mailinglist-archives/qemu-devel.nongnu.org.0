Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C41A26A4538
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 15:53:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWerl-0000LB-3C; Mon, 27 Feb 2023 09:52:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ernunes@redhat.com>)
 id 1pWerj-0000JX-2X
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:52:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ernunes@redhat.com>)
 id 1pWerh-0002AY-Ek
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:52:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677509552;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=FfDNu4ow+Ntdfdp7m5E6yLvwuO/GqJRY+e2EfHPN7Mc=;
 b=dm/sqqvFtppiUZauBQRKWoKo+eFaeagXxXk4ML0dXj1jctpAjVBO7g5OHflwKvYkaOYQHo
 L9rmwwYPVj48JqXr7SJe4KfkdZ9RZMyDBWs1nBENkT76A47j/MIodtFYqASxQXI7gjAeUk
 ZQet26pjza5hzHVFEup2o6DXi6RLqwI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-277-FHbhVAY8P4G6EPo2_dcy-w-1; Mon, 27 Feb 2023 09:52:30 -0500
X-MC-Unique: FHbhVAY8P4G6EPo2_dcy-w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8E3F11871D9D
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 14:52:30 +0000 (UTC)
Received: from centennial.enunes.eu (unknown [10.43.17.81])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1C50518EC7;
 Mon, 27 Feb 2023 14:52:30 +0000 (UTC)
From: Erico Nunes <ernunes@redhat.com>
To: qemu-devel@nongnu.org
Cc: Erico Nunes <ernunes@redhat.com>
Subject: [PATCH] tests/acceptance/virtio-gpu.py: update fedora URL
Date: Mon, 27 Feb 2023 15:52:22 +0100
Message-Id: <20230227145222.360719-1-ernunes@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=ernunes@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The URL listed previously is no longer valid and that caused the test
to skip.

Signed-off-by: Erico Nunes <ernunes@redhat.com>
---
 tests/avocado/virtio-gpu.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/avocado/virtio-gpu.py b/tests/avocado/virtio-gpu.py
index 2a249a3a2c..e3b58fe799 100644
--- a/tests/avocado/virtio-gpu.py
+++ b/tests/avocado/virtio-gpu.py
@@ -36,13 +36,13 @@ class VirtioGPUx86(QemuSystemTest):
 
     KERNEL_COMMAND_LINE = "printk.time=0 console=ttyS0 rdinit=/bin/bash"
     KERNEL_URL = (
-        "https://archives.fedoraproject.org/pub/fedora"
+        "https://archives.fedoraproject.org/pub/archive/fedora"
         "/linux/releases/33/Everything/x86_64/os/images"
         "/pxeboot/vmlinuz"
     )
     KERNEL_HASH = '1433cfe3f2ffaa44de4ecfb57ec25dc2399cdecf'
     INITRD_URL = (
-        "https://archives.fedoraproject.org/pub/fedora"
+        "https://archives.fedoraproject.org/pub/archive/fedora"
         "/linux/releases/33/Everything/x86_64/os/images"
         "/pxeboot/initrd.img"
     )
-- 
2.39.2


