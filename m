Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14CEB4ED837
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 13:08:03 +0200 (CEST)
Received: from localhost ([::1]:54332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZsem-0002QJ-8j
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 07:08:01 -0400
Received: from eggs.gnu.org ([209.51.188.92]:32918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nZsRP-0006kL-1M
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 06:54:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53907)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nZsRM-0007jj-Od
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 06:54:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648724048;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m3pMCU7ZQ9Rn0FpxvbBkhxD9PtbLU6laGZ8FuX/pHPo=;
 b=fnZ5ZVSwkHhb4pU9q5U5rw5lXPUUMwC+P3xn9HkLJmGrevLbpRZ0IkcWJgOknypuo4B8X3
 la9Ku0aD735o/OXahqEFzclvtxz2E1u2pc8joOHZtxnAAK2ANVWAfUfQSD5G8OOj+jeRTL
 3oPRTraMKTF8NXyQlJYQyZYCwe1Nec8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-215-l08GPIEWPv2V07zR34DWgw-1; Thu, 31 Mar 2022 06:54:05 -0400
X-MC-Unique: l08GPIEWPv2V07zR34DWgw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A82C4899ED3;
 Thu, 31 Mar 2022 10:53:54 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0537A40D0167;
 Thu, 31 Mar 2022 10:53:52 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 8F09421E6939; Thu, 31 Mar 2022 12:53:44 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 09/15] qapi: fix example of FAILOVER_NEGOTIATED event
Date: Thu, 31 Mar 2022 12:53:38 +0200
Message-Id: <20220331105344.3471295-10-armbru@redhat.com>
In-Reply-To: <20220331105344.3471295-1-armbru@redhat.com>
References: <20220331105344.3471295-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
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

Event's documentation is not properly formatted. Fix it by:
- Adding @ to "device-id"
- Adding extra line for "Since" section

Signed-off-by: Victor Toso <victortoso@redhat.com>
Reviewed-by: John Snow <jsnow@redhat.com>
Message-Id: <20220328140604.41484-9-victortoso@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
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


