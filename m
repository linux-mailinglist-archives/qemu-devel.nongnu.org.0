Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5942734E7AC
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Mar 2021 14:43:21 +0200 (CEST)
Received: from localhost ([::1]:47622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRDiK-0002c5-Fc
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 08:43:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lRDfT-0000tJ-QR
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 08:40:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:24302)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lRDfI-0003N7-1r
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 08:40:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617108009;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ElevEDzid7Hb5vvORFVk+u4BuCouWa591e7mqeNJ988=;
 b=fHwpcW/8Zo9h6bwzxfHAKU/Z4WCo68Q8BN0+86hzdo5oS7lsyNeSqYM/iBudQ3vyRBxEXc
 25ATMXFQT0zPkRMPUf6HpV748dNM6ARFIygueJUb8WnP1xgFelJQ3Al3UBlhHxUt0EvCoy
 Rlkxve8Lg3JbvZzWRMAuWZzoWAEYtxI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-490-0SkokXhwP4KghlpfPraujg-1; Tue, 30 Mar 2021 08:40:07 -0400
X-MC-Unique: 0SkokXhwP4KghlpfPraujg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 404F5107B7C4;
 Tue, 30 Mar 2021 12:40:06 +0000 (UTC)
Received: from localhost (ovpn-113-220.ams2.redhat.com [10.36.113.220])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B90DC19718;
 Tue, 30 Mar 2021 12:40:05 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 3/9] iotests/116: Fix reference output
Date: Tue, 30 Mar 2021 14:39:51 +0200
Message-Id: <20210330123957.826170-4-mreitz@redhat.com>
In-Reply-To: <20210330123957.826170-1-mreitz@redhat.com>
References: <20210330123957.826170-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

15ce94a68ca ("block/qed: bdrv_qed_do_open: deal with errp") has improved
the qed driver's error reporting, though sadly did not add a test for
it.
The good news are: There already is such a test, namely 116.
The bad news are: Its reference output was not adjusted, and so now it
fails.

Let's fix the reference output, which has the nice side effect of
demonstrating 15ce94a68ca's improvements.

Fixes: 15ce94a68ca6730466c565c3d29971aab3087bf1
       ("block/qed: bdrv_qed_do_open: deal with errp")
Signed-off-by: Max Reitz <mreitz@redhat.com>
Message-Id: <20210326141419.156831-1-mreitz@redhat.com>
---
 tests/qemu-iotests/116.out | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/tests/qemu-iotests/116.out b/tests/qemu-iotests/116.out
index 49f9a261a0..5f6c6fffca 100644
--- a/tests/qemu-iotests/116.out
+++ b/tests/qemu-iotests/116.out
@@ -2,7 +2,7 @@ QA output created by 116
 
 == truncated header cluster ==
 Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=134217728
-qemu-io: can't open device TEST_DIR/t.qed: Could not open 'TEST_DIR/t.qed': Invalid argument
+qemu-io: can't open device TEST_DIR/t.qed: QED table offset is invalid
 
 == invalid header magic ==
 Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=134217728
@@ -10,21 +10,21 @@ qemu-io: can't open device TEST_DIR/t.qed: Image not in QED format
 
 == invalid cluster size ==
 Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=134217728
-qemu-io: can't open device TEST_DIR/t.qed: Could not open 'TEST_DIR/t.qed': Invalid argument
+qemu-io: can't open device TEST_DIR/t.qed: QED cluster size is invalid
 
 == invalid table size ==
 Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=134217728
-qemu-io: can't open device TEST_DIR/t.qed: Could not open 'TEST_DIR/t.qed': Invalid argument
+qemu-io: can't open device TEST_DIR/t.qed: QED table size is invalid
 
 == invalid header size ==
 Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=134217728
-qemu-io: can't open device TEST_DIR/t.qed: Could not open 'TEST_DIR/t.qed': Invalid argument
+qemu-io: can't open device TEST_DIR/t.qed: QED table offset is invalid
 
 == invalid L1 table offset ==
 Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=134217728
-qemu-io: can't open device TEST_DIR/t.qed: Could not open 'TEST_DIR/t.qed': Invalid argument
+qemu-io: can't open device TEST_DIR/t.qed: QED table offset is invalid
 
 == invalid image size ==
 Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=134217728
-qemu-io: can't open device TEST_DIR/t.qed: Could not open 'TEST_DIR/t.qed': Invalid argument
+qemu-io: can't open device TEST_DIR/t.qed: QED image size is invalid
 *** done
-- 
2.29.2


