Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87BD94ED833
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 13:07:40 +0200 (CEST)
Received: from localhost ([::1]:53658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZseR-0001xl-72
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 07:07:39 -0400
Received: from eggs.gnu.org ([209.51.188.92]:32908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nZsRN-0006js-RX
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 06:54:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38502)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nZsRM-0007jb-Dh
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 06:54:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648724047;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1sUy0256w4sAMAxfIQQfOsMbIH5WlaXZzJJE8qdeW4E=;
 b=YJ4mAeCvkHhglQQJ2NmVgLHENRt4euGBUCSZYXTeZ55AHNREDRnYDrDSXxKsnJoFTPWvSu
 cMXFKRaRKPDMbXb6ioQjBthtNERBhdHwTkfEDcpECsYcOrQ8/AwvZXvF3CiAh/wB6W/jgO
 996waWWi9cPp3jIYdRThbO7P0pBFZjY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-351-o7PzMtleMcuTdTIHrXA16Q-1; Thu, 31 Mar 2022 06:54:04 -0400
X-MC-Unique: o7PzMtleMcuTdTIHrXA16Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 50AC23802AD4;
 Thu, 31 Mar 2022 10:54:03 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E92A62166B4E;
 Thu, 31 Mar 2022 10:53:54 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 957FC21E681F; Thu, 31 Mar 2022 12:53:44 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 12/15] qapi: fix example of MEMORY_FAILURE
Date: Thu, 31 Mar 2022 12:53:41 +0200
Message-Id: <20220331105344.3471295-13-armbru@redhat.com>
In-Reply-To: <20220331105344.3471295-1-armbru@redhat.com>
References: <20220331105344.3471295-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: application/octet-stream; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, BODY_EMPTY=1.31,
 DKIMWL_WL_HIGH=-0.082, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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

Example output lacks mandatory member @timestamp.  Provide it.

Example output lacks mandatory member flags.recursive.  Provide it.

Minor: Change quotes from '' to "" in @action-required member.

Signed-off-by: Victor Toso <victortoso@redhat.com>
Reviewed-by: John Snow <jsnow@redhat.com>
Message-Id: <20220328140604.41484-12-victortoso@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
[Commit message fixed up]
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 qapi/run-state.json | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/qapi/run-state.json b/qapi/run-state.json
index 7f1c788c4e..8124220bd9 100644
--- a/qapi/run-state.json
+++ b/qapi/run-state.json
@@ -571,7 +571,9 @@
 # <- { "event": "MEMORY_FAILURE",
 #      "data": { "recipient": "hypervisor",
 #                "action": "fatal",
-#                "flags": { 'action-required': false } }
+#                "flags": { "action-required": false,
+#                           "recursive": false } },
+#      "timestamp": { "seconds": 1267061043, "microseconds": 959568 } }
 #
 ##
 { 'event': 'MEMORY_FAILURE',
-- 
2.35.1


