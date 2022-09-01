Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC1405A930D
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 11:24:50 +0200 (CEST)
Received: from localhost ([::1]:48378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTgRN-0004Il-P5
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 05:24:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1oTg2E-0008Ke-DD
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 04:58:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35991)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1oTg2D-0004uB-1i
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 04:58:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662022728;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HtYPPBE6c02r0NNF+Dq23EsjyLJqQneYQ+NO24hwgVI=;
 b=eANpOzbXF42NLI/x2jb+Tcryg3+vBj2imfCqh5GE/NdC6cGUNY5QnK/ybOa63CmE3GoPEb
 3tlpluuaDis3xMx/LmSZCSCl2xH7VesMVWc0f6YwkZ/r7q8M5ZsIiMkGgii9jLrGnqZL5b
 nB9HwZlFV7R7S1R5xtqj46ZTGL6lA1o=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-540-hhTv3UuPNvyAgXsTSigUCA-1; Thu, 01 Sep 2022 04:58:47 -0400
X-MC-Unique: hhTv3UuPNvyAgXsTSigUCA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BD26229AB450;
 Thu,  1 Sep 2022 08:58:46 +0000 (UTC)
Received: from tapioca.redhat.com (unknown [10.40.192.12])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4F9CE2026D4C;
 Thu,  1 Sep 2022 08:58:45 +0000 (UTC)
From: Victor Toso <victortoso@redhat.com>
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 John Snow <jsnow@redhat.com>, Michael Roth <michael.roth@amd.com>
Subject: [PATCH v2 02/10] qapi: fix example of query-vnc command
Date: Thu,  1 Sep 2022 10:58:32 +0200
Message-Id: <20220901085840.22520-3-victortoso@redhat.com>
In-Reply-To: <20220901085840.22520-1-victortoso@redhat.com>
References: <20220901085840.22520-1-victortoso@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=victortoso@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Example output has an extra ',' delimiter in member "websocket" and it
lacks it in "family" member. Fix it.

Problem was noticed when trying to load the example into python's json
library.

Signed-off-by: Victor Toso <victortoso@redhat.com>
---
 qapi/ui.json | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/qapi/ui.json b/qapi/ui.json
index cf58ab4283..286c5731d1 100644
--- a/qapi/ui.json
+++ b/qapi/ui.json
@@ -667,8 +667,8 @@
 #             {
 #                "host":"127.0.0.1",
 #                "service":"50401",
-#                "family":"ipv4"
-#                "websocket":false,
+#                "family":"ipv4",
+#                "websocket":false
 #             }
 #          ]
 #       }
-- 
2.37.2


