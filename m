Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 846CE301603
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Jan 2021 15:43:47 +0100 (CET)
Received: from localhost ([::1]:33426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3K8g-0002hA-ER
	for lists+qemu-devel@lfdr.de; Sat, 23 Jan 2021 09:43:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l3JxJ-0003kB-WC
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 09:32:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43179)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l3JxH-0005tU-Oq
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 09:32:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611412319;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1xlfM26FRa4QdrmeCC+2ZYchQHPUBCTwxMO/xPjceZE=;
 b=g0vfDJUO9c7w+7gRWQLzlNBtMVfqaWWKFavKqcKh9ZNL4252IXx5Jib886o4Eba63iC4/8
 hRX+oVGZu7jpG0SoKXthE+deKHRITXTXDq0NTUESfv/LH463SLXY9aGw1GHZwhtSNkuz9L
 FVZpfpVCYSmzRS0OwD7tSKCSKub+8Ek=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-537-OWNENiT3PDSjG5uUUCrOkg-1; Sat, 23 Jan 2021 09:31:57 -0500
X-MC-Unique: OWNENiT3PDSjG5uUUCrOkg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 40821801F97
 for <qemu-devel@nongnu.org>; Sat, 23 Jan 2021 14:31:56 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EE5535D9CC;
 Sat, 23 Jan 2021 14:31:55 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 23/31] meson.build: Declare global edk2_targets /
 install_edk2_blobs variables
Date: Sat, 23 Jan 2021 09:31:20 -0500
Message-Id: <20210123143128.1167797-24-pbonzini@redhat.com>
In-Reply-To: <20210123143128.1167797-1-pbonzini@redhat.com>
References: <20210123143128.1167797-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.165,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Globally declare in the main meson.build:
- the list of EDK2 targets,
- whether the EDK2 blobs have to be installed.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210114174509.2944817-2-philmd@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build                     |  8 ++++++++
 pc-bios/descriptors/meson.build | 30 ++++++++++++++++--------------
 pc-bios/meson.build             |  5 +----
 3 files changed, 25 insertions(+), 18 deletions(-)

diff --git a/meson.build b/meson.build
index bd6ad06d58..ed4eb70cb5 100644
--- a/meson.build
+++ b/meson.build
@@ -88,6 +88,14 @@ if cpu in ['x86', 'x86_64']
   }
 endif
 
+edk2_targets = [ 'arm-softmmu', 'aarch64-softmmu', 'i386-softmmu', 'x86_64-softmmu' ]
+install_edk2_blobs = false
+if get_option('install_blobs')
+  foreach target : target_dirs
+    install_edk2_blobs = install_edk2_blobs or target in edk2_targets
+  endforeach
+endif
+
 ##################
 # Compiler flags #
 ##################
diff --git a/pc-bios/descriptors/meson.build b/pc-bios/descriptors/meson.build
index 7040834573..ac6ec66b00 100644
--- a/pc-bios/descriptors/meson.build
+++ b/pc-bios/descriptors/meson.build
@@ -1,14 +1,16 @@
-foreach f: [
-  '50-edk2-i386-secure.json',
-  '50-edk2-x86_64-secure.json',
-  '60-edk2-aarch64.json',
-  '60-edk2-arm.json',
-  '60-edk2-i386.json',
-  '60-edk2-x86_64.json'
-]
-  configure_file(input: files(f),
-                 output: f,
-                 configuration: {'DATADIR': qemu_datadir},
-                 install: get_option('install_blobs'),
-                 install_dir: qemu_datadir / 'firmware')
-endforeach
+if install_edk2_blobs
+  foreach f: [
+    '50-edk2-i386-secure.json',
+    '50-edk2-x86_64-secure.json',
+    '60-edk2-aarch64.json',
+    '60-edk2-arm.json',
+    '60-edk2-i386.json',
+    '60-edk2-x86_64.json'
+  ]
+    configure_file(input: files(f),
+                   output: f,
+                   configuration: {'DATADIR': qemu_datadir},
+                   install: get_option('install_blobs'),
+                   install_dir: qemu_datadir / 'firmware')
+  endforeach
+endif
diff --git a/pc-bios/meson.build b/pc-bios/meson.build
index fab323af84..6a341b6cea 100644
--- a/pc-bios/meson.build
+++ b/pc-bios/meson.build
@@ -1,7 +1,4 @@
-if 'arm-softmmu' in target_dirs or \
-    'aarch64-softmmu' in target_dirs or \
-    'i386-softmmu' in target_dirs or \
-    'x86_64-softmmu' in target_dirs
+if install_edk2_blobs
   bzip2 = find_program('bzip2', required: true)
   fds = [
     'edk2-aarch64-code.fd',
-- 
2.26.2



