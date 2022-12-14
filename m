Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 842AC64C73E
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Dec 2022 11:36:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5Oi7-0007hx-Oq; Wed, 14 Dec 2022 05:09:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p5Ohv-0007dh-TC
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 05:09:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p5Ohr-0001AR-4t
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 05:09:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671012580;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7S3GWN51CmGtsthJ2l5fGFqu0VyC2LZnsZ77JXdeJ4w=;
 b=PgGJQyazaJ8S7gmT+PTvlMKcTlgK/aFWGROkmlKOUoE9r7+E2hn3DZQ2Cuh6vc66PLHllk
 Rk0Xuj/EezeDqcW5H3vwzEGa3GwtrbSUmd6V6wSladdQBh4LDOq7FS3xkx+/46eZyH1mY6
 DnqaZhirbzcEVJa/AoXU5tIDSjIxDJQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-350-1mRRqW-cNN-tJfJHxvhzZw-1; Wed, 14 Dec 2022 05:09:36 -0500
X-MC-Unique: 1mRRqW-cNN-tJfJHxvhzZw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4763E101A521;
 Wed, 14 Dec 2022 10:09:36 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 15892492C14;
 Wed, 14 Dec 2022 10:09:34 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-devel@nongnu.org
Cc: Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PULL 14/23] tests/qtest/e1000e-test: De-duplicate constants
Date: Wed, 14 Dec 2022 11:09:02 +0100
Message-Id: <20221214100911.165291-15-thuth@redhat.com>
In-Reply-To: <20221214100911.165291-1-thuth@redhat.com>
References: <20221214100911.165291-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Akihiko Odaki <akihiko.odaki@daynix.com>

De-duplicate constants found in e1000e_send_verify() and
e1000e_receive_verify() to avoid mismatch and improve readability.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Message-Id: <20221110114426.65951-1-akihiko.odaki@daynix.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/e1000e-test.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/tests/qtest/e1000e-test.c b/tests/qtest/e1000e-test.c
index 08adc5226d..3fc92046be 100644
--- a/tests/qtest/e1000e-test.c
+++ b/tests/qtest/e1000e-test.c
@@ -37,15 +37,15 @@
 
 static void e1000e_send_verify(QE1000E *d, int *test_sockets, QGuestAllocator *alloc)
 {
+    static const char test[] = "TEST";
     struct e1000_tx_desc descr;
-    static const int data_len = 64;
     char buffer[64];
     int ret;
     uint32_t recv_len;
 
     /* Prepare test data buffer */
-    uint64_t data = guest_alloc(alloc, data_len);
-    memwrite(data, "TEST", 5);
+    uint64_t data = guest_alloc(alloc, sizeof(buffer));
+    memwrite(data, test, sizeof(test));
 
     /* Prepare TX descriptor */
     memset(&descr, 0, sizeof(descr));
@@ -54,7 +54,7 @@ static void e1000e_send_verify(QE1000E *d, int *test_sockets, QGuestAllocator *a
                                    E1000_TXD_CMD_EOP  |
                                    E1000_TXD_CMD_DEXT |
                                    E1000_TXD_DTYP_D   |
-                                   data_len);
+                                   sizeof(buffer));
 
     /* Put descriptor to the ring */
     e1000e_tx_ring_push(d, &descr);
@@ -69,9 +69,9 @@ static void e1000e_send_verify(QE1000E *d, int *test_sockets, QGuestAllocator *a
     /* Check data sent to the backend */
     ret = recv(test_sockets[0], &recv_len, sizeof(recv_len), 0);
     g_assert_cmpint(ret, == , sizeof(recv_len));
-    ret = recv(test_sockets[0], buffer, 64, 0);
-    g_assert_cmpint(ret, >=, 5);
-    g_assert_cmpstr(buffer, == , "TEST");
+    ret = recv(test_sockets[0], buffer, sizeof(buffer), 0);
+    g_assert_cmpint(ret, ==, sizeof(buffer));
+    g_assert_cmpstr(buffer, == , test);
 
     /* Free test data buffer */
     guest_free(alloc, data);
@@ -93,7 +93,6 @@ static void e1000e_receive_verify(QE1000E *d, int *test_sockets, QGuestAllocator
         },
     };
 
-    static const int data_len = 64;
     char buffer[64];
     int ret;
 
@@ -102,7 +101,7 @@ static void e1000e_receive_verify(QE1000E *d, int *test_sockets, QGuestAllocator
     g_assert_cmpint(ret, == , sizeof(test) + sizeof(len));
 
     /* Prepare test data buffer */
-    uint64_t data = guest_alloc(alloc, data_len);
+    uint64_t data = guest_alloc(alloc, sizeof(buffer));
 
     /* Prepare RX descriptor */
     memset(&descr, 0, sizeof(descr));
@@ -120,7 +119,7 @@ static void e1000e_receive_verify(QE1000E *d, int *test_sockets, QGuestAllocator
 
     /* Check data sent to the backend */
     memread(data, buffer, sizeof(buffer));
-    g_assert_cmpstr(buffer, == , "TEST");
+    g_assert_cmpstr(buffer, == , test);
 
     /* Free test data buffer */
     guest_free(alloc, data);
-- 
2.31.1


