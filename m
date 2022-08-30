Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 120A85A6869
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Aug 2022 18:27:26 +0200 (CEST)
Received: from localhost ([::1]:51168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oT45F-0000s9-5b
	for lists+qemu-devel@lfdr.de; Tue, 30 Aug 2022 12:27:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1oT3uW-0002D9-MT
 for qemu-devel@nongnu.org; Tue, 30 Aug 2022 12:16:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21104)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1oT3uU-00026S-Vy
 for qemu-devel@nongnu.org; Tue, 30 Aug 2022 12:16:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661876177;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Dgie4IXlALD4pvEiFCGmKPe8N23C/S3I+F0k30kX+M4=;
 b=Turn7zJitHSamPL7DhTh0ZO8ikTsncRgh9I/wqMxK3dMiMyWYJZYQklLLNHlVaTNNbCH+3
 VCQAkGwh8ihGnKp+GeHtMCtyKvKwWygveczxGSeNtlMwvHbzEXyv7OL8JKe+ehkFbQVTN9
 A3fSD3SN7oHtKQsqbddKrcfgPdnDyuY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-140-IGHpvfzUN_2-N24A5DIIUA-1; Tue, 30 Aug 2022 12:16:14 -0400
X-MC-Unique: IGHpvfzUN_2-N24A5DIIUA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1047C185A7B2;
 Tue, 30 Aug 2022 16:16:14 +0000 (UTC)
Received: from tapioca.redhat.com (unknown [10.40.192.78])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6509B1415117;
 Tue, 30 Aug 2022 16:16:12 +0000 (UTC)
From: Victor Toso <victortoso@redhat.com>
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 John Snow <jsnow@redhat.com>, Michael Roth <michael.roth@amd.com>
Subject: [PATCH v1 14/16] qapi: fix example of query-migrate command
Date: Tue, 30 Aug 2022 18:15:43 +0200
Message-Id: <20220830161545.84198-15-victortoso@redhat.com>
In-Reply-To: <20220830161545.84198-1-victortoso@redhat.com>
References: <20220830161545.84198-1-victortoso@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
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

The example's return type has several missing mandatory member names.
Fix it.

Problem was noticed when using the example as a test case for Go
bindings.

Signed-off-by: Victor Toso <victortoso@redhat.com>
---
 qapi/migration.json | 56 +++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 52 insertions(+), 4 deletions(-)

diff --git a/qapi/migration.json b/qapi/migration.json
index 81185d4311..2ac26d1971 100644
--- a/qapi/migration.json
+++ b/qapi/migration.json
@@ -295,7 +295,18 @@
 #           "duplicate":123,
 #           "normal":123,
 #           "normal-bytes":123456,
-#           "dirty-sync-count":15
+#           "dirty-sync-count":15,
+#           "mbps":0,
+#           "skipped":0,
+#           "postcopy-requests":0,
+#           "page-size":0,
+#           "multifd-bytes":0,
+#           "pages-per-second":0,
+#           "precopy-bytes":0,
+#           "downtime-bytes":0,
+#           "postcopy-bytes":0,
+#           "dirty-sync-missed-zero-copy":0,
+#           "dirty-pages-rate":0
 #         }
 #      }
 #    }
@@ -321,7 +332,18 @@
 #             "duplicate":123,
 #             "normal":123,
 #             "normal-bytes":123456,
-#             "dirty-sync-count":15
+#             "dirty-sync-count":15,
+#             "mbps":0,
+#             "skipped":0,
+#             "postcopy-requests":0,
+#             "page-size":0,
+#             "multifd-bytes":0,
+#             "pages-per-second":0,
+#             "precopy-bytes":0,
+#             "downtime-bytes":0,
+#             "postcopy-bytes":0,
+#             "dirty-sync-missed-zero-copy":0,
+#             "dirty-pages-rate":0
 #          }
 #       }
 #    }
@@ -342,12 +364,38 @@
 #             "duplicate":123,
 #             "normal":123,
 #             "normal-bytes":123456,
-#             "dirty-sync-count":15
+#             "dirty-sync-count":15,
+#             "mbps":1,
+#             "skipped":1,
+#             "postcopy-requests":1,
+#             "page-size":1,
+#             "multifd-bytes":1,
+#             "pages-per-second":1,
+#             "precopy-bytes":1,
+#             "downtime-bytes":1,
+#             "postcopy-bytes":1,
+#             "dirty-sync-missed-zero-copy":1,
+#             "dirty-pages-rate":1
 #          },
 #          "disk":{
 #             "total":20971520,
 #             "remaining":20880384,
-#             "transferred":91136
+#             "transferred":91136,
+#             "duplicate":2,
+#             "skipped":2,
+#             "normal":2,
+#             "normal-bytes":2,
+#             "dirty-pages-rate":2,
+#             "mbps":2,
+#             "dirty-sync-count":2,
+#             "postcopy-requests":2,
+#             "page-size":2,
+#             "multifd-bytes":2,
+#             "pages-per-second":2,
+#             "precopy-bytes":2,
+#             "downtime-bytes":2,
+#             "postcopy-bytes":2,
+#             "dirty-sync-missed-zero-copy":2
 #          }
 #       }
 #    }
-- 
2.37.2


