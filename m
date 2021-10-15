Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFD1442F63E
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 16:51:32 +0200 (CEST)
Received: from localhost ([::1]:47138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbOYW-0002uN-2s
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 10:51:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mbOVl-000089-ST
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 10:48:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56664)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mbOVj-0001fY-QI
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 10:48:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634309318;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M9UVYRm/fWRuO++utWGBFv6ng2qhu32WZTEQhSEgTKc=;
 b=e5w7YgsAg/fKeCz78PXT7jLH7lqi9n5PJxSdmhGSpCN0ICHOMkSfI1TtbcmBVbPtJpDD3w
 8ZgN6uy4l3mQyZDpQ8LpqObw8kQublc0GaqGUzE7pmP5a0+wsyWszhl+B8jc6gHN9BivSP
 NU5nX8wfRG9LUHT5BkfRtQHeZaEEsDI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-350-ld5sGamJNbWfRLnh5Hp6oA-1; Fri, 15 Oct 2021 10:48:37 -0400
X-MC-Unique: ld5sGamJNbWfRLnh5Hp6oA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 62C3910A8E0D
 for <qemu-devel@nongnu.org>; Fri, 15 Oct 2021 14:48:36 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.193.44])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 32CD519736;
 Fri, 15 Oct 2021 14:48:31 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 05/15] iotests/245: Fix type for iothread property
Date: Fri, 15 Oct 2021 16:46:30 +0200
Message-Id: <20211015144640.198044-6-kwolf@redhat.com>
In-Reply-To: <20211015144640.198044-1-kwolf@redhat.com>
References: <20211015144640.198044-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
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
Cc: kwolf@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

iothread is a string property, so None (= JSON null) is not a valid
value for it. Pass the empty string instead to get the default iothread.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20211008133442.141332-6-kwolf@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Tested-by: Peter Krempa <pkrempa@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 tests/qemu-iotests/245 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/qemu-iotests/245 b/tests/qemu-iotests/245
index bf8261eec0..9b12b42eed 100755
--- a/tests/qemu-iotests/245
+++ b/tests/qemu-iotests/245
@@ -1189,10 +1189,10 @@ class TestBlockdevReopen(iotests.QMPTestCase):
         self.run_test_iothreads('iothread0', 'iothread0')
 
     def test_iothreads_switch_backing(self):
-        self.run_test_iothreads('iothread0', None)
+        self.run_test_iothreads('iothread0', '')
 
     def test_iothreads_switch_overlay(self):
-        self.run_test_iothreads(None, 'iothread0')
+        self.run_test_iothreads('', 'iothread0')
 
 if __name__ == '__main__':
     iotests.activate_logging()
-- 
2.31.1


