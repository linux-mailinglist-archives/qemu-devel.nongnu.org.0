Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB0E35A688E
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Aug 2022 18:41:09 +0200 (CEST)
Received: from localhost ([::1]:47770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oT4IW-0003EN-Qw
	for lists+qemu-devel@lfdr.de; Tue, 30 Aug 2022 12:41:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1oT3uQ-00028E-4O
 for qemu-devel@nongnu.org; Tue, 30 Aug 2022 12:16:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45647)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1oT3uN-000255-7e
 for qemu-devel@nongnu.org; Tue, 30 Aug 2022 12:16:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661876170;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OdGR7PJsOyPOAzZBpztavs7NYGEQgL6u8PRY0lDIL4A=;
 b=fWEQzSouQKmNGwqYgb5o6+WsySdjrsbY9tIyx5pa430+1mQSEytcj7SYpUeOsA7flwqSIk
 nKeP95HB/0dyhibKtCDA4hIon0+voCC8DYfuePAnFYPuMZmJkC5lNhCcyifrxThaLDhA43
 Qz5WTtKRaRD08083Cjg1BueTu1qDLmQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-54-2OmbaVpZPvi-58tIo4SU5w-1; Tue, 30 Aug 2022 12:16:00 -0400
X-MC-Unique: 2OmbaVpZPvi-58tIo4SU5w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4DFC33C01E12;
 Tue, 30 Aug 2022 16:15:59 +0000 (UTC)
Received: from tapioca.redhat.com (unknown [10.40.192.78])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 94B0D1415117;
 Tue, 30 Aug 2022 16:15:57 +0000 (UTC)
From: Victor Toso <victortoso@redhat.com>
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 John Snow <jsnow@redhat.com>, Michael Roth <michael.roth@amd.com>
Subject: [PATCH v1 06/16] qapi: fix example of query-blockstats command
Date: Tue, 30 Aug 2022 18:15:35 +0200
Message-Id: <20220830161545.84198-7-victortoso@redhat.com>
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

Example output is missing several ',' delimiter between members.
Fix it.

Problem was noticed when trying to load the example into python's json
library.

Signed-off-by: Victor Toso <victortoso@redhat.com>
---
 qapi/block-core.json | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/qapi/block-core.json b/qapi/block-core.json
index 2173e7734a..72592034b1 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -1022,10 +1022,10 @@
 #                   "wr_bytes":9786368,
 #                   "wr_operations":751,
 #                   "rd_bytes":122567168,
-#                   "rd_operations":36772
-#                   "wr_total_times_ns":313253456
-#                   "rd_total_times_ns":3465673657
-#                   "flush_total_times_ns":49653
+#                   "rd_operations":36772,
+#                   "wr_total_times_ns":313253456,
+#                   "rd_total_times_ns":3465673657,
+#                   "flush_total_times_ns":49653,
 #                   "flush_operations":61,
 #                   "rd_merged":0,
 #                   "wr_merged":0,
@@ -1039,10 +1039,10 @@
 #                "wr_bytes":9786368,
 #                "wr_operations":692,
 #                "rd_bytes":122739200,
-#                "rd_operations":36604
+#                "rd_operations":36604,
 #                "flush_operations":51,
-#                "wr_total_times_ns":313253456
-#                "rd_total_times_ns":3465673657
+#                "wr_total_times_ns":313253456,
+#                "rd_total_times_ns":3465673657,
 #                "flush_total_times_ns":49653,
 #                "rd_merged":0,
 #                "wr_merged":0,
@@ -1059,10 +1059,10 @@
 #                "wr_bytes":0,
 #                "wr_operations":0,
 #                "rd_bytes":0,
-#                "rd_operations":0
+#                "rd_operations":0,
 #                "flush_operations":0,
-#                "wr_total_times_ns":0
-#                "rd_total_times_ns":0
+#                "wr_total_times_ns":0,
+#                "rd_total_times_ns":0,
 #                "flush_total_times_ns":0,
 #                "rd_merged":0,
 #                "wr_merged":0,
@@ -1078,10 +1078,10 @@
 #                "wr_bytes":0,
 #                "wr_operations":0,
 #                "rd_bytes":0,
-#                "rd_operations":0
+#                "rd_operations":0,
 #                "flush_operations":0,
-#                "wr_total_times_ns":0
-#                "rd_total_times_ns":0
+#                "wr_total_times_ns":0,
+#                "rd_total_times_ns":0,
 #                "flush_total_times_ns":0,
 #                "rd_merged":0,
 #                "wr_merged":0,
@@ -1097,10 +1097,10 @@
 #                "wr_bytes":0,
 #                "wr_operations":0,
 #                "rd_bytes":0,
-#                "rd_operations":0
+#                "rd_operations":0,
 #                "flush_operations":0,
-#                "wr_total_times_ns":0
-#                "rd_total_times_ns":0
+#                "wr_total_times_ns":0,
+#                "rd_total_times_ns":0,
 #                "flush_total_times_ns":0,
 #                "rd_merged":0,
 #                "wr_merged":0,
-- 
2.37.2


