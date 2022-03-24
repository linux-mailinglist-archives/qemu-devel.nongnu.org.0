Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2999C4E684B
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Mar 2022 19:03:53 +0100 (CET)
Received: from localhost ([::1]:43182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXRoO-00058P-8M
	for lists+qemu-devel@lfdr.de; Thu, 24 Mar 2022 14:03:52 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1nXRce-0002Wf-1h
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 13:51:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37465)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1nXRcb-0006Yt-EW
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 13:51:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648144296;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7Qa/XQ3L39MElje1ju0/dyNy6pFCMHl0B/UCeXtBQqs=;
 b=XcPqZBT6J0tYoQl9fOLw9/3ndNFNImys1fst4bqkMt2r3oCTTimZ3gy7Ua1GjLcmtxpcx3
 +pQS6lUsNqWV6XcIoPSrsNx2IgyAr2+qcLPCK2dLyWpm4ZzAyjQ0g5wneVJlp5m8pf/a0j
 ckb+78ww9cYpNxRhZqgJj8N7lowLDEg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-631-P8_nny42PtikQlYDT9yZHQ-1; Thu, 24 Mar 2022 13:50:29 -0400
X-MC-Unique: P8_nny42PtikQlYDT9yZHQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 85E241066542
 for <qemu-devel@nongnu.org>; Thu, 24 Mar 2022 17:50:29 +0000 (UTC)
Received: from tapioca.redhat.com (unknown [10.40.195.110])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 958F4400DC9;
 Thu, 24 Mar 2022 17:50:28 +0000 (UTC)
From: Victor Toso <victortoso@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 08/14] qapi: fix example of FAILOVER_NEGOTIATED event
Date: Thu, 24 Mar 2022 18:50:09 +0100
Message-Id: <20220324175015.232794-9-victortoso@redhat.com>
In-Reply-To: <20220324175015.232794-1-victortoso@redhat.com>
References: <20220324175015.232794-1-victortoso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
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

* Data is an object, not a string. It generates a qdict.
* Timestamp is not optional, let's add for completeness.

Signed-off-by: Victor Toso <victortoso@redhat.com>
---
 qapi/net.json | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/qapi/net.json b/qapi/net.json
index 7fab2e7cd8..82c0d9e778 100644
--- a/qapi/net.json
+++ b/qapi/net.json
@@ -691,7 +691,8 @@
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


