Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29531671AC8
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 12:36:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pI6ip-0004iX-62; Wed, 18 Jan 2023 06:35:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pI6iC-0004VE-VC
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 06:34:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pI6iB-0007Wd-7L
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 06:34:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674041672;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mdnZEpuoMfaGyB/okDeCbKRXA7qRtMoAtAqUKfUdOxM=;
 b=JH9IKSJlNUmwkY7w9Q/HT5iLlzUqZACCYeNv5u25qKTEJP3S+rGZiNexYKYAd30+erKVFI
 wUH8sgfE6NH40YOFj9S+nX6YKuugEZnlzslZAt9d341f7j+em38yulgAsO9yCNPZdyMt4A
 00KPmin8xT05uTLCCjUanI3hvGSqISU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-500-q7B9X7fwMCynD1pQovIWhQ-1; Wed, 18 Jan 2023 06:34:31 -0500
X-MC-Unique: q7B9X7fwMCynD1pQovIWhQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D2B5B85C6E2;
 Wed, 18 Jan 2023 11:34:30 +0000 (UTC)
Received: from thuth.com (unknown [10.39.194.54])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0EF3D492B01;
 Wed, 18 Jan 2023 11:34:29 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 8/9] tests/vm/haiku.x86_64: Update the Haiku VM to Beta 4
Date: Wed, 18 Jan 2023 12:34:17 +0100
Message-Id: <20230118113418.1650416-9-thuth@redhat.com>
In-Reply-To: <20230118113418.1650416-1-thuth@redhat.com>
References: <20230118113418.1650416-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
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

The old Haiku VM based on Beta 3 does not work anymore since it
fails to install the additional packages now that Beta 4 has been
released. Thanks to Alexander von Gluck IV for providing a new
image based on Beta 4, we can now upgrade the test image in our
QEMU CI, too, to get this working again.

Note that Haiku Beta 4 apparently finally fixed the issue with
the enumeration of the virtio-block devices (see the ticket at
https://dev.haiku-os.org/ticket/16512 ) - the tarball disk can
now be found at index 1 instead of index 0.

Message-Id: <20230116083014.55647-1-thuth@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/vm/haiku.x86_64 | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/tests/vm/haiku.x86_64 b/tests/vm/haiku.x86_64
index 29668bc272..71cf75a9a3 100755
--- a/tests/vm/haiku.x86_64
+++ b/tests/vm/haiku.x86_64
@@ -48,8 +48,8 @@ class HaikuVM(basevm.BaseVM):
     name = "haiku"
     arch = "x86_64"
 
-    link = "https://app.vagrantup.com/haiku-os/boxes/r1beta3-x86_64/versions/20220216/providers/libvirt.box"
-    csum = "e67d4aacbcc687013d5cc91990ddd86cc5d70a5d28432ae2691944f8ce5d5041"
+    link = "https://app.vagrantup.com/haiku-os/boxes/r1beta4-x86_64/versions/20230114/providers/libvirt.box"
+    csum = "6e72a2a470e03dbc3c5e808664e057bb4022b390dca88e4c7da6188f26f6a3c9"
 
     poweroff = "shutdown"
 
@@ -80,13 +80,12 @@ class HaikuVM(basevm.BaseVM):
         "ninja",
     ]
 
-    # https://dev.haiku-os.org/ticket/16512 virtio disk1 shows up as 0 (reversed order)
     BUILD_SCRIPT = """
         set -e;
         rm -rf /tmp/qemu-test.*
         cd $(mktemp -d /tmp/qemu-test.XXXXXX);
         mkdir src build; cd src;
-        tar -xf /dev/disk/virtual/virtio_block/0/raw;
+        tar -xf /dev/disk/virtual/virtio_block/1/raw;
         mkdir -p /usr/bin
         ln -s /boot/system/bin/env /usr/bin/env
         cd ../build
-- 
2.31.1


