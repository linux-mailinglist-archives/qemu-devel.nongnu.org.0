Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A463FEB85
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 11:46:29 +0200 (CEST)
Received: from localhost ([::1]:38258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLjIi-0004b3-4L
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 05:46:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mLjCx-000204-SR
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 05:40:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32472)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mLjCt-0008Fv-F8
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 05:40:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630575626;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qiB3dUTaWE/YvWmyDmGZU2vTy2KE0kjhPKZIdFCe9jA=;
 b=Q/Dv6KChHl9IcPxyAdpZcxy10GYfhy62TW0TlhmccM4+n+YzSsa3jA+UMac1u8ZOEl133X
 qrLsfPIz5+A34B6EGfV3CqTAtzK7j4kfJObhx1D9Q6L7xvg3waI5BUSMGA+Hq2uDn356Rh
 O3w0lpeNfwiYw+3/aUUJaRQKjP6IYGE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-416-sMYBz5YtMkmFJjlEogiUDA-1; Thu, 02 Sep 2021 05:40:25 -0400
X-MC-Unique: sMYBz5YtMkmFJjlEogiUDA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0EF36824FA7;
 Thu,  2 Sep 2021 09:40:24 +0000 (UTC)
Received: from localhost (unknown [10.39.193.237])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AE3745C1D0;
 Thu,  2 Sep 2021 09:40:23 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v4 2/5] migrate-bitmaps-postcopy-test: Fix pylint warnings
Date: Thu,  2 Sep 2021 11:40:14 +0200
Message-Id: <20210902094017.32902-3-hreitz@redhat.com>
In-Reply-To: <20210902094017.32902-1-hreitz@redhat.com>
References: <20210902094017.32902-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

pylint complains that discards1_sha256 and all_discards_sha256 are first
set in non-__init__ methods.

These variables are not really class-variables anyway, so let them
instead be returned by start_postcopy(), thus silencing pylint.

Suggested-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
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


