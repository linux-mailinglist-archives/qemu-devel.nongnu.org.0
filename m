Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEB5F5B082D
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Sep 2022 17:12:27 +0200 (CEST)
Received: from localhost ([::1]:34640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVwj5-0002qM-4C
	for lists+qemu-devel@lfdr.de; Wed, 07 Sep 2022 11:12:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oVwaV-0004Bd-UU
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 11:03:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45722)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oVwaS-0004Sg-EM
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 11:03:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662563011;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lfu2JGbc2YUfEK2Rv5aRZ9tLC0EaDAGaBABZgOrlHxU=;
 b=LF0Rhk3wBdKBGbL5MygK8aPzRCvqvpqfsdTB6N7G26dfMCDuoRD2kZWnJNWiBf1YSJ2zd9
 wCjlEsdUKRyxZ7bFCjzIOH7h2iUtWe1W8WSf8f9+4HIACjBh8okKtDJ2/lz9gQPeOj8W5f
 uXuXTB8W46m51gSWXJ50jPGr2J2JsG8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-577-jOQysBYjML2b6lbvVN2TLg-1; Wed, 07 Sep 2022 11:03:30 -0400
X-MC-Unique: jOQysBYjML2b6lbvVN2TLg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EFD602999B59
 for <qemu-devel@nongnu.org>; Wed,  7 Sep 2022 15:03:29 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.166])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C669C40CF916;
 Wed,  7 Sep 2022 15:03:29 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 5340821E66CD; Wed,  7 Sep 2022 17:03:27 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
	Victor Toso <victortoso@redhat.com>
Subject: [PULL 10/10] qapi: fix examples of events missing timestamp
Date: Wed,  7 Sep 2022 17:03:27 +0200
Message-Id: <20220907150327.538464-11-armbru@redhat.com>
In-Reply-To: <20220907150327.538464-1-armbru@redhat.com>
References: <20220907150327.538464-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
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

From: Victor Toso <victortoso@redhat.com>

I've used real timestamp and changing them one by one so they would
not be all equal.

Problem was noticed when using the example as a test case for Go
bindings.

Signed-off-by: Victor Toso <victortoso@redhat.com>
Message-Id: <20220901085840.22520-11-victortoso@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
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


