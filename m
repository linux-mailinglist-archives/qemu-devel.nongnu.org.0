Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E697B4ED809
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 12:56:51 +0200 (CEST)
Received: from localhost ([::1]:57030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZsTz-00012Y-1W
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 06:56:51 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nZsR9-0006f8-CD
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 06:53:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27845)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nZsR7-0007hD-ET
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 06:53:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648724032;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u8D4l1aXRLGfYkDDWxsNCaM2DEAJz4Xy8nByNok23sw=;
 b=VF5moKxzmJ6U5nlSObh6cgHstw/9hOzyfkRz/hu0SNvI3MjJ/kC04u0Bz4YHOnCfVWGd/V
 4pJCDJH+bXntzCUcYUobsFU8A/Fy3tadsXbTCeydqsmnF+vyqxGc/q/jLbBSPm6Vc4Z6A2
 tIsSlT5ZSRF2r1VX0Ub19P9qvcXbuMk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-36-8T8tlqyfPZWk2wc_GuaMRw-1; Thu, 31 Mar 2022 06:53:51 -0400
X-MC-Unique: 8T8tlqyfPZWk2wc_GuaMRw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 954D5805F46;
 Thu, 31 Mar 2022 10:53:50 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 88E1C5B156B;
 Thu, 31 Mar 2022 10:53:48 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 8163021E6926; Thu, 31 Mar 2022 12:53:44 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 03/15] qapi: fix example of BLOCK_IMAGE_CORRUPTED event
Date: Thu, 31 Mar 2022 12:53:32 +0200
Message-Id: <20220331105344.3471295-4-armbru@redhat.com>
In-Reply-To: <20220331105344.3471295-1-armbru@redhat.com>
References: <20220331105344.3471295-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: application/octet-stream; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, BODY_EMPTY=1.31,
 DKIMWL_WL_HIGH=-0.082, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001,
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

Example output lacks mandatory member @fatal.  Provide it.

Example output shows a value of @msg no version of the code
produces.  No big deal, but replace it anyway by one that
today's code does produce.

Signed-off-by: Victor Toso <victortoso@redhat.com>
Message-Id: <20220328140604.41484-3-victortoso@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: John Snow <jsnow@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 qapi/block-core.json | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/qapi/block-core.json b/qapi/block-core.json
index e89f2dfb5b..63c30a5378 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -5006,10 +5006,9 @@
 # Example:
 #
 # <- { "event": "BLOCK_IMAGE_CORRUPTED",
-#      "data": { "device": "ide0-hd0", "node-name": "node0",
-#                "msg": "Prevented active L1 table overwrite", "offset": 196608,
-#                "size": 65536 },
-#      "timestamp": { "seconds": 1378126126, "microseconds": 966463 } }
+#      "data": { "device": "", "node-name": "drive", "fatal": false,
+#                "msg": "L2 table offset 0x2a2a2a00 unaligned (L1 index: 0)" },
+#      "timestamp": { "seconds": 1648243240, "microseconds": 906060 } }
 #
 # Since: 1.7
 ##
-- 
2.35.1


