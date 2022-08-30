Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E89BF5A687D
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Aug 2022 18:34:59 +0200 (CEST)
Received: from localhost ([::1]:59772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oT4CY-0006un-Nu
	for lists+qemu-devel@lfdr.de; Tue, 30 Aug 2022 12:34:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1oT3uY-0002DK-3E
 for qemu-devel@nongnu.org; Tue, 30 Aug 2022 12:16:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40828)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1oT3uW-00026f-Dc
 for qemu-devel@nongnu.org; Tue, 30 Aug 2022 12:16:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661876179;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TPiNg0amfJeVjFoWXx5jl3i1XDHPD75Mw8N8JW35Xe0=;
 b=MaR6aPOvzrxFrZc2Y/jUFuZMW3ENY5wl6jQP+JMyBLnZphOFmIDyzWfhc9WA2VvTSZhK/o
 WHnmQkxptzKarOmV2kspvmJ5Yg2pUdZa8pvOXMeExE15JuYu21hymI6nhSiuYFzddYxp14
 GEOifj/+vr1hi6yTAn8dh9o8pbL9+48=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-7-Wosf67yRP3-ZzCYn6Tn4kQ-1; Tue, 30 Aug 2022 12:16:16 -0400
X-MC-Unique: Wosf67yRP3-ZzCYn6Tn4kQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C5949801231;
 Tue, 30 Aug 2022 16:16:15 +0000 (UTC)
Received: from tapioca.redhat.com (unknown [10.40.192.78])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 646DB1415117;
 Tue, 30 Aug 2022 16:16:14 +0000 (UTC)
From: Victor Toso <victortoso@redhat.com>
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 John Snow <jsnow@redhat.com>, Michael Roth <michael.roth@amd.com>
Subject: [PATCH v1 15/16] qapi: fix examples of events missing timestamp
Date: Tue, 30 Aug 2022 18:15:44 +0200
Message-Id: <20220830161545.84198-16-victortoso@redhat.com>
In-Reply-To: <20220830161545.84198-1-victortoso@redhat.com>
References: <20220830161545.84198-1-victortoso@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=victortoso@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
index 2ac26d1971..93406b9d51 100644
--- a/qapi/migration.json
+++ b/qapi/migration.json
@@ -2043,16 +2043,23 @@
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
@@ -2104,16 +2111,23 @@
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
@@ -2156,14 +2170,19 @@
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


