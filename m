Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A83344E9952
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Mar 2022 16:22:28 +0200 (CEST)
Received: from localhost ([::1]:38582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYqGJ-0002kZ-PI
	for lists+qemu-devel@lfdr.de; Mon, 28 Mar 2022 10:22:27 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1nYq0e-0006PX-Ip
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 10:06:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33023)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1nYq0Z-0005GH-4w
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 10:06:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648476370;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vcMYkzs+SdOWIAdNnYWwFluyta0X0IVzhusqVoPMs8I=;
 b=DP1fUh9FjB1ry2c6qLEqU1J3YshWCvKSJvw+wBmhOH7jKXGDe7AsohAeb8eHbDSThe6SAo
 cg9uIDCwLsfU3/MsmpzadmslxQqlINYw7qoER3xI0b/o25PY2KB8pzr5OV/ZG1xwMiB56e
 bq3w7hLVV7ShIj5OP2LVuYjUub0nLq4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-639-4JzqZjRJNbG-m6QQPnrMZA-1; Mon, 28 Mar 2022 10:06:09 -0400
X-MC-Unique: 4JzqZjRJNbG-m6QQPnrMZA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 098A91C0E343
 for <qemu-devel@nongnu.org>; Mon, 28 Mar 2022 14:06:09 +0000 (UTC)
Received: from tapioca.home (unknown [10.40.195.83])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D2D70140240A;
 Mon, 28 Mar 2022 14:06:07 +0000 (UTC)
From: Victor Toso <victortoso@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 01/14] qapi: BlockExportRemoveMode: move comments to TODO
Date: Mon, 28 Mar 2022 16:05:51 +0200
Message-Id: <20220328140604.41484-2-victortoso@redhat.com>
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

@hide and @soft are potential additions which fits the TODO section
perfectly.

The main motivation is to avoid this whole block of comment entering
the wrong section in the python parser.

Signed-off-by: Victor Toso <victortoso@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: John Snow <jsnow@redhat.com>
---
 qapi/block-export.json | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/qapi/block-export.json b/qapi/block-export.json
index f183522d0d..1e34927f85 100644
--- a/qapi/block-export.json
+++ b/qapi/block-export.json
@@ -219,13 +219,13 @@
 #
 # @hard: Drop all connections immediately and remove export.
 #
-# Potential additional modes to be added in the future:
+# TODO: Potential additional modes to be added in the future:
 #
-# hide: Just hide export from new clients, leave existing connections as is.
-# Remove export after all clients are disconnected.
+#       hide: Just hide export from new clients, leave existing connections as is.
+#       Remove export after all clients are disconnected.
 #
-# soft: Hide export from new clients, answer with ESHUTDOWN for all further
-# requests from existing clients.
+#       soft: Hide export from new clients, answer with ESHUTDOWN for all further
+#       requests from existing clients.
 #
 # Since: 2.12
 ##
-- 
2.35.1


