Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CFD14E7AF2
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Mar 2022 23:12:32 +0100 (CET)
Received: from localhost ([::1]:50700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXsAZ-0004Pp-7P
	for lists+qemu-devel@lfdr.de; Fri, 25 Mar 2022 18:12:31 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1nXs5g-0004b7-Fu
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 18:07:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24299)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1nXs5f-0002m8-06
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 18:07:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648246046;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1RCMkn9zccUk0CDKFlXMaRqhdJDh7iodo6vKDki/2fc=;
 b=HEStdfFl+m+fVNtZOjFCfRSJBFeC2QiThiXPmBSRe9c17qqVVTBQmz/akrGlcgrC84QxeV
 G/kCVuv6dZsbL4mwTA1opCreQqfcjPGtHvotr7fs48N55efaTVFGnBRwTq0H+aq5YFcJeG
 WzmjkNoB/xU2+KEM+ikxaaO6VQ9DDsc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-461-sC24jfYRMmODoPv5iQpsJg-1; Fri, 25 Mar 2022 18:07:25 -0400
X-MC-Unique: sC24jfYRMmODoPv5iQpsJg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 02AAD9219A4
 for <qemu-devel@nongnu.org>; Fri, 25 Mar 2022 22:07:25 +0000 (UTC)
Received: from tapioca.redhat.com (unknown [10.40.192.95])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D250140C1438;
 Fri, 25 Mar 2022 22:07:23 +0000 (UTC)
From: Victor Toso <victortoso@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 09/14] qapi: fix examples: SHUTDOWN and RESET events
Date: Fri, 25 Mar 2022 23:07:02 +0100
Message-Id: <20220325220707.52118-10-victortoso@redhat.com>
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

The 'reason' member in not optional.

Signed-off-by: Victor Toso <victortoso@redhat.com>
Reviewed-by: John Snow <jsnow@redhat.com>
---
 qapi/run-state.json | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/qapi/run-state.json b/qapi/run-state.json
index 43d66d700f..1b9f64c9cd 100644
--- a/qapi/run-state.json
+++ b/qapi/run-state.json
@@ -150,7 +150,8 @@
 #
 # Example:
 #
-# <- { "event": "SHUTDOWN", "data": { "guest": true },
+# <- { "event": "SHUTDOWN",
+#      "data": { "guest": true, "reason": "guest-shutdown" },
 #      "timestamp": { "seconds": 1267040730, "microseconds": 682951 } }
 #
 ##
@@ -188,7 +189,8 @@
 #
 # Example:
 #
-# <- { "event": "RESET", "data": { "guest": false },
+# <- { "event": "RESET",
+#      "data": { "guest": false, "reason": "guest-reset" },
 #      "timestamp": { "seconds": 1267041653, "microseconds": 9518 } }
 #
 ##
-- 
2.35.1


