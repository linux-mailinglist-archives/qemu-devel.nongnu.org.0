Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADB4F4E996F
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Mar 2022 16:26:48 +0200 (CEST)
Received: from localhost ([::1]:47274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYqKV-00005F-Nk
	for lists+qemu-devel@lfdr.de; Mon, 28 Mar 2022 10:26:47 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1nYq0l-0006kk-Aj
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 10:06:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39382)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1nYq0j-0005IX-Ng
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 10:06:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648476381;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IPQgd+Dj3pVYdKgKRR+ErYN5s6FYEfNPg/vxvxQNJgw=;
 b=GCO6ADrqYP83JBQLUPJ2YQUi8mPeXS3/yQJmg0AvEci+zQGCq3KVTBocgDP2zDsSnwFMw6
 +6BKTQjOdXxcLLXwWLGf346a+HS3rex2IGAmbHk7XXMcXfgv/4XFVtaQmFHuSExrCoVZ+W
 PQad/u9T2uPftdHTKxVV1MGMxXizNuY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-491-gNpyVzWLM1eqvoZl5-kSlw-1; Mon, 28 Mar 2022 10:06:19 -0400
X-MC-Unique: gNpyVzWLM1eqvoZl5-kSlw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2BAD3811E83
 for <qemu-devel@nongnu.org>; Mon, 28 Mar 2022 14:06:19 +0000 (UTC)
Received: from tapioca.home (unknown [10.40.195.83])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 21AA31402642;
 Mon, 28 Mar 2022 14:06:17 +0000 (UTC)
From: Victor Toso <victortoso@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 08/14] qapi: fix example of FAILOVER_NEGOTIATED event
Date: Mon, 28 Mar 2022 16:05:58 +0200
Message-Id: <20220328140604.41484-9-victortoso@redhat.com>
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

Event's documentation is not properly formatted. Fix it by:
- Adding @ to "device-id"
- Adding extra line for "Since" section

Signed-off-by: Victor Toso <victortoso@redhat.com>
Reviewed-by: John Snow <jsnow@redhat.com>
---
 qapi/net.json | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/qapi/net.json b/qapi/net.json
index 7fab2e7cd8..0d4578bd07 100644
--- a/qapi/net.json
+++ b/qapi/net.json
@@ -685,13 +685,15 @@
 # Failover primary devices which were hidden (not hotplugged when requested)
 # before will now be hotplugged by the virtio-net standby device.
 #
-# device-id: QEMU device id of the unplugged device
+# @device-id: QEMU device id of the unplugged device
+#
 # Since: 4.2
 #
 # Example:
 #
 # <- { "event": "FAILOVER_NEGOTIATED",
-#      "data": "net1" }
+#      "data": { "device-id": "net1" },
+#      "timestamp": { "seconds": 1368697518, "microseconds": 326866 } }
 #
 ##
 { 'event': 'FAILOVER_NEGOTIATED',
-- 
2.35.1


