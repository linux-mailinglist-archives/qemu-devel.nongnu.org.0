Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AC7A5B0821
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Sep 2022 17:12:07 +0200 (CEST)
Received: from localhost ([::1]:49626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVwif-0002KI-NR
	for lists+qemu-devel@lfdr.de; Wed, 07 Sep 2022 11:12:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oVwab-0004RN-0J
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 11:03:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22011)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oVwaZ-0004UP-Id
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 11:03:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662563019;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IN2Qc/9iCbwwwBsUuP8ndBvX+9f4Xa73ZPFvKTq1+1Q=;
 b=TCiuXHfeyWz8fMbQ5AA29D6edmRdRJ8AIknKHpETxRNqf7xWwiIGUzfus5QxZO2yFRP1rJ
 pOC8hX0NXo08UBHbWqLGEyeyClrsCw6iMg2r6+znbIsklf+YEuVuMlPR10tPZ0h+t+5Pt7
 rjCY99jXapTCoe/WBVCWre4JUG/lg3w=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-624-oJ7pCio9MZWLvmTbevc7jg-1; Wed, 07 Sep 2022 11:03:30 -0400
X-MC-Unique: oJ7pCio9MZWLvmTbevc7jg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9E8813C0D197
 for <qemu-devel@nongnu.org>; Wed,  7 Sep 2022 15:03:29 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.166])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 764EC1415102;
 Wed,  7 Sep 2022 15:03:29 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 4242B21E6928; Wed,  7 Sep 2022 17:03:27 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
	Victor Toso <victortoso@redhat.com>
Subject: [PULL 03/10] qapi: fix example of query-dump-guest-memory-capability
 command
Date: Wed,  7 Sep 2022 17:03:20 +0200
Message-Id: <20220907150327.538464-4-armbru@redhat.com>
In-Reply-To: <20220907150327.538464-1-armbru@redhat.com>
References: <20220907150327.538464-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
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

Example output is missing closing curly brackets. Fix it.

Problem was noticed when trying to load the example into python's json
library.

Signed-off-by: Victor Toso <victortoso@redhat.com>
Message-Id: <20220901085840.22520-4-victortoso@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
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


