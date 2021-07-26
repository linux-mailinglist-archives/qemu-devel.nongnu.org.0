Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB453D59BC
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 14:47:14 +0200 (CEST)
Received: from localhost ([::1]:34610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m800n-0002Qr-8S
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 08:47:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1m7zxd-00005V-Ez
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 08:43:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48519)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1m7zxb-0007oU-6c
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 08:43:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627303434;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d1JRzZtwxenW5lXW+s32hPG5NWcQdJp6zoQlhJYbJbI=;
 b=BJ1h8idOit2WvgGNRYVwnO1+esVeI10NJ/bZ64ZZjp5T0jwXxxqYd5c5XmjMacA8CutGQ2
 M/G/9ZGqUp9mjI2RYiPs162myBNaRGj6npd9kpu9zcSGHmRMqC48qWXMOWSl6tjn8R3Prh
 8zkf+FqXvE7OU4B+eN4ZAo3zC7c4uoY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-161-YsAwnkC2MVS3-p3ktCZkow-1; Mon, 26 Jul 2021 08:43:52 -0400
X-MC-Unique: YsAwnkC2MVS3-p3ktCZkow-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 48A37107B789;
 Mon, 26 Jul 2021 12:43:51 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-113-117.ams2.redhat.com
 [10.36.113.117])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CA80460C4A;
 Mon, 26 Jul 2021 12:43:49 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org,
	wei.w.wang@intel.com,
	peterx@redhat.com
Subject: [PULL 1/7] tests/qtest/migration-test.c: use 127.0.0.1 instead of 0
Date: Mon, 26 Jul 2021 13:43:25 +0100
Message-Id: <20210726124331.124710-2-dgilbert@redhat.com>
In-Reply-To: <20210726124331.124710-1-dgilbert@redhat.com>
References: <20210726124331.124710-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: berrange@redhat.com, leobras@redhat.com, david@redhat.com,
 quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

OpenBSD doesn't like :0 as an address, switch to using 127.0.0.1
in baddest; it's really testing the :0 port number that isn't allowed
on anything.

(The test doesn't currently run anyway because of the userfault
problem that Peter noticed, but this gets us closer to being able to
reenable it)

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Message-Id: <20210719185217.122105-1-dgilbert@redhat.com>
Acked-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Philippe Mathieu-Daude <philmd@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 tests/qtest/migration-test.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index 328d6dbe97..1e8b7784ef 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -787,10 +787,10 @@ static void test_baddest(void)
 
     args->hide_stderr = true;
 
-    if (test_migrate_start(&from, &to, "tcp:0:0", args)) {
+    if (test_migrate_start(&from, &to, "tcp:127.0.0.1:0", args)) {
         return;
     }
-    migrate_qmp(from, "tcp:0:0", "{}");
+    migrate_qmp(from, "tcp:127.0.0.1:0", "{}");
     wait_for_migration_fail(from, false);
     test_migrate_end(from, to, false);
 }
-- 
2.31.1


