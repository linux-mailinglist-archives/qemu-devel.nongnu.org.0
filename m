Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03D6E1CAB9D
	for <lists+qemu-devel@lfdr.de>; Fri,  8 May 2020 14:45:33 +0200 (CEST)
Received: from localhost ([::1]:38098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jX2Nf-0005G5-VJ
	for lists+qemu-devel@lfdr.de; Fri, 08 May 2020 08:45:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1jX2K8-0008KQ-QE
 for qemu-devel@nongnu.org; Fri, 08 May 2020 08:41:52 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:51816
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1jX2K7-0007nu-GV
 for qemu-devel@nongnu.org; Fri, 08 May 2020 08:41:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588941710;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PucWFx0qX5O5/bvBOe/L6iV7fWG+49LMEtcEeBzK55k=;
 b=FbBEfgWC9BWxrMQLgYqKYwhK2wk0cmnWCEIUfbsztgpvLJOLhMHL+8AD5bkFrBh9ByzyfD
 zh0caKQf+/ZQmZWlfYMJ0mQXBAMlw/ajvVCwEObRvMEjtdUsrMMi7+uok8qKmXvHfhPnpe
 4tWITQ0U/aLMj2VTCd1f6MG+gjbGJnY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-234-TaoU_zyvMLWWEoqs07oyIQ-1; Fri, 08 May 2020 08:41:48 -0400
X-MC-Unique: TaoU_zyvMLWWEoqs07oyIQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9FF018018A7;
 Fri,  8 May 2020 12:41:47 +0000 (UTC)
Received: from linux.fritz.box.com (ovpn-113-190.ams2.redhat.com
 [10.36.113.190])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A27F963F9D;
 Fri,  8 May 2020 12:41:46 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 04/30] iotests/041: drop self.assert_no_active_block_jobs()
Date: Fri,  8 May 2020 14:41:09 +0200
Message-Id: <20200508124135.252565-5-kwolf@redhat.com>
In-Reply-To: <20200508124135.252565-1-kwolf@redhat.com>
References: <20200508124135.252565-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=205.139.110.120; envelope-from=kwolf@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/08 02:25:09
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Drop check for no block-jobs: it's obvious that there no jobs
immediately after vm.launch().

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20200430124713.3067-5-vsementsov@virtuozzo.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 tests/qemu-iotests/041 | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/tests/qemu-iotests/041 b/tests/qemu-iotests/041
index 46bf1f6c81..1812dd8479 100755
--- a/tests/qemu-iotests/041
+++ b/tests/qemu-iotests/041
@@ -904,8 +904,6 @@ class TestRepairQuorum(iotests.QMPTestCase):
                 pass
=20
     def test_complete(self):
-        self.assert_no_active_block_jobs()
-
         result =3D self.vm.qmp('drive-mirror', job_id=3D'job0', device=3D'=
quorum0',
                              sync=3D'full', node_name=3D"repair0", replace=
s=3D"img1",
                              target=3Dquorum_repair_img, format=3Diotests.=
imgfmt)
@@ -919,8 +917,6 @@ class TestRepairQuorum(iotests.QMPTestCase):
                         'target image does not match source after mirrorin=
g')
=20
     def test_cancel(self):
-        self.assert_no_active_block_jobs()
-
         result =3D self.vm.qmp('drive-mirror', job_id=3D'job0', device=3D'=
quorum0',
                              sync=3D'full', node_name=3D"repair0", replace=
s=3D"img1",
                              target=3Dquorum_repair_img, format=3Diotests.=
imgfmt)
@@ -932,8 +928,6 @@ class TestRepairQuorum(iotests.QMPTestCase):
         self.assert_has_block_node(None, quorum_img3)
=20
     def test_cancel_after_ready(self):
-        self.assert_no_active_block_jobs()
-
         result =3D self.vm.qmp('drive-mirror', job_id=3D'job0', device=3D'=
quorum0',
                              sync=3D'full', node_name=3D"repair0", replace=
s=3D"img1",
                              target=3Dquorum_repair_img, format=3Diotests.=
imgfmt)
@@ -948,8 +942,6 @@ class TestRepairQuorum(iotests.QMPTestCase):
                         'target image does not match source after mirrorin=
g')
=20
     def test_pause(self):
-        self.assert_no_active_block_jobs()
-
         result =3D self.vm.qmp('drive-mirror', job_id=3D'job0', device=3D'=
quorum0',
                              sync=3D'full', node_name=3D"repair0", replace=
s=3D"img1",
                              target=3Dquorum_repair_img, format=3Diotests.=
imgfmt)
--=20
2.25.3


