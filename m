Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FF604E7AED
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Mar 2022 23:09:41 +0100 (CET)
Received: from localhost ([::1]:42786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXs7o-0007Re-5s
	for lists+qemu-devel@lfdr.de; Fri, 25 Mar 2022 18:09:40 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1nXs5h-0004cs-1f
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 18:07:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59936)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1nXs5f-0002ld-32
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 18:07:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648246039;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GaAbKcRlgHNCUO2E8Bt8QiiL2zx8UnILoxweGHI8Xw8=;
 b=OYko6GuuRNtrfxGiAFj3HCFWnctFP12FJ0UT04ks2wKEf1tTq530hpSFFigQZErjygEulV
 QQrDmOFE4JSJKnaj6JRpmE/EgT94O/yR6BXFUzN3ykIA5D/MrQXieV6zQDgj6c4u7PVyWZ
 3YyEgk9Ahov64OjXCRZpp4R/lHnGCsU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-546-Mn3BvJWyN62Ju4_vDBARcg-1; Fri, 25 Mar 2022 18:07:18 -0400
X-MC-Unique: Mn3BvJWyN62Ju4_vDBARcg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 12A38811E78
 for <qemu-devel@nongnu.org>; Fri, 25 Mar 2022 22:07:18 +0000 (UTC)
Received: from tapioca.redhat.com (unknown [10.40.192.95])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0048F400F8C2;
 Fri, 25 Mar 2022 22:07:16 +0000 (UTC)
From: Victor Toso <victortoso@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 05/14] qapi: fix example of DUMP_COMPLETED event
Date: Fri, 25 Mar 2022 23:06:58 +0100
Message-Id: <20220325220707.52118-6-victortoso@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=victortoso@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

* Timestamp is not optional, let's add for completeness.
* Add '<-' to signalize it is receiving the data
* While at it, add extra space before "result" and "total"
  and after "completed" value.

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


