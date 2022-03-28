Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 520B74E99F1
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Mar 2022 16:42:19 +0200 (CEST)
Received: from localhost ([::1]:51050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYqZW-0005l8-E3
	for lists+qemu-devel@lfdr.de; Mon, 28 Mar 2022 10:42:18 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1nYq0t-0006zn-9Q
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 10:06:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33929)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1nYq0q-0005JQ-Tx
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 10:06:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648476387;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QxhRTGBKhMw2+7cpgg3oKH+o84eve0BuZ7N4wOpSK8I=;
 b=QCq/fyrt1EPQ81Ajilq49IpLBjIfEqrazZEJdcfp4BXk0xGJMvZk9Q7oEZw/NYoeYjCTFS
 437GQJnwUVw8tgQ5xX3aHH1Nvi5GuZIXLmaOTHGZrpIeFIpkRm7+9462ArmguPVY8TGfix
 CJVmNVdSWh1OHQ5FkiJeGgYegpy4b5k=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-179-AEOcpkQ7NiqwPtgFxUiDgQ-1; Mon, 28 Mar 2022 10:06:25 -0400
X-MC-Unique: AEOcpkQ7NiqwPtgFxUiDgQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 997E4899EC1
 for <qemu-devel@nongnu.org>; Mon, 28 Mar 2022 14:06:25 +0000 (UTC)
Received: from tapioca.home (unknown [10.40.195.83])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5EA01140240A;
 Mon, 28 Mar 2022 14:06:24 +0000 (UTC)
From: Victor Toso <victortoso@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 12/14] qapi: ui examples: add missing @websocket member
Date: Mon, 28 Mar 2022 16:06:02 +0200
Message-Id: <20220328140604.41484-13-victortoso@redhat.com>
In-Reply-To: <20220328140604.41484-1-victortoso@redhat.com>
References: <20220328140604.41484-1-victortoso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=victortoso@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=victortoso@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

The examples were missing mandatory member @websocket. Provide it.

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


