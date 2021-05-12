Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ACC237D102
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 19:50:15 +0200 (CEST)
Received: from localhost ([::1]:53514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgszp-0006Tl-R5
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 13:50:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lgstR-0003A6-7G
 for qemu-devel@nongnu.org; Wed, 12 May 2021 13:43:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48405)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lgstP-0006fh-0I
 for qemu-devel@nongnu.org; Wed, 12 May 2021 13:43:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620841410;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TtO597vWL3YjT0lF8Xi4dX61e0R3nBj7SxsdKv7Vbpw=;
 b=E0BthABXrLlo33B5DyvPUEebN5I86YTbZ20NP+kqKqLSPK85/C+8cD5VtT8a9H6qkQpEmW
 tlHkYLEy3ryV+0j3wxVWzEZvwbufxY3w0ErKTbIesyLpTm6MWFJxhw3F5FlTaMfg7xL1GB
 CroTV9/G2rgykAiX1AcDjLDAoB7bu2Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-256-_ph91t1AM4SwDUYqRs7k_A-1; Wed, 12 May 2021 13:43:27 -0400
X-MC-Unique: _ph91t1AM4SwDUYqRs7k_A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E90BB1B18BC1;
 Wed, 12 May 2021 17:43:26 +0000 (UTC)
Received: from localhost (ovpn-114-121.ams2.redhat.com [10.36.114.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8D7685D9C0;
 Wed, 12 May 2021 17:43:26 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v2 2/4] migrate-bitmaps-postcopy-test: Fix pylint warnings
Date: Wed, 12 May 2021 19:43:16 +0200
Message-Id: <20210512174318.59466-3-mreitz@redhat.com>
In-Reply-To: <20210512174318.59466-1-mreitz@redhat.com>
References: <20210512174318.59466-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

pylint complains that discards1_sha256 and all_discards_sha256 are first
set in non-__init__ methods.

These variables are not really class-variables anyway, so let them
instead be returned by start_postcopy(), thus silencing pylint.

Suggested-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Signed-off-by: Max Reitz <mreitz@redhat.com>
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


