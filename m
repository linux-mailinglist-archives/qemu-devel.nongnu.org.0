Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5880A4D068B
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 19:29:41 +0100 (CET)
Received: from localhost ([::1]:51528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRI72-0002tr-F1
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 13:29:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nRI4F-0006Nx-C6
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 13:26:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34549)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nRI4C-0006vx-JU
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 13:26:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646677604;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CZcRev6dak5jHn4OPlzNvAkuaUy+LlgU7RE/6Nbqav4=;
 b=WXlDviQy8qhJLSpV3tj/uam+JEhVs7p6KDsiYr/Vc+vPdL6bXiltmJdij6okk7Rf2U8wQA
 16ePB/WWkr5VIoIxLJSc8ntUmb+x60AL/urNL7P7K9DpJGye5jCwnFoPsPLBw0GusscuTp
 wvyViwq1nuWJ+lDn5CNgoqBO6Ym3/6A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-27-9TKcNlz5OLqXVzXNYzPjiA-1; Mon, 07 Mar 2022 13:26:35 -0500
X-MC-Unique: 9TKcNlz5OLqXVzXNYzPjiA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 96F5F801AEB;
 Mon,  7 Mar 2022 18:26:27 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.10])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6D66880FCB;
 Mon,  7 Mar 2022 18:26:26 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 6/7] tests/vm: Update haiku test vm to R1/Beta3
Date: Mon,  7 Mar 2022 19:26:08 +0100
Message-Id: <20220307182609.94466-7-thuth@redhat.com>
In-Reply-To: <20220307182609.94466-1-thuth@redhat.com>
References: <20220307182609.94466-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alexander von Gluck IV <kallisti5@unixzen.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The old image did not have python3 yet, and thus was not usable
for compiling QEMU anymore.

Suggested-by: Alexander von Gluck IV <kallisti5@unixzen.com>
Message-Id: <20220216154208.2985103-1-kallisti5@unixzen.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/vm/haiku.x86_64 | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/vm/haiku.x86_64 b/tests/vm/haiku.x86_64
index 2eb736dae1..936f7d2ae2 100755
--- a/tests/vm/haiku.x86_64
+++ b/tests/vm/haiku.x86_64
@@ -2,7 +2,7 @@
 #
 # Haiku VM image
 #
-# Copyright 2020 Haiku, Inc.
+# Copyright 2020-2022 Haiku, Inc.
 #
 # Authors:
 #  Alexander von Gluck IV <kallisti5@unixzen.com>
@@ -48,8 +48,8 @@ class HaikuVM(basevm.BaseVM):
     name = "haiku"
     arch = "x86_64"
 
-    link = "https://app.vagrantup.com/haiku-os/boxes/r1beta2-x86_64/versions/20200702/providers/libvirt.box"
-    csum = "41c38b316e0cbdbc66b5dbaf3612b866700a4f35807cb1eb266a5bf83e9e68d5"
+    link = "https://app.vagrantup.com/haiku-os/boxes/r1beta3-x86_64/versions/20220216/providers/libvirt.box"
+    csum = "e67d4aacbcc687013d5cc91990ddd86cc5d70a5d28432ae2691944f8ce5d5041"
 
     poweroff = "shutdown"
 
@@ -99,7 +99,7 @@ class HaikuVM(basevm.BaseVM):
 
         self.print_step("Extracting disk image")
 
-        subprocess.check_call(["tar", "xzf", tarball, "./box.img", "-O"],
+        subprocess.check_call(["tar", "xzf", tarball, "box.img", "-O"],
                               stdout=open(img, 'wb'))
 
         self.print_step("Preparing disk image")
-- 
2.27.0


