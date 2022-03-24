Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F9B74E6832
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Mar 2022 18:58:06 +0100 (CET)
Received: from localhost ([::1]:55366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXRim-0002l4-SA
	for lists+qemu-devel@lfdr.de; Thu, 24 Mar 2022 13:58:05 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1nXRcV-0002Vq-FL
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 13:51:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45571)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1nXRcU-0006YK-6L
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 13:51:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648144293;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ddfITHt2XBGIrZKnv5oVGdrSZIq/OigF3Ff+nX6l2SY=;
 b=P3H4suFLioy8CcSI9Qmds4liw5T9uwMu5Vi5n9nF/yKg3BExM6OMTe8TXJvnlSeRZp96SC
 L2l2QKhoa57LbUsrHZr1JMluIHcuxnaqhmq6oWVDtWcq0TR7zR4zgldD41ok6c2b/99yiY
 omnjnItqqIqPvN0ApIQCZ0iOO6NtkMU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-147-kdBrkOhGNXiS_QBp1GUWMQ-1; Thu, 24 Mar 2022 13:50:23 -0400
X-MC-Unique: kdBrkOhGNXiS_QBp1GUWMQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A2A7985A5BE
 for <qemu-devel@nongnu.org>; Thu, 24 Mar 2022 17:50:22 +0000 (UTC)
Received: from tapioca.redhat.com (unknown [10.40.195.110])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4F9E1401E89;
 Thu, 24 Mar 2022 17:50:21 +0000 (UTC)
From: Victor Toso <victortoso@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 03/14] qapi: fix example of BLOCK_IO_ERROR event
Date: Thu, 24 Mar 2022 18:50:04 +0100
Message-Id: <20220324175015.232794-4-victortoso@redhat.com>
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

Reason is not optional.

Signed-off-by: Victor Toso <victortoso@redhat.com>
---
 qapi/block-core.json | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/qapi/block-core.json b/qapi/block-core.json
index 585a9e020e..5b6c069dd9 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -5059,7 +5059,8 @@
 #      "data": { "device": "ide0-hd1",
 #                "node-name": "#block212",
 #                "operation": "write",
-#                "action": "stop" },
+#                "action": "stop",
+#                "reason": "Driver requires too large request alignment" },
 #      "timestamp": { "seconds": 1265044230, "microseconds": 450486 } }
 #
 ##
-- 
2.35.1


