Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C2584E99DD
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Mar 2022 16:39:12 +0200 (CEST)
Received: from localhost ([::1]:44596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYqWV-0001MZ-5o
	for lists+qemu-devel@lfdr.de; Mon, 28 Mar 2022 10:39:11 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1nYq0k-0006ip-JB
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 10:06:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58431)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1nYq0f-0005Hj-Bs
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 10:06:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648476376;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=seq9Nwh8IWyLQkRA/F2epUzWYv7xieFH33Aoeddn6SA=;
 b=hJvBXKG9ifYKyk57Fhiuv7NChMBbx8svC62iBP7UgqRWNAaaavl5cHN4D8voapRkiWocZG
 pljjvcghL4oT9ALZjML89dfja74YFltf6R9WqN5MoctkvJuM1huXTzFAuNqTibhyGvlBTT
 wrw2eGJrT3NkIycwZSXs73KEDe3r2ko=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-613-yJQjN0N5ODyyqBfWM_9whQ-1; Mon, 28 Mar 2022 10:06:15 -0400
X-MC-Unique: yJQjN0N5ODyyqBfWM_9whQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 158AC3803503
 for <qemu-devel@nongnu.org>; Mon, 28 Mar 2022 14:06:15 +0000 (UTC)
Received: from tapioca.home (unknown [10.40.195.83])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 022601417201;
 Mon, 28 Mar 2022 14:06:13 +0000 (UTC)
From: Victor Toso <victortoso@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 05/14] qapi: fix example of DUMP_COMPLETED event
Date: Mon, 28 Mar 2022 16:05:55 +0200
Message-Id: <20220328140604.41484-6-victortoso@redhat.com>
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

Example output lacks mandatory member @timestamp.  Provide it.

Example output is not properly formatted. Fixing it by:
 - Adding '<-' to signalize it is receiving the data;
 - Adding extra spaces around members @result, @total and @completed

Signed-off-by: Victor Toso <victortoso@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: John Snow <jsnow@redhat.com>
---
 qapi/dump.json | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/qapi/dump.json b/qapi/dump.json
index f7c4267e3f..9119c82b14 100644
--- a/qapi/dump.json
+++ b/qapi/dump.json
@@ -161,9 +161,10 @@
 #
 # Example:
 #
-# { "event": "DUMP_COMPLETED",
-#   "data": {"result": {"total": 1090650112, "status": "completed",
-#                       "completed": 1090650112} } }
+# <- { "event": "DUMP_COMPLETED",
+#      "data": { "result": { "total": 1090650112, "status": "completed",
+#                            "completed": 1090650112 } },
+#      "timestamp": { "seconds": 1648244171, "microseconds": 950316 } }
 #
 ##
 { 'event': 'DUMP_COMPLETED' ,
-- 
2.35.1


