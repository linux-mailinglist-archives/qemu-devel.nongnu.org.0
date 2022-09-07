Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2CA65B080C
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Sep 2022 17:09:06 +0200 (CEST)
Received: from localhost ([::1]:35000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVwfq-00060F-0W
	for lists+qemu-devel@lfdr.de; Wed, 07 Sep 2022 11:09:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oVwaV-0004At-Kw
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 11:03:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58899)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oVwaS-0004Sb-Cc
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 11:03:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662563011;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/Uh/Wc7WISRMAfDkDPLDGyMJn/5j/d0yMkCYuM0d/jw=;
 b=Wo27Hh+FIidJYf8Uc4IbP3WdODJpjCvw5mAwvcUIlHnVK83Gfo6doOhkNdF8sN7+UzbIdq
 zuPtVycCsQBOa5Tw5H6iY7q/rE3aeoaajg+S/7dAPEs2YBdJgXr2sfJI+jIsg1FtnZzLT2
 8CfWkk1anjlL2PItasY57ce36gpwdjg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-112-cHDri7KoPoy-g-6oz5K9Dg-1; Wed, 07 Sep 2022 11:03:29 -0400
X-MC-Unique: cHDri7KoPoy-g-6oz5K9Dg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B10878037B7
 for <qemu-devel@nongnu.org>; Wed,  7 Sep 2022 15:03:28 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.166])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8448CC15BC3;
 Wed,  7 Sep 2022 15:03:28 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 3FFA621E691D; Wed,  7 Sep 2022 17:03:27 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
	Victor Toso <victortoso@redhat.com>
Subject: [PULL 02/10] qapi: fix example of query-vnc command
Date: Wed,  7 Sep 2022 17:03:19 +0200
Message-Id: <20220907150327.538464-3-armbru@redhat.com>
In-Reply-To: <20220907150327.538464-1-armbru@redhat.com>
References: <20220907150327.538464-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From: Victor Toso <victortoso@redhat.com>

Example output has an extra ',' delimiter in member "websocket" and it
lacks it in "family" member. Fix it.

Problem was noticed when trying to load the example into python's json
library.

Signed-off-by: Victor Toso <victortoso@redhat.com>
Message-Id: <20220901085840.22520-3-victortoso@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
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


