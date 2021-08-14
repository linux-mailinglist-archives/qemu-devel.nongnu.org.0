Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EDFD3EC0DC
	for <lists+qemu-devel@lfdr.de>; Sat, 14 Aug 2021 08:15:42 +0200 (CEST)
Received: from localhost ([::1]:44360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mEmxJ-0001Kk-Fc
	for lists+qemu-devel@lfdr.de; Sat, 14 Aug 2021 02:15:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mEms4-0006my-SN
 for qemu-devel@nongnu.org; Sat, 14 Aug 2021 02:10:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39259)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mEms3-0004IV-9M
 for qemu-devel@nongnu.org; Sat, 14 Aug 2021 02:10:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628921413;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C5MVg/XRI8d/52C26A/7wjjZfvjj0WJgg6JvjcMnF6A=;
 b=Qgc0gK+vD/N53DpcXC+3YluIrlW6mgqyskbvZYmiUzYGnD8/mbGRRvwlr5lx82s87dneA5
 FiYiycyvEC783BVCnWofumx9Z7ZkCCIpb9YVaTUUK362S1iyA1Y9Xs56yy82VHWQv9KJNV
 z3ieanrJDQLQI1TiZpL2ibpSI8kmzkg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-548-0LB5QmsUOZSlZYbxQTsl9A-1; Sat, 14 Aug 2021 02:10:11 -0400
X-MC-Unique: 0LB5QmsUOZSlZYbxQTsl9A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4DD4B10199A8;
 Sat, 14 Aug 2021 06:10:10 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.41])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 73EEA5D9D5;
 Sat, 14 Aug 2021 06:10:09 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL 03/11] storage-daemon: Add missing build dependency to the
 vhost-user-blk-test
Date: Sat, 14 Aug 2021 08:09:48 +0200
Message-Id: <20210814060956.12852-4-thuth@redhat.com>
In-Reply-To: <20210814060956.12852-1-thuth@redhat.com>
References: <20210814060956.12852-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

vhost-user-blk-test needs the qemu-storage-daemon, otherwise it
currently hangs. So make sure that we build the daemon before running
the tests.

Message-Id: <20210811094705.131314-1-thuth@redhat.com>
Tested-by: Alexander Bulekov <alxndr@bu.edu>
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


