Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C0DD4E7AF5
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Mar 2022 23:14:17 +0100 (CET)
Received: from localhost ([::1]:59010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXsCG-0001dw-Nj
	for lists+qemu-devel@lfdr.de; Fri, 25 Mar 2022 18:14:16 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1nXs5n-0004vu-21
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 18:07:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28555)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1nXs5l-0002oe-Fq
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 18:07:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648246052;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ku2shpfyYJCPuAMurMb5YGI1c+0R7sP9y0BwzD+rOAc=;
 b=RR4vLGk/y10N5jai4G+QBdikPkOYjh/XuRBCE+6PN2FnvR8RDcNLfvLVBwxB1sDGY1qUV8
 mnb64cF/UfwHlYy/GCHhbupkOK0lwetnQQeyk7DAJGNaIrIANcj2ZQlWQYaJ3QlV4b1E6E
 miZDZahqO1VWFDWJBTvqfxgz1Eop+Ic=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-122-AaPlIPWGMhO5__VWVSZoKg-1; Fri, 25 Mar 2022 18:07:31 -0400
X-MC-Unique: AaPlIPWGMhO5__VWVSZoKg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6CCCD811E78
 for <qemu-devel@nongnu.org>; Fri, 25 Mar 2022 22:07:31 +0000 (UTC)
Received: from tapioca.redhat.com (unknown [10.40.192.95])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 30F9140D2970;
 Fri, 25 Mar 2022 22:07:30 +0000 (UTC)
From: Victor Toso <victortoso@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 13/14] qapi: fix example of ACPI_DEVICE_OST event
Date: Fri, 25 Mar 2022 23:07:06 +0100
Message-Id: <20220325220707.52118-14-victortoso@redhat.com>
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

* Missing the timestamp
* Missing the "info" object in the "data" member

Signed-off-by: Victor Toso <victortoso@redhat.com>
Reviewed-by: John Snow <jsnow@redhat.com>
---
 qapi/acpi.json | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/qapi/acpi.json b/qapi/acpi.json
index 51f0d55db7..d148f6db9f 100644
--- a/qapi/acpi.json
+++ b/qapi/acpi.json
@@ -133,8 +133,9 @@
 # Example:
 #
 # <- { "event": "ACPI_DEVICE_OST",
-#      "data": { "device": "d1", "slot": "0",
-#                "slot-type": "DIMM", "source": 1, "status": 0 } }
+#      "data": { "info": { "device": "d1", "slot": "0",
+#                          "slot-type": "DIMM", "source": 1, "status": 0 } },
+#      "timestamp": { "seconds": 1265044230, "microseconds": 450486 } }
 #
 ##
 { 'event': 'ACPI_DEVICE_OST',
-- 
2.35.1


