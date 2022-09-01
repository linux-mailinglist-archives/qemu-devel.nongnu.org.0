Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E4485A9349
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 11:36:44 +0200 (CEST)
Received: from localhost ([::1]:54584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTgct-0004fO-6U
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 05:36:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1oTg2I-0008Mi-C9
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 04:58:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56381)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1oTg2G-0004uY-Jt
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 04:58:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662022732;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fNVTj6nCeLt7W1NZP6wGRhVfkRWy5LinOxflPaxtwk0=;
 b=G4R6b3XVZ2lK/fCrIjq1KDMYWdMoUpsb5h2koFaIsibGtvWJoG06Cs7h/B3vZtobW90+Hq
 ejcqkMVtw2NW0BSwZx/rw0X2mVPzSpoBDrj9/5gmJ1ahAZsvTP7bqVymxFru++NNYwxTMj
 88eJXPTG+Wq1vPBZZQy+wNaPZFkxNo4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-437-mIoeMot9MUWO4wfSpmKjhA-1; Thu, 01 Sep 2022 04:58:48 -0400
X-MC-Unique: mIoeMot9MUWO4wfSpmKjhA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 972763817A6B;
 Thu,  1 Sep 2022 08:58:48 +0000 (UTC)
Received: from tapioca.redhat.com (unknown [10.40.192.12])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 266132026D4C;
 Thu,  1 Sep 2022 08:58:46 +0000 (UTC)
From: Victor Toso <victortoso@redhat.com>
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 John Snow <jsnow@redhat.com>, Michael Roth <michael.roth@amd.com>
Subject: [PATCH v2 03/10] qapi: fix example of
 query-dump-guest-memory-capability command
Date: Thu,  1 Sep 2022 10:58:33 +0200
Message-Id: <20220901085840.22520-4-victortoso@redhat.com>
In-Reply-To: <20220901085840.22520-1-victortoso@redhat.com>
References: <20220901085840.22520-1-victortoso@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=victortoso@redhat.com; helo=us-smtp-delivery-124.mimecast.com
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

Example output is missing closing curly brackets. Fix it.

Problem was noticed when trying to load the example into python's json
library.

Signed-off-by: Victor Toso <victortoso@redhat.com>
---
 qapi/dump.json | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qapi/dump.json b/qapi/dump.json
index 90859c5483..6fc215dd47 100644
--- a/qapi/dump.json
+++ b/qapi/dump.json
@@ -195,7 +195,7 @@
 #
 # -> { "execute": "query-dump-guest-memory-capability" }
 # <- { "return": { "formats":
-#                  ["elf", "kdump-zlib", "kdump-lzo", "kdump-snappy"] }
+#                  ["elf", "kdump-zlib", "kdump-lzo", "kdump-snappy"] } }
 #
 ##
 { 'command': 'query-dump-guest-memory-capability',
-- 
2.37.2


