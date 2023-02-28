Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB08D6A611C
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 22:17:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pX7KH-0004Rb-1S; Tue, 28 Feb 2023 16:15:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pX7KB-0004OH-Gv
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 16:15:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pX7KA-0004Lc-0c
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 16:15:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677618949;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ty0CpmuPbm7lxdYiWy2xbMLW7aVn2k8hXr8E+HzIdhM=;
 b=KmGMKIPBDGn1MLUM86pxrkzXU6xPM616FtxAjL0L0a1shP0dWIf+aDq4MudfX2HmVbV5RO
 PnICG38QGyFtgS9zPQR2rnnxeGoJ0r7t2YbZFE6DSmVzjD/7T0RDhvEdoUaNmhncTFP2Ex
 U4ilFBmM+edFXJgvQNaZ/kgBe7sYfz4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-395-JRRx7JQPPe2DhUNIBv2VNQ-1; Tue, 28 Feb 2023 16:15:46 -0500
X-MC-Unique: JRRx7JQPPe2DhUNIBv2VNQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B4FC98828C1;
 Tue, 28 Feb 2023 21:15:45 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.105])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BF48940C6EC4;
 Tue, 28 Feb 2023 21:15:44 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Laurent Vivier <lvivier@redhat.com>
Subject: [PATCH 3/6] docs/config: Set the "kvm" accelerator via "[accel]"
 section
Date: Tue, 28 Feb 2023 22:15:30 +0100
Message-Id: <20230228211533.201837-4-thuth@redhat.com>
In-Reply-To: <20230228211533.201837-1-thuth@redhat.com>
References: <20230228211533.201837-1-thuth@redhat.com>
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


