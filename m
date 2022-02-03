Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51DDA4A86AB
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 15:37:44 +0100 (CET)
Received: from localhost ([::1]:47452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFdF1-000348-EK
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 09:37:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1nFcvN-0005Oh-5A
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 09:17:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32983)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1nFcv6-00067N-Jk
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 09:17:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643897744;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j0ZzV7rfDIdIr2ESd5WQsHyyQclQNwsgLNl6hCtWf4A=;
 b=T3PDFwgp8gHomJLhQgsC6OnVqlaJqPUqqf9a74VoFvnmjdoGmH6WlDmF4t1sHIMMoIuxCh
 ymeubhWOrAs0B1u7Z8L5hnzO1HTEsdgN+fz6w7Zv29HtRMyvS4AUHlosBvK9sojsmGNXPy
 K5LWseSfFPxEedJ6Uyc0NX/rbm12sOs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-83-Fnf_c3ZyOfmspdDUYQqQ7g-1; Thu, 03 Feb 2022 09:15:43 -0500
X-MC-Unique: Fnf_c3ZyOfmspdDUYQqQ7g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5B6743E745
 for <qemu-devel@nongnu.org>; Thu,  3 Feb 2022 14:15:42 +0000 (UTC)
Received: from thinkpad.redhat.com (unknown [10.39.193.0])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0072E108647C;
 Thu,  3 Feb 2022 14:15:39 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/7] tests/qtest: failover: clean up pathname of tests
Date: Thu,  3 Feb 2022 15:15:31 +0100
Message-Id: <20220203141537.972317-2-lvivier@redhat.com>
In-Reply-To: <20220203141537.972317-1-lvivier@redhat.com>
References: <20220203141537.972317-1-lvivier@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lvivier@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.086,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

clearly indentify parameters, hotplug and migration tests

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
---
 tests/qtest/virtio-net-failover.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/tests/qtest/virtio-net-failover.c b/tests/qtest/virtio-net-failover.c
index 22ad54bb9594..207c1330125b 100644
--- a/tests/qtest/virtio-net-failover.c
+++ b/tests/qtest/virtio-net-failover.c
@@ -1315,6 +1315,7 @@ int main(int argc, char **argv)
     g_assert_true(ret >= 0);
     close(ret);
 
+    /* parameters tests */
     qtest_add_func("failover-virtio-net/params/error/id", test_error_id);
     qtest_add_func("failover-virtio-net/params/error/pcie", test_error_pcie);
     qtest_add_func("failover-virtio-net/params/on", test_on);
@@ -1322,15 +1323,19 @@ int main(int argc, char **argv)
                    test_on_mismatch);
     qtest_add_func("failover-virtio-net/params/off", test_off);
     qtest_add_func("failover-virtio-net/params/enabled", test_enabled);
-    qtest_add_func("failover-virtio-net/hotplug_1", test_hotplug_1);
-    qtest_add_func("failover-virtio-net/hotplug_1_reverse",
+
+    /* hotplug tests */
+    qtest_add_func("failover-virtio-net/hotplug/1", test_hotplug_1);
+    qtest_add_func("failover-virtio-net/hotplug/1_reverse",
                    test_hotplug_1_reverse);
-    qtest_add_func("failover-virtio-net/hotplug_2", test_hotplug_2);
-    qtest_add_func("failover-virtio-net/hotplug_2_reverse",
+    qtest_add_func("failover-virtio-net/hotplug/2", test_hotplug_2);
+    qtest_add_func("failover-virtio-net/hotplug/2_reverse",
                    test_hotplug_2_reverse);
-    qtest_add_data_func("failover-virtio-net/migrate/out", tmpfile,
+
+    /* migration tests */
+    qtest_add_data_func("failover-virtio-net/migrate/on/out", tmpfile,
                         test_migrate_out);
-    qtest_add_data_func("failover-virtio-net/migrate/in", tmpfile,
+    qtest_add_data_func("failover-virtio-net/migrate/on/in", tmpfile,
                         test_migrate_in);
     qtest_add_data_func("failover-virtio-net/migrate/abort/wait-unplug",
                         tmpfile, test_migrate_abort_wait_unplug);
@@ -1340,9 +1345,9 @@ int main(int argc, char **argv)
         qtest_add_data_func("failover-virtio-net/migrate/abort/timeout",
                             tmpfile, test_migrate_abort_timeout);
     }
-    qtest_add_data_func("failover-virtio-net/multi/out",
+    qtest_add_data_func("failover-virtio-net/migrate/multi/out",
                         tmpfile, test_multi_out);
-    qtest_add_data_func("failover-virtio-net/multi/in",
+    qtest_add_data_func("failover-virtio-net/migrate/multi/in",
                    tmpfile, test_multi_in);
 
     ret = g_test_run();
-- 
2.34.1


