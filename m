Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F5C24E7AFA
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Mar 2022 23:16:13 +0100 (CET)
Received: from localhost ([::1]:38798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXsE8-0007Is-Fd
	for lists+qemu-devel@lfdr.de; Fri, 25 Mar 2022 18:16:12 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1nXs5i-0004ga-BF
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 18:07:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28116)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1nXs5f-0002lx-8z
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 18:07:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648246044;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cpHETraRzg+3htz1KK9kjXeIW88SwSUSk6cfsOL/QYM=;
 b=S8SY4ccI4QXKpe4w2dnRXW8CDO+/9j4I/xVCvfY1g+t9QrGuYtdMPQyp5ZE6G55vyjpp2V
 RVC1bVvo4QylyXxJI6u6+j/v0Ky6SXO6jKFLqG4iysd+/r0fZDAOafed02dKKjFuXx2NC2
 RXkEvi9wTP7A7DsTVonVnQoC+yjFBIo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-618-8Vi51-7MPcu_SzVKbe9_hg-1; Fri, 25 Mar 2022 18:07:23 -0400
X-MC-Unique: 8Vi51-7MPcu_SzVKbe9_hg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 73A57380051E
 for <qemu-devel@nongnu.org>; Fri, 25 Mar 2022 22:07:23 +0000 (UTC)
Received: from tapioca.redhat.com (unknown [10.40.192.95])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 50B6D40D2970;
 Fri, 25 Mar 2022 22:07:22 +0000 (UTC)
From: Victor Toso <victortoso@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 08/14] qapi: fix example of FAILOVER_NEGOTIATED event
Date: Fri, 25 Mar 2022 23:07:01 +0100
Message-Id: <20220325220707.52118-9-victortoso@redhat.com>
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

* Data is an object, not a string. It generates a qdict.
* Timestamp is not optional, let's add for completeness.
* Add missing "@" to proper document "device-id"
* Add extra space for "Since" section

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


