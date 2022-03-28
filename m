Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C327F4E99AE
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Mar 2022 16:34:45 +0200 (CEST)
Received: from localhost ([::1]:34202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYqS7-0002Xl-6S
	for lists+qemu-devel@lfdr.de; Mon, 28 Mar 2022 10:34:39 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1nYq0r-0006x1-8C
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 10:06:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50405)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1nYq0o-0005JC-69
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 10:06:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648476385;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UJGRHXb/SAOiBjCjDgHW1waiGvkuX5QVuHcHxUCxquI=;
 b=VKt2khgmvkxgkvSGXaJ+5eCDvy9SMOn9Cf4blRGFqoxuKCs5YF33p3fXP3yJw+pJ67bZW9
 RCTK+Ae5dnPjDNVHLyXvG/Wb4gJrpge1svuicRZPnckl3zh4qbhzlGf3if3XMMD7G+sY12
 IjdZmYNN5J7ySNgHCJCgOH9kNqPnex0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-593-zqcDYLT0NHCIdyIf49w-Ag-1; Mon, 28 Mar 2022 10:06:24 -0400
X-MC-Unique: zqcDYLT0NHCIdyIf49w-Ag-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DA773833960
 for <qemu-devel@nongnu.org>; Mon, 28 Mar 2022 14:06:23 +0000 (UTC)
Received: from tapioca.home (unknown [10.40.195.83])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9D1701400B19;
 Mon, 28 Mar 2022 14:06:22 +0000 (UTC)
From: Victor Toso <victortoso@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 11/14] qapi: fix example of MEMORY_FAILURE
Date: Mon, 28 Mar 2022 16:06:01 +0200
Message-Id: <20220328140604.41484-12-victortoso@redhat.com>
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

Example output lacks mandatory member @timestamp.  Provide it.

While @flags is an optional member, if it is defined then all its
members should be include. For that reason, we add @recursive member.

Minor: Change quotes from '' to "" in @action-required member.

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


