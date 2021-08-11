Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36C723E8D81
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Aug 2021 11:48:23 +0200 (CEST)
Received: from localhost ([::1]:36652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDkqU-00019V-9R
	for lists+qemu-devel@lfdr.de; Wed, 11 Aug 2021 05:48:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mDkpX-0000BF-65
 for qemu-devel@nongnu.org; Wed, 11 Aug 2021 05:47:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39083)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mDkpU-0003Fn-Rb
 for qemu-devel@nongnu.org; Wed, 11 Aug 2021 05:47:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628675240;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=tZ1XPfL7kx/aD4vLmDhahjurwXihBp803srnDuMIHb8=;
 b=eOriklPSWksI84lvw+lN4/rVsW4JP5VmO/S9zrM2j6Vd3cQCxhbnOC0avjPEpS1UmtiuzX
 dfa9a8639z7Mn3c3LVF0tjOGOIjL0uVK2CX4FojkogXlakmv6wOT85T/qMjPKR7HyVWc7L
 oQfqCLhBWEKvJdMLh0/ltMDBXVJ9mhM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-269-sRtsNT9JMuGZpXvCcuuC_g-1; Wed, 11 Aug 2021 05:47:16 -0400
X-MC-Unique: sRtsNT9JMuGZpXvCcuuC_g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4F4E5100F76F;
 Wed, 11 Aug 2021 09:47:15 +0000 (UTC)
Received: from thuth.com (reserved-198-128.str.redhat.com [10.33.198.128])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 74EFC5D740;
 Wed, 11 Aug 2021 09:47:07 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 Coiby Xu <coiby.xu@gmail.com>
Subject: [PATCH] storage-daemon: Add missing build dependency to the
 vhost-user-blk-test
Date: Wed, 11 Aug 2021 11:47:05 +0200
Message-Id: <20210811094705.131314-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.704,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, qemu-block@nongnu.org, alex.bennee@linaro.org,
 Raphael Norwitz <raphael.norwitz@nutanix.com>, alxndr@bu.edu,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

vhost-user-blk-test needs the qemu-storage-deamon, otherwise it
currently hangs. So make sure that we build the daemon before running
the tests.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 storage-daemon/meson.build | 8 ++++----
 tests/qtest/meson.build    | 7 +++++--
 2 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/storage-daemon/meson.build b/storage-daemon/meson.build
index 68852f3d25..49c9d2eac9 100644
--- a/storage-daemon/meson.build
+++ b/storage-daemon/meson.build
@@ -6,8 +6,8 @@ subdir('qapi')
 
 if have_tools
   qsd_ss = qsd_ss.apply(config_host, strict: false)
-  executable('qemu-storage-daemon',
-             qsd_ss.sources(),
-             dependencies: qsd_ss.dependencies(),
-             install: true)
+  qsd = executable('qemu-storage-daemon',
+                   qsd_ss.sources(),
+                   dependencies: qsd_ss.dependencies(),
+                   install: true)
 endif
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index e22a0792c5..2bc3efd49f 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -276,8 +276,11 @@ foreach dir : target_dirs
   endif
   qtest_env.set('G_TEST_DBUS_DAEMON', meson.source_root() / 'tests/dbus-vmstate-daemon.sh')
   qtest_env.set('QTEST_QEMU_BINARY', './qemu-system-' + target_base)
-  qtest_env.set('QTEST_QEMU_STORAGE_DAEMON_BINARY', './storage-daemon/qemu-storage-daemon')
-  
+  if have_tools and have_vhost_user_blk_server
+    qtest_env.set('QTEST_QEMU_STORAGE_DAEMON_BINARY', './storage-daemon/qemu-storage-daemon')
+    test_deps += [qsd]
+  endif
+
   foreach test : target_qtests
     # Executables are shared across targets, declare them only the first time we
     # encounter them
-- 
2.27.0


