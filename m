Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CC5F4E9957
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Mar 2022 16:23:13 +0200 (CEST)
Received: from localhost ([::1]:42298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYqH2-0005CQ-DK
	for lists+qemu-devel@lfdr.de; Mon, 28 Mar 2022 10:23:12 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1nYq0d-0006NZ-Uf
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 10:06:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36768)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1nYq0c-0005H2-AK
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 10:06:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648476373;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LBV/5/+KKA5Pf8XW3eAch+0mC/EZFA9g03YwByB6VGQ=;
 b=WtLKfPhi6xdXgfTb5GgotNQj/2zni6C388i0Z5IuoiW2OkZLeGjnc7dZ7NyaXYs9ITLbfd
 6TEfEnbr2OIyrvql+qsfRHdE53deiKuUcmxP+NIQESMbHO3IfqaKuXQ6YYLzVPff3zkyrz
 BHzzwApFvnX7lEgi+E2ygszXMG7aWzw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-313-ckgjYUTcMeCCpGvfQxbkpg-1; Mon, 28 Mar 2022 10:06:12 -0400
X-MC-Unique: ckgjYUTcMeCCpGvfQxbkpg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 21C27802E5B
 for <qemu-devel@nongnu.org>; Mon, 28 Mar 2022 14:06:12 +0000 (UTC)
Received: from tapioca.home (unknown [10.40.195.83])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1A5D51402642;
 Mon, 28 Mar 2022 14:06:10 +0000 (UTC)
From: Victor Toso <victortoso@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 03/14] qapi: fix example of BLOCK_IO_ERROR event
Date: Mon, 28 Mar 2022 16:05:53 +0200
Message-Id: <20220328140604.41484-4-victortoso@redhat.com>
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

Example output lacks mandatory member @reason.  Provide it.

Signed-off-by: Victor Toso <victortoso@redhat.com>
---
 qapi/block-core.json | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/qapi/block-core.json b/qapi/block-core.json
index 63c30a5378..46580ac551 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -5058,7 +5058,8 @@
 #      "data": { "device": "ide0-hd1",
 #                "node-name": "#block212",
 #                "operation": "write",
-#                "action": "stop" },
+#                "action": "stop",
+#                "reason": "No space left on device" },
 #      "timestamp": { "seconds": 1265044230, "microseconds": 450486 } }
 #
 ##
-- 
2.35.1


