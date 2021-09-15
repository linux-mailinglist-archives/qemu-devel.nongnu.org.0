Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CCF740CC20
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 19:59:14 +0200 (CEST)
Received: from localhost ([::1]:58696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQZBg-0007iv-0y
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 13:59:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mQZ6W-0006Lg-4T
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 13:53:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52467)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mQZ6R-0006h8-Kw
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 13:53:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631728426;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=puXKn0rMLPVcQpzKeggCaZfrT6XDpFSqRFBPAxDi+6w=;
 b=jGpOwMUA5prIqD58dQhk6wv4Kv0arP1GZn4hOT4ITSibGsABrCaDGtshY+JKxMVn+5idVk
 O3X6a80AjpRliLix9p6RGzewD3LtwCfj8FePCDIQyLeX1n1LPtvpb5xKxSj430a8kqp8X3
 t1gYue6tOhCyoV9SknoiqRUHfCygXtg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-521-5__-etKlNyeVxos94a2Zsg-1; Wed, 15 Sep 2021 13:53:45 -0400
X-MC-Unique: 5__-etKlNyeVxos94a2Zsg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 496A21966320;
 Wed, 15 Sep 2021 17:53:44 +0000 (UTC)
Received: from localhost (unknown [10.39.192.101])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E3F6F5D9D3;
 Wed, 15 Sep 2021 17:53:43 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 11/32] migrate-bitmaps-postcopy-test: Fix pylint warnings
Date: Wed, 15 Sep 2021 19:52:57 +0200
Message-Id: <20210915175318.853225-12-hreitz@redhat.com>
In-Reply-To: <20210915175318.853225-1-hreitz@redhat.com>
References: <20210915175318.853225-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Hanna Reitz <hreitz@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

pylint complains that discards1_sha256 and all_discards_sha256 are first
set in non-__init__ methods.

These variables are not really class-variables anyway, so let them
instead be returned by start_postcopy(), thus silencing pylint.

Suggested-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20210902094017.32902-3-hreitz@redhat.com>
---
 .../tests/migrate-bitmaps-postcopy-test             | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/tests/qemu-iotests/tests/migrate-bitmaps-postcopy-test b/tests/qemu-iotests/tests/migrate-bitmaps-postcopy-test
index 584062b412..00ebb5c251 100755
--- a/tests/qemu-iotests/tests/migrate-bitmaps-postcopy-test
+++ b/tests/qemu-iotests/tests/migrate-bitmaps-postcopy-test
@@ -132,10 +132,10 @@ class TestDirtyBitmapPostcopyMigration(iotests.QMPTestCase):
 
         result = self.vm_a.qmp('x-debug-block-dirty-bitmap-sha256',
                                node='drive0', name='bitmap0')
-        self.discards1_sha256 = result['return']['sha256']
+        discards1_sha256 = result['return']['sha256']
 
         # Check, that updating the bitmap by discards works
-        assert self.discards1_sha256 != empty_sha256
+        assert discards1_sha256 != empty_sha256
 
         # We want to calculate resulting sha256. Do it in bitmap0, so, disable
         # other bitmaps
@@ -148,7 +148,7 @@ class TestDirtyBitmapPostcopyMigration(iotests.QMPTestCase):
 
         result = self.vm_a.qmp('x-debug-block-dirty-bitmap-sha256',
                                node='drive0', name='bitmap0')
-        self.all_discards_sha256 = result['return']['sha256']
+        all_discards_sha256 = result['return']['sha256']
 
         # Now, enable some bitmaps, to be updated during migration
         for i in range(2, nb_bitmaps, 2):
@@ -173,10 +173,11 @@ class TestDirtyBitmapPostcopyMigration(iotests.QMPTestCase):
 
         event_resume = self.vm_b.event_wait('RESUME')
         self.vm_b_events.append(event_resume)
-        return event_resume
+        return (event_resume, discards1_sha256, all_discards_sha256)
 
     def test_postcopy_success(self):
-        event_resume = self.start_postcopy()
+        event_resume, discards1_sha256, all_discards_sha256 = \
+                self.start_postcopy()
 
         # enabled bitmaps should be updated
         apply_discards(self.vm_b, discards2)
@@ -217,7 +218,7 @@ class TestDirtyBitmapPostcopyMigration(iotests.QMPTestCase):
         for i in range(0, nb_bitmaps, 5):
             result = self.vm_b.qmp('x-debug-block-dirty-bitmap-sha256',
                                    node='drive0', name='bitmap{}'.format(i))
-            sha = self.discards1_sha256 if i % 2 else self.all_discards_sha256
+            sha = discards1_sha256 if i % 2 else all_discards_sha256
             self.assert_qmp(result, 'return/sha256', sha)
 
     def test_early_shutdown_destination(self):
-- 
2.31.1


