Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4982B4E7AFE
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Mar 2022 23:18:34 +0100 (CET)
Received: from localhost ([::1]:45606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXsGO-0003VJ-Vs
	for lists+qemu-devel@lfdr.de; Fri, 25 Mar 2022 18:18:33 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1nXs5l-0004ra-E8
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 18:07:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56368)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1nXs5j-0002oV-PG
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 18:07:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648246051;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UbVyOaW6fEKcOG8BYDc2I0X3PP7z2B3dlzgHpCDd/5I=;
 b=Id9RAFaCyAAu8qPb7V6DaPTnDXtg95UHMgJYA3VVsSbvO/Vb6Eh7TmdHyoIp302r9Pe/fE
 1aVStB/H06a/U0vgstdk8DfEAfYU+XN5qZCbXWtxzM+NafzY4d9r1Jr6boeUEA8hWwoAKk
 qj3+nz1e3ZB4easXLwO/hvjwERJg1eM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-237-z0tEBuVGNCGNPT-ydoe4Mw-1; Fri, 25 Mar 2022 18:07:30 -0400
X-MC-Unique: z0tEBuVGNCGNPT-ydoe4Mw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C4C4B811E7A
 for <qemu-devel@nongnu.org>; Fri, 25 Mar 2022 22:07:29 +0000 (UTC)
Received: from tapioca.redhat.com (unknown [10.40.192.95])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 88FDE40D2970;
 Fri, 25 Mar 2022 22:07:28 +0000 (UTC)
From: Victor Toso <victortoso@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 12/14] qapi: ui examples: add missing websocket member
Date: Fri, 25 Mar 2022 23:07:05 +0100
Message-Id: <20220325220707.52118-13-victortoso@redhat.com>
In-Reply-To: <20220325220707.52118-1-victortoso@redhat.com>
References: <20220325220707.52118-1-victortoso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=victortoso@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=victortoso@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: John Snow <jsnow@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As the websocket is not optional in VncBasicInfo.

Signed-off-by: Victor Toso <victortoso@redhat.com>
Reviewed-by: John Snow <jsnow@redhat.com>
---
 qapi/ui.json | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/qapi/ui.json b/qapi/ui.json
index 664da9e462..a810ed680c 100644
--- a/qapi/ui.json
+++ b/qapi/ui.json
@@ -710,10 +710,10 @@
 #
 # <- { "event": "VNC_CONNECTED",
 #      "data": {
-#            "server": { "auth": "sasl", "family": "ipv4",
+#            "server": { "auth": "sasl", "family": "ipv4", "websocket": false,
 #                        "service": "5901", "host": "0.0.0.0" },
 #            "client": { "family": "ipv4", "service": "58425",
-#                        "host": "127.0.0.1" } },
+#                        "host": "127.0.0.1", "websocket": false } },
 #      "timestamp": { "seconds": 1262976601, "microseconds": 975795 } }
 #
 ##
@@ -738,9 +738,9 @@
 #
 # <-  { "event": "VNC_INITIALIZED",
 #       "data": {
-#            "server": { "auth": "sasl", "family": "ipv4",
+#            "server": { "auth": "sasl", "family": "ipv4", "websocket": false,
 #                        "service": "5901", "host": "0.0.0.0"},
-#            "client": { "family": "ipv4", "service": "46089",
+#            "client": { "family": "ipv4", "service": "46089", "websocket": false,
 #                        "host": "127.0.0.1", "sasl_username": "luiz" } },
 #       "timestamp": { "seconds": 1263475302, "microseconds": 150772 } }
 #
@@ -765,9 +765,9 @@
 #
 # <- { "event": "VNC_DISCONNECTED",
 #      "data": {
-#            "server": { "auth": "sasl", "family": "ipv4",
+#            "server": { "auth": "sasl", "family": "ipv4", "websocket": false,
 #                        "service": "5901", "host": "0.0.0.0" },
-#            "client": { "family": "ipv4", "service": "58425",
+#            "client": { "family": "ipv4", "service": "58425", "websocket": false,
 #                        "host": "127.0.0.1", "sasl_username": "luiz" } },
 #      "timestamp": { "seconds": 1262976601, "microseconds": 975795 } }
 #
-- 
2.35.1


