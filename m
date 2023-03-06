Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACB5B6AC0FF
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 14:31:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZAvy-00032F-L0; Mon, 06 Mar 2023 08:31:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pZAuz-0002H1-Do
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 08:30:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pZAuw-0007UE-IZ
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 08:30:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678109417;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YNUD2BDhEhX7V0FEnRe/SCADc/rRylFseT1d5wJSPBE=;
 b=ajTCl+uRwW1TH3UCH4HJ/WU2hB1jw5jsEfXfXpxWc1vPKHNHJIM8EY3IKAFXmHRgqdsLJI
 8E/JBG7fn/DCa6WTK9pu2Ukp3rtWGAYKj7NiccimHi7Wjv3TR2Xy9UdVAni89z+hJvdprn
 B6NR6eGVQQgh0zOeIjiOfQrqlqKZAQ4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-357-mCiSxN05NTmXY4M4tdHY5w-1; Mon, 06 Mar 2023 08:30:14 -0500
X-MC-Unique: mCiSxN05NTmXY4M4tdHY5w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CA03C183B3C3;
 Mon,  6 Mar 2023 13:30:13 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.101])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 361E640C10FA;
 Mon,  6 Mar 2023 13:30:13 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 11/16] docs/config: Set the "kvm" accelerator via "[accel]"
 section
Date: Mon,  6 Mar 2023 14:29:57 +0100
Message-Id: <20230306133002.418421-12-thuth@redhat.com>
In-Reply-To: <20230306133002.418421-1-thuth@redhat.com>
References: <20230306133002.418421-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
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

Configuring the accelerator should nowadays be done via the "-accel"
command line parameter, and thus via the "[accel]" section in config
files. We also need this change for the upcoming qtests that will
use these config files, since the qtests are already using "-accel"
for setting the "qtest" accelerator and QEMU does not like mixing
"-accel ..." and "-machine accel=...".

Message-Id: <20230228211533.201837-4-thuth@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 docs/config/mach-virt-graphical.cfg  | 4 +++-
 docs/config/mach-virt-serial.cfg     | 4 +++-
 docs/config/q35-emulated.cfg         | 2 ++
 docs/config/q35-virtio-graphical.cfg | 2 ++
 docs/config/q35-virtio-serial.cfg    | 2 ++
 5 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/docs/config/mach-virt-graphical.cfg b/docs/config/mach-virt-graphical.cfg
index d6d31b17f5..eba76eb198 100644
--- a/docs/config/mach-virt-graphical.cfg
+++ b/docs/config/mach-virt-graphical.cfg
@@ -56,9 +56,11 @@
 
 [machine]
   type = "virt"
-  accel = "kvm"
   gic-version = "host"
 
+[accel]
+  accel = "kvm"
+
 [memory]
   size = "1024"
 
diff --git a/docs/config/mach-virt-serial.cfg b/docs/config/mach-virt-serial.cfg
index 18a7c83731..324b0542ff 100644
--- a/docs/config/mach-virt-serial.cfg
+++ b/docs/config/mach-virt-serial.cfg
@@ -62,9 +62,11 @@
 
 [machine]
   type = "virt"
-  accel = "kvm"
   gic-version = "host"
 
+[accel]
+  accel = "kvm"
+
 [memory]
   size = "1024"
 
diff --git a/docs/config/q35-emulated.cfg b/docs/config/q35-emulated.cfg
index 99ac918e78..c8806e6d36 100644
--- a/docs/config/q35-emulated.cfg
+++ b/docs/config/q35-emulated.cfg
@@ -61,6 +61,8 @@
 
 [machine]
   type = "q35"
+
+[accel]
   accel = "kvm"
 
 [memory]
diff --git a/docs/config/q35-virtio-graphical.cfg b/docs/config/q35-virtio-graphical.cfg
index 4207f11e4f..148b5d2c5e 100644
--- a/docs/config/q35-virtio-graphical.cfg
+++ b/docs/config/q35-virtio-graphical.cfg
@@ -55,6 +55,8 @@
 
 [machine]
   type = "q35"
+
+[accel]
   accel = "kvm"
 
 [memory]
diff --git a/docs/config/q35-virtio-serial.cfg b/docs/config/q35-virtio-serial.cfg
index d2830aec5e..023291390e 100644
--- a/docs/config/q35-virtio-serial.cfg
+++ b/docs/config/q35-virtio-serial.cfg
@@ -60,6 +60,8 @@
 
 [machine]
   type = "q35"
+
+[accel]
   accel = "kvm"
 
 [memory]
-- 
2.31.1


