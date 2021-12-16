Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C004476CC0
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 10:02:41 +0100 (CET)
Received: from localhost ([::1]:47174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxmeu-0007l6-6m
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 04:02:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mxmUX-0000mp-VF
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 03:51:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42467)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mxmUW-0004DD-3V
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 03:51:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639644715;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+CucA0KdzLmyPY1OJd5Daaf33bMrUJi+XAcx92BC2iE=;
 b=XOAkJXA/VVWoxqHk4Vp2RxKI3uClL6ijYY2EvrPtPpPa/wQFqWzRVGK7Q3ctfuvg+0swB6
 gv3MkJWrqu4LxjOXyAdx5NmKHWprg7vATib/aXixnUuEbw06RTo899pYHyJBTpXHGQiqXh
 aKyECkozp4y/AR2plW8ib6BZlT3fk2E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-515-xz7vjCX4M8WNWLXo9HADPg-1; Thu, 16 Dec 2021 03:51:49 -0500
X-MC-Unique: xz7vjCX4M8WNWLXo9HADPg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 059C484E256
 for <qemu-devel@nongnu.org>; Thu, 16 Dec 2021 08:51:48 +0000 (UTC)
Received: from avogadro.mxp.redhat.com (unknown [10.39.194.194])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 77B8C2BE77
 for <qemu-devel@nongnu.org>; Thu, 16 Dec 2021 08:51:47 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 08/10] meson: rename "arch" variable
Date: Thu, 16 Dec 2021 09:51:37 +0100
Message-Id: <20211216085139.99682-9-pbonzini@redhat.com>
In-Reply-To: <20211216085139.99682-1-pbonzini@redhat.com>
References: <20211216085139.99682-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Avoid confusion between the ARCH variable of configure/config-host.mak
and the same-named variable of meson.build.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meson.build b/meson.build
index 903d4f3b10..677ab1b57d 100644
--- a/meson.build
+++ b/meson.build
@@ -2845,7 +2845,7 @@ emulators = {}
 foreach target : target_dirs
   config_target = config_target_mak[target]
   target_name = config_target['TARGET_NAME']
-  arch = config_target['TARGET_BASE_ARCH']
+  target_base_arch = config_target['TARGET_BASE_ARCH']
   arch_srcs = [config_target_h[target]]
   arch_deps = []
   c_args = ['-DNEED_CPU_H',
@@ -2861,11 +2861,11 @@ foreach target : target_dirs
   if target.endswith('-softmmu')
     qemu_target_name = 'qemu-system-' + target_name
     target_type='system'
-    t = target_softmmu_arch[arch].apply(config_target, strict: false)
+    t = target_softmmu_arch[target_base_arch].apply(config_target, strict: false)
     arch_srcs += t.sources()
     arch_deps += t.dependencies()
 
-    hw_dir = target_name == 'sparc64' ? 'sparc64' : arch
+    hw_dir = target_name == 'sparc64' ? 'sparc64' : target_base_arch
     hw = hw_arch[hw_dir].apply(config_target, strict: false)
     arch_srcs += hw.sources()
     arch_deps += hw.dependencies()
@@ -2876,8 +2876,8 @@ foreach target : target_dirs
     abi = config_target['TARGET_ABI_DIR']
     target_type='user'
     qemu_target_name = 'qemu-' + target_name
-    if arch in target_user_arch
-      t = target_user_arch[arch].apply(config_target, strict: false)
+    if target_base_arch in target_user_arch
+      t = target_user_arch[target_base_arch].apply(config_target, strict: false)
       arch_srcs += t.sources()
       arch_deps += t.dependencies()
     endif
@@ -2915,7 +2915,7 @@ foreach target : target_dirs
     arch_srcs += gdbstub_xml
   endif
 
-  t = target_arch[arch].apply(config_target, strict: false)
+  t = target_arch[target_base_arch].apply(config_target, strict: false)
   arch_srcs += t.sources()
   arch_deps += t.dependencies()
 
-- 
2.33.1



