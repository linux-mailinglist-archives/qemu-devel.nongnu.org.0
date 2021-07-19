Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F28A3CEB31
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 20:54:35 +0200 (CEST)
Received: from localhost ([::1]:43852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5YPS-0007km-1E
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 14:54:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1m5YNU-0006MM-MC
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 14:52:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56865)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1m5YNS-0002CT-SS
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 14:52:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626720749;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=BeIeu+jyRLhKOJEaKI7l2NToPaxPVIwGu6y9IRBbh00=;
 b=K20WUEUwlkyM+mOxsKiUfipz46Dqh+CDHnBcENVeEiPJnVtfBfORuJrGoHJHSlDyE+jleI
 pVEgADt76VzLX28GFb1XSwhg0ONByhfnIqNF0W3ByoMMOUuEsd4xZ8apso4eJjBO2SrZV3
 tRc7sBMBIPLwJv0h7HnNYHUysiQjzkI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-1-OV7fZ7FwOwa0R_zafmzcfw-1; Mon, 19 Jul 2021 14:52:28 -0400
X-MC-Unique: OV7fZ7FwOwa0R_zafmzcfw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 70C3C10C1ADC
 for <qemu-devel@nongnu.org>; Mon, 19 Jul 2021 18:52:27 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-114-182.ams2.redhat.com
 [10.36.114.182])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C077660BD9;
 Mon, 19 Jul 2021 18:52:22 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, thuth@redhat.com, peterx@redhat.com,
 berrange@redhat.com, quintela@redhat.com
Subject: [PATCH] tests/qtest/migration-test.c: use 127.0.0.1 instead of 0
Date: Mon, 19 Jul 2021 19:52:17 +0100
Message-Id: <20210719185217.122105-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.469,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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


