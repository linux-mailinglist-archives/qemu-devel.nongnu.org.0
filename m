Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28BA74D509D
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 18:33:27 +0100 (CET)
Received: from localhost ([::1]:52134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSMfG-000564-8n
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 12:33:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nSMSh-0003uO-Da
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 12:20:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43844)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nSMSZ-0003vB-Ei
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 12:20:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646932818;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lyqsA/C2h3o3GrzWoO6cYxXIIJX9GVkp3ZT8NiHOghI=;
 b=KgMHQwQeX3c9YLssuHOZ0MrO1LwDY3GsCo1YHSyslllrMCiDMy00icZIkZPo2sjM04A4j1
 S8hgqtklG3+SgHJoQ0Aq6lvnWJbM8Y8mPoRGEXnhXfQQObmRysMMAlvfEwKTgxBdqdNsQB
 cFADYAbnCE6rQouy0nf3aKtvo0sQmgw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-18-Ml0MIiVONKSgrs949pQL5A-1; Thu, 10 Mar 2022 12:18:57 -0500
X-MC-Unique: Ml0MIiVONKSgrs949pQL5A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CE2B2801AFE
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 17:18:49 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.68])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 04B6B106F74B;
 Thu, 10 Mar 2022 17:18:47 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 04/18] tests: print newline after QMP response in qtest logs
Date: Thu, 10 Mar 2022 17:18:07 +0000
Message-Id: <20220310171821.3724080-5-berrange@redhat.com>
In-Reply-To: <20220310171821.3724080-1-berrange@redhat.com>
References: <20220310171821.3724080-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The QMP commands have a trailing newline, but the response does not.
This makes the qtest logs hard to follow as the next QMP command
appears in the same line as the previous QMP response.

Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 tests/qtest/libqtest.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
index a85f8a6d05..d5b6558876 100644
--- a/tests/qtest/libqtest.c
+++ b/tests/qtest/libqtest.c
@@ -625,10 +625,13 @@ QDict *qmp_fd_receive(int fd)
         }
 
         if (log) {
-            len = write(2, &c, 1);
+            g_assert(write(2, &c, 1) == 1);
         }
         json_message_parser_feed(&qmp.parser, &c, 1);
     }
+    if (log) {
+        g_assert(write(2, "\n", 1) == 1);
+    }
     json_message_parser_destroy(&qmp.parser);
 
     return qmp.response;
-- 
2.34.1


