Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C8846A6B04
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 11:45:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXJxB-000790-Oy; Wed, 01 Mar 2023 05:44:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pXJx9-00078d-Pl
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 05:44:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pXJx8-0003nS-Db
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 05:44:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677667493;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=88lcDIJkcVkxamA8yLq2Y2R8HZsAhqN0g2WyvWvakhM=;
 b=HI4/Vh/LSo9ofCw5TfZqEGUUV86HWeCeMwZZa1IJBY3/yHiFX8pHNnobxeN4Km/rpVbX7U
 eHX9OWmD1CFSssSVauvH67bgULUZ7yiV7tDwPoq+O8/3O/2e/mZu4mKImofTCcLIL+mpi4
 I5Xci3w6vHzBdmxl06JRzx5gFbBv52I=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-611-kun74eb7OHSC1aInXz_3MA-1; Wed, 01 Mar 2023 05:44:52 -0500
X-MC-Unique: kun74eb7OHSC1aInXz_3MA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F1B3F1C29D40
 for <qemu-devel@nongnu.org>; Wed,  1 Mar 2023 10:44:51 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.31])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1C7ED4010E86;
 Wed,  1 Mar 2023 10:44:50 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Juan Quintela <quintela@redhat.com>
Subject: [PATCH] test: Check vnc enable before compiling vnc test
Date: Wed,  1 Mar 2023 11:44:50 +0100
Message-Id: <20230301104450.1017-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
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

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 tests/qtest/meson.build | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 29a4efb4c2..62eecf2edf 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -309,10 +309,12 @@ qtests = {
   'netdev-socket': files('netdev-socket.c', '../unit/socket-helpers.c'),
 }
 
-gvnc = dependency('gvnc-1.0', required: false)
-if gvnc.found()
-  qtests += {'vnc-display-test': [gvnc]}
-  qtests_generic += [ 'vnc-display-test' ]
+if vnc.found()
+  gvnc = dependency('gvnc-1.0', required: false)
+  if gvnc.found()
+    qtests += {'vnc-display-test': [gvnc]}
+    qtests_generic += [ 'vnc-display-test' ]
+  endif
 endif
 
 if dbus_display
-- 
2.39.2


