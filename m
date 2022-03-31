Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5200A4EE161
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 21:08:10 +0200 (CEST)
Received: from localhost ([::1]:36936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1na09R-0000Z5-5R
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 15:08:09 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1na08H-0006x6-Qb
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 15:06:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42734)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1na08G-0003fe-FZ
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 15:06:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648753615;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=//vO2ocfNBIJd1EP02HNNXHI0IlTwTJeEOZIxCak5ps=;
 b=CjqI7k41VYpnsXsA5QorU9k3fs72+rqbwJgAqR4jUr9ZZmiEhu+M8JZ0j/bLoMxeFv6WYc
 131Ld/0ODu1Opq40TKhxtuQGp0Esa6XIITGcgVz/UZEU97gMDnosrQ2367tQUvY1ORpwkV
 hn5+oYKADiVw103ddUvT/KV1rGkB1Ig=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-556-ZqMKuQP3NaayYrGagvlArw-1; Thu, 31 Mar 2022 15:06:52 -0400
X-MC-Unique: ZqMKuQP3NaayYrGagvlArw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5B3EA811E83
 for <qemu-devel@nongnu.org>; Thu, 31 Mar 2022 19:06:51 +0000 (UTC)
Received: from tapioca.home (unknown [10.40.193.178])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C0C21401E93;
 Thu, 31 Mar 2022 19:06:49 +0000 (UTC)
From: Victor Toso <victortoso@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 6/9] qapi: fix example of query-colo-status command
Date: Thu, 31 Mar 2022 21:06:30 +0200
Message-Id: <20220331190633.121077-7-victortoso@redhat.com>
In-Reply-To: <20220331190633.121077-1-victortoso@redhat.com>
References: <20220331190633.121077-1-victortoso@redhat.com>
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
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

The example output is missing the mandatory member @last-mode in the
return value. Fix it.

Signed-off-by: Victor Toso <victortoso@redhat.com>
---
 qapi/migration.json | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qapi/migration.json b/qapi/migration.json
index 092a63354b..f74777608a 100644
--- a/qapi/migration.json
+++ b/qapi/migration.json
@@ -1679,7 +1679,7 @@
 # Example:
 #
 # -> { "execute": "query-colo-status" }
-# <- { "return": { "mode": "primary", "reason": "request" } }
+# <- { "return": { "mode": "primary", "last-mode": "none", "reason": "request" } }
 #
 # Since: 3.1
 ##
-- 
2.35.1


