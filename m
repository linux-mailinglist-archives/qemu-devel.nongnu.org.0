Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E3D84EE176
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 21:14:03 +0200 (CEST)
Received: from localhost ([::1]:53010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1na0F8-00031J-GH
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 15:14:02 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1na08H-0006vn-Pj
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 15:06:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50935)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1na08F-0003fa-Kh
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 15:06:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648753615;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XsxStyYWkFgiWwub3AIfJaJ5nqrFaG+5BTOB9ZCkuoc=;
 b=FTsDZFQ2gafHB/D9CLeK61fqHsGnCRVlw+3paIwUuPmiQTUXQniQ0nWj8bRTR8b3Exgf7H
 PZmJ8J29TnocS2d4jyEcwIPockSBzn4wbqIYJZ/c26Igmp4+vBDrg8vpb5q0wYsX6Inmpi
 cgAFmjRwOLSkSpIxOuKXBWj8qGLxQAQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-347-1thf3C-NN-y5RV1iysUw2w-1; Thu, 31 Mar 2022 15:06:53 -0400
X-MC-Unique: 1thf3C-NN-y5RV1iysUw2w-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4C8241C0E357
 for <qemu-devel@nongnu.org>; Thu, 31 Mar 2022 19:06:53 +0000 (UTC)
Received: from tapioca.home (unknown [10.40.193.178])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5281A4021DE;
 Thu, 31 Mar 2022 19:06:51 +0000 (UTC)
From: Victor Toso <victortoso@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 7/9] qapi: fix example of trace-event-get-state command
Date: Thu, 31 Mar 2022 21:06:31 +0200
Message-Id: <20220331190633.121077-8-victortoso@redhat.com>
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

The example output is missing the mandatory member @vcpu. Fix it.

Signed-off-by: Victor Toso <victortoso@redhat.com>
---
 qapi/trace.json | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qapi/trace.json b/qapi/trace.json
index 119509f565..6c6982a587 100644
--- a/qapi/trace.json
+++ b/qapi/trace.json
@@ -69,7 +69,7 @@
 #
 # -> { "execute": "trace-event-get-state",
 #      "arguments": { "name": "qemu_memalign" } }
-# <- { "return": [ { "name": "qemu_memalign", "state": "disabled" } ] }
+# <- { "return": [ { "name": "qemu_memalign", "state": "disabled", "vcpu": false } ] }
 #
 ##
 { 'command': 'trace-event-get-state',
-- 
2.35.1


