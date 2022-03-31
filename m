Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6805C4ED80B
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 12:57:03 +0200 (CEST)
Received: from localhost ([::1]:57166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZsUA-0001A5-Fm
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 06:57:02 -0400
Received: from eggs.gnu.org ([209.51.188.92]:32872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nZsRI-0006iu-W0
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 06:54:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52335)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nZsRH-0007ie-G3
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 06:54:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648724042;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3dC8qP1tCz9ordD6y0IT73Ojk0w0MIvwQK0f+2Y3hPE=;
 b=ewGRgS22O/DBpa5HVLBVhwy5SxiXGNMRcjNHYw/qg8zPvEZJqcWL4xCO21Ktj5KPJw9uvy
 OTj+WcUX87nvrFqo5SR8wAQG0JURW18r02jkfkdvqfmnIHTgVXbtyUikUYoxBeRg17001f
 dNqPApxjBK7Y1MTiClbPDrXdnlEj+yQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-642-fcrjcqIUOquMlL_p9CmR7Q-1; Thu, 31 Mar 2022 06:53:59 -0400
X-MC-Unique: fcrjcqIUOquMlL_p9CmR7Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 94CDD3802ACD;
 Thu, 31 Mar 2022 10:53:58 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F36791400C2F;
 Thu, 31 Mar 2022 10:53:56 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 97CE921E6773; Thu, 31 Mar 2022 12:53:44 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 13/15] qapi: ui examples: add missing @websocket member
Date: Thu, 31 Mar 2022 12:53:42 +0200
Message-Id: <20220331105344.3471295-14-armbru@redhat.com>
In-Reply-To: <20220331105344.3471295-1-armbru@redhat.com>
References: <20220331105344.3471295-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: application/octet-stream; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, BODY_EMPTY=1.31,
 DKIMWL_WL_HIGH=-0.082, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: John Snow <jsnow@redhat.com>, peter.maydell@linaro.org,
 Victor Toso <victortoso@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Victor Toso <victortoso@redhat.com>

The examples were missing mandatory member @websocket. Provide it.

Signed-off-by: Victor Toso <victortoso@redhat.com>
Reviewed-by: John Snow <jsnow@redhat.com>
Message-Id: <20220328140604.41484-13-victortoso@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
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


