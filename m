Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A4B380F2C
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 19:43:19 +0200 (CEST)
Received: from localhost ([::1]:43836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhbqI-0002HV-KB
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 13:43:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lhawt-0006bf-Gn
 for qemu-devel@nongnu.org; Fri, 14 May 2021 12:46:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22704)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lhawr-00069Q-FF
 for qemu-devel@nongnu.org; Fri, 14 May 2021 12:46:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621010760;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bmZxg/ZZZ0keQKxdTk1xIEmhxLAlTtxDKS9ULDq+6iA=;
 b=aRZ7boDNMe6zCepqNcY1Y9Bhx+Exfpf3Vyhl76bkvUh9kD+RWsW6qG+s/x5LPBPdP46LGT
 iC94/mjbqLM0CKa7soU77G28IYxhZ3C/SYRBzW8NV9s3aegK9RE0X7TR5T95UKLVMLOsEG
 uBuZqoOXG4RmPZPCfbWcejoN5MTByO8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-451-gnJOF6DcMrOQsD9tIATFHA-1; Fri, 14 May 2021 12:45:58 -0400
X-MC-Unique: gnJOF6DcMrOQsD9tIATFHA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3822710074A6;
 Fri, 14 May 2021 16:45:56 +0000 (UTC)
Received: from localhost (ovpn-114-49.ams2.redhat.com [10.36.114.49])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C35A661156;
 Fri, 14 May 2021 16:45:55 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 18/19] test-write-threshold: drop extra TestStruct structure
Date: Fri, 14 May 2021 18:45:13 +0200
Message-Id: <20210514164514.1057680-19-mreitz@redhat.com>
In-Reply-To: <20210514164514.1057680-1-mreitz@redhat.com>
References: <20210514164514.1057680-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

We don't need this extra logic: it doesn't make code simpler.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
Message-Id: <20210506090621.11848-8-vsementsov@virtuozzo.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 tests/unit/test-write-threshold.c | 20 +++-----------------
 1 file changed, 3 insertions(+), 17 deletions(-)

diff --git a/tests/unit/test-write-threshold.c b/tests/unit/test-write-threshold.c
index 9e9986aefc..49b1ef7a20 100644
--- a/tests/unit/test-write-threshold.c
+++ b/tests/unit/test-write-threshold.c
@@ -37,26 +37,12 @@ static void test_threshold_trigger(void)
     g_assert_cmpuint(bdrv_write_threshold_get(&bs), ==, 0);
 }
 
-typedef struct TestStruct {
-    const char *name;
-    void (*func)(void);
-} TestStruct;
-
 
 int main(int argc, char **argv)
 {
-    size_t i;
-    TestStruct tests[] = {
-        { "/write-threshold/not-trigger",
-          test_threshold_not_trigger },
-        { "/write-threshold/trigger",
-          test_threshold_trigger },
-        { NULL, NULL }
-    };
-
     g_test_init(&argc, &argv, NULL);
-    for (i = 0; tests[i].name != NULL; i++) {
-        g_test_add_func(tests[i].name, tests[i].func);
-    }
+    g_test_add_func("/write-threshold/not-trigger", test_threshold_not_trigger);
+    g_test_add_func("/write-threshold/trigger", test_threshold_trigger);
+
     return g_test_run();
 }
-- 
2.31.1


