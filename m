Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DC1A4ED83E
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 13:10:01 +0200 (CEST)
Received: from localhost ([::1]:60696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZsgi-0006yO-FR
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 07:10:00 -0400
Received: from eggs.gnu.org ([209.51.188.92]:32958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nZsRU-0006ke-HE
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 06:54:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56989)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nZsRS-0007kL-EW
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 06:54:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648724053;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+ULqRkAMkYmLv/jc2OyTEXCznsLVlQPY7A3g2vhwSpA=;
 b=TDHQInpRqpoNXCJ/e1lbVpwansOPc4nUnLKCNs9rKYV1pti/VW3LJ1K12dEZFQVSvZaU2n
 Gu5tbOqIwa8nAJNvWhLUY6ju6yE+Q3VQ6wEypvDucu0rKtoc8NdaX573aHhx5oIcIg4X26
 RAck6pJmMkg588svFj/VyGOQJAy1myo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-259-jDpks5ftMVGl0XvAVwo8JQ-1; Thu, 31 Mar 2022 06:54:10 -0400
X-MC-Unique: jDpks5ftMVGl0XvAVwo8JQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B6B5618A6582;
 Thu, 31 Mar 2022 10:54:09 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 662BF7AF2;
 Thu, 31 Mar 2022 10:53:54 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 8CA6321E6936; Thu, 31 Mar 2022 12:53:44 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 08/15] qapi: fix example of UNPLUG_PRIMARY event
Date: Thu, 31 Mar 2022 12:53:37 +0200
Message-Id: <20220331105344.3471295-9-armbru@redhat.com>
In-Reply-To: <20220331105344.3471295-1-armbru@redhat.com>
References: <20220331105344.3471295-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: application/octet-stream; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, BODY_EMPTY=1.31,
 DKIMWL_WL_HIGH=-0.082, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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

Example output lacks mandatory member @timestamp.  Provide it.

Example output is not properly formatted. Fixing it by:
- Adding '<-' to signalize it is receiving the data;
- Breaking lines similar to the other examples.

Signed-off-by: Victor Toso <victortoso@redhat.com>
Reviewed-by: John Snow <jsnow@redhat.com>
Message-Id: <20220328140604.41484-8-victortoso@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
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


