Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21741380EE3
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 19:26:04 +0200 (CEST)
Received: from localhost ([::1]:33488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhbZb-0000zJ-7O
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 13:26:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lhawp-0006O0-52
 for qemu-devel@nongnu.org; Fri, 14 May 2021 12:45:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51672)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lhawn-00065J-IQ
 for qemu-devel@nongnu.org; Fri, 14 May 2021 12:45:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621010757;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dcgKeFialWsQlUU42bZNAKRt98qHb1jJkTwHkzfIbT0=;
 b=VdoMguw3qsajZ4ZUgBx0tA4RGRQmgzHysV9P2qzHXIhwxpADcutWpQRJNjbeOLEI/iWVEp
 le0kY0CxXwXMIw4lZlJ6vZrGVCWzO1PUIdmuJYdOfAp3EinKQ0wcsUIODqmDBQK454XxEe
 h5bFLg69lQB/su7SAWotvtUT7vm/r7s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-453-85s2KUqAMTuiw0BF5SQhLA-1; Fri, 14 May 2021 12:45:55 -0400
X-MC-Unique: 85s2KUqAMTuiw0BF5SQhLA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0D7378015F5;
 Fri, 14 May 2021 16:45:54 +0000 (UTC)
Received: from localhost (ovpn-114-49.ams2.redhat.com [10.36.114.49])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A12112B399;
 Fri, 14 May 2021 16:45:51 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 17/19] test-write-threshold: drop extra tests
Date: Fri, 14 May 2021 18:45:12 +0200
Message-Id: <20210514164514.1057680-18-mreitz@redhat.com>
In-Reply-To: <20210514164514.1057680-1-mreitz@redhat.com>
References: <20210514164514.1057680-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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

Testing set/get of one 64bit variable doesn't seem necessary. We have a
lot of such variables. Also remaining tests do test set/get anyway.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
Message-Id: <20210506090621.11848-7-vsementsov@virtuozzo.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 tests/unit/test-write-threshold.c | 43 -------------------------------
 1 file changed, 43 deletions(-)

diff --git a/tests/unit/test-write-threshold.c b/tests/unit/test-write-threshold.c
index bb5c1a5217..9e9986aefc 100644
--- a/tests/unit/test-write-threshold.c
+++ b/tests/unit/test-write-threshold.c
@@ -12,43 +12,6 @@
 #include "block/write-threshold.h"
 
 
-static void test_threshold_not_set_on_init(void)
-{
-    uint64_t res;
-    BlockDriverState bs;
-    memset(&bs, 0, sizeof(bs));
-
-    res = bdrv_write_threshold_get(&bs);
-    g_assert_cmpint(res, ==, 0);
-}
-
-static void test_threshold_set_get(void)
-{
-    uint64_t threshold = 4 * 1024 * 1024;
-    uint64_t res;
-    BlockDriverState bs;
-    memset(&bs, 0, sizeof(bs));
-
-    bdrv_write_threshold_set(&bs, threshold);
-
-    res = bdrv_write_threshold_get(&bs);
-    g_assert_cmpint(res, ==, threshold);
-}
-
-static void test_threshold_multi_set_get(void)
-{
-    uint64_t threshold1 = 4 * 1024 * 1024;
-    uint64_t threshold2 = 15 * 1024 * 1024;
-    uint64_t res;
-    BlockDriverState bs;
-    memset(&bs, 0, sizeof(bs));
-
-    bdrv_write_threshold_set(&bs, threshold1);
-    bdrv_write_threshold_set(&bs, threshold2);
-    res = bdrv_write_threshold_get(&bs);
-    g_assert_cmpint(res, ==, threshold2);
-}
-
 static void test_threshold_not_trigger(void)
 {
     uint64_t threshold = 4 * 1024 * 1024;
@@ -84,12 +47,6 @@ int main(int argc, char **argv)
 {
     size_t i;
     TestStruct tests[] = {
-        { "/write-threshold/not-set-on-init",
-          test_threshold_not_set_on_init },
-        { "/write-threshold/set-get",
-          test_threshold_set_get },
-        { "/write-threshold/multi-set-get",
-          test_threshold_multi_set_get },
         { "/write-threshold/not-trigger",
           test_threshold_not_trigger },
         { "/write-threshold/trigger",
-- 
2.31.1


