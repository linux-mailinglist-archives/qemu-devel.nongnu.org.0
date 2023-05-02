Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 094DE6F421E
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 12:59:34 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptnhK-0000Tc-6P; Tue, 02 May 2023 06:57:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ptnhJ-0000TK-5j
 for qemu-devel@nongnu.org; Tue, 02 May 2023 06:57:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ptnhH-0001gk-92
 for qemu-devel@nongnu.org; Tue, 02 May 2023 06:57:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683025045;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=CAKlNIQIcdNAPc1qyhk5mi9lRYD9ZstMd0kvbsFB3JI=;
 b=agC0d3BfVdKHw6S9iPMIuF/WfwlmvR/Ywo/Tfg3Cdno6v/ajd3BDvwiIdPKYDTox0uGlTw
 Zq0xwdNgP4hjeIfRM+q8rPUmovHsC88daTswKKgtgmy9ObTWRCMKebEWhazgtGJMpg4qpC
 yBFV1TPMyToHNCq2sFH/tJGcwYjKzIM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-272-h6WgH5vTNYuaXHyBMtA9WQ-1; Tue, 02 May 2023 06:57:24 -0400
X-MC-Unique: h6WgH5vTNYuaXHyBMtA9WQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E8A3C2808E66;
 Tue,  2 May 2023 10:57:23 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.34])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 953011410F24;
 Tue,  2 May 2023 10:57:22 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Cc: Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH] tests/avocado/virtio-gpu: Fix the URLs of the
 test_virtio_vga_virgl test
Date: Tue,  2 May 2023 12:57:21 +0200
Message-Id: <20230502105721.1661930-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

The URLs here are not valid anymore - looks like the assets got moved
into the pub/archive/ subfolder instead.

Signed-off-by: Thomas Huth <thuth@redhat.com>
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
2.31.1


