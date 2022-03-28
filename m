Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6796B4E99BA
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Mar 2022 16:35:16 +0200 (CEST)
Received: from localhost ([::1]:36198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYqSh-0003yZ-GQ
	for lists+qemu-devel@lfdr.de; Mon, 28 Mar 2022 10:35:15 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1nYq0j-0006fx-P2
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 10:06:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49825)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1nYq0i-0005IF-0Z
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 10:06:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648476379;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=87vN3ZxXxp5gsy94R/Q63nJ0ZJu0kNCU3acXv9UizRQ=;
 b=fUrzEh06qalGv9OKLj4Ml6eb7HT84L+LgZrOGV0e4mvWyD3yyA0fNESQI3B1yg5ZI4GI4c
 8PTS2GH69xqmBRzI4HVY4DZfk3v/m0hpk7+Ln+7n58lYHvLgvkpyDklAyrPUut7vEZdw1v
 L0qS3Slwo6RwoTvYSjwiNLQDH1uIy+E=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-204-npd5KtodMe2ekFOHMFQpbg-1; Mon, 28 Mar 2022 10:06:18 -0400
X-MC-Unique: npd5KtodMe2ekFOHMFQpbg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C7B292A2AD51
 for <qemu-devel@nongnu.org>; Mon, 28 Mar 2022 14:06:17 +0000 (UTC)
Received: from tapioca.home (unknown [10.40.195.83])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C769A1402642;
 Mon, 28 Mar 2022 14:06:16 +0000 (UTC)
From: Victor Toso <victortoso@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 07/14] qapi: fix example of UNPLUG_PRIMARY event
Date: Mon, 28 Mar 2022 16:05:57 +0200
Message-Id: <20220328140604.41484-8-victortoso@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=victortoso@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

Example output lacks mandatory member @timestamp.  Provide it.

Example output is not properly formatted. Fixing it by:
- Adding '<-' to signalize it is receiving the data;
- Breaking lines similar to the other examples.

Signed-off-by: Victor Toso <victortoso@redhat.com>
Reviewed-by: John Snow <jsnow@redhat.com>
---
 qapi/migration.json | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/qapi/migration.json b/qapi/migration.json
index 18e2610e88..092a63354b 100644
--- a/qapi/migration.json
+++ b/qapi/migration.json
@@ -1736,7 +1736,9 @@
 # Since: 4.2
 #
 # Example:
-#   {"event": "UNPLUG_PRIMARY", "data": {"device-id": "hostdev0"} }
+# <- { "event": "UNPLUG_PRIMARY",
+#      "data": { "device-id": "hostdev0" },
+#      "timestamp": { "seconds": 1265044230, "microseconds": 450486 } }
 #
 ##
 { 'event': 'UNPLUG_PRIMARY',
-- 
2.35.1


