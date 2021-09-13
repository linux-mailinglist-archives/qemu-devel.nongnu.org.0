Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32EEC408C2F
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 15:14:09 +0200 (CEST)
Received: from localhost ([::1]:34042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPlmi-00075S-67
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 09:14:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mPlFa-0000QF-27
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 08:39:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54610)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mPlFU-0000jU-TT
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 08:39:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631536786;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zHgsNGjNah71OnQgLH+Bv40egKqf65QC38I5m9vVxtM=;
 b=N5jMnkV0EEeAAmIaRRZP9TV0Gg2Sisn1KslZKZOzDhg/3fE2sFHgao72eEGL45fZccJv5V
 N1IY/9lTmnKBOwzzsapc7pnDftNtACKJOhVhmwEz33qcVxToQL/J4/xGldbGpyuiDf/U36
 SCH92jZxrBVqtav1yJl7pn5gigjxRGY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-313-hkdUQyAzMBOk3PgQXFEsaQ-1; Mon, 13 Sep 2021 08:39:45 -0400
X-MC-Unique: hkdUQyAzMBOk3PgQXFEsaQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1AAE0835DE1
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 12:39:44 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-14.ams2.redhat.com
 [10.36.112.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DEAF35D9DD;
 Mon, 13 Sep 2021 12:39:43 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 570761136421; Mon, 13 Sep 2021 14:39:32 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 22/22] test-clone-visitor: Correct an accidental rename
Date: Mon, 13 Sep 2021 14:39:32 +0200
Message-Id: <20210913123932.3306639-23-armbru@redhat.com>
In-Reply-To: <20210913123932.3306639-1-armbru@redhat.com>
References: <20210913123932.3306639-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: jsnow@redhat.com, eblake@redhat.com, marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit b359f4b203 "tests: Rename UserDefNativeListUnion to
UserDefListUnion" renamed test_clone_native_list() to
test_clone_list_union().  The function has nothing to do with unions.
Rename it to test_clone_list().

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 tests/unit/test-clone-visitor.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/unit/test-clone-visitor.c b/tests/unit/test-clone-visitor.c
index 4048018607..5d48e125b8 100644
--- a/tests/unit/test-clone-visitor.c
+++ b/tests/unit/test-clone-visitor.c
@@ -63,7 +63,7 @@ static void test_clone_alternate(void)
     qapi_free_AltEnumBool(s_dst);
 }
 
-static void test_clone_list_union(void)
+static void test_clone_list(void)
 {
     uint8List *src = NULL, *dst;
     uint8List *tmp = NULL;
@@ -203,7 +203,7 @@ int main(int argc, char **argv)
 
     g_test_add_func("/visitor/clone/struct", test_clone_struct);
     g_test_add_func("/visitor/clone/alternate", test_clone_alternate);
-    g_test_add_func("/visitor/clone/list_union", test_clone_list_union);
+    g_test_add_func("/visitor/clone/list", test_clone_list);
     g_test_add_func("/visitor/clone/empty", test_clone_empty);
     g_test_add_func("/visitor/clone/complex1", test_clone_complex1);
     g_test_add_func("/visitor/clone/complex2", test_clone_complex2);
-- 
2.31.1


