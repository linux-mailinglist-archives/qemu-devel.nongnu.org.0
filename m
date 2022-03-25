Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 735D84E7AFC
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Mar 2022 23:17:02 +0100 (CET)
Received: from localhost ([::1]:41272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXsEv-0000Z2-Hu
	for lists+qemu-devel@lfdr.de; Fri, 25 Mar 2022 18:17:01 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1nXs5l-0004sf-RR
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 18:07:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58409)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1nXs5k-0002oZ-BT
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 18:07:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648246051;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GPrjR++JXZL8Jwfm1wYE6uuwSwdytnw620tS+Utbu28=;
 b=T8kYgw2GIlz5Wf+5zwwZdT3exy8CT9XCS6NBmnD2cv5192HcRZEaK9uRPgxuUt6tqyPh9d
 z3ifnbedULQvlGKEtnAn/V6H12WXdmxk1785ZEgyxyaWhTBwKuhqIE9vhHr4Wn5ebgpUD6
 0VwV3Vpg8ewJj/cNT6novra6OG8fm3c=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-86-x9V6VFPsM-iF3KioLxlCwg-1; Fri, 25 Mar 2022 18:07:28 -0400
X-MC-Unique: x9V6VFPsM-iF3KioLxlCwg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2B66F2999B22
 for <qemu-devel@nongnu.org>; Fri, 25 Mar 2022 22:07:28 +0000 (UTC)
Received: from tapioca.redhat.com (unknown [10.40.192.95])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0880840C1438;
 Fri, 25 Mar 2022 22:07:26 +0000 (UTC)
From: Victor Toso <victortoso@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 11/14] qapi: fix example of MEMORY_FAILURE
Date: Fri, 25 Mar 2022 23:07:04 +0100
Message-Id: <20220325220707.52118-12-victortoso@redhat.com>
In-Reply-To: <20220325220707.52118-1-victortoso@redhat.com>
References: <20220325220707.52118-1-victortoso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
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

Minor issues found and fixed with the example:
* The JSON object of EVENT was not closed
* Missing timestamp
* Flags are optional but if defined then all members should be
  include so we add "recursive" member.
* Changed string from '' to "" in action-required member.

Signed-off-by: Victor Toso <victortoso@redhat.com>
Reviewed-by: John Snow <jsnow@redhat.com>
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


