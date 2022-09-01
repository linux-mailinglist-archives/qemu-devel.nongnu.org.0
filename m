Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B24D5A9361
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 11:42:05 +0200 (CEST)
Received: from localhost ([::1]:56788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTgi4-0002CB-1U
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 05:42:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1oTg2W-0000QC-R5
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 04:59:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58923)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1oTg2V-0004w9-5Z
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 04:59:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662022746;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2TfmrvSz3aZGyB497vlwM6QYPSFKLec+JWYVTaS5AkQ=;
 b=hXIYHWBXBMHoB4D4Yes+l8JULdZqOqCW3VPHg4e4NjC+zYpbH9thQnjb7Bb7feUc1Znmtc
 6LvREe7Ejw0OYGdri9DvC8ZZBoDTK3z8GloThfzqlStdymS3HPJ2M+tvlk4UDUAkj14g7q
 pm83hdML3pkDgcZo8B87QsOPcQqNUA0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-490-YmaohZHbMvOtJgP709HbLw-1; Thu, 01 Sep 2022 04:59:02 -0400
X-MC-Unique: YmaohZHbMvOtJgP709HbLw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CA7C6811E81;
 Thu,  1 Sep 2022 08:59:01 +0000 (UTC)
Received: from tapioca.redhat.com (unknown [10.40.192.12])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 784432026D4C;
 Thu,  1 Sep 2022 08:59:00 +0000 (UTC)
From: Victor Toso <victortoso@redhat.com>
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 John Snow <jsnow@redhat.com>, Michael Roth <michael.roth@amd.com>
Subject: [PATCH v2 10/10] qapi: fix examples of events missing timestamp
Date: Thu,  1 Sep 2022 10:58:40 +0200
Message-Id: <20220901085840.22520-11-victortoso@redhat.com>
In-Reply-To: <20220901085840.22520-1-victortoso@redhat.com>
References: <20220901085840.22520-1-victortoso@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=victortoso@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I've used real timestamp and changing them one by one so they would
not be all equal.

Problem was noticed when using the example as a test case for Go
bindings.

Signed-off-by: Victor Toso <victortoso@redhat.com>
---
 qapi/migration.json | 27 +++++++++++++++++++++++----
 1 file changed, 23 insertions(+), 4 deletions(-)

diff --git a/qapi/migration.json b/qapi/migration.json
index 81185d4311..88ecf86ac8 100644
--- a/qapi/migration.json
+++ b/qapi/migration.json
@@ -1995,16 +1995,23 @@
 #    }
 # <- { "return": { } }
 # <- {"event": "JOB_STATUS_CHANGE",
+#     "timestamp": {"seconds": 1432121972, "microseconds": 744001},
 #     "data": {"status": "created", "id": "snapsave0"}}
 # <- {"event": "JOB_STATUS_CHANGE",
+#     "timestamp": {"seconds": 1432122172, "microseconds": 744001},
 #     "data": {"status": "running", "id": "snapsave0"}}
-# <- {"event": "STOP"}
-# <- {"event": "RESUME"}
+# <- {"event": "STOP",
+#     "timestamp": {"seconds": 1432122372, "microseconds": 744001} }
+# <- {"event": "RESUME",
+#     "timestamp": {"seconds": 1432122572, "microseconds": 744001} }
 # <- {"event": "JOB_STATUS_CHANGE",
+#     "timestamp": {"seconds": 1432122772, "microseconds": 744001},
 #     "data": {"status": "waiting", "id": "snapsave0"}}
 # <- {"event": "JOB_STATUS_CHANGE",
+#     "timestamp": {"seconds": 1432122972, "microseconds": 744001},
 #     "data": {"status": "pending", "id": "snapsave0"}}
 # <- {"event": "JOB_STATUS_CHANGE",
+#     "timestamp": {"seconds": 1432123172, "microseconds": 744001},
 #     "data": {"status": "concluded", "id": "snapsave0"}}
 # -> {"execute": "query-jobs"}
 # <- {"return": [{"current-progress": 1,
@@ -2056,16 +2063,23 @@
 #    }
 # <- { "return": { } }
 # <- {"event": "JOB_STATUS_CHANGE",
+#     "timestamp": {"seconds": 1472124172, "microseconds": 744001},
 #     "data": {"status": "created", "id": "snapload0"}}
 # <- {"event": "JOB_STATUS_CHANGE",
+#     "timestamp": {"seconds": 1472125172, "microseconds": 744001},
 #     "data": {"status": "running", "id": "snapload0"}}
-# <- {"event": "STOP"}
-# <- {"event": "RESUME"}
+# <- {"event": "STOP",
+#     "timestamp": {"seconds": 1472125472, "microseconds": 744001} }
+# <- {"event": "RESUME",
+#     "timestamp": {"seconds": 1472125872, "microseconds": 744001} }
 # <- {"event": "JOB_STATUS_CHANGE",
+#     "timestamp": {"seconds": 1472126172, "microseconds": 744001},
 #     "data": {"status": "waiting", "id": "snapload0"}}
 # <- {"event": "JOB_STATUS_CHANGE",
+#     "timestamp": {"seconds": 1472127172, "microseconds": 744001},
 #     "data": {"status": "pending", "id": "snapload0"}}
 # <- {"event": "JOB_STATUS_CHANGE",
+#     "timestamp": {"seconds": 1472128172, "microseconds": 744001},
 #     "data": {"status": "concluded", "id": "snapload0"}}
 # -> {"execute": "query-jobs"}
 # <- {"return": [{"current-progress": 1,
@@ -2108,14 +2122,19 @@
 #    }
 # <- { "return": { } }
 # <- {"event": "JOB_STATUS_CHANGE",
+#     "timestamp": {"seconds": 1442124172, "microseconds": 744001},
 #     "data": {"status": "created", "id": "snapdelete0"}}
 # <- {"event": "JOB_STATUS_CHANGE",
+#     "timestamp": {"seconds": 1442125172, "microseconds": 744001},
 #     "data": {"status": "running", "id": "snapdelete0"}}
 # <- {"event": "JOB_STATUS_CHANGE",
+#     "timestamp": {"seconds": 1442126172, "microseconds": 744001},
 #     "data": {"status": "waiting", "id": "snapdelete0"}}
 # <- {"event": "JOB_STATUS_CHANGE",
+#     "timestamp": {"seconds": 1442127172, "microseconds": 744001},
 #     "data": {"status": "pending", "id": "snapdelete0"}}
 # <- {"event": "JOB_STATUS_CHANGE",
+#     "timestamp": {"seconds": 1442128172, "microseconds": 744001},
 #     "data": {"status": "concluded", "id": "snapdelete0"}}
 # -> {"execute": "query-jobs"}
 # <- {"return": [{"current-progress": 1,
-- 
2.37.2


