Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBE454E6822
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Mar 2022 18:54:38 +0100 (CET)
Received: from localhost ([::1]:46900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXRfR-0005Q4-VV
	for lists+qemu-devel@lfdr.de; Thu, 24 Mar 2022 13:54:38 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1nXRce-0002Wg-1m
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 13:51:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48723)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1nXRcb-0006Yq-IO
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 13:51:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648144296;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UMMGot0Mx+flR+e3CFOvkdxix69Bs+PvLJ2jK2/GgnI=;
 b=KdBdQCRHmlpe+nOyp9nhPM8BJKgkupqy/0bKmp+XA1hJ8CAh4yoCcmqoWBfHcb+TcRPq3g
 8NYMKDY33o2tunkSUWBh0zzjAHAKart8pH6TGVKSdcpjYeS1SunmYEu6TOm6UhhxKyqc+f
 5xFtoG+o0x3O9qN5eGzel8lDqDesFhs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-574-_itca7wJM3eLsiMoN1AsbA-1; Thu, 24 Mar 2022 13:50:28 -0400
X-MC-Unique: _itca7wJM3eLsiMoN1AsbA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4B001802C16
 for <qemu-devel@nongnu.org>; Thu, 24 Mar 2022 17:50:28 +0000 (UTC)
Received: from tapioca.redhat.com (unknown [10.40.195.110])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4038A400DC9;
 Thu, 24 Mar 2022 17:50:27 +0000 (UTC)
From: Victor Toso <victortoso@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 07/14] qapi: fix example of UNPLUG_PRIMARY event
Date: Thu, 24 Mar 2022 18:50:08 +0100
Message-Id: <20220324175015.232794-8-victortoso@redhat.com>
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
* Break likes like most of examples do

Signed-off-by: Victor Toso <victortoso@redhat.com>
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


