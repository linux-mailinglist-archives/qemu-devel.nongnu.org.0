Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4291B382C04
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 14:24:23 +0200 (CEST)
Received: from localhost ([::1]:48260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1licII-0003BS-9h
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 08:24:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1licFo-0000dH-UM
 for qemu-devel@nongnu.org; Mon, 17 May 2021 08:21:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58128)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1licFd-0000XZ-Mu
 for qemu-devel@nongnu.org; Mon, 17 May 2021 08:21:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621254094;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=HfjDhA8dXo30wkfpbVMZpBuSos1ce3DDO6epP/5K/JY=;
 b=SsNsxq3Um6Za7bnF4DwvplNavV45WuTMaHBonSWPrjZovNUONFAwGcZTYnRLMfG/TMKqUW
 VhuAZjgcX7r+1qcrIsG9Ze/a34gQTkGkHx3F8V7jcy9H9h4aza+QgRUsV1o6MQxgUbjo2/
 UY3dW8zn0GC4zN0BoQSPSJ+hdKgnonE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-319-Q273SQbjMUSNWDdyfie9TQ-1; Mon, 17 May 2021 08:19:11 -0400
X-MC-Unique: Q273SQbjMUSNWDdyfie9TQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4AECF803620;
 Mon, 17 May 2021 12:19:10 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EFD6C60C04;
 Mon, 17 May 2021 12:19:09 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] replication: move include out of root directory
Date: Mon, 17 May 2021 08:19:09 -0400
Message-Id: <20210517121909.2625099-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The replication.h file is included from migration/colo.c and tests/unit/test-replication.c,
so it should be in include/.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block/replication.c                          | 2 +-
 replication.h => include/block/replication.h | 4 ++--
 migration/colo.c                             | 2 +-
 replication.c                                | 2 +-
 tests/unit/test-replication.c                | 2 +-
 5 files changed, 6 insertions(+), 6 deletions(-)
 rename replication.h => include/block/replication.h (98%)

diff --git a/block/replication.c b/block/replication.c
index 97be7ef4de..52163f2d1f 100644
--- a/block/replication.c
+++ b/block/replication.c
@@ -22,7 +22,7 @@
 #include "sysemu/block-backend.h"
 #include "qapi/error.h"
 #include "qapi/qmp/qdict.h"
-#include "replication.h"
+#include "block/replication.h"
 
 typedef enum {
     BLOCK_REPLICATION_NONE,             /* block replication is not started */
diff --git a/replication.h b/include/block/replication.h
similarity index 98%
rename from replication.h
rename to include/block/replication.h
index d49fc22cb9..21931b4f0c 100644
--- a/replication.h
+++ b/include/block/replication.h
@@ -23,7 +23,7 @@ typedef struct ReplicationOps ReplicationOps;
 typedef struct ReplicationState ReplicationState;
 
 /**
- * SECTION:replication.h
+ * SECTION:block/replication.h
  * @title:Base Replication System
  * @short_description: interfaces for handling replication
  *
@@ -32,7 +32,7 @@ typedef struct ReplicationState ReplicationState;
  * <example>
  *   <title>How to use replication interfaces</title>
  *   <programlisting>
- * #include "replication.h"
+ * #include "block/replication.h"
  *
  * typedef struct BDRVReplicationState {
  *     ReplicationState *rs;
diff --git a/migration/colo.c b/migration/colo.c
index de27662cab..e498fdb125 100644
--- a/migration/colo.c
+++ b/migration/colo.c
@@ -28,7 +28,7 @@
 #include "migration/failover.h"
 #include "migration/ram.h"
 #ifdef CONFIG_REPLICATION
-#include "replication.h"
+#include "block/replication.h"
 #endif
 #include "net/colo-compare.h"
 #include "net/colo.h"
diff --git a/replication.c b/replication.c
index be3a42f9c9..4acd3f8004 100644
--- a/replication.c
+++ b/replication.c
@@ -14,7 +14,7 @@
 
 #include "qemu/osdep.h"
 #include "qapi/error.h"
-#include "replication.h"
+#include "block/replication.h"
 
 static QLIST_HEAD(, ReplicationState) replication_states;
 
diff --git a/tests/unit/test-replication.c b/tests/unit/test-replication.c
index b067240add..afff908d77 100644
--- a/tests/unit/test-replication.c
+++ b/tests/unit/test-replication.c
@@ -14,7 +14,7 @@
 #include "qapi/qmp/qdict.h"
 #include "qemu/option.h"
 #include "qemu/main-loop.h"
-#include "replication.h"
+#include "block/replication.h"
 #include "block/block_int.h"
 #include "block/qdict.h"
 #include "sysemu/block-backend.h"
-- 
2.27.0


